with AUnit.Test_Cases;
with AUnit;

package PWM_Tests is

   type PWM_Test is new AUnit.Test_Cases.Test_Case with null record;

   overriding
   procedure Register_Tests
      (T : in out PWM_Test);

   overriding
   function Name
      (T : PWM_Test)
      return AUnit.Message_String;

   overriding
   procedure Set_Up
      (T : in out PWM_Test);

   procedure Test_Divider
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Counter
      (T : in out AUnit.Test_Cases.Test_Case'Class);

end PWM_Tests;
