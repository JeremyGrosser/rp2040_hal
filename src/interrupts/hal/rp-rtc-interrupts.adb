--
--  Copyright 2021 (C) Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP2040_SVD.Interrupts;
with RP2040_SVD.RTC; use RP2040_SVD.RTC;
with RP_Interrupts;
with System;

package body RP.RTC.Interrupts
   with Preelaborate
is

   procedure Attach
     (Handler : RTC_Interrupt_Handler := null)
   is
   begin
      Installed_Handler := Handler;

      RP_Interrupts.Attach_Handler
         (Handler => IRQ_Handler'Access,
         Id      => RP2040_SVD.Interrupts.RTC_Interrupt,
         Prio    => System.Interrupt_Priority'First);
   end Attach;

   procedure IRQ_Handler
   is
   begin
      Disable_Interrupt;
      if Installed_Handler /= null then
         Installed_Handler.all;
      end if;
   end IRQ_Handler;

end RP.RTC.Interrupts;
