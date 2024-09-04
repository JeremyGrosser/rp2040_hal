pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package RP2350_SVD.SYSINFO is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CHIP_ID_MANUFACTURER_Field is HAL.UInt11;
   subtype CHIP_ID_PART_Field is HAL.UInt16;
   subtype CHIP_ID_REVISION_Field is HAL.UInt4;

   --  JEDEC JEP-106 compliant chip identifier.
   type CHIP_ID_Register is record
      --  Read-only.
      STOP_BIT     : Boolean;
      --  Read-only.
      MANUFACTURER : CHIP_ID_MANUFACTURER_Field;
      --  Read-only.
      PART         : CHIP_ID_PART_Field;
      --  Read-only.
      REVISION     : CHIP_ID_REVISION_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CHIP_ID_Register use record
      STOP_BIT     at 0 range 0 .. 0;
      MANUFACTURER at 0 range 1 .. 11;
      PART         at 0 range 12 .. 27;
      REVISION     at 0 range 28 .. 31;
   end record;

   type PACKAGE_SEL_Register is record
      --  Read-only.
      PACKAGE_SEL   : Boolean;
      --  unspecified
      Reserved_1_31 : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PACKAGE_SEL_Register use record
      PACKAGE_SEL   at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Platform register. Allows software to know what environment it is
   --  running in during pre-production development. Post-production, the
   --  PLATFORM is always ASIC, non-SIM.
   type PLATFORM_Register is record
      --  Read-only.
      FPGA          : Boolean;
      --  Read-only.
      ASIC          : Boolean;
      --  Read-only.
      HDLSIM        : Boolean;
      --  Read-only.
      BATCHSIM      : Boolean;
      --  Read-only.
      GATESIM       : Boolean;
      --  unspecified
      Reserved_5_31 : HAL.UInt27;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PLATFORM_Register use record
      FPGA          at 0 range 0 .. 0;
      ASIC          at 0 range 1 .. 1;
      HDLSIM        at 0 range 2 .. 2;
      BATCHSIM      at 0 range 3 .. 3;
      GATESIM       at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type SYSINFO_Peripheral is record
      --  JEDEC JEP-106 compliant chip identifier.
      CHIP_ID       : aliased CHIP_ID_Register;
      PACKAGE_SEL   : aliased PACKAGE_SEL_Register;
      --  Platform register. Allows software to know what environment it is
      --  running in during pre-production development. Post-production, the
      --  PLATFORM is always ASIC, non-SIM.
      PLATFORM      : aliased PLATFORM_Register;
      --  Git hash of the chip source. Used to identify chip version.
      GITREF_RP2350 : aliased HAL.UInt32;
   end record
     with Volatile;

   for SYSINFO_Peripheral use record
      CHIP_ID       at 16#0# range 0 .. 31;
      PACKAGE_SEL   at 16#4# range 0 .. 31;
      PLATFORM      at 16#8# range 0 .. 31;
      GITREF_RP2350 at 16#14# range 0 .. 31;
   end record;

   SYSINFO_Periph : aliased SYSINFO_Peripheral
     with Import, Address => SYSINFO_Base;

end RP2350_SVD.SYSINFO;
