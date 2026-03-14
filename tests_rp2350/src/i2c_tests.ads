--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Test_Cases;
with AUnit;
with RP.GPIO;

package I2C_Tests is

   type I2C_Test is new AUnit.Test_Cases.Test_Case with null record;

   overriding
   procedure Register_Tests
      (T : in out I2C_Test);

   overriding
   function Name
      (T : I2C_Test)
      return AUnit.Message_String;

   overriding
   procedure Set_Up
      (T : in out I2C_Test);

   procedure Test_Single
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Multiple
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Repeated_Start
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Long_Transfer
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Timing
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_10b_Address
      (T : in out AUnit.Test_Cases.Test_Case'Class);

private

   function Is_Jumper_Present
      (A, B : not null access RP.GPIO.GPIO_Point)
      return Boolean;

   function Check_Pullup
      (A : not null access RP.GPIO.GPIO_Point)
      return Boolean;

   function Check_Wiring
      return Boolean;

end I2C_Tests;
