--
--  Copyright 2025 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP.Timer.Interrupts;

package RP.Timer.Interrupts3 is

   type Delays is new RP.Timer.Interrupts.Delays with null record;

   overriding
   function Enabled
      (This : Delays)
      return Boolean;

   --  Enables the ALARM3 interrupt used by the Delay methods.
   overriding
   procedure Enable
      (This : in out Delays);

   overriding
   procedure Disable
      (This : in out Delays);

   overriding
   procedure Delay_Until
      (This : in out Delays;
       T    : Time)
       with Pre => Enabled (This);

   --  the actual delay routines could be inherited from
   --  RP.Timer.Interrupts.Delays. No, doesn't work

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

end RP.Timer.Interrupts3;
