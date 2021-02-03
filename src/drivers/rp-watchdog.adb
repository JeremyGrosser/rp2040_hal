with RP2040_SVD.WATCHDOG; use RP2040_SVD.WATCHDOG;

package body RP.Watchdog is
   procedure Configure (Cycles : Hertz) is
   begin
      --  clk_tick runs at clk_ref / 1_000_000
      WATCHDOG_Periph.TICK :=
         (CYCLES => TICK_CYCLES_Field (Cycles / 1_000_000),
          ENABLE => True,
          others => <>);
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
end RP.Watchdog;
