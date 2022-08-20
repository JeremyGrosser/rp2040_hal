--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP2040_SVD.Interrupts;
with RP_Interrupts;

package body RP.PWM.Interrupts is

   procedure Attach_Handler
      (Slice   : PWM_Slice;
       Handler : PWM_Interrupt_Handler)
   is
      use System;
   begin
      Handlers (Slice) := Handler;

      if Handler /= null then
         RP_Interrupts.Attach_Handler
           (Handler => IRQ_Handler'Access,
            Id      => RP2040_SVD.Interrupts.PWM_IRQ_WRAP_Interrupt,
            Prio    => Interrupt_Priority'First);
         Enable_Interrupt (Slice);
      else
         Disable_Interrupt (Slice);
      end if;
   end Attach_Handler;

   procedure IRQ_Handler is
   begin
      for Slice in PWM_Slice'Range loop
         if PWM_Periph.INTS.CH.Arr (Natural (Slice)) and Handlers (Slice) /= null then
            Acknowledge_Interrupt (Slice);
            Handlers (Slice).all;
         end if;
      end loop;
   end IRQ_Handler;

end RP.PWM.Interrupts;
