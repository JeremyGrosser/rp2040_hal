pragma Style_Checks (Off);

--  Copyright (c) 2020 Raspberry Pi (Trading) Ltd.
--
--  SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2040.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package RP2040_SVD.PLL is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CS_REFDIV_Field is HAL.UInt6;

   --  Control and Status\n GENERAL CONSTRAINTS:\n Reference clock frequency
   --  min=5MHz, max=800MHz\n Feedback divider min=16, max=320\n VCO frequency
   --  min=400MHz, max=1600MHz
   type CS_Register is record
      --  Divides the PLL input reference clock.\n Behaviour is undefined for
      --  div=0.\n PLL output will be unpredictable during refdiv changes, wait
      --  for lock=1 before using it.
      REFDIV        : CS_REFDIV_Field := 16#1#;
      --  unspecified
      Reserved_6_7  : HAL.UInt2 := 16#0#;
      --  Passes the reference clock to the output instead of the divided VCO.
      --  The VCO continues to run so the user can switch between the reference
      --  clock and the divided VCO but the output will glitch when doing so.
      BYPASS        : Boolean := False;
      --  unspecified
      Reserved_9_30 : HAL.UInt22 := 16#0#;
      --  Read-only. PLL is locked
      LOCK          : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CS_Register use record
      REFDIV        at 0 range 0 .. 5;
      Reserved_6_7  at 0 range 6 .. 7;
      BYPASS        at 0 range 8 .. 8;
      Reserved_9_30 at 0 range 9 .. 30;
      LOCK          at 0 range 31 .. 31;
   end record;

   --  Controls the PLL power modes.
   type PWR_Register is record
      --  PLL powerdown\n To save power set high when PLL output not required.
      PD            : Boolean := True;
      --  unspecified
      Reserved_1_1  : HAL.Bit := 16#0#;
      --  PLL DSM powerdown\n Nothing is achieved by setting this low.
      DSMPD         : Boolean := True;
      --  PLL post divider powerdown\n To save power set high when PLL output
      --  not required or bypass=1.
      POSTDIVPD     : Boolean := True;
      --  unspecified
      Reserved_4_4  : HAL.Bit := 16#0#;
      --  PLL VCO powerdown\n To save power set high when PLL output not
      --  required or bypass=1.
      VCOPD         : Boolean := True;
      --  unspecified
      Reserved_6_31 : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PWR_Register use record
      PD            at 0 range 0 .. 0;
      Reserved_1_1  at 0 range 1 .. 1;
      DSMPD         at 0 range 2 .. 2;
      POSTDIVPD     at 0 range 3 .. 3;
      Reserved_4_4  at 0 range 4 .. 4;
      VCOPD         at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype FBDIV_INT_FBDIV_INT_Field is HAL.UInt12;

   --  Feedback divisor\n (note: this PLL does not support fractional division)
   type FBDIV_INT_Register is record
      --  see ctrl reg description for constraints
      FBDIV_INT      : FBDIV_INT_FBDIV_INT_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FBDIV_INT_Register use record
      FBDIV_INT      at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype PRIM_POSTDIV2_Field is HAL.UInt3;
   subtype PRIM_POSTDIV1_Field is HAL.UInt3;

   --  Controls the PLL post dividers for the primary output\n (note: this PLL
   --  does not have a secondary output)\n the primary output is driven from
   --  VCO divided by postdiv1*postdiv2
   type PRIM_Register is record
      --  unspecified
      Reserved_0_11  : HAL.UInt12 := 16#0#;
      --  divide by 1-7
      POSTDIV2       : PRIM_POSTDIV2_Field := 16#7#;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
      --  divide by 1-7
      POSTDIV1       : PRIM_POSTDIV1_Field := 16#7#;
      --  unspecified
      Reserved_19_31 : HAL.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PRIM_Register use record
      Reserved_0_11  at 0 range 0 .. 11;
      POSTDIV2       at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      POSTDIV1       at 0 range 16 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type PLL_Peripheral is record
      --  Control and Status\n GENERAL CONSTRAINTS:\n Reference clock frequency
      --  min=5MHz, max=800MHz\n Feedback divider min=16, max=320\n VCO
      --  frequency min=400MHz, max=1600MHz
      CS        : aliased CS_Register;
      --  Controls the PLL power modes.
      PWR       : aliased PWR_Register;
      --  Feedback divisor\n (note: this PLL does not support fractional
      --  division)
      FBDIV_INT : aliased FBDIV_INT_Register;
      --  Controls the PLL post dividers for the primary output\n (note: this
      --  PLL does not have a secondary output)\n the primary output is driven
      --  from VCO divided by postdiv1*postdiv2
      PRIM      : aliased PRIM_Register;
   end record
     with Volatile;

   for PLL_Peripheral use record
      CS        at 16#0# range 0 .. 31;
      PWR       at 16#4# range 0 .. 31;
      FBDIV_INT at 16#8# range 0 .. 31;
      PRIM      at 16#C# range 0 .. 31;
   end record;

   PLL_SYS_Periph : aliased PLL_Peripheral
     with Import, Address => PLL_SYS_Base;
   PLL_USB_Periph : aliased PLL_Peripheral
     with Import, Address => PLL_USB_Base;

end RP2040_SVD.PLL;
