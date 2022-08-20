--
--  Copyright 2022 (C) Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--

package RP.RTC.Delays
   with Preelaborate
is

   procedure Delay_Until
      (This : in out RTC_Device;
       Time : HAL.Real_Time_Clock.RTC_Time;
       Date : HAL.Real_Time_Clock.RTC_Date;
       Mask : RTC_Alarm_Mask);
   --  Mask bits set to False will match any value.

private

   Alarm_Triggered : Boolean with Volatile;

   procedure IRQ_Handler;

end RP.RTC.Delays;
