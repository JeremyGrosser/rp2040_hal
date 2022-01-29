with AUnit.Assertions;
with RP.Clock;
with RP;

package body Clock_Tests is

   procedure Test_Initialize
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use AUnit.Assertions;
      use RP;
      Nominal : constant Hertz := 125_000_000;
      Margin  : constant Hertz := 63; --  The frequency counter is only accurate to +/- 62.5 Hz
      Minimum : constant Hertz := Nominal - Margin;
      Maximum : constant Hertz := Nominal + Margin;
      F       : Hertz;
   begin
      RP.Clock.Initialize (12_000_000);
      F := RP.Clock.Frequency (RP.Clock.SYS);
      Assert (F in Minimum .. Maximum, "clk_sys is not in expected range : " & F'Image);
   end Test_Initialize;

   procedure Test_Enable
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use AUnit.Assertions;
   begin
      RP.Clock.Disable (RP.Clock.PERI);

      Assert (not RP.Clock.Enabled (RP.Clock.PERI),
         "clk_peri should not be enabled");

      RP.Clock.Enable (RP.Clock.PERI);

      Assert (RP.Clock.Enabled (RP.Clock.PERI),
         "Unable to enable clk_peri");
      Assert (RP.Clock.Frequency (RP.Clock.PERI) = 125_000_000,
         "clk_peri is not running at 125 MHz");

      RP.Clock.Disable (RP.Clock.PERI);

      Assert (not RP.Clock.Enabled (RP.Clock.PERI),
         "Unable to disable clk_peri");
   end Test_Enable;

   overriding
   procedure Register_Tests
      (T : in out Clock_Test)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Initialize'Access, "Initialize");
      Register_Routine (T, Test_Enable'Access, "Enable");
   end Register_Tests;

   overriding
   function Name
      (T : Clock_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.Clock"));

end Clock_Tests;
