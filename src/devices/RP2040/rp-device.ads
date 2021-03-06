--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP2040_SVD.SPI;
with RP2040_SVD.I2C;
with RP2040_SVD.UART;
with RP2040_SVD;
with RP.SPI;         use RP.SPI;
with RP.I2C_Master;  use RP.I2C_Master;
with RP.UART;        use RP.UART;
with RP.PIO;         use RP.PIO;
with RP.Interpolator;
with RP.SysTick;
with RP.Timer;
with RP.RTC;
with System;

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
   PIO_0 : aliased PIO_Device (0, PIO0_Periph'Access);
   PIO_1 : aliased PIO_Device (1, PIO1_Periph'Access);

   INTERP0_Base : constant System.Address := System'To_Address (16#D000_0080#);
   INTERP1_Base : constant System.Address := System'To_Address (16#D000_00C0#);
   INTERP_0 : aliased RP.Interpolator.INTERP_Peripheral
      with Import, Address => INTERP0_Base;
   INTERP_1 : aliased RP.Interpolator.INTERP_Peripheral
      with Import, Address => INTERP1_Base;

   SysTick : aliased RP.SysTick.Delays;
   Timer   : aliased RP.Timer.Delays;

   RTC     : aliased RP.RTC.RTC_Device;
end RP.Device;
