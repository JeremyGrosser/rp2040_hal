--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Test_Cases;
with AUnit;

package RTC_Tests is

   type RTC_Test is new AUnit.Test_Cases.Test_Case with null record;

   overriding
   procedure Register_Tests
      (T : in out RTC_Test);

   overriding
   function Name
      (T : RTC_Test)
      return AUnit.Message_String;

   procedure Test_Configure
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Pause_Resume
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Time_Date
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Alarm
      (T : in out AUnit.Test_Cases.Test_Case'Class);

end RTC_Tests;
