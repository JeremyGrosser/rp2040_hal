pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with System;

--
--          Dual Cortex-M33 or Hazard3 processors at 150MHz
--          520kB on-chip SRAM, in 10 independent banks
--          Extended low-power sleep states with optional SRAM retention: as
--  low as 10uA DVDD
--          8kB of one-time-programmable storage (OTP)
--          Up to 16MB of external QSPI flash/PSRAM via dedicated QSPI bus
--              Additional 16MB flash/PSRAM accessible via optional second
--  chip-select
--          On-chip switched-mode power supply to generate core voltage
--              Low-quiescent-current LDO mode can be enabled for sleep states
--          2x on-chip PLLs for internal or external clock generation
--          GPIOs are 5V-tolerant (powered), and 3.3V-failsafe (unpowered)
--          Security features:
--              Optional boot signing, enforced by on-chip mask ROM, with key
--  fingerprint in OTP
--              Protected OTP storage for optional boot decryption key
--              Global bus filtering based on Arm or RISC-V security/privilege
--  levels
--              Peripherals, GPIOs and DMA channels individually assignable to
--  security domains
--              Hardware mitigations for fault injection attacks
--              Hardware SHA-256 accelerator
--          Peripherals:
--              2x UARTs
--              2x SPI controllers
--              2x I2C controllers
--              24x PWM channels
--              USB 1.1 controller and PHY, with host and device support
--              12x PIO state machines
--              1x HSTX peripheral
--      
package RP2350_SVD is
   pragma Preelaborate;

   --------------------
   -- Base addresses --
   --------------------

   RESETS_Base : constant System.Address := System'To_Address (16#40020000#);
   PSM_Base : constant System.Address := System'To_Address (16#40018000#);
   CLOCKS_Base : constant System.Address := System'To_Address (16#40010000#);
   TICKS_Base : constant System.Address := System'To_Address (16#40108000#);
   PADS_BANK0_Base : constant System.Address := System'To_Address (16#40038000#);
   PADS_QSPI_Base : constant System.Address := System'To_Address (16#40040000#);
   IO_QSPI_Base : constant System.Address := System'To_Address (16#40030000#);
   IO_BANK0_Base : constant System.Address := System'To_Address (16#40028000#);
   SYSINFO_Base : constant System.Address := System'To_Address (16#40000000#);
   SHA256_Base : constant System.Address := System'To_Address (16#400F8000#);
   HSTX_FIFO_Base : constant System.Address := System'To_Address (16#50600000#);
   HSTX_CTRL_Base : constant System.Address := System'To_Address (16#400C0000#);
   EPPB_Base : constant System.Address := System'To_Address (16#E0080000#);
   PPB_Base : constant System.Address := System'To_Address (16#E0000000#);
   PPB_NS_Base : constant System.Address := System'To_Address (16#E0020000#);
   QMI_Base : constant System.Address := System'To_Address (16#400D0000#);
   XIP_CTRL_Base : constant System.Address := System'To_Address (16#400C8000#);
   XIP_AUX_Base : constant System.Address := System'To_Address (16#50500000#);
   SYSCFG_Base : constant System.Address := System'To_Address (16#40008000#);
   XOSC_Base : constant System.Address := System'To_Address (16#40048000#);
   PLL_SYS_Base : constant System.Address := System'To_Address (16#40050000#);
   PLL_USB_Base : constant System.Address := System'To_Address (16#40058000#);
   ACCESSCTRL_Base : constant System.Address := System'To_Address (16#40060000#);
   UART0_Base : constant System.Address := System'To_Address (16#40070000#);
   UART1_Base : constant System.Address := System'To_Address (16#40078000#);
   ROSC_Base : constant System.Address := System'To_Address (16#400E8000#);
   POWMAN_Base : constant System.Address := System'To_Address (16#40100000#);
   WATCHDOG_Base : constant System.Address := System'To_Address (16#400D8000#);
   DMA_Base : constant System.Address := System'To_Address (16#50000000#);
   TIMER0_Base : constant System.Address := System'To_Address (16#400B0000#);
   TIMER1_Base : constant System.Address := System'To_Address (16#400B8000#);
   PWM_Base : constant System.Address := System'To_Address (16#400A8000#);
   ADC_Base : constant System.Address := System'To_Address (16#400A0000#);
   I2C0_Base : constant System.Address := System'To_Address (16#40090000#);
   I2C1_Base : constant System.Address := System'To_Address (16#40098000#);
   SPI0_Base : constant System.Address := System'To_Address (16#40080000#);
   SPI1_Base : constant System.Address := System'To_Address (16#40088000#);
   PIO0_Base : constant System.Address := System'To_Address (16#50200000#);
   PIO1_Base : constant System.Address := System'To_Address (16#50300000#);
   PIO2_Base : constant System.Address := System'To_Address (16#50400000#);
   BUSCTRL_Base : constant System.Address := System'To_Address (16#40068000#);
   SIO_Base : constant System.Address := System'To_Address (16#D0000000#);
   SIO_NS_Base : constant System.Address := System'To_Address (16#D0020000#);
   BOOTRAM_Base : constant System.Address := System'To_Address (16#400E0000#);
   CORESIGHT_TRACE_Base : constant System.Address := System'To_Address (16#50700000#);
   USB_Base : constant System.Address := System'To_Address (16#50110000#);
   TRNG_Base : constant System.Address := System'To_Address (16#400F0000#);
   GLITCH_DETECTOR_Base : constant System.Address := System'To_Address (16#40158000#);
   OTP_Base : constant System.Address := System'To_Address (16#40120000#);
   OTP_DATA_Base : constant System.Address := System'To_Address (16#40130000#);
   OTP_DATA_RAW_Base : constant System.Address := System'To_Address (16#40134000#);
   TBMAN_Base : constant System.Address := System'To_Address (16#40160000#);
   USB_DPRAM_Base : constant System.Address := System'To_Address (16#50100000#);

end RP2350_SVD;
