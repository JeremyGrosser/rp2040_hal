pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package RP2350_SVD.WATCHDOG is
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

   --  Watchdog control The rst_wdsel register determines which subsystems are
   --  reset when the watchdog is triggered. The watchdog can be triggered in
   --  software.
   type CTRL_Register is record
      --  Read-only. Indicates the time in usec before a watchdog reset will be
      --  triggered
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
      --  Write-only. Trigger a watchdog reset
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
   --  corresponds to approximately 16 seconds.
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
   --  hardware reset. Additionally, as of RP2350, a debugger warm reset of
   --  either core (SYSRESETREQ or hartreset) will also clear the watchdog
   --  reason register, so that software loaded under the debugger following a
   --  watchdog timeout will not continue to see the timeout condition.
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

   -----------------
   -- Peripherals --
   -----------------

   type WATCHDOG_Peripheral is record
      --  Watchdog control The rst_wdsel register determines which subsystems
      --  are reset when the watchdog is triggered. The watchdog can be
      --  triggered in software.
      CTRL     : aliased CTRL_Register;
      --  Load the watchdog timer. The maximum setting is 0xffffff which
      --  corresponds to approximately 16 seconds.
      LOAD     : aliased LOAD_Register;
      --  Logs the reason for the last reset. Both bits are zero for the case
      --  of a hardware reset. Additionally, as of RP2350, a debugger warm
      --  reset of either core (SYSRESETREQ or hartreset) will also clear the
      --  watchdog reason register, so that software loaded under the debugger
      --  following a watchdog timeout will not continue to see the timeout
      --  condition.
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
   end record;

   WATCHDOG_Periph : aliased WATCHDOG_Peripheral
     with Import, Address => WATCHDOG_Base;

end RP2350_SVD.WATCHDOG;
