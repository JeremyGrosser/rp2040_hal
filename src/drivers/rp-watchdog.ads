--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
package RP.Watchdog
   with Preelaborate
is
   subtype Milliseconds is Positive range 1 .. 8_388;

   procedure Configure
      (Timeout       : Milliseconds;
       Debug_Pause   : Boolean := True)
   with Pre => Timeout <= 8_388;
   --  Only Proc0 and Proc1 are reset when the watchdog is triggered. Clocks,
   --  SRAM, and buses are unaffected by the watchdog. (TODO: PSM_WDSEL config)
   --
   --  When Debug_Pause is True, the Watchdog timer does not run as long as a
   --  debugger is attached.

   procedure Enable;

   procedure Disable;

   procedure Reload;

   procedure Trigger;
   --  Reset now
end RP.Watchdog;
