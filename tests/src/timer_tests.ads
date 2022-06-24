--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Test_Cases;
with AUnit;

package Timer_Tests is

   type Timer_Test is new AUnit.Test_Cases.Test_Case with null record;

   overriding
   procedure Register_Tests
      (T : in out Timer_Test);

   overriding
   function Name
      (T : Timer_Test)
      return AUnit.Message_String;

   procedure Test_Enable
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Clock
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Delays
      (T : in out AUnit.Test_Cases.Test_Case'Class);

end Timer_Tests;
