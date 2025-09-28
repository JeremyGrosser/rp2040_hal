--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Assertions; use AUnit.Assertions;
with RP.Timer.Interrupts3;
--  with RP.Timer;

package body Timer3_Tests is

   Delays : RP.Timer.Interrupts3.Delays;

   procedure Test_Enable
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
   begin
      Delays.Enable;
      Assert (Delays.Enabled, "not enabled");
      Delays.Disable;
      Assert (not Delays.Enabled, "not disabled");
   end Test_Enable;

   procedure Test_Clock
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use RP.Timer;
   begin
      Assert (Clock > 0, "not counting");
   end Test_Clock;

   procedure Test_Delays
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use RP.Timer;
      Start, Stop : Time;
   begin
      Delays.Enable;

      Start := Clock;
      Delays.Delay_Microseconds (100);
      Stop := Clock;
      Assert (Stop - Start >= 100, "microseconds");

      Start := Clock;
      Delays.Delay_Milliseconds (1);
      Stop := Clock;
      Assert (Stop - Start >= Milliseconds (1), "millisecond");

      Start := Clock;
      Delays.Delay_Milliseconds (10);
      Stop := Clock;
      Assert (Stop - Start >= Milliseconds (10), "milliseconds");

      Start := Clock;
      Delays.Delay_Seconds (1);
      Stop := Clock;
      Assert (Stop - Start >= Milliseconds (1_000), "second");

      Start := Clock;
      Delays.Delay_Until (Start + Milliseconds (1));
      Stop := Clock;
      Assert (Stop - Start >= Milliseconds (1), "until");

      Start := Clock;
      RP.Timer.Busy_Wait_Until (Start + 100);
      Stop := Clock;
      Assert (Stop - Start >= 100, "busy wait");

      Delays.Disable;
   end Test_Delays;

   overriding
   procedure Register_Tests
      (T : in out Timer3_Test)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Enable'Access, "Enabled");
      Register_Routine (T, Test_Clock'Access, "Clock");
      Register_Routine (T, Test_Delays'Access, "Delays");
   end Register_Tests;

   overriding
   function Name
      (T : Timer3_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.Timer.Interrupts3"));

end Timer3_Tests;
