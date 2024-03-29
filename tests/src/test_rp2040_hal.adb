--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Reporter.Text;
with AUnit.Run;
with Ada.Text_IO;
with Test_Suite;

procedure Test_Rp2040_Hal is
   procedure Run is new AUnit.Run.Test_Runner (Test_Suite.Suite);
   Reporter : AUnit.Reporter.Text.Text_Reporter;
begin
   Ada.Text_IO.Put_Line ("Testing...");
   Run (Reporter);
end Test_Rp2040_Hal;
