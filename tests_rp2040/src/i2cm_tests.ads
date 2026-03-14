--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Test_Cases;
with AUnit;

package I2CM_Tests is

   type I2CM_Test is new AUnit.Test_Cases.Test_Case with null record;

   overriding
   procedure Register_Tests
      (T : in out I2CM_Test);

   overriding
   function Name
      (T : I2CM_Test)
      return AUnit.Message_String;

   overriding
   procedure Set_Up
      (T : in out I2CM_Test);

   procedure Test_Master_Transmit
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Master_Receive
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Mem_Write
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Mem_Read_8
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Mem_Read_16
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_High_Speed
      (T : in out AUnit.Test_Cases.Test_Case'Class);

end I2CM_Tests;
