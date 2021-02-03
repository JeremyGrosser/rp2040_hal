with RP2040_SVD.RESETS; use RP2040_SVD.RESETS;
with RP2040_SVD.SPI; use RP2040_SVD.SPI;
with HAL; use HAL;

package body RP.SPI is
   procedure Enable
      (This : in out SPI_Port)
   is
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
         (DSS    => 2#0111#, --  8 bits
          FRF    => 0,       --  Motorola format
          SCR    => 0,       --  No divider before Set_Speed is called
          SPO    => False,   --  CPOL
          SPH    => False,   --  CPHA
          others => <>);

      This.Periph.SSPCR1 :=
         (MS     => False,   --  Master
          SSE    => False,
          others => <>);

      Set_Speed (This, 1_000_000);

      --  Enable DMA request. Harmless if DMA is not used.
      This.Periph.SSPDMACR :=
         (RXDMAE => True,
          TXDMAE => True,
          others => <>);

      This.Periph.SSPCR1.SSE := True;
   end Enable;

   procedure Set_Speed
      (This : in out SPI_Port;
       Baud : Hertz)
   is
      Freq_In  : constant Hertz := RP.Clock.Frequency (RP.Clock.PERI);
      Prescale : Hertz := 2;
      Postdiv  : SSPCR0_SCR_Field := SSPCR0_SCR_Field'Last;
   begin
      loop
         exit when Freq_In < ((Prescale + 2) * 256 * Baud);
         Prescale := Prescale + 2;
         if Prescale > 254 then
            raise Clock_Speed_Error with "PERI frequency too low for requested SPI baud";
         end if;
      end loop;

      loop
         Postdiv := Postdiv - 1;
         exit when Postdiv = 1 or else
                   Freq_In / (Prescale * (Hertz (Postdiv) - 1)) > Baud;
      end loop;

      This.Periph.SSPCPSR.CPSDVSR := SSPCPSR_CPSDVSR_Field (Prescale);
      This.Periph.SSPCR0.SCR := Postdiv - 1;
   end Set_Speed;

   overriding
   function Data_Size
      (This : SPI_Port)
      return SPI_Data_Size
   is
   begin
      return Data_Size_8b;
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
      Status := Err_Error;
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
      pragma Unreferenced (Data);
   begin
      Status := Err_Error;
   end Receive;

end RP.SPI;
