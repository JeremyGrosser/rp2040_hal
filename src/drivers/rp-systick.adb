--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with Cortex_M_SVD.SysTick;  use Cortex_M_SVD.SysTick;
with System.Machine_Code;
with RP.Clock;

package body RP.SysTick is
   procedure Enable
      (This : in out Delays)
   is
   begin
      --  1ms ticks
      SysTick_Periph.RVR.RELOAD := SYST_RVR_RELOAD_Field
         (RP.Clock.Frequency (RP.Clock.SYS) / 1_000);
      SysTick_Periph.CVR.CURRENT := 0;

      SysTick_Periph.CSR :=
         (CLKSOURCE => Cpu_Clk,
          TICKINT   => Enable,
          ENABLE    => Enable,
          others    => <>);
   end Enable;

   procedure Disable
      (This : in out Delays)
   is
   begin
      SysTick_Periph.CSR.ENABLE := Disable;
   end Disable;

   function Enabled
      (This : in out Delays)
      return Boolean
   is
   begin
      return SysTick_Periph.CSR.ENABLE = Enable;
   end Enabled;

   function Ticks_Per_Second
      return Time
   is (1_000);

   function Clock
      return Time
   is (Ticks);

   function Milliseconds
      (T : Natural)
      return Time
   is (Time (T));

   overriding
   procedure Delay_Microseconds
      (This : in out Delays;
       Us   : Integer)
   is
   begin
      --  this really needs a tickless approach
      raise Not_Implemented;
   end Delay_Microseconds;

   overriding
   procedure Delay_Milliseconds
      (This : in out Delays;
       Ms   : Integer)
   is
      T : constant Time := Ticks + Milliseconds (Ms);
   begin
      while Ticks < T loop
         System.Machine_Code.Asm ("wfi", Volatile => True);
      end loop;
   end Delay_Milliseconds;

   overriding
   procedure Delay_Seconds
      (This : in out Delays;
       S    : Integer)
   is
   begin
      Delay_Milliseconds (This, S * 1_000);
   end Delay_Seconds;

   procedure Delay_Until
      (This : in out Delays;
       T    : Time)
   is
   begin
      loop
         exit when Ticks >= T;
         System.Machine_Code.Asm ("wfi", Volatile => True);
      end loop;
   end Delay_Until;

   procedure SysTick_Handler is
   begin
      Ticks := Ticks + 1;
   end SysTick_Handler;

end RP.SysTick;
