--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP2040_SVD.SPI; use RP2040_SVD.SPI;
with RP.Timer;
with RP.Reset;
with HAL; use HAL;

package body RP.SPI is
   procedure Configure
      (This   : in out SPI_Port;
       Config : SPI_Configuration)
   is
      use RP.Reset;
   begin
      RP.Clock.Enable (RP.Clock.PERI);
      case This.Num is
         when 0 => Reset_Peripheral (Reset_SPI0);
         when 1 => Reset_Peripheral (Reset_SPI1);
      end case;

      --  clk_peri   := clk_sys
      --  fSSPCLK    := clk_peri
      --  fSSPCLKOUT := fSSPCLK / (CPSDVSR * (1 + SCR);

      This.Periph.SSPCR0 :=
         (FRF    => 0,       --  Motorola format
          SCR    => 0,       --  No divider before Set_Speed is called
          SPO    => Config.Polarity = Active_High,
          SPH    => Config.Phase = Falling_Edge,
          others => <>);

      case Config.Data_Size is
         when Data_Size_8b =>
            This.Periph.SSPCR0.DSS := 2#0111#;
         when Data_Size_16b =>
            This.Periph.SSPCR0.DSS := 2#1111#;
      end case;

      This.Periph.SSPCR1 :=
         (MS     => Config.Role = Slave,
          SSE    => False,
          others => <>);

      --  Enable DMA request. Harmless if DMA is not used.
      This.Periph.SSPDMACR :=
         (RXDMAE => True,
          TXDMAE => True,
          others => <>);

      This.Set_Speed (Config.Baud);

      This.Periph.SSPCR1.SSE := True;
   end Configure;

   procedure Set_Speed
      (This : in out SPI_Port;
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

      This.Periph.SSPCPSR.CPSDVSR := SSPCPSR_CPSDVSR_Field (Prescale);
      This.Periph.SSPCR0.SCR := SSPCR0_SCR_Field (Postdiv - 1);
   end Set_Speed;

   function Transmit_Status
      (This : SPI_Port)
      return SPI_FIFO_Status
   is
      --  This is a bit dumb, but we want to avoid redefining the whole
      --  SPI_Peripheral record just to change the status registers.
      --
      --  TFE   TNF   Returns     Notes
      --   0     0    Full
      --   0     1    Not_Full    some data in FIFO
      --   1     0    Invalid     cannot be both Empty and Full
      --   1     1    Empty
      Flags : constant SSPSR_Register := This.Periph.SSPSR;
   begin
      if Flags.TFE = False and Flags.TNF = False then
         return Full;
      elsif Flags.TFE = False and Flags.TNF = True then
         return Not_Full;
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
      Flags : constant SSPSR_Register := This.Periph.SSPSR;
   begin
      if Flags.RFF = False and Flags.RNE = False then
         return Empty;
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
   is (This.Periph.SSPDR'Address);

   overriding
   function Data_Size
      (This : SPI_Port)
      return SPI_Data_Size
   is
   begin
      if This.Periph.SSPCR0.DSS = 2#1111# then
         return Data_Size_16b;
      else
         return Data_Size_8b;
      end if;
   end Data_Size;

   overriding
   procedure Transmit
      (This    : in out SPI_Port;
       Data    : SPI_Data_8b;
       Status  : out SPI_Status;
       Timeout : Natural := 1000)
   is
      use type RP.Timer.Time;
      Deadline : RP.Timer.Time;
      FIFO     : SPI_FIFO_Status;
   begin
      if Timeout > 0 then
         Deadline := RP.Timer.Clock + RP.Timer.Milliseconds (Timeout);
      end if;

      for D of Data loop
         loop
            FIFO := Transmit_Status (This);
            exit when FIFO = Empty or FIFO = Not_Full;

            if FIFO = Invalid then
               Status := Err_Error;
               return;
            end if;

            if Timeout > 0 and then RP.Timer.Clock >= Deadline then
               Status := Err_Timeout;
               return;
            end if;
         end loop;
         This.Periph.SSPDR.DATA := SSPDR_DATA_Field (D);
      end loop;
      Status := Ok;
   end Transmit;

   overriding
   procedure Transmit
      (This    : in out SPI_Port;
       Data    : SPI_Data_16b;
       Status  : out SPI_Status;
       Timeout : Natural := 1000)
   is
      use type RP.Timer.Time;
      Deadline : RP.Timer.Time;
      FIFO     : SPI_FIFO_Status;
   begin
      if Timeout > 0 then
         Deadline := RP.Timer.Clock + RP.Timer.Milliseconds (Timeout);
      end if;

      for D of Data loop
         loop
            FIFO := Transmit_Status (This);
            exit when FIFO = Empty or FIFO = Not_Full;

            if FIFO = Invalid then
               Status := Err_Error;
               return;
            end if;

            if Timeout > 0 and then RP.Timer.Clock >= Deadline then
               Status := Err_Timeout;
               return;
            end if;
         end loop;
         This.Periph.SSPDR.DATA := D;
      end loop;
      Status := Ok;
   end Transmit;

   overriding
   procedure Receive
      (This    : in out SPI_Port;
       Data    : out SPI_Data_8b;
       Status  : out SPI_Status;
       Timeout : Natural := 1000)
   is
      use type RP.Timer.Time;
      Deadline : RP.Timer.Time;
      FIFO     : SPI_FIFO_Status;
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
         Data (I) := UInt8 (This.Periph.SSPDR.DATA);
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
      use type RP.Timer.Time;
      Deadline : RP.Timer.Time;
      FIFO     : SPI_FIFO_Status;
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
         Data (I) := UInt16 (This.Periph.SSPDR.DATA);
      end loop;
      Status := Ok;
   end Receive;

end RP.SPI;
