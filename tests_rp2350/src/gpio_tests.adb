--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Assertions;
with Ada.Interrupts.Names;
with System;
with RP.GPIO;
with HAL.GPIO;

package body GPIO_Tests is

   LED : RP.GPIO.GPIO_Point := (Pin => 25);

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
      Assert (LED.Get = True, "Unable to get input (pull-up)");

      LED.Set_Mode (Output);
      LED.Clear;
      LED.Set;
      LED.Toggle;

      Assert (LED.Set = False, "Set returned incorrect value");
   end Test_HAL;

   protected Interrupts
      with Interrupt_Priority => System.Interrupt_Priority'First
   is
      procedure GPIO_Interrupt
         with Attach_Handler => Ada.Interrupts.Names.IO_IRQ_BANK0_Interrupt_CPU_1;

      procedure Reset_Count;

      function Interrupt_Count
         return Natural;
   private
      Count : Natural := 0;
   end Interrupts;

   protected body Interrupts is
      procedure GPIO_Interrupt is
      begin
         if RP.GPIO.Interrupt.Triggered (LED.Pin, RP.GPIO.Interrupt.Low) then
            RP.GPIO.Interrupt.Disable (LED.Pin, RP.GPIO.Interrupt.Low);
         elsif RP.GPIO.Interrupt.Triggered (LED.Pin, RP.GPIO.Interrupt.Rising) then
            RP.GPIO.Interrupt.Acknowledge (LED.Pin, RP.GPIO.Interrupt.Rising);
         end if;
         Count := Count + 1;
      end GPIO_Interrupt;

      procedure Reset_Count is
      begin
         Count := 0;
      end Reset_Count;

      function Interrupt_Count
         return Natural
      is (Count);
   end Interrupts;

   procedure Test_Interrupts
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use AUnit.Assertions;
      use RP.GPIO;
   begin
      --  Drive pin low, input latch enabled
      Isolate (LED.Pin, False);
      Func (LED.Pin, SIO);
      Pull (LED.Pin, False, False);
      Output_Enable (LED.Pin, True);
      Set (LED.Pin, False);
      Input_Enable (LED.Pin, True);
      Assert (not LED.Get, "Pin not driven low");

      Interrupts.Reset_Count;
      Interrupt.Acknowledge (LED.Pin, Interrupt.Rising);
      Interrupt.Enable (LED.Pin, Interrupt.Rising);
      Set (LED.Pin, True);
      delay 0.001;
      Assert (Interrupts.Interrupt_Count > 0, "Rising edge not triggered");
      Assert (Interrupts.Interrupt_Count = 1, "Rising edge triggered more than once");

      Interrupts.Reset_Count;
      Interrupt.Enable (LED.Pin, Interrupt.Low);
      Assert (Interrupts.Interrupt_Count = 0, "Unexpected interrupt before changing pin state");
      Set (LED.Pin, False);
      delay 0.001;
      Assert (Interrupts.Interrupt_Count > 0, "Low interrupt not triggered");
      Interrupts.Reset_Count;
      delay 0.001;
      Assert (Interrupts.Interrupt_Count = 0, "Low interrupt triggered after disable");
      Interrupt.Disable (LED.Pin, Interrupt.Rising);
      delay 0.001;
      Set (LED.Pin, True);
      Assert (Interrupts.Interrupt_Count = 0, "Rising interrupt triggered after disable");
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
