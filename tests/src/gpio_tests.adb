--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Assertions;
with RP.GPIO.Interrupts;
with HAL.GPIO;
with RP.Timer;

package body GPIO_Tests is

   LED : RP.GPIO.GPIO_Point := (Pin => 25);
   IRQ_Count : Natural := 0;

   procedure Test_Configure
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use AUnit.Assertions;
      use HAL.GPIO;
      use RP.GPIO;
   begin
      LED.Configure (Input);
      Assert (LED.Mode = HAL.GPIO.Input,
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

      LED.Configure (Input, RP.GPIO.Floating, RP.GPIO.SPI);
      Assert (LED.Mode = HAL.GPIO.Unknown_Mode, "Wrong mode when FUNCSEL is not SIO");

      LED.Configure (Input, RP.GPIO.Floating, RP.GPIO.SIO);
      Assert (LED.Mode = HAL.GPIO.Input, "Unexpected Mode");
   end Test_Configure;

   procedure Test_HAL
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use AUnit.Assertions;
      use HAL.GPIO;
   begin
      for Cap in Capability'Range loop
         Assert (LED.Support (Cap) = True,
            "Capability " & Cap'Image & " is not supported");
      end loop;

      LED.Set_Mode (Output);
      Assert (LED.Mode = Output, "Unable to set output mode");
      for R in GPIO_Pull_Resistor'Range loop
         LED.Set_Pull_Resistor (R);
         Assert (LED.Pull_Resistor = R, "Unable to set pull resistor");
      end loop;

      LED.Set_Pull_Resistor (Pull_Up);
      LED.Set_Mode (Input);
      Assert (LED.Mode = Input, "Unable to set input mode");
      Assert (LED.Get = False, "Unable to get input");

      LED.Set_Mode (Output);
      LED.Clear;
      LED.Set;
      LED.Toggle;

      Assert (LED.Set = False, "Set returned incorrect value");
   end Test_HAL;

   procedure Interrupt_Handler
      (Pin     : RP.GPIO.GPIO_Pin;
       Trigger : RP.GPIO.Interrupt_Triggers)
   is
      use AUnit.Assertions;
      use RP.GPIO;
   begin
      Disable_Interrupt (LED, Low_Level);
      Assert (Pin = LED.Pin, "Interrupt from wrong pin");
      Assert (Trigger = Low_Level, "Wrong interrupt level");
      IRQ_Count := IRQ_Count + 1;
   end Interrupt_Handler;

   procedure Test_Interrupts
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use AUnit.Assertions;
      use RP.GPIO;
      use RP.Timer;
      Deadline : Time;
   begin
      LED.Configure (Input, Pull_Down);
      RP.GPIO.Interrupts.Set_Interrupt_Handler (LED, Interrupt_Handler'Access);
      IRQ_Count := 0;
      LED.Enable_Interrupt (Low_Level);

      Deadline := Clock + Milliseconds (1);
      while Clock < Deadline and then IRQ_Count = 0 loop
         null;
      end loop;

      Assert (IRQ_Count = 1, "Only one interrupt expected");
      RP.GPIO.Interrupts.Set_Interrupt_Handler (LED, null);
   end Test_Interrupts;

   overriding
   procedure Register_Tests
      (T : in out GPIO_Test)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Configure'Access, "Configure");
      Register_Routine (T, Test_HAL'Access, "HAL");
      Register_Routine (T, Test_Interrupts'Access, "Interrupts");
   end Register_Tests;

   overriding
   function Name
      (T : GPIO_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.GPIO"));

end GPIO_Tests;
