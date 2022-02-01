--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Test_Suites;

package Test_Suite is
   function Suite
      return AUnit.Test_Suites.Access_Test_Suite;
end Test_Suite;
