--
--  Copyright (C) 2026 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Assertions; use AUnit.Assertions;
with RP.Watchdog;

package body Watchdog_Tests is

   --  Long enough that nothing here gets close to a reset
   Timeout : constant RP.Watchdog.Milliseconds := 2_000;

   overriding
   procedure Set_Up
      (T : in out Watchdog_Test)
   is
   begin
      --  The tests run under a debugger, the counter has to keep running
      RP.Watchdog.Configure (Timeout, Debug_Pause => False);
   end Set_Up;

   overriding
   procedure Tear_Down
      (T : in out Watchdog_Test)
   is
   begin
      RP.Watchdog.Disable;
   end Tear_Down;

   procedure Test_Countdown
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      Before, After : Natural;
   begin
      Assert (RP.Watchdog.Enabled, "Watchdog not enabled after Configure");
      Before := RP.Watchdog.Remaining;
      Assert (Before in Timeout - 50 .. Timeout, "Counter was not loaded with the timeout");

      delay 0.2;
      After := RP.Watchdog.Remaining;
      Assert (After < Before, "Watchdog is not counting down");
      --  If RP2040-E1 were not accounted for this would be off by a factor of two
      Assert (Before - After in 150 .. 300,
         "Expected about 200 ms to elapse, counter moved" & Natural'Image (Before - After));
   end Test_Countdown;

   procedure Test_Reload
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
   begin
      delay 0.2;
      Assert (RP.Watchdog.Remaining < Timeout - 100, "Watchdog is not counting down");
      RP.Watchdog.Reload;
      Assert (RP.Watchdog.Remaining in Timeout - 50 .. Timeout, "Reload did not restart the countdown");
      Assert (RP.Watchdog.Enabled, "Reload disabled the watchdog");
   end Test_Reload;

   procedure Test_Disable
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      Stopped : Natural;
   begin
      delay 0.1;
      RP.Watchdog.Disable;
      Assert (not RP.Watchdog.Enabled, "Watchdog still enabled after Disable");

      Stopped := RP.Watchdog.Remaining;
      delay 0.1;
      Assert (RP.Watchdog.Remaining = Stopped, "Counter kept running while disabled");

      RP.Watchdog.Enable;
      Assert (RP.Watchdog.Enabled, "Watchdog not enabled after Enable");
      Assert (RP.Watchdog.Remaining in Timeout - 50 .. Timeout, "Enable did not reload the counter");
      delay 0.1;
      Assert (RP.Watchdog.Remaining < Timeout - 50, "Counter did not resume after Enable");
   end Test_Disable;

   overriding
   procedure Register_Tests
      (T : in out Watchdog_Test)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Countdown'Access, "Countdown");
      Register_Routine (T, Test_Reload'Access, "Reload");
      Register_Routine (T, Test_Disable'Access, "Disable");
   end Register_Tests;

   overriding
   function Name
      (T : Watchdog_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.Watchdog"));

end Watchdog_Tests;
