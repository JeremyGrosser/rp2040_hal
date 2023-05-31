--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
package RP.Watchdog
   with Preelaborate
is
   procedure Configure
      (Cycles : Hertz);
   --  Watchdog is clocked by clk_ref (1 MHz), so cycles are microseconds.
   --  Only Proc0 and Proc1 are reset when the watchdog is triggered.
   --  TODO: Make PSM_WDSEL and PAUSE_DBG configurable.

   procedure Enable;

   procedure Disable;

   procedure Reload;

   procedure Trigger;
   --  Reset now
end RP.Watchdog;
