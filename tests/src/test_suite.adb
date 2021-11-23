with Clock_Tests;
with GPIO_Tests;
with UART_Tests;

package body Test_Suite is
   Result : aliased AUnit.Test_Suites.Test_Suite;

   Clock_Case : aliased Clock_Tests.Clock_Test;
   GPIO_Case  : aliased GPIO_Tests.GPIO_Test;
   UART_Case  : aliased UART_Tests.UART_Test;

   function Suite
      return AUnit.Test_Suites.Access_Test_Suite
   is
      use AUnit.Test_Suites;
   begin
      Add_Test (Result'Access, Clock_Case'Access);
      Add_Test (Result'Access, GPIO_Case'Access);
      Add_Test (Result'Access, UART_Case'Access);
      return Result'Access;
   end Suite;
end Test_Suite;
