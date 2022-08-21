--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Assertions;
with HAL.Real_Time_Clock;
with RP.Timer.Interrupts;
with RP.Timer;
with RP.RTC;

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
      use RP.Timer.Interrupts;
      use RP.Timer;
      Timer : RP.Timer.Interrupts.Delays;
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

   procedure Test_Alarm
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use AUnit.Assertions;
      use HAL.Real_Time_Clock;
      use RP.Timer;
      RT  : RTC_Time;
      RD  : RTC_Date;
      Now     : Time;
      Elapsed : Time;
   begin
      if not RTC.Running then
         RTC.Configure;
      end if;

      RTC.Get (Time => RT, Date => RD);
      RT.Sec := RT.Sec + 3;
      Now := Clock;

      RTC.Enable_Alarm
         (Time => RT,
          Date => RD,
          Mask => (Sec => True, others => False));
      Assert (not RTC.Alarm, "Alarm fired immediately");

      while not RTC.Alarm loop
         null;
      end loop;

      RTC.Disable_Alarm;
      Assert (not RTC.Alarm, "Disable_Alarm didn't");

      --  Each RTC operation takes 1 second to synchronize, so the elapsed time
      --  between Enable_Alarm and RTC.Alarm = True is not entirely accurate.
      Elapsed := Clock - Now;
      Assert (Elapsed in Ticks_Per_Second * 1 .. Ticks_Per_Second * 4, "RTC alarm did not fire at the right time");
   end Test_Alarm;

   overriding
   procedure Register_Tests
      (T : in out RTC_Test)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Configure'Access, "Configure");
      Register_Routine (T, Test_Pause_Resume'Access, "Pause_Resume");
      Register_Routine (T, Test_Time_Date'Access, "Time_Date");
      Register_Routine (T, Test_Alarm'Access, "Alarm");
   end Register_Tests;

   overriding
   function Name
      (T : RTC_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.RTC"));

end RTC_Tests;
