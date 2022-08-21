--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP2040_SVD.SPI;
with RP2040_SVD.I2C;
with RP2040_SVD.UART;
with RP2040_SVD.ADC;
with RP2040_SVD;
with RP.SPI;
with RP.I2C_Master;
with RP.I2C;
with RP.UART;
with RP.PIO;
with RP.RTC;
with RP.Interpolator;
with RP.USB_Device;
with RP.Timer.Delays;
with System;

package RP.Device is
   SPI_0 : aliased RP.SPI.SPI_Port (0, RP2040_SVD.SPI.SPI0_Periph'Access);
   SPI_1 : aliased RP.SPI.SPI_Port (1, RP2040_SVD.SPI.SPI1_Periph'Access);

   --  RP.I2C implements the low level interface and is recommended if you need
   --  precise control over timing or repeated start conditions.
   I2C_0 : aliased RP.I2C.I2C_Port (0, RP2040_SVD.I2C.I2C0_Periph'Access);
   I2C_1 : aliased RP.I2C.I2C_Port (1, RP2040_SVD.I2C.I2C1_Periph'Access);

   --  RP.I2C_Master implements the HAL.I2C interface and is recommended if
   --  your application needs to be portable to other microcontrollers.
   I2CM_0 : aliased RP.I2C_Master.I2C_Master_Port (0, RP2040_SVD.I2C.I2C0_Periph'Access);
   I2CM_1 : aliased RP.I2C_Master.I2C_Master_Port (1, RP2040_SVD.I2C.I2C1_Periph'Access);

   UART_0 : aliased RP.UART.UART_Port (0, RP2040_SVD.UART.UART0_Periph'Access);
   UART_1 : aliased RP.UART.UART_Port (1, RP2040_SVD.UART.UART1_Periph'Access);

   PIO0_Periph : aliased RP.PIO.PIO_Peripheral
      with Import, Address => RP2040_SVD.PIO0_Base;
   PIO1_Periph : aliased RP.PIO.PIO_Peripheral
      with Import, Address => RP2040_SVD.PIO1_Base;
   PIO_0 : aliased RP.PIO.PIO_Device (0, PIO0_Periph'Access);
   PIO_1 : aliased RP.PIO.PIO_Device (1, PIO1_Periph'Access);

   INTERP0_Base : constant System.Address := System'To_Address (16#D000_0080#);
   INTERP1_Base : constant System.Address := System'To_Address (16#D000_00C0#);
   INTERP_0 : aliased RP.Interpolator.INTERP_Peripheral
      with Import, Address => INTERP0_Base;
   INTERP_1 : aliased RP.Interpolator.INTERP_Peripheral
      with Import, Address => INTERP1_Base;

   Timer   : aliased RP.Timer.Delays.Delays;
   RTC     : aliased RP.RTC.RTC_Device;
   UDC     : aliased RP.USB_Device.USB_Device_Controller;

   ADC     : aliased RP2040_SVD.ADC.ADC_Peripheral
      with Import, Address => RP2040_SVD.ADC_Base;
end RP.Device;
