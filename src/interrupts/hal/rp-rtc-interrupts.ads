--
--  Copyright 2021 (C) Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--

package RP.RTC.Interrupts
   with Preelaborate
is

   type RTC_Interrupt_Handler is access procedure;

   procedure Attach
     (Handler : RTC_Interrupt_Handler := null);

   procedure IRQ_Handler;

private

   Installed_Handler : RTC_Interrupt_Handler := null;

end RP.RTC.Interrupts;
