--
--  Copyright 2022 (C) Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP.RTC.Interrupts;
with Cortex_M.Hints;

package body RP.RTC.Delays
is

   procedure Delay_Until
      (This : in out RTC_Device;
       Time : HAL.Real_Time_Clock.RTC_Time;
       Date : HAL.Real_Time_Clock.RTC_Date;
       Mask : RTC_Alarm_Mask)
   is
   begin
      Alarm_Triggered := False;

      RP.RTC.Interrupts.Attach_Handler (IRQ_Handler'Access);
      This.Set_Alarm (Time, Date, Mask);

      while not Alarm_Triggered loop
         Cortex_M.Hints.Wait_For_Interrupt;
      end loop;

      This.Disable_Alarm;
      RP.RTC.Interrupts.Attach_Handler (null);
   end Delay_Until;

   procedure IRQ_Handler
   is
   begin
      Alarm_Triggered := True;
   end IRQ_Handler;

end RP.RTC.Delays;
