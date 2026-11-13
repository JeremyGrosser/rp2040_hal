--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP.SPI;
with RP.I2C_Master;
with RP.UART;
with RP.Interpolator;
with RP.USB_Device;
with System;

package RP.Device is
   SPI0_Periph : aliased RP.SPI.SPI_Peripheral
      with Import, Address => System'To_Address (16#4008_0000#);
   SPI1_Periph : aliased RP.SPI.SPI_Peripheral
      with Import, Address => System'To_Address (16#4008_8000#);
   SPI_0 : aliased RP.SPI.SPI_Port (0, SPI0_Periph'Access);
   SPI_1 : aliased RP.SPI.SPI_Port (1, SPI1_Periph'Access);

   I2CM0_Periph : aliased RP.I2C_Master.I2C_Peripheral
      with Import, Address => System'To_Address (16#4009_0000#);
   I2CM1_Periph : aliased RP.I2C_Master.I2C_Peripheral
      with Import, Address => System'To_Address (16#4009_8000#);
   I2CM_0 : aliased RP.I2C_Master.I2C_Master_Port (0, I2CM0_Periph'Access);
   I2CM_1 : aliased RP.I2C_Master.I2C_Master_Port (1, I2CM1_Periph'Access);

   UART0_Periph : aliased RP.UART.UART_Peripheral
      with Import, Address => System'To_Address (16#4007_0000#);
   UART1_Periph : aliased RP.UART.UART_Peripheral
      with Import, Address => System'To_Address (16#4007_8000#);
   UART_0 : aliased RP.UART.UART_Port (0, UART0_Periph'Access);
   UART_1 : aliased RP.UART.UART_Port (1, UART1_Periph'Access);

   INTERP0_Base : constant System.Address := System'To_Address (16#D000_0080#);
   INTERP1_Base : constant System.Address := System'To_Address (16#D000_00C0#);
   INTERP_0 : aliased RP.Interpolator.INTERP_Peripheral
      with Import, Address => INTERP0_Base;
   INTERP_1 : aliased RP.Interpolator.INTERP_Peripheral
      with Import, Address => INTERP1_Base;

   UDC     : aliased RP.USB_Device.USB_Device_Controller;
end RP.Device;
