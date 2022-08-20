--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Assertions; use AUnit.Assertions;
with HAL; use HAL;
with RP.PWM; use RP.PWM;
with RP.PWM.Interrupts;
with RP.Timer;
with RP.GPIO;
with RP.Clock;

package body PWM_Tests is
   P : constant PWM_Point := To_PWM (RP.GPIO.GPIO_Point'(Pin => 0));
   IRQ_Count : Natural := 0;

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
      Set_Duty_Cycle (P.Slice, Period'Last, Period'Last);
      Set_Invert (P.Slice, False, False);
      Set_Phase_Correction (P.Slice, False);
      Set_Mode (P.Slice, Free_Running);
      Assert (Count (P.Slice) = 0, "PWM counter did not initialize at zero");
      Set_Count (P.Slice, Period'Last);
      Assert (Count (P.Slice) = Period'Last, "Set_Count didn't");
      Enable (P.Slice);
      Assert (Enabled (P.Slice), "PWM not enabled");
      Disable (P.Slice);
      Assert (Count (P.Slice) /= Period'Last, "PWM counter did not change when enabled");
   end Test_Counter;

   procedure Test_Interrupt
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      Delays : RP.Timer.Delays;
   begin
      Delays.Enable;

      IRQ_Count := 0;
      Interrupts.Attach (P.Slice, IRQ_Handler'Access);

      Set_Frequency (P.Slice, 10_000_000);
      Set_Interval (P.Slice, 10_000);
      Set_Duty_Cycle (P.Slice, P.Channel, 5_000);
      Enable (P.Slice);

      Delays.Delay_Milliseconds (1);

      Disable (P.Slice);
      Assert (IRQ_Count > 0, "PWM IRQ did not fire");
   end Test_Interrupt;

   procedure IRQ_Handler is
   begin
      IRQ_Count := IRQ_Count + 1;
   end IRQ_Handler;

   overriding
   procedure Register_Tests
      (T : in out PWM_Test)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Divider'Access, "Divider");
      Register_Routine (T, Test_Counter'Access, "Counter");
      Register_Routine (T, Test_Interrupt'Access, "Interrupt");
   end Register_Tests;

   overriding
   function Name
      (T : PWM_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.PWM"));

end PWM_Tests;
