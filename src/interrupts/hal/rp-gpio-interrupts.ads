--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--

package RP.GPIO.Interrupts
   with Preelaborate
is

   type Interrupt_Procedure is access procedure
      (Pin     : GPIO_Pin;
       Trigger : Interrupt_Triggers);

   procedure Attach_Handler
      (This    : GPIO_Point;
       Handler : Interrupt_Procedure);

   --  This handler should be called in response to IO_IRQ_PROC0 (IRQ 13). This
   --  call is made by the handler defined in src/startup/rp_interrupts.adb.
   procedure IRQ_Handler;

private

   GPIO_Interrupt_Handlers : array (GPIO_Pin) of Interrupt_Procedure := (others => null);

end RP.GPIO.Interrupts;
