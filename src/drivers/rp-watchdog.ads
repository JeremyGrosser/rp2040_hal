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
      (Timeout : Milliseconds);
   --  Only Proc0 and Proc1 are reset when the watchdog is triggered.
   --  TODO: Make PSM_WDSEL and PAUSE_DBG configurable.

   procedure Enable;

   procedure Disable;

   procedure Reload;

   procedure Trigger;
   --  Reset now
end RP.Watchdog;
