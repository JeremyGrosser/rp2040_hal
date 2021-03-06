--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with HAL.Time; use HAL.Time;
with HAL;      use HAL;

package RP.Timer
   with Elaborate_Body
is
   type Time is new UInt64;
   Ticks_Per_Second : constant := 1_000_000;

   --  Monotonic clock running at Ticks_Per_Second.
   function Clock
      return Time;

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

private

   procedure TIMER_IRQ_2_Handler
      with Export        => True,
           Convention    => C,
           External_Name => "isr_irq2";

end RP.Timer;
