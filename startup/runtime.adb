with System.Machine_Code;

package body Runtime is
   procedure Wait_For_Interrupt is
   begin
      System.Machine_Code.Asm ("wfi", Volatile => True);
   end Wait_For_Interrupt;

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
