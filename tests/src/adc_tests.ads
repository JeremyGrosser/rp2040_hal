--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Test_Cases;
with AUnit;

package ADC_Tests is

   type ADC_Test is new AUnit.Test_Cases.Test_Case with null record;

   overriding
   procedure Register_Tests
      (T : in out ADC_Test);

   overriding
   function Name
      (T : ADC_Test)
      return AUnit.Message_String;

   overriding
   procedure Set_Up
      (T : in out ADC_Test);

   procedure Test_Read
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Temperature
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Disable
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Round_Robin
      (T : in out AUnit.Test_Cases.Test_Case'Class);

end ADC_Tests;
