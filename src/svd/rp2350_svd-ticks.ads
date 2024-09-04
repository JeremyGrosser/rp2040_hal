pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package RP2350_SVD.TICKS is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Controls the tick generator
   type PROC0_CTRL_Register is record
      --  start / stop tick generation
      ENABLE        : Boolean := False;
      --  Read-only. Is the tick generator running?
      RUNNING       : Boolean := False;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC0_CTRL_Register use record
      ENABLE        at 0 range 0 .. 0;
      RUNNING       at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype PROC0_CYCLES_PROC0_CYCLES_Field is HAL.UInt9;

   type PROC0_CYCLES_Register is record
      --  Total number of clk_tick cycles before the next tick.
      PROC0_CYCLES  : PROC0_CYCLES_PROC0_CYCLES_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC0_CYCLES_Register use record
      PROC0_CYCLES  at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype PROC0_COUNT_PROC0_COUNT_Field is HAL.UInt9;

   type PROC0_COUNT_Register is record
      --  Read-only. Count down timer: the remaining number clk_tick cycles
      --  before the next tick is generated.
      PROC0_COUNT   : PROC0_COUNT_PROC0_COUNT_Field;
      --  unspecified
      Reserved_9_31 : HAL.UInt23;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC0_COUNT_Register use record
      PROC0_COUNT   at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  Controls the tick generator
   type PROC1_CTRL_Register is record
      --  start / stop tick generation
      ENABLE        : Boolean := False;
      --  Read-only. Is the tick generator running?
      RUNNING       : Boolean := False;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC1_CTRL_Register use record
      ENABLE        at 0 range 0 .. 0;
      RUNNING       at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype PROC1_CYCLES_PROC1_CYCLES_Field is HAL.UInt9;

   type PROC1_CYCLES_Register is record
      --  Total number of clk_tick cycles before the next tick.
      PROC1_CYCLES  : PROC1_CYCLES_PROC1_CYCLES_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC1_CYCLES_Register use record
      PROC1_CYCLES  at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype PROC1_COUNT_PROC1_COUNT_Field is HAL.UInt9;

   type PROC1_COUNT_Register is record
      --  Read-only. Count down timer: the remaining number clk_tick cycles
      --  before the next tick is generated.
      PROC1_COUNT   : PROC1_COUNT_PROC1_COUNT_Field;
      --  unspecified
      Reserved_9_31 : HAL.UInt23;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC1_COUNT_Register use record
      PROC1_COUNT   at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  Controls the tick generator
   type TIMER0_CTRL_Register is record
      --  start / stop tick generation
      ENABLE        : Boolean := False;
      --  Read-only. Is the tick generator running?
      RUNNING       : Boolean := False;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TIMER0_CTRL_Register use record
      ENABLE        at 0 range 0 .. 0;
      RUNNING       at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype TIMER0_CYCLES_TIMER0_CYCLES_Field is HAL.UInt9;

   type TIMER0_CYCLES_Register is record
      --  Total number of clk_tick cycles before the next tick.
      TIMER0_CYCLES : TIMER0_CYCLES_TIMER0_CYCLES_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TIMER0_CYCLES_Register use record
      TIMER0_CYCLES at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype TIMER0_COUNT_TIMER0_COUNT_Field is HAL.UInt9;

   type TIMER0_COUNT_Register is record
      --  Read-only. Count down timer: the remaining number clk_tick cycles
      --  before the next tick is generated.
      TIMER0_COUNT  : TIMER0_COUNT_TIMER0_COUNT_Field;
      --  unspecified
      Reserved_9_31 : HAL.UInt23;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TIMER0_COUNT_Register use record
      TIMER0_COUNT  at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  Controls the tick generator
   type TIMER1_CTRL_Register is record
      --  start / stop tick generation
      ENABLE        : Boolean := False;
      --  Read-only. Is the tick generator running?
      RUNNING       : Boolean := False;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TIMER1_CTRL_Register use record
      ENABLE        at 0 range 0 .. 0;
      RUNNING       at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype TIMER1_CYCLES_TIMER1_CYCLES_Field is HAL.UInt9;

   type TIMER1_CYCLES_Register is record
      --  Total number of clk_tick cycles before the next tick.
      TIMER1_CYCLES : TIMER1_CYCLES_TIMER1_CYCLES_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TIMER1_CYCLES_Register use record
      TIMER1_CYCLES at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype TIMER1_COUNT_TIMER1_COUNT_Field is HAL.UInt9;

   type TIMER1_COUNT_Register is record
      --  Read-only. Count down timer: the remaining number clk_tick cycles
      --  before the next tick is generated.
      TIMER1_COUNT  : TIMER1_COUNT_TIMER1_COUNT_Field;
      --  unspecified
      Reserved_9_31 : HAL.UInt23;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TIMER1_COUNT_Register use record
      TIMER1_COUNT  at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  Controls the tick generator
   type WATCHDOG_CTRL_Register is record
      --  start / stop tick generation
      ENABLE        : Boolean := False;
      --  Read-only. Is the tick generator running?
      RUNNING       : Boolean := False;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for WATCHDOG_CTRL_Register use record
      ENABLE        at 0 range 0 .. 0;
      RUNNING       at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype WATCHDOG_CYCLES_WATCHDOG_CYCLES_Field is HAL.UInt9;

   type WATCHDOG_CYCLES_Register is record
      --  Total number of clk_tick cycles before the next tick.
      WATCHDOG_CYCLES : WATCHDOG_CYCLES_WATCHDOG_CYCLES_Field := 16#0#;
      --  unspecified
      Reserved_9_31   : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for WATCHDOG_CYCLES_Register use record
      WATCHDOG_CYCLES at 0 range 0 .. 8;
      Reserved_9_31   at 0 range 9 .. 31;
   end record;

   subtype WATCHDOG_COUNT_WATCHDOG_COUNT_Field is HAL.UInt9;

   type WATCHDOG_COUNT_Register is record
      --  Read-only. Count down timer: the remaining number clk_tick cycles
      --  before the next tick is generated.
      WATCHDOG_COUNT : WATCHDOG_COUNT_WATCHDOG_COUNT_Field;
      --  unspecified
      Reserved_9_31  : HAL.UInt23;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for WATCHDOG_COUNT_Register use record
      WATCHDOG_COUNT at 0 range 0 .. 8;
      Reserved_9_31  at 0 range 9 .. 31;
   end record;

   --  Controls the tick generator
   type RISCV_CTRL_Register is record
      --  start / stop tick generation
      ENABLE        : Boolean := False;
      --  Read-only. Is the tick generator running?
      RUNNING       : Boolean := False;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RISCV_CTRL_Register use record
      ENABLE        at 0 range 0 .. 0;
      RUNNING       at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype RISCV_CYCLES_RISCV_CYCLES_Field is HAL.UInt9;

   type RISCV_CYCLES_Register is record
      --  Total number of clk_tick cycles before the next tick.
      RISCV_CYCLES  : RISCV_CYCLES_RISCV_CYCLES_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RISCV_CYCLES_Register use record
      RISCV_CYCLES  at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype RISCV_COUNT_RISCV_COUNT_Field is HAL.UInt9;

   type RISCV_COUNT_Register is record
      --  Read-only. Count down timer: the remaining number clk_tick cycles
      --  before the next tick is generated.
      RISCV_COUNT   : RISCV_COUNT_RISCV_COUNT_Field;
      --  unspecified
      Reserved_9_31 : HAL.UInt23;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RISCV_COUNT_Register use record
      RISCV_COUNT   at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type TICKS_Peripheral is record
      --  Controls the tick generator
      PROC0_CTRL      : aliased PROC0_CTRL_Register;
      PROC0_CYCLES    : aliased PROC0_CYCLES_Register;
      PROC0_COUNT     : aliased PROC0_COUNT_Register;
      --  Controls the tick generator
      PROC1_CTRL      : aliased PROC1_CTRL_Register;
      PROC1_CYCLES    : aliased PROC1_CYCLES_Register;
      PROC1_COUNT     : aliased PROC1_COUNT_Register;
      --  Controls the tick generator
      TIMER0_CTRL     : aliased TIMER0_CTRL_Register;
      TIMER0_CYCLES   : aliased TIMER0_CYCLES_Register;
      TIMER0_COUNT    : aliased TIMER0_COUNT_Register;
      --  Controls the tick generator
      TIMER1_CTRL     : aliased TIMER1_CTRL_Register;
      TIMER1_CYCLES   : aliased TIMER1_CYCLES_Register;
      TIMER1_COUNT    : aliased TIMER1_COUNT_Register;
      --  Controls the tick generator
      WATCHDOG_CTRL   : aliased WATCHDOG_CTRL_Register;
      WATCHDOG_CYCLES : aliased WATCHDOG_CYCLES_Register;
      WATCHDOG_COUNT  : aliased WATCHDOG_COUNT_Register;
      --  Controls the tick generator
      RISCV_CTRL      : aliased RISCV_CTRL_Register;
      RISCV_CYCLES    : aliased RISCV_CYCLES_Register;
      RISCV_COUNT     : aliased RISCV_COUNT_Register;
   end record
     with Volatile;

   for TICKS_Peripheral use record
      PROC0_CTRL      at 16#0# range 0 .. 31;
      PROC0_CYCLES    at 16#4# range 0 .. 31;
      PROC0_COUNT     at 16#8# range 0 .. 31;
      PROC1_CTRL      at 16#C# range 0 .. 31;
      PROC1_CYCLES    at 16#10# range 0 .. 31;
      PROC1_COUNT     at 16#14# range 0 .. 31;
      TIMER0_CTRL     at 16#18# range 0 .. 31;
      TIMER0_CYCLES   at 16#1C# range 0 .. 31;
      TIMER0_COUNT    at 16#20# range 0 .. 31;
      TIMER1_CTRL     at 16#24# range 0 .. 31;
      TIMER1_CYCLES   at 16#28# range 0 .. 31;
      TIMER1_COUNT    at 16#2C# range 0 .. 31;
      WATCHDOG_CTRL   at 16#30# range 0 .. 31;
      WATCHDOG_CYCLES at 16#34# range 0 .. 31;
      WATCHDOG_COUNT  at 16#38# range 0 .. 31;
      RISCV_CTRL      at 16#3C# range 0 .. 31;
      RISCV_CYCLES    at 16#40# range 0 .. 31;
      RISCV_COUNT     at 16#44# range 0 .. 31;
   end record;

   TICKS_Periph : aliased TICKS_Peripheral
     with Import, Address => TICKS_Base;

end RP2350_SVD.TICKS;
