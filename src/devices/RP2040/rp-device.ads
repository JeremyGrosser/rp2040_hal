--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP2040_SVD.SPI;
with RP2040_SVD.I2C;
with RP2040_SVD.UART;
with RP2040_SVD;
with RP.Clock;       use RP.Clock;
with RP.SPI;         use RP.SPI;
with RP.I2C_Master;  use RP.I2C_Master;
with RP.UART;        use RP.UART;
with RP.PIO;         use RP.PIO;
with RP.SysTick;

--  Runtime contains symbols that need to be linked for the startup code to
--  function
with Runtime;
pragma Unreferenced (Runtime);

package RP.Device is
   SPI_0 : aliased SPI_Port (0, RP2040_SVD.SPI.SPI0_Periph'Access);
   SPI_1 : aliased SPI_Port (1, RP2040_SVD.SPI.SPI1_Periph'Access);

   I2C_0 : aliased I2C_Master_Port (0, RP2040_SVD.I2C.I2C0_Periph'Access);
   I2C_1 : aliased I2C_Master_Port (1, RP2040_SVD.I2C.I2C1_Periph'Access);

   UART_0 : aliased UART_Port (0, RP2040_SVD.UART.UART0_Periph'Access);
   UART_1 : aliased UART_Port (1, RP2040_SVD.UART.UART1_Periph'Access);

   PIO0_Periph : aliased RP.PIO.PIO_Peripheral
      with Import, Address => RP2040_SVD.PIO0_Base;
   PIO1_Periph : aliased RP.PIO.PIO_Peripheral
      with Import, Address => RP2040_SVD.PIO1_Base;
   PIO_0 : aliased PIO_Port (0, PIO0_Periph'Access);
   PIO_1 : aliased PIO_Port (1, PIO1_Periph'Access);

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
