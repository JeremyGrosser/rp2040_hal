--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP2350_SVD.TIMER0; use RP2350_SVD.TIMER0;

package body RP.Timer is
   function Clock
      return Time
   is
      --  This implementation uses the non-latching TIMERAWH and TIMERAWL
      --  registers in order to be safe for concurrent access.
      Next_High : UInt32;
      High      : UInt32;
      Low       : UInt32;
   begin
      High := TIMER0_Periph.TIMERAWH;
      Low := TIMER0_Periph.TIMERAWL;
      Next_High := TIMER0_Periph.TIMERAWH;

      if Next_High /= High then
         --  If TIMERAWH changed while we were reading TIMERAWL it means that at
         --  some point between the two reads TIMERAWL overflowed and the values
         --  where:
         --    - TIMERAWL = 0
         --    - TIMERAWH = Next_High
         --
         --  These values denote a valid point in time between the call and the
         --  return of this function.

         Low := 0;
         High := Next_High;
      end if;

      return Time (Shift_Left (UInt64 (High), 32) or UInt64 (Low));
   end Clock;

   procedure Busy_Wait_Until (Deadline : Time) is
      DL_High : constant UInt32 :=
        UInt32 (Shift_Right (Deadline, 32) and 16#FF_FF_FF_FF#);
      DL_Low  : constant UInt32 :=
        UInt32 (Deadline and 16#FF_FF_FF_FF#);

      High : UInt32 := TIMER0_Periph.TIMERAWH;
   begin
      loop
         High := TIMER0_Periph.TIMERAWH;
         exit when High >= DL_High;
      end loop;

      while High = DL_High and then TIMER0_Periph.TIMERAWL < DL_Low loop
         High := TIMER0_Periph.TIMERAWH;
      end loop;

   end Busy_Wait_Until;

   function Milliseconds
      (T : Natural)
      return Time
   is ((Ticks_Per_Second / 1_000) * Time (T));

   procedure Set_Debug_Pause
      (Core_0, Core_1 : Boolean)
   is
   begin
      TIMER0_Periph.DBGPAUSE.DBG := (As_Array => True, Arr => (0 => Core_0, 1 => Core_1));
   end Set_Debug_Pause;

end RP.Timer;
