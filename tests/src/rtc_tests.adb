--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Assertions;
with HAL.Real_Time_Clock;
with RP.Timer;
with RP.RTC;
with RP.RTC.Delays;

package body RTC_Tests is

   RTC : RP.RTC.RTC_Device;

   procedure Test_Configure
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use AUnit.Assertions;
   begin
      RTC.Configure;
      Assert (RTC.Running, "not running after configure");
   end Test_Configure;

   procedure Test_Pause_Resume
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use AUnit.Assertions;
   begin
      RTC.Configure;
      Assert (RTC.Running, "not running after configure");
      RTC.Pause;
      Assert (not RTC.Running, "running after pause");
      RTC.Resume;
      Assert (RTC.Running, "not running after resume");
   end Test_Pause_Resume;

   procedure Test_Time_Date
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      --  clk_rtc is much slower than clk_sys, so they use latched registers.
      --  This means that writes to the RTC registers may take a few cycles to
      --  take effect. This test very carefully counts these delays to ensure
      --  that we get the expected values back.
      use AUnit.Assertions;
      use HAL.Real_Time_Clock;
      use RP.Timer;
      Timer : RP.Timer.Delays;
      RT    : RTC_Time;
      RD    : RTC_Date;
   begin
      if not RTC.Running then
         RTC.Configure;
      end if;
      Assert (RTC.Running, "RTC not running");
      RTC.Set
         (Time => (Hour => 23, Min => 59, Sec => 56),
          Date => (Year => 99, Month => December, Day => 31, Day_Of_Week => Friday));
      --  Wait 1 second for the RTC to latch the new time into its registers.
      Timer.Delay_Microseconds (Ticks_Per_Second);
      --  Sec = 57
      RT := RTC.Get_Time;
      --  Another second passes while we wait for the read to sync (Sec = 58)
      Assert (RT = (Hour => 23, Min => 59, Sec => 58), "Time readback incorrect");
      RD := RTC.Get_Date;
      Assert (RD = (Year => 99, Month => December, Day => 31, Day_Of_Week => Friday), "Date readback incorrect");
      Timer.Delay_Microseconds (2 * Ticks_Per_Second);
      RT := RTC.Get_Time;
      --  Sec = 0
      Assert (RT = (Hour => 0, Min => 0, Sec => 0), "Time did not count up");
      RD := RTC.Get_Date;
      Assert (RD = (Year => 0, Month => January, Day => 1, Day_Of_Week => Saturday), "Date did not count up");

      RTC.Get (RT, RD);
      Assert (RT = (Hour => 0, Min => 0, Sec => 0), "Get returned incorrect time");
      Assert (RD = (Year => 0, Month => January, Day => 1, Day_Of_Week => Saturday), "Get returned incorrect date");

      RTC.Pause;
      RTC.Set
         (Time => (Hour => 23, Min => 59, Sec => 59),
          Date => (Year => 99, Month => December, Day => 31, Day_Of_Week => Friday));
      Timer.Delay_Microseconds (Ticks_Per_Second);
      RTC.Get (RT, RD);
      Assert (RT = (Hour => 23, Min => 59, Sec => 59),
         "Set while Paused readback time failed");
      Assert (RD = (Year => 99, Month => December, Day => 31, Day_Of_Week => Friday),
         "Set while Paused readback date failed");
      RTC.Resume;
   end Test_Time_Date;

   procedure Test_Delay
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use AUnit.Assertions;
      use HAL.Real_Time_Clock;
      use RP.Timer;
      Start, Elapsed, Target : RP.Timer.Time;
      Date : constant RTC_Date := (Month => January, Day => 1, Year => 1, Day_Of_Week => Monday);
      Time : RTC_Time := (Hour => 12, Min => 5, Sec => 0);
   begin
      if not RTC.Running then
         RTC.Configure;
      end if;
      RTC.Set (Time, Date);
      Time.Sec := Time.Sec + 2;
      Start := RP.Timer.Clock;
      RP.RTC.Delays.Delay_Until (RTC, Time, Date, Mask => (Sec => True, others => False));
      Elapsed := RP.Timer.Clock - Start;
      Target := Ticks_Per_Second * 1; --  RTC.Set takes 1 second to sync, so the actual delay is (2 - 1) seconds.
      Assert (Elapsed in (Target - (Ticks_Per_Second / 10)) .. (Target + (Ticks_Per_Second / 10)),
         "delay not within 100ms range of target");
   end Test_Delay;

   overriding
   procedure Register_Tests
      (T : in out RTC_Test)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Configure'Access, "Configure");
      Register_Routine (T, Test_Pause_Resume'Access, "Pause_Resume");
      Register_Routine (T, Test_Time_Date'Access, "Time_Date");
      Register_Routine (T, Test_Delay'Access, "Delay");
   end Register_Tests;

   overriding
   function Name
      (T : RTC_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.RTC"));

end RTC_Tests;
