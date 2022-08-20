--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--

package RP.PWM.Interrupts
   with Preelaborate
is

   type PWM_Interrupt_Handler is access procedure;

   procedure Attach
      (Slice   : PWM_Slice;
       Handler : PWM_Interrupt_Handler)
   with Pre => Initialized;

   --  This handler should be called in response to PWM_IRQ_WRAP (IRQ 4)
   procedure IRQ_Handler;

private

   Handlers : array (PWM_Slice) of PWM_Interrupt_Handler;

end RP.PWM.Interrupts;
