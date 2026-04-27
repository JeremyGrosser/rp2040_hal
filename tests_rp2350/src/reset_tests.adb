--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Assertions; use AUnit.Assertions;
with RP.Reset;
with RP.ADC;

package body Reset_Tests is
   overriding
   procedure Set_Up
      (T : in out Reset_Test)
   is
   begin
      null;
   end Set_Up;

   procedure Test_Reset
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use RP.Reset;
   begin
      RP.ADC.Enable;
      RP.Reset.Reset_Peripheral (Reset_ADC);
      Assert (RP.ADC.Enabled = False, "ADC still enabled after reset");
   end Test_Reset;

   overriding
   procedure Register_Tests
      (T : in out Reset_Test)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Reset'Access, "Reset");
   end Register_Tests;

   overriding
   function Name
      (T : Reset_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.Reset"));

end Reset_Tests;
