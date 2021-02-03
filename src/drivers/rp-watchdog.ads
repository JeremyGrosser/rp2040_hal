package RP.Watchdog is
   --  Watchdog is clocked by clk_ref
   procedure Configure
      (Cycles : Hertz);
   procedure Enable;
   procedure Disable;
   procedure Reload;
end RP.Watchdog;
