--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP_Interrupts;
with HAL.Time; use HAL.Time;
with HAL;      use HAL;

package RP.Timer
   with Preelaborate
is
   type Time is new UInt64;
   Ticks_Per_Second : constant := 1_000_000;

   --  Monotonic clock running at Ticks_Per_Second.
   function Clock
      return Time;

   --  Waste CPU cycles until Clock reaches the given Deadline. This procedure
   --  is useful in situations where interrupt based delays will not work,
   --  e.g. an interrupt handler.
   procedure Busy_Wait_Until (Deadline : Time);

   type Delays is new HAL.Time.Delays with null record;

   function Enabled
      (This : Delays)
      return Boolean;

   --  Enables the ALARM2 interrupt used by the Delay methods.
   procedure Enable
      (This : in out Delays);

   procedure Disable
      (This : in out Delays);

   function Milliseconds
      (T : Natural)
      return Time;

   procedure Delay_Until
      (This : in out Delays;
       T    : Time)
       with Pre => Enabled (This);

   --  Microsecond delays are assumed to be relatively short and are
   --  implemented with a polling loop rather than interrupts
   overriding
   procedure Delay_Microseconds
      (This : in out Delays;
       Us   : Integer);

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

   --  This handler should be called in response to TIMER_IRQ_2 (IRQ 2)
   procedure IRQ_Handler;

end RP.Timer;
