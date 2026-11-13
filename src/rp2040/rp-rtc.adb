--
--  Copyright 2021 (C) Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with System;
with HAL; use HAL;
with RP.Clock;
with RP.Reset;

package body RP.RTC is
   use HAL.Real_Time_Clock;

   --  SETUP_0, RTC_1
   type Date_Register is record
      YEAR  : UInt12 := 0;
      MONTH : UInt4 := 0;
      DAY   : UInt5 := 0;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Async_Writers,
           Object_Size => 32;
   for Date_Register use record
      YEAR  at 0 range 12 .. 23;
      MONTH at 0 range 8 .. 11;
      DAY   at 0 range 0 .. 4;
   end record;

   --  SETUP_1, RTC_0
   type Time_Register is record
      DOTW  : UInt3 := 0;
      HOUR  : UInt5 := 0;
      MIN   : UInt6 := 0;
      SEC   : UInt6 := 0;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Async_Writers,
           Object_Size => 32;
   for Time_Register use record
      DOTW  at 0 range 24 .. 26;
      HOUR  at 0 range 16 .. 20;
      MIN   at 0 range 8 .. 13;
      SEC   at 0 range 0 .. 5;
   end record;

   type CTRL_Register is record
      FORCE_NOTLEAPYEAR : Boolean := False;
      LOAD              : Boolean := False;
      RTC_ACTIVE        : Boolean := False;
      RTC_ENABLE        : Boolean := False;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Async_Writers,
           Object_Size => 32;
   for CTRL_Register use record
      FORCE_NOTLEAPYEAR at 0 range 8 .. 8;
      LOAD              at 0 range 4 .. 4;
      RTC_ACTIVE        at 0 range 1 .. 1;
      RTC_ENABLE        at 0 range 0 .. 0;
   end record;

   type IRQ_SETUP_0_Register is record
      MATCH_ACTIVE   : Boolean := False;
      MATCH_ENA      : Boolean := False;
      YEAR_ENA       : Boolean := False;
      MONTH_ENA      : Boolean := False;
      DAY_ENA        : Boolean := False;
      YEAR           : UInt12 := 0;
      MONTH          : UInt4 := 0;
      DAY            : UInt5 := 0;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Async_Writers,
           Object_Size => 32;
   for IRQ_SETUP_0_Register use record
      MATCH_ACTIVE   at 0 range 29 .. 29;
      MATCH_ENA      at 0 range 28 .. 28;
      YEAR_ENA       at 0 range 26 .. 26;
      MONTH_ENA      at 0 range 25 .. 25;
      DAY_ENA        at 0 range 24 .. 24;
      YEAR           at 0 range 12 .. 23;
      MONTH          at 0 range 8 .. 11;
      DAY            at 0 range 0 .. 4;
   end record;

   type IRQ_SETUP_1_Register is record
      DOTW_ENA : Boolean := False;
      HOUR_ENA : Boolean := False;
      MIN_ENA  : Boolean := False;
      SEC_ENA  : Boolean := False;
      DOTW     : UInt3 := 0;
      HOUR     : UInt5 := 0;
      MIN      : UInt6 := 0;
      SEC      : UInt6 := 0;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Object_Size => 32;
   for IRQ_SETUP_1_Register use record
      DOTW_ENA at 0 range 31 .. 31;
      HOUR_ENA at 0 range 30 .. 30;
      MIN_ENA  at 0 range 29 .. 29;
      SEC_ENA  at 0 range 28 .. 28;
      DOTW     at 0 range 24 .. 26;
      HOUR     at 0 range 16 .. 20;
      MIN      at 0 range 8 .. 13;
      SEC      at 0 range 0 .. 5;
   end record;

   type INT_Register is record
      RTC : Boolean := False;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Async_Writers,
           Object_Size => 32;
   for INT_Register use record
      RTC at 0 range 0 .. 0;
   end record;

   type RTC_Peripheral is record
      CLKDIV_M1   : UInt32;
      SETUP_0     : Date_Register;
      SETUP_1     : Time_Register;
      CTRL        : CTRL_Register;
      IRQ_SETUP_0 : IRQ_SETUP_0_Register;
      IRQ_SETUP_1 : IRQ_SETUP_1_Register;
      RTC_1       : Date_Register;
      RTC_0       : Time_Register;
      INTR        : INT_Register;
      INTE        : INT_Register;
      INTF        : INT_Register;
      INTS        : INT_Register;
   end record
      with Volatile;
   for RTC_Peripheral use record
      CLKDIV_M1   at 16#00# range 0 .. 31;
      SETUP_0     at 16#04# range 0 .. 31;
      SETUP_1     at 16#08# range 0 .. 31;
      CTRL        at 16#0C# range 0 .. 31;
      IRQ_SETUP_0 at 16#10# range 0 .. 31;
      IRQ_SETUP_1 at 16#14# range 0 .. 31;
      RTC_1       at 16#18# range 0 .. 31;
      RTC_0       at 16#1C# range 0 .. 31;
      INTR        at 16#20# range 0 .. 31;
      INTE        at 16#24# range 0 .. 31;
      INTF        at 16#28# range 0 .. 31;
      INTS        at 16#2C# range 0 .. 31;
   end record;

   RTC_Periph : RTC_Peripheral
      with Import, Address => System'To_Address (16#4005_C000#);

   procedure Configure
      (This : in out RTC_Device)
   is
      use RP.Reset;
   begin
      RP.Clock.Enable_RTC;
      Reset_Peripheral (Reset_RTC);

      --  RP.Clock.Initialize sets up clk_rtc as 46_875 Hz driven by xosc.
      --  Here we configure the RTC's internal divider to generate a 1 Hz
      --  reference.
      RTC_Periph.CLKDIV_M1 := UInt32 (RP.Clock.Frequency (RP.Clock.RTC) - 1);

      This.Resume;
   end Configure;

   function Running
      (This : RTC_Device)
      return Boolean
   is (RTC_Periph.CTRL.RTC_ACTIVE);

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

   procedure Enable_Alarm
      (This : in out RTC_Device;
       Time : RTC_Time;
       Date : RTC_Date;
       Mask : RTC_Alarm_Mask)
   is
   begin
      RTC_Periph.IRQ_SETUP_0 :=
         (DAY        => UInt5 (Date.Day),
          MONTH      => UInt4 (RTC_Month'Pos (Date.Month) + 1),
          YEAR       => UInt12 (Date.Year),
          DAY_ENA    => Mask.Day,
          MONTH_ENA  => Mask.Month,
          YEAR_ENA   => Mask.Year,
          others     => <>);
      RTC_Periph.IRQ_SETUP_1 :=
         (DOTW       => UInt3 (RTC_Day_Of_Week'Pos (Date.Day_Of_Week)),
          HOUR       => UInt5 (Time.Hour),
          MIN        => UInt6 (Time.Min),
          SEC        => UInt6 (Time.Sec),
          DOTW_ENA   => Mask.Day_Of_Week,
          HOUR_ENA   => Mask.Hour,
          MIN_ENA    => Mask.Min,
          SEC_ENA    => Mask.Sec);
      RTC_Periph.IRQ_SETUP_0.MATCH_ENA := True;
      RTC_Periph.INTE.RTC := True;
   end Enable_Alarm;

   function Alarm
      (This : RTC_Device)
      return Boolean
   is (RTC_Periph.INTS.RTC);

   procedure Disable_Alarm
      (This : in out RTC_Device)
   is
   begin
      RTC_Periph.INTE.RTC := False;
      RTC_Periph.IRQ_SETUP_0.MATCH_ENA := False;
   end Disable_Alarm;

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
         (DAY    => UInt5 (Date.Day),
          MONTH  => UInt4 (RTC_Month'Pos (Date.Month) + 1),
          YEAR   => UInt12 (Date.Year));
      RTC_Periph.SETUP_1 :=
         (DOTW   => UInt3 (RTC_Day_Of_Week'Pos (Date.Day_Of_Week)),
          HOUR   => UInt5 (Time.Hour),
          MIN    => UInt6 (Time.Min),
          SEC    => UInt6 (Time.Sec));
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
      R0 : constant Time_Register := RTC_Periph.RTC_0;
      R1 : constant Date_Register := RTC_Periph.RTC_1;
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
      R0 : constant Time_Register := RTC_Periph.RTC_0;
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
      R0 : constant Time_Register := RTC_Periph.RTC_0;
      R1 : constant Date_Register := RTC_Periph.RTC_1;
   begin
      return (Day         => RTC_Day (R1.DAY),
              Month       => RTC_Month'Val (R1.MONTH - 1),
              Year        => RTC_Year (Integer (R1.YEAR) mod (Integer (RTC_Year'Last) + 1)),
              Day_Of_Week => RTC_Day_Of_Week'Val (R0.DOTW));
   end Get_Date;

end RP.RTC;
