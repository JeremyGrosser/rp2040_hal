--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Assertions;
with RP.SysTick;
with RP.Timer;
with RP;

package body SysTick_Tests is

   ST : RP.SysTick.Delays;

   procedure Test_Enable
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use AUnit.Assertions;
   begin
      ST.Enable;
      Assert (ST.Enabled, "not enabled");
      ST.Disable;
      Assert (not ST.Enabled, "not disabled");
      ST.Enable;
      Assert (ST.Enabled, "not enabled");
   end Test_Enable;

   procedure Test_Delays
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use AUnit.Assertions;
      use RP.SysTick;
      use type RP.Timer.Time;
      Ref_A, Ref_B : RP.Timer.Time;
      A, B : Time;
   begin
      Ref_A := RP.Timer.Clock;
      A := Clock;
      ST.Delay_Seconds (1);
      B := Clock;
      Ref_B := RP.Timer.Clock;
      Assert (B > A, "Delay_Seconds too short");
      Assert ((B - A) = 1000, "Delay_Seconds too long");
      Assert ((Ref_B - Ref_A) in (1_000_000 - 1_000) .. (1_000_000 + 1_000), "Delay_Seconds > 1ms error");

      Ref_A := RP.Timer.Clock;
      A := Clock;
      ST.Delay_Milliseconds (10);
      B := Clock;
      Ref_B := RP.Timer.Clock;
      Assert (B > A, "Delay_Milliseconds too short");
      Assert ((B - A) = 10, "Delay_Milliseconds too long");
      Assert ((Ref_B - Ref_A) in (10_000 - 1_000) .. (10_000 + 1_000), "Delay_Milliseconds > 1ms error");
   end Test_Delays;

   procedure Test_Milliseconds
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use AUnit.Assertions;
      use RP.SysTick;
   begin
      Assert (Milliseconds (1_000) = Ticks_Per_Second, "Math is hard");
   end Test_Milliseconds;

   overriding
   procedure Register_Tests
      (T : in out SysTick_Test)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Enable'Access, "Enable");
      Register_Routine (T, Test_Delays'Access, "Delays");
      Register_Routine (T, Test_Milliseconds'Access, "Milliseconds");
   end Register_Tests;

   overriding
   function Name
      (T : SysTick_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.SysTick"));

end SysTick_Tests;
