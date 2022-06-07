--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
package RP.Watchdog
   with Preelaborate
is
   --  Watchdog is clocked by clk_ref
   procedure Configure
      (Cycles : Hertz);
   procedure Enable;
   procedure Disable;
   procedure Reload;
end RP.Watchdog;
