pragma Style_Checks (Off);

--  Copyright (c) 2020 Raspberry Pi (Trading) Ltd.
--
--  SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2040.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

--  Register block to control RTC
package RP2040_SVD.RTC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CLKDIV_M1_CLKDIV_M1_Field is HAL.UInt16;

   --  Divider minus 1 for the 1 second counter. Safe to change the value when
   --  RTC is not enabled.
   type CLKDIV_M1_Register is record
      CLKDIV_M1      : CLKDIV_M1_CLKDIV_M1_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLKDIV_M1_Register use record
      CLKDIV_M1      at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype SETUP_0_DAY_Field is HAL.UInt5;
   subtype SETUP_0_MONTH_Field is HAL.UInt4;
   subtype SETUP_0_YEAR_Field is HAL.UInt12;

   --  RTC setup register 0
   type SETUP_0_Register is record
      --  Day of the month (1..31)
      DAY            : SETUP_0_DAY_Field := 16#0#;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      --  Month (1..12)
      MONTH          : SETUP_0_MONTH_Field := 16#0#;
      --  Year
      YEAR           : SETUP_0_YEAR_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SETUP_0_Register use record
      DAY            at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      MONTH          at 0 range 8 .. 11;
      YEAR           at 0 range 12 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype SETUP_1_SEC_Field is HAL.UInt6;
   subtype SETUP_1_MIN_Field is HAL.UInt6;
   subtype SETUP_1_HOUR_Field is HAL.UInt5;
   subtype SETUP_1_DOTW_Field is HAL.UInt3;

   --  RTC setup register 1
   type SETUP_1_Register is record
      --  Seconds
      SEC            : SETUP_1_SEC_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : HAL.UInt2 := 16#0#;
      --  Minutes
      MIN            : SETUP_1_MIN_Field := 16#0#;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      --  Hours
      HOUR           : SETUP_1_HOUR_Field := 16#0#;
      --  unspecified
      Reserved_21_23 : HAL.UInt3 := 16#0#;
      --  Day of the week: 1-Monday...0-Sunday ISO 8601 mod 7
      DOTW           : SETUP_1_DOTW_Field := 16#0#;
      --  unspecified
      Reserved_27_31 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SETUP_1_Register use record
      SEC            at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      MIN            at 0 range 8 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      HOUR           at 0 range 16 .. 20;
      Reserved_21_23 at 0 range 21 .. 23;
      DOTW           at 0 range 24 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  RTC Control and status
   type CTRL_Register is record
      --  Enable RTC
      RTC_ENABLE        : Boolean := False;
      --  Read-only. RTC enabled (running)
      RTC_ACTIVE        : Boolean := False;
      --  unspecified
      Reserved_2_3      : HAL.UInt2 := 16#0#;
      --  After a write operation all bits in the field are cleared (set to
      --  zero). Load RTC
      LOAD              : Boolean := False;
      --  unspecified
      Reserved_5_7      : HAL.UInt3 := 16#0#;
      --  If set, leapyear is forced off.\n Useful for years divisible by 100
      --  but not by 400
      FORCE_NOTLEAPYEAR : Boolean := False;
      --  unspecified
      Reserved_9_31     : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CTRL_Register use record
      RTC_ENABLE        at 0 range 0 .. 0;
      RTC_ACTIVE        at 0 range 1 .. 1;
      Reserved_2_3      at 0 range 2 .. 3;
      LOAD              at 0 range 4 .. 4;
      Reserved_5_7      at 0 range 5 .. 7;
      FORCE_NOTLEAPYEAR at 0 range 8 .. 8;
      Reserved_9_31     at 0 range 9 .. 31;
   end record;

   subtype IRQ_SETUP_0_DAY_Field is HAL.UInt5;
   subtype IRQ_SETUP_0_MONTH_Field is HAL.UInt4;
   subtype IRQ_SETUP_0_YEAR_Field is HAL.UInt12;

   --  Interrupt setup register 0
   type IRQ_SETUP_0_Register is record
      --  Day of the month (1..31)
      DAY            : IRQ_SETUP_0_DAY_Field := 16#0#;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      --  Month (1..12)
      MONTH          : IRQ_SETUP_0_MONTH_Field := 16#0#;
      --  Year
      YEAR           : IRQ_SETUP_0_YEAR_Field := 16#0#;
      --  Enable day matching
      DAY_ENA        : Boolean := False;
      --  Enable month matching
      MONTH_ENA      : Boolean := False;
      --  Enable year matching
      YEAR_ENA       : Boolean := False;
      --  unspecified
      Reserved_27_27 : HAL.Bit := 16#0#;
      --  Global match enable. Don't change any other value while this one is
      --  enabled
      MATCH_ENA      : Boolean := False;
      --  Read-only.
      MATCH_ACTIVE   : Boolean := False;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRQ_SETUP_0_Register use record
      DAY            at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      MONTH          at 0 range 8 .. 11;
      YEAR           at 0 range 12 .. 23;
      DAY_ENA        at 0 range 24 .. 24;
      MONTH_ENA      at 0 range 25 .. 25;
      YEAR_ENA       at 0 range 26 .. 26;
      Reserved_27_27 at 0 range 27 .. 27;
      MATCH_ENA      at 0 range 28 .. 28;
      MATCH_ACTIVE   at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype IRQ_SETUP_1_SEC_Field is HAL.UInt6;
   subtype IRQ_SETUP_1_MIN_Field is HAL.UInt6;
   subtype IRQ_SETUP_1_HOUR_Field is HAL.UInt5;
   subtype IRQ_SETUP_1_DOTW_Field is HAL.UInt3;

   --  Interrupt setup register 1
   type IRQ_SETUP_1_Register is record
      --  Seconds
      SEC            : IRQ_SETUP_1_SEC_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : HAL.UInt2 := 16#0#;
      --  Minutes
      MIN            : IRQ_SETUP_1_MIN_Field := 16#0#;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      --  Hours
      HOUR           : IRQ_SETUP_1_HOUR_Field := 16#0#;
      --  unspecified
      Reserved_21_23 : HAL.UInt3 := 16#0#;
      --  Day of the week
      DOTW           : IRQ_SETUP_1_DOTW_Field := 16#0#;
      --  unspecified
      Reserved_27_27 : HAL.Bit := 16#0#;
      --  Enable second matching
      SEC_ENA        : Boolean := False;
      --  Enable minute matching
      MIN_ENA        : Boolean := False;
      --  Enable hour matching
      HOUR_ENA       : Boolean := False;
      --  Enable day of the week matching
      DOTW_ENA       : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRQ_SETUP_1_Register use record
      SEC            at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      MIN            at 0 range 8 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      HOUR           at 0 range 16 .. 20;
      Reserved_21_23 at 0 range 21 .. 23;
      DOTW           at 0 range 24 .. 26;
      Reserved_27_27 at 0 range 27 .. 27;
      SEC_ENA        at 0 range 28 .. 28;
      MIN_ENA        at 0 range 29 .. 29;
      HOUR_ENA       at 0 range 30 .. 30;
      DOTW_ENA       at 0 range 31 .. 31;
   end record;

   subtype RTC_1_DAY_Field is HAL.UInt5;
   subtype RTC_1_MONTH_Field is HAL.UInt4;
   subtype RTC_1_YEAR_Field is HAL.UInt12;

   --  RTC register 1.
   type RTC_1_Register is record
      --  Read-only. Day of the month (1..31)
      DAY            : RTC_1_DAY_Field;
      --  unspecified
      Reserved_5_7   : HAL.UInt3;
      --  Read-only. Month (1..12)
      MONTH          : RTC_1_MONTH_Field;
      --  Read-only. Year
      YEAR           : RTC_1_YEAR_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RTC_1_Register use record
      DAY            at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      MONTH          at 0 range 8 .. 11;
      YEAR           at 0 range 12 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype RTC_0_SEC_Field is HAL.UInt6;
   subtype RTC_0_MIN_Field is HAL.UInt6;
   subtype RTC_0_HOUR_Field is HAL.UInt5;
   subtype RTC_0_DOTW_Field is HAL.UInt3;

   --  RTC register 0\n Read this before RTC 1!
   type RTC_0_Register is record
      --  Read-only. Seconds
      SEC            : RTC_0_SEC_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Minutes
      MIN            : RTC_0_MIN_Field;
      --  unspecified
      Reserved_14_15 : HAL.UInt2;
      --  Read-only. Hours
      HOUR           : RTC_0_HOUR_Field;
      --  unspecified
      Reserved_21_23 : HAL.UInt3;
      --  Read-only. Day of the week
      DOTW           : RTC_0_DOTW_Field;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RTC_0_Register use record
      SEC            at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      MIN            at 0 range 8 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      HOUR           at 0 range 16 .. 20;
      Reserved_21_23 at 0 range 21 .. 23;
      DOTW           at 0 range 24 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  Raw Interrupts
   type INTR_Register is record
      --  Read-only.
      RTC           : Boolean;
      --  unspecified
      Reserved_1_31 : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTR_Register use record
      RTC           at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Interrupt Enable
   type INTE_Register is record
      RTC           : Boolean := False;
      --  unspecified
      Reserved_1_31 : HAL.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTE_Register use record
      RTC           at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Interrupt Force
   type INTF_Register is record
      RTC           : Boolean := False;
      --  unspecified
      Reserved_1_31 : HAL.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTF_Register use record
      RTC           at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Interrupt status after masking & forcing
   type INTS_Register is record
      --  Read-only.
      RTC           : Boolean;
      --  unspecified
      Reserved_1_31 : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTS_Register use record
      RTC           at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Register block to control RTC
   type RTC_Peripheral is record
      --  Divider minus 1 for the 1 second counter. Safe to change the value
      --  when RTC is not enabled.
      CLKDIV_M1   : aliased CLKDIV_M1_Register;
      --  RTC setup register 0
      SETUP_0     : aliased SETUP_0_Register;
      --  RTC setup register 1
      SETUP_1     : aliased SETUP_1_Register;
      --  RTC Control and status
      CTRL        : aliased CTRL_Register;
      --  Interrupt setup register 0
      IRQ_SETUP_0 : aliased IRQ_SETUP_0_Register;
      --  Interrupt setup register 1
      IRQ_SETUP_1 : aliased IRQ_SETUP_1_Register;
      --  RTC register 1.
      RTC_1       : aliased RTC_1_Register;
      --  RTC register 0\n Read this before RTC 1!
      RTC_0       : aliased RTC_0_Register;
      --  Raw Interrupts
      INTR        : aliased INTR_Register;
      --  Interrupt Enable
      INTE        : aliased INTE_Register;
      --  Interrupt Force
      INTF        : aliased INTF_Register;
      --  Interrupt status after masking & forcing
      INTS        : aliased INTS_Register;
   end record
     with Volatile;

   for RTC_Peripheral use record
      CLKDIV_M1   at 16#0# range 0 .. 31;
      SETUP_0     at 16#4# range 0 .. 31;
      SETUP_1     at 16#8# range 0 .. 31;
      CTRL        at 16#C# range 0 .. 31;
      IRQ_SETUP_0 at 16#10# range 0 .. 31;
      IRQ_SETUP_1 at 16#14# range 0 .. 31;
      RTC_1       at 16#18# range 0 .. 31;
      RTC_0       at 16#1C# range 0 .. 31;
      INTR        at 16#20# range 0 .. 31;
      INTE        at 16#24# range 0 .. 31;
      INTF        at 16#28# range 0 .. 31;
      INTS        at 16#2C# range 0 .. 31;
   end record;

   --  Register block to control RTC
   RTC_Periph : aliased RTC_Peripheral
     with Import, Address => RTC_Base;

end RP2040_SVD.RTC;
