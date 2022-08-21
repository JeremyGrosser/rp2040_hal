--
--  Copyright 2022 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with HAL.Time;             use HAL.Time;

package RP.Timer.Delays is

   type Delays is new HAL.Time.Delays with null record;

   function Enabled
      (This : Delays)
      return Boolean;

   --  Enables the ALARM2 interrupt used by the Delay methods.
   procedure Enable
      (This : in out Delays);

   procedure Disable
      (This : in out Delays);

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

end RP.Timer.Delays;
