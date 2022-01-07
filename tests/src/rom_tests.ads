with AUnit.Test_Cases;
with AUnit;

package ROM_Tests is

   type ROM_Test is new AUnit.Test_Cases.Test_Case with null record;

   overriding
   procedure Register_Tests
      (T : in out ROM_Test);

   overriding
   function Name
      (T : ROM_Test)
      return AUnit.Message_String;

   overriding
   procedure Set_Up
      (T : in out ROM_Test);

   procedure Test_Data_Lookup
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Floating_Point
      (T : in out AUnit.Test_Cases.Test_Case'Class);

end ROM_Tests;
