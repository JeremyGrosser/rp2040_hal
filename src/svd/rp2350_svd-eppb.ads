pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

--  Cortex-M33 EPPB vendor register block for RP2350
package RP2350_SVD.EPPB is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype NMI_MASK1_NMI_MASK1_Field is HAL.UInt20;

   --  NMI mask for IRQs 0 though 51. This register is core-local, and is reset
   --  by a processor warm reset.
   type NMI_MASK1_Register is record
      NMI_MASK1      : NMI_MASK1_NMI_MASK1_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : HAL.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for NMI_MASK1_Register use record
      NMI_MASK1      at 0 range 0 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   --  Nonstandard sleep control register
   type SLEEPCTRL_Register is record
      --  By default, any processor sleep will deassert the system-level clock
      --  request. Reenabling the clocks incurs 5 cycles of additional latency
      --  on wakeup. Setting LIGHT_SLEEP to 1 keeps the clock request asserted
      --  during a normal sleep (Arm SCR.SLEEPDEEP = 0), for faster wakeup.
      --  Processor deep sleep (Arm SCR.SLEEPDEEP = 1) is not affected, and
      --  will always deassert the system-level clock request.
      LIGHT_SLEEP   : Boolean := False;
      --  Request that the next processor deep sleep is a WIC sleep. After
      --  setting this bit, before sleeping, poll WICENACK to ensure the
      --  processor interrupt controller has acknowledged the change.
      WICENREQ      : Boolean := True;
      --  Read-only. Status signal from the processor's interrupt controller.
      --  Changes to WICENREQ are eventually reflected in WICENACK.
      WICENACK      : Boolean := False;
      --  unspecified
      Reserved_3_31 : HAL.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SLEEPCTRL_Register use record
      LIGHT_SLEEP   at 0 range 0 .. 0;
      WICENREQ      at 0 range 1 .. 1;
      WICENACK      at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Cortex-M33 EPPB vendor register block for RP2350
   type EPPB_Peripheral is record
      --  NMI mask for IRQs 0 through 31. This register is core-local, and is
      --  reset by a processor warm reset.
      NMI_MASK0 : aliased HAL.UInt32;
      --  NMI mask for IRQs 0 though 51. This register is core-local, and is
      --  reset by a processor warm reset.
      NMI_MASK1 : aliased NMI_MASK1_Register;
      --  Nonstandard sleep control register
      SLEEPCTRL : aliased SLEEPCTRL_Register;
   end record
     with Volatile;

   for EPPB_Peripheral use record
      NMI_MASK0 at 16#0# range 0 .. 31;
      NMI_MASK1 at 16#4# range 0 .. 31;
      SLEEPCTRL at 16#8# range 0 .. 31;
   end record;

   --  Cortex-M33 EPPB vendor register block for RP2350
   EPPB_Periph : aliased EPPB_Peripheral
     with Import, Address => EPPB_Base;

end RP2350_SVD.EPPB;
