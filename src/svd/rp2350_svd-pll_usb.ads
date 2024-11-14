pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package RP2350_SVD.PLL_USB is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CS_REFDIV_Field is HAL.UInt6;

   --  Control and Status GENERAL CONSTRAINTS: Reference clock frequency
   --  min=5MHz, max=800MHz Feedback divider min=16, max=320 VCO frequency
   --  min=750MHz, max=1600MHz
   type CS_Register is record
      --  Divides the PLL input reference clock. Behaviour is undefined for
      --  div=0. PLL output will be unpredictable during refdiv changes, wait
      --  for lock=1 before using it.
      REFDIV        : CS_REFDIV_Field := 16#1#;
      --  unspecified
      Reserved_6_7  : HAL.UInt2 := 16#0#;
      --  Passes the reference clock to the output instead of the divided VCO.
      --  The VCO continues to run so the user can switch between the reference
      --  clock and the divided VCO but the output will glitch when doing so.
      BYPASS        : Boolean := False;
      --  unspecified
      Reserved_9_29 : HAL.UInt21 := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. PLL is not locked Ideally this is cleared when PLL lock
      --  is seen and this should never normally be set
      LOCK_N        : Boolean := False;
      --  Read-only. PLL is locked
      LOCK          : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CS_Register use record
      REFDIV        at 0 range 0 .. 5;
      Reserved_6_7  at 0 range 6 .. 7;
      BYPASS        at 0 range 8 .. 8;
      Reserved_9_29 at 0 range 9 .. 29;
      LOCK_N        at 0 range 30 .. 30;
      LOCK          at 0 range 31 .. 31;
   end record;

   --  Controls the PLL power modes.
   type PWR_Register is record
      --  PLL powerdown To save power set high when PLL output not required.
      PD            : Boolean := True;
      --  unspecified
      Reserved_1_1  : HAL.Bit := 16#0#;
      --  PLL DSM powerdown Nothing is achieved by setting this low.
      DSMPD         : Boolean := True;
      --  PLL post divider powerdown To save power set high when PLL output not
      --  required or bypass=1.
      POSTDIVPD     : Boolean := True;
      --  unspecified
      Reserved_4_4  : HAL.Bit := 16#0#;
      --  PLL VCO powerdown To save power set high when PLL output not required
      --  or bypass=1.
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

   --  Feedback divisor (note: this PLL does not support fractional division)
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

   --  Controls the PLL post dividers for the primary output (note: this PLL
   --  does not have a secondary output) the primary output is driven from VCO
   --  divided by postdiv1*postdiv2
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

   --  Raw Interrupts
   type INTR_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      LOCK_N_STICKY : Boolean := False;
      --  unspecified
      Reserved_1_31 : HAL.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTR_Register use record
      LOCK_N_STICKY at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Interrupt Enable
   type INTE_Register is record
      LOCK_N_STICKY : Boolean := False;
      --  unspecified
      Reserved_1_31 : HAL.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTE_Register use record
      LOCK_N_STICKY at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Interrupt Force
   type INTF_Register is record
      LOCK_N_STICKY : Boolean := False;
      --  unspecified
      Reserved_1_31 : HAL.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTF_Register use record
      LOCK_N_STICKY at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Interrupt status after masking & forcing
   type INTS_Register is record
      --  Read-only.
      LOCK_N_STICKY : Boolean;
      --  unspecified
      Reserved_1_31 : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTS_Register use record
      LOCK_N_STICKY at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type PLL_USB_Peripheral is record
      --  Control and Status GENERAL CONSTRAINTS: Reference clock frequency
      --  min=5MHz, max=800MHz Feedback divider min=16, max=320 VCO frequency
      --  min=750MHz, max=1600MHz
      CS        : aliased CS_Register;
      --  Controls the PLL power modes.
      PWR       : aliased PWR_Register;
      --  Feedback divisor (note: this PLL does not support fractional
      --  division)
      FBDIV_INT : aliased FBDIV_INT_Register;
      --  Controls the PLL post dividers for the primary output (note: this PLL
      --  does not have a secondary output) the primary output is driven from
      --  VCO divided by postdiv1*postdiv2
      PRIM      : aliased PRIM_Register;
      --  Raw Interrupts
      INTR      : aliased INTR_Register;
      --  Interrupt Enable
      INTE      : aliased INTE_Register;
      --  Interrupt Force
      INTF      : aliased INTF_Register;
      --  Interrupt status after masking & forcing
      INTS      : aliased INTS_Register;
   end record
     with Volatile;

   for PLL_USB_Peripheral use record
      CS        at 16#0# range 0 .. 31;
      PWR       at 16#4# range 0 .. 31;
      FBDIV_INT at 16#8# range 0 .. 31;
      PRIM      at 16#C# range 0 .. 31;
      INTR      at 16#10# range 0 .. 31;
      INTE      at 16#14# range 0 .. 31;
      INTF      at 16#18# range 0 .. 31;
      INTS      at 16#1C# range 0 .. 31;
   end record;

   PLL_USB_Periph : aliased PLL_USB_Peripheral
     with Import, Address => PLL_USB_Base;

end RP2350_SVD.PLL_USB;
