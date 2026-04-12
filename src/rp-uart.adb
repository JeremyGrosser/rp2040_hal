--
--  Copyright 2021-2026 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with Ada.Real_Time; use Ada.Real_Time;
with RP.Reset;
with RP.Clock;

package body RP.UART is

   UART_Fraction : constant := 1.0 / 2 ** 6;
   type UART_Divider is delta UART_Fraction
      range UART_Fraction .. (2.0 ** 16) - UART_Fraction;

   function Div_Integer
      (D : UART_Divider)
      return UInt32
   is
      I : constant Natural := Natural (D);
   begin
      if UART_Divider (I) > D then
         return UInt32 (I - 1);
      else
         return UInt32 (I);
      end if;
   end Div_Integer;

   function Div_Fraction
      (D : UART_Divider)
      return UInt32
   is
      Multiple : constant UART_Divider := UART_Divider (2 ** 6);
      Int      : constant UART_Divider := UART_Divider (Div_Integer (D));
   begin
      return UInt32 ((D - Int) * Multiple);
   end Div_Fraction;

   procedure Configure
      (This   : in out UART_Port;
       Config : UART_Configuration := Default_UART_Configuration)
   is
      use RP.Reset;
      R : constant Reset_Id := Reset_Id'Val (Reset_Id'Pos (Reset_UART0) + Natural (This.Num));
      Bus_Clock    : constant Hertz := RP.Clock.Frequency (RP.Clock.PERI);
      Sample_Clock : constant Hertz := Config.Baud * 16;
      Div : constant UART_Divider := UART_Divider
         (Float (Bus_Clock) / Float (Sample_Clock));
   begin
      RP.Clock.Enable_PERI;
      Reset_Peripheral (R);

      This.Periph.DMACR := 2#11#;
      This.Periph.IBRD := Div_Integer (Div);
      This.Periph.FBRD := Div_Fraction (Div);
      This.Periph.LCR_H :=
         (SPS    => False,
          WLEN   => UInt2 (Config.Word_Size - UART_Word_Size'First),
          FEN    => Config.Enable_FIFOs,
          STP2   => Config.Stop_Bits = 2,
          EPS    => Config.Parity_Type = Even,
          PEN    => Config.Parity,
          BRK    => False);
      This.Periph.CR :=
         (CTSEN   => False,
          RTSEN   => False,
          OUT2    => False,
          OUT1    => False,
          RTS     => False,
          DTR     => False,
          TXE     => True,
          RXE     => True,
          LBE     => Config.Loopback,
          SIRLP   => False,
          SIREN   => False,
          UARTEN  => True);
      This.Config := Config;
   end Configure;

   procedure Set_Stick_Parity
      (This    : in out UART_Port;
       Enabled : Boolean)
   is
   begin
      This.Periph.LCR_H.SPS := Enabled;
   end Set_Stick_Parity;

   function Symbol_Time
      (This : UART_Port)
      return Microseconds
   is ((1_000_000 / Integer (This.Config.Baud)) + 1);

   function Frame_Time
      (This : UART_Port)
      return Integer
   is
      Start_Bits  : constant Integer := 1;
      Data_Bits   : constant Integer := Integer (This.Config.Word_Size) * This.Config.Frame_Length;
      Parity_Bits : constant Integer := (if This.Config.Parity then 1 else 0);
      Stop_Bits   : constant Integer := Integer (This.Config.Stop_Bits);
      Frame_Bits  : constant Integer := Start_Bits + Data_Bits + Parity_Bits + Stop_Bits;
   begin
      return Frame_Bits * This.Symbol_Time;
   end Frame_Time;

   procedure Send_Break
      (This   : in out UART_Port;
       Length : Microseconds;
       Start  : Boolean := True)
   is
   begin
      --  Wait for any in progress transmission to complete before setting up a break
      while This.Transmit_Status /= Empty loop
         null;
      end loop;

      if Start then
         delay 1.0e-6 * This.Symbol_Time;
      end if;
      This.Periph.LCR_H.BRK := True;
      delay Duration (Length) / 1.0e6;
      This.Periph.LCR_H.BRK := False;
   end Send_Break;

   function Transmit_Status
      (This : UART_Port)
      return UART_FIFO_Status
   is
      --  TXFE TXFF
      --  0    0     Not_Full
      --  0    1     Full
      --  1    0     Empty
      --  1    1     Invalid
      Flags : constant FR_Register := This.Periph.FR;
   begin
      if Flags.TXFE = False and Flags.TXFF = False then
         return Not_Full;
      elsif Flags.TXFE = False and Flags.TXFF = True then
         return Full;
      elsif Flags.BUSY then
         return Busy;
      elsif Flags.TXFE = True and Flags.TXFF = False then
         return Empty;
      else
         return Invalid;
      end if;
   end Transmit_Status;

   function Receive_Status
      (This : UART_Port)
      return UART_FIFO_Status
   is
      --  RXFE RXFF
      --  0    0     Not_Full
      --  0    1     Full
      --  1    0     Empty
      --  1    1     Invalid
      Flags : constant FR_Register := This.Periph.FR;
   begin
      if Flags.RXFE = False and Flags.RXFF = False then
         return Not_Full;
      elsif Flags.RXFE = False and Flags.RXFF = True then
         return Full;
      elsif Flags.RXFE = True and Flags.RXFF = False then
         return Empty;
      else
         return Invalid;
      end if;
   end Receive_Status;

   function FIFO_Address
      (This : UART_Port)
      return System.Address
   is (This.Periph.DR'Address);

   overriding
   function Data_Size
      (Port : UART_Port)
      return UART_Data_Size
   is (Data_Size_8b);

   overriding
   procedure Transmit
     (This    : in out UART_Port;
      Data    : UART_Data_8b;
      Status  : out UART_Status;
      Timeout : Natural := 1000)
   is
      Deadline : Time;
      FIFO     : UART_FIFO_Status;
   begin
      if Timeout > 0 then
         Deadline := Ada.Real_Time.Clock + Milliseconds (Timeout);
      end if;

      for D of Data loop
         loop
            FIFO := Transmit_Status (This);
            exit when FIFO = Empty or FIFO = Not_Full or FIFO = Busy;
            if FIFO = Invalid then
               Status := Err_Error;
               return;
            end if;
            if Timeout > 0 and then Ada.Real_Time.Clock >= Deadline then
               Status := Err_Timeout;
               return;
            end if;
         end loop;

         This.Periph.DR :=
            (BE   => False,
             PE   => False,
             FE   => False,
             DATA => D);
      end loop;
      Status := Ok;
   end Transmit;

   overriding
   procedure Receive
     (This    : in out UART_Port;
      Data    : out UART_Data_8b;
      Status  : out UART_Status;
      Timeout : Natural := 1000)
   is
      Deadline : Time;
      FIFO     : UART_FIFO_Status;
      DR       : DR_Register;
   begin
      if Timeout > 0 then
         Deadline := Ada.Real_Time.Clock + Milliseconds (Timeout);
      end if;

      for I in Data'Range loop
         if This.Config.Enable_FIFOs then
            loop
               FIFO := Receive_Status (This);
               exit when FIFO = Not_Full or FIFO = Full;
               if FIFO = Invalid then
                  Status := Err_Error;
                  return;
               end if;

               if Timeout > 0 and then Ada.Real_Time.Clock >= Deadline then
                  Status := Err_Timeout;
                  return;
               end if;
            end loop;
         end if;

         --  Read the whole UARTDR at once so that we get the flags
         --  synchronized with the DATA read.
         DR := This.Periph.DR;
         Data (I) := DR.DATA;
         if DR.BE then
            Status := Busy;
            return;
         elsif DR.FE or DR.PE then
            Status := Err_Error;
            return;
         end if;
      end loop;
      Status := Ok;
   end Receive;

   overriding
   procedure Transmit
     (This    : in out UART_Port;
      Data    : UART_Data_9b;
      Status  : out UART_Status;
      Timeout : Natural := 1000)
   is
      pragma Unreferenced (Data);
   begin
      --  9-bit data is not supported by this hardware
      Status := Err_Error;
   end Transmit;

   overriding
   procedure Receive
     (This    : in out UART_Port;
      Data    : out UART_Data_9b;
      Status  : out UART_Status;
      Timeout : Natural := 1000)
   is
      pragma Unreferenced (Data);
   begin
      --  9-bit data is not supported by this hardware
      Status := Err_Error;
   end Receive;

   procedure Set_FIFO_IRQ_Level
      (This : UART_Port;
       RX   : FIFO_IRQ_Level;
       TX   : FIFO_IRQ_Level)
   is
   begin
      This.Periph.IFLS :=
         (TXIFLSEL => TX,
          RXIFLSEL => RX);
   end Set_FIFO_IRQ_Level;

   procedure Enable_IRQ
      (This : UART_Port;
       IRQ  : UART_IRQ_Flag)
   is
   begin
      This.Periph.IMSC.Flags (IRQ) := True;
   end Enable_IRQ;

   procedure Disable_IRQ
      (This : UART_Port;
       IRQ  : UART_IRQ_Flag)
   is
   begin
      This.Periph.IMSC.Flags (IRQ) := False;
   end Disable_IRQ;

   procedure Clear_IRQ
      (This : UART_Port;
       IRQ  : UART_IRQ_Flag)
   is
   begin
      This.Periph.ICR.Flags (IRQ) := True;
   end Clear_IRQ;

   function Masked_IRQ_Status
      (This : UART_Port;
       IRQ  : UART_IRQ_Flag)
       return Boolean
   is (This.Periph.MIS.Flags (IRQ));

   function Raw_IRQ_Status
      (This : UART_Port;
       IRQ  : UART_IRQ_Flag)
       return Boolean
   is (This.Periph.RIS.Flags (IRQ));

end RP.UART;
