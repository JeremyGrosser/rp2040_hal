--
--  Copyright 2021-2026 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with Ada.Real_Time;
with RP.Reset;

package body RP.SPI is

   procedure Configure
      (This   : in out SPI_Port;
       Config : SPI_Configuration := Default_SPI_Configuration)
   is
      use RP.Reset;
      R : constant Reset_Id := Reset_Id'Val (Reset_Id'Pos (Reset_SPI0) + Natural (This.Num));
   begin
      RP.Clock.Enable_PERI;
      Reset_Peripheral (R);

      This.Periph.CR0 :=
         (SCR => 0,
          SPH => Config.Phase = Falling_Edge,
          SPO => Config.Polarity = Active_High,
          FRF => 0,
          DSS => (if Config.Data_Size = Data_Size_8b then 2#0111# else 2#1111#));
      This.Periph.CR1 :=
         (SOD => False,
          MS  => Config.Role = Slave,
          SSE => False,
          LBM => Config.Loopback);
      This.Periph.DMACR := 2#11#;
      Set_Speed (This, Config.Baud);
      This.Blocking := Config.Blocking;
      This.Periph.CR1.SSE := True;
   end Configure;

   procedure Set_Speed
      (This : SPI_Port;
       Baud : Hertz)
   is
      Baud64   : constant UInt64 := UInt64 (Baud);
      Freq_In  : constant UInt64 := UInt64 (RP.Clock.Frequency (RP.Clock.PERI));
      Prescale : UInt64 := 2;
      Postdiv  : UInt64 := 256;
   begin
      while Prescale <= 254 loop
         exit when Freq_In < (Prescale + 2) * 256 * Baud64;
         Prescale := Prescale + 2;
      end loop;

      if Prescale > 254 then
         raise Clock_Speed_Error with "PERI frequency too low for requested SPI baud";
      end if;

      while Postdiv > 1 loop
         exit when Freq_In / (Prescale * (Postdiv - 1)) > Baud64;
         Postdiv := Postdiv - 1;
      end loop;

      This.Periph.CPSR := UInt32 (Prescale);
      This.Periph.CR0.SCR := UInt8 (Postdiv - 1);
   end Set_Speed;

   overriding
   function Data_Size
      (This : SPI_Port)
      return SPI_Data_Size
   is (if This.Periph.CR0.DSS = 2#1111# then Data_Size_16b else Data_Size_8b);

   function Transmit_Status
      (This : SPI_Port)
      return SPI_FIFO_Status
   is
      --  TFE   TNF   Returns     Notes
      --   0     0    Full
      --   0     1    Not_Full    some data in FIFO
      --   1     0    Invalid     cannot be both Empty and Full
      --   1     1    Empty
      Flags : constant SR_Register := This.Periph.SR;
   begin
      if Flags.TFE = False and Flags.TNF = False then
         return Full;
      elsif Flags.TFE = False and Flags.TNF = True then
         return Not_Full;
      elsif Flags.BSY then
         return Busy;
      elsif Flags.TFE = True and Flags.TNF = True then
         return Empty;
      else
         return Invalid;
      end if;
   end Transmit_Status;

   function Receive_Status
      (This : SPI_Port)
      return SPI_FIFO_Status
   is
      --  RFF  RNE   Returns     Notes
      --   0    0    Empty
      --   0    1    Not_Full
      --   1    0    Invalid     cannot be both Empty and Full
      --   1    1    Full
      Flags : constant SR_Register := This.Periph.SR;
   begin
      if Flags.RFF = False and Flags.RNE = False then
         return Empty;
      elsif Flags.BSY then
         return Busy;
      elsif Flags.RFF = False and Flags.RNE = True then
         return Not_Full;
      elsif Flags.RFF = True and Flags.RNE = True then
         return Full;
      else
         return Invalid;
      end if;
   end Receive_Status;

   function FIFO_Address
      (This : SPI_Port)
      return System.Address
   is (This.Periph.DR'Address);

   procedure Transfer
      (This : SPI_Port;
       Data : in out UInt8)
   is
   begin
      loop
         exit when This.Periph.SR.TFE;
      end loop;
      This.Periph.DR := UInt32 (Data);
      loop
         exit when This.Periph.SR.RNE;
      end loop;
      Data := UInt8 (This.Periph.DR);
   end Transfer;

   overriding
   procedure Transmit
      (This    : in out SPI_Port;
       Data    : SPI_Data_8b;
       Status  : out SPI_Status;
       Timeout : Natural := 1000)
   is
      use Ada.Real_Time;
      FIFO : SPI_FIFO_Status;
      Deadline : Time;
   begin
      if Timeout > 0 then
         Deadline := Ada.Real_Time.Clock + Milliseconds (Timeout);
      end if;

      for D of Data loop
         loop
            FIFO := Transmit_Status (This);
            exit when FIFO = Empty or else FIFO = Not_Full;

            if FIFO = Invalid then
               Status := Err_Error;
               return;
            end if;

            if Timeout > 0 and then Ada.Real_Time.Clock >= Deadline then
               Status := Err_Timeout;
               return;
            end if;
         end loop;

         This.Periph.DR := UInt32 (D);
      end loop;

      if This.Blocking then
         loop
            exit when Transmit_Status (This) = Empty;
            if Timeout > 0 and then Ada.Real_Time.Clock >= Deadline then
               Status := Err_Timeout;
               return;
            end if;
         end loop;
      end if;

      Status := Ok;
   end Transmit;

   overriding
   procedure Transmit
      (This    : in out SPI_Port;
       Data    : SPI_Data_16b;
       Status  : out SPI_Status;
       Timeout : Natural := 1000)
   is
      use Ada.Real_Time;
      Deadline : Time;
      FIFO : SPI_FIFO_Status;
   begin
      if Timeout > 0 then
         Deadline := Ada.Real_Time.Clock + Milliseconds (Timeout);
      end if;

      for D of Data loop
         loop
            FIFO := Transmit_Status (This);
            exit when FIFO = Empty or else FIFO = Not_Full;

            if FIFO = Invalid then
               Status := Err_Error;
               return;
            end if;

            if Timeout > 0 and then Ada.Real_Time.Clock >= Deadline then
               Status := Err_Timeout;
               return;
            end if;
         end loop;

         This.Periph.DR := UInt32 (D);
      end loop;

      if This.Blocking then
         loop
            exit when Transmit_Status (This) = Empty;
            if Timeout > 0 and then Ada.Real_Time.Clock >= Deadline then
               Status := Err_Timeout;
               return;
            end if;
         end loop;
      end if;

      Status := Ok;
   end Transmit;

   overriding
   procedure Receive
      (This    : in out SPI_Port;
       Data    : out SPI_Data_8b;
       Status  : out SPI_Status;
       Timeout : Natural := 1000)
   is
      use Ada.Real_Time;
      Deadline : Time;
      FIFO : SPI_FIFO_Status;
   begin
      if Timeout > 0 then
         Deadline := Ada.Real_Time.Clock + Milliseconds (Timeout);
      end if;

      for I in Data'Range loop
         loop
            FIFO := Receive_Status (This);
            exit when FIFO = Not_Full or else FIFO = Full;

            if FIFO = Invalid then
               Status := Err_Error;
               return;
            end if;

            if Timeout > 0 and then Ada.Real_Time.Clock >= Deadline then
               Status := Err_Timeout;
               return;
            end if;
         end loop;
         Data (I) := UInt8 (This.Periph.DR);
      end loop;
      Status := Ok;
   end Receive;

   overriding
   procedure Receive
      (This    : in out SPI_Port;
       Data    : out SPI_Data_16b;
       Status  : out SPI_Status;
       Timeout : Natural := 1000)
   is
      use Ada.Real_Time;
      Deadline : Time;
      FIFO : SPI_FIFO_Status;
   begin
      if Timeout > 0 then
         Deadline := Ada.Real_Time.Clock + Milliseconds (Timeout);
      end if;

      for I in Data'Range loop
         loop
            FIFO := Receive_Status (This);
            exit when FIFO = Not_Full or else FIFO = Full;

            if FIFO = Invalid then
               Status := Err_Error;
               return;
            end if;

            if Timeout > 0 and then Ada.Real_Time.Clock >= Deadline then
               Status := Err_Timeout;
               return;
            end if;
         end loop;
         Data (I) := UInt16 (This.Periph.DR);
      end loop;
      Status := Ok;
   end Receive;

   procedure Enable_IRQ
      (This : SPI_Port;
       IRQ  : SPI_IRQ_Flag)
   is
   begin
      This.Periph.IMSC.Flag (IRQ) := True;
   end Enable_IRQ;

   procedure Disable_IRQ
      (This : SPI_Port;
       IRQ  : SPI_IRQ_Flag)
   is
   begin
      This.Periph.IMSC.Flag (IRQ) := False;
   end Disable_IRQ;

   procedure Clear_IRQ
      (This : SPI_Port;
       IRQ  : SPI_IRQ_Flag)
   is
   begin
      This.Periph.ICR.Flag (IRQ) := True;
   end Clear_IRQ;

   function Masked_IRQ_Status
      (This : SPI_Port;
       IRQ  : SPI_IRQ_Flag)
       return Boolean
   is (This.Periph.MIS.Flag (IRQ));

   function Raw_IRQ_Status
      (This : SPI_Port;
       IRQ  : SPI_IRQ_Flag)
       return Boolean
   is (This.Periph.RIS.Flag (IRQ));

end RP.SPI;
