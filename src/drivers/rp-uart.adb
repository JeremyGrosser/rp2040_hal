--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with HAL; use HAL;
with RP.Reset;
with RP.Timer;

package body RP.UART is

   procedure Configure
      (This   : in out UART_Port;
       Config : UART_Configuration := Default_UART_Configuration)
   is
      use RP.Reset;
      Word_Length : constant UInt2 := UInt2
         (Config.Word_Size - UART_Word_Size'First);
   begin
      case This.Num is
         when 0 => Reset_Peripheral (Reset_UART0);
         when 1 => Reset_Peripheral (Reset_UART1);
      end case;

      This.Periph.UARTDMACR :=
         (RXDMAE => True,
          TXDMAE => True,
          others => <>);

      declare
         Div : constant UART_Divider := UART_Divider
            (Float (RP.Clock.Frequency (RP.Clock.PERI)) / Float (Config.Baud * 16));
      begin
         This.Periph.UARTIBRD.BAUD_DIVINT := Div_Integer (Div);
         This.Periph.UARTFBRD.BAUD_DIVFRAC := Div_Fraction (Div);
      end;

      This.Periph.UARTLCR_H :=
         (WLEN   => Word_Length,
          PEN    => Config.Parity,
          EPS    => Config.Parity_Type = Even,
          STP2   => (Config.Stop_Bits = 2),
          SPS    => False, --  Stick parity is disabled by default
          FEN    => Config.Enable_FIFOs,
          BRK    => False, --  Don't send break initially
          others => <>);

      This.Periph.UARTCR :=
         (UARTEN => True,
          TXE    => True,
          RXE    => True,
          LBE    => Config.Loopback,
          others => <>);

      This.Config := Config;
   end Configure;

   procedure Set_Stick_Parity
      (This    : in out UART_Port;
       Enabled : Boolean)
   is
   begin
      This.Periph.UARTLCR_H.SPS := Enabled;
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
      (This     : in out UART_Port;
       Delays   : HAL.Time.Any_Delays;
       Duration : Microseconds;
       Start    : Boolean := True)
   is
   begin
      --  Wait for any in progress transmission to complete before setting up a break
      while This.Transmit_Status /= Empty loop
         null;
      end loop;

      if Start then
         Delays.Delay_Microseconds (This.Symbol_Time);
      end if;
      This.Periph.UARTLCR_H.BRK := True;
      Delays.Delay_Microseconds (Duration);
      This.Periph.UARTLCR_H.BRK := False;
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
      Flags : constant UARTFR_Register := This.Periph.UARTFR;
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
      Flags : constant UARTFR_Register := This.Periph.UARTFR;
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
   is (This.Periph.UARTDR'Address);

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
      use type RP.Timer.Time;
      Deadline : RP.Timer.Time;
      FIFO     : UART_FIFO_Status;
   begin
      if Timeout > 0 then
         Deadline := RP.Timer.Clock + RP.Timer.Milliseconds (Timeout);
      end if;

      for D of Data loop
         loop
            FIFO := Transmit_Status (This);
            exit when FIFO = Empty or FIFO = Not_Full or FIFO = Busy;
            if FIFO = Invalid then
               Status := Err_Error;
               return;
            end if;
            if Timeout > 0 and then RP.Timer.Clock >= Deadline then
               Status := Err_Timeout;
               return;
            end if;
         end loop;

         This.Periph.UARTDR.DATA := D;
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
      use type RP.Timer.Time;
      Deadline : RP.Timer.Time;
      FIFO     : UART_FIFO_Status;
      DR       : UARTDR_Register;
   begin
      if Timeout > 0 then
         Deadline := RP.Timer.Clock + RP.Timer.Milliseconds (Timeout);
      end if;

      for I in Data'Range loop
         loop
            FIFO := Receive_Status (This);
            exit when FIFO = Not_Full or FIFO = Full;
            if FIFO = Invalid then
               Status := Err_Error;
               return;
            end if;

            if Timeout > 0 and then RP.Timer.Clock >= Deadline then
               Status := Err_Timeout;
               return;
            end if;
         end loop;

         --  Read the whole UARTDR at once so that we get the flags
         --  synchronized with the DATA read.
         DR := This.Periph.UARTDR;
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

   function Div_Integer
      (D : UART_Divider)
      return UARTIBRD_BAUD_DIVINT_Field
   is
      I : constant Natural := Natural (D);
   begin
      if UART_Divider (I) > D then
         return UARTIBRD_BAUD_DIVINT_Field (I - 1);
      else
         return UARTIBRD_BAUD_DIVINT_Field (I);
      end if;
   end Div_Integer;

   function Div_Fraction
      (D : UART_Divider)
      return UARTFBRD_BAUD_DIVFRAC_Field
   is
      Multiple : constant UART_Divider := UART_Divider (2 ** UARTFBRD_BAUD_DIVFRAC_Field'Size);
      Int      : constant UART_Divider := UART_Divider (Div_Integer (D));
   begin
      return UARTFBRD_BAUD_DIVFRAC_Field ((D - Int) * Multiple);
   end Div_Fraction;

   function Div_Value
      (Int  : UARTIBRD_BAUD_DIVINT_Field;
       Frac : UARTFBRD_BAUD_DIVFRAC_Field)
       return UART_Divider
   is (UART_Divider (Int) + (UART_Divider (Frac) / UART_Divider (2 ** UARTFBRD_BAUD_DIVFRAC_Field'Size)));

   procedure Set_FIFO_IRQ_Level (This : in out UART_Port;
                                 RX   :        FIFO_IRQ_Level;
                                 TX   :        FIFO_IRQ_Level)
   is
   begin
      This.Periph.UARTIFLS := (TXIFLSEL => TX'Enum_Rep,
                               RXIFLSEL => RX'Enum_Rep,
                               others   => <>);
   end Set_FIFO_IRQ_Level;

   procedure Enable_IRQ (This : in out UART_Port;
                         IRQ  :        UART_IRQ_Flag)
   is
      Mask : HAL.UInt32
        with Address => This.Periph.UARTIMSC'Address,
        Volatile_Full_Access;
   begin
      Mask := Mask or IRQ'Enum_Rep;
   end Enable_IRQ;

   procedure Disable_IRQ (This : in out UART_Port;
                          IRQ  :        UART_IRQ_Flag)
   is
      Mask : HAL.UInt32
        with Address => This.Periph.UARTIMSC'Address,
        Volatile_Full_Access;
   begin
      Mask := Mask and (not IRQ'Enum_Rep);
   end Disable_IRQ;

   procedure Clear_IRQ (This : in out UART_Port;
                        IRQ  :        UART_IRQ_Flag)
   is
      Clear : HAL.UInt32
        with Address => This.Periph.UARTICR'Address,
        Volatile_Full_Access;
   begin
      Clear := IRQ'Enum_Rep;
   end Clear_IRQ;

   function Masked_IRQ_Status (This : UART_Port;
                               IRQ  : UART_IRQ_Flag)
                               return Boolean
   is
      Masked_Status : HAL.UInt32
        with Address => This.Periph.UARTMIS'Address,
        Volatile_Full_Access;
   begin
      return (Masked_Status and IRQ'Enum_Rep) /= 0;
   end Masked_IRQ_Status;

   function RAW_IRQ_Status (This : UART_Port;
                            IRQ  : UART_IRQ_Flag)
                            return Boolean
   is
      RAW_Status : HAL.UInt32
        with Address => This.Periph.UARTRIS'Address,
        Volatile_Full_Access;
   begin
      return (RAW_Status and IRQ'Enum_Rep) /= 0;
   end RAW_IRQ_Status;

end RP.UART;
