--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with HAL; use HAL;
with HAL.Time;

package RP.SysTick is

   type Time is new UInt64;

   function Ticks_Per_Second
      return Time;

   function Clock
      return Time;

   function Milliseconds
      (T : Natural)
      return Time;

   type Delays is new HAL.Time.Delays with null record;

   procedure Enable
      (This : in out Delays);

   procedure Disable
      (This : in out Delays);

   function Enabled
      (This : in out Delays)
      return Boolean;

   overriding
   procedure Delay_Microseconds
      (This : in out Delays;
       Us   : Integer)
   with Pre => Enabled (This);

   overriding
   procedure Delay_Milliseconds
      (This : in out Delays;
       Ms   : Integer)
   with Pre => Enabled (This);

   overriding
   procedure Delay_Seconds
      (This : in out Delays;
       S    : Integer)
   with Pre => Enabled (This);

   procedure Delay_Until
      (This : in out Delays;
       T    : Time);

private

   Ticks : Time := 0
      with Volatile;

   procedure SysTick_Handler
      with Export        => True,
           Convention    => C,
           External_Name => "isr_systick";

end RP.SysTick;
