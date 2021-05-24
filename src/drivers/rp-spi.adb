--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP2040_SVD.RESETS;
with RP2040_SVD.SPI; use RP2040_SVD.SPI;
with HAL; use HAL;

package body RP.SPI is
   procedure Configure
      (This   : in out SPI_Port;
       Config : SPI_Configuration)
   is
      use RP2040_SVD.RESETS;
   begin
      RP.Clock.Enable (RP.Clock.PERI);

      if RESETS_Periph.RESET.spi.Arr (This.Num) then
         RESETS_Periph.RESET.spi.Arr (This.Num) := False;
         while not RESETS_Periph.RESET_DONE.spi.Arr (This.Num) loop
            null;
         end loop;
      end if;

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
   begin
      for D of Data loop
         while not This.Periph.SSPSR.TNF loop
            null;
         end loop;
         This.Periph.SSPDR.DATA := SSPDR_DATA_Field (D);
      end loop;

      while not This.Periph.SSPSR.TFE loop
         null;
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
   begin
      for D of Data loop
         while not This.Periph.SSPSR.TNF loop
            null;
         end loop;
         This.Periph.SSPDR.DATA := D;
      end loop;

      while not This.Periph.SSPSR.TFE loop
         null;
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
   begin
      for I in Data'Range loop
         while not This.Periph.SSPSR.RNE loop
            null;
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
   begin
      for I in Data'Range loop
         while not This.Periph.SSPSR.RNE loop
            null;
         end loop;
         Data (I) := UInt16 (This.Periph.SSPDR.DATA);
      end loop;
      Status := Ok;
   end Receive;

end RP.SPI;
