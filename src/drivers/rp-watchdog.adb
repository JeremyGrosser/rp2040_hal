--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP2040_SVD.WATCHDOG; use RP2040_SVD.WATCHDOG;
with RP2040_SVD.PSM;      use RP2040_SVD.PSM;

package body RP.Watchdog is
   procedure Configure
      (Cycles : Hertz)
   is
   begin
      PSM_Periph.WDSEL.proc := (As_Array => True, Arr => (others => True));
      --  Reset both processors when the watchdog is triggered

      Disable;
      WATCHDOG_Periph.CTRL.TIME := CTRL_TIME_Field (Cycles / 2);
      --  Errata RP2040-E1

      Enable;
   end Configure;

   procedure Enable is
   begin
      Reload;
      WATCHDOG_Periph.CTRL.ENABLE := True;
   end Enable;

   procedure Disable is
   begin
      WATCHDOG_Periph.CTRL.ENABLE := False;
   end Disable;

   procedure Reload is
   begin
      WATCHDOG_Periph.LOAD.LOAD := LOAD_LOAD_Field'Last;
   end Reload;

   procedure Trigger is
   begin
      WATCHDOG_Periph.CTRL.TRIGGER := True;
   end Trigger;
end RP.Watchdog;
