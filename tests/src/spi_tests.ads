--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Test_Cases;
with AUnit;

package SPI_Tests is

   type SPI_Test is new AUnit.Test_Cases.Test_Case with null record;

   overriding
   procedure Register_Tests
      (T : in out SPI_Test);

   overriding
   function Name
      (T : SPI_Test)
      return AUnit.Message_String;

   procedure Test_Configure
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Transfer
      (T : in out AUnit.Test_Cases.Test_Case'Class);

end SPI_Tests;
