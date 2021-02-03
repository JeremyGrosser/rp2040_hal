pragma Style_Checks (Off);

--  Copyright (c) 2020 Raspberry Pi (Trading) Ltd.
--
--  SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2040.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package RP2040_SVD.PPB is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Use the SysTick Control and Status Register to enable the SysTick
   --  features.
   type SYST_CSR_Register is record
      --  Enable SysTick counter:\n 0 = Counter disabled.\n 1 = Counter
      --  enabled.
      ENABLE         : Boolean := False;
      --  Enables SysTick exception request:\n 0 = Counting down to zero does
      --  not assert the SysTick exception request.\n 1 = Counting down to zero
      --  to asserts the SysTick exception request.
      TICKINT        : Boolean := False;
      --  SysTick clock source. Always reads as one if SYST_CALIB reports
      --  NOREF.\n Selects the SysTick timer clock source:\n 0 = External
      --  reference clock.\n 1 = Processor clock.
      CLKSOURCE      : Boolean := False;
      --  unspecified
      Reserved_3_15  : HAL.UInt13 := 16#0#;
      --  Read-only. Returns 1 if timer counted to 0 since last time this was
      --  read. Clears on read by application or debugger.
      COUNTFLAG      : Boolean := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SYST_CSR_Register use record
      ENABLE         at 0 range 0 .. 0;
      TICKINT        at 0 range 1 .. 1;
      CLKSOURCE      at 0 range 2 .. 2;
      Reserved_3_15  at 0 range 3 .. 15;
      COUNTFLAG      at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype SYST_RVR_RELOAD_Field is HAL.UInt24;

   --  Use the SysTick Reload Value Register to specify the start value to load
   --  into the current value register when the counter reaches 0. It can be
   --  any value between 0 and 0x00FFFFFF. A start value of 0 is possible, but
   --  has no effect because the SysTick interrupt and COUNTFLAG are activated
   --  when counting from 1 to 0. The reset value of this register is
   --  UNKNOWN.\n To generate a multi-shot timer with a period of N processor
   --  clock cycles, use a RELOAD value of N-1. For example, if the SysTick
   --  interrupt is required every 100 clock pulses, set RELOAD to 99.
   type SYST_RVR_Register is record
      --  Value to load into the SysTick Current Value Register when the
      --  counter reaches 0.
      RELOAD         : SYST_RVR_RELOAD_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SYST_RVR_Register use record
      RELOAD         at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype SYST_CVR_CURRENT_Field is HAL.UInt24;

   --  Use the SysTick Current Value Register to find the current value in the
   --  register. The reset value of this register is UNKNOWN.
   type SYST_CVR_Register is record
      --  Reads return the current value of the SysTick counter. This register
      --  is write-clear. Writing to it with any value clears the register to
      --  0. Clearing this register also clears the COUNTFLAG bit of the
      --  SysTick Control and Status Register.
      CURRENT        : SYST_CVR_CURRENT_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SYST_CVR_Register use record
      CURRENT        at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype SYST_CALIB_TENMS_Field is HAL.UInt24;

   --  Use the SysTick Calibration Value Register to enable software to scale
   --  to any required speed using divide and multiply.
   type SYST_CALIB_Register is record
      --  Read-only. An optional Reload value to be used for 10ms (100Hz)
      --  timing, subject to system clock skew errors. If the value reads as 0,
      --  the calibration value is not known.
      TENMS          : SYST_CALIB_TENMS_Field;
      --  unspecified
      Reserved_24_29 : HAL.UInt6;
      --  Read-only. If reads as 1, the calibration value for 10ms is inexact
      --  (due to clock frequency).
      SKEW           : Boolean;
      --  Read-only. If reads as 1, the Reference clock is not provided - the
      --  CLKSOURCE bit of the SysTick Control and Status register will be
      --  forced to 1 and cannot be cleared to 0.
      NOREF          : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SYST_CALIB_Register use record
      TENMS          at 0 range 0 .. 23;
      Reserved_24_29 at 0 range 24 .. 29;
      SKEW           at 0 range 30 .. 30;
      NOREF          at 0 range 31 .. 31;
   end record;

   subtype NVIC_IPR0_IP_0_Field is HAL.UInt2;
   subtype NVIC_IPR0_IP_1_Field is HAL.UInt2;
   subtype NVIC_IPR0_IP_2_Field is HAL.UInt2;
   subtype NVIC_IPR0_IP_3_Field is HAL.UInt2;

   --  Use the Interrupt Priority Registers to assign a priority from 0 to 3 to
   --  each of the available interrupts. 0 is the highest priority, and 3 is
   --  the lowest.\n Note: Writing 1 to an NVIC_ICPR bit does not affect the
   --  active state of the corresponding interrupt.\n These registers are only
   --  word-accessible
   type NVIC_IPR0_Register is record
      --  unspecified
      Reserved_0_5   : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 0
      IP_0           : NVIC_IPR0_IP_0_Field := 16#0#;
      --  unspecified
      Reserved_8_13  : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 1
      IP_1           : NVIC_IPR0_IP_1_Field := 16#0#;
      --  unspecified
      Reserved_16_21 : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 2
      IP_2           : NVIC_IPR0_IP_2_Field := 16#0#;
      --  unspecified
      Reserved_24_29 : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 3
      IP_3           : NVIC_IPR0_IP_3_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVIC_IPR0_Register use record
      Reserved_0_5   at 0 range 0 .. 5;
      IP_0           at 0 range 6 .. 7;
      Reserved_8_13  at 0 range 8 .. 13;
      IP_1           at 0 range 14 .. 15;
      Reserved_16_21 at 0 range 16 .. 21;
      IP_2           at 0 range 22 .. 23;
      Reserved_24_29 at 0 range 24 .. 29;
      IP_3           at 0 range 30 .. 31;
   end record;

   subtype NVIC_IPR1_IP_4_Field is HAL.UInt2;
   subtype NVIC_IPR1_IP_5_Field is HAL.UInt2;
   subtype NVIC_IPR1_IP_6_Field is HAL.UInt2;
   subtype NVIC_IPR1_IP_7_Field is HAL.UInt2;

   --  Use the Interrupt Priority Registers to assign a priority from 0 to 3 to
   --  each of the available interrupts. 0 is the highest priority, and 3 is
   --  the lowest.
   type NVIC_IPR1_Register is record
      --  unspecified
      Reserved_0_5   : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 4
      IP_4           : NVIC_IPR1_IP_4_Field := 16#0#;
      --  unspecified
      Reserved_8_13  : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 5
      IP_5           : NVIC_IPR1_IP_5_Field := 16#0#;
      --  unspecified
      Reserved_16_21 : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 6
      IP_6           : NVIC_IPR1_IP_6_Field := 16#0#;
      --  unspecified
      Reserved_24_29 : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 7
      IP_7           : NVIC_IPR1_IP_7_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVIC_IPR1_Register use record
      Reserved_0_5   at 0 range 0 .. 5;
      IP_4           at 0 range 6 .. 7;
      Reserved_8_13  at 0 range 8 .. 13;
      IP_5           at 0 range 14 .. 15;
      Reserved_16_21 at 0 range 16 .. 21;
      IP_6           at 0 range 22 .. 23;
      Reserved_24_29 at 0 range 24 .. 29;
      IP_7           at 0 range 30 .. 31;
   end record;

   subtype NVIC_IPR2_IP_8_Field is HAL.UInt2;
   subtype NVIC_IPR2_IP_9_Field is HAL.UInt2;
   subtype NVIC_IPR2_IP_10_Field is HAL.UInt2;
   subtype NVIC_IPR2_IP_11_Field is HAL.UInt2;

   --  Use the Interrupt Priority Registers to assign a priority from 0 to 3 to
   --  each of the available interrupts. 0 is the highest priority, and 3 is
   --  the lowest.
   type NVIC_IPR2_Register is record
      --  unspecified
      Reserved_0_5   : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 8
      IP_8           : NVIC_IPR2_IP_8_Field := 16#0#;
      --  unspecified
      Reserved_8_13  : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 9
      IP_9           : NVIC_IPR2_IP_9_Field := 16#0#;
      --  unspecified
      Reserved_16_21 : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 10
      IP_10          : NVIC_IPR2_IP_10_Field := 16#0#;
      --  unspecified
      Reserved_24_29 : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 11
      IP_11          : NVIC_IPR2_IP_11_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVIC_IPR2_Register use record
      Reserved_0_5   at 0 range 0 .. 5;
      IP_8           at 0 range 6 .. 7;
      Reserved_8_13  at 0 range 8 .. 13;
      IP_9           at 0 range 14 .. 15;
      Reserved_16_21 at 0 range 16 .. 21;
      IP_10          at 0 range 22 .. 23;
      Reserved_24_29 at 0 range 24 .. 29;
      IP_11          at 0 range 30 .. 31;
   end record;

   subtype NVIC_IPR3_IP_12_Field is HAL.UInt2;
   subtype NVIC_IPR3_IP_13_Field is HAL.UInt2;
   subtype NVIC_IPR3_IP_14_Field is HAL.UInt2;
   subtype NVIC_IPR3_IP_15_Field is HAL.UInt2;

   --  Use the Interrupt Priority Registers to assign a priority from 0 to 3 to
   --  each of the available interrupts. 0 is the highest priority, and 3 is
   --  the lowest.
   type NVIC_IPR3_Register is record
      --  unspecified
      Reserved_0_5   : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 12
      IP_12          : NVIC_IPR3_IP_12_Field := 16#0#;
      --  unspecified
      Reserved_8_13  : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 13
      IP_13          : NVIC_IPR3_IP_13_Field := 16#0#;
      --  unspecified
      Reserved_16_21 : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 14
      IP_14          : NVIC_IPR3_IP_14_Field := 16#0#;
      --  unspecified
      Reserved_24_29 : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 15
      IP_15          : NVIC_IPR3_IP_15_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVIC_IPR3_Register use record
      Reserved_0_5   at 0 range 0 .. 5;
      IP_12          at 0 range 6 .. 7;
      Reserved_8_13  at 0 range 8 .. 13;
      IP_13          at 0 range 14 .. 15;
      Reserved_16_21 at 0 range 16 .. 21;
      IP_14          at 0 range 22 .. 23;
      Reserved_24_29 at 0 range 24 .. 29;
      IP_15          at 0 range 30 .. 31;
   end record;

   subtype NVIC_IPR4_IP_16_Field is HAL.UInt2;
   subtype NVIC_IPR4_IP_17_Field is HAL.UInt2;
   subtype NVIC_IPR4_IP_18_Field is HAL.UInt2;
   subtype NVIC_IPR4_IP_19_Field is HAL.UInt2;

   --  Use the Interrupt Priority Registers to assign a priority from 0 to 3 to
   --  each of the available interrupts. 0 is the highest priority, and 3 is
   --  the lowest.
   type NVIC_IPR4_Register is record
      --  unspecified
      Reserved_0_5   : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 16
      IP_16          : NVIC_IPR4_IP_16_Field := 16#0#;
      --  unspecified
      Reserved_8_13  : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 17
      IP_17          : NVIC_IPR4_IP_17_Field := 16#0#;
      --  unspecified
      Reserved_16_21 : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 18
      IP_18          : NVIC_IPR4_IP_18_Field := 16#0#;
      --  unspecified
      Reserved_24_29 : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 19
      IP_19          : NVIC_IPR4_IP_19_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVIC_IPR4_Register use record
      Reserved_0_5   at 0 range 0 .. 5;
      IP_16          at 0 range 6 .. 7;
      Reserved_8_13  at 0 range 8 .. 13;
      IP_17          at 0 range 14 .. 15;
      Reserved_16_21 at 0 range 16 .. 21;
      IP_18          at 0 range 22 .. 23;
      Reserved_24_29 at 0 range 24 .. 29;
      IP_19          at 0 range 30 .. 31;
   end record;

   subtype NVIC_IPR5_IP_20_Field is HAL.UInt2;
   subtype NVIC_IPR5_IP_21_Field is HAL.UInt2;
   subtype NVIC_IPR5_IP_22_Field is HAL.UInt2;
   subtype NVIC_IPR5_IP_23_Field is HAL.UInt2;

   --  Use the Interrupt Priority Registers to assign a priority from 0 to 3 to
   --  each of the available interrupts. 0 is the highest priority, and 3 is
   --  the lowest.
   type NVIC_IPR5_Register is record
      --  unspecified
      Reserved_0_5   : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 20
      IP_20          : NVIC_IPR5_IP_20_Field := 16#0#;
      --  unspecified
      Reserved_8_13  : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 21
      IP_21          : NVIC_IPR5_IP_21_Field := 16#0#;
      --  unspecified
      Reserved_16_21 : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 22
      IP_22          : NVIC_IPR5_IP_22_Field := 16#0#;
      --  unspecified
      Reserved_24_29 : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 23
      IP_23          : NVIC_IPR5_IP_23_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVIC_IPR5_Register use record
      Reserved_0_5   at 0 range 0 .. 5;
      IP_20          at 0 range 6 .. 7;
      Reserved_8_13  at 0 range 8 .. 13;
      IP_21          at 0 range 14 .. 15;
      Reserved_16_21 at 0 range 16 .. 21;
      IP_22          at 0 range 22 .. 23;
      Reserved_24_29 at 0 range 24 .. 29;
      IP_23          at 0 range 30 .. 31;
   end record;

   subtype NVIC_IPR6_IP_24_Field is HAL.UInt2;
   subtype NVIC_IPR6_IP_25_Field is HAL.UInt2;
   subtype NVIC_IPR6_IP_26_Field is HAL.UInt2;
   subtype NVIC_IPR6_IP_27_Field is HAL.UInt2;

   --  Use the Interrupt Priority Registers to assign a priority from 0 to 3 to
   --  each of the available interrupts. 0 is the highest priority, and 3 is
   --  the lowest.
   type NVIC_IPR6_Register is record
      --  unspecified
      Reserved_0_5   : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 24
      IP_24          : NVIC_IPR6_IP_24_Field := 16#0#;
      --  unspecified
      Reserved_8_13  : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 25
      IP_25          : NVIC_IPR6_IP_25_Field := 16#0#;
      --  unspecified
      Reserved_16_21 : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 26
      IP_26          : NVIC_IPR6_IP_26_Field := 16#0#;
      --  unspecified
      Reserved_24_29 : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 27
      IP_27          : NVIC_IPR6_IP_27_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVIC_IPR6_Register use record
      Reserved_0_5   at 0 range 0 .. 5;
      IP_24          at 0 range 6 .. 7;
      Reserved_8_13  at 0 range 8 .. 13;
      IP_25          at 0 range 14 .. 15;
      Reserved_16_21 at 0 range 16 .. 21;
      IP_26          at 0 range 22 .. 23;
      Reserved_24_29 at 0 range 24 .. 29;
      IP_27          at 0 range 30 .. 31;
   end record;

   subtype NVIC_IPR7_IP_28_Field is HAL.UInt2;
   subtype NVIC_IPR7_IP_29_Field is HAL.UInt2;
   subtype NVIC_IPR7_IP_30_Field is HAL.UInt2;
   subtype NVIC_IPR7_IP_31_Field is HAL.UInt2;

   --  Use the Interrupt Priority Registers to assign a priority from 0 to 3 to
   --  each of the available interrupts. 0 is the highest priority, and 3 is
   --  the lowest.
   type NVIC_IPR7_Register is record
      --  unspecified
      Reserved_0_5   : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 28
      IP_28          : NVIC_IPR7_IP_28_Field := 16#0#;
      --  unspecified
      Reserved_8_13  : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 29
      IP_29          : NVIC_IPR7_IP_29_Field := 16#0#;
      --  unspecified
      Reserved_16_21 : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 30
      IP_30          : NVIC_IPR7_IP_30_Field := 16#0#;
      --  unspecified
      Reserved_24_29 : HAL.UInt6 := 16#0#;
      --  Priority of interrupt 31
      IP_31          : NVIC_IPR7_IP_31_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVIC_IPR7_Register use record
      Reserved_0_5   at 0 range 0 .. 5;
      IP_28          at 0 range 6 .. 7;
      Reserved_8_13  at 0 range 8 .. 13;
      IP_29          at 0 range 14 .. 15;
      Reserved_16_21 at 0 range 16 .. 21;
      IP_30          at 0 range 22 .. 23;
      Reserved_24_29 at 0 range 24 .. 29;
      IP_31          at 0 range 30 .. 31;
   end record;

   subtype CPUID_REVISION_Field is HAL.UInt4;
   subtype CPUID_PARTNO_Field is HAL.UInt12;
   subtype CPUID_ARCHITECTURE_Field is HAL.UInt4;
   subtype CPUID_VARIANT_Field is HAL.UInt4;
   subtype CPUID_IMPLEMENTER_Field is HAL.UInt8;

   --  Read the CPU ID Base Register to determine: the ID number of the
   --  processor core, the version number of the processor core, the
   --  implementation details of the processor core.
   type CPUID_Register is record
      --  Read-only. Minor revision number m in the rnpm revision status:\n 0x1
      --  = Patch 1.
      REVISION     : CPUID_REVISION_Field;
      --  Read-only. Number of processor within family: 0xC60 = Cortex-M0+
      PARTNO       : CPUID_PARTNO_Field;
      --  Read-only. Constant that defines the architecture of the processor:\n
      --  0xC = ARMv6-M architecture.
      ARCHITECTURE : CPUID_ARCHITECTURE_Field;
      --  Read-only. Major revision number n in the rnpm revision status:\n 0x0
      --  = Revision 0.
      VARIANT      : CPUID_VARIANT_Field;
      --  Read-only. Implementor code: 0x41 = ARM
      IMPLEMENTER  : CPUID_IMPLEMENTER_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CPUID_Register use record
      REVISION     at 0 range 0 .. 3;
      PARTNO       at 0 range 4 .. 15;
      ARCHITECTURE at 0 range 16 .. 19;
      VARIANT      at 0 range 20 .. 23;
      IMPLEMENTER  at 0 range 24 .. 31;
   end record;

   subtype ICSR_VECTACTIVE_Field is HAL.UInt9;
   subtype ICSR_VECTPENDING_Field is HAL.UInt9;

   --  Use the Interrupt Control State Register to set a pending Non-Maskable
   --  Interrupt (NMI), set or clear a pending PendSV, set or clear a pending
   --  SysTick, check for pending exceptions, check the vector number of the
   --  highest priority pended exception, check the vector number of the active
   --  exception.
   type ICSR_Register is record
      --  Read-only. Active exception number field. Reset clears the VECTACTIVE
      --  field.
      VECTACTIVE     : ICSR_VECTACTIVE_Field := 16#0#;
      --  unspecified
      Reserved_9_11  : HAL.UInt3 := 16#0#;
      --  Read-only. Indicates the exception number for the highest priority
      --  pending exception: 0 = no pending exceptions. Non zero = The pending
      --  state includes the effect of memory-mapped enable and mask registers.
      --  It does not include the PRIMASK special-purpose register qualifier.
      VECTPENDING    : ICSR_VECTPENDING_Field := 16#0#;
      --  unspecified
      Reserved_21_21 : HAL.Bit := 16#0#;
      --  Read-only. External interrupt pending flag
      ISRPENDING     : Boolean := False;
      --  Read-only. The system can only access this bit when the core is
      --  halted. It indicates that a pending interrupt is to be taken in the
      --  next running cycle. If C_MASKINTS is clear in the Debug Halting
      --  Control and Status Register, the interrupt is serviced.
      ISRPREEMPT     : Boolean := False;
      --  unspecified
      Reserved_24_24 : HAL.Bit := 16#0#;
      --  SysTick exception clear-pending bit.\n Write:\n 0 = No effect.\n 1 =
      --  Removes the pending state from the SysTick exception.\n This bit is
      --  WO. On a register read its value is Unknown.
      PENDSTCLR      : Boolean := False;
      --  SysTick exception set-pending bit.\n Write:\n 0 = No effect.\n 1 =
      --  Changes SysTick exception state to pending.\n Read:\n 0 = SysTick
      --  exception is not pending.\n 1 = SysTick exception is pending.
      PENDSTSET      : Boolean := False;
      --  PendSV clear-pending bit.\n Write:\n 0 = No effect.\n 1 = Removes the
      --  pending state from the PendSV exception.
      PENDSVCLR      : Boolean := False;
      --  PendSV set-pending bit.\n Write:\n 0 = No effect.\n 1 = Changes
      --  PendSV exception state to pending.\n Read:\n 0 = PendSV exception is
      --  not pending.\n 1 = PendSV exception is pending.\n Writing 1 to this
      --  bit is the only way to set the PendSV exception state to pending.
      PENDSVSET      : Boolean := False;
      --  unspecified
      Reserved_29_30 : HAL.UInt2 := 16#0#;
      --  Setting this bit will activate an NMI. Since NMI is the highest
      --  priority exception, it will activate as soon as it is registered.\n
      --  NMI set-pending bit.\n Write:\n 0 = No effect.\n 1 = Changes NMI
      --  exception state to pending.\n Read:\n 0 = NMI exception is not
      --  pending.\n 1 = NMI exception is pending.\n Because NMI is the
      --  highest-priority exception, normally the processor enters the NMI\n
      --  exception handler as soon as it detects a write of 1 to this bit.
      --  Entering the handler then clears\n this bit to 0. This means a read
      --  of this bit by the NMI exception handler returns 1 only if the\n NMI
      --  signal is reasserted while the processor is executing that handler.
      NMIPENDSET     : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ICSR_Register use record
      VECTACTIVE     at 0 range 0 .. 8;
      Reserved_9_11  at 0 range 9 .. 11;
      VECTPENDING    at 0 range 12 .. 20;
      Reserved_21_21 at 0 range 21 .. 21;
      ISRPENDING     at 0 range 22 .. 22;
      ISRPREEMPT     at 0 range 23 .. 23;
      Reserved_24_24 at 0 range 24 .. 24;
      PENDSTCLR      at 0 range 25 .. 25;
      PENDSTSET      at 0 range 26 .. 26;
      PENDSVCLR      at 0 range 27 .. 27;
      PENDSVSET      at 0 range 28 .. 28;
      Reserved_29_30 at 0 range 29 .. 30;
      NMIPENDSET     at 0 range 31 .. 31;
   end record;

   subtype VTOR_TBLOFF_Field is HAL.UInt24;

   --  The VTOR holds the vector table offset address.
   type VTOR_Register is record
      --  unspecified
      Reserved_0_7 : HAL.UInt8 := 16#0#;
      --  Bits [31:8] of the indicate the vector table offset address.
      TBLOFF       : VTOR_TBLOFF_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for VTOR_Register use record
      Reserved_0_7 at 0 range 0 .. 7;
      TBLOFF       at 0 range 8 .. 31;
   end record;

   subtype AIRCR_VECTKEY_Field is HAL.UInt16;

   --  Use the Application Interrupt and Reset Control Register to: determine
   --  data endianness, clear all active state information from debug halt
   --  mode, request a system reset.
   type AIRCR_Register is record
      --  unspecified
      Reserved_0_0  : HAL.Bit := 16#0#;
      --  Clears all active state information for fixed and configurable
      --  exceptions. This bit: is self-clearing, can only be set by the DAP
      --  when the core is halted. When set: clears all active exception status
      --  of the processor, forces a return to Thread mode, forces an IPSR of
      --  0. A debugger must re-initialize the stack.
      VECTCLRACTIVE : Boolean := False;
      --  Writing 1 to this bit causes the SYSRESETREQ signal to the outer
      --  system to be asserted to request a reset. The intention is to force a
      --  large system reset of all major components except for debug. The
      --  C_HALT bit in the DHCSR is cleared as a result of the system reset
      --  requested. The debugger does not lose contact with the device.
      SYSRESETREQ   : Boolean := False;
      --  unspecified
      Reserved_3_14 : HAL.UInt12 := 16#0#;
      --  Read-only. Data endianness implemented:\n 0 = Little-endian.
      ENDIANESS     : Boolean := False;
      --  Register key:\n Reads as Unknown\n On writes, write 0x05FA to
      --  VECTKEY, otherwise the write is ignored.
      VECTKEY       : AIRCR_VECTKEY_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AIRCR_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      VECTCLRACTIVE at 0 range 1 .. 1;
      SYSRESETREQ   at 0 range 2 .. 2;
      Reserved_3_14 at 0 range 3 .. 14;
      ENDIANESS     at 0 range 15 .. 15;
      VECTKEY       at 0 range 16 .. 31;
   end record;

   --  System Control Register. Use the System Control Register for
   --  power-management functions: signal to the system when the processor can
   --  enter a low power state, control how the processor enters and exits low
   --  power states.
   type SCR_Register is record
      --  unspecified
      Reserved_0_0  : HAL.Bit := 16#0#;
      --  Indicates sleep-on-exit when returning from Handler mode to Thread
      --  mode:\n 0 = Do not sleep when returning to Thread mode.\n 1 = Enter
      --  sleep, or deep sleep, on return from an ISR to Thread mode.\n Setting
      --  this bit to 1 enables an interrupt driven application to avoid
      --  returning to an empty main application.
      SLEEPONEXIT   : Boolean := False;
      --  Controls whether the processor uses sleep or deep sleep as its low
      --  power mode:\n 0 = Sleep.\n 1 = Deep sleep.
      SLEEPDEEP     : Boolean := False;
      --  unspecified
      Reserved_3_3  : HAL.Bit := 16#0#;
      --  Send Event on Pending bit:\n 0 = Only enabled interrupts or events
      --  can wakeup the processor, disabled interrupts are excluded.\n 1 =
      --  Enabled events and all interrupts, including disabled interrupts, can
      --  wakeup the processor.\n When an event or interrupt becomes pending,
      --  the event signal wakes up the processor from WFE. If the\n processor
      --  is not waiting for an event, the event is registered and affects the
      --  next WFE.\n The processor also wakes up on execution of an SEV
      --  instruction or an external event.
      SEVONPEND     : Boolean := False;
      --  unspecified
      Reserved_5_31 : HAL.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SCR_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      SLEEPONEXIT   at 0 range 1 .. 1;
      SLEEPDEEP     at 0 range 2 .. 2;
      Reserved_3_3  at 0 range 3 .. 3;
      SEVONPEND     at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   --  The Configuration and Control Register permanently enables stack
   --  alignment and causes unaligned accesses to result in a Hard Fault.
   type CCR_Register is record
      --  unspecified
      Reserved_0_2   : HAL.UInt3;
      --  Read-only. Always reads as one, indicates that all unaligned accesses
      --  generate a HardFault.
      UNALIGN_TRP    : Boolean;
      --  unspecified
      Reserved_4_8   : HAL.UInt5;
      --  Read-only. Always reads as one, indicates 8-byte stack alignment on
      --  exception entry. On exception entry, the processor uses bit[9] of the
      --  stacked PSR to indicate the stack alignment. On return from the
      --  exception it uses this stacked bit to restore the correct stack
      --  alignment.
      STKALIGN       : Boolean;
      --  unspecified
      Reserved_10_31 : HAL.UInt22;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR_Register use record
      Reserved_0_2   at 0 range 0 .. 2;
      UNALIGN_TRP    at 0 range 3 .. 3;
      Reserved_4_8   at 0 range 4 .. 8;
      STKALIGN       at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype SHPR2_PRI_11_Field is HAL.UInt2;

   --  System handlers are a special class of exception handler that can have
   --  their priority set to any of the priority levels. Use the System Handler
   --  Priority Register 2 to set the priority of SVCall.
   type SHPR2_Register is record
      --  unspecified
      Reserved_0_29 : HAL.UInt30 := 16#0#;
      --  Priority of system handler 11, SVCall
      PRI_11        : SHPR2_PRI_11_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHPR2_Register use record
      Reserved_0_29 at 0 range 0 .. 29;
      PRI_11        at 0 range 30 .. 31;
   end record;

   subtype SHPR3_PRI_14_Field is HAL.UInt2;
   subtype SHPR3_PRI_15_Field is HAL.UInt2;

   --  System handlers are a special class of exception handler that can have
   --  their priority set to any of the priority levels. Use the System Handler
   --  Priority Register 3 to set the priority of PendSV and SysTick.
   type SHPR3_Register is record
      --  unspecified
      Reserved_0_21  : HAL.UInt22 := 16#0#;
      --  Priority of system handler 14, PendSV
      PRI_14         : SHPR3_PRI_14_Field := 16#0#;
      --  unspecified
      Reserved_24_29 : HAL.UInt6 := 16#0#;
      --  Priority of system handler 15, SysTick
      PRI_15         : SHPR3_PRI_15_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHPR3_Register use record
      Reserved_0_21  at 0 range 0 .. 21;
      PRI_14         at 0 range 22 .. 23;
      Reserved_24_29 at 0 range 24 .. 29;
      PRI_15         at 0 range 30 .. 31;
   end record;

   --  Use the System Handler Control and State Register to determine or clear
   --  the pending status of SVCall.
   type SHCSR_Register is record
      --  unspecified
      Reserved_0_14  : HAL.UInt15 := 16#0#;
      --  Reads as 1 if SVCall is Pending. Write 1 to set pending SVCall, write
      --  0 to clear pending SVCall.
      SVCALLPENDED   : Boolean := False;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHCSR_Register use record
      Reserved_0_14  at 0 range 0 .. 14;
      SVCALLPENDED   at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype MPU_TYPE_DREGION_Field is HAL.UInt8;
   subtype MPU_TYPE_IREGION_Field is HAL.UInt8;

   --  Read the MPU Type Register to determine if the processor implements an
   --  MPU, and how many regions the MPU supports.
   type MPU_TYPE_Register is record
      --  Read-only. Indicates support for separate instruction and data
      --  address maps. Reads as 0 as ARMv6-M only supports a unified MPU.
      SEPARATE_k     : Boolean;
      --  unspecified
      Reserved_1_7   : HAL.UInt7;
      --  Read-only. Number of regions supported by the MPU.
      DREGION        : MPU_TYPE_DREGION_Field;
      --  Read-only. Instruction region. Reads as zero as ARMv6-M only supports
      --  a unified MPU.
      IREGION        : MPU_TYPE_IREGION_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MPU_TYPE_Register use record
      SEPARATE_k     at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      DREGION        at 0 range 8 .. 15;
      IREGION        at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Use the MPU Control Register to enable and disable the MPU, and to
   --  control whether the default memory map is enabled as a background region
   --  for privileged accesses, and whether the MPU is enabled for HardFaults
   --  and NMIs.
   type MPU_CTRL_Register is record
      --  Enables the MPU. If the MPU is disabled, privileged and unprivileged
      --  accesses use the default memory map.\n 0 = MPU disabled.\n 1 = MPU
      --  enabled.
      ENABLE        : Boolean := False;
      --  Controls the use of the MPU for HardFaults and NMIs. Setting this bit
      --  when ENABLE is clear results in UNPREDICTABLE behaviour.\n When the
      --  MPU is enabled:\n 0 = MPU is disabled during HardFault and NMI
      --  handlers, regardless of the value of the ENABLE bit.\n 1 = the MPU is
      --  enabled during HardFault and NMI handlers.
      HFNMIENA      : Boolean := False;
      --  Controls whether the default memory map is enabled as a background
      --  region for privileged accesses. This bit is ignored when ENABLE is
      --  clear.\n 0 = If the MPU is enabled, disables use of the default
      --  memory map. Any memory access to a location not\n covered by any
      --  enabled region causes a fault.\n 1 = If the MPU is enabled, enables
      --  use of the default memory map as a background region for privileged
      --  software accesses.\n When enabled, the background region acts as if
      --  it is region number -1. Any region that is defined and enabled has
      --  priority over this default map.
      PRIVDEFENA    : Boolean := False;
      --  unspecified
      Reserved_3_31 : HAL.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MPU_CTRL_Register use record
      ENABLE        at 0 range 0 .. 0;
      HFNMIENA      at 0 range 1 .. 1;
      PRIVDEFENA    at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype MPU_RNR_REGION_Field is HAL.UInt4;

   --  Use the MPU Region Number Register to select the region currently
   --  accessed by MPU_RBAR and MPU_RASR.
   type MPU_RNR_Register is record
      --  Indicates the MPU region referenced by the MPU_RBAR and MPU_RASR
      --  registers.\n The MPU supports 8 memory regions, so the permitted
      --  values of this field are 0-7.
      REGION        : MPU_RNR_REGION_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MPU_RNR_Register use record
      REGION        at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype MPU_RBAR_REGION_Field is HAL.UInt4;
   subtype MPU_RBAR_ADDR_Field is HAL.UInt24;

   --  Read the MPU Region Base Address Register to determine the base address
   --  of the region identified by MPU_RNR. Write to update the base address of
   --  said region or that of a specified region, with whose number MPU_RNR
   --  will also be updated.
   type MPU_RBAR_Register is record
      --  On writes, specifies the number of the region whose base address to
      --  update provided VALID is set written as 1. On reads, returns bits
      --  [3:0] of MPU_RNR.
      REGION       : MPU_RBAR_REGION_Field := 16#0#;
      --  On writes, indicates whether the write must update the base address
      --  of the region identified by the REGION field, updating the MPU_RNR to
      --  indicate this new region.\n Write:\n 0 = MPU_RNR not changed, and the
      --  processor:\n Updates the base address for the region specified in the
      --  MPU_RNR.\n Ignores the value of the REGION field.\n 1 = The
      --  processor:\n Updates the value of the MPU_RNR to the value of the
      --  REGION field.\n Updates the base address for the region specified in
      --  the REGION field.\n Always reads as zero.
      VALID        : Boolean := False;
      --  unspecified
      Reserved_5_7 : HAL.UInt3 := 16#0#;
      --  Base address of the region.
      ADDR         : MPU_RBAR_ADDR_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MPU_RBAR_Register use record
      REGION       at 0 range 0 .. 3;
      VALID        at 0 range 4 .. 4;
      Reserved_5_7 at 0 range 5 .. 7;
      ADDR         at 0 range 8 .. 31;
   end record;

   subtype MPU_RASR_SIZE_Field is HAL.UInt5;
   subtype MPU_RASR_SRD_Field is HAL.UInt8;
   subtype MPU_RASR_ATTRS_Field is HAL.UInt16;

   --  Use the MPU Region Attribute and Size Register to define the size,
   --  access behaviour and memory type of the region identified by MPU_RNR,
   --  and enable that region.
   type MPU_RASR_Register is record
      --  Enables the region.
      ENABLE       : Boolean := False;
      --  Indicates the region size. Region size in bytes = 2^(SIZE+1). The
      --  minimum permitted value is 7 (b00111) = 256Bytes
      SIZE         : MPU_RASR_SIZE_Field := 16#0#;
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
      --  Subregion Disable. For regions of 256 bytes or larger, each bit of
      --  this field controls whether one of the eight equal subregions is
      --  enabled.
      SRD          : MPU_RASR_SRD_Field := 16#0#;
      --  The MPU Region Attribute field. Use to define the region attribute
      --  control.\n 28 = XN: Instruction access disable bit:\n 0 = Instruction
      --  fetches enabled.\n 1 = Instruction fetches disabled.\n 26:24 = AP:
      --  Access permission field\n 18 = S: Shareable bit\n 17 = C: Cacheable
      --  bit\n 16 = B: Bufferable bit
      ATTRS        : MPU_RASR_ATTRS_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MPU_RASR_Register use record
      ENABLE       at 0 range 0 .. 0;
      SIZE         at 0 range 1 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
      SRD          at 0 range 8 .. 15;
      ATTRS        at 0 range 16 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type PPB_Peripheral is record
      --  Use the SysTick Control and Status Register to enable the SysTick
      --  features.
      SYST_CSR   : aliased SYST_CSR_Register;
      --  Use the SysTick Reload Value Register to specify the start value to
      --  load into the current value register when the counter reaches 0. It
      --  can be any value between 0 and 0x00FFFFFF. A start value of 0 is
      --  possible, but has no effect because the SysTick interrupt and
      --  COUNTFLAG are activated when counting from 1 to 0. The reset value of
      --  this register is UNKNOWN.\n To generate a multi-shot timer with a
      --  period of N processor clock cycles, use a RELOAD value of N-1. For
      --  example, if the SysTick interrupt is required every 100 clock pulses,
      --  set RELOAD to 99.
      SYST_RVR   : aliased SYST_RVR_Register;
      --  Use the SysTick Current Value Register to find the current value in
      --  the register. The reset value of this register is UNKNOWN.
      SYST_CVR   : aliased SYST_CVR_Register;
      --  Use the SysTick Calibration Value Register to enable software to
      --  scale to any required speed using divide and multiply.
      SYST_CALIB : aliased SYST_CALIB_Register;
      --  Use the Interrupt Set-Enable Register to enable interrupts and
      --  determine which interrupts are currently enabled.\n If a pending
      --  interrupt is enabled, the NVIC activates the interrupt based on its
      --  priority. If an interrupt is not enabled, asserting its interrupt
      --  signal changes the interrupt state to pending, but the NVIC never
      --  activates the interrupt, regardless of its priority.
      NVIC_ISER  : aliased HAL.UInt32;
      --  Use the Interrupt Clear-Enable Registers to disable interrupts and
      --  determine which interrupts are currently enabled.
      NVIC_ICER  : aliased HAL.UInt32;
      --  The NVIC_ISPR forces interrupts into the pending state, and shows
      --  which interrupts are pending.
      NVIC_ISPR  : aliased HAL.UInt32;
      --  Use the Interrupt Clear-Pending Register to clear pending interrupts
      --  and determine which interrupts are currently pending.
      NVIC_ICPR  : aliased HAL.UInt32;
      --  Use the Interrupt Priority Registers to assign a priority from 0 to 3
      --  to each of the available interrupts. 0 is the highest priority, and 3
      --  is the lowest.\n Note: Writing 1 to an NVIC_ICPR bit does not affect
      --  the active state of the corresponding interrupt.\n These registers
      --  are only word-accessible
      NVIC_IPR0  : aliased NVIC_IPR0_Register;
      --  Use the Interrupt Priority Registers to assign a priority from 0 to 3
      --  to each of the available interrupts. 0 is the highest priority, and 3
      --  is the lowest.
      NVIC_IPR1  : aliased NVIC_IPR1_Register;
      --  Use the Interrupt Priority Registers to assign a priority from 0 to 3
      --  to each of the available interrupts. 0 is the highest priority, and 3
      --  is the lowest.
      NVIC_IPR2  : aliased NVIC_IPR2_Register;
      --  Use the Interrupt Priority Registers to assign a priority from 0 to 3
      --  to each of the available interrupts. 0 is the highest priority, and 3
      --  is the lowest.
      NVIC_IPR3  : aliased NVIC_IPR3_Register;
      --  Use the Interrupt Priority Registers to assign a priority from 0 to 3
      --  to each of the available interrupts. 0 is the highest priority, and 3
      --  is the lowest.
      NVIC_IPR4  : aliased NVIC_IPR4_Register;
      --  Use the Interrupt Priority Registers to assign a priority from 0 to 3
      --  to each of the available interrupts. 0 is the highest priority, and 3
      --  is the lowest.
      NVIC_IPR5  : aliased NVIC_IPR5_Register;
      --  Use the Interrupt Priority Registers to assign a priority from 0 to 3
      --  to each of the available interrupts. 0 is the highest priority, and 3
      --  is the lowest.
      NVIC_IPR6  : aliased NVIC_IPR6_Register;
      --  Use the Interrupt Priority Registers to assign a priority from 0 to 3
      --  to each of the available interrupts. 0 is the highest priority, and 3
      --  is the lowest.
      NVIC_IPR7  : aliased NVIC_IPR7_Register;
      --  Read the CPU ID Base Register to determine: the ID number of the
      --  processor core, the version number of the processor core, the
      --  implementation details of the processor core.
      CPUID      : aliased CPUID_Register;
      --  Use the Interrupt Control State Register to set a pending
      --  Non-Maskable Interrupt (NMI), set or clear a pending PendSV, set or
      --  clear a pending SysTick, check for pending exceptions, check the
      --  vector number of the highest priority pended exception, check the
      --  vector number of the active exception.
      ICSR       : aliased ICSR_Register;
      --  The VTOR holds the vector table offset address.
      VTOR       : aliased VTOR_Register;
      --  Use the Application Interrupt and Reset Control Register to:
      --  determine data endianness, clear all active state information from
      --  debug halt mode, request a system reset.
      AIRCR      : aliased AIRCR_Register;
      --  System Control Register. Use the System Control Register for
      --  power-management functions: signal to the system when the processor
      --  can enter a low power state, control how the processor enters and
      --  exits low power states.
      SCR        : aliased SCR_Register;
      --  The Configuration and Control Register permanently enables stack
      --  alignment and causes unaligned accesses to result in a Hard Fault.
      CCR        : aliased CCR_Register;
      --  System handlers are a special class of exception handler that can
      --  have their priority set to any of the priority levels. Use the System
      --  Handler Priority Register 2 to set the priority of SVCall.
      SHPR2      : aliased SHPR2_Register;
      --  System handlers are a special class of exception handler that can
      --  have their priority set to any of the priority levels. Use the System
      --  Handler Priority Register 3 to set the priority of PendSV and
      --  SysTick.
      SHPR3      : aliased SHPR3_Register;
      --  Use the System Handler Control and State Register to determine or
      --  clear the pending status of SVCall.
      SHCSR      : aliased SHCSR_Register;
      --  Read the MPU Type Register to determine if the processor implements
      --  an MPU, and how many regions the MPU supports.
      MPU_TYPE   : aliased MPU_TYPE_Register;
      --  Use the MPU Control Register to enable and disable the MPU, and to
      --  control whether the default memory map is enabled as a background
      --  region for privileged accesses, and whether the MPU is enabled for
      --  HardFaults and NMIs.
      MPU_CTRL   : aliased MPU_CTRL_Register;
      --  Use the MPU Region Number Register to select the region currently
      --  accessed by MPU_RBAR and MPU_RASR.
      MPU_RNR    : aliased MPU_RNR_Register;
      --  Read the MPU Region Base Address Register to determine the base
      --  address of the region identified by MPU_RNR. Write to update the base
      --  address of said region or that of a specified region, with whose
      --  number MPU_RNR will also be updated.
      MPU_RBAR   : aliased MPU_RBAR_Register;
      --  Use the MPU Region Attribute and Size Register to define the size,
      --  access behaviour and memory type of the region identified by MPU_RNR,
      --  and enable that region.
      MPU_RASR   : aliased MPU_RASR_Register;
   end record
     with Volatile;

   for PPB_Peripheral use record
      SYST_CSR   at 16#E010# range 0 .. 31;
      SYST_RVR   at 16#E014# range 0 .. 31;
      SYST_CVR   at 16#E018# range 0 .. 31;
      SYST_CALIB at 16#E01C# range 0 .. 31;
      NVIC_ISER  at 16#E100# range 0 .. 31;
      NVIC_ICER  at 16#E180# range 0 .. 31;
      NVIC_ISPR  at 16#E200# range 0 .. 31;
      NVIC_ICPR  at 16#E280# range 0 .. 31;
      NVIC_IPR0  at 16#E400# range 0 .. 31;
      NVIC_IPR1  at 16#E404# range 0 .. 31;
      NVIC_IPR2  at 16#E408# range 0 .. 31;
      NVIC_IPR3  at 16#E40C# range 0 .. 31;
      NVIC_IPR4  at 16#E410# range 0 .. 31;
      NVIC_IPR5  at 16#E414# range 0 .. 31;
      NVIC_IPR6  at 16#E418# range 0 .. 31;
      NVIC_IPR7  at 16#E41C# range 0 .. 31;
      CPUID      at 16#ED00# range 0 .. 31;
      ICSR       at 16#ED04# range 0 .. 31;
      VTOR       at 16#ED08# range 0 .. 31;
      AIRCR      at 16#ED0C# range 0 .. 31;
      SCR        at 16#ED10# range 0 .. 31;
      CCR        at 16#ED14# range 0 .. 31;
      SHPR2      at 16#ED1C# range 0 .. 31;
      SHPR3      at 16#ED20# range 0 .. 31;
      SHCSR      at 16#ED24# range 0 .. 31;
      MPU_TYPE   at 16#ED90# range 0 .. 31;
      MPU_CTRL   at 16#ED94# range 0 .. 31;
      MPU_RNR    at 16#ED98# range 0 .. 31;
      MPU_RBAR   at 16#ED9C# range 0 .. 31;
      MPU_RASR   at 16#EDA0# range 0 .. 31;
   end record;

   PPB_Periph : aliased PPB_Peripheral
     with Import, Address => PPB_Base;

end RP2040_SVD.PPB;
