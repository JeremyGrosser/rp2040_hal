with Clock_Tests;

package body Test_Suite is
   Result : aliased AUnit.Test_Suites.Test_Suite;

   Clock_Case : aliased Clock_Tests.Clock_Test;

   function Suite
      return AUnit.Test_Suites.Access_Test_Suite
   is
      use AUnit.Test_Suites;
   begin
      Add_Test (Result'Access, Clock_Case'Access);
      return Result'Access;
   end Suite;
end Test_Suite;
