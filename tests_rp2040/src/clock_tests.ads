--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Test_Cases;
with AUnit;

package Clock_Tests is

   type Clock_Test is new AUnit.Test_Cases.Test_Case with null record;

   overriding
   procedure Register_Tests
      (T : in out Clock_Test);

   overriding
   function Name
      (T : Clock_Test)
      return AUnit.Message_String;

   procedure Test_Initialize
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Enable
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Counter
      (T : in out AUnit.Test_Cases.Test_Case'Class);

end Clock_Tests;
