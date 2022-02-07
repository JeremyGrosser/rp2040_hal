--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Test_Cases;
with AUnit;

package Flash_Tests is

   type Flash_Test is new AUnit.Test_Cases.Test_Case with null record;

   overriding
   procedure Register_Tests
      (T : in out Flash_Test);

   overriding
   function Name
      (T : Flash_Test)
      return AUnit.Message_String;

   procedure Test_Erase
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Program
      (T : in out AUnit.Test_Cases.Test_Case'Class);

end Flash_Tests;
