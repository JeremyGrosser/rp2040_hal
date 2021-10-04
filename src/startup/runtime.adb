package body Runtime is
   procedure OS_Exit
      (Status : Integer)
   is
      pragma Unreferenced (Status);
   begin
      null;
   end OS_Exit;

   procedure HardFault_Handler is
   begin
      loop
         null;
      end loop;
   end HardFault_Handler;
end Runtime;
