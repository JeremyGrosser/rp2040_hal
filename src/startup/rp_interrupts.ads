--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with Cortex_M.NVIC;
with System;

package RP_Interrupts is

   --  This is a minimal version of the System.BB.Interrupts interface
   --  available in Ravenscar. Close enough that these packages can be used
   --  interchangably for the purposes of the RP drivers.
   subtype Interrupt_ID       is Cortex_M.NVIC.Interrupt_ID;
   subtype Interrupt_Priority is System.Interrupt_Priority;
   type Interrupt_Handler     is access procedure (Id : Interrupt_ID);

   --  The Handler argument is ignored. The drivers only use three interrupts
   --  right now, it's not worth setting up a lookup table yet.
   procedure Attach_Handler
      (Handler : not null Interrupt_Handler;
       Id      : Interrupt_ID;
       Prio    : Interrupt_Priority)
   with Inline;

private

   --  These procedures are just calls into the appropriate drivers'
   --  IRQ_Handler procedures. We proxy these handlers here so that we can use
   --  a different implementation on Ravenscar runtimes.

   procedure TIMER_IRQ_2_Handler
      with Export,
           Convention => C,
           External_Name => "isr_irq2";

   procedure PWM_IRQ_WRAP_Handler
      with Export,
           Convention => C,
           External_Name => "isr_irq4";

   procedure IO_IRQ_PROC0_Handler
      with Export,
           Convention => C,
           External_Name => "isr_irq13";

end RP_Interrupts;
