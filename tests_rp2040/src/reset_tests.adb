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

   procedure Test_Timeout
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use RP.Reset;
      Status : Reset_Status;
   begin
      RP.ADC.Enable;
      Reset_Peripheral (Reset_ADC, Status, Timeout => 0);
      Assert (Status = Reset_Ok, "Reset timed out with timeout = 0");
      Assert (RP.ADC.Enabled = False, "ADC still enabled after reset");

      RP.ADC.Enable;
      Reset_Peripheral (Reset_ADC, Status, Timeout => 1);
      Assert (Status = Reset_Ok, "Reset timed out with timeout = 1");
      Assert (RP.ADC.Enabled = False, "ADC still enabled after reset with timeout");
   end Test_Timeout;

   overriding
   procedure Register_Tests
      (T : in out Reset_Test)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Timeout'Access, "Timeout");
   end Register_Tests;

   overriding
   function Name
      (T : Reset_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.Reset"));

end Reset_Tests;
