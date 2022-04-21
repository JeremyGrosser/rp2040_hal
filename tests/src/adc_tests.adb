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
      use type RP.ADC.Analog_Value;
      C : constant Celsius := RP.ADC.Temperature;
   begin
      Assert (C in -20 .. 85, "Temperature out of range");
      --  Table 631. Thermal Performance

      RP.ADC.Configure (RP.ADC.Temperature_Sensor);
      Assert (RP.ADC.Read (RP.ADC.Temperature_Sensor) /= 0,
         "Direct temperature sensor read returned zero, maybe okay?");
   end Test_Temperature;

   procedure Test_Disable
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
   begin
      RP.ADC.Disable;
      Assert (not RP.ADC.Enabled, "not disabled");
      RP.ADC.Enable;
      Assert (RP.ADC.Enabled, "not enabled");
   end Test_Disable;

   procedure Test_Round_Robin
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      Sample : RP.ADC.Analog_Value with Unreferenced;
   begin
      RP.ADC.Set_Round_Robin (Channels => (0 .. 1 => True, others => False));
      Sample := RP.ADC.Read;
      Sample := RP.ADC.Read;
      Sample := RP.ADC.Read;
   end Test_Round_Robin;

   overriding
   procedure Register_Tests
      (T : in out ADC_Test)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Read'Access, "Read");
      Register_Routine (T, Test_Temperature'Access, "Temperature");
      Register_Routine (T, Test_Round_Robin'Access, "Round robin");
      Register_Routine (T, Test_Disable'Access, "Disable");
   end Register_Tests;

   overriding
   function Name
      (T : ADC_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.ADC"));

end ADC_Tests;
