with RP2040_SVD.SPI;
with RP.Clock;   use RP.Clock;
with RP.SPI;     use RP.SPI;
with RP.SysTick;

package RP.Device is
   SPI_0 : aliased SPI_Port (0, RP2040_SVD.SPI.SPI0_Periph'Access);
   SPI_1 : aliased SPI_Port (1, RP2040_SVD.SPI.SPI1_Periph'Access);

   --  ROSC can vary from 1 .. 12 MHz. Assume that ROSC is running at the
   --  maximum ROSC frequency to avoid unintentional overclocking.
   --
   --  TODO: measure ROSC with the internal frequency counter and temperature
   --        sensor, then update this value before enabling PLLs
   --  2.15.2.1.1. Mitigating ROSC frequency variation due to process

   subtype ROSC_Hertz is Hertz range 1_000_000 .. 12_000_000;
   ROSC_Frequency : ROSC_Hertz := 12_000_000;

   SysTick : aliased RP.SysTick.Delays;
end RP.Device;
