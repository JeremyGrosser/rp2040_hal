--
--  Copyright 2022 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--

with RP2040_SVD.SIO;        use RP2040_SVD.SIO;
with RP2040_SVD.Interrupts; use RP2040_SVD.Interrupts;
with HAL;                   use HAL;
with RP_Interrupts;
with System;

package body RP.GPIO.Interrupts is

   procedure Attach_Handler
      (This    : GPIO_Point;
       Handler : Interrupt_Procedure)
   is
   begin
      if Handler /= null then
         RP_Interrupts.Attach_Handler
            (Handler => IRQ_Handler'Access,
            Id      => IO_IRQ_BANK0_Interrupt,
            Prio    => System.Interrupt_Priority'First);
      end if;

      GPIO_Interrupt_Handlers (This.Pin) := Handler;
   end Attach_Handler;

   procedure IRQ_Handler
   is
      Handler : Interrupt_Procedure;
      T       : UInt4;
   begin
      for Pin in IO_BANK_Periph.PROC0_INTS'Range loop
         if IO_BANK_Periph.PROC0_INTS (Pin) /= 0 then
            for Trigger in Interrupt_Triggers'Range loop
               T := IO_BANK_Periph.PROC0_INTS (Pin) and Interrupt_Triggers'Enum_Rep (Trigger);
               if T /= 0 then
                  Acknowledge_Interrupt (Pin, Trigger);
                  Handler := GPIO_Interrupt_Handlers (Pin);
                  if Handler /= null then
                     Handler.all (Pin, Trigger);
                  end if;
               end if;
            end loop;
         end if;
      end loop;
   end IRQ_Handler;

end RP.GPIO.Interrupts;
