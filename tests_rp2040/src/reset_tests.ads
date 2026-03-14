--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Test_Cases;
with AUnit;

package Reset_Tests is

   type Reset_Test is new AUnit.Test_Cases.Test_Case with null record;

   overriding
   procedure Register_Tests
      (T : in out Reset_Test);

   overriding
   function Name
      (T : Reset_Test)
      return AUnit.Message_String;

   overriding
   procedure Set_Up
      (T : in out Reset_Test);

   procedure Test_Timeout
      (T : in out AUnit.Test_Cases.Test_Case'Class);

end Reset_Tests;
