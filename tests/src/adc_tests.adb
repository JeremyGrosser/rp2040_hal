--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Assertions; use AUnit.Assertions;
with RP.ADC; use RP.ADC;

package body ADC_Tests is
   overriding
   procedure Set_Up
      (T : in out ADC_Test)
   is
   begin
      RP.ADC.Enable;
   end Set_Up;

   procedure Test_Read
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      A : Analog_Value with Unreferenced;
   begin
      RP.ADC.Configure (0);
      A := RP.ADC.Read (0);
   end Test_Read;

   procedure Test_Temperature
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      C : constant Celsius := RP.ADC.Temperature;
   begin
      Assert (C in -20 .. 85, "Temperature out of range");
      --  Table 631. Thermal Performance
   end Test_Temperature;

   overriding
   procedure Register_Tests
      (T : in out ADC_Test)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Read'Access, "Read");
      Register_Routine (T, Test_Temperature'Access, "Temperature");
   end Register_Tests;

   overriding
   function Name
      (T : ADC_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.ADC"));

end ADC_Tests;
