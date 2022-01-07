--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP.Timer;
with RP.GPIO;
with RP.PWM;

package body RP_Interrupts is

   procedure TIMER_IRQ_2_Handler is
   begin
      RP.Timer.IRQ_Handler (2);
   end TIMER_IRQ_2_Handler;

   procedure PWM_IRQ_WRAP_Handler is
   begin
      RP.PWM.IRQ_Handler (4);
   end PWM_IRQ_WRAP_Handler;

   procedure IO_IRQ_PROC0_Handler is
   begin
      RP.GPIO.IRQ_Handler (13);
   end IO_IRQ_PROC0_Handler;

   procedure Attach_Handler
      (Handler : not null Interrupt_Handler;
       Id      : Interrupt_ID;
       Prio    : Interrupt_Priority)
   is
      pragma Unreferenced (Handler);
      use Cortex_M.NVIC;

      P : constant Cortex_M.NVIC.Interrupt_Priority :=
         Cortex_M.NVIC.Interrupt_Priority (System.Max_Priority - Prio + 1);
   begin
      Clear_Pending (Id);
      Set_Priority (Id, P);
      Enable_Interrupt (Id);
   end Attach_Handler;

end RP_Interrupts;
