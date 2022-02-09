--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Test_Cases;
with AUnit;

package PIO_Tests is

   type PIO_Test is new AUnit.Test_Cases.Test_Case with null record;

   overriding
   procedure Register_Tests
      (T : in out PIO_Test);

   overriding
   function Name
      (T : PIO_Test)
      return AUnit.Message_String;

   procedure Test_DMA_Trigger_Lookup
      (T : in out AUnit.Test_Cases.Test_Case'Class);

end PIO_Tests;
