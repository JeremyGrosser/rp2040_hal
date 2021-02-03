pragma Style_Checks (Off);

--  Copyright (c) 2020 Raspberry Pi (Trading) Ltd.
--
--  SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2040.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package RP2040_SVD is
   pragma Preelaborate;

   --------------------
   -- Base addresses --
   --------------------

   XIP_CTRL_Base : constant System.Address := System'To_Address (16#14000000#);
   XIP_SSI_Base : constant System.Address := System'To_Address (16#18000000#);
   SYSINFO_Base : constant System.Address := System'To_Address (16#40000000#);
   SYSCFG_Base : constant System.Address := System'To_Address (16#40004000#);
   CLOCKS_Base : constant System.Address := System'To_Address (16#40008000#);
   RESETS_Base : constant System.Address := System'To_Address (16#4000C000#);
   PSM_Base : constant System.Address := System'To_Address (16#40010000#);
   IO_BANK0_Base : constant System.Address := System'To_Address (16#40014000#);
   IO_QSPI_Base : constant System.Address := System'To_Address (16#40018000#);
   PADS_BANK0_Base : constant System.Address := System'To_Address (16#4001C000#);
   PADS_QSPI_Base : constant System.Address := System'To_Address (16#40020000#);
   XOSC_Base : constant System.Address := System'To_Address (16#40024000#);
   PLL_SYS_Base : constant System.Address := System'To_Address (16#40028000#);
   PLL_USB_Base : constant System.Address := System'To_Address (16#4002C000#);
   BUSCTRL_Base : constant System.Address := System'To_Address (16#40030000#);
   UART0_Base : constant System.Address := System'To_Address (16#40034000#);
   UART1_Base : constant System.Address := System'To_Address (16#40038000#);
   SPI0_Base : constant System.Address := System'To_Address (16#4003C000#);
   SPI1_Base : constant System.Address := System'To_Address (16#40040000#);
   I2C0_Base : constant System.Address := System'To_Address (16#40044000#);
   I2C1_Base : constant System.Address := System'To_Address (16#40048000#);
   ADC_Base : constant System.Address := System'To_Address (16#4004C000#);
   PWM_Base : constant System.Address := System'To_Address (16#40050000#);
   TIMER_Base : constant System.Address := System'To_Address (16#40054000#);
   WATCHDOG_Base : constant System.Address := System'To_Address (16#40058000#);
   RTC_Base : constant System.Address := System'To_Address (16#4005C000#);
   ROSC_Base : constant System.Address := System'To_Address (16#40060000#);
   VREG_AND_CHIP_RESET_Base : constant System.Address := System'To_Address (16#40064000#);
   TBMAN_Base : constant System.Address := System'To_Address (16#4006C000#);
   DMA_Base : constant System.Address := System'To_Address (16#50000000#);
   USBCTRL_REGS_Base : constant System.Address := System'To_Address (16#50110000#);
   PIO0_Base : constant System.Address := System'To_Address (16#50200000#);
   PIO1_Base : constant System.Address := System'To_Address (16#50300000#);
   SIO_Base : constant System.Address := System'To_Address (16#D0000000#);
   PPB_Base : constant System.Address := System'To_Address (16#E0000000#);

end RP2040_SVD;
