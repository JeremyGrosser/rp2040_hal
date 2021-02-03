pragma Style_Checks (Off);

--  Copyright (c) 2020 Raspberry Pi (Trading) Ltd.
--
--  SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2040.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package RP2040_SVD.SYSINFO is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CHIP_ID_MANUFACTURER_Field is HAL.UInt12;
   subtype CHIP_ID_PART_Field is HAL.UInt16;
   subtype CHIP_ID_REVISION_Field is HAL.UInt4;

   --  JEDEC JEP-106 compliant chip identifier.
   type CHIP_ID_Register is record
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
      MANUFACTURER at 0 range 0 .. 11;
      PART         at 0 range 12 .. 27;
      REVISION     at 0 range 28 .. 31;
   end record;

   --  Platform register. Allows software to know what environment it is
   --  running in.
   type PLATFORM_Register is record
      --  Read-only.
      FPGA          : Boolean;
      --  Read-only.
      ASIC          : Boolean;
      --  unspecified
      Reserved_2_31 : HAL.UInt30;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PLATFORM_Register use record
      FPGA          at 0 range 0 .. 0;
      ASIC          at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type SYSINFO_Peripheral is record
      --  JEDEC JEP-106 compliant chip identifier.
      CHIP_ID       : aliased CHIP_ID_Register;
      --  Platform register. Allows software to know what environment it is
      --  running in.
      PLATFORM      : aliased PLATFORM_Register;
      --  Git hash of the chip source. Used to identify chip version.
      GITREF_RP2040 : aliased HAL.UInt32;
   end record
     with Volatile;

   for SYSINFO_Peripheral use record
      CHIP_ID       at 16#0# range 0 .. 31;
      PLATFORM      at 16#4# range 0 .. 31;
      GITREF_RP2040 at 16#40# range 0 .. 31;
   end record;

   SYSINFO_Periph : aliased SYSINFO_Peripheral
     with Import, Address => SYSINFO_Base;

end RP2040_SVD.SYSINFO;
