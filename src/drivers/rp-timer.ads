--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with HAL; use HAL;

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

   function Milliseconds
      (T : Natural)
      return Time;

end RP.Timer;
