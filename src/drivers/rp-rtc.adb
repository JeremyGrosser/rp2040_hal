--
--  Copyright 2021 (C) Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP2040_SVD.CLOCKS; use RP2040_SVD.CLOCKS;
with RP2040_SVD.RTC; use RP2040_SVD.RTC;
with RP2040_SVD.Interrupts;
with Cortex_M.Hints;
with HAL; use HAL;
with RP.Clock;
with RP.Reset;
with System;

package body RP.RTC is
   use HAL.Real_Time_Clock;

   procedure Configure
      (This : in out RTC_Device)
   is
      use RP.Reset;
   begin
      RP.Clock.Enable (RP.Clock.RTC);
      Reset_Peripheral (Reset_RTC);

      --  RP.Clock.Initialize sets up clk_rtc as 46_875 Hz driven by xosc.
      --  Here we configure the RTC's internal divider to generate a 1 Hz
      --  reference.
      RTC_Periph.CLKDIV_M1.CLKDIV_M1 := CLKDIV_M1_CLKDIV_M1_Field
         (RP.Clock.Frequency (RP.Clock.RTC) - 1);

      RP_Interrupts.Attach_Handler
         (Handler => IRQ_Handler'Access,
          Id      => RP2040_SVD.Interrupts.RTC_Interrupt,
          Prio    => System.Interrupt_Priority'First);

      This.Resume;
   end Configure;

   function Running
      (This : RTC_Device)
      return Boolean
   is (RP.Clock.Enabled (RP.Clock.RTC) and RTC_Periph.CTRL.RTC_ACTIVE);

   procedure Pause
      (This : in out RTC_Device)
   is
   begin
      RTC_Periph.CTRL.RTC_ENABLE := False;
      while This.Running loop
         null;
      end loop;
   end Pause;

   procedure Resume
      (This : in out RTC_Device)
   is
   begin
      RTC_Periph.CTRL.RTC_ENABLE := True;
      while not This.Running loop
         null;
      end loop;
   end Resume;

   procedure Set_Alarm
      (This : in out RTC_Device;
       Time : RTC_Time;
       Date : RTC_Date;
       Mask : RTC_Alarm_Mask)
   is
   begin
      RTC_Periph.IRQ_SETUP_0 :=
         (DAY        => IRQ_SETUP_0_DAY_Field (Date.Day),
          MONTH      => IRQ_SETUP_0_MONTH_Field (RTC_Month'Pos (Date.Month) + 1),
          YEAR       => IRQ_SETUP_0_YEAR_Field (Date.Year),
          DAY_ENA    => Mask.Day,
          MONTH_ENA  => Mask.Month,
          YEAR_ENA   => Mask.Year,
          others     => <>);
      RTC_Periph.IRQ_SETUP_1 :=
         (DOTW       => IRQ_SETUP_1_DOTW_Field (RTC_Day_Of_Week'Pos (Date.Day_Of_Week)),
          HOUR       => IRQ_SETUP_1_HOUR_Field (Time.Hour),
          MIN        => IRQ_SETUP_1_MIN_Field (Time.Min),
          SEC        => IRQ_SETUP_1_SEC_Field (Time.Sec),
          DOTW_ENA   => Mask.Day_Of_Week,
          HOUR_ENA   => Mask.Hour,
          MIN_ENA    => Mask.Min,
          SEC_ENA    => Mask.Sec,
          others     => <>);
      RTC_Periph.IRQ_SETUP_0.MATCH_ENA := True;
      RTC_Periph.INTE.RTC := True;
   end Set_Alarm;

   procedure Disable_Alarm
      (This : in out RTC_Device)
   is
   begin
      RTC_Periph.INTE.RTC := False;
      RTC_Periph.IRQ_SETUP_0.MATCH_ENA := False;
   end Disable_Alarm;

   procedure Delay_Until
      (This : in out RTC_Device;
       Time : RTC_Time;
       Date : RTC_Date;
       Mask : RTC_Alarm_Mask)
   is
   begin
      This.Set_Alarm (Time, Date, Mask);
      while not RTC_Periph.INTR.RTC loop
         Cortex_M.Hints.Wait_For_Interrupt;
      end loop;
      This.Disable_Alarm;
   end Delay_Until;

   overriding
   procedure Set
      (This : in out RTC_Device;
       Time : RTC_Time;
       Date : RTC_Date)
   is
      Was_Running : constant Boolean := This.Running;
   begin
      if Was_Running then
         This.Pause;
      end if;

      RTC_Periph.SETUP_0 :=
         (DAY    => SETUP_0_DAY_Field (Date.Day),
          MONTH  => SETUP_0_MONTH_Field (RTC_Month'Pos (Date.Month) + 1),
          YEAR   => SETUP_0_YEAR_Field (Date.Year),
          others => <>);
      RTC_Periph.SETUP_1 :=
         (DOTW   => SETUP_1_DOTW_Field (RTC_Day_Of_Week'Pos (Date.Day_Of_Week)),
          HOUR   => SETUP_1_HOUR_Field (Time.Hour),
          MIN    => SETUP_1_MIN_Field (Time.Min),
          SEC    => SETUP_1_SEC_Field (Time.Sec),
          others => <>);
      RTC_Periph.CTRL.LOAD := True;

      if Was_Running then
         This.Resume;
      end if;
   end Set;

   overriding
   procedure Get
      (This : in out RTC_Device;
       Time : out RTC_Time;
       Date : out RTC_Date)
   is
      --  RTC_1 is latched when RTC_0 is read, so RTC_0 must be read first
      R0 : constant RTC_0_Register := RTC_Periph.RTC_0;
      R1 : constant RTC_1_Register := RTC_Periph.RTC_1;
   begin
      Date :=
         (Day         => RTC_Day (R1.DAY),
          --  Hardware months are 1 based, HAL months are an enum and enum
          --  positions are zero based.
          Month       => RTC_Month'Val (R1.MONTH - 1),
          --  The hardware year is in range 0 .. 4095 but the HAL represents
          --  year 0 .. 99, so we assume it wraps around.
          Year        => RTC_Year (Integer (R1.YEAR) mod (Integer (RTC_Year'Last) + 1)),
          Day_Of_Week => RTC_Day_Of_Week'Val (R0.DOTW));
      Time :=
         (Hour => RTC_Hour (R0.HOUR),
          Min  => RTC_Minute (R0.MIN),
          Sec  => RTC_Second (R0.SEC));
   end Get;

   overriding
   function Get_Time
      (This : RTC_Device)
      return HAL.Real_Time_Clock.RTC_Time
   is
      R0 : constant RTC_0_Register := RTC_Periph.RTC_0;
   begin
      return (Hour => RTC_Hour (R0.HOUR),
              Min  => RTC_Minute (R0.MIN),
              Sec  => RTC_Second (R0.SEC));
   end Get_Time;

   overriding
   function Get_Date
      (This : RTC_Device)
      return HAL.Real_Time_Clock.RTC_Date
   is
      R0 : constant RTC_0_Register := RTC_Periph.RTC_0;
      R1 : constant RTC_1_Register := RTC_Periph.RTC_1;
   begin
      return (Day         => RTC_Day (R1.DAY),
              Month       => RTC_Month'Val (R1.MONTH - 1),
              Year        => RTC_Year (Integer (R1.YEAR) mod (Integer (RTC_Year'Last) + 1)),
              Day_Of_Week => RTC_Day_Of_Week'Val (R0.DOTW));
   end Get_Date;

   procedure IRQ_Handler is
   begin
      RTC_Periph.INTE.RTC := False;
   end IRQ_Handler;

end RP.RTC;
