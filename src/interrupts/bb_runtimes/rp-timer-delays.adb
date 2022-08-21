--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP2040_SVD.TIMER;     use RP2040_SVD.TIMER;
with Ada.Interrupts.Names; use Ada.Interrupts.Names;

package body RP.Timer.Delays is

   --------------------------
   -- Alarm_Handler (spec) --
   --------------------------

   protected Alarm_Handler is

      entry Wait_For_Alarm;

   private

      procedure IRQ_Handler
        with Attach_Handler => TIMER_IRQ_2_Interrupt_CPU_1;

      Alarm_Triggered : Boolean := False;

   end Alarm_Handler;

   --------------------------
   -- Alarm_Handler (body) --
   --------------------------

   protected body Alarm_Handler is

      entry Wait_For_Alarm
         when Alarm_Triggered
      is
      begin
         Alarm_Triggered := False;
      end Wait_For_Alarm;

      procedure IRQ_Handler is
      begin
         TIMER_Periph.INTR.ALARM_2 := True;
         Alarm_Triggered           := True;
      end IRQ_Handler;

   end Alarm_Handler;

   ------------
   -- Enable --
   ------------

   procedure Enable
      (This : in out Delays)
   is
   begin
      TIMER_Periph.INTE.ALARM_2 := True;
   end Enable;

   -------------
   -- Disable --
   -------------

   procedure Disable
      (This : in out Delays)
   is
   begin
      TIMER_Periph.INTE.ALARM_2 := False;
   end Disable;

   -------------
   -- Enabled --
   -------------

   function Enabled
      (This : Delays)
      return Boolean
   is (TIMER_Periph.INTE.ALARM_2);

   -----------------
   -- Delay_Until --
   -----------------

   procedure Delay_Until
      (This : in out Delays;
       T    : Time)
   is
   begin
      if T <= Clock then
         return;
      end if;
      TIMER_Periph.ALARM2 := UInt32 (T and 16#FFFFFFFF#);
      loop
         Alarm_Handler.Wait_For_Alarm;
         if Clock >= T then
            return;
         elsif TIMER_Periph.INTS.ALARM_2 then
            --  If the high byte of the timer rolled over but we still haven't
            --  reached the target time, reset the alarm and go again
            TIMER_Periph.ALARM2 := UInt32 (T and 16#FFFFFFFF#);
         end if;
      end loop;
   end Delay_Until;

   ------------------------
   -- Delay_Microseconds --
   ------------------------

   overriding
   procedure Delay_Microseconds
      (This : in out Delays;
       Us   : Integer)
   is
      Deadline : constant UInt64 := UInt64 (Clock) + UInt64 (Us);
   begin
      if Us > 0 then
         while UInt64 (Clock) < Deadline loop
            null;
         end loop;
      end if;
   end Delay_Microseconds;

   ------------------------
   -- Delay_Milliseconds --
   ------------------------

   overriding
   procedure Delay_Milliseconds
      (This : in out Delays;
       Ms   : Integer)
   is
   begin
      Delay_Until (This, Clock + (1_000 * Time (Ms)));
   end Delay_Milliseconds;

   -------------------
   -- Delay_Seconds --
   -------------------

   overriding
   procedure Delay_Seconds
      (This : in out Delays;
       S    : Integer)
   is
   begin
      Delay_Until (This, Clock + (1_000_000 * Time (S)));
   end Delay_Seconds;
end RP.Timer.Delays;
