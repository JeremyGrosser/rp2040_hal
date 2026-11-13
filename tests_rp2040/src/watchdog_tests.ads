--
--  Copyright (C) 2026 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Test_Cases;
with AUnit;

package Watchdog_Tests is

   --  These tests never let the watchdog expire. A reset in the middle of
   --  the suite would restart it from the beginning.

   type Watchdog_Test is new AUnit.Test_Cases.Test_Case with null record;

   overriding
   procedure Register_Tests
      (T : in out Watchdog_Test);

   overriding
   function Name
      (T : Watchdog_Test)
      return AUnit.Message_String;

   overriding
   procedure Set_Up
      (T : in out Watchdog_Test);

   overriding
   procedure Tear_Down
      (T : in out Watchdog_Test);
   --  Make sure a failed assertion doesn't leave the watchdog running

   procedure Test_Countdown
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Reload
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Disable
      (T : in out AUnit.Test_Cases.Test_Case'Class);

end Watchdog_Tests;
