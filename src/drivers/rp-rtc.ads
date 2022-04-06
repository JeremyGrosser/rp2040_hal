--
--  Copyright 2021 (C) Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP_Interrupts;
with HAL.Real_Time_Clock;

package RP.RTC is

   type RTC_Device is new HAL.Real_Time_Clock.RTC_Device with null record;

   --  Configure the RTC and start it.
   --  If the RTC is already running, this procedure resets the time to zero.
   procedure Configure
      (This : in out RTC_Device);

   function Running
      (This : RTC_Device)
      return Boolean;

   procedure Pause
      (This : in out RTC_Device);

   procedure Resume
      (This : in out RTC_Device);

   procedure Delay_Until
      (This : in out RTC_Device;
       Time : HAL.Real_Time_Clock.RTC_Time;
       Date : HAL.Real_Time_Clock.RTC_Date);

   overriding
   procedure Set
      (This : in out RTC_Device;
       Time : HAL.Real_Time_Clock.RTC_Time;
       Date : HAL.Real_Time_Clock.RTC_Date);

   overriding
   procedure Get
      (This : in out RTC_Device;
       Time : out HAL.Real_Time_Clock.RTC_Time;
       Date : out HAL.Real_Time_Clock.RTC_Date);

   overriding
   function Get_Time
      (This : RTC_Device)
      return HAL.Real_Time_Clock.RTC_Time;

   overriding
   function Get_Date
      (This : RTC_Device)
      return HAL.Real_Time_Clock.RTC_Date;

   procedure IRQ_Handler
      (Id : RP_Interrupts.Interrupt_ID);

end RP.RTC;
