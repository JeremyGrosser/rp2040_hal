pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

--  Predefined OTP data layout for RP2350
package RP2350_SVD.OTP_DATA_RAW is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CHIPID0_CHIPID0_Field is HAL.UInt16;

   --  Bits 15:0 of public device ID. (ECC) The CHIPID0..3 rows contain a
   --  64-bit random identifier for this chip, which can be read from the USB
   --  bootloader PICOBOOT interface or from the get_sys_info ROM API. The
   --  number of random bits makes the occurrence of twins exceedingly
   --  unlikely: for example, a fleet of a hundred million devices has a 99.97%
   --  probability of no twinned IDs. This is estimated to be lower than the
   --  occurrence of process errors in the assignment of sequential random IDs,
   --  and for practical purposes CHIPID may be treated as unique.
   type CHIPID0_Register is record
      --  Read-only.
      CHIPID0        : CHIPID0_CHIPID0_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CHIPID0_Register use record
      CHIPID0        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CHIPID1_CHIPID1_Field is HAL.UInt16;

   --  Bits 31:16 of public device ID (ECC)
   type CHIPID1_Register is record
      --  Read-only.
      CHIPID1        : CHIPID1_CHIPID1_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CHIPID1_Register use record
      CHIPID1        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CHIPID2_CHIPID2_Field is HAL.UInt16;

   --  Bits 47:32 of public device ID (ECC)
   type CHIPID2_Register is record
      --  Read-only.
      CHIPID2        : CHIPID2_CHIPID2_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CHIPID2_Register use record
      CHIPID2        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CHIPID3_CHIPID3_Field is HAL.UInt16;

   --  Bits 63:48 of public device ID (ECC)
   type CHIPID3_Register is record
      --  Read-only.
      CHIPID3        : CHIPID3_CHIPID3_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CHIPID3_Register use record
      CHIPID3        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype RANDID0_RANDID0_Field is HAL.UInt16;

   --  Bits 15:0 of private per-device random number (ECC) The RANDID0..7 rows
   --  form a 128-bit random number generated during device test. This ID is
   --  not exposed through the USB PICOBOOT GET_INFO command or the ROM
   --  `get_sys_info()` API. However note that the USB PICOBOOT OTP access
   --  point can read the entirety of page 0, so this value is not meaningfully
   --  private unless the USB PICOBOOT interface is disabled via the
   --  DISABLE_BOOTSEL_USB_PICOBOOT_IFC flag in BOOT_FLAGS0.
   type RANDID0_Register is record
      --  Read-only.
      RANDID0        : RANDID0_RANDID0_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RANDID0_Register use record
      RANDID0        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype RANDID1_RANDID1_Field is HAL.UInt16;

   --  Bits 31:16 of private per-device random number (ECC)
   type RANDID1_Register is record
      --  Read-only.
      RANDID1        : RANDID1_RANDID1_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RANDID1_Register use record
      RANDID1        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype RANDID2_RANDID2_Field is HAL.UInt16;

   --  Bits 47:32 of private per-device random number (ECC)
   type RANDID2_Register is record
      --  Read-only.
      RANDID2        : RANDID2_RANDID2_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RANDID2_Register use record
      RANDID2        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype RANDID3_RANDID3_Field is HAL.UInt16;

   --  Bits 63:48 of private per-device random number (ECC)
   type RANDID3_Register is record
      --  Read-only.
      RANDID3        : RANDID3_RANDID3_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RANDID3_Register use record
      RANDID3        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype RANDID4_RANDID4_Field is HAL.UInt16;

   --  Bits 79:64 of private per-device random number (ECC)
   type RANDID4_Register is record
      --  Read-only.
      RANDID4        : RANDID4_RANDID4_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RANDID4_Register use record
      RANDID4        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype RANDID5_RANDID5_Field is HAL.UInt16;

   --  Bits 95:80 of private per-device random number (ECC)
   type RANDID5_Register is record
      --  Read-only.
      RANDID5        : RANDID5_RANDID5_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RANDID5_Register use record
      RANDID5        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype RANDID6_RANDID6_Field is HAL.UInt16;

   --  Bits 111:96 of private per-device random number (ECC)
   type RANDID6_Register is record
      --  Read-only.
      RANDID6        : RANDID6_RANDID6_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RANDID6_Register use record
      RANDID6        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype RANDID7_RANDID7_Field is HAL.UInt16;

   --  Bits 127:112 of private per-device random number (ECC)
   type RANDID7_Register is record
      --  Read-only.
      RANDID7        : RANDID7_RANDID7_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RANDID7_Register use record
      RANDID7        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype ROSC_CALIB_ROSC_CALIB_Field is HAL.UInt16;

   --  Ring oscillator frequency in kHz, measured during manufacturing (ECC)
   --  This is measured at 1.1 V, at room temperature, with the ROSC
   --  configuration registers in their reset state.
   type ROSC_CALIB_Register is record
      --  Read-only.
      ROSC_CALIB     : ROSC_CALIB_ROSC_CALIB_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ROSC_CALIB_Register use record
      ROSC_CALIB     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype LPOSC_CALIB_LPOSC_CALIB_Field is HAL.UInt16;

   --  Low-power oscillator frequency in Hz, measured during manufacturing
   --  (ECC) This is measured at 1.1V, at room temperature, with the LPOSC trim
   --  register in its reset state.
   type LPOSC_CALIB_Register is record
      --  Read-only.
      LPOSC_CALIB    : LPOSC_CALIB_LPOSC_CALIB_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for LPOSC_CALIB_Register use record
      LPOSC_CALIB    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype NUM_GPIOS_NUM_GPIOS_Field is HAL.UInt8;

   --  The number of main user GPIOs (bank 0). Should read 48 in the QFN80
   --  package, and 30 in the QFN60 package. (ECC)
   type NUM_GPIOS_Register is record
      --  Read-only.
      NUM_GPIOS     : NUM_GPIOS_NUM_GPIOS_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for NUM_GPIOS_Register use record
      NUM_GPIOS     at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype INFO_CRC0_INFO_CRC0_Field is HAL.UInt16;

   --  Lower 16 bits of CRC32 of OTP addresses 0x00 through 0x6b (polynomial
   --  0x4c11db7, input reflected, output reflected, seed all-ones, final XOR
   --  all-ones) (ECC)
   type INFO_CRC0_Register is record
      --  Read-only.
      INFO_CRC0      : INFO_CRC0_INFO_CRC0_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INFO_CRC0_Register use record
      INFO_CRC0      at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INFO_CRC1_INFO_CRC1_Field is HAL.UInt16;

   --  Upper 16 bits of CRC32 of OTP addresses 0x00 through 0x6b (ECC)
   type INFO_CRC1_Register is record
      --  Read-only.
      INFO_CRC1      : INFO_CRC1_INFO_CRC1_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INFO_CRC1_Register use record
      INFO_CRC1      at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Page 0 critical boot flags (RBIT-8)
   type CRIT0_Register is record
      --  Read-only. Permanently disable ARM processors (Cortex-M33)
      ARM_DISABLE   : Boolean;
      --  Read-only. Permanently disable RISC-V processors (Hazard3)
      RISCV_DISABLE : Boolean;
      --  unspecified
      Reserved_2_31 : HAL.UInt30;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRIT0_Register use record
      ARM_DISABLE   at 0 range 0 .. 0;
      RISCV_DISABLE at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype CRIT0_R1_CRIT0_R1_Field is HAL.UInt24;

   --  Redundant copy of CRIT0
   type CRIT0_R1_Register is record
      --  Read-only.
      CRIT0_R1       : CRIT0_R1_CRIT0_R1_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRIT0_R1_Register use record
      CRIT0_R1       at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CRIT0_R2_CRIT0_R2_Field is HAL.UInt24;

   --  Redundant copy of CRIT0
   type CRIT0_R2_Register is record
      --  Read-only.
      CRIT0_R2       : CRIT0_R2_CRIT0_R2_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRIT0_R2_Register use record
      CRIT0_R2       at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CRIT0_R3_CRIT0_R3_Field is HAL.UInt24;

   --  Redundant copy of CRIT0
   type CRIT0_R3_Register is record
      --  Read-only.
      CRIT0_R3       : CRIT0_R3_CRIT0_R3_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRIT0_R3_Register use record
      CRIT0_R3       at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CRIT0_R4_CRIT0_R4_Field is HAL.UInt24;

   --  Redundant copy of CRIT0
   type CRIT0_R4_Register is record
      --  Read-only.
      CRIT0_R4       : CRIT0_R4_CRIT0_R4_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRIT0_R4_Register use record
      CRIT0_R4       at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CRIT0_R5_CRIT0_R5_Field is HAL.UInt24;

   --  Redundant copy of CRIT0
   type CRIT0_R5_Register is record
      --  Read-only.
      CRIT0_R5       : CRIT0_R5_CRIT0_R5_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRIT0_R5_Register use record
      CRIT0_R5       at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CRIT0_R6_CRIT0_R6_Field is HAL.UInt24;

   --  Redundant copy of CRIT0
   type CRIT0_R6_Register is record
      --  Read-only.
      CRIT0_R6       : CRIT0_R6_CRIT0_R6_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRIT0_R6_Register use record
      CRIT0_R6       at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CRIT0_R7_CRIT0_R7_Field is HAL.UInt24;

   --  Redundant copy of CRIT0
   type CRIT0_R7_Register is record
      --  Read-only.
      CRIT0_R7       : CRIT0_R7_CRIT0_R7_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRIT0_R7_Register use record
      CRIT0_R7       at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CRIT1_GLITCH_DETECTOR_SENS_Field is HAL.UInt2;

   --  Page 1 critical boot flags (RBIT-8)
   type CRIT1_Register is record
      --  Read-only. Enable boot signature enforcement, and permanently disable
      --  the RISC-V cores.
      SECURE_BOOT_ENABLE     : Boolean;
      --  Read-only. Disable Secure debug access
      SECURE_DEBUG_DISABLE   : Boolean;
      --  Read-only. Disable all debug access
      DEBUG_DISABLE          : Boolean;
      --  Read-only. Set the default boot architecture, 0=ARM 1=RISC-V. Ignored
      --  if ARM_DISABLE, RISCV_DISABLE or SECURE_BOOT_ENABLE is set.
      BOOT_ARCH              : Boolean;
      --  Read-only. Arm the glitch detectors to reset the system if an
      --  abnormal clock/power event is observed.
      GLITCH_DETECTOR_ENABLE : Boolean;
      --  Read-only. Increase the sensitivity of the glitch detectors from
      --  their default.
      GLITCH_DETECTOR_SENS   : CRIT1_GLITCH_DETECTOR_SENS_Field;
      --  unspecified
      Reserved_7_31          : HAL.UInt25;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRIT1_Register use record
      SECURE_BOOT_ENABLE     at 0 range 0 .. 0;
      SECURE_DEBUG_DISABLE   at 0 range 1 .. 1;
      DEBUG_DISABLE          at 0 range 2 .. 2;
      BOOT_ARCH              at 0 range 3 .. 3;
      GLITCH_DETECTOR_ENABLE at 0 range 4 .. 4;
      GLITCH_DETECTOR_SENS   at 0 range 5 .. 6;
      Reserved_7_31          at 0 range 7 .. 31;
   end record;

   subtype CRIT1_R1_CRIT1_R1_Field is HAL.UInt24;

   --  Redundant copy of CRIT1
   type CRIT1_R1_Register is record
      --  Read-only.
      CRIT1_R1       : CRIT1_R1_CRIT1_R1_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRIT1_R1_Register use record
      CRIT1_R1       at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CRIT1_R2_CRIT1_R2_Field is HAL.UInt24;

   --  Redundant copy of CRIT1
   type CRIT1_R2_Register is record
      --  Read-only.
      CRIT1_R2       : CRIT1_R2_CRIT1_R2_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRIT1_R2_Register use record
      CRIT1_R2       at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CRIT1_R3_CRIT1_R3_Field is HAL.UInt24;

   --  Redundant copy of CRIT1
   type CRIT1_R3_Register is record
      --  Read-only.
      CRIT1_R3       : CRIT1_R3_CRIT1_R3_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRIT1_R3_Register use record
      CRIT1_R3       at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CRIT1_R4_CRIT1_R4_Field is HAL.UInt24;

   --  Redundant copy of CRIT1
   type CRIT1_R4_Register is record
      --  Read-only.
      CRIT1_R4       : CRIT1_R4_CRIT1_R4_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRIT1_R4_Register use record
      CRIT1_R4       at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CRIT1_R5_CRIT1_R5_Field is HAL.UInt24;

   --  Redundant copy of CRIT1
   type CRIT1_R5_Register is record
      --  Read-only.
      CRIT1_R5       : CRIT1_R5_CRIT1_R5_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRIT1_R5_Register use record
      CRIT1_R5       at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CRIT1_R6_CRIT1_R6_Field is HAL.UInt24;

   --  Redundant copy of CRIT1
   type CRIT1_R6_Register is record
      --  Read-only.
      CRIT1_R6       : CRIT1_R6_CRIT1_R6_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRIT1_R6_Register use record
      CRIT1_R6       at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CRIT1_R7_CRIT1_R7_Field is HAL.UInt24;

   --  Redundant copy of CRIT1
   type CRIT1_R7_Register is record
      --  Read-only.
      CRIT1_R7       : CRIT1_R7_CRIT1_R7_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRIT1_R7_Register use record
      CRIT1_R7       at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Disable/Enable boot paths/features in the RP2350 mask ROM. Disables
   --  always supersede enables. Enables are provided where there are other
   --  configurations in OTP that must be valid. (RBIT-3)
   type BOOT_FLAGS0_Register is record
      --  Read-only.
      DISABLE_BOOTSEL_EXEC2                   : Boolean;
      --  Read-only. Enable bootloader activity LED. If set, bootsel_led_cfg is
      --  assumed to be valid
      ENABLE_BOOTSEL_LED                      : Boolean;
      --  Read-only. Enable loading of the non-default XOSC and PLL
      --  configuration before entering BOOTSEL mode. Ensure that
      --  BOOTSEL_XOSC_CFG and BOOTSEL_PLL_CFG are correctly programmed before
      --  setting this bit. If this bit is set, user software may use the
      --  contents of BOOTSEL_PLL_CFG to calculated the expected XOSC frequency
      --  based on the fixed USB boot frequency of 48 MHz.
      ENABLE_BOOTSEL_NON_DEFAULT_PLL_XOSC_CFG : Boolean;
      --  Read-only. If 1, configure the QSPI pads for 1.8 V operation when
      --  accessing flash for the first time from the bootrom, using the
      --  VOLTAGE_SELECT register for the QSPI pads bank. This slightly
      --  improves the input timing of the pads at low voltages, but does not
      --  affect their output characteristics. If 0, leave VOLTAGE_SELECT in
      --  its reset state (suitable for operation at and above 2.5 V)
      FLASH_IO_VOLTAGE_1V8                    : Boolean;
      --  Read-only. Enable quartering of ROSC divisor during signature check,
      --  to reduce secure boot time
      FAST_SIGCHECK_ROSC_DIV                  : Boolean;
      --  Read-only. Mark FLASH_DEVINFO as containing valid, ECC'd data which
      --  describes external flash devices.
      FLASH_DEVINFO_ENABLE                    : Boolean;
      --  Read-only. Override the limit for default flash metadata scanning.
      --  The value is specified in FLASH_PARTITION_SLOT_SIZE. Make sure
      --  FLASH_PARTITION_SLOT_SIZE is valid before setting this bit
      OVERRIDE_FLASH_PARTITION_SLOT_SIZE      : Boolean;
      --  Read-only. Restrict flash boot path to use of a single binary at the
      --  start of flash
      SINGLE_FLASH_BINARY                     : Boolean;
      --  Read-only. Disable auto-switch of CPU architecture on boot when the
      --  (only) binary to be booted is for the other Arm/RISC-V architecture
      --  and both architectures are enabled
      DISABLE_AUTO_SWITCH_ARCH                : Boolean;
      --  Read-only. Require a partition table to be signed
      SECURE_PARTITION_TABLE                  : Boolean;
      --  Read-only. Require a partition table to be hashed (if not signed)
      HASHED_PARTITION_TABLE                  : Boolean;
      --  Read-only. Require binaries to have a rollback version. Set
      --  automatically the first time a binary with a rollback version is
      --  booted.
      ROLLBACK_REQUIRED                       : Boolean;
      --  Read-only.
      DISABLE_FLASH_BOOT                      : Boolean;
      --  Read-only. Takes precedence over ENABLE_OTP_BOOT.
      DISABLE_OTP_BOOT                        : Boolean;
      --  Read-only. Enable OTP boot. A number of OTP rows specified by
      --  OTPBOOT_LEN will be loaded, starting from OTPBOOT_SRC, into the SRAM
      --  location specified by OTPBOOT_DST1 and OTPBOOT_DST0. The loaded
      --  program image is stored with ECC, 16 bits per row, and must contain a
      --  valid IMAGE_DEF. Do not set this bit without first programming an
      --  image into OTP and configuring OTPBOOT_LEN, OTPBOOT_SRC, OTPBOOT_DST0
      --  and OTPBOOT_DST1. Note that OTPBOOT_LEN and OTPBOOT_SRC must be even
      --  numbers of OTP rows. Equivalently, the image must be a multiple of 32
      --  bits in size, and must start at a 32-bit-aligned address in the ECC
      --  read data address window.
      ENABLE_OTP_BOOT                         : Boolean;
      --  Read-only.
      DISABLE_POWER_SCRATCH                   : Boolean;
      --  Read-only.
      DISABLE_WATCHDOG_SCRATCH                : Boolean;
      --  Read-only.
      DISABLE_BOOTSEL_USB_MSD_IFC             : Boolean;
      --  Read-only.
      DISABLE_BOOTSEL_USB_PICOBOOT_IFC        : Boolean;
      --  Read-only.
      DISABLE_BOOTSEL_UART_BOOT               : Boolean;
      --  Read-only. Disable all access to XIP after entering an SRAM binary.
      --  Note that this will cause bootrom APIs that access XIP to fail,
      --  including APIs that interact with the partition table.
      DISABLE_XIP_ACCESS_ON_SRAM_ENTRY        : Boolean;
      --  Read-only.
      DISABLE_SRAM_WINDOW_BOOT                : Boolean;
      --  unspecified
      Reserved_22_31                          : HAL.UInt10;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOT_FLAGS0_Register use record
      DISABLE_BOOTSEL_EXEC2                   at 0 range 0 .. 0;
      ENABLE_BOOTSEL_LED                      at 0 range 1 .. 1;
      ENABLE_BOOTSEL_NON_DEFAULT_PLL_XOSC_CFG at 0 range 2 .. 2;
      FLASH_IO_VOLTAGE_1V8                    at 0 range 3 .. 3;
      FAST_SIGCHECK_ROSC_DIV                  at 0 range 4 .. 4;
      FLASH_DEVINFO_ENABLE                    at 0 range 5 .. 5;
      OVERRIDE_FLASH_PARTITION_SLOT_SIZE      at 0 range 6 .. 6;
      SINGLE_FLASH_BINARY                     at 0 range 7 .. 7;
      DISABLE_AUTO_SWITCH_ARCH                at 0 range 8 .. 8;
      SECURE_PARTITION_TABLE                  at 0 range 9 .. 9;
      HASHED_PARTITION_TABLE                  at 0 range 10 .. 10;
      ROLLBACK_REQUIRED                       at 0 range 11 .. 11;
      DISABLE_FLASH_BOOT                      at 0 range 12 .. 12;
      DISABLE_OTP_BOOT                        at 0 range 13 .. 13;
      ENABLE_OTP_BOOT                         at 0 range 14 .. 14;
      DISABLE_POWER_SCRATCH                   at 0 range 15 .. 15;
      DISABLE_WATCHDOG_SCRATCH                at 0 range 16 .. 16;
      DISABLE_BOOTSEL_USB_MSD_IFC             at 0 range 17 .. 17;
      DISABLE_BOOTSEL_USB_PICOBOOT_IFC        at 0 range 18 .. 18;
      DISABLE_BOOTSEL_UART_BOOT               at 0 range 19 .. 19;
      DISABLE_XIP_ACCESS_ON_SRAM_ENTRY        at 0 range 20 .. 20;
      DISABLE_SRAM_WINDOW_BOOT                at 0 range 21 .. 21;
      Reserved_22_31                          at 0 range 22 .. 31;
   end record;

   subtype BOOT_FLAGS0_R1_BOOT_FLAGS0_R1_Field is HAL.UInt24;

   --  Redundant copy of BOOT_FLAGS0
   type BOOT_FLAGS0_R1_Register is record
      --  Read-only.
      BOOT_FLAGS0_R1 : BOOT_FLAGS0_R1_BOOT_FLAGS0_R1_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOT_FLAGS0_R1_Register use record
      BOOT_FLAGS0_R1 at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype BOOT_FLAGS0_R2_BOOT_FLAGS0_R2_Field is HAL.UInt24;

   --  Redundant copy of BOOT_FLAGS0
   type BOOT_FLAGS0_R2_Register is record
      --  Read-only.
      BOOT_FLAGS0_R2 : BOOT_FLAGS0_R2_BOOT_FLAGS0_R2_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOT_FLAGS0_R2_Register use record
      BOOT_FLAGS0_R2 at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype BOOT_FLAGS1_KEY_VALID_Field is HAL.UInt4;
   subtype BOOT_FLAGS1_KEY_INVALID_Field is HAL.UInt4;
   subtype BOOT_FLAGS1_DOUBLE_TAP_DELAY_Field is HAL.UInt3;

   --  Disable/Enable boot paths/features in the RP2350 mask ROM. Disables
   --  always supersede enables. Enables are provided where there are other
   --  configurations in OTP that must be valid. (RBIT-3)
   type BOOT_FLAGS1_Register is record
      --  Read-only. Mark each of the possible boot keys as valid. The bootrom
      --  will check signatures against all valid boot keys, and ignore invalid
      --  boot keys. Each bit in this field corresponds to one of the four
      --  256-bit boot key hashes that may be stored in page 2 of the OTP. A
      --  KEY_VALID bit is ignored if the corresponding KEY_INVALID bit is set.
      --  Boot keys are considered valid only when KEY_VALID is set and
      --  KEY_INVALID is clear. Do not mark a boot key as KEY_VALID if it does
      --  not contain a valid SHA-256 hash of your secp256k1 public key. Verify
      --  keys after programming, before setting the KEY_VALID bits -- a boot
      --  key with uncorrectable ECC faults will render your device unbootable
      --  if secure boot is enabled. Do not enable secure boot without first
      --  installing a valid key. This will render your device unbootable.
      KEY_VALID        : BOOT_FLAGS1_KEY_VALID_Field;
      --  unspecified
      Reserved_4_7     : HAL.UInt4;
      --  Read-only. Mark a boot key as invalid, or prevent it from ever
      --  becoming valid. The bootrom will ignore any boot key marked as
      --  invalid during secure boot signature checks. Each bit in this field
      --  corresponds to one of the four 256-bit boot key hashes that may be
      --  stored in page 2 of the OTP. When provisioning boot keys, it's
      --  recommended to mark any boot key slots you don't intend to use as
      --  KEY_INVALID, so that spurious keys can not be installed at a later
      --  time.
      KEY_INVALID      : BOOT_FLAGS1_KEY_INVALID_Field;
      --  unspecified
      Reserved_12_15   : HAL.UInt4;
      --  Read-only. Adjust how long to wait for a second reset when double tap
      --  BOOTSEL mode is enabled via DOUBLE_TAP. The minimum is 50
      --  milliseconds, and each unit of this field adds an additional 50
      --  milliseconds. For example, settings this field to its maximum value
      --  of 7 will cause the chip to wait for 400 milliseconds at boot to
      --  check for a second reset which requests entry to BOOTSEL mode. 200
      --  milliseconds (DOUBLE_TAP_DELAY=3) is a good intermediate value.
      DOUBLE_TAP_DELAY : BOOT_FLAGS1_DOUBLE_TAP_DELAY_Field;
      --  Read-only. Enable entering BOOTSEL mode via double-tap of the
      --  RUN/RSTn pin. Adds a significant delay to boot time, as configured by
      --  DOUBLE_TAP_DELAY. This functions by waiting at startup (i.e.
      --  following a reset) to see if a second reset is applied soon
      --  afterward. The second reset is detected by the bootrom with help of
      --  the POWMAN_CHIP_RESET_DOUBLE_TAP flag, which is not reset by the
      --  external reset pin, and the bootrom enters BOOTSEL mode (NSBOOT) to
      --  await further instruction over USB or UART.
      DOUBLE_TAP       : Boolean;
      --  unspecified
      Reserved_20_31   : HAL.UInt12;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOT_FLAGS1_Register use record
      KEY_VALID        at 0 range 0 .. 3;
      Reserved_4_7     at 0 range 4 .. 7;
      KEY_INVALID      at 0 range 8 .. 11;
      Reserved_12_15   at 0 range 12 .. 15;
      DOUBLE_TAP_DELAY at 0 range 16 .. 18;
      DOUBLE_TAP       at 0 range 19 .. 19;
      Reserved_20_31   at 0 range 20 .. 31;
   end record;

   subtype BOOT_FLAGS1_R1_BOOT_FLAGS1_R1_Field is HAL.UInt24;

   --  Redundant copy of BOOT_FLAGS1
   type BOOT_FLAGS1_R1_Register is record
      --  Read-only.
      BOOT_FLAGS1_R1 : BOOT_FLAGS1_R1_BOOT_FLAGS1_R1_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOT_FLAGS1_R1_Register use record
      BOOT_FLAGS1_R1 at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype BOOT_FLAGS1_R2_BOOT_FLAGS1_R2_Field is HAL.UInt24;

   --  Redundant copy of BOOT_FLAGS1
   type BOOT_FLAGS1_R2_Register is record
      --  Read-only.
      BOOT_FLAGS1_R2 : BOOT_FLAGS1_R2_BOOT_FLAGS1_R2_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOT_FLAGS1_R2_Register use record
      BOOT_FLAGS1_R2 at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype DEFAULT_BOOT_VERSION0_DEFAULT_BOOT_VERSION0_Field is HAL.UInt24;

   --  Default boot version thermometer counter, bits 23:0 (RBIT-3)
   type DEFAULT_BOOT_VERSION0_Register is record
      --  Read-only.
      DEFAULT_BOOT_VERSION0 : DEFAULT_BOOT_VERSION0_DEFAULT_BOOT_VERSION0_Field;
      --  unspecified
      Reserved_24_31        : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DEFAULT_BOOT_VERSION0_Register use record
      DEFAULT_BOOT_VERSION0 at 0 range 0 .. 23;
      Reserved_24_31        at 0 range 24 .. 31;
   end record;

   subtype DEFAULT_BOOT_VERSION0_R1_DEFAULT_BOOT_VERSION0_R1_Field is
     HAL.UInt24;

   --  Redundant copy of DEFAULT_BOOT_VERSION0
   type DEFAULT_BOOT_VERSION0_R1_Register is record
      --  Read-only.
      DEFAULT_BOOT_VERSION0_R1 : DEFAULT_BOOT_VERSION0_R1_DEFAULT_BOOT_VERSION0_R1_Field;
      --  unspecified
      Reserved_24_31           : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DEFAULT_BOOT_VERSION0_R1_Register use record
      DEFAULT_BOOT_VERSION0_R1 at 0 range 0 .. 23;
      Reserved_24_31           at 0 range 24 .. 31;
   end record;

   subtype DEFAULT_BOOT_VERSION0_R2_DEFAULT_BOOT_VERSION0_R2_Field is
     HAL.UInt24;

   --  Redundant copy of DEFAULT_BOOT_VERSION0
   type DEFAULT_BOOT_VERSION0_R2_Register is record
      --  Read-only.
      DEFAULT_BOOT_VERSION0_R2 : DEFAULT_BOOT_VERSION0_R2_DEFAULT_BOOT_VERSION0_R2_Field;
      --  unspecified
      Reserved_24_31           : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DEFAULT_BOOT_VERSION0_R2_Register use record
      DEFAULT_BOOT_VERSION0_R2 at 0 range 0 .. 23;
      Reserved_24_31           at 0 range 24 .. 31;
   end record;

   subtype DEFAULT_BOOT_VERSION1_DEFAULT_BOOT_VERSION1_Field is HAL.UInt24;

   --  Default boot version thermometer counter, bits 47:24 (RBIT-3)
   type DEFAULT_BOOT_VERSION1_Register is record
      --  Read-only.
      DEFAULT_BOOT_VERSION1 : DEFAULT_BOOT_VERSION1_DEFAULT_BOOT_VERSION1_Field;
      --  unspecified
      Reserved_24_31        : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DEFAULT_BOOT_VERSION1_Register use record
      DEFAULT_BOOT_VERSION1 at 0 range 0 .. 23;
      Reserved_24_31        at 0 range 24 .. 31;
   end record;

   subtype DEFAULT_BOOT_VERSION1_R1_DEFAULT_BOOT_VERSION1_R1_Field is
     HAL.UInt24;

   --  Redundant copy of DEFAULT_BOOT_VERSION1
   type DEFAULT_BOOT_VERSION1_R1_Register is record
      --  Read-only.
      DEFAULT_BOOT_VERSION1_R1 : DEFAULT_BOOT_VERSION1_R1_DEFAULT_BOOT_VERSION1_R1_Field;
      --  unspecified
      Reserved_24_31           : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DEFAULT_BOOT_VERSION1_R1_Register use record
      DEFAULT_BOOT_VERSION1_R1 at 0 range 0 .. 23;
      Reserved_24_31           at 0 range 24 .. 31;
   end record;

   subtype DEFAULT_BOOT_VERSION1_R2_DEFAULT_BOOT_VERSION1_R2_Field is
     HAL.UInt24;

   --  Redundant copy of DEFAULT_BOOT_VERSION1
   type DEFAULT_BOOT_VERSION1_R2_Register is record
      --  Read-only.
      DEFAULT_BOOT_VERSION1_R2 : DEFAULT_BOOT_VERSION1_R2_DEFAULT_BOOT_VERSION1_R2_Field;
      --  unspecified
      Reserved_24_31           : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DEFAULT_BOOT_VERSION1_R2_Register use record
      DEFAULT_BOOT_VERSION1_R2 at 0 range 0 .. 23;
      Reserved_24_31           at 0 range 24 .. 31;
   end record;

   subtype FLASH_DEVINFO_CS1_GPIO_Field is HAL.UInt6;

   --  The size of the flash/PSRAM device on chip select 0 (addressable at
   --  0x10000000 through 0x10ffffff). A value of zero is decoded as a size of
   --  zero (no device). Nonzero values are decoded as 4kiB << CS0_SIZE. For
   --  example, four megabytes is encoded with a CS0_SIZE value of 10, and 16
   --  megabytes is encoded with a CS0_SIZE value of 12. When
   --  BOOT_FLAGS0_FLASH_DEVINFO_ENABLE is not set, a default of 12 (16 MiB) is
   --  used.
   type FLASH_DEVINFO_CS0_SIZE_Field is
     (NONE,
      Val_8K,
      Val_16K,
      Val_32K,
      Val_64k,
      Val_128K,
      Val_256K,
      Val_512K,
      Val_1M,
      Val_2M,
      Val_4M,
      Val_8M,
      Val_16M)
     with Size => 4;
   for FLASH_DEVINFO_CS0_SIZE_Field use
     (NONE => 0,
      Val_8K => 1,
      Val_16K => 2,
      Val_32K => 3,
      Val_64k => 4,
      Val_128K => 5,
      Val_256K => 6,
      Val_512K => 7,
      Val_1M => 8,
      Val_2M => 9,
      Val_4M => 10,
      Val_8M => 11,
      Val_16M => 12);

   --  The size of the flash/PSRAM device on chip select 1 (addressable at
   --  0x11000000 through 0x11ffffff). A value of zero is decoded as a size of
   --  zero (no device). Nonzero values are decoded as 4kiB << CS1_SIZE. For
   --  example, four megabytes is encoded with a CS1_SIZE value of 10, and 16
   --  megabytes is encoded with a CS1_SIZE value of 12. When
   --  BOOT_FLAGS0_FLASH_DEVINFO_ENABLE is not set, a default of zero is used.
   type FLASH_DEVINFO_CS1_SIZE_Field is
     (NONE,
      Val_8K,
      Val_16K,
      Val_32K,
      Val_64k,
      Val_128K,
      Val_256K,
      Val_512K,
      Val_1M,
      Val_2M,
      Val_4M,
      Val_8M,
      Val_16M)
     with Size => 4;
   for FLASH_DEVINFO_CS1_SIZE_Field use
     (NONE => 0,
      Val_8K => 1,
      Val_16K => 2,
      Val_32K => 3,
      Val_64k => 4,
      Val_128K => 5,
      Val_256K => 6,
      Val_512K => 7,
      Val_1M => 8,
      Val_2M => 9,
      Val_4M => 10,
      Val_8M => 11,
      Val_16M => 12);

   --  Stores information about external flash device(s). (ECC) Assumed to be
   --  valid if BOOT_FLAGS0_FLASH_DEVINFO_ENABLE is set.
   type FLASH_DEVINFO_Register is record
      --  Read-only. Indicate a GPIO number to be used for the secondary flash
      --  chip select (CS1), which selects the external QSPI device mapped at
      --  system addresses 0x11000000 through 0x11ffffff. There is no such
      --  configuration for CS0, as the primary chip select has a dedicated
      --  pin. On RP2350 the permissible GPIO numbers are 0, 8, 19 and 47.
      --  Ignored if CS1_size is zero. If CS1_SIZE is nonzero, the bootrom will
      --  automatically configure this GPIO as a second chip select upon
      --  entering the flash boot path, or entering any other path that may use
      --  the QSPI flash interface, such as BOOTSEL mode (nsboot).
      CS1_GPIO            : FLASH_DEVINFO_CS1_GPIO_Field;
      --  unspecified
      Reserved_6_6        : HAL.Bit;
      --  Read-only. If true, all attached devices are assumed to support (or
      --  ignore, in the case of PSRAM) a block erase command with a command
      --  prefix of D8h, an erase size of 64 kiB, and a 24-bit address. Almost
      --  all 25-series flash devices support this command. If set, the bootrom
      --  will use the D8h erase command where it is able, to accelerate bulk
      --  erase operations. This makes flash programming faster. When
      --  BOOT_FLAGS0_FLASH_DEVINFO_ENABLE is not set, this field defaults to
      --  false.
      D8H_ERASE_SUPPORTED : Boolean;
      --  Read-only. The size of the flash/PSRAM device on chip select 0
      --  (addressable at 0x10000000 through 0x10ffffff). A value of zero is
      --  decoded as a size of zero (no device). Nonzero values are decoded as
      --  4kiB << CS0_SIZE. For example, four megabytes is encoded with a
      --  CS0_SIZE value of 10, and 16 megabytes is encoded with a CS0_SIZE
      --  value of 12. When BOOT_FLAGS0_FLASH_DEVINFO_ENABLE is not set, a
      --  default of 12 (16 MiB) is used.
      CS0_SIZE            : FLASH_DEVINFO_CS0_SIZE_Field;
      --  Read-only. The size of the flash/PSRAM device on chip select 1
      --  (addressable at 0x11000000 through 0x11ffffff). A value of zero is
      --  decoded as a size of zero (no device). Nonzero values are decoded as
      --  4kiB << CS1_SIZE. For example, four megabytes is encoded with a
      --  CS1_SIZE value of 10, and 16 megabytes is encoded with a CS1_SIZE
      --  value of 12. When BOOT_FLAGS0_FLASH_DEVINFO_ENABLE is not set, a
      --  default of zero is used.
      CS1_SIZE            : FLASH_DEVINFO_CS1_SIZE_Field;
      --  unspecified
      Reserved_16_31      : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FLASH_DEVINFO_Register use record
      CS1_GPIO            at 0 range 0 .. 5;
      Reserved_6_6        at 0 range 6 .. 6;
      D8H_ERASE_SUPPORTED at 0 range 7 .. 7;
      CS0_SIZE            at 0 range 8 .. 11;
      CS1_SIZE            at 0 range 12 .. 15;
      Reserved_16_31      at 0 range 16 .. 31;
   end record;

   subtype FLASH_PARTITION_SLOT_SIZE_FLASH_PARTITION_SLOT_SIZE_Field is
     HAL.UInt16;

   --  Gap between partition table slot 0 and slot 1 at the start of flash (the
   --  default size is 4096 bytes) (ECC) Enabled by the
   --  OVERRIDE_FLASH_PARTITION_SLOT_SIZE bit in BOOT_FLAGS, the size is 4096 *
   --  (value + 1)
   type FLASH_PARTITION_SLOT_SIZE_Register is record
      --  Read-only.
      FLASH_PARTITION_SLOT_SIZE : FLASH_PARTITION_SLOT_SIZE_FLASH_PARTITION_SLOT_SIZE_Field;
      --  unspecified
      Reserved_16_31            : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FLASH_PARTITION_SLOT_SIZE_Register use record
      FLASH_PARTITION_SLOT_SIZE at 0 range 0 .. 15;
      Reserved_16_31            at 0 range 16 .. 31;
   end record;

   subtype BOOTSEL_LED_CFG_PIN_Field is HAL.UInt6;

   --  Pin configuration for LED status, used by USB bootloader. (ECC) Must be
   --  valid if BOOT_FLAGS0_ENABLE_BOOTSEL_LED is set.
   type BOOTSEL_LED_CFG_Register is record
      --  Read-only. GPIO index to use for bootloader activity LED.
      PIN           : BOOTSEL_LED_CFG_PIN_Field;
      --  unspecified
      Reserved_6_7  : HAL.UInt2;
      --  Read-only. LED is active-low. (Default: active-high.)
      ACTIVELOW     : Boolean;
      --  unspecified
      Reserved_9_31 : HAL.UInt23;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTSEL_LED_CFG_Register use record
      PIN           at 0 range 0 .. 5;
      Reserved_6_7  at 0 range 6 .. 7;
      ACTIVELOW     at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype BOOTSEL_PLL_CFG_FBDIV_Field is HAL.UInt9;
   --  BOOTSEL_PLL_CFG_POSTDIV array element
   subtype BOOTSEL_PLL_CFG_POSTDIV_Element is HAL.UInt3;

   --  BOOTSEL_PLL_CFG_POSTDIV array
   type BOOTSEL_PLL_CFG_POSTDIV_Field_Array is array (1 .. 2)
     of BOOTSEL_PLL_CFG_POSTDIV_Element
     with Component_Size => 3, Size => 6;

   --  Type definition for BOOTSEL_PLL_CFG_POSTDIV
   type BOOTSEL_PLL_CFG_POSTDIV_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  POSTDIV as a value
            Val : HAL.UInt6;
         when True =>
            --  POSTDIV as an array
            Arr : BOOTSEL_PLL_CFG_POSTDIV_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for BOOTSEL_PLL_CFG_POSTDIV_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  Optional PLL configuration for BOOTSEL mode. (ECC) This should be
   --  configured to produce an exact 48 MHz based on the crystal oscillator
   --  frequency. User mode software may also use this value to calculate the
   --  expected crystal frequency based on an assumed 48 MHz PLL output. If no
   --  configuration is given, the crystal is assumed to be 12 MHz. The PLL
   --  frequency can be calculated as: PLL out = (XOSC frequency / (REFDIV+1))
   --  x FBDIV / (POSTDIV1 x POSTDIV2) Conversely the crystal frequency can be
   --  calculated as: XOSC frequency = 48 MHz x (REFDIV+1) x (POSTDIV1 x
   --  POSTDIV2) / FBDIV (Note the +1 on REFDIV is because the value stored in
   --  this OTP location is the actual divisor value minus one.) Used if and
   --  only if ENABLE_BOOTSEL_NON_DEFAULT_PLL_XOSC_CFG is set in BOOT_FLAGS0.
   --  That bit should be set only after this row and BOOTSEL_XOSC_CFG are both
   --  correctly programmed.
   type BOOTSEL_PLL_CFG_Register is record
      --  Read-only. PLL feedback divisor, in the range 16..320 inclusive.
      FBDIV          : BOOTSEL_PLL_CFG_FBDIV_Field;
      --  Read-only. PLL post-divide 1 divisor, in the range 1..7 inclusive.
      POSTDIV        : BOOTSEL_PLL_CFG_POSTDIV_Field;
      --  Read-only. PLL reference divisor, minus one. Programming a value of 0
      --  means a reference divisor of 1. Programming a value of 1 means a
      --  reference divisor of 2 (for exceptionally fast XIN inputs)
      REFDIV         : Boolean;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTSEL_PLL_CFG_Register use record
      FBDIV          at 0 range 0 .. 8;
      POSTDIV        at 0 range 9 .. 14;
      REFDIV         at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTSEL_XOSC_CFG_STARTUP_Field is HAL.UInt14;

   --  Value of the XOSC_CTRL_FREQ_RANGE register.
   type BOOTSEL_XOSC_CFG_RANGE_Field is
     (Val_1_15MHZ,
      Val_10_30MHZ,
      Val_25_60MHZ,
      Val_40_100MHZ)
     with Size => 2;
   for BOOTSEL_XOSC_CFG_RANGE_Field use
     (Val_1_15MHZ => 0,
      Val_10_30MHZ => 1,
      Val_25_60MHZ => 2,
      Val_40_100MHZ => 3);

   --  Non-default crystal oscillator configuration for the USB bootloader.
   --  (ECC) These values may also be used by user code configuring the crystal
   --  oscillator. Used if and only if ENABLE_BOOTSEL_NON_DEFAULT_PLL_XOSC_CFG
   --  is set in BOOT_FLAGS0. That bit should be set only after this row and
   --  BOOTSEL_PLL_CFG are both correctly programmed.
   type BOOTSEL_XOSC_CFG_Register is record
      --  Read-only. Value of the XOSC_STARTUP register
      STARTUP        : BOOTSEL_XOSC_CFG_STARTUP_Field;
      --  Read-only. Value of the XOSC_CTRL_FREQ_RANGE register.
      RANGE_k        : BOOTSEL_XOSC_CFG_RANGE_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTSEL_XOSC_CFG_Register use record
      STARTUP        at 0 range 0 .. 13;
      RANGE_k        at 0 range 14 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  USB boot specific feature flags (RBIT-3)
   type USB_BOOT_FLAGS_Register is record
      --  Read-only. valid flag for USB_DEVICE_VID_VALUE entry of the
      --  USB_WHITE_LABEL struct (index 0)
      WL_USB_DEVICE_VID_VALUE_VALID                   : Boolean;
      --  Read-only. valid flag for USB_DEVICE_PID_VALUE entry of the
      --  USB_WHITE_LABEL struct (index 1)
      WL_USB_DEVICE_PID_VALUE_VALID                   : Boolean;
      --  Read-only. valid flag for USB_DEVICE_BCD_DEVICEVALUE entry of the
      --  USB_WHITE_LABEL struct (index 2)
      WL_USB_DEVICE_SERIAL_NUMBER_VALUE_VALID         : Boolean;
      --  Read-only. valid flag for USB_DEVICE_LANG_ID_VALUE entry of the
      --  USB_WHITE_LABEL struct (index 3)
      WL_USB_DEVICE_LANG_ID_VALUE_VALID               : Boolean;
      --  Read-only. valid flag for USB_DEVICE_MANUFACTURER_STRDEF entry of the
      --  USB_WHITE_LABEL struct (index 4)
      WL_USB_DEVICE_MANUFACTURER_STRDEF_VALID         : Boolean;
      --  Read-only. valid flag for USB_DEVICE_PRODUCT_STRDEF entry of the
      --  USB_WHITE_LABEL struct (index 5)
      WL_USB_DEVICE_PRODUCT_STRDEF_VALID              : Boolean;
      --  Read-only. valid flag for USB_DEVICE_SERIAL_NUMBER_STRDEF entry of
      --  the USB_WHITE_LABEL struct (index 6)
      WL_USB_DEVICE_SERIAL_NUMBER_STRDEF_VALID        : Boolean;
      --  Read-only. valid flag for USB_CONFIG_ATTRIBUTES_MAX_POWER_VALUES
      --  entry of the USB_WHITE_LABEL struct (index 7)
      WL_USB_CONFIG_ATTRIBUTES_MAX_POWER_VALUES_VALID : Boolean;
      --  Read-only. valid flag for VOLUME_LABEL_STRDEF entry of the
      --  USB_WHITE_LABEL struct (index 8)
      WL_VOLUME_LABEL_STRDEF_VALID                    : Boolean;
      --  Read-only. valid flag for SCSI_INQUIRY_VENDOR_STRDEF entry of the
      --  USB_WHITE_LABEL struct (index 9)
      WL_SCSI_INQUIRY_VENDOR_STRDEF_VALID             : Boolean;
      --  Read-only. valid flag for SCSI_INQUIRY_PRODUCT_STRDEF entry of the
      --  USB_WHITE_LABEL struct (index 10)
      WL_SCSI_INQUIRY_PRODUCT_STRDEF_VALID            : Boolean;
      --  Read-only. valid flag for SCSI_INQUIRY_VERSION_STRDEF entry of the
      --  USB_WHITE_LABEL struct (index 11)
      WL_SCSI_INQUIRY_VERSION_STRDEF_VALID            : Boolean;
      --  Read-only. valid flag for INDEX_HTM_REDIRECT_URL_STRDEF entry of the
      --  USB_WHITE_LABEL struct (index 12)
      WL_INDEX_HTM_REDIRECT_URL_STRDEF_VALID          : Boolean;
      --  Read-only. valid flag for INDEX_HTM_REDIRECT_NAME_STRDEF entry of the
      --  USB_WHITE_LABEL struct (index 13)
      WL_INDEX_HTM_REDIRECT_NAME_STRDEF_VALID         : Boolean;
      --  Read-only. valid flag for INFO_UF2_TXT_MODEL_STRDEF entry of the
      --  USB_WHITE_LABEL struct (index 14)
      WL_INFO_UF2_TXT_MODEL_STRDEF_VALID              : Boolean;
      --  Read-only. valid flag for the USB_WHITE_LABEL_ADDR field
      WL_INFO_UF2_TXT_BOARD_ID_STRDEF_VALID           : Boolean;
      --  unspecified
      Reserved_16_21                                  : HAL.UInt6;
      --  Read-only. valid flag for INFO_UF2_TXT_BOARD_ID_STRDEF entry of the
      --  USB_WHITE_LABEL struct (index 15)
      WHITE_LABEL_ADDR_VALID                          : Boolean;
      --  Read-only. Swap DM/DP during USB boot, to support board layouts with
      --  mirrored USB routing (deliberate or accidental).
      DP_DM_SWAP                                      : Boolean;
      --  unspecified
      Reserved_24_31                                  : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for USB_BOOT_FLAGS_Register use record
      WL_USB_DEVICE_VID_VALUE_VALID                   at 0 range 0 .. 0;
      WL_USB_DEVICE_PID_VALUE_VALID                   at 0 range 1 .. 1;
      WL_USB_DEVICE_SERIAL_NUMBER_VALUE_VALID         at 0 range 2 .. 2;
      WL_USB_DEVICE_LANG_ID_VALUE_VALID               at 0 range 3 .. 3;
      WL_USB_DEVICE_MANUFACTURER_STRDEF_VALID         at 0 range 4 .. 4;
      WL_USB_DEVICE_PRODUCT_STRDEF_VALID              at 0 range 5 .. 5;
      WL_USB_DEVICE_SERIAL_NUMBER_STRDEF_VALID        at 0 range 6 .. 6;
      WL_USB_CONFIG_ATTRIBUTES_MAX_POWER_VALUES_VALID at 0 range 7 .. 7;
      WL_VOLUME_LABEL_STRDEF_VALID                    at 0 range 8 .. 8;
      WL_SCSI_INQUIRY_VENDOR_STRDEF_VALID             at 0 range 9 .. 9;
      WL_SCSI_INQUIRY_PRODUCT_STRDEF_VALID            at 0 range 10 .. 10;
      WL_SCSI_INQUIRY_VERSION_STRDEF_VALID            at 0 range 11 .. 11;
      WL_INDEX_HTM_REDIRECT_URL_STRDEF_VALID          at 0 range 12 .. 12;
      WL_INDEX_HTM_REDIRECT_NAME_STRDEF_VALID         at 0 range 13 .. 13;
      WL_INFO_UF2_TXT_MODEL_STRDEF_VALID              at 0 range 14 .. 14;
      WL_INFO_UF2_TXT_BOARD_ID_STRDEF_VALID           at 0 range 15 .. 15;
      Reserved_16_21                                  at 0 range 16 .. 21;
      WHITE_LABEL_ADDR_VALID                          at 0 range 22 .. 22;
      DP_DM_SWAP                                      at 0 range 23 .. 23;
      Reserved_24_31                                  at 0 range 24 .. 31;
   end record;

   subtype USB_BOOT_FLAGS_R1_USB_BOOT_FLAGS_R1_Field is HAL.UInt24;

   --  Redundant copy of USB_BOOT_FLAGS
   type USB_BOOT_FLAGS_R1_Register is record
      --  Read-only.
      USB_BOOT_FLAGS_R1 : USB_BOOT_FLAGS_R1_USB_BOOT_FLAGS_R1_Field;
      --  unspecified
      Reserved_24_31    : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for USB_BOOT_FLAGS_R1_Register use record
      USB_BOOT_FLAGS_R1 at 0 range 0 .. 23;
      Reserved_24_31    at 0 range 24 .. 31;
   end record;

   subtype USB_BOOT_FLAGS_R2_USB_BOOT_FLAGS_R2_Field is HAL.UInt24;

   --  Redundant copy of USB_BOOT_FLAGS
   type USB_BOOT_FLAGS_R2_Register is record
      --  Read-only.
      USB_BOOT_FLAGS_R2 : USB_BOOT_FLAGS_R2_USB_BOOT_FLAGS_R2_Field;
      --  unspecified
      Reserved_24_31    : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for USB_BOOT_FLAGS_R2_Register use record
      USB_BOOT_FLAGS_R2 at 0 range 0 .. 23;
      Reserved_24_31    at 0 range 24 .. 31;
   end record;

   type USB_WHITE_LABEL_ADDR_USB_WHITE_LABEL_ADDR_Field is
     (INDEX_USB_DEVICE_VID_VALUE,
      INDEX_USB_DEVICE_PID_VALUE,
      INDEX_USB_DEVICE_BCD_DEVICE_VALUE,
      INDEX_USB_DEVICE_LANG_ID_VALUE,
      INDEX_USB_DEVICE_MANUFACTURER_STRDEF,
      INDEX_USB_DEVICE_PRODUCT_STRDEF,
      INDEX_USB_DEVICE_SERIAL_NUMBER_STRDEF,
      INDEX_USB_CONFIG_ATTRIBUTES_MAX_POWER_VALUES,
      INDEX_VOLUME_LABEL_STRDEF,
      INDEX_SCSI_INQUIRY_VENDOR_STRDEF,
      INDEX_SCSI_INQUIRY_PRODUCT_STRDEF,
      INDEX_SCSI_INQUIRY_VERSION_STRDEF,
      INDEX_INDEX_HTM_REDIRECT_URL_STRDEF,
      INDEX_INDEX_HTM_REDIRECT_NAME_STRDEF,
      INDEX_INFO_UF2_TXT_MODEL_STRDEF,
      INDEX_INFO_UF2_TXT_BOARD_ID_STRDEF)
     with Size => 16;
   for USB_WHITE_LABEL_ADDR_USB_WHITE_LABEL_ADDR_Field use
     (INDEX_USB_DEVICE_VID_VALUE => 0,
      INDEX_USB_DEVICE_PID_VALUE => 1,
      INDEX_USB_DEVICE_BCD_DEVICE_VALUE => 2,
      INDEX_USB_DEVICE_LANG_ID_VALUE => 3,
      INDEX_USB_DEVICE_MANUFACTURER_STRDEF => 4,
      INDEX_USB_DEVICE_PRODUCT_STRDEF => 5,
      INDEX_USB_DEVICE_SERIAL_NUMBER_STRDEF => 6,
      INDEX_USB_CONFIG_ATTRIBUTES_MAX_POWER_VALUES => 7,
      INDEX_VOLUME_LABEL_STRDEF => 8,
      INDEX_SCSI_INQUIRY_VENDOR_STRDEF => 9,
      INDEX_SCSI_INQUIRY_PRODUCT_STRDEF => 10,
      INDEX_SCSI_INQUIRY_VERSION_STRDEF => 11,
      INDEX_INDEX_HTM_REDIRECT_URL_STRDEF => 12,
      INDEX_INDEX_HTM_REDIRECT_NAME_STRDEF => 13,
      INDEX_INFO_UF2_TXT_MODEL_STRDEF => 14,
      INDEX_INFO_UF2_TXT_BOARD_ID_STRDEF => 15);

   --  Row index of the USB_WHITE_LABEL structure within OTP (ECC) The table
   --  has 16 rows, each of which are also ECC and marked valid by the
   --  corresponding valid bit in USB_BOOT_FLAGS (ECC). The entries are either
   --  _VALUEs where the 16 bit value is used as is, or _STRDEFs which acts as
   --  a pointers to a string value. The value stored in a _STRDEF is two
   --  separate bytes: The low seven bits of the first (LSB) byte indicates the
   --  number of characters in the string, and the top bit of the first (LSB)
   --  byte if set to indicate that each character in the string is two bytes
   --  (Unicode) versus one byte if unset. The second (MSB) byte represents the
   --  location of the string data, and is encoded as the number of rows from
   --  this USB_WHITE_LABEL_ADDR; i.e. the row of the start of the string is
   --  USB_WHITE_LABEL_ADDR value + msb_byte. In each case, the corresponding
   --  valid bit enables replacing the default value for the corresponding item
   --  provided by the boot rom. Note that Unicode _STRDEFs are only supported
   --  for USB_DEVICE_PRODUCT_STRDEF, USB_DEVICE_SERIAL_NUMBER_STRDEF and
   --  USB_DEVICE_MANUFACTURER_STRDEF. Unicode values will be ignored if
   --  specified for other fields, and non-unicode values for these three items
   --  will be converted to Unicode characters by setting the upper 8 bits to
   --  zero. Note that if the USB_WHITE_LABEL structure or the corresponding
   --  strings are not readable by BOOTSEL mode based on OTP permissions, or if
   --  alignment requirements are not met, then the corresponding default
   --  values are used. The index values indicate where each field is located
   --  (row USB_WHITE_LABEL_ADDR value + index):
   type USB_WHITE_LABEL_ADDR_Register is record
      --  Read-only.
      USB_WHITE_LABEL_ADDR : USB_WHITE_LABEL_ADDR_USB_WHITE_LABEL_ADDR_Field;
      --  unspecified
      Reserved_16_31       : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for USB_WHITE_LABEL_ADDR_Register use record
      USB_WHITE_LABEL_ADDR at 0 range 0 .. 15;
      Reserved_16_31       at 0 range 16 .. 31;
   end record;

   subtype OTPBOOT_SRC_OTPBOOT_SRC_Field is HAL.UInt16;

   --  OTP start row for the OTP boot image. (ECC) If OTP boot is enabled, the
   --  bootrom will load from this location into SRAM and then directly enter
   --  the loaded image. Note that the image must be signed if
   --  SECURE_BOOT_ENABLE is set. The image itself is assumed to be
   --  ECC-protected. This must be an even number. Equivalently, the OTP boot
   --  image must start at a word-aligned location in the ECC read data address
   --  window.
   type OTPBOOT_SRC_Register is record
      --  Read-only.
      OTPBOOT_SRC    : OTPBOOT_SRC_OTPBOOT_SRC_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OTPBOOT_SRC_Register use record
      OTPBOOT_SRC    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype OTPBOOT_LEN_OTPBOOT_LEN_Field is HAL.UInt16;

   --  Length in rows of the OTP boot image. (ECC) OTPBOOT_LEN must be even.
   --  The total image size must be a multiple of 4 bytes (32 bits).
   type OTPBOOT_LEN_Register is record
      --  Read-only.
      OTPBOOT_LEN    : OTPBOOT_LEN_OTPBOOT_LEN_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OTPBOOT_LEN_Register use record
      OTPBOOT_LEN    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype OTPBOOT_DST0_OTPBOOT_DST0_Field is HAL.UInt16;

   --  Bits 15:0 of the OTP boot image load destination (and entry point).
   --  (ECC) This must be a location in main SRAM (main SRAM is addresses
   --  0x20000000 through 0x20082000) and must be word-aligned.
   type OTPBOOT_DST0_Register is record
      --  Read-only.
      OTPBOOT_DST0   : OTPBOOT_DST0_OTPBOOT_DST0_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OTPBOOT_DST0_Register use record
      OTPBOOT_DST0   at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype OTPBOOT_DST1_OTPBOOT_DST1_Field is HAL.UInt16;

   --  Bits 31:16 of the OTP boot image load destination (and entry point).
   --  (ECC) This must be a location in main SRAM (main SRAM is addresses
   --  0x20000000 through 0x20082000) and must be word-aligned.
   type OTPBOOT_DST1_Register is record
      --  Read-only.
      OTPBOOT_DST1   : OTPBOOT_DST1_OTPBOOT_DST1_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OTPBOOT_DST1_Register use record
      OTPBOOT_DST1   at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY0_0_BOOTKEY0_0_Field is HAL.UInt16;

   --  Bits 15:0 of SHA-256 hash of boot key 0 (ECC)
   type BOOTKEY0_0_Register is record
      --  Read-only.
      BOOTKEY0_0     : BOOTKEY0_0_BOOTKEY0_0_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY0_0_Register use record
      BOOTKEY0_0     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY0_1_BOOTKEY0_1_Field is HAL.UInt16;

   --  Bits 31:16 of SHA-256 hash of boot key 0 (ECC)
   type BOOTKEY0_1_Register is record
      --  Read-only.
      BOOTKEY0_1     : BOOTKEY0_1_BOOTKEY0_1_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY0_1_Register use record
      BOOTKEY0_1     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY0_2_BOOTKEY0_2_Field is HAL.UInt16;

   --  Bits 47:32 of SHA-256 hash of boot key 0 (ECC)
   type BOOTKEY0_2_Register is record
      --  Read-only.
      BOOTKEY0_2     : BOOTKEY0_2_BOOTKEY0_2_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY0_2_Register use record
      BOOTKEY0_2     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY0_3_BOOTKEY0_3_Field is HAL.UInt16;

   --  Bits 63:48 of SHA-256 hash of boot key 0 (ECC)
   type BOOTKEY0_3_Register is record
      --  Read-only.
      BOOTKEY0_3     : BOOTKEY0_3_BOOTKEY0_3_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY0_3_Register use record
      BOOTKEY0_3     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY0_4_BOOTKEY0_4_Field is HAL.UInt16;

   --  Bits 79:64 of SHA-256 hash of boot key 0 (ECC)
   type BOOTKEY0_4_Register is record
      --  Read-only.
      BOOTKEY0_4     : BOOTKEY0_4_BOOTKEY0_4_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY0_4_Register use record
      BOOTKEY0_4     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY0_5_BOOTKEY0_5_Field is HAL.UInt16;

   --  Bits 95:80 of SHA-256 hash of boot key 0 (ECC)
   type BOOTKEY0_5_Register is record
      --  Read-only.
      BOOTKEY0_5     : BOOTKEY0_5_BOOTKEY0_5_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY0_5_Register use record
      BOOTKEY0_5     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY0_6_BOOTKEY0_6_Field is HAL.UInt16;

   --  Bits 111:96 of SHA-256 hash of boot key 0 (ECC)
   type BOOTKEY0_6_Register is record
      --  Read-only.
      BOOTKEY0_6     : BOOTKEY0_6_BOOTKEY0_6_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY0_6_Register use record
      BOOTKEY0_6     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY0_7_BOOTKEY0_7_Field is HAL.UInt16;

   --  Bits 127:112 of SHA-256 hash of boot key 0 (ECC)
   type BOOTKEY0_7_Register is record
      --  Read-only.
      BOOTKEY0_7     : BOOTKEY0_7_BOOTKEY0_7_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY0_7_Register use record
      BOOTKEY0_7     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY0_8_BOOTKEY0_8_Field is HAL.UInt16;

   --  Bits 143:128 of SHA-256 hash of boot key 0 (ECC)
   type BOOTKEY0_8_Register is record
      --  Read-only.
      BOOTKEY0_8     : BOOTKEY0_8_BOOTKEY0_8_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY0_8_Register use record
      BOOTKEY0_8     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY0_9_BOOTKEY0_9_Field is HAL.UInt16;

   --  Bits 159:144 of SHA-256 hash of boot key 0 (ECC)
   type BOOTKEY0_9_Register is record
      --  Read-only.
      BOOTKEY0_9     : BOOTKEY0_9_BOOTKEY0_9_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY0_9_Register use record
      BOOTKEY0_9     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY0_10_BOOTKEY0_10_Field is HAL.UInt16;

   --  Bits 175:160 of SHA-256 hash of boot key 0 (ECC)
   type BOOTKEY0_10_Register is record
      --  Read-only.
      BOOTKEY0_10    : BOOTKEY0_10_BOOTKEY0_10_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY0_10_Register use record
      BOOTKEY0_10    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY0_11_BOOTKEY0_11_Field is HAL.UInt16;

   --  Bits 191:176 of SHA-256 hash of boot key 0 (ECC)
   type BOOTKEY0_11_Register is record
      --  Read-only.
      BOOTKEY0_11    : BOOTKEY0_11_BOOTKEY0_11_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY0_11_Register use record
      BOOTKEY0_11    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY0_12_BOOTKEY0_12_Field is HAL.UInt16;

   --  Bits 207:192 of SHA-256 hash of boot key 0 (ECC)
   type BOOTKEY0_12_Register is record
      --  Read-only.
      BOOTKEY0_12    : BOOTKEY0_12_BOOTKEY0_12_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY0_12_Register use record
      BOOTKEY0_12    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY0_13_BOOTKEY0_13_Field is HAL.UInt16;

   --  Bits 223:208 of SHA-256 hash of boot key 0 (ECC)
   type BOOTKEY0_13_Register is record
      --  Read-only.
      BOOTKEY0_13    : BOOTKEY0_13_BOOTKEY0_13_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY0_13_Register use record
      BOOTKEY0_13    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY0_14_BOOTKEY0_14_Field is HAL.UInt16;

   --  Bits 239:224 of SHA-256 hash of boot key 0 (ECC)
   type BOOTKEY0_14_Register is record
      --  Read-only.
      BOOTKEY0_14    : BOOTKEY0_14_BOOTKEY0_14_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY0_14_Register use record
      BOOTKEY0_14    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY0_15_BOOTKEY0_15_Field is HAL.UInt16;

   --  Bits 255:240 of SHA-256 hash of boot key 0 (ECC)
   type BOOTKEY0_15_Register is record
      --  Read-only.
      BOOTKEY0_15    : BOOTKEY0_15_BOOTKEY0_15_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY0_15_Register use record
      BOOTKEY0_15    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY1_0_BOOTKEY1_0_Field is HAL.UInt16;

   --  Bits 15:0 of SHA-256 hash of boot key 1 (ECC)
   type BOOTKEY1_0_Register is record
      --  Read-only.
      BOOTKEY1_0     : BOOTKEY1_0_BOOTKEY1_0_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY1_0_Register use record
      BOOTKEY1_0     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY1_1_BOOTKEY1_1_Field is HAL.UInt16;

   --  Bits 31:16 of SHA-256 hash of boot key 1 (ECC)
   type BOOTKEY1_1_Register is record
      --  Read-only.
      BOOTKEY1_1     : BOOTKEY1_1_BOOTKEY1_1_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY1_1_Register use record
      BOOTKEY1_1     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY1_2_BOOTKEY1_2_Field is HAL.UInt16;

   --  Bits 47:32 of SHA-256 hash of boot key 1 (ECC)
   type BOOTKEY1_2_Register is record
      --  Read-only.
      BOOTKEY1_2     : BOOTKEY1_2_BOOTKEY1_2_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY1_2_Register use record
      BOOTKEY1_2     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY1_3_BOOTKEY1_3_Field is HAL.UInt16;

   --  Bits 63:48 of SHA-256 hash of boot key 1 (ECC)
   type BOOTKEY1_3_Register is record
      --  Read-only.
      BOOTKEY1_3     : BOOTKEY1_3_BOOTKEY1_3_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY1_3_Register use record
      BOOTKEY1_3     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY1_4_BOOTKEY1_4_Field is HAL.UInt16;

   --  Bits 79:64 of SHA-256 hash of boot key 1 (ECC)
   type BOOTKEY1_4_Register is record
      --  Read-only.
      BOOTKEY1_4     : BOOTKEY1_4_BOOTKEY1_4_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY1_4_Register use record
      BOOTKEY1_4     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY1_5_BOOTKEY1_5_Field is HAL.UInt16;

   --  Bits 95:80 of SHA-256 hash of boot key 1 (ECC)
   type BOOTKEY1_5_Register is record
      --  Read-only.
      BOOTKEY1_5     : BOOTKEY1_5_BOOTKEY1_5_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY1_5_Register use record
      BOOTKEY1_5     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY1_6_BOOTKEY1_6_Field is HAL.UInt16;

   --  Bits 111:96 of SHA-256 hash of boot key 1 (ECC)
   type BOOTKEY1_6_Register is record
      --  Read-only.
      BOOTKEY1_6     : BOOTKEY1_6_BOOTKEY1_6_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY1_6_Register use record
      BOOTKEY1_6     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY1_7_BOOTKEY1_7_Field is HAL.UInt16;

   --  Bits 127:112 of SHA-256 hash of boot key 1 (ECC)
   type BOOTKEY1_7_Register is record
      --  Read-only.
      BOOTKEY1_7     : BOOTKEY1_7_BOOTKEY1_7_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY1_7_Register use record
      BOOTKEY1_7     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY1_8_BOOTKEY1_8_Field is HAL.UInt16;

   --  Bits 143:128 of SHA-256 hash of boot key 1 (ECC)
   type BOOTKEY1_8_Register is record
      --  Read-only.
      BOOTKEY1_8     : BOOTKEY1_8_BOOTKEY1_8_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY1_8_Register use record
      BOOTKEY1_8     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY1_9_BOOTKEY1_9_Field is HAL.UInt16;

   --  Bits 159:144 of SHA-256 hash of boot key 1 (ECC)
   type BOOTKEY1_9_Register is record
      --  Read-only.
      BOOTKEY1_9     : BOOTKEY1_9_BOOTKEY1_9_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY1_9_Register use record
      BOOTKEY1_9     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY1_10_BOOTKEY1_10_Field is HAL.UInt16;

   --  Bits 175:160 of SHA-256 hash of boot key 1 (ECC)
   type BOOTKEY1_10_Register is record
      --  Read-only.
      BOOTKEY1_10    : BOOTKEY1_10_BOOTKEY1_10_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY1_10_Register use record
      BOOTKEY1_10    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY1_11_BOOTKEY1_11_Field is HAL.UInt16;

   --  Bits 191:176 of SHA-256 hash of boot key 1 (ECC)
   type BOOTKEY1_11_Register is record
      --  Read-only.
      BOOTKEY1_11    : BOOTKEY1_11_BOOTKEY1_11_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY1_11_Register use record
      BOOTKEY1_11    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY1_12_BOOTKEY1_12_Field is HAL.UInt16;

   --  Bits 207:192 of SHA-256 hash of boot key 1 (ECC)
   type BOOTKEY1_12_Register is record
      --  Read-only.
      BOOTKEY1_12    : BOOTKEY1_12_BOOTKEY1_12_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY1_12_Register use record
      BOOTKEY1_12    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY1_13_BOOTKEY1_13_Field is HAL.UInt16;

   --  Bits 223:208 of SHA-256 hash of boot key 1 (ECC)
   type BOOTKEY1_13_Register is record
      --  Read-only.
      BOOTKEY1_13    : BOOTKEY1_13_BOOTKEY1_13_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY1_13_Register use record
      BOOTKEY1_13    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY1_14_BOOTKEY1_14_Field is HAL.UInt16;

   --  Bits 239:224 of SHA-256 hash of boot key 1 (ECC)
   type BOOTKEY1_14_Register is record
      --  Read-only.
      BOOTKEY1_14    : BOOTKEY1_14_BOOTKEY1_14_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY1_14_Register use record
      BOOTKEY1_14    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY1_15_BOOTKEY1_15_Field is HAL.UInt16;

   --  Bits 255:240 of SHA-256 hash of boot key 1 (ECC)
   type BOOTKEY1_15_Register is record
      --  Read-only.
      BOOTKEY1_15    : BOOTKEY1_15_BOOTKEY1_15_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY1_15_Register use record
      BOOTKEY1_15    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY2_0_BOOTKEY2_0_Field is HAL.UInt16;

   --  Bits 15:0 of SHA-256 hash of boot key 2 (ECC)
   type BOOTKEY2_0_Register is record
      --  Read-only.
      BOOTKEY2_0     : BOOTKEY2_0_BOOTKEY2_0_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY2_0_Register use record
      BOOTKEY2_0     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY2_1_BOOTKEY2_1_Field is HAL.UInt16;

   --  Bits 31:16 of SHA-256 hash of boot key 2 (ECC)
   type BOOTKEY2_1_Register is record
      --  Read-only.
      BOOTKEY2_1     : BOOTKEY2_1_BOOTKEY2_1_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY2_1_Register use record
      BOOTKEY2_1     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY2_2_BOOTKEY2_2_Field is HAL.UInt16;

   --  Bits 47:32 of SHA-256 hash of boot key 2 (ECC)
   type BOOTKEY2_2_Register is record
      --  Read-only.
      BOOTKEY2_2     : BOOTKEY2_2_BOOTKEY2_2_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY2_2_Register use record
      BOOTKEY2_2     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY2_3_BOOTKEY2_3_Field is HAL.UInt16;

   --  Bits 63:48 of SHA-256 hash of boot key 2 (ECC)
   type BOOTKEY2_3_Register is record
      --  Read-only.
      BOOTKEY2_3     : BOOTKEY2_3_BOOTKEY2_3_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY2_3_Register use record
      BOOTKEY2_3     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY2_4_BOOTKEY2_4_Field is HAL.UInt16;

   --  Bits 79:64 of SHA-256 hash of boot key 2 (ECC)
   type BOOTKEY2_4_Register is record
      --  Read-only.
      BOOTKEY2_4     : BOOTKEY2_4_BOOTKEY2_4_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY2_4_Register use record
      BOOTKEY2_4     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY2_5_BOOTKEY2_5_Field is HAL.UInt16;

   --  Bits 95:80 of SHA-256 hash of boot key 2 (ECC)
   type BOOTKEY2_5_Register is record
      --  Read-only.
      BOOTKEY2_5     : BOOTKEY2_5_BOOTKEY2_5_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY2_5_Register use record
      BOOTKEY2_5     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY2_6_BOOTKEY2_6_Field is HAL.UInt16;

   --  Bits 111:96 of SHA-256 hash of boot key 2 (ECC)
   type BOOTKEY2_6_Register is record
      --  Read-only.
      BOOTKEY2_6     : BOOTKEY2_6_BOOTKEY2_6_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY2_6_Register use record
      BOOTKEY2_6     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY2_7_BOOTKEY2_7_Field is HAL.UInt16;

   --  Bits 127:112 of SHA-256 hash of boot key 2 (ECC)
   type BOOTKEY2_7_Register is record
      --  Read-only.
      BOOTKEY2_7     : BOOTKEY2_7_BOOTKEY2_7_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY2_7_Register use record
      BOOTKEY2_7     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY2_8_BOOTKEY2_8_Field is HAL.UInt16;

   --  Bits 143:128 of SHA-256 hash of boot key 2 (ECC)
   type BOOTKEY2_8_Register is record
      --  Read-only.
      BOOTKEY2_8     : BOOTKEY2_8_BOOTKEY2_8_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY2_8_Register use record
      BOOTKEY2_8     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY2_9_BOOTKEY2_9_Field is HAL.UInt16;

   --  Bits 159:144 of SHA-256 hash of boot key 2 (ECC)
   type BOOTKEY2_9_Register is record
      --  Read-only.
      BOOTKEY2_9     : BOOTKEY2_9_BOOTKEY2_9_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY2_9_Register use record
      BOOTKEY2_9     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY2_10_BOOTKEY2_10_Field is HAL.UInt16;

   --  Bits 175:160 of SHA-256 hash of boot key 2 (ECC)
   type BOOTKEY2_10_Register is record
      --  Read-only.
      BOOTKEY2_10    : BOOTKEY2_10_BOOTKEY2_10_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY2_10_Register use record
      BOOTKEY2_10    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY2_11_BOOTKEY2_11_Field is HAL.UInt16;

   --  Bits 191:176 of SHA-256 hash of boot key 2 (ECC)
   type BOOTKEY2_11_Register is record
      --  Read-only.
      BOOTKEY2_11    : BOOTKEY2_11_BOOTKEY2_11_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY2_11_Register use record
      BOOTKEY2_11    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY2_12_BOOTKEY2_12_Field is HAL.UInt16;

   --  Bits 207:192 of SHA-256 hash of boot key 2 (ECC)
   type BOOTKEY2_12_Register is record
      --  Read-only.
      BOOTKEY2_12    : BOOTKEY2_12_BOOTKEY2_12_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY2_12_Register use record
      BOOTKEY2_12    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY2_13_BOOTKEY2_13_Field is HAL.UInt16;

   --  Bits 223:208 of SHA-256 hash of boot key 2 (ECC)
   type BOOTKEY2_13_Register is record
      --  Read-only.
      BOOTKEY2_13    : BOOTKEY2_13_BOOTKEY2_13_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY2_13_Register use record
      BOOTKEY2_13    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY2_14_BOOTKEY2_14_Field is HAL.UInt16;

   --  Bits 239:224 of SHA-256 hash of boot key 2 (ECC)
   type BOOTKEY2_14_Register is record
      --  Read-only.
      BOOTKEY2_14    : BOOTKEY2_14_BOOTKEY2_14_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY2_14_Register use record
      BOOTKEY2_14    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY2_15_BOOTKEY2_15_Field is HAL.UInt16;

   --  Bits 255:240 of SHA-256 hash of boot key 2 (ECC)
   type BOOTKEY2_15_Register is record
      --  Read-only.
      BOOTKEY2_15    : BOOTKEY2_15_BOOTKEY2_15_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY2_15_Register use record
      BOOTKEY2_15    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY3_0_BOOTKEY3_0_Field is HAL.UInt16;

   --  Bits 15:0 of SHA-256 hash of boot key 3 (ECC)
   type BOOTKEY3_0_Register is record
      --  Read-only.
      BOOTKEY3_0     : BOOTKEY3_0_BOOTKEY3_0_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY3_0_Register use record
      BOOTKEY3_0     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY3_1_BOOTKEY3_1_Field is HAL.UInt16;

   --  Bits 31:16 of SHA-256 hash of boot key 3 (ECC)
   type BOOTKEY3_1_Register is record
      --  Read-only.
      BOOTKEY3_1     : BOOTKEY3_1_BOOTKEY3_1_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY3_1_Register use record
      BOOTKEY3_1     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY3_2_BOOTKEY3_2_Field is HAL.UInt16;

   --  Bits 47:32 of SHA-256 hash of boot key 3 (ECC)
   type BOOTKEY3_2_Register is record
      --  Read-only.
      BOOTKEY3_2     : BOOTKEY3_2_BOOTKEY3_2_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY3_2_Register use record
      BOOTKEY3_2     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY3_3_BOOTKEY3_3_Field is HAL.UInt16;

   --  Bits 63:48 of SHA-256 hash of boot key 3 (ECC)
   type BOOTKEY3_3_Register is record
      --  Read-only.
      BOOTKEY3_3     : BOOTKEY3_3_BOOTKEY3_3_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY3_3_Register use record
      BOOTKEY3_3     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY3_4_BOOTKEY3_4_Field is HAL.UInt16;

   --  Bits 79:64 of SHA-256 hash of boot key 3 (ECC)
   type BOOTKEY3_4_Register is record
      --  Read-only.
      BOOTKEY3_4     : BOOTKEY3_4_BOOTKEY3_4_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY3_4_Register use record
      BOOTKEY3_4     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY3_5_BOOTKEY3_5_Field is HAL.UInt16;

   --  Bits 95:80 of SHA-256 hash of boot key 3 (ECC)
   type BOOTKEY3_5_Register is record
      --  Read-only.
      BOOTKEY3_5     : BOOTKEY3_5_BOOTKEY3_5_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY3_5_Register use record
      BOOTKEY3_5     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY3_6_BOOTKEY3_6_Field is HAL.UInt16;

   --  Bits 111:96 of SHA-256 hash of boot key 3 (ECC)
   type BOOTKEY3_6_Register is record
      --  Read-only.
      BOOTKEY3_6     : BOOTKEY3_6_BOOTKEY3_6_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY3_6_Register use record
      BOOTKEY3_6     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY3_7_BOOTKEY3_7_Field is HAL.UInt16;

   --  Bits 127:112 of SHA-256 hash of boot key 3 (ECC)
   type BOOTKEY3_7_Register is record
      --  Read-only.
      BOOTKEY3_7     : BOOTKEY3_7_BOOTKEY3_7_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY3_7_Register use record
      BOOTKEY3_7     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY3_8_BOOTKEY3_8_Field is HAL.UInt16;

   --  Bits 143:128 of SHA-256 hash of boot key 3 (ECC)
   type BOOTKEY3_8_Register is record
      --  Read-only.
      BOOTKEY3_8     : BOOTKEY3_8_BOOTKEY3_8_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY3_8_Register use record
      BOOTKEY3_8     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY3_9_BOOTKEY3_9_Field is HAL.UInt16;

   --  Bits 159:144 of SHA-256 hash of boot key 3 (ECC)
   type BOOTKEY3_9_Register is record
      --  Read-only.
      BOOTKEY3_9     : BOOTKEY3_9_BOOTKEY3_9_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY3_9_Register use record
      BOOTKEY3_9     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY3_10_BOOTKEY3_10_Field is HAL.UInt16;

   --  Bits 175:160 of SHA-256 hash of boot key 3 (ECC)
   type BOOTKEY3_10_Register is record
      --  Read-only.
      BOOTKEY3_10    : BOOTKEY3_10_BOOTKEY3_10_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY3_10_Register use record
      BOOTKEY3_10    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY3_11_BOOTKEY3_11_Field is HAL.UInt16;

   --  Bits 191:176 of SHA-256 hash of boot key 3 (ECC)
   type BOOTKEY3_11_Register is record
      --  Read-only.
      BOOTKEY3_11    : BOOTKEY3_11_BOOTKEY3_11_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY3_11_Register use record
      BOOTKEY3_11    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY3_12_BOOTKEY3_12_Field is HAL.UInt16;

   --  Bits 207:192 of SHA-256 hash of boot key 3 (ECC)
   type BOOTKEY3_12_Register is record
      --  Read-only.
      BOOTKEY3_12    : BOOTKEY3_12_BOOTKEY3_12_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY3_12_Register use record
      BOOTKEY3_12    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY3_13_BOOTKEY3_13_Field is HAL.UInt16;

   --  Bits 223:208 of SHA-256 hash of boot key 3 (ECC)
   type BOOTKEY3_13_Register is record
      --  Read-only.
      BOOTKEY3_13    : BOOTKEY3_13_BOOTKEY3_13_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY3_13_Register use record
      BOOTKEY3_13    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY3_14_BOOTKEY3_14_Field is HAL.UInt16;

   --  Bits 239:224 of SHA-256 hash of boot key 3 (ECC)
   type BOOTKEY3_14_Register is record
      --  Read-only.
      BOOTKEY3_14    : BOOTKEY3_14_BOOTKEY3_14_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY3_14_Register use record
      BOOTKEY3_14    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BOOTKEY3_15_BOOTKEY3_15_Field is HAL.UInt16;

   --  Bits 255:240 of SHA-256 hash of boot key 3 (ECC)
   type BOOTKEY3_15_Register is record
      --  Read-only.
      BOOTKEY3_15    : BOOTKEY3_15_BOOTKEY3_15_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTKEY3_15_Register use record
      BOOTKEY3_15    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY1_0_KEY1_0_Field is HAL.UInt16;

   --  Bits 15:0 of OTP access key 1 (ECC)
   type KEY1_0_Register is record
      --  Read-only.
      KEY1_0         : KEY1_0_KEY1_0_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY1_0_Register use record
      KEY1_0         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY1_1_KEY1_1_Field is HAL.UInt16;

   --  Bits 31:16 of OTP access key 1 (ECC)
   type KEY1_1_Register is record
      --  Read-only.
      KEY1_1         : KEY1_1_KEY1_1_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY1_1_Register use record
      KEY1_1         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY1_2_KEY1_2_Field is HAL.UInt16;

   --  Bits 47:32 of OTP access key 1 (ECC)
   type KEY1_2_Register is record
      --  Read-only.
      KEY1_2         : KEY1_2_KEY1_2_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY1_2_Register use record
      KEY1_2         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY1_3_KEY1_3_Field is HAL.UInt16;

   --  Bits 63:48 of OTP access key 1 (ECC)
   type KEY1_3_Register is record
      --  Read-only.
      KEY1_3         : KEY1_3_KEY1_3_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY1_3_Register use record
      KEY1_3         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY1_4_KEY1_4_Field is HAL.UInt16;

   --  Bits 79:64 of OTP access key 1 (ECC)
   type KEY1_4_Register is record
      --  Read-only.
      KEY1_4         : KEY1_4_KEY1_4_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY1_4_Register use record
      KEY1_4         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY1_5_KEY1_5_Field is HAL.UInt16;

   --  Bits 95:80 of OTP access key 1 (ECC)
   type KEY1_5_Register is record
      --  Read-only.
      KEY1_5         : KEY1_5_KEY1_5_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY1_5_Register use record
      KEY1_5         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY1_6_KEY1_6_Field is HAL.UInt16;

   --  Bits 111:96 of OTP access key 1 (ECC)
   type KEY1_6_Register is record
      --  Read-only.
      KEY1_6         : KEY1_6_KEY1_6_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY1_6_Register use record
      KEY1_6         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY1_7_KEY1_7_Field is HAL.UInt16;

   --  Bits 127:112 of OTP access key 1 (ECC)
   type KEY1_7_Register is record
      --  Read-only.
      KEY1_7         : KEY1_7_KEY1_7_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY1_7_Register use record
      KEY1_7         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY2_0_KEY2_0_Field is HAL.UInt16;

   --  Bits 15:0 of OTP access key 2 (ECC)
   type KEY2_0_Register is record
      --  Read-only.
      KEY2_0         : KEY2_0_KEY2_0_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY2_0_Register use record
      KEY2_0         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY2_1_KEY2_1_Field is HAL.UInt16;

   --  Bits 31:16 of OTP access key 2 (ECC)
   type KEY2_1_Register is record
      --  Read-only.
      KEY2_1         : KEY2_1_KEY2_1_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY2_1_Register use record
      KEY2_1         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY2_2_KEY2_2_Field is HAL.UInt16;

   --  Bits 47:32 of OTP access key 2 (ECC)
   type KEY2_2_Register is record
      --  Read-only.
      KEY2_2         : KEY2_2_KEY2_2_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY2_2_Register use record
      KEY2_2         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY2_3_KEY2_3_Field is HAL.UInt16;

   --  Bits 63:48 of OTP access key 2 (ECC)
   type KEY2_3_Register is record
      --  Read-only.
      KEY2_3         : KEY2_3_KEY2_3_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY2_3_Register use record
      KEY2_3         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY2_4_KEY2_4_Field is HAL.UInt16;

   --  Bits 79:64 of OTP access key 2 (ECC)
   type KEY2_4_Register is record
      --  Read-only.
      KEY2_4         : KEY2_4_KEY2_4_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY2_4_Register use record
      KEY2_4         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY2_5_KEY2_5_Field is HAL.UInt16;

   --  Bits 95:80 of OTP access key 2 (ECC)
   type KEY2_5_Register is record
      --  Read-only.
      KEY2_5         : KEY2_5_KEY2_5_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY2_5_Register use record
      KEY2_5         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY2_6_KEY2_6_Field is HAL.UInt16;

   --  Bits 111:96 of OTP access key 2 (ECC)
   type KEY2_6_Register is record
      --  Read-only.
      KEY2_6         : KEY2_6_KEY2_6_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY2_6_Register use record
      KEY2_6         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY2_7_KEY2_7_Field is HAL.UInt16;

   --  Bits 127:112 of OTP access key 2 (ECC)
   type KEY2_7_Register is record
      --  Read-only.
      KEY2_7         : KEY2_7_KEY2_7_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY2_7_Register use record
      KEY2_7         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY3_0_KEY3_0_Field is HAL.UInt16;

   --  Bits 15:0 of OTP access key 3 (ECC)
   type KEY3_0_Register is record
      --  Read-only.
      KEY3_0         : KEY3_0_KEY3_0_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY3_0_Register use record
      KEY3_0         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY3_1_KEY3_1_Field is HAL.UInt16;

   --  Bits 31:16 of OTP access key 3 (ECC)
   type KEY3_1_Register is record
      --  Read-only.
      KEY3_1         : KEY3_1_KEY3_1_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY3_1_Register use record
      KEY3_1         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY3_2_KEY3_2_Field is HAL.UInt16;

   --  Bits 47:32 of OTP access key 3 (ECC)
   type KEY3_2_Register is record
      --  Read-only.
      KEY3_2         : KEY3_2_KEY3_2_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY3_2_Register use record
      KEY3_2         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY3_3_KEY3_3_Field is HAL.UInt16;

   --  Bits 63:48 of OTP access key 3 (ECC)
   type KEY3_3_Register is record
      --  Read-only.
      KEY3_3         : KEY3_3_KEY3_3_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY3_3_Register use record
      KEY3_3         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY3_4_KEY3_4_Field is HAL.UInt16;

   --  Bits 79:64 of OTP access key 3 (ECC)
   type KEY3_4_Register is record
      --  Read-only.
      KEY3_4         : KEY3_4_KEY3_4_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY3_4_Register use record
      KEY3_4         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY3_5_KEY3_5_Field is HAL.UInt16;

   --  Bits 95:80 of OTP access key 3 (ECC)
   type KEY3_5_Register is record
      --  Read-only.
      KEY3_5         : KEY3_5_KEY3_5_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY3_5_Register use record
      KEY3_5         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY3_6_KEY3_6_Field is HAL.UInt16;

   --  Bits 111:96 of OTP access key 3 (ECC)
   type KEY3_6_Register is record
      --  Read-only.
      KEY3_6         : KEY3_6_KEY3_6_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY3_6_Register use record
      KEY3_6         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY3_7_KEY3_7_Field is HAL.UInt16;

   --  Bits 127:112 of OTP access key 3 (ECC)
   type KEY3_7_Register is record
      --  Read-only.
      KEY3_7         : KEY3_7_KEY3_7_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY3_7_Register use record
      KEY3_7         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY4_0_KEY4_0_Field is HAL.UInt16;

   --  Bits 15:0 of OTP access key 4 (ECC)
   type KEY4_0_Register is record
      --  Read-only.
      KEY4_0         : KEY4_0_KEY4_0_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY4_0_Register use record
      KEY4_0         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY4_1_KEY4_1_Field is HAL.UInt16;

   --  Bits 31:16 of OTP access key 4 (ECC)
   type KEY4_1_Register is record
      --  Read-only.
      KEY4_1         : KEY4_1_KEY4_1_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY4_1_Register use record
      KEY4_1         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY4_2_KEY4_2_Field is HAL.UInt16;

   --  Bits 47:32 of OTP access key 4 (ECC)
   type KEY4_2_Register is record
      --  Read-only.
      KEY4_2         : KEY4_2_KEY4_2_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY4_2_Register use record
      KEY4_2         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY4_3_KEY4_3_Field is HAL.UInt16;

   --  Bits 63:48 of OTP access key 4 (ECC)
   type KEY4_3_Register is record
      --  Read-only.
      KEY4_3         : KEY4_3_KEY4_3_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY4_3_Register use record
      KEY4_3         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY4_4_KEY4_4_Field is HAL.UInt16;

   --  Bits 79:64 of OTP access key 4 (ECC)
   type KEY4_4_Register is record
      --  Read-only.
      KEY4_4         : KEY4_4_KEY4_4_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY4_4_Register use record
      KEY4_4         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY4_5_KEY4_5_Field is HAL.UInt16;

   --  Bits 95:80 of OTP access key 4 (ECC)
   type KEY4_5_Register is record
      --  Read-only.
      KEY4_5         : KEY4_5_KEY4_5_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY4_5_Register use record
      KEY4_5         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY4_6_KEY4_6_Field is HAL.UInt16;

   --  Bits 111:96 of OTP access key 4 (ECC)
   type KEY4_6_Register is record
      --  Read-only.
      KEY4_6         : KEY4_6_KEY4_6_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY4_6_Register use record
      KEY4_6         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY4_7_KEY4_7_Field is HAL.UInt16;

   --  Bits 127:112 of OTP access key 4 (ECC)
   type KEY4_7_Register is record
      --  Read-only.
      KEY4_7         : KEY4_7_KEY4_7_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY4_7_Register use record
      KEY4_7         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY5_0_KEY5_0_Field is HAL.UInt16;

   --  Bits 15:0 of OTP access key 5 (ECC)
   type KEY5_0_Register is record
      --  Read-only.
      KEY5_0         : KEY5_0_KEY5_0_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY5_0_Register use record
      KEY5_0         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY5_1_KEY5_1_Field is HAL.UInt16;

   --  Bits 31:16 of OTP access key 5 (ECC)
   type KEY5_1_Register is record
      --  Read-only.
      KEY5_1         : KEY5_1_KEY5_1_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY5_1_Register use record
      KEY5_1         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY5_2_KEY5_2_Field is HAL.UInt16;

   --  Bits 47:32 of OTP access key 5 (ECC)
   type KEY5_2_Register is record
      --  Read-only.
      KEY5_2         : KEY5_2_KEY5_2_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY5_2_Register use record
      KEY5_2         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY5_3_KEY5_3_Field is HAL.UInt16;

   --  Bits 63:48 of OTP access key 5 (ECC)
   type KEY5_3_Register is record
      --  Read-only.
      KEY5_3         : KEY5_3_KEY5_3_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY5_3_Register use record
      KEY5_3         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY5_4_KEY5_4_Field is HAL.UInt16;

   --  Bits 79:64 of OTP access key 5 (ECC)
   type KEY5_4_Register is record
      --  Read-only.
      KEY5_4         : KEY5_4_KEY5_4_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY5_4_Register use record
      KEY5_4         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY5_5_KEY5_5_Field is HAL.UInt16;

   --  Bits 95:80 of OTP access key 5 (ECC)
   type KEY5_5_Register is record
      --  Read-only.
      KEY5_5         : KEY5_5_KEY5_5_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY5_5_Register use record
      KEY5_5         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY5_6_KEY5_6_Field is HAL.UInt16;

   --  Bits 111:96 of OTP access key 5 (ECC)
   type KEY5_6_Register is record
      --  Read-only.
      KEY5_6         : KEY5_6_KEY5_6_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY5_6_Register use record
      KEY5_6         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY5_7_KEY5_7_Field is HAL.UInt16;

   --  Bits 127:112 of OTP access key 5 (ECC)
   type KEY5_7_Register is record
      --  Read-only.
      KEY5_7         : KEY5_7_KEY5_7_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY5_7_Register use record
      KEY5_7         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY6_0_KEY6_0_Field is HAL.UInt16;

   --  Bits 15:0 of OTP access key 6 (ECC)
   type KEY6_0_Register is record
      --  Read-only.
      KEY6_0         : KEY6_0_KEY6_0_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY6_0_Register use record
      KEY6_0         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY6_1_KEY6_1_Field is HAL.UInt16;

   --  Bits 31:16 of OTP access key 6 (ECC)
   type KEY6_1_Register is record
      --  Read-only.
      KEY6_1         : KEY6_1_KEY6_1_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY6_1_Register use record
      KEY6_1         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY6_2_KEY6_2_Field is HAL.UInt16;

   --  Bits 47:32 of OTP access key 6 (ECC)
   type KEY6_2_Register is record
      --  Read-only.
      KEY6_2         : KEY6_2_KEY6_2_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY6_2_Register use record
      KEY6_2         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY6_3_KEY6_3_Field is HAL.UInt16;

   --  Bits 63:48 of OTP access key 6 (ECC)
   type KEY6_3_Register is record
      --  Read-only.
      KEY6_3         : KEY6_3_KEY6_3_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY6_3_Register use record
      KEY6_3         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY6_4_KEY6_4_Field is HAL.UInt16;

   --  Bits 79:64 of OTP access key 6 (ECC)
   type KEY6_4_Register is record
      --  Read-only.
      KEY6_4         : KEY6_4_KEY6_4_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY6_4_Register use record
      KEY6_4         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY6_5_KEY6_5_Field is HAL.UInt16;

   --  Bits 95:80 of OTP access key 6 (ECC)
   type KEY6_5_Register is record
      --  Read-only.
      KEY6_5         : KEY6_5_KEY6_5_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY6_5_Register use record
      KEY6_5         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY6_6_KEY6_6_Field is HAL.UInt16;

   --  Bits 111:96 of OTP access key 6 (ECC)
   type KEY6_6_Register is record
      --  Read-only.
      KEY6_6         : KEY6_6_KEY6_6_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY6_6_Register use record
      KEY6_6         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype KEY6_7_KEY6_7_Field is HAL.UInt16;

   --  Bits 127:112 of OTP access key 6 (ECC)
   type KEY6_7_Register is record
      --  Read-only.
      KEY6_7         : KEY6_7_KEY6_7_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY6_7_Register use record
      KEY6_7         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Valid flag for key 1. Once the valid flag is set, the key can no longer
   --  be read or written, and becomes a valid fixed key for protecting OTP
   --  pages.
   type KEY1_VALID_Register is record
      --  Read-only.
      VALID          : Boolean;
      --  unspecified
      Reserved_1_7   : HAL.UInt7;
      --  Read-only. Redundant copy of VALID, with 3-way majority vote
      VALID_R1       : Boolean;
      --  unspecified
      Reserved_9_15  : HAL.UInt7;
      --  Read-only. Redundant copy of VALID, with 3-way majority vote
      VALID_R2       : Boolean;
      --  unspecified
      Reserved_17_31 : HAL.UInt15;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY1_VALID_Register use record
      VALID          at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      VALID_R1       at 0 range 8 .. 8;
      Reserved_9_15  at 0 range 9 .. 15;
      VALID_R2       at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   --  Valid flag for key 2. Once the valid flag is set, the key can no longer
   --  be read or written, and becomes a valid fixed key for protecting OTP
   --  pages.
   type KEY2_VALID_Register is record
      --  Read-only.
      VALID          : Boolean;
      --  unspecified
      Reserved_1_7   : HAL.UInt7;
      --  Read-only. Redundant copy of VALID, with 3-way majority vote
      VALID_R1       : Boolean;
      --  unspecified
      Reserved_9_15  : HAL.UInt7;
      --  Read-only. Redundant copy of VALID, with 3-way majority vote
      VALID_R2       : Boolean;
      --  unspecified
      Reserved_17_31 : HAL.UInt15;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY2_VALID_Register use record
      VALID          at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      VALID_R1       at 0 range 8 .. 8;
      Reserved_9_15  at 0 range 9 .. 15;
      VALID_R2       at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   --  Valid flag for key 3. Once the valid flag is set, the key can no longer
   --  be read or written, and becomes a valid fixed key for protecting OTP
   --  pages.
   type KEY3_VALID_Register is record
      --  Read-only.
      VALID          : Boolean;
      --  unspecified
      Reserved_1_7   : HAL.UInt7;
      --  Read-only. Redundant copy of VALID, with 3-way majority vote
      VALID_R1       : Boolean;
      --  unspecified
      Reserved_9_15  : HAL.UInt7;
      --  Read-only. Redundant copy of VALID, with 3-way majority vote
      VALID_R2       : Boolean;
      --  unspecified
      Reserved_17_31 : HAL.UInt15;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY3_VALID_Register use record
      VALID          at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      VALID_R1       at 0 range 8 .. 8;
      Reserved_9_15  at 0 range 9 .. 15;
      VALID_R2       at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   --  Valid flag for key 4. Once the valid flag is set, the key can no longer
   --  be read or written, and becomes a valid fixed key for protecting OTP
   --  pages.
   type KEY4_VALID_Register is record
      --  Read-only.
      VALID          : Boolean;
      --  unspecified
      Reserved_1_7   : HAL.UInt7;
      --  Read-only. Redundant copy of VALID, with 3-way majority vote
      VALID_R1       : Boolean;
      --  unspecified
      Reserved_9_15  : HAL.UInt7;
      --  Read-only. Redundant copy of VALID, with 3-way majority vote
      VALID_R2       : Boolean;
      --  unspecified
      Reserved_17_31 : HAL.UInt15;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY4_VALID_Register use record
      VALID          at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      VALID_R1       at 0 range 8 .. 8;
      Reserved_9_15  at 0 range 9 .. 15;
      VALID_R2       at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   --  Valid flag for key 5. Once the valid flag is set, the key can no longer
   --  be read or written, and becomes a valid fixed key for protecting OTP
   --  pages.
   type KEY5_VALID_Register is record
      --  Read-only.
      VALID          : Boolean;
      --  unspecified
      Reserved_1_7   : HAL.UInt7;
      --  Read-only. Redundant copy of VALID, with 3-way majority vote
      VALID_R1       : Boolean;
      --  unspecified
      Reserved_9_15  : HAL.UInt7;
      --  Read-only. Redundant copy of VALID, with 3-way majority vote
      VALID_R2       : Boolean;
      --  unspecified
      Reserved_17_31 : HAL.UInt15;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY5_VALID_Register use record
      VALID          at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      VALID_R1       at 0 range 8 .. 8;
      Reserved_9_15  at 0 range 9 .. 15;
      VALID_R2       at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   --  Valid flag for key 6. Once the valid flag is set, the key can no longer
   --  be read or written, and becomes a valid fixed key for protecting OTP
   --  pages.
   type KEY6_VALID_Register is record
      --  Read-only.
      VALID          : Boolean;
      --  unspecified
      Reserved_1_7   : HAL.UInt7;
      --  Read-only. Redundant copy of VALID, with 3-way majority vote
      VALID_R1       : Boolean;
      --  unspecified
      Reserved_9_15  : HAL.UInt7;
      --  Read-only. Redundant copy of VALID, with 3-way majority vote
      VALID_R2       : Boolean;
      --  unspecified
      Reserved_17_31 : HAL.UInt15;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY6_VALID_Register use record
      VALID          at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      VALID_R1       at 0 range 8 .. 8;
      Reserved_9_15  at 0 range 9 .. 15;
      VALID_R2       at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype PAGE0_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE0_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE0_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE0_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE0_LOCK0_R array element
   subtype PAGE0_LOCK0_R_Element is HAL.UInt8;

   --  PAGE0_LOCK0_R array
   type PAGE0_LOCK0_R_Field_Array is array (1 .. 2) of PAGE0_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE0_LOCK0_R
   type PAGE0_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE0_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE0_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 0 (rows 0x0 through 0x3f). Locks are
   --  stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE0_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE0_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE0_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE0_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE0_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE0_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE0_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE0_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE0_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE0_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE0_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE0_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE0_LOCK1_R array element
   subtype PAGE0_LOCK1_R_Element is HAL.UInt8;

   --  PAGE0_LOCK1_R array
   type PAGE0_LOCK1_R_Field_Array is array (1 .. 2) of PAGE0_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE0_LOCK1_R
   type PAGE0_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE0_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE0_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 0 (rows 0x0 through 0x3f). Locks are
   --  stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE0_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE0_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE0_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE0_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE0_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE0_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE1_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE1_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE1_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE1_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE1_LOCK0_R array element
   subtype PAGE1_LOCK0_R_Element is HAL.UInt8;

   --  PAGE1_LOCK0_R array
   type PAGE1_LOCK0_R_Field_Array is array (1 .. 2) of PAGE1_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE1_LOCK0_R
   type PAGE1_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE1_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE1_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 1 (rows 0x40 through 0x7f). Locks are
   --  stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE1_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE1_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE1_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE1_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE1_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE1_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE1_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE1_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE1_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE1_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE1_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE1_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE1_LOCK1_R array element
   subtype PAGE1_LOCK1_R_Element is HAL.UInt8;

   --  PAGE1_LOCK1_R array
   type PAGE1_LOCK1_R_Field_Array is array (1 .. 2) of PAGE1_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE1_LOCK1_R
   type PAGE1_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE1_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE1_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 1 (rows 0x40 through 0x7f). Locks are
   --  stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE1_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE1_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE1_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE1_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE1_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE1_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE2_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE2_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE2_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE2_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE2_LOCK0_R array element
   subtype PAGE2_LOCK0_R_Element is HAL.UInt8;

   --  PAGE2_LOCK0_R array
   type PAGE2_LOCK0_R_Field_Array is array (1 .. 2) of PAGE2_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE2_LOCK0_R
   type PAGE2_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE2_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE2_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 2 (rows 0x80 through 0xbf). Locks are
   --  stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE2_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE2_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE2_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE2_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE2_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE2_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE2_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE2_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE2_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE2_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE2_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE2_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE2_LOCK1_R array element
   subtype PAGE2_LOCK1_R_Element is HAL.UInt8;

   --  PAGE2_LOCK1_R array
   type PAGE2_LOCK1_R_Field_Array is array (1 .. 2) of PAGE2_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE2_LOCK1_R
   type PAGE2_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE2_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE2_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 2 (rows 0x80 through 0xbf). Locks are
   --  stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE2_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE2_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE2_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE2_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE2_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE2_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE3_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE3_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE3_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE3_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE3_LOCK0_R array element
   subtype PAGE3_LOCK0_R_Element is HAL.UInt8;

   --  PAGE3_LOCK0_R array
   type PAGE3_LOCK0_R_Field_Array is array (1 .. 2) of PAGE3_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE3_LOCK0_R
   type PAGE3_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE3_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE3_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 3 (rows 0xc0 through 0xff). Locks are
   --  stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE3_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE3_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE3_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE3_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE3_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE3_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE3_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE3_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE3_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE3_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE3_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE3_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE3_LOCK1_R array element
   subtype PAGE3_LOCK1_R_Element is HAL.UInt8;

   --  PAGE3_LOCK1_R array
   type PAGE3_LOCK1_R_Field_Array is array (1 .. 2) of PAGE3_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE3_LOCK1_R
   type PAGE3_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE3_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE3_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 3 (rows 0xc0 through 0xff). Locks are
   --  stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE3_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE3_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE3_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE3_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE3_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE3_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE4_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE4_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE4_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE4_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE4_LOCK0_R array element
   subtype PAGE4_LOCK0_R_Element is HAL.UInt8;

   --  PAGE4_LOCK0_R array
   type PAGE4_LOCK0_R_Field_Array is array (1 .. 2) of PAGE4_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE4_LOCK0_R
   type PAGE4_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE4_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE4_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 4 (rows 0x100 through 0x13f). Locks are
   --  stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE4_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE4_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE4_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE4_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE4_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE4_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE4_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE4_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE4_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE4_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE4_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE4_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE4_LOCK1_R array element
   subtype PAGE4_LOCK1_R_Element is HAL.UInt8;

   --  PAGE4_LOCK1_R array
   type PAGE4_LOCK1_R_Field_Array is array (1 .. 2) of PAGE4_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE4_LOCK1_R
   type PAGE4_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE4_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE4_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 4 (rows 0x100 through 0x13f). Locks are
   --  stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE4_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE4_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE4_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE4_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE4_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE4_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE5_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE5_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE5_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE5_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE5_LOCK0_R array element
   subtype PAGE5_LOCK0_R_Element is HAL.UInt8;

   --  PAGE5_LOCK0_R array
   type PAGE5_LOCK0_R_Field_Array is array (1 .. 2) of PAGE5_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE5_LOCK0_R
   type PAGE5_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE5_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE5_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 5 (rows 0x140 through 0x17f). Locks are
   --  stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE5_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE5_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE5_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE5_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE5_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE5_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE5_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE5_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE5_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE5_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE5_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE5_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE5_LOCK1_R array element
   subtype PAGE5_LOCK1_R_Element is HAL.UInt8;

   --  PAGE5_LOCK1_R array
   type PAGE5_LOCK1_R_Field_Array is array (1 .. 2) of PAGE5_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE5_LOCK1_R
   type PAGE5_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE5_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE5_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 5 (rows 0x140 through 0x17f). Locks are
   --  stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE5_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE5_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE5_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE5_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE5_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE5_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE6_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE6_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE6_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE6_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE6_LOCK0_R array element
   subtype PAGE6_LOCK0_R_Element is HAL.UInt8;

   --  PAGE6_LOCK0_R array
   type PAGE6_LOCK0_R_Field_Array is array (1 .. 2) of PAGE6_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE6_LOCK0_R
   type PAGE6_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE6_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE6_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 6 (rows 0x180 through 0x1bf). Locks are
   --  stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE6_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE6_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE6_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE6_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE6_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE6_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE6_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE6_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE6_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE6_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE6_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE6_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE6_LOCK1_R array element
   subtype PAGE6_LOCK1_R_Element is HAL.UInt8;

   --  PAGE6_LOCK1_R array
   type PAGE6_LOCK1_R_Field_Array is array (1 .. 2) of PAGE6_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE6_LOCK1_R
   type PAGE6_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE6_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE6_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 6 (rows 0x180 through 0x1bf). Locks are
   --  stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE6_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE6_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE6_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE6_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE6_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE6_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE7_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE7_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE7_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE7_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE7_LOCK0_R array element
   subtype PAGE7_LOCK0_R_Element is HAL.UInt8;

   --  PAGE7_LOCK0_R array
   type PAGE7_LOCK0_R_Field_Array is array (1 .. 2) of PAGE7_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE7_LOCK0_R
   type PAGE7_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE7_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE7_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 7 (rows 0x1c0 through 0x1ff). Locks are
   --  stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE7_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE7_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE7_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE7_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE7_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE7_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE7_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE7_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE7_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE7_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE7_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE7_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE7_LOCK1_R array element
   subtype PAGE7_LOCK1_R_Element is HAL.UInt8;

   --  PAGE7_LOCK1_R array
   type PAGE7_LOCK1_R_Field_Array is array (1 .. 2) of PAGE7_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE7_LOCK1_R
   type PAGE7_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE7_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE7_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 7 (rows 0x1c0 through 0x1ff). Locks are
   --  stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE7_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE7_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE7_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE7_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE7_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE7_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE8_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE8_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE8_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE8_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE8_LOCK0_R array element
   subtype PAGE8_LOCK0_R_Element is HAL.UInt8;

   --  PAGE8_LOCK0_R array
   type PAGE8_LOCK0_R_Field_Array is array (1 .. 2) of PAGE8_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE8_LOCK0_R
   type PAGE8_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE8_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE8_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 8 (rows 0x200 through 0x23f). Locks are
   --  stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE8_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE8_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE8_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE8_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE8_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE8_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE8_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE8_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE8_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE8_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE8_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE8_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE8_LOCK1_R array element
   subtype PAGE8_LOCK1_R_Element is HAL.UInt8;

   --  PAGE8_LOCK1_R array
   type PAGE8_LOCK1_R_Field_Array is array (1 .. 2) of PAGE8_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE8_LOCK1_R
   type PAGE8_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE8_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE8_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 8 (rows 0x200 through 0x23f). Locks are
   --  stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE8_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE8_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE8_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE8_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE8_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE8_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE9_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE9_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE9_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE9_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE9_LOCK0_R array element
   subtype PAGE9_LOCK0_R_Element is HAL.UInt8;

   --  PAGE9_LOCK0_R array
   type PAGE9_LOCK0_R_Field_Array is array (1 .. 2) of PAGE9_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE9_LOCK0_R
   type PAGE9_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE9_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE9_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 9 (rows 0x240 through 0x27f). Locks are
   --  stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE9_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE9_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE9_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE9_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE9_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE9_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE9_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE9_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE9_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE9_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE9_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE9_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE9_LOCK1_R array element
   subtype PAGE9_LOCK1_R_Element is HAL.UInt8;

   --  PAGE9_LOCK1_R array
   type PAGE9_LOCK1_R_Field_Array is array (1 .. 2) of PAGE9_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE9_LOCK1_R
   type PAGE9_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE9_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE9_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 9 (rows 0x240 through 0x27f). Locks are
   --  stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE9_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE9_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE9_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE9_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE9_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE9_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE10_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE10_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE10_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE10_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE10_LOCK0_R array element
   subtype PAGE10_LOCK0_R_Element is HAL.UInt8;

   --  PAGE10_LOCK0_R array
   type PAGE10_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE10_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE10_LOCK0_R
   type PAGE10_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE10_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE10_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 10 (rows 0x280 through 0x2bf). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE10_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE10_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE10_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE10_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE10_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE10_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE10_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE10_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE10_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE10_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE10_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE10_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE10_LOCK1_R array element
   subtype PAGE10_LOCK1_R_Element is HAL.UInt8;

   --  PAGE10_LOCK1_R array
   type PAGE10_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE10_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE10_LOCK1_R
   type PAGE10_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE10_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE10_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 10 (rows 0x280 through 0x2bf). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE10_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE10_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE10_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE10_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE10_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE10_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE11_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE11_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE11_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE11_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE11_LOCK0_R array element
   subtype PAGE11_LOCK0_R_Element is HAL.UInt8;

   --  PAGE11_LOCK0_R array
   type PAGE11_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE11_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE11_LOCK0_R
   type PAGE11_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE11_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE11_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 11 (rows 0x2c0 through 0x2ff). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE11_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE11_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE11_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE11_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE11_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE11_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE11_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE11_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE11_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE11_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE11_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE11_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE11_LOCK1_R array element
   subtype PAGE11_LOCK1_R_Element is HAL.UInt8;

   --  PAGE11_LOCK1_R array
   type PAGE11_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE11_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE11_LOCK1_R
   type PAGE11_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE11_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE11_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 11 (rows 0x2c0 through 0x2ff). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE11_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE11_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE11_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE11_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE11_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE11_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE12_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE12_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE12_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE12_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE12_LOCK0_R array element
   subtype PAGE12_LOCK0_R_Element is HAL.UInt8;

   --  PAGE12_LOCK0_R array
   type PAGE12_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE12_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE12_LOCK0_R
   type PAGE12_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE12_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE12_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 12 (rows 0x300 through 0x33f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE12_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE12_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE12_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE12_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE12_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE12_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE12_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE12_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE12_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE12_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE12_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE12_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE12_LOCK1_R array element
   subtype PAGE12_LOCK1_R_Element is HAL.UInt8;

   --  PAGE12_LOCK1_R array
   type PAGE12_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE12_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE12_LOCK1_R
   type PAGE12_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE12_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE12_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 12 (rows 0x300 through 0x33f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE12_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE12_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE12_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE12_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE12_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE12_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE13_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE13_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE13_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE13_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE13_LOCK0_R array element
   subtype PAGE13_LOCK0_R_Element is HAL.UInt8;

   --  PAGE13_LOCK0_R array
   type PAGE13_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE13_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE13_LOCK0_R
   type PAGE13_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE13_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE13_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 13 (rows 0x340 through 0x37f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE13_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE13_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE13_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE13_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE13_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE13_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE13_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE13_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE13_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE13_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE13_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE13_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE13_LOCK1_R array element
   subtype PAGE13_LOCK1_R_Element is HAL.UInt8;

   --  PAGE13_LOCK1_R array
   type PAGE13_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE13_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE13_LOCK1_R
   type PAGE13_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE13_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE13_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 13 (rows 0x340 through 0x37f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE13_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE13_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE13_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE13_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE13_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE13_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE14_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE14_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE14_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE14_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE14_LOCK0_R array element
   subtype PAGE14_LOCK0_R_Element is HAL.UInt8;

   --  PAGE14_LOCK0_R array
   type PAGE14_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE14_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE14_LOCK0_R
   type PAGE14_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE14_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE14_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 14 (rows 0x380 through 0x3bf). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE14_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE14_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE14_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE14_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE14_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE14_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE14_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE14_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE14_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE14_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE14_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE14_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE14_LOCK1_R array element
   subtype PAGE14_LOCK1_R_Element is HAL.UInt8;

   --  PAGE14_LOCK1_R array
   type PAGE14_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE14_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE14_LOCK1_R
   type PAGE14_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE14_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE14_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 14 (rows 0x380 through 0x3bf). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE14_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE14_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE14_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE14_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE14_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE14_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE15_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE15_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE15_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE15_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE15_LOCK0_R array element
   subtype PAGE15_LOCK0_R_Element is HAL.UInt8;

   --  PAGE15_LOCK0_R array
   type PAGE15_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE15_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE15_LOCK0_R
   type PAGE15_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE15_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE15_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 15 (rows 0x3c0 through 0x3ff). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE15_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE15_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE15_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE15_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE15_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE15_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE15_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE15_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE15_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE15_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE15_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE15_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE15_LOCK1_R array element
   subtype PAGE15_LOCK1_R_Element is HAL.UInt8;

   --  PAGE15_LOCK1_R array
   type PAGE15_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE15_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE15_LOCK1_R
   type PAGE15_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE15_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE15_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 15 (rows 0x3c0 through 0x3ff). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE15_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE15_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE15_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE15_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE15_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE15_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE16_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE16_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE16_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE16_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE16_LOCK0_R array element
   subtype PAGE16_LOCK0_R_Element is HAL.UInt8;

   --  PAGE16_LOCK0_R array
   type PAGE16_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE16_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE16_LOCK0_R
   type PAGE16_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE16_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE16_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 16 (rows 0x400 through 0x43f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE16_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE16_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE16_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE16_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE16_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE16_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE16_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE16_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE16_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE16_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE16_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE16_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE16_LOCK1_R array element
   subtype PAGE16_LOCK1_R_Element is HAL.UInt8;

   --  PAGE16_LOCK1_R array
   type PAGE16_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE16_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE16_LOCK1_R
   type PAGE16_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE16_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE16_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 16 (rows 0x400 through 0x43f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE16_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE16_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE16_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE16_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE16_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE16_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE17_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE17_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE17_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE17_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE17_LOCK0_R array element
   subtype PAGE17_LOCK0_R_Element is HAL.UInt8;

   --  PAGE17_LOCK0_R array
   type PAGE17_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE17_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE17_LOCK0_R
   type PAGE17_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE17_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE17_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 17 (rows 0x440 through 0x47f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE17_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE17_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE17_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE17_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE17_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE17_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE17_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE17_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE17_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE17_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE17_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE17_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE17_LOCK1_R array element
   subtype PAGE17_LOCK1_R_Element is HAL.UInt8;

   --  PAGE17_LOCK1_R array
   type PAGE17_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE17_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE17_LOCK1_R
   type PAGE17_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE17_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE17_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 17 (rows 0x440 through 0x47f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE17_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE17_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE17_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE17_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE17_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE17_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE18_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE18_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE18_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE18_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE18_LOCK0_R array element
   subtype PAGE18_LOCK0_R_Element is HAL.UInt8;

   --  PAGE18_LOCK0_R array
   type PAGE18_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE18_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE18_LOCK0_R
   type PAGE18_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE18_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE18_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 18 (rows 0x480 through 0x4bf). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE18_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE18_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE18_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE18_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE18_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE18_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE18_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE18_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE18_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE18_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE18_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE18_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE18_LOCK1_R array element
   subtype PAGE18_LOCK1_R_Element is HAL.UInt8;

   --  PAGE18_LOCK1_R array
   type PAGE18_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE18_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE18_LOCK1_R
   type PAGE18_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE18_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE18_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 18 (rows 0x480 through 0x4bf). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE18_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE18_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE18_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE18_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE18_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE18_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE19_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE19_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE19_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE19_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE19_LOCK0_R array element
   subtype PAGE19_LOCK0_R_Element is HAL.UInt8;

   --  PAGE19_LOCK0_R array
   type PAGE19_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE19_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE19_LOCK0_R
   type PAGE19_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE19_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE19_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 19 (rows 0x4c0 through 0x4ff). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE19_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE19_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE19_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE19_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE19_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE19_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE19_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE19_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE19_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE19_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE19_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE19_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE19_LOCK1_R array element
   subtype PAGE19_LOCK1_R_Element is HAL.UInt8;

   --  PAGE19_LOCK1_R array
   type PAGE19_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE19_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE19_LOCK1_R
   type PAGE19_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE19_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE19_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 19 (rows 0x4c0 through 0x4ff). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE19_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE19_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE19_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE19_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE19_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE19_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE20_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE20_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE20_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE20_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE20_LOCK0_R array element
   subtype PAGE20_LOCK0_R_Element is HAL.UInt8;

   --  PAGE20_LOCK0_R array
   type PAGE20_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE20_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE20_LOCK0_R
   type PAGE20_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE20_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE20_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 20 (rows 0x500 through 0x53f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE20_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE20_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE20_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE20_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE20_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE20_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE20_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE20_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE20_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE20_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE20_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE20_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE20_LOCK1_R array element
   subtype PAGE20_LOCK1_R_Element is HAL.UInt8;

   --  PAGE20_LOCK1_R array
   type PAGE20_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE20_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE20_LOCK1_R
   type PAGE20_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE20_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE20_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 20 (rows 0x500 through 0x53f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE20_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE20_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE20_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE20_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE20_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE20_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE21_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE21_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE21_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE21_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE21_LOCK0_R array element
   subtype PAGE21_LOCK0_R_Element is HAL.UInt8;

   --  PAGE21_LOCK0_R array
   type PAGE21_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE21_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE21_LOCK0_R
   type PAGE21_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE21_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE21_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 21 (rows 0x540 through 0x57f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE21_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE21_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE21_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE21_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE21_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE21_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE21_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE21_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE21_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE21_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE21_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE21_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE21_LOCK1_R array element
   subtype PAGE21_LOCK1_R_Element is HAL.UInt8;

   --  PAGE21_LOCK1_R array
   type PAGE21_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE21_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE21_LOCK1_R
   type PAGE21_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE21_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE21_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 21 (rows 0x540 through 0x57f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE21_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE21_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE21_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE21_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE21_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE21_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE22_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE22_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE22_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE22_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE22_LOCK0_R array element
   subtype PAGE22_LOCK0_R_Element is HAL.UInt8;

   --  PAGE22_LOCK0_R array
   type PAGE22_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE22_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE22_LOCK0_R
   type PAGE22_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE22_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE22_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 22 (rows 0x580 through 0x5bf). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE22_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE22_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE22_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE22_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE22_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE22_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE22_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE22_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE22_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE22_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE22_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE22_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE22_LOCK1_R array element
   subtype PAGE22_LOCK1_R_Element is HAL.UInt8;

   --  PAGE22_LOCK1_R array
   type PAGE22_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE22_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE22_LOCK1_R
   type PAGE22_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE22_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE22_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 22 (rows 0x580 through 0x5bf). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE22_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE22_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE22_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE22_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE22_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE22_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE23_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE23_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE23_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE23_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE23_LOCK0_R array element
   subtype PAGE23_LOCK0_R_Element is HAL.UInt8;

   --  PAGE23_LOCK0_R array
   type PAGE23_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE23_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE23_LOCK0_R
   type PAGE23_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE23_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE23_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 23 (rows 0x5c0 through 0x5ff). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE23_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE23_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE23_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE23_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE23_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE23_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE23_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE23_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE23_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE23_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE23_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE23_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE23_LOCK1_R array element
   subtype PAGE23_LOCK1_R_Element is HAL.UInt8;

   --  PAGE23_LOCK1_R array
   type PAGE23_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE23_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE23_LOCK1_R
   type PAGE23_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE23_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE23_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 23 (rows 0x5c0 through 0x5ff). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE23_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE23_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE23_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE23_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE23_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE23_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE24_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE24_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE24_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE24_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE24_LOCK0_R array element
   subtype PAGE24_LOCK0_R_Element is HAL.UInt8;

   --  PAGE24_LOCK0_R array
   type PAGE24_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE24_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE24_LOCK0_R
   type PAGE24_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE24_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE24_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 24 (rows 0x600 through 0x63f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE24_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE24_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE24_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE24_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE24_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE24_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE24_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE24_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE24_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE24_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE24_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE24_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE24_LOCK1_R array element
   subtype PAGE24_LOCK1_R_Element is HAL.UInt8;

   --  PAGE24_LOCK1_R array
   type PAGE24_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE24_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE24_LOCK1_R
   type PAGE24_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE24_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE24_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 24 (rows 0x600 through 0x63f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE24_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE24_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE24_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE24_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE24_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE24_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE25_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE25_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE25_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE25_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE25_LOCK0_R array element
   subtype PAGE25_LOCK0_R_Element is HAL.UInt8;

   --  PAGE25_LOCK0_R array
   type PAGE25_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE25_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE25_LOCK0_R
   type PAGE25_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE25_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE25_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 25 (rows 0x640 through 0x67f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE25_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE25_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE25_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE25_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE25_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE25_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE25_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE25_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE25_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE25_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE25_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE25_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE25_LOCK1_R array element
   subtype PAGE25_LOCK1_R_Element is HAL.UInt8;

   --  PAGE25_LOCK1_R array
   type PAGE25_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE25_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE25_LOCK1_R
   type PAGE25_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE25_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE25_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 25 (rows 0x640 through 0x67f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE25_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE25_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE25_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE25_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE25_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE25_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE26_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE26_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE26_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE26_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE26_LOCK0_R array element
   subtype PAGE26_LOCK0_R_Element is HAL.UInt8;

   --  PAGE26_LOCK0_R array
   type PAGE26_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE26_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE26_LOCK0_R
   type PAGE26_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE26_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE26_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 26 (rows 0x680 through 0x6bf). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE26_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE26_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE26_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE26_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE26_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE26_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE26_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE26_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE26_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE26_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE26_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE26_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE26_LOCK1_R array element
   subtype PAGE26_LOCK1_R_Element is HAL.UInt8;

   --  PAGE26_LOCK1_R array
   type PAGE26_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE26_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE26_LOCK1_R
   type PAGE26_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE26_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE26_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 26 (rows 0x680 through 0x6bf). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE26_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE26_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE26_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE26_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE26_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE26_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE27_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE27_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE27_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE27_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE27_LOCK0_R array element
   subtype PAGE27_LOCK0_R_Element is HAL.UInt8;

   --  PAGE27_LOCK0_R array
   type PAGE27_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE27_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE27_LOCK0_R
   type PAGE27_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE27_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE27_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 27 (rows 0x6c0 through 0x6ff). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE27_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE27_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE27_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE27_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE27_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE27_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE27_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE27_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE27_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE27_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE27_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE27_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE27_LOCK1_R array element
   subtype PAGE27_LOCK1_R_Element is HAL.UInt8;

   --  PAGE27_LOCK1_R array
   type PAGE27_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE27_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE27_LOCK1_R
   type PAGE27_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE27_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE27_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 27 (rows 0x6c0 through 0x6ff). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE27_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE27_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE27_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE27_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE27_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE27_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE28_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE28_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE28_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE28_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE28_LOCK0_R array element
   subtype PAGE28_LOCK0_R_Element is HAL.UInt8;

   --  PAGE28_LOCK0_R array
   type PAGE28_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE28_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE28_LOCK0_R
   type PAGE28_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE28_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE28_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 28 (rows 0x700 through 0x73f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE28_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE28_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE28_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE28_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE28_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE28_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE28_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE28_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE28_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE28_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE28_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE28_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE28_LOCK1_R array element
   subtype PAGE28_LOCK1_R_Element is HAL.UInt8;

   --  PAGE28_LOCK1_R array
   type PAGE28_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE28_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE28_LOCK1_R
   type PAGE28_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE28_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE28_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 28 (rows 0x700 through 0x73f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE28_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE28_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE28_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE28_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE28_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE28_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE29_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE29_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE29_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE29_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE29_LOCK0_R array element
   subtype PAGE29_LOCK0_R_Element is HAL.UInt8;

   --  PAGE29_LOCK0_R array
   type PAGE29_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE29_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE29_LOCK0_R
   type PAGE29_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE29_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE29_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 29 (rows 0x740 through 0x77f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE29_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE29_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE29_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE29_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE29_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE29_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE29_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE29_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE29_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE29_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE29_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE29_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE29_LOCK1_R array element
   subtype PAGE29_LOCK1_R_Element is HAL.UInt8;

   --  PAGE29_LOCK1_R array
   type PAGE29_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE29_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE29_LOCK1_R
   type PAGE29_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE29_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE29_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 29 (rows 0x740 through 0x77f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE29_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE29_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE29_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE29_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE29_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE29_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE30_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE30_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE30_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE30_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE30_LOCK0_R array element
   subtype PAGE30_LOCK0_R_Element is HAL.UInt8;

   --  PAGE30_LOCK0_R array
   type PAGE30_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE30_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE30_LOCK0_R
   type PAGE30_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE30_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE30_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 30 (rows 0x780 through 0x7bf). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE30_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE30_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE30_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE30_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE30_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE30_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE30_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE30_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE30_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE30_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE30_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE30_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE30_LOCK1_R array element
   subtype PAGE30_LOCK1_R_Element is HAL.UInt8;

   --  PAGE30_LOCK1_R array
   type PAGE30_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE30_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE30_LOCK1_R
   type PAGE30_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE30_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE30_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 30 (rows 0x780 through 0x7bf). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE30_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE30_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE30_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE30_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE30_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE30_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE31_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE31_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE31_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE31_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE31_LOCK0_R array element
   subtype PAGE31_LOCK0_R_Element is HAL.UInt8;

   --  PAGE31_LOCK0_R array
   type PAGE31_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE31_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE31_LOCK0_R
   type PAGE31_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE31_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE31_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 31 (rows 0x7c0 through 0x7ff). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE31_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE31_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE31_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE31_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE31_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE31_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE31_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE31_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE31_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE31_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE31_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE31_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE31_LOCK1_R array element
   subtype PAGE31_LOCK1_R_Element is HAL.UInt8;

   --  PAGE31_LOCK1_R array
   type PAGE31_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE31_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE31_LOCK1_R
   type PAGE31_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE31_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE31_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 31 (rows 0x7c0 through 0x7ff). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE31_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE31_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE31_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE31_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE31_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE31_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE32_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE32_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE32_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE32_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE32_LOCK0_R array element
   subtype PAGE32_LOCK0_R_Element is HAL.UInt8;

   --  PAGE32_LOCK0_R array
   type PAGE32_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE32_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE32_LOCK0_R
   type PAGE32_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE32_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE32_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 32 (rows 0x800 through 0x83f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE32_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE32_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE32_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE32_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE32_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE32_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE32_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE32_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE32_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE32_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE32_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE32_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE32_LOCK1_R array element
   subtype PAGE32_LOCK1_R_Element is HAL.UInt8;

   --  PAGE32_LOCK1_R array
   type PAGE32_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE32_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE32_LOCK1_R
   type PAGE32_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE32_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE32_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 32 (rows 0x800 through 0x83f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE32_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE32_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE32_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE32_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE32_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE32_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE33_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE33_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE33_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE33_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE33_LOCK0_R array element
   subtype PAGE33_LOCK0_R_Element is HAL.UInt8;

   --  PAGE33_LOCK0_R array
   type PAGE33_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE33_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE33_LOCK0_R
   type PAGE33_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE33_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE33_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 33 (rows 0x840 through 0x87f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE33_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE33_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE33_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE33_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE33_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE33_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE33_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE33_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE33_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE33_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE33_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE33_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE33_LOCK1_R array element
   subtype PAGE33_LOCK1_R_Element is HAL.UInt8;

   --  PAGE33_LOCK1_R array
   type PAGE33_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE33_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE33_LOCK1_R
   type PAGE33_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE33_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE33_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 33 (rows 0x840 through 0x87f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE33_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE33_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE33_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE33_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE33_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE33_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE34_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE34_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE34_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE34_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE34_LOCK0_R array element
   subtype PAGE34_LOCK0_R_Element is HAL.UInt8;

   --  PAGE34_LOCK0_R array
   type PAGE34_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE34_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE34_LOCK0_R
   type PAGE34_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE34_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE34_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 34 (rows 0x880 through 0x8bf). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE34_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE34_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE34_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE34_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE34_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE34_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE34_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE34_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE34_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE34_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE34_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE34_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE34_LOCK1_R array element
   subtype PAGE34_LOCK1_R_Element is HAL.UInt8;

   --  PAGE34_LOCK1_R array
   type PAGE34_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE34_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE34_LOCK1_R
   type PAGE34_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE34_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE34_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 34 (rows 0x880 through 0x8bf). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE34_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE34_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE34_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE34_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE34_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE34_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE35_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE35_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE35_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE35_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE35_LOCK0_R array element
   subtype PAGE35_LOCK0_R_Element is HAL.UInt8;

   --  PAGE35_LOCK0_R array
   type PAGE35_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE35_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE35_LOCK0_R
   type PAGE35_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE35_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE35_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 35 (rows 0x8c0 through 0x8ff). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE35_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE35_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE35_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE35_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE35_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE35_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE35_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE35_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE35_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE35_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE35_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE35_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE35_LOCK1_R array element
   subtype PAGE35_LOCK1_R_Element is HAL.UInt8;

   --  PAGE35_LOCK1_R array
   type PAGE35_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE35_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE35_LOCK1_R
   type PAGE35_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE35_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE35_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 35 (rows 0x8c0 through 0x8ff). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE35_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE35_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE35_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE35_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE35_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE35_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE36_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE36_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE36_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE36_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE36_LOCK0_R array element
   subtype PAGE36_LOCK0_R_Element is HAL.UInt8;

   --  PAGE36_LOCK0_R array
   type PAGE36_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE36_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE36_LOCK0_R
   type PAGE36_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE36_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE36_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 36 (rows 0x900 through 0x93f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE36_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE36_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE36_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE36_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE36_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE36_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE36_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE36_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE36_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE36_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE36_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE36_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE36_LOCK1_R array element
   subtype PAGE36_LOCK1_R_Element is HAL.UInt8;

   --  PAGE36_LOCK1_R array
   type PAGE36_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE36_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE36_LOCK1_R
   type PAGE36_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE36_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE36_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 36 (rows 0x900 through 0x93f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE36_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE36_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE36_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE36_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE36_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE36_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE37_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE37_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE37_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE37_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE37_LOCK0_R array element
   subtype PAGE37_LOCK0_R_Element is HAL.UInt8;

   --  PAGE37_LOCK0_R array
   type PAGE37_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE37_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE37_LOCK0_R
   type PAGE37_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE37_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE37_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 37 (rows 0x940 through 0x97f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE37_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE37_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE37_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE37_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE37_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE37_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE37_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE37_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE37_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE37_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE37_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE37_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE37_LOCK1_R array element
   subtype PAGE37_LOCK1_R_Element is HAL.UInt8;

   --  PAGE37_LOCK1_R array
   type PAGE37_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE37_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE37_LOCK1_R
   type PAGE37_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE37_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE37_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 37 (rows 0x940 through 0x97f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE37_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE37_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE37_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE37_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE37_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE37_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE38_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE38_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE38_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE38_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE38_LOCK0_R array element
   subtype PAGE38_LOCK0_R_Element is HAL.UInt8;

   --  PAGE38_LOCK0_R array
   type PAGE38_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE38_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE38_LOCK0_R
   type PAGE38_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE38_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE38_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 38 (rows 0x980 through 0x9bf). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE38_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE38_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE38_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE38_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE38_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE38_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE38_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE38_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE38_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE38_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE38_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE38_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE38_LOCK1_R array element
   subtype PAGE38_LOCK1_R_Element is HAL.UInt8;

   --  PAGE38_LOCK1_R array
   type PAGE38_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE38_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE38_LOCK1_R
   type PAGE38_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE38_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE38_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 38 (rows 0x980 through 0x9bf). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE38_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE38_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE38_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE38_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE38_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE38_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE39_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE39_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE39_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE39_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE39_LOCK0_R array element
   subtype PAGE39_LOCK0_R_Element is HAL.UInt8;

   --  PAGE39_LOCK0_R array
   type PAGE39_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE39_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE39_LOCK0_R
   type PAGE39_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE39_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE39_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 39 (rows 0x9c0 through 0x9ff). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE39_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE39_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE39_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE39_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE39_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE39_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE39_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE39_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE39_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE39_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE39_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE39_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE39_LOCK1_R array element
   subtype PAGE39_LOCK1_R_Element is HAL.UInt8;

   --  PAGE39_LOCK1_R array
   type PAGE39_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE39_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE39_LOCK1_R
   type PAGE39_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE39_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE39_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 39 (rows 0x9c0 through 0x9ff). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE39_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE39_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE39_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE39_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE39_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE39_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE40_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE40_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE40_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE40_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE40_LOCK0_R array element
   subtype PAGE40_LOCK0_R_Element is HAL.UInt8;

   --  PAGE40_LOCK0_R array
   type PAGE40_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE40_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE40_LOCK0_R
   type PAGE40_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE40_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE40_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 40 (rows 0xa00 through 0xa3f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE40_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE40_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE40_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE40_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE40_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE40_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE40_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE40_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE40_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE40_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE40_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE40_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE40_LOCK1_R array element
   subtype PAGE40_LOCK1_R_Element is HAL.UInt8;

   --  PAGE40_LOCK1_R array
   type PAGE40_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE40_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE40_LOCK1_R
   type PAGE40_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE40_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE40_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 40 (rows 0xa00 through 0xa3f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE40_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE40_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE40_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE40_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE40_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE40_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE41_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE41_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE41_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE41_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE41_LOCK0_R array element
   subtype PAGE41_LOCK0_R_Element is HAL.UInt8;

   --  PAGE41_LOCK0_R array
   type PAGE41_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE41_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE41_LOCK0_R
   type PAGE41_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE41_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE41_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 41 (rows 0xa40 through 0xa7f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE41_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE41_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE41_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE41_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE41_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE41_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE41_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE41_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE41_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE41_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE41_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE41_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE41_LOCK1_R array element
   subtype PAGE41_LOCK1_R_Element is HAL.UInt8;

   --  PAGE41_LOCK1_R array
   type PAGE41_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE41_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE41_LOCK1_R
   type PAGE41_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE41_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE41_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 41 (rows 0xa40 through 0xa7f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE41_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE41_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE41_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE41_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE41_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE41_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE42_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE42_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE42_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE42_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE42_LOCK0_R array element
   subtype PAGE42_LOCK0_R_Element is HAL.UInt8;

   --  PAGE42_LOCK0_R array
   type PAGE42_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE42_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE42_LOCK0_R
   type PAGE42_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE42_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE42_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 42 (rows 0xa80 through 0xabf). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE42_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE42_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE42_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE42_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE42_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE42_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE42_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE42_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE42_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE42_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE42_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE42_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE42_LOCK1_R array element
   subtype PAGE42_LOCK1_R_Element is HAL.UInt8;

   --  PAGE42_LOCK1_R array
   type PAGE42_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE42_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE42_LOCK1_R
   type PAGE42_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE42_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE42_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 42 (rows 0xa80 through 0xabf). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE42_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE42_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE42_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE42_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE42_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE42_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE43_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE43_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE43_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE43_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE43_LOCK0_R array element
   subtype PAGE43_LOCK0_R_Element is HAL.UInt8;

   --  PAGE43_LOCK0_R array
   type PAGE43_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE43_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE43_LOCK0_R
   type PAGE43_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE43_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE43_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 43 (rows 0xac0 through 0xaff). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE43_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE43_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE43_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE43_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE43_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE43_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE43_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE43_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE43_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE43_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE43_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE43_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE43_LOCK1_R array element
   subtype PAGE43_LOCK1_R_Element is HAL.UInt8;

   --  PAGE43_LOCK1_R array
   type PAGE43_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE43_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE43_LOCK1_R
   type PAGE43_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE43_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE43_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 43 (rows 0xac0 through 0xaff). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE43_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE43_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE43_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE43_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE43_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE43_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE44_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE44_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE44_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE44_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE44_LOCK0_R array element
   subtype PAGE44_LOCK0_R_Element is HAL.UInt8;

   --  PAGE44_LOCK0_R array
   type PAGE44_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE44_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE44_LOCK0_R
   type PAGE44_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE44_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE44_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 44 (rows 0xb00 through 0xb3f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE44_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE44_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE44_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE44_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE44_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE44_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE44_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE44_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE44_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE44_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE44_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE44_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE44_LOCK1_R array element
   subtype PAGE44_LOCK1_R_Element is HAL.UInt8;

   --  PAGE44_LOCK1_R array
   type PAGE44_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE44_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE44_LOCK1_R
   type PAGE44_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE44_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE44_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 44 (rows 0xb00 through 0xb3f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE44_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE44_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE44_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE44_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE44_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE44_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE45_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE45_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE45_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE45_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE45_LOCK0_R array element
   subtype PAGE45_LOCK0_R_Element is HAL.UInt8;

   --  PAGE45_LOCK0_R array
   type PAGE45_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE45_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE45_LOCK0_R
   type PAGE45_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE45_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE45_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 45 (rows 0xb40 through 0xb7f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE45_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE45_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE45_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE45_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE45_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE45_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE45_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE45_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE45_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE45_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE45_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE45_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE45_LOCK1_R array element
   subtype PAGE45_LOCK1_R_Element is HAL.UInt8;

   --  PAGE45_LOCK1_R array
   type PAGE45_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE45_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE45_LOCK1_R
   type PAGE45_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE45_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE45_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 45 (rows 0xb40 through 0xb7f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE45_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE45_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE45_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE45_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE45_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE45_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE46_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE46_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE46_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE46_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE46_LOCK0_R array element
   subtype PAGE46_LOCK0_R_Element is HAL.UInt8;

   --  PAGE46_LOCK0_R array
   type PAGE46_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE46_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE46_LOCK0_R
   type PAGE46_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE46_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE46_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 46 (rows 0xb80 through 0xbbf). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE46_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE46_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE46_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE46_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE46_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE46_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE46_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE46_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE46_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE46_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE46_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE46_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE46_LOCK1_R array element
   subtype PAGE46_LOCK1_R_Element is HAL.UInt8;

   --  PAGE46_LOCK1_R array
   type PAGE46_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE46_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE46_LOCK1_R
   type PAGE46_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE46_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE46_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 46 (rows 0xb80 through 0xbbf). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE46_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE46_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE46_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE46_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE46_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE46_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE47_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE47_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE47_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE47_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE47_LOCK0_R array element
   subtype PAGE47_LOCK0_R_Element is HAL.UInt8;

   --  PAGE47_LOCK0_R array
   type PAGE47_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE47_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE47_LOCK0_R
   type PAGE47_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE47_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE47_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 47 (rows 0xbc0 through 0xbff). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE47_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE47_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE47_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE47_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE47_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE47_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE47_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE47_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE47_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE47_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE47_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE47_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE47_LOCK1_R array element
   subtype PAGE47_LOCK1_R_Element is HAL.UInt8;

   --  PAGE47_LOCK1_R array
   type PAGE47_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE47_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE47_LOCK1_R
   type PAGE47_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE47_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE47_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 47 (rows 0xbc0 through 0xbff). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE47_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE47_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE47_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE47_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE47_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE47_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE48_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE48_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE48_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE48_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE48_LOCK0_R array element
   subtype PAGE48_LOCK0_R_Element is HAL.UInt8;

   --  PAGE48_LOCK0_R array
   type PAGE48_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE48_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE48_LOCK0_R
   type PAGE48_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE48_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE48_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 48 (rows 0xc00 through 0xc3f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE48_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE48_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE48_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE48_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE48_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE48_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE48_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE48_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE48_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE48_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE48_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE48_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE48_LOCK1_R array element
   subtype PAGE48_LOCK1_R_Element is HAL.UInt8;

   --  PAGE48_LOCK1_R array
   type PAGE48_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE48_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE48_LOCK1_R
   type PAGE48_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE48_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE48_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 48 (rows 0xc00 through 0xc3f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE48_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE48_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE48_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE48_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE48_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE48_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE49_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE49_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE49_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE49_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE49_LOCK0_R array element
   subtype PAGE49_LOCK0_R_Element is HAL.UInt8;

   --  PAGE49_LOCK0_R array
   type PAGE49_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE49_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE49_LOCK0_R
   type PAGE49_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE49_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE49_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 49 (rows 0xc40 through 0xc7f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE49_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE49_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE49_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE49_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE49_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE49_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE49_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE49_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE49_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE49_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE49_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE49_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE49_LOCK1_R array element
   subtype PAGE49_LOCK1_R_Element is HAL.UInt8;

   --  PAGE49_LOCK1_R array
   type PAGE49_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE49_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE49_LOCK1_R
   type PAGE49_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE49_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE49_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 49 (rows 0xc40 through 0xc7f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE49_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE49_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE49_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE49_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE49_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE49_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE50_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE50_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE50_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE50_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE50_LOCK0_R array element
   subtype PAGE50_LOCK0_R_Element is HAL.UInt8;

   --  PAGE50_LOCK0_R array
   type PAGE50_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE50_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE50_LOCK0_R
   type PAGE50_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE50_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE50_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 50 (rows 0xc80 through 0xcbf). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE50_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE50_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE50_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE50_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE50_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE50_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE50_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE50_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE50_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE50_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE50_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE50_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE50_LOCK1_R array element
   subtype PAGE50_LOCK1_R_Element is HAL.UInt8;

   --  PAGE50_LOCK1_R array
   type PAGE50_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE50_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE50_LOCK1_R
   type PAGE50_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE50_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE50_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 50 (rows 0xc80 through 0xcbf). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE50_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE50_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE50_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE50_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE50_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE50_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE51_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE51_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE51_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE51_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE51_LOCK0_R array element
   subtype PAGE51_LOCK0_R_Element is HAL.UInt8;

   --  PAGE51_LOCK0_R array
   type PAGE51_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE51_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE51_LOCK0_R
   type PAGE51_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE51_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE51_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 51 (rows 0xcc0 through 0xcff). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE51_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE51_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE51_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE51_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE51_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE51_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE51_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE51_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE51_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE51_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE51_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE51_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE51_LOCK1_R array element
   subtype PAGE51_LOCK1_R_Element is HAL.UInt8;

   --  PAGE51_LOCK1_R array
   type PAGE51_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE51_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE51_LOCK1_R
   type PAGE51_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE51_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE51_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 51 (rows 0xcc0 through 0xcff). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE51_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE51_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE51_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE51_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE51_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE51_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE52_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE52_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE52_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE52_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE52_LOCK0_R array element
   subtype PAGE52_LOCK0_R_Element is HAL.UInt8;

   --  PAGE52_LOCK0_R array
   type PAGE52_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE52_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE52_LOCK0_R
   type PAGE52_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE52_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE52_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 52 (rows 0xd00 through 0xd3f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE52_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE52_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE52_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE52_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE52_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE52_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE52_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE52_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE52_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE52_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE52_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE52_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE52_LOCK1_R array element
   subtype PAGE52_LOCK1_R_Element is HAL.UInt8;

   --  PAGE52_LOCK1_R array
   type PAGE52_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE52_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE52_LOCK1_R
   type PAGE52_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE52_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE52_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 52 (rows 0xd00 through 0xd3f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE52_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE52_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE52_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE52_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE52_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE52_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE53_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE53_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE53_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE53_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE53_LOCK0_R array element
   subtype PAGE53_LOCK0_R_Element is HAL.UInt8;

   --  PAGE53_LOCK0_R array
   type PAGE53_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE53_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE53_LOCK0_R
   type PAGE53_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE53_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE53_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 53 (rows 0xd40 through 0xd7f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE53_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE53_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE53_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE53_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE53_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE53_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE53_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE53_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE53_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE53_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE53_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE53_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE53_LOCK1_R array element
   subtype PAGE53_LOCK1_R_Element is HAL.UInt8;

   --  PAGE53_LOCK1_R array
   type PAGE53_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE53_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE53_LOCK1_R
   type PAGE53_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE53_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE53_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 53 (rows 0xd40 through 0xd7f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE53_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE53_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE53_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE53_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE53_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE53_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE54_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE54_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE54_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE54_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE54_LOCK0_R array element
   subtype PAGE54_LOCK0_R_Element is HAL.UInt8;

   --  PAGE54_LOCK0_R array
   type PAGE54_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE54_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE54_LOCK0_R
   type PAGE54_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE54_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE54_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 54 (rows 0xd80 through 0xdbf). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE54_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE54_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE54_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE54_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE54_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE54_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE54_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE54_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE54_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE54_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE54_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE54_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE54_LOCK1_R array element
   subtype PAGE54_LOCK1_R_Element is HAL.UInt8;

   --  PAGE54_LOCK1_R array
   type PAGE54_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE54_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE54_LOCK1_R
   type PAGE54_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE54_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE54_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 54 (rows 0xd80 through 0xdbf). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE54_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE54_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE54_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE54_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE54_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE54_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE55_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE55_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE55_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE55_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE55_LOCK0_R array element
   subtype PAGE55_LOCK0_R_Element is HAL.UInt8;

   --  PAGE55_LOCK0_R array
   type PAGE55_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE55_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE55_LOCK0_R
   type PAGE55_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE55_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE55_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 55 (rows 0xdc0 through 0xdff). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE55_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE55_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE55_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE55_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE55_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE55_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE55_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE55_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE55_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE55_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE55_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE55_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE55_LOCK1_R array element
   subtype PAGE55_LOCK1_R_Element is HAL.UInt8;

   --  PAGE55_LOCK1_R array
   type PAGE55_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE55_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE55_LOCK1_R
   type PAGE55_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE55_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE55_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 55 (rows 0xdc0 through 0xdff). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE55_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE55_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE55_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE55_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE55_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE55_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE56_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE56_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE56_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE56_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE56_LOCK0_R array element
   subtype PAGE56_LOCK0_R_Element is HAL.UInt8;

   --  PAGE56_LOCK0_R array
   type PAGE56_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE56_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE56_LOCK0_R
   type PAGE56_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE56_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE56_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 56 (rows 0xe00 through 0xe3f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE56_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE56_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE56_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE56_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE56_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE56_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE56_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE56_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE56_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE56_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE56_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE56_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE56_LOCK1_R array element
   subtype PAGE56_LOCK1_R_Element is HAL.UInt8;

   --  PAGE56_LOCK1_R array
   type PAGE56_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE56_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE56_LOCK1_R
   type PAGE56_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE56_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE56_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 56 (rows 0xe00 through 0xe3f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE56_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE56_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE56_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE56_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE56_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE56_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE57_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE57_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE57_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE57_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE57_LOCK0_R array element
   subtype PAGE57_LOCK0_R_Element is HAL.UInt8;

   --  PAGE57_LOCK0_R array
   type PAGE57_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE57_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE57_LOCK0_R
   type PAGE57_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE57_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE57_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 57 (rows 0xe40 through 0xe7f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE57_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE57_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE57_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE57_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE57_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE57_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE57_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE57_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE57_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE57_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE57_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE57_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE57_LOCK1_R array element
   subtype PAGE57_LOCK1_R_Element is HAL.UInt8;

   --  PAGE57_LOCK1_R array
   type PAGE57_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE57_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE57_LOCK1_R
   type PAGE57_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE57_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE57_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 57 (rows 0xe40 through 0xe7f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE57_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE57_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE57_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE57_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE57_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE57_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE58_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE58_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE58_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE58_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE58_LOCK0_R array element
   subtype PAGE58_LOCK0_R_Element is HAL.UInt8;

   --  PAGE58_LOCK0_R array
   type PAGE58_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE58_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE58_LOCK0_R
   type PAGE58_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE58_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE58_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 58 (rows 0xe80 through 0xebf). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE58_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE58_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE58_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE58_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE58_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE58_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE58_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE58_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE58_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE58_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE58_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE58_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE58_LOCK1_R array element
   subtype PAGE58_LOCK1_R_Element is HAL.UInt8;

   --  PAGE58_LOCK1_R array
   type PAGE58_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE58_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE58_LOCK1_R
   type PAGE58_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE58_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE58_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 58 (rows 0xe80 through 0xebf). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE58_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE58_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE58_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE58_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE58_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE58_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE59_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE59_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE59_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE59_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE59_LOCK0_R array element
   subtype PAGE59_LOCK0_R_Element is HAL.UInt8;

   --  PAGE59_LOCK0_R array
   type PAGE59_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE59_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE59_LOCK0_R
   type PAGE59_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE59_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE59_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 59 (rows 0xec0 through 0xeff). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE59_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE59_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE59_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE59_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE59_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE59_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE59_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE59_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE59_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE59_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE59_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE59_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE59_LOCK1_R array element
   subtype PAGE59_LOCK1_R_Element is HAL.UInt8;

   --  PAGE59_LOCK1_R array
   type PAGE59_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE59_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE59_LOCK1_R
   type PAGE59_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE59_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE59_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 59 (rows 0xec0 through 0xeff). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE59_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE59_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE59_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE59_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE59_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE59_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE60_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE60_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE60_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE60_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE60_LOCK0_R array element
   subtype PAGE60_LOCK0_R_Element is HAL.UInt8;

   --  PAGE60_LOCK0_R array
   type PAGE60_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE60_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE60_LOCK0_R
   type PAGE60_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE60_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE60_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 60 (rows 0xf00 through 0xf3f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE60_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE60_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE60_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE60_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE60_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE60_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE60_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE60_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE60_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE60_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE60_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE60_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE60_LOCK1_R array element
   subtype PAGE60_LOCK1_R_Element is HAL.UInt8;

   --  PAGE60_LOCK1_R array
   type PAGE60_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE60_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE60_LOCK1_R
   type PAGE60_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE60_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE60_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 60 (rows 0xf00 through 0xf3f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE60_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE60_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE60_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE60_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE60_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE60_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE61_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE61_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE61_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE61_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE61_LOCK0_R array element
   subtype PAGE61_LOCK0_R_Element is HAL.UInt8;

   --  PAGE61_LOCK0_R array
   type PAGE61_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE61_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE61_LOCK0_R
   type PAGE61_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE61_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE61_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 61 (rows 0xf40 through 0xf7f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE61_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE61_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE61_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE61_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE61_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE61_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE61_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE61_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE61_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE61_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE61_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE61_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE61_LOCK1_R array element
   subtype PAGE61_LOCK1_R_Element is HAL.UInt8;

   --  PAGE61_LOCK1_R array
   type PAGE61_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE61_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE61_LOCK1_R
   type PAGE61_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE61_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE61_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 61 (rows 0xf40 through 0xf7f). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE61_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE61_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE61_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE61_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE61_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE61_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE62_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE62_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE62_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE62_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE62_LOCK0_R array element
   subtype PAGE62_LOCK0_R_Element is HAL.UInt8;

   --  PAGE62_LOCK0_R array
   type PAGE62_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE62_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE62_LOCK0_R
   type PAGE62_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE62_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE62_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 62 (rows 0xf80 through 0xfbf). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE62_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE62_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE62_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE62_LOCK0_NO_KEY_STATE_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE62_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE62_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE62_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE62_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE62_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE62_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE62_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE62_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE62_LOCK1_R array element
   subtype PAGE62_LOCK1_R_Element is HAL.UInt8;

   --  PAGE62_LOCK1_R array
   type PAGE62_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE62_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE62_LOCK1_R
   type PAGE62_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE62_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE62_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 62 (rows 0xf80 through 0xfbf). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE62_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE62_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE62_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE62_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE62_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE62_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PAGE63_LOCK0_KEY_W_Field is HAL.UInt3;
   subtype PAGE63_LOCK0_KEY_R_Field is HAL.UInt3;

   --  State when at least one key is registered for this page and no matching
   --  key has been entered.
   type PAGE63_LOCK0_NO_KEY_STATE_Field is
     (read_only,
      inaccessible)
     with Size => 1;
   for PAGE63_LOCK0_NO_KEY_STATE_Field use
     (read_only => 0,
      inaccessible => 1);

   --  PAGE63_LOCK0_R array element
   subtype PAGE63_LOCK0_R_Element is HAL.UInt8;

   --  PAGE63_LOCK0_R array
   type PAGE63_LOCK0_R_Field_Array is array (1 .. 2)
     of PAGE63_LOCK0_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE63_LOCK0_R
   type PAGE63_LOCK0_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE63_LOCK0_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE63_LOCK0_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration LSBs for page 63 (rows 0xfc0 through 0xfff). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE63_LOCK0_Register is record
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  write access, or 0 if no such key is required.
      KEY_W          : PAGE63_LOCK0_KEY_W_Field;
      --  Read-only. Index 1-6 of a hardware key which must be entered to grant
      --  read access, or 0 if no such key is required.
      KEY_R          : PAGE63_LOCK0_KEY_R_Field;
      --  Read-only. State when at least one key is registered for this page
      --  and no matching key has been entered.
      NO_KEY_STATE   : PAGE63_LOCK0_NO_KEY_STATE_Field;
      --  Read-only. Decommission for RMA of a suspected faulty device. This
      --  re-enables the factory test JTAG interface, and makes pages 3 through
      --  61 of the OTP permanently inaccessible.
      RMA            : Boolean;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE63_LOCK0_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE63_LOCK0_Register use record
      KEY_W          at 0 range 0 .. 2;
      KEY_R          at 0 range 3 .. 5;
      NO_KEY_STATE   at 0 range 6 .. 6;
      RMA            at 0 range 7 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Lock state for Secure accesses to this page. Thermometer-coded, so lock
   --  state can be advanced permanently from any state to any less-permissive
   --  state by programming OTP. Software can also advance the lock state
   --  temporarily (until next OTP reset) using the SW_LOCKx registers.
   type PAGE63_LOCK1_LOCK_S_Field is
     (--  Page is fully accessible by Secure software.
      read_write,
      --  Page can be read by Secure software, but can not be written.
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Secure software.
      inaccessible)
     with Size => 2;
   for PAGE63_LOCK1_LOCK_S_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Lock state for Non-secure accesses to this page. Thermometer-coded, so
   --  lock state can be advanced permanently from any state to any
   --  less-permissive state by programming OTP. Software can also advance the
   --  lock state temporarily (until next OTP reset) using the SW_LOCKx
   --  registers. Note that READ_WRITE and READ_ONLY are equivalent in
   --  hardware, as the SBPI programming interface is not accessible to
   --  Non-secure software. However, Secure software may check these bits to
   --  apply write permissions to a Non-secure OTP programming API.
   type PAGE63_LOCK1_LOCK_NS_Field is
     (--  Page can be read by Non-secure software, and Secure software may permit
--  Non-secure writes.
      read_write,
      --  Page can be read by Non-secure software
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE.
      reserved,
      --  Page can not be accessed by Non-secure software.
      inaccessible)
     with Size => 2;
   for PAGE63_LOCK1_LOCK_NS_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  Dummy lock bits reserved for bootloaders (including the RP2350 USB
   --  bootloader) to store their own OTP access permissions. No hardware
   --  effect, and no corresponding SW_LOCKx registers.
   type PAGE63_LOCK1_LOCK_BL_Field is
     (--  Bootloader permits user reads and writes to this page
      read_write,
      --  Bootloader permits user reads of this page
      read_only,
      --  Do not use. Behaves the same as INACCESSIBLE
      reserved,
      --  Bootloader does not permit user access to this page
      inaccessible)
     with Size => 2;
   for PAGE63_LOCK1_LOCK_BL_Field use
     (read_write => 0,
      read_only => 1,
      reserved => 2,
      inaccessible => 3);

   --  PAGE63_LOCK1_R array element
   subtype PAGE63_LOCK1_R_Element is HAL.UInt8;

   --  PAGE63_LOCK1_R array
   type PAGE63_LOCK1_R_Field_Array is array (1 .. 2)
     of PAGE63_LOCK1_R_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for PAGE63_LOCK1_R
   type PAGE63_LOCK1_R_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  R as a value
            Val : HAL.UInt16;
         when True =>
            --  R as an array
            Arr : PAGE63_LOCK1_R_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PAGE63_LOCK1_R_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Lock configuration MSBs for page 63 (rows 0xfc0 through 0xfff). Locks
   --  are stored with 3-way majority vote encoding, so that bits can be set
   --  independently. This OTP location is always readable, and is
   --  write-protected by its own permissions.
   type PAGE63_LOCK1_Register is record
      --  Read-only. Lock state for Secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers.
      LOCK_S         : PAGE63_LOCK1_LOCK_S_Field;
      --  Read-only. Lock state for Non-secure accesses to this page.
      --  Thermometer-coded, so lock state can be advanced permanently from any
      --  state to any less-permissive state by programming OTP. Software can
      --  also advance the lock state temporarily (until next OTP reset) using
      --  the SW_LOCKx registers. Note that READ_WRITE and READ_ONLY are
      --  equivalent in hardware, as the SBPI programming interface is not
      --  accessible to Non-secure software. However, Secure software may check
      --  these bits to apply write permissions to a Non-secure OTP programming
      --  API.
      LOCK_NS        : PAGE63_LOCK1_LOCK_NS_Field;
      --  Read-only. Dummy lock bits reserved for bootloaders (including the
      --  RP2350 USB bootloader) to store their own OTP access permissions. No
      --  hardware effect, and no corresponding SW_LOCKx registers.
      LOCK_BL        : PAGE63_LOCK1_LOCK_BL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Redundant copy of bits 7:0
      R              : PAGE63_LOCK1_R_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAGE63_LOCK1_Register use record
      LOCK_S         at 0 range 0 .. 1;
      LOCK_NS        at 0 range 2 .. 3;
      LOCK_BL        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      R              at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Predefined OTP data layout for RP2350
   type OTP_DATA_RAW_Peripheral is record
      --  Bits 15:0 of public device ID. (ECC) The CHIPID0..3 rows contain a
      --  64-bit random identifier for this chip, which can be read from the
      --  USB bootloader PICOBOOT interface or from the get_sys_info ROM API.
      --  The number of random bits makes the occurrence of twins exceedingly
      --  unlikely: for example, a fleet of a hundred million devices has a
      --  99.97% probability of no twinned IDs. This is estimated to be lower
      --  than the occurrence of process errors in the assignment of sequential
      --  random IDs, and for practical purposes CHIPID may be treated as
      --  unique.
      CHIPID0                   : aliased CHIPID0_Register;
      --  Bits 31:16 of public device ID (ECC)
      CHIPID1                   : aliased CHIPID1_Register;
      --  Bits 47:32 of public device ID (ECC)
      CHIPID2                   : aliased CHIPID2_Register;
      --  Bits 63:48 of public device ID (ECC)
      CHIPID3                   : aliased CHIPID3_Register;
      --  Bits 15:0 of private per-device random number (ECC) The RANDID0..7
      --  rows form a 128-bit random number generated during device test. This
      --  ID is not exposed through the USB PICOBOOT GET_INFO command or the
      --  ROM `get_sys_info()` API. However note that the USB PICOBOOT OTP
      --  access point can read the entirety of page 0, so this value is not
      --  meaningfully private unless the USB PICOBOOT interface is disabled
      --  via the DISABLE_BOOTSEL_USB_PICOBOOT_IFC flag in BOOT_FLAGS0.
      RANDID0                   : aliased RANDID0_Register;
      --  Bits 31:16 of private per-device random number (ECC)
      RANDID1                   : aliased RANDID1_Register;
      --  Bits 47:32 of private per-device random number (ECC)
      RANDID2                   : aliased RANDID2_Register;
      --  Bits 63:48 of private per-device random number (ECC)
      RANDID3                   : aliased RANDID3_Register;
      --  Bits 79:64 of private per-device random number (ECC)
      RANDID4                   : aliased RANDID4_Register;
      --  Bits 95:80 of private per-device random number (ECC)
      RANDID5                   : aliased RANDID5_Register;
      --  Bits 111:96 of private per-device random number (ECC)
      RANDID6                   : aliased RANDID6_Register;
      --  Bits 127:112 of private per-device random number (ECC)
      RANDID7                   : aliased RANDID7_Register;
      --  Ring oscillator frequency in kHz, measured during manufacturing (ECC)
      --  This is measured at 1.1 V, at room temperature, with the ROSC
      --  configuration registers in their reset state.
      ROSC_CALIB                : aliased ROSC_CALIB_Register;
      --  Low-power oscillator frequency in Hz, measured during manufacturing
      --  (ECC) This is measured at 1.1V, at room temperature, with the LPOSC
      --  trim register in its reset state.
      LPOSC_CALIB               : aliased LPOSC_CALIB_Register;
      --  The number of main user GPIOs (bank 0). Should read 48 in the QFN80
      --  package, and 30 in the QFN60 package. (ECC)
      NUM_GPIOS                 : aliased NUM_GPIOS_Register;
      --  Lower 16 bits of CRC32 of OTP addresses 0x00 through 0x6b (polynomial
      --  0x4c11db7, input reflected, output reflected, seed all-ones, final
      --  XOR all-ones) (ECC)
      INFO_CRC0                 : aliased INFO_CRC0_Register;
      --  Upper 16 bits of CRC32 of OTP addresses 0x00 through 0x6b (ECC)
      INFO_CRC1                 : aliased INFO_CRC1_Register;
      --  Page 0 critical boot flags (RBIT-8)
      CRIT0                     : aliased CRIT0_Register;
      --  Redundant copy of CRIT0
      CRIT0_R1                  : aliased CRIT0_R1_Register;
      --  Redundant copy of CRIT0
      CRIT0_R2                  : aliased CRIT0_R2_Register;
      --  Redundant copy of CRIT0
      CRIT0_R3                  : aliased CRIT0_R3_Register;
      --  Redundant copy of CRIT0
      CRIT0_R4                  : aliased CRIT0_R4_Register;
      --  Redundant copy of CRIT0
      CRIT0_R5                  : aliased CRIT0_R5_Register;
      --  Redundant copy of CRIT0
      CRIT0_R6                  : aliased CRIT0_R6_Register;
      --  Redundant copy of CRIT0
      CRIT0_R7                  : aliased CRIT0_R7_Register;
      --  Page 1 critical boot flags (RBIT-8)
      CRIT1                     : aliased CRIT1_Register;
      --  Redundant copy of CRIT1
      CRIT1_R1                  : aliased CRIT1_R1_Register;
      --  Redundant copy of CRIT1
      CRIT1_R2                  : aliased CRIT1_R2_Register;
      --  Redundant copy of CRIT1
      CRIT1_R3                  : aliased CRIT1_R3_Register;
      --  Redundant copy of CRIT1
      CRIT1_R4                  : aliased CRIT1_R4_Register;
      --  Redundant copy of CRIT1
      CRIT1_R5                  : aliased CRIT1_R5_Register;
      --  Redundant copy of CRIT1
      CRIT1_R6                  : aliased CRIT1_R6_Register;
      --  Redundant copy of CRIT1
      CRIT1_R7                  : aliased CRIT1_R7_Register;
      --  Disable/Enable boot paths/features in the RP2350 mask ROM. Disables
      --  always supersede enables. Enables are provided where there are other
      --  configurations in OTP that must be valid. (RBIT-3)
      BOOT_FLAGS0               : aliased BOOT_FLAGS0_Register;
      --  Redundant copy of BOOT_FLAGS0
      BOOT_FLAGS0_R1            : aliased BOOT_FLAGS0_R1_Register;
      --  Redundant copy of BOOT_FLAGS0
      BOOT_FLAGS0_R2            : aliased BOOT_FLAGS0_R2_Register;
      --  Disable/Enable boot paths/features in the RP2350 mask ROM. Disables
      --  always supersede enables. Enables are provided where there are other
      --  configurations in OTP that must be valid. (RBIT-3)
      BOOT_FLAGS1               : aliased BOOT_FLAGS1_Register;
      --  Redundant copy of BOOT_FLAGS1
      BOOT_FLAGS1_R1            : aliased BOOT_FLAGS1_R1_Register;
      --  Redundant copy of BOOT_FLAGS1
      BOOT_FLAGS1_R2            : aliased BOOT_FLAGS1_R2_Register;
      --  Default boot version thermometer counter, bits 23:0 (RBIT-3)
      DEFAULT_BOOT_VERSION0     : aliased DEFAULT_BOOT_VERSION0_Register;
      --  Redundant copy of DEFAULT_BOOT_VERSION0
      DEFAULT_BOOT_VERSION0_R1  : aliased DEFAULT_BOOT_VERSION0_R1_Register;
      --  Redundant copy of DEFAULT_BOOT_VERSION0
      DEFAULT_BOOT_VERSION0_R2  : aliased DEFAULT_BOOT_VERSION0_R2_Register;
      --  Default boot version thermometer counter, bits 47:24 (RBIT-3)
      DEFAULT_BOOT_VERSION1     : aliased DEFAULT_BOOT_VERSION1_Register;
      --  Redundant copy of DEFAULT_BOOT_VERSION1
      DEFAULT_BOOT_VERSION1_R1  : aliased DEFAULT_BOOT_VERSION1_R1_Register;
      --  Redundant copy of DEFAULT_BOOT_VERSION1
      DEFAULT_BOOT_VERSION1_R2  : aliased DEFAULT_BOOT_VERSION1_R2_Register;
      --  Stores information about external flash device(s). (ECC) Assumed to
      --  be valid if BOOT_FLAGS0_FLASH_DEVINFO_ENABLE is set.
      FLASH_DEVINFO             : aliased FLASH_DEVINFO_Register;
      --  Gap between partition table slot 0 and slot 1 at the start of flash
      --  (the default size is 4096 bytes) (ECC) Enabled by the
      --  OVERRIDE_FLASH_PARTITION_SLOT_SIZE bit in BOOT_FLAGS, the size is
      --  4096 * (value + 1)
      FLASH_PARTITION_SLOT_SIZE : aliased FLASH_PARTITION_SLOT_SIZE_Register;
      --  Pin configuration for LED status, used by USB bootloader. (ECC) Must
      --  be valid if BOOT_FLAGS0_ENABLE_BOOTSEL_LED is set.
      BOOTSEL_LED_CFG           : aliased BOOTSEL_LED_CFG_Register;
      --  Optional PLL configuration for BOOTSEL mode. (ECC) This should be
      --  configured to produce an exact 48 MHz based on the crystal oscillator
      --  frequency. User mode software may also use this value to calculate
      --  the expected crystal frequency based on an assumed 48 MHz PLL output.
      --  If no configuration is given, the crystal is assumed to be 12 MHz.
      --  The PLL frequency can be calculated as: PLL out = (XOSC frequency /
      --  (REFDIV+1)) x FBDIV / (POSTDIV1 x POSTDIV2) Conversely the crystal
      --  frequency can be calculated as: XOSC frequency = 48 MHz x (REFDIV+1)
      --  x (POSTDIV1 x POSTDIV2) / FBDIV (Note the +1 on REFDIV is because the
      --  value stored in this OTP location is the actual divisor value minus
      --  one.) Used if and only if ENABLE_BOOTSEL_NON_DEFAULT_PLL_XOSC_CFG is
      --  set in BOOT_FLAGS0. That bit should be set only after this row and
      --  BOOTSEL_XOSC_CFG are both correctly programmed.
      BOOTSEL_PLL_CFG           : aliased BOOTSEL_PLL_CFG_Register;
      --  Non-default crystal oscillator configuration for the USB bootloader.
      --  (ECC) These values may also be used by user code configuring the
      --  crystal oscillator. Used if and only if
      --  ENABLE_BOOTSEL_NON_DEFAULT_PLL_XOSC_CFG is set in BOOT_FLAGS0. That
      --  bit should be set only after this row and BOOTSEL_PLL_CFG are both
      --  correctly programmed.
      BOOTSEL_XOSC_CFG          : aliased BOOTSEL_XOSC_CFG_Register;
      --  USB boot specific feature flags (RBIT-3)
      USB_BOOT_FLAGS            : aliased USB_BOOT_FLAGS_Register;
      --  Redundant copy of USB_BOOT_FLAGS
      USB_BOOT_FLAGS_R1         : aliased USB_BOOT_FLAGS_R1_Register;
      --  Redundant copy of USB_BOOT_FLAGS
      USB_BOOT_FLAGS_R2         : aliased USB_BOOT_FLAGS_R2_Register;
      --  Row index of the USB_WHITE_LABEL structure within OTP (ECC) The table
      --  has 16 rows, each of which are also ECC and marked valid by the
      --  corresponding valid bit in USB_BOOT_FLAGS (ECC). The entries are
      --  either _VALUEs where the 16 bit value is used as is, or _STRDEFs
      --  which acts as a pointers to a string value. The value stored in a
      --  _STRDEF is two separate bytes: The low seven bits of the first (LSB)
      --  byte indicates the number of characters in the string, and the top
      --  bit of the first (LSB) byte if set to indicate that each character in
      --  the string is two bytes (Unicode) versus one byte if unset. The
      --  second (MSB) byte represents the location of the string data, and is
      --  encoded as the number of rows from this USB_WHITE_LABEL_ADDR; i.e.
      --  the row of the start of the string is USB_WHITE_LABEL_ADDR value +
      --  msb_byte. In each case, the corresponding valid bit enables replacing
      --  the default value for the corresponding item provided by the boot
      --  rom. Note that Unicode _STRDEFs are only supported for
      --  USB_DEVICE_PRODUCT_STRDEF, USB_DEVICE_SERIAL_NUMBER_STRDEF and
      --  USB_DEVICE_MANUFACTURER_STRDEF. Unicode values will be ignored if
      --  specified for other fields, and non-unicode values for these three
      --  items will be converted to Unicode characters by setting the upper 8
      --  bits to zero. Note that if the USB_WHITE_LABEL structure or the
      --  corresponding strings are not readable by BOOTSEL mode based on OTP
      --  permissions, or if alignment requirements are not met, then the
      --  corresponding default values are used. The index values indicate
      --  where each field is located (row USB_WHITE_LABEL_ADDR value + index):
      USB_WHITE_LABEL_ADDR      : aliased USB_WHITE_LABEL_ADDR_Register;
      --  OTP start row for the OTP boot image. (ECC) If OTP boot is enabled,
      --  the bootrom will load from this location into SRAM and then directly
      --  enter the loaded image. Note that the image must be signed if
      --  SECURE_BOOT_ENABLE is set. The image itself is assumed to be
      --  ECC-protected. This must be an even number. Equivalently, the OTP
      --  boot image must start at a word-aligned location in the ECC read data
      --  address window.
      OTPBOOT_SRC               : aliased OTPBOOT_SRC_Register;
      --  Length in rows of the OTP boot image. (ECC) OTPBOOT_LEN must be even.
      --  The total image size must be a multiple of 4 bytes (32 bits).
      OTPBOOT_LEN               : aliased OTPBOOT_LEN_Register;
      --  Bits 15:0 of the OTP boot image load destination (and entry point).
      --  (ECC) This must be a location in main SRAM (main SRAM is addresses
      --  0x20000000 through 0x20082000) and must be word-aligned.
      OTPBOOT_DST0              : aliased OTPBOOT_DST0_Register;
      --  Bits 31:16 of the OTP boot image load destination (and entry point).
      --  (ECC) This must be a location in main SRAM (main SRAM is addresses
      --  0x20000000 through 0x20082000) and must be word-aligned.
      OTPBOOT_DST1              : aliased OTPBOOT_DST1_Register;
      --  Bits 15:0 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_0                : aliased BOOTKEY0_0_Register;
      --  Bits 31:16 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_1                : aliased BOOTKEY0_1_Register;
      --  Bits 47:32 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_2                : aliased BOOTKEY0_2_Register;
      --  Bits 63:48 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_3                : aliased BOOTKEY0_3_Register;
      --  Bits 79:64 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_4                : aliased BOOTKEY0_4_Register;
      --  Bits 95:80 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_5                : aliased BOOTKEY0_5_Register;
      --  Bits 111:96 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_6                : aliased BOOTKEY0_6_Register;
      --  Bits 127:112 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_7                : aliased BOOTKEY0_7_Register;
      --  Bits 143:128 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_8                : aliased BOOTKEY0_8_Register;
      --  Bits 159:144 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_9                : aliased BOOTKEY0_9_Register;
      --  Bits 175:160 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_10               : aliased BOOTKEY0_10_Register;
      --  Bits 191:176 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_11               : aliased BOOTKEY0_11_Register;
      --  Bits 207:192 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_12               : aliased BOOTKEY0_12_Register;
      --  Bits 223:208 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_13               : aliased BOOTKEY0_13_Register;
      --  Bits 239:224 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_14               : aliased BOOTKEY0_14_Register;
      --  Bits 255:240 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_15               : aliased BOOTKEY0_15_Register;
      --  Bits 15:0 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_0                : aliased BOOTKEY1_0_Register;
      --  Bits 31:16 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_1                : aliased BOOTKEY1_1_Register;
      --  Bits 47:32 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_2                : aliased BOOTKEY1_2_Register;
      --  Bits 63:48 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_3                : aliased BOOTKEY1_3_Register;
      --  Bits 79:64 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_4                : aliased BOOTKEY1_4_Register;
      --  Bits 95:80 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_5                : aliased BOOTKEY1_5_Register;
      --  Bits 111:96 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_6                : aliased BOOTKEY1_6_Register;
      --  Bits 127:112 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_7                : aliased BOOTKEY1_7_Register;
      --  Bits 143:128 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_8                : aliased BOOTKEY1_8_Register;
      --  Bits 159:144 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_9                : aliased BOOTKEY1_9_Register;
      --  Bits 175:160 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_10               : aliased BOOTKEY1_10_Register;
      --  Bits 191:176 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_11               : aliased BOOTKEY1_11_Register;
      --  Bits 207:192 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_12               : aliased BOOTKEY1_12_Register;
      --  Bits 223:208 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_13               : aliased BOOTKEY1_13_Register;
      --  Bits 239:224 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_14               : aliased BOOTKEY1_14_Register;
      --  Bits 255:240 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_15               : aliased BOOTKEY1_15_Register;
      --  Bits 15:0 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_0                : aliased BOOTKEY2_0_Register;
      --  Bits 31:16 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_1                : aliased BOOTKEY2_1_Register;
      --  Bits 47:32 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_2                : aliased BOOTKEY2_2_Register;
      --  Bits 63:48 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_3                : aliased BOOTKEY2_3_Register;
      --  Bits 79:64 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_4                : aliased BOOTKEY2_4_Register;
      --  Bits 95:80 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_5                : aliased BOOTKEY2_5_Register;
      --  Bits 111:96 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_6                : aliased BOOTKEY2_6_Register;
      --  Bits 127:112 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_7                : aliased BOOTKEY2_7_Register;
      --  Bits 143:128 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_8                : aliased BOOTKEY2_8_Register;
      --  Bits 159:144 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_9                : aliased BOOTKEY2_9_Register;
      --  Bits 175:160 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_10               : aliased BOOTKEY2_10_Register;
      --  Bits 191:176 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_11               : aliased BOOTKEY2_11_Register;
      --  Bits 207:192 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_12               : aliased BOOTKEY2_12_Register;
      --  Bits 223:208 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_13               : aliased BOOTKEY2_13_Register;
      --  Bits 239:224 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_14               : aliased BOOTKEY2_14_Register;
      --  Bits 255:240 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_15               : aliased BOOTKEY2_15_Register;
      --  Bits 15:0 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_0                : aliased BOOTKEY3_0_Register;
      --  Bits 31:16 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_1                : aliased BOOTKEY3_1_Register;
      --  Bits 47:32 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_2                : aliased BOOTKEY3_2_Register;
      --  Bits 63:48 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_3                : aliased BOOTKEY3_3_Register;
      --  Bits 79:64 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_4                : aliased BOOTKEY3_4_Register;
      --  Bits 95:80 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_5                : aliased BOOTKEY3_5_Register;
      --  Bits 111:96 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_6                : aliased BOOTKEY3_6_Register;
      --  Bits 127:112 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_7                : aliased BOOTKEY3_7_Register;
      --  Bits 143:128 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_8                : aliased BOOTKEY3_8_Register;
      --  Bits 159:144 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_9                : aliased BOOTKEY3_9_Register;
      --  Bits 175:160 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_10               : aliased BOOTKEY3_10_Register;
      --  Bits 191:176 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_11               : aliased BOOTKEY3_11_Register;
      --  Bits 207:192 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_12               : aliased BOOTKEY3_12_Register;
      --  Bits 223:208 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_13               : aliased BOOTKEY3_13_Register;
      --  Bits 239:224 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_14               : aliased BOOTKEY3_14_Register;
      --  Bits 255:240 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_15               : aliased BOOTKEY3_15_Register;
      --  Bits 15:0 of OTP access key 1 (ECC)
      KEY1_0                    : aliased KEY1_0_Register;
      --  Bits 31:16 of OTP access key 1 (ECC)
      KEY1_1                    : aliased KEY1_1_Register;
      --  Bits 47:32 of OTP access key 1 (ECC)
      KEY1_2                    : aliased KEY1_2_Register;
      --  Bits 63:48 of OTP access key 1 (ECC)
      KEY1_3                    : aliased KEY1_3_Register;
      --  Bits 79:64 of OTP access key 1 (ECC)
      KEY1_4                    : aliased KEY1_4_Register;
      --  Bits 95:80 of OTP access key 1 (ECC)
      KEY1_5                    : aliased KEY1_5_Register;
      --  Bits 111:96 of OTP access key 1 (ECC)
      KEY1_6                    : aliased KEY1_6_Register;
      --  Bits 127:112 of OTP access key 1 (ECC)
      KEY1_7                    : aliased KEY1_7_Register;
      --  Bits 15:0 of OTP access key 2 (ECC)
      KEY2_0                    : aliased KEY2_0_Register;
      --  Bits 31:16 of OTP access key 2 (ECC)
      KEY2_1                    : aliased KEY2_1_Register;
      --  Bits 47:32 of OTP access key 2 (ECC)
      KEY2_2                    : aliased KEY2_2_Register;
      --  Bits 63:48 of OTP access key 2 (ECC)
      KEY2_3                    : aliased KEY2_3_Register;
      --  Bits 79:64 of OTP access key 2 (ECC)
      KEY2_4                    : aliased KEY2_4_Register;
      --  Bits 95:80 of OTP access key 2 (ECC)
      KEY2_5                    : aliased KEY2_5_Register;
      --  Bits 111:96 of OTP access key 2 (ECC)
      KEY2_6                    : aliased KEY2_6_Register;
      --  Bits 127:112 of OTP access key 2 (ECC)
      KEY2_7                    : aliased KEY2_7_Register;
      --  Bits 15:0 of OTP access key 3 (ECC)
      KEY3_0                    : aliased KEY3_0_Register;
      --  Bits 31:16 of OTP access key 3 (ECC)
      KEY3_1                    : aliased KEY3_1_Register;
      --  Bits 47:32 of OTP access key 3 (ECC)
      KEY3_2                    : aliased KEY3_2_Register;
      --  Bits 63:48 of OTP access key 3 (ECC)
      KEY3_3                    : aliased KEY3_3_Register;
      --  Bits 79:64 of OTP access key 3 (ECC)
      KEY3_4                    : aliased KEY3_4_Register;
      --  Bits 95:80 of OTP access key 3 (ECC)
      KEY3_5                    : aliased KEY3_5_Register;
      --  Bits 111:96 of OTP access key 3 (ECC)
      KEY3_6                    : aliased KEY3_6_Register;
      --  Bits 127:112 of OTP access key 3 (ECC)
      KEY3_7                    : aliased KEY3_7_Register;
      --  Bits 15:0 of OTP access key 4 (ECC)
      KEY4_0                    : aliased KEY4_0_Register;
      --  Bits 31:16 of OTP access key 4 (ECC)
      KEY4_1                    : aliased KEY4_1_Register;
      --  Bits 47:32 of OTP access key 4 (ECC)
      KEY4_2                    : aliased KEY4_2_Register;
      --  Bits 63:48 of OTP access key 4 (ECC)
      KEY4_3                    : aliased KEY4_3_Register;
      --  Bits 79:64 of OTP access key 4 (ECC)
      KEY4_4                    : aliased KEY4_4_Register;
      --  Bits 95:80 of OTP access key 4 (ECC)
      KEY4_5                    : aliased KEY4_5_Register;
      --  Bits 111:96 of OTP access key 4 (ECC)
      KEY4_6                    : aliased KEY4_6_Register;
      --  Bits 127:112 of OTP access key 4 (ECC)
      KEY4_7                    : aliased KEY4_7_Register;
      --  Bits 15:0 of OTP access key 5 (ECC)
      KEY5_0                    : aliased KEY5_0_Register;
      --  Bits 31:16 of OTP access key 5 (ECC)
      KEY5_1                    : aliased KEY5_1_Register;
      --  Bits 47:32 of OTP access key 5 (ECC)
      KEY5_2                    : aliased KEY5_2_Register;
      --  Bits 63:48 of OTP access key 5 (ECC)
      KEY5_3                    : aliased KEY5_3_Register;
      --  Bits 79:64 of OTP access key 5 (ECC)
      KEY5_4                    : aliased KEY5_4_Register;
      --  Bits 95:80 of OTP access key 5 (ECC)
      KEY5_5                    : aliased KEY5_5_Register;
      --  Bits 111:96 of OTP access key 5 (ECC)
      KEY5_6                    : aliased KEY5_6_Register;
      --  Bits 127:112 of OTP access key 5 (ECC)
      KEY5_7                    : aliased KEY5_7_Register;
      --  Bits 15:0 of OTP access key 6 (ECC)
      KEY6_0                    : aliased KEY6_0_Register;
      --  Bits 31:16 of OTP access key 6 (ECC)
      KEY6_1                    : aliased KEY6_1_Register;
      --  Bits 47:32 of OTP access key 6 (ECC)
      KEY6_2                    : aliased KEY6_2_Register;
      --  Bits 63:48 of OTP access key 6 (ECC)
      KEY6_3                    : aliased KEY6_3_Register;
      --  Bits 79:64 of OTP access key 6 (ECC)
      KEY6_4                    : aliased KEY6_4_Register;
      --  Bits 95:80 of OTP access key 6 (ECC)
      KEY6_5                    : aliased KEY6_5_Register;
      --  Bits 111:96 of OTP access key 6 (ECC)
      KEY6_6                    : aliased KEY6_6_Register;
      --  Bits 127:112 of OTP access key 6 (ECC)
      KEY6_7                    : aliased KEY6_7_Register;
      --  Valid flag for key 1. Once the valid flag is set, the key can no
      --  longer be read or written, and becomes a valid fixed key for
      --  protecting OTP pages.
      KEY1_VALID                : aliased KEY1_VALID_Register;
      --  Valid flag for key 2. Once the valid flag is set, the key can no
      --  longer be read or written, and becomes a valid fixed key for
      --  protecting OTP pages.
      KEY2_VALID                : aliased KEY2_VALID_Register;
      --  Valid flag for key 3. Once the valid flag is set, the key can no
      --  longer be read or written, and becomes a valid fixed key for
      --  protecting OTP pages.
      KEY3_VALID                : aliased KEY3_VALID_Register;
      --  Valid flag for key 4. Once the valid flag is set, the key can no
      --  longer be read or written, and becomes a valid fixed key for
      --  protecting OTP pages.
      KEY4_VALID                : aliased KEY4_VALID_Register;
      --  Valid flag for key 5. Once the valid flag is set, the key can no
      --  longer be read or written, and becomes a valid fixed key for
      --  protecting OTP pages.
      KEY5_VALID                : aliased KEY5_VALID_Register;
      --  Valid flag for key 6. Once the valid flag is set, the key can no
      --  longer be read or written, and becomes a valid fixed key for
      --  protecting OTP pages.
      KEY6_VALID                : aliased KEY6_VALID_Register;
      --  Lock configuration LSBs for page 0 (rows 0x0 through 0x3f). Locks are
      --  stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE0_LOCK0               : aliased PAGE0_LOCK0_Register;
      --  Lock configuration MSBs for page 0 (rows 0x0 through 0x3f). Locks are
      --  stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE0_LOCK1               : aliased PAGE0_LOCK1_Register;
      --  Lock configuration LSBs for page 1 (rows 0x40 through 0x7f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE1_LOCK0               : aliased PAGE1_LOCK0_Register;
      --  Lock configuration MSBs for page 1 (rows 0x40 through 0x7f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE1_LOCK1               : aliased PAGE1_LOCK1_Register;
      --  Lock configuration LSBs for page 2 (rows 0x80 through 0xbf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE2_LOCK0               : aliased PAGE2_LOCK0_Register;
      --  Lock configuration MSBs for page 2 (rows 0x80 through 0xbf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE2_LOCK1               : aliased PAGE2_LOCK1_Register;
      --  Lock configuration LSBs for page 3 (rows 0xc0 through 0xff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE3_LOCK0               : aliased PAGE3_LOCK0_Register;
      --  Lock configuration MSBs for page 3 (rows 0xc0 through 0xff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE3_LOCK1               : aliased PAGE3_LOCK1_Register;
      --  Lock configuration LSBs for page 4 (rows 0x100 through 0x13f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE4_LOCK0               : aliased PAGE4_LOCK0_Register;
      --  Lock configuration MSBs for page 4 (rows 0x100 through 0x13f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE4_LOCK1               : aliased PAGE4_LOCK1_Register;
      --  Lock configuration LSBs for page 5 (rows 0x140 through 0x17f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE5_LOCK0               : aliased PAGE5_LOCK0_Register;
      --  Lock configuration MSBs for page 5 (rows 0x140 through 0x17f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE5_LOCK1               : aliased PAGE5_LOCK1_Register;
      --  Lock configuration LSBs for page 6 (rows 0x180 through 0x1bf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE6_LOCK0               : aliased PAGE6_LOCK0_Register;
      --  Lock configuration MSBs for page 6 (rows 0x180 through 0x1bf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE6_LOCK1               : aliased PAGE6_LOCK1_Register;
      --  Lock configuration LSBs for page 7 (rows 0x1c0 through 0x1ff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE7_LOCK0               : aliased PAGE7_LOCK0_Register;
      --  Lock configuration MSBs for page 7 (rows 0x1c0 through 0x1ff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE7_LOCK1               : aliased PAGE7_LOCK1_Register;
      --  Lock configuration LSBs for page 8 (rows 0x200 through 0x23f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE8_LOCK0               : aliased PAGE8_LOCK0_Register;
      --  Lock configuration MSBs for page 8 (rows 0x200 through 0x23f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE8_LOCK1               : aliased PAGE8_LOCK1_Register;
      --  Lock configuration LSBs for page 9 (rows 0x240 through 0x27f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE9_LOCK0               : aliased PAGE9_LOCK0_Register;
      --  Lock configuration MSBs for page 9 (rows 0x240 through 0x27f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE9_LOCK1               : aliased PAGE9_LOCK1_Register;
      --  Lock configuration LSBs for page 10 (rows 0x280 through 0x2bf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE10_LOCK0              : aliased PAGE10_LOCK0_Register;
      --  Lock configuration MSBs for page 10 (rows 0x280 through 0x2bf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE10_LOCK1              : aliased PAGE10_LOCK1_Register;
      --  Lock configuration LSBs for page 11 (rows 0x2c0 through 0x2ff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE11_LOCK0              : aliased PAGE11_LOCK0_Register;
      --  Lock configuration MSBs for page 11 (rows 0x2c0 through 0x2ff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE11_LOCK1              : aliased PAGE11_LOCK1_Register;
      --  Lock configuration LSBs for page 12 (rows 0x300 through 0x33f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE12_LOCK0              : aliased PAGE12_LOCK0_Register;
      --  Lock configuration MSBs for page 12 (rows 0x300 through 0x33f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE12_LOCK1              : aliased PAGE12_LOCK1_Register;
      --  Lock configuration LSBs for page 13 (rows 0x340 through 0x37f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE13_LOCK0              : aliased PAGE13_LOCK0_Register;
      --  Lock configuration MSBs for page 13 (rows 0x340 through 0x37f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE13_LOCK1              : aliased PAGE13_LOCK1_Register;
      --  Lock configuration LSBs for page 14 (rows 0x380 through 0x3bf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE14_LOCK0              : aliased PAGE14_LOCK0_Register;
      --  Lock configuration MSBs for page 14 (rows 0x380 through 0x3bf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE14_LOCK1              : aliased PAGE14_LOCK1_Register;
      --  Lock configuration LSBs for page 15 (rows 0x3c0 through 0x3ff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE15_LOCK0              : aliased PAGE15_LOCK0_Register;
      --  Lock configuration MSBs for page 15 (rows 0x3c0 through 0x3ff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE15_LOCK1              : aliased PAGE15_LOCK1_Register;
      --  Lock configuration LSBs for page 16 (rows 0x400 through 0x43f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE16_LOCK0              : aliased PAGE16_LOCK0_Register;
      --  Lock configuration MSBs for page 16 (rows 0x400 through 0x43f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE16_LOCK1              : aliased PAGE16_LOCK1_Register;
      --  Lock configuration LSBs for page 17 (rows 0x440 through 0x47f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE17_LOCK0              : aliased PAGE17_LOCK0_Register;
      --  Lock configuration MSBs for page 17 (rows 0x440 through 0x47f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE17_LOCK1              : aliased PAGE17_LOCK1_Register;
      --  Lock configuration LSBs for page 18 (rows 0x480 through 0x4bf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE18_LOCK0              : aliased PAGE18_LOCK0_Register;
      --  Lock configuration MSBs for page 18 (rows 0x480 through 0x4bf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE18_LOCK1              : aliased PAGE18_LOCK1_Register;
      --  Lock configuration LSBs for page 19 (rows 0x4c0 through 0x4ff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE19_LOCK0              : aliased PAGE19_LOCK0_Register;
      --  Lock configuration MSBs for page 19 (rows 0x4c0 through 0x4ff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE19_LOCK1              : aliased PAGE19_LOCK1_Register;
      --  Lock configuration LSBs for page 20 (rows 0x500 through 0x53f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE20_LOCK0              : aliased PAGE20_LOCK0_Register;
      --  Lock configuration MSBs for page 20 (rows 0x500 through 0x53f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE20_LOCK1              : aliased PAGE20_LOCK1_Register;
      --  Lock configuration LSBs for page 21 (rows 0x540 through 0x57f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE21_LOCK0              : aliased PAGE21_LOCK0_Register;
      --  Lock configuration MSBs for page 21 (rows 0x540 through 0x57f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE21_LOCK1              : aliased PAGE21_LOCK1_Register;
      --  Lock configuration LSBs for page 22 (rows 0x580 through 0x5bf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE22_LOCK0              : aliased PAGE22_LOCK0_Register;
      --  Lock configuration MSBs for page 22 (rows 0x580 through 0x5bf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE22_LOCK1              : aliased PAGE22_LOCK1_Register;
      --  Lock configuration LSBs for page 23 (rows 0x5c0 through 0x5ff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE23_LOCK0              : aliased PAGE23_LOCK0_Register;
      --  Lock configuration MSBs for page 23 (rows 0x5c0 through 0x5ff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE23_LOCK1              : aliased PAGE23_LOCK1_Register;
      --  Lock configuration LSBs for page 24 (rows 0x600 through 0x63f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE24_LOCK0              : aliased PAGE24_LOCK0_Register;
      --  Lock configuration MSBs for page 24 (rows 0x600 through 0x63f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE24_LOCK1              : aliased PAGE24_LOCK1_Register;
      --  Lock configuration LSBs for page 25 (rows 0x640 through 0x67f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE25_LOCK0              : aliased PAGE25_LOCK0_Register;
      --  Lock configuration MSBs for page 25 (rows 0x640 through 0x67f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE25_LOCK1              : aliased PAGE25_LOCK1_Register;
      --  Lock configuration LSBs for page 26 (rows 0x680 through 0x6bf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE26_LOCK0              : aliased PAGE26_LOCK0_Register;
      --  Lock configuration MSBs for page 26 (rows 0x680 through 0x6bf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE26_LOCK1              : aliased PAGE26_LOCK1_Register;
      --  Lock configuration LSBs for page 27 (rows 0x6c0 through 0x6ff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE27_LOCK0              : aliased PAGE27_LOCK0_Register;
      --  Lock configuration MSBs for page 27 (rows 0x6c0 through 0x6ff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE27_LOCK1              : aliased PAGE27_LOCK1_Register;
      --  Lock configuration LSBs for page 28 (rows 0x700 through 0x73f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE28_LOCK0              : aliased PAGE28_LOCK0_Register;
      --  Lock configuration MSBs for page 28 (rows 0x700 through 0x73f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE28_LOCK1              : aliased PAGE28_LOCK1_Register;
      --  Lock configuration LSBs for page 29 (rows 0x740 through 0x77f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE29_LOCK0              : aliased PAGE29_LOCK0_Register;
      --  Lock configuration MSBs for page 29 (rows 0x740 through 0x77f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE29_LOCK1              : aliased PAGE29_LOCK1_Register;
      --  Lock configuration LSBs for page 30 (rows 0x780 through 0x7bf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE30_LOCK0              : aliased PAGE30_LOCK0_Register;
      --  Lock configuration MSBs for page 30 (rows 0x780 through 0x7bf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE30_LOCK1              : aliased PAGE30_LOCK1_Register;
      --  Lock configuration LSBs for page 31 (rows 0x7c0 through 0x7ff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE31_LOCK0              : aliased PAGE31_LOCK0_Register;
      --  Lock configuration MSBs for page 31 (rows 0x7c0 through 0x7ff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE31_LOCK1              : aliased PAGE31_LOCK1_Register;
      --  Lock configuration LSBs for page 32 (rows 0x800 through 0x83f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE32_LOCK0              : aliased PAGE32_LOCK0_Register;
      --  Lock configuration MSBs for page 32 (rows 0x800 through 0x83f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE32_LOCK1              : aliased PAGE32_LOCK1_Register;
      --  Lock configuration LSBs for page 33 (rows 0x840 through 0x87f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE33_LOCK0              : aliased PAGE33_LOCK0_Register;
      --  Lock configuration MSBs for page 33 (rows 0x840 through 0x87f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE33_LOCK1              : aliased PAGE33_LOCK1_Register;
      --  Lock configuration LSBs for page 34 (rows 0x880 through 0x8bf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE34_LOCK0              : aliased PAGE34_LOCK0_Register;
      --  Lock configuration MSBs for page 34 (rows 0x880 through 0x8bf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE34_LOCK1              : aliased PAGE34_LOCK1_Register;
      --  Lock configuration LSBs for page 35 (rows 0x8c0 through 0x8ff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE35_LOCK0              : aliased PAGE35_LOCK0_Register;
      --  Lock configuration MSBs for page 35 (rows 0x8c0 through 0x8ff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE35_LOCK1              : aliased PAGE35_LOCK1_Register;
      --  Lock configuration LSBs for page 36 (rows 0x900 through 0x93f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE36_LOCK0              : aliased PAGE36_LOCK0_Register;
      --  Lock configuration MSBs for page 36 (rows 0x900 through 0x93f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE36_LOCK1              : aliased PAGE36_LOCK1_Register;
      --  Lock configuration LSBs for page 37 (rows 0x940 through 0x97f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE37_LOCK0              : aliased PAGE37_LOCK0_Register;
      --  Lock configuration MSBs for page 37 (rows 0x940 through 0x97f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE37_LOCK1              : aliased PAGE37_LOCK1_Register;
      --  Lock configuration LSBs for page 38 (rows 0x980 through 0x9bf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE38_LOCK0              : aliased PAGE38_LOCK0_Register;
      --  Lock configuration MSBs for page 38 (rows 0x980 through 0x9bf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE38_LOCK1              : aliased PAGE38_LOCK1_Register;
      --  Lock configuration LSBs for page 39 (rows 0x9c0 through 0x9ff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE39_LOCK0              : aliased PAGE39_LOCK0_Register;
      --  Lock configuration MSBs for page 39 (rows 0x9c0 through 0x9ff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE39_LOCK1              : aliased PAGE39_LOCK1_Register;
      --  Lock configuration LSBs for page 40 (rows 0xa00 through 0xa3f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE40_LOCK0              : aliased PAGE40_LOCK0_Register;
      --  Lock configuration MSBs for page 40 (rows 0xa00 through 0xa3f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE40_LOCK1              : aliased PAGE40_LOCK1_Register;
      --  Lock configuration LSBs for page 41 (rows 0xa40 through 0xa7f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE41_LOCK0              : aliased PAGE41_LOCK0_Register;
      --  Lock configuration MSBs for page 41 (rows 0xa40 through 0xa7f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE41_LOCK1              : aliased PAGE41_LOCK1_Register;
      --  Lock configuration LSBs for page 42 (rows 0xa80 through 0xabf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE42_LOCK0              : aliased PAGE42_LOCK0_Register;
      --  Lock configuration MSBs for page 42 (rows 0xa80 through 0xabf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE42_LOCK1              : aliased PAGE42_LOCK1_Register;
      --  Lock configuration LSBs for page 43 (rows 0xac0 through 0xaff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE43_LOCK0              : aliased PAGE43_LOCK0_Register;
      --  Lock configuration MSBs for page 43 (rows 0xac0 through 0xaff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE43_LOCK1              : aliased PAGE43_LOCK1_Register;
      --  Lock configuration LSBs for page 44 (rows 0xb00 through 0xb3f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE44_LOCK0              : aliased PAGE44_LOCK0_Register;
      --  Lock configuration MSBs for page 44 (rows 0xb00 through 0xb3f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE44_LOCK1              : aliased PAGE44_LOCK1_Register;
      --  Lock configuration LSBs for page 45 (rows 0xb40 through 0xb7f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE45_LOCK0              : aliased PAGE45_LOCK0_Register;
      --  Lock configuration MSBs for page 45 (rows 0xb40 through 0xb7f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE45_LOCK1              : aliased PAGE45_LOCK1_Register;
      --  Lock configuration LSBs for page 46 (rows 0xb80 through 0xbbf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE46_LOCK0              : aliased PAGE46_LOCK0_Register;
      --  Lock configuration MSBs for page 46 (rows 0xb80 through 0xbbf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE46_LOCK1              : aliased PAGE46_LOCK1_Register;
      --  Lock configuration LSBs for page 47 (rows 0xbc0 through 0xbff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE47_LOCK0              : aliased PAGE47_LOCK0_Register;
      --  Lock configuration MSBs for page 47 (rows 0xbc0 through 0xbff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE47_LOCK1              : aliased PAGE47_LOCK1_Register;
      --  Lock configuration LSBs for page 48 (rows 0xc00 through 0xc3f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE48_LOCK0              : aliased PAGE48_LOCK0_Register;
      --  Lock configuration MSBs for page 48 (rows 0xc00 through 0xc3f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE48_LOCK1              : aliased PAGE48_LOCK1_Register;
      --  Lock configuration LSBs for page 49 (rows 0xc40 through 0xc7f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE49_LOCK0              : aliased PAGE49_LOCK0_Register;
      --  Lock configuration MSBs for page 49 (rows 0xc40 through 0xc7f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE49_LOCK1              : aliased PAGE49_LOCK1_Register;
      --  Lock configuration LSBs for page 50 (rows 0xc80 through 0xcbf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE50_LOCK0              : aliased PAGE50_LOCK0_Register;
      --  Lock configuration MSBs for page 50 (rows 0xc80 through 0xcbf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE50_LOCK1              : aliased PAGE50_LOCK1_Register;
      --  Lock configuration LSBs for page 51 (rows 0xcc0 through 0xcff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE51_LOCK0              : aliased PAGE51_LOCK0_Register;
      --  Lock configuration MSBs for page 51 (rows 0xcc0 through 0xcff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE51_LOCK1              : aliased PAGE51_LOCK1_Register;
      --  Lock configuration LSBs for page 52 (rows 0xd00 through 0xd3f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE52_LOCK0              : aliased PAGE52_LOCK0_Register;
      --  Lock configuration MSBs for page 52 (rows 0xd00 through 0xd3f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE52_LOCK1              : aliased PAGE52_LOCK1_Register;
      --  Lock configuration LSBs for page 53 (rows 0xd40 through 0xd7f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE53_LOCK0              : aliased PAGE53_LOCK0_Register;
      --  Lock configuration MSBs for page 53 (rows 0xd40 through 0xd7f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE53_LOCK1              : aliased PAGE53_LOCK1_Register;
      --  Lock configuration LSBs for page 54 (rows 0xd80 through 0xdbf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE54_LOCK0              : aliased PAGE54_LOCK0_Register;
      --  Lock configuration MSBs for page 54 (rows 0xd80 through 0xdbf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE54_LOCK1              : aliased PAGE54_LOCK1_Register;
      --  Lock configuration LSBs for page 55 (rows 0xdc0 through 0xdff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE55_LOCK0              : aliased PAGE55_LOCK0_Register;
      --  Lock configuration MSBs for page 55 (rows 0xdc0 through 0xdff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE55_LOCK1              : aliased PAGE55_LOCK1_Register;
      --  Lock configuration LSBs for page 56 (rows 0xe00 through 0xe3f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE56_LOCK0              : aliased PAGE56_LOCK0_Register;
      --  Lock configuration MSBs for page 56 (rows 0xe00 through 0xe3f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE56_LOCK1              : aliased PAGE56_LOCK1_Register;
      --  Lock configuration LSBs for page 57 (rows 0xe40 through 0xe7f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE57_LOCK0              : aliased PAGE57_LOCK0_Register;
      --  Lock configuration MSBs for page 57 (rows 0xe40 through 0xe7f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE57_LOCK1              : aliased PAGE57_LOCK1_Register;
      --  Lock configuration LSBs for page 58 (rows 0xe80 through 0xebf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE58_LOCK0              : aliased PAGE58_LOCK0_Register;
      --  Lock configuration MSBs for page 58 (rows 0xe80 through 0xebf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE58_LOCK1              : aliased PAGE58_LOCK1_Register;
      --  Lock configuration LSBs for page 59 (rows 0xec0 through 0xeff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE59_LOCK0              : aliased PAGE59_LOCK0_Register;
      --  Lock configuration MSBs for page 59 (rows 0xec0 through 0xeff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE59_LOCK1              : aliased PAGE59_LOCK1_Register;
      --  Lock configuration LSBs for page 60 (rows 0xf00 through 0xf3f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE60_LOCK0              : aliased PAGE60_LOCK0_Register;
      --  Lock configuration MSBs for page 60 (rows 0xf00 through 0xf3f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE60_LOCK1              : aliased PAGE60_LOCK1_Register;
      --  Lock configuration LSBs for page 61 (rows 0xf40 through 0xf7f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE61_LOCK0              : aliased PAGE61_LOCK0_Register;
      --  Lock configuration MSBs for page 61 (rows 0xf40 through 0xf7f). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE61_LOCK1              : aliased PAGE61_LOCK1_Register;
      --  Lock configuration LSBs for page 62 (rows 0xf80 through 0xfbf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE62_LOCK0              : aliased PAGE62_LOCK0_Register;
      --  Lock configuration MSBs for page 62 (rows 0xf80 through 0xfbf). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE62_LOCK1              : aliased PAGE62_LOCK1_Register;
      --  Lock configuration LSBs for page 63 (rows 0xfc0 through 0xfff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE63_LOCK0              : aliased PAGE63_LOCK0_Register;
      --  Lock configuration MSBs for page 63 (rows 0xfc0 through 0xfff). Locks
      --  are stored with 3-way majority vote encoding, so that bits can be set
      --  independently. This OTP location is always readable, and is
      --  write-protected by its own permissions.
      PAGE63_LOCK1              : aliased PAGE63_LOCK1_Register;
   end record
     with Volatile;

   for OTP_DATA_RAW_Peripheral use record
      CHIPID0                   at 16#0# range 0 .. 31;
      CHIPID1                   at 16#4# range 0 .. 31;
      CHIPID2                   at 16#8# range 0 .. 31;
      CHIPID3                   at 16#C# range 0 .. 31;
      RANDID0                   at 16#10# range 0 .. 31;
      RANDID1                   at 16#14# range 0 .. 31;
      RANDID2                   at 16#18# range 0 .. 31;
      RANDID3                   at 16#1C# range 0 .. 31;
      RANDID4                   at 16#20# range 0 .. 31;
      RANDID5                   at 16#24# range 0 .. 31;
      RANDID6                   at 16#28# range 0 .. 31;
      RANDID7                   at 16#2C# range 0 .. 31;
      ROSC_CALIB                at 16#40# range 0 .. 31;
      LPOSC_CALIB               at 16#44# range 0 .. 31;
      NUM_GPIOS                 at 16#60# range 0 .. 31;
      INFO_CRC0                 at 16#D8# range 0 .. 31;
      INFO_CRC1                 at 16#DC# range 0 .. 31;
      CRIT0                     at 16#E0# range 0 .. 31;
      CRIT0_R1                  at 16#E4# range 0 .. 31;
      CRIT0_R2                  at 16#E8# range 0 .. 31;
      CRIT0_R3                  at 16#EC# range 0 .. 31;
      CRIT0_R4                  at 16#F0# range 0 .. 31;
      CRIT0_R5                  at 16#F4# range 0 .. 31;
      CRIT0_R6                  at 16#F8# range 0 .. 31;
      CRIT0_R7                  at 16#FC# range 0 .. 31;
      CRIT1                     at 16#100# range 0 .. 31;
      CRIT1_R1                  at 16#104# range 0 .. 31;
      CRIT1_R2                  at 16#108# range 0 .. 31;
      CRIT1_R3                  at 16#10C# range 0 .. 31;
      CRIT1_R4                  at 16#110# range 0 .. 31;
      CRIT1_R5                  at 16#114# range 0 .. 31;
      CRIT1_R6                  at 16#118# range 0 .. 31;
      CRIT1_R7                  at 16#11C# range 0 .. 31;
      BOOT_FLAGS0               at 16#120# range 0 .. 31;
      BOOT_FLAGS0_R1            at 16#124# range 0 .. 31;
      BOOT_FLAGS0_R2            at 16#128# range 0 .. 31;
      BOOT_FLAGS1               at 16#12C# range 0 .. 31;
      BOOT_FLAGS1_R1            at 16#130# range 0 .. 31;
      BOOT_FLAGS1_R2            at 16#134# range 0 .. 31;
      DEFAULT_BOOT_VERSION0     at 16#138# range 0 .. 31;
      DEFAULT_BOOT_VERSION0_R1  at 16#13C# range 0 .. 31;
      DEFAULT_BOOT_VERSION0_R2  at 16#140# range 0 .. 31;
      DEFAULT_BOOT_VERSION1     at 16#144# range 0 .. 31;
      DEFAULT_BOOT_VERSION1_R1  at 16#148# range 0 .. 31;
      DEFAULT_BOOT_VERSION1_R2  at 16#14C# range 0 .. 31;
      FLASH_DEVINFO             at 16#150# range 0 .. 31;
      FLASH_PARTITION_SLOT_SIZE at 16#154# range 0 .. 31;
      BOOTSEL_LED_CFG           at 16#158# range 0 .. 31;
      BOOTSEL_PLL_CFG           at 16#15C# range 0 .. 31;
      BOOTSEL_XOSC_CFG          at 16#160# range 0 .. 31;
      USB_BOOT_FLAGS            at 16#164# range 0 .. 31;
      USB_BOOT_FLAGS_R1         at 16#168# range 0 .. 31;
      USB_BOOT_FLAGS_R2         at 16#16C# range 0 .. 31;
      USB_WHITE_LABEL_ADDR      at 16#170# range 0 .. 31;
      OTPBOOT_SRC               at 16#178# range 0 .. 31;
      OTPBOOT_LEN               at 16#17C# range 0 .. 31;
      OTPBOOT_DST0              at 16#180# range 0 .. 31;
      OTPBOOT_DST1              at 16#184# range 0 .. 31;
      BOOTKEY0_0                at 16#200# range 0 .. 31;
      BOOTKEY0_1                at 16#204# range 0 .. 31;
      BOOTKEY0_2                at 16#208# range 0 .. 31;
      BOOTKEY0_3                at 16#20C# range 0 .. 31;
      BOOTKEY0_4                at 16#210# range 0 .. 31;
      BOOTKEY0_5                at 16#214# range 0 .. 31;
      BOOTKEY0_6                at 16#218# range 0 .. 31;
      BOOTKEY0_7                at 16#21C# range 0 .. 31;
      BOOTKEY0_8                at 16#220# range 0 .. 31;
      BOOTKEY0_9                at 16#224# range 0 .. 31;
      BOOTKEY0_10               at 16#228# range 0 .. 31;
      BOOTKEY0_11               at 16#22C# range 0 .. 31;
      BOOTKEY0_12               at 16#230# range 0 .. 31;
      BOOTKEY0_13               at 16#234# range 0 .. 31;
      BOOTKEY0_14               at 16#238# range 0 .. 31;
      BOOTKEY0_15               at 16#23C# range 0 .. 31;
      BOOTKEY1_0                at 16#240# range 0 .. 31;
      BOOTKEY1_1                at 16#244# range 0 .. 31;
      BOOTKEY1_2                at 16#248# range 0 .. 31;
      BOOTKEY1_3                at 16#24C# range 0 .. 31;
      BOOTKEY1_4                at 16#250# range 0 .. 31;
      BOOTKEY1_5                at 16#254# range 0 .. 31;
      BOOTKEY1_6                at 16#258# range 0 .. 31;
      BOOTKEY1_7                at 16#25C# range 0 .. 31;
      BOOTKEY1_8                at 16#260# range 0 .. 31;
      BOOTKEY1_9                at 16#264# range 0 .. 31;
      BOOTKEY1_10               at 16#268# range 0 .. 31;
      BOOTKEY1_11               at 16#26C# range 0 .. 31;
      BOOTKEY1_12               at 16#270# range 0 .. 31;
      BOOTKEY1_13               at 16#274# range 0 .. 31;
      BOOTKEY1_14               at 16#278# range 0 .. 31;
      BOOTKEY1_15               at 16#27C# range 0 .. 31;
      BOOTKEY2_0                at 16#280# range 0 .. 31;
      BOOTKEY2_1                at 16#284# range 0 .. 31;
      BOOTKEY2_2                at 16#288# range 0 .. 31;
      BOOTKEY2_3                at 16#28C# range 0 .. 31;
      BOOTKEY2_4                at 16#290# range 0 .. 31;
      BOOTKEY2_5                at 16#294# range 0 .. 31;
      BOOTKEY2_6                at 16#298# range 0 .. 31;
      BOOTKEY2_7                at 16#29C# range 0 .. 31;
      BOOTKEY2_8                at 16#2A0# range 0 .. 31;
      BOOTKEY2_9                at 16#2A4# range 0 .. 31;
      BOOTKEY2_10               at 16#2A8# range 0 .. 31;
      BOOTKEY2_11               at 16#2AC# range 0 .. 31;
      BOOTKEY2_12               at 16#2B0# range 0 .. 31;
      BOOTKEY2_13               at 16#2B4# range 0 .. 31;
      BOOTKEY2_14               at 16#2B8# range 0 .. 31;
      BOOTKEY2_15               at 16#2BC# range 0 .. 31;
      BOOTKEY3_0                at 16#2C0# range 0 .. 31;
      BOOTKEY3_1                at 16#2C4# range 0 .. 31;
      BOOTKEY3_2                at 16#2C8# range 0 .. 31;
      BOOTKEY3_3                at 16#2CC# range 0 .. 31;
      BOOTKEY3_4                at 16#2D0# range 0 .. 31;
      BOOTKEY3_5                at 16#2D4# range 0 .. 31;
      BOOTKEY3_6                at 16#2D8# range 0 .. 31;
      BOOTKEY3_7                at 16#2DC# range 0 .. 31;
      BOOTKEY3_8                at 16#2E0# range 0 .. 31;
      BOOTKEY3_9                at 16#2E4# range 0 .. 31;
      BOOTKEY3_10               at 16#2E8# range 0 .. 31;
      BOOTKEY3_11               at 16#2EC# range 0 .. 31;
      BOOTKEY3_12               at 16#2F0# range 0 .. 31;
      BOOTKEY3_13               at 16#2F4# range 0 .. 31;
      BOOTKEY3_14               at 16#2F8# range 0 .. 31;
      BOOTKEY3_15               at 16#2FC# range 0 .. 31;
      KEY1_0                    at 16#3D20# range 0 .. 31;
      KEY1_1                    at 16#3D24# range 0 .. 31;
      KEY1_2                    at 16#3D28# range 0 .. 31;
      KEY1_3                    at 16#3D2C# range 0 .. 31;
      KEY1_4                    at 16#3D30# range 0 .. 31;
      KEY1_5                    at 16#3D34# range 0 .. 31;
      KEY1_6                    at 16#3D38# range 0 .. 31;
      KEY1_7                    at 16#3D3C# range 0 .. 31;
      KEY2_0                    at 16#3D40# range 0 .. 31;
      KEY2_1                    at 16#3D44# range 0 .. 31;
      KEY2_2                    at 16#3D48# range 0 .. 31;
      KEY2_3                    at 16#3D4C# range 0 .. 31;
      KEY2_4                    at 16#3D50# range 0 .. 31;
      KEY2_5                    at 16#3D54# range 0 .. 31;
      KEY2_6                    at 16#3D58# range 0 .. 31;
      KEY2_7                    at 16#3D5C# range 0 .. 31;
      KEY3_0                    at 16#3D60# range 0 .. 31;
      KEY3_1                    at 16#3D64# range 0 .. 31;
      KEY3_2                    at 16#3D68# range 0 .. 31;
      KEY3_3                    at 16#3D6C# range 0 .. 31;
      KEY3_4                    at 16#3D70# range 0 .. 31;
      KEY3_5                    at 16#3D74# range 0 .. 31;
      KEY3_6                    at 16#3D78# range 0 .. 31;
      KEY3_7                    at 16#3D7C# range 0 .. 31;
      KEY4_0                    at 16#3D80# range 0 .. 31;
      KEY4_1                    at 16#3D84# range 0 .. 31;
      KEY4_2                    at 16#3D88# range 0 .. 31;
      KEY4_3                    at 16#3D8C# range 0 .. 31;
      KEY4_4                    at 16#3D90# range 0 .. 31;
      KEY4_5                    at 16#3D94# range 0 .. 31;
      KEY4_6                    at 16#3D98# range 0 .. 31;
      KEY4_7                    at 16#3D9C# range 0 .. 31;
      KEY5_0                    at 16#3DA0# range 0 .. 31;
      KEY5_1                    at 16#3DA4# range 0 .. 31;
      KEY5_2                    at 16#3DA8# range 0 .. 31;
      KEY5_3                    at 16#3DAC# range 0 .. 31;
      KEY5_4                    at 16#3DB0# range 0 .. 31;
      KEY5_5                    at 16#3DB4# range 0 .. 31;
      KEY5_6                    at 16#3DB8# range 0 .. 31;
      KEY5_7                    at 16#3DBC# range 0 .. 31;
      KEY6_0                    at 16#3DC0# range 0 .. 31;
      KEY6_1                    at 16#3DC4# range 0 .. 31;
      KEY6_2                    at 16#3DC8# range 0 .. 31;
      KEY6_3                    at 16#3DCC# range 0 .. 31;
      KEY6_4                    at 16#3DD0# range 0 .. 31;
      KEY6_5                    at 16#3DD4# range 0 .. 31;
      KEY6_6                    at 16#3DD8# range 0 .. 31;
      KEY6_7                    at 16#3DDC# range 0 .. 31;
      KEY1_VALID                at 16#3DE4# range 0 .. 31;
      KEY2_VALID                at 16#3DE8# range 0 .. 31;
      KEY3_VALID                at 16#3DEC# range 0 .. 31;
      KEY4_VALID                at 16#3DF0# range 0 .. 31;
      KEY5_VALID                at 16#3DF4# range 0 .. 31;
      KEY6_VALID                at 16#3DF8# range 0 .. 31;
      PAGE0_LOCK0               at 16#3E00# range 0 .. 31;
      PAGE0_LOCK1               at 16#3E04# range 0 .. 31;
      PAGE1_LOCK0               at 16#3E08# range 0 .. 31;
      PAGE1_LOCK1               at 16#3E0C# range 0 .. 31;
      PAGE2_LOCK0               at 16#3E10# range 0 .. 31;
      PAGE2_LOCK1               at 16#3E14# range 0 .. 31;
      PAGE3_LOCK0               at 16#3E18# range 0 .. 31;
      PAGE3_LOCK1               at 16#3E1C# range 0 .. 31;
      PAGE4_LOCK0               at 16#3E20# range 0 .. 31;
      PAGE4_LOCK1               at 16#3E24# range 0 .. 31;
      PAGE5_LOCK0               at 16#3E28# range 0 .. 31;
      PAGE5_LOCK1               at 16#3E2C# range 0 .. 31;
      PAGE6_LOCK0               at 16#3E30# range 0 .. 31;
      PAGE6_LOCK1               at 16#3E34# range 0 .. 31;
      PAGE7_LOCK0               at 16#3E38# range 0 .. 31;
      PAGE7_LOCK1               at 16#3E3C# range 0 .. 31;
      PAGE8_LOCK0               at 16#3E40# range 0 .. 31;
      PAGE8_LOCK1               at 16#3E44# range 0 .. 31;
      PAGE9_LOCK0               at 16#3E48# range 0 .. 31;
      PAGE9_LOCK1               at 16#3E4C# range 0 .. 31;
      PAGE10_LOCK0              at 16#3E50# range 0 .. 31;
      PAGE10_LOCK1              at 16#3E54# range 0 .. 31;
      PAGE11_LOCK0              at 16#3E58# range 0 .. 31;
      PAGE11_LOCK1              at 16#3E5C# range 0 .. 31;
      PAGE12_LOCK0              at 16#3E60# range 0 .. 31;
      PAGE12_LOCK1              at 16#3E64# range 0 .. 31;
      PAGE13_LOCK0              at 16#3E68# range 0 .. 31;
      PAGE13_LOCK1              at 16#3E6C# range 0 .. 31;
      PAGE14_LOCK0              at 16#3E70# range 0 .. 31;
      PAGE14_LOCK1              at 16#3E74# range 0 .. 31;
      PAGE15_LOCK0              at 16#3E78# range 0 .. 31;
      PAGE15_LOCK1              at 16#3E7C# range 0 .. 31;
      PAGE16_LOCK0              at 16#3E80# range 0 .. 31;
      PAGE16_LOCK1              at 16#3E84# range 0 .. 31;
      PAGE17_LOCK0              at 16#3E88# range 0 .. 31;
      PAGE17_LOCK1              at 16#3E8C# range 0 .. 31;
      PAGE18_LOCK0              at 16#3E90# range 0 .. 31;
      PAGE18_LOCK1              at 16#3E94# range 0 .. 31;
      PAGE19_LOCK0              at 16#3E98# range 0 .. 31;
      PAGE19_LOCK1              at 16#3E9C# range 0 .. 31;
      PAGE20_LOCK0              at 16#3EA0# range 0 .. 31;
      PAGE20_LOCK1              at 16#3EA4# range 0 .. 31;
      PAGE21_LOCK0              at 16#3EA8# range 0 .. 31;
      PAGE21_LOCK1              at 16#3EAC# range 0 .. 31;
      PAGE22_LOCK0              at 16#3EB0# range 0 .. 31;
      PAGE22_LOCK1              at 16#3EB4# range 0 .. 31;
      PAGE23_LOCK0              at 16#3EB8# range 0 .. 31;
      PAGE23_LOCK1              at 16#3EBC# range 0 .. 31;
      PAGE24_LOCK0              at 16#3EC0# range 0 .. 31;
      PAGE24_LOCK1              at 16#3EC4# range 0 .. 31;
      PAGE25_LOCK0              at 16#3EC8# range 0 .. 31;
      PAGE25_LOCK1              at 16#3ECC# range 0 .. 31;
      PAGE26_LOCK0              at 16#3ED0# range 0 .. 31;
      PAGE26_LOCK1              at 16#3ED4# range 0 .. 31;
      PAGE27_LOCK0              at 16#3ED8# range 0 .. 31;
      PAGE27_LOCK1              at 16#3EDC# range 0 .. 31;
      PAGE28_LOCK0              at 16#3EE0# range 0 .. 31;
      PAGE28_LOCK1              at 16#3EE4# range 0 .. 31;
      PAGE29_LOCK0              at 16#3EE8# range 0 .. 31;
      PAGE29_LOCK1              at 16#3EEC# range 0 .. 31;
      PAGE30_LOCK0              at 16#3EF0# range 0 .. 31;
      PAGE30_LOCK1              at 16#3EF4# range 0 .. 31;
      PAGE31_LOCK0              at 16#3EF8# range 0 .. 31;
      PAGE31_LOCK1              at 16#3EFC# range 0 .. 31;
      PAGE32_LOCK0              at 16#3F00# range 0 .. 31;
      PAGE32_LOCK1              at 16#3F04# range 0 .. 31;
      PAGE33_LOCK0              at 16#3F08# range 0 .. 31;
      PAGE33_LOCK1              at 16#3F0C# range 0 .. 31;
      PAGE34_LOCK0              at 16#3F10# range 0 .. 31;
      PAGE34_LOCK1              at 16#3F14# range 0 .. 31;
      PAGE35_LOCK0              at 16#3F18# range 0 .. 31;
      PAGE35_LOCK1              at 16#3F1C# range 0 .. 31;
      PAGE36_LOCK0              at 16#3F20# range 0 .. 31;
      PAGE36_LOCK1              at 16#3F24# range 0 .. 31;
      PAGE37_LOCK0              at 16#3F28# range 0 .. 31;
      PAGE37_LOCK1              at 16#3F2C# range 0 .. 31;
      PAGE38_LOCK0              at 16#3F30# range 0 .. 31;
      PAGE38_LOCK1              at 16#3F34# range 0 .. 31;
      PAGE39_LOCK0              at 16#3F38# range 0 .. 31;
      PAGE39_LOCK1              at 16#3F3C# range 0 .. 31;
      PAGE40_LOCK0              at 16#3F40# range 0 .. 31;
      PAGE40_LOCK1              at 16#3F44# range 0 .. 31;
      PAGE41_LOCK0              at 16#3F48# range 0 .. 31;
      PAGE41_LOCK1              at 16#3F4C# range 0 .. 31;
      PAGE42_LOCK0              at 16#3F50# range 0 .. 31;
      PAGE42_LOCK1              at 16#3F54# range 0 .. 31;
      PAGE43_LOCK0              at 16#3F58# range 0 .. 31;
      PAGE43_LOCK1              at 16#3F5C# range 0 .. 31;
      PAGE44_LOCK0              at 16#3F60# range 0 .. 31;
      PAGE44_LOCK1              at 16#3F64# range 0 .. 31;
      PAGE45_LOCK0              at 16#3F68# range 0 .. 31;
      PAGE45_LOCK1              at 16#3F6C# range 0 .. 31;
      PAGE46_LOCK0              at 16#3F70# range 0 .. 31;
      PAGE46_LOCK1              at 16#3F74# range 0 .. 31;
      PAGE47_LOCK0              at 16#3F78# range 0 .. 31;
      PAGE47_LOCK1              at 16#3F7C# range 0 .. 31;
      PAGE48_LOCK0              at 16#3F80# range 0 .. 31;
      PAGE48_LOCK1              at 16#3F84# range 0 .. 31;
      PAGE49_LOCK0              at 16#3F88# range 0 .. 31;
      PAGE49_LOCK1              at 16#3F8C# range 0 .. 31;
      PAGE50_LOCK0              at 16#3F90# range 0 .. 31;
      PAGE50_LOCK1              at 16#3F94# range 0 .. 31;
      PAGE51_LOCK0              at 16#3F98# range 0 .. 31;
      PAGE51_LOCK1              at 16#3F9C# range 0 .. 31;
      PAGE52_LOCK0              at 16#3FA0# range 0 .. 31;
      PAGE52_LOCK1              at 16#3FA4# range 0 .. 31;
      PAGE53_LOCK0              at 16#3FA8# range 0 .. 31;
      PAGE53_LOCK1              at 16#3FAC# range 0 .. 31;
      PAGE54_LOCK0              at 16#3FB0# range 0 .. 31;
      PAGE54_LOCK1              at 16#3FB4# range 0 .. 31;
      PAGE55_LOCK0              at 16#3FB8# range 0 .. 31;
      PAGE55_LOCK1              at 16#3FBC# range 0 .. 31;
      PAGE56_LOCK0              at 16#3FC0# range 0 .. 31;
      PAGE56_LOCK1              at 16#3FC4# range 0 .. 31;
      PAGE57_LOCK0              at 16#3FC8# range 0 .. 31;
      PAGE57_LOCK1              at 16#3FCC# range 0 .. 31;
      PAGE58_LOCK0              at 16#3FD0# range 0 .. 31;
      PAGE58_LOCK1              at 16#3FD4# range 0 .. 31;
      PAGE59_LOCK0              at 16#3FD8# range 0 .. 31;
      PAGE59_LOCK1              at 16#3FDC# range 0 .. 31;
      PAGE60_LOCK0              at 16#3FE0# range 0 .. 31;
      PAGE60_LOCK1              at 16#3FE4# range 0 .. 31;
      PAGE61_LOCK0              at 16#3FE8# range 0 .. 31;
      PAGE61_LOCK1              at 16#3FEC# range 0 .. 31;
      PAGE62_LOCK0              at 16#3FF0# range 0 .. 31;
      PAGE62_LOCK1              at 16#3FF4# range 0 .. 31;
      PAGE63_LOCK0              at 16#3FF8# range 0 .. 31;
      PAGE63_LOCK1              at 16#3FFC# range 0 .. 31;
   end record;

   --  Predefined OTP data layout for RP2350
   OTP_DATA_RAW_Periph : aliased OTP_DATA_RAW_Peripheral
     with Import, Address => OTP_DATA_RAW_Base;

end RP2350_SVD.OTP_DATA_RAW;
