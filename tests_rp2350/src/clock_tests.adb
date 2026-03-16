--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Assertions;
with RP.Clock;
with RP;

package body Clock_Tests is

   procedure Test_Enable
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use AUnit.Assertions;
   begin
      RP.Clock.Enable_PERI;
      Assert (RP.Clock.Frequency (RP.Clock.PERI) = 150_000_000,
         "clk_peri is not running at 150 MHz");
      RP.Clock.Enable_ADC;
      Assert (RP.Clock.Frequency (RP.Clock.ADC) = 48_000_000,
         "clk_adc is not running at 48 MHz");
   end Test_Enable;

   procedure Test_Counter
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use AUnit.Assertions;
   begin
      Assert (RP.Clock.Frequency (RP.Clock.SYS) = 150_000_000, "Unexpected clk_sys value");
      Assert (RP.Clock.Frequency
         (RP.Clock.SYS,
          Rounded  => False,
          Accuracy => 15)
          in (150_000_000 - 64) .. (150_000_000 + 64),
          "Fractional clk_sys out of range");
      Assert (RP.Clock.Frequency
         (RP.Clock.SYS,
          Rounded => False,
          Accuracy => 5)
          in (150_000_000 - 65535) .. (150_000_000 + 65535),
          "Low accuracy clk_sys out of range");
   end Test_Counter;

   overriding
   procedure Register_Tests
      (T : in out Clock_Test)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Enable'Access, "Enable");
      Register_Routine (T, Test_Counter'Access, "Counter");
   end Register_Tests;

   overriding
   function Name
      (T : Clock_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.Clock"));

end Clock_Tests;
