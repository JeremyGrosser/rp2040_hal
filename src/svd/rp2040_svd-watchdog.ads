pragma Style_Checks (Off);

--  Copyright (c) 2020 Raspberry Pi (Trading) Ltd.
--
--  SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2040.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package RP2040_SVD.WATCHDOG is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CTRL_TIME_Field is HAL.UInt24;

   --  CTRL_PAUSE_DBG array
   type CTRL_PAUSE_DBG_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for CTRL_PAUSE_DBG
   type CTRL_PAUSE_DBG_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PAUSE_DBG as a value
            Val : HAL.UInt2;
         when True =>
            --  PAUSE_DBG as an array
            Arr : CTRL_PAUSE_DBG_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for CTRL_PAUSE_DBG_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Watchdog control\n The rst_wdsel register determines which subsystems
   --  are reset when the watchdog is triggered.\n The watchdog can be
   --  triggered in software.
   type CTRL_Register is record
      --  Read-only. Indicates the number of ticks / 2 (see errata RP2040-E1)
      --  before a watchdog reset will be triggered
      TIME           : CTRL_TIME_Field := 16#0#;
      --  Pause the watchdog timer when JTAG is accessing the bus fabric
      PAUSE_JTAG     : Boolean := True;
      --  Pause the watchdog timer when processor 0 is in debug mode
      PAUSE_DBG      : CTRL_PAUSE_DBG_Field :=
                        (As_Array => False, Val => 16#1#);
      --  unspecified
      Reserved_27_29 : HAL.UInt3 := 16#0#;
      --  When not enabled the watchdog timer is paused
      ENABLE         : Boolean := False;
      --  After a write operation all bits in the field are cleared (set to
      --  zero). Trigger a watchdog reset
      TRIGGER        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CTRL_Register use record
      TIME           at 0 range 0 .. 23;
      PAUSE_JTAG     at 0 range 24 .. 24;
      PAUSE_DBG      at 0 range 25 .. 26;
      Reserved_27_29 at 0 range 27 .. 29;
      ENABLE         at 0 range 30 .. 30;
      TRIGGER        at 0 range 31 .. 31;
   end record;

   subtype LOAD_LOAD_Field is HAL.UInt24;

   --  Load the watchdog timer. The maximum setting is 0xffffff which
   --  corresponds to 0xffffff / 2 ticks before triggering a watchdog reset
   --  (see errata RP2040-E1).
   type LOAD_Register is record
      --  Write-only.
      LOAD           : LOAD_LOAD_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for LOAD_Register use record
      LOAD           at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Logs the reason for the last reset. Both bits are zero for the case of a
   --  hardware reset.
   type REASON_Register is record
      --  Read-only.
      TIMER         : Boolean;
      --  Read-only.
      FORCE         : Boolean;
      --  unspecified
      Reserved_2_31 : HAL.UInt30;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for REASON_Register use record
      TIMER         at 0 range 0 .. 0;
      FORCE         at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype TICK_CYCLES_Field is HAL.UInt9;
   subtype TICK_COUNT_Field is HAL.UInt9;

   --  Controls the tick generator
   type TICK_Register is record
      --  Total number of clk_tick cycles before the next tick.
      CYCLES         : TICK_CYCLES_Field := 16#0#;
      --  start / stop tick generation
      ENABLE         : Boolean := True;
      --  Read-only. Is the tick generator running?
      RUNNING        : Boolean := False;
      --  Read-only. Count down timer: the remaining number clk_tick cycles
      --  before the next tick is generated.
      COUNT          : TICK_COUNT_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : HAL.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TICK_Register use record
      CYCLES         at 0 range 0 .. 8;
      ENABLE         at 0 range 9 .. 9;
      RUNNING        at 0 range 10 .. 10;
      COUNT          at 0 range 11 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type WATCHDOG_Peripheral is record
      --  Watchdog control\n The rst_wdsel register determines which subsystems
      --  are reset when the watchdog is triggered.\n The watchdog can be
      --  triggered in software.
      CTRL     : aliased CTRL_Register;
      --  Load the watchdog timer. The maximum setting is 0xffffff which
      --  corresponds to 0xffffff / 2 ticks before triggering a watchdog reset
      --  (see errata RP2040-E1).
      LOAD     : aliased LOAD_Register;
      --  Logs the reason for the last reset. Both bits are zero for the case
      --  of a hardware reset.
      REASON   : aliased REASON_Register;
      --  Scratch register. Information persists through soft reset of the
      --  chip.
      SCRATCH0 : aliased HAL.UInt32;
      --  Scratch register. Information persists through soft reset of the
      --  chip.
      SCRATCH1 : aliased HAL.UInt32;
      --  Scratch register. Information persists through soft reset of the
      --  chip.
      SCRATCH2 : aliased HAL.UInt32;
      --  Scratch register. Information persists through soft reset of the
      --  chip.
      SCRATCH3 : aliased HAL.UInt32;
      --  Scratch register. Information persists through soft reset of the
      --  chip.
      SCRATCH4 : aliased HAL.UInt32;
      --  Scratch register. Information persists through soft reset of the
      --  chip.
      SCRATCH5 : aliased HAL.UInt32;
      --  Scratch register. Information persists through soft reset of the
      --  chip.
      SCRATCH6 : aliased HAL.UInt32;
      --  Scratch register. Information persists through soft reset of the
      --  chip.
      SCRATCH7 : aliased HAL.UInt32;
      --  Controls the tick generator
      TICK     : aliased TICK_Register;
   end record
     with Volatile;

   for WATCHDOG_Peripheral use record
      CTRL     at 16#0# range 0 .. 31;
      LOAD     at 16#4# range 0 .. 31;
      REASON   at 16#8# range 0 .. 31;
      SCRATCH0 at 16#C# range 0 .. 31;
      SCRATCH1 at 16#10# range 0 .. 31;
      SCRATCH2 at 16#14# range 0 .. 31;
      SCRATCH3 at 16#18# range 0 .. 31;
      SCRATCH4 at 16#1C# range 0 .. 31;
      SCRATCH5 at 16#20# range 0 .. 31;
      SCRATCH6 at 16#24# range 0 .. 31;
      SCRATCH7 at 16#28# range 0 .. 31;
      TICK     at 16#2C# range 0 .. 31;
   end record;

   WATCHDOG_Periph : aliased WATCHDOG_Peripheral
     with Import, Address => WATCHDOG_Base;

end RP2040_SVD.WATCHDOG;
