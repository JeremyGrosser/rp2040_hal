--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP2040_SVD.UART;
with RP2040_SVD.ADC;
with RP2040_SVD;
with RP.I2C_Master;
with RP.UART;
with RP.SPI;
with RP.RTC;
with RP.Interpolator;
with RP.USB_Device;
with System;

package RP.Device is
   SPI0_Periph : aliased RP.SPI.SPI_Peripheral
      with Import, Address => RP2040_SVD.SPI0_Base;
   SPI1_Periph : aliased RP.SPI.SPI_Peripheral
      with Import, Address => RP2040_SVD.SPI1_Base;
   SPI_0 : aliased RP.SPI.SPI_Port (0, SPI0_Periph'Access);
   SPI_1 : aliased RP.SPI.SPI_Port (1, SPI1_Periph'Access);

   I2CM0_Periph : aliased RP.I2C_Master.I2C_Peripheral
      with Import, Address => RP2040_SVD.I2C0_Base;
   I2CM1_Periph : aliased RP.I2C_Master.I2C_Peripheral
      with Import, Address => RP2040_SVD.I2C1_Base;
   I2CM_0 : aliased RP.I2C_Master.I2C_Master_Port (0, I2CM0_Periph'Access);
   I2CM_1 : aliased RP.I2C_Master.I2C_Master_Port (1, I2CM1_Periph'Access);

   UART_0 : aliased RP.UART.UART_Port (0, RP2040_SVD.UART.UART0_Periph'Access);
   UART_1 : aliased RP.UART.UART_Port (1, RP2040_SVD.UART.UART1_Periph'Access);

   INTERP0_Base : constant System.Address := System'To_Address (16#D000_0080#);
   INTERP1_Base : constant System.Address := System'To_Address (16#D000_00C0#);
   INTERP_0 : aliased RP.Interpolator.INTERP_Peripheral
      with Import, Address => INTERP0_Base;
   INTERP_1 : aliased RP.Interpolator.INTERP_Peripheral
      with Import, Address => INTERP1_Base;

   RTC     : aliased RP.RTC.RTC_Device;
   UDC     : aliased RP.USB_Device.USB_Device_Controller;

   ADC     : aliased RP2040_SVD.ADC.ADC_Peripheral
      with Import, Address => RP2040_SVD.ADC_Base;
end RP.Device;
