--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with System.Machine_Code; use System.Machine_Code;
with HAL; use HAL;

package body RP_Interrupts is

   Handlers : array (Interrupt_ID) of Interrupt_Handler := (others => null);

   procedure Attach_Handler
      (Handler : not null Interrupt_Handler;
       Id      : Interrupt_ID;
       Prio    : Interrupt_Priority)
   is
      use Cortex_M.NVIC;
      P : constant Cortex_M.NVIC.Interrupt_Priority :=
         Cortex_M.NVIC.Interrupt_Priority (System.Max_Priority - Prio + 1);
   begin
      Handlers (Id) := Handler;
      Clear_Pending (Id);
      Set_Priority (Id, P);
      Enable_Interrupt (Id);
   end Attach_Handler;

   procedure Interrupt_Request_Handler
   is
      IPSR : UInt32;
      Id   : Interrupt_ID;
   begin
      Asm ("mrs %0, ipsr", UInt32'Asm_Output ("=r", IPSR), Volatile => True);
      Id := Interrupt_ID (IPSR - 16);

      if Handlers (Id) /= null then
         Handlers (Id).all;
      else
         raise Program_Error with "Unhandled IRQ " & Id'Image;
      end if;
   end Interrupt_Request_Handler;

end RP_Interrupts;
