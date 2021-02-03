with RP.ROM;
pragma Unreferenced (RP.ROM);

package Runtime is
   --  crt0.S expects this symbol to exist. It is called after main returns.
   procedure OS_Exit (Status : Integer)
      with Export        => True,
           Convention    => C,
           External_Name => "exit";

   procedure HardFault_Handler
      with Export         => True,
           Convention     => C,
           External_Name  => "isr_hardfault";
end Runtime;
