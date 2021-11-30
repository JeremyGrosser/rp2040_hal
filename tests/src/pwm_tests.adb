with AUnit.Assertions; use AUnit.Assertions;
with RP.PWM; use RP.PWM;
with RP.Clock;

package body PWM_Tests is
   P : constant PWM_Point := (Slice => 0, Channel => A);

   overriding
   procedure Set_Up
      (T : in out PWM_Test)
   is
   begin
      RP.PWM.Initialize;
   end Set_Up;

   procedure Test_Divider
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      Div : Divider := Divider'First;
   begin
      loop
         Set_Divider (P.Slice, Div);
         exit when Div = Divider'Last;
         Div := Div + Divider'Small;
      end loop;

      Set_Frequency (P.Slice, 488_400);
      Set_Frequency (P.Slice, 1_000_000);
      Set_Frequency (P.Slice, 16_000_000);
      Set_Frequency (P.Slice, RP.Clock.Frequency (RP.Clock.SYS));
   end Test_Divider;

   procedure Test_Counter
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
   begin
      Set_Interval (P.Slice, Period'First);
      Set_Interval (P.Slice, Period'Last);
      Set_Duty_Cycle (P.Slice, P.Channel, Period'First);
      Set_Duty_Cycle (P.Slice, P.Channel, Period'Last);
      Set_Mode (P.Slice, Free_Running);
      Assert (Count (P.Slice) = 0, "PWM counter did not initialize at zero");
      Enable (P.Slice);
      Disable (P.Slice);
      Assert (Count (P.Slice) /= 0, "PWM counter did not increase when enabled");
   end Test_Counter;

   overriding
   procedure Register_Tests
      (T : in out PWM_Test)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Divider'Access, "Divider");
      Register_Routine (T, Test_Counter'Access, "Counter");
   end Register_Tests;

   overriding
   function Name
      (T : PWM_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.PWM"));

end PWM_Tests;
