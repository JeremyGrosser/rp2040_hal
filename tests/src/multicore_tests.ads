--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Test_Cases;
with AUnit;

package Multicore_Tests is

   type Multicore_Test is new AUnit.Test_Cases.Test_Case with null record;

   overriding
   procedure Register_Tests
      (T : in out Multicore_Test);

   overriding
   function Name
      (T : Multicore_Test)
      return AUnit.Message_String;

   overriding
   procedure Set_Up
      (T : in out Multicore_Test);

end Multicore_Tests;
