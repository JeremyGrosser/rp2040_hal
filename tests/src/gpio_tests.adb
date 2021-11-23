with AUnit.Assertions;
with HAL.GPIO;
with RP.GPIO;

package body GPIO_Tests is

   procedure Test_Configure
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use AUnit.Assertions;
      use HAL.GPIO;
      use RP.GPIO;

      LED : RP.GPIO.GPIO_Point := (Pin => 25);
   begin
      LED.Configure (Input);
      Assert (LED.Mode = Input,
         "Unable to set input mode");

      LED.Configure (Analog);
      Assert (LED.Pull_Resistor = HAL.GPIO.Floating,
         "Unable to set analog mode");

      LED.Configure (Output);
      Assert (LED.Mode = Output,
         "Unable to set output mode");

      LED.Configure (Output, RP.GPIO.Pull_Up);
      Assert (LED.Pull_Resistor = HAL.GPIO.Pull_Up,
         "Unable to set pull up");

      LED.Configure (Output, RP.GPIO.Pull_Down);
      Assert (LED.Pull_Resistor = HAL.GPIO.Pull_Down,
         "Unable to set pull up");

      LED.Configure (Output, RP.GPIO.Floating);
      Assert (LED.Pull_Resistor = HAL.GPIO.Floating,
         "Unable to set pull up");
   end Test_Configure;

   overriding
   procedure Register_Tests
      (T : in out GPIO_Test)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Configure'Access, "Configure");
   end Register_Tests;

   overriding
   function Name
      (T : GPIO_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.GPIO"));

end GPIO_Tests;
