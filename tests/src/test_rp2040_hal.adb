with AUnit.Reporter.Text;
with AUnit.Run;
with Test_Suite;

procedure Test_Rp2040_Hal is
   procedure Run is new AUnit.Run.Test_Runner (Test_Suite.Suite);
   Reporter : AUnit.Reporter.Text.Text_Reporter;
begin
   Run (Reporter);
   loop
      null;
   end loop;
end Test_Rp2040_Hal;
