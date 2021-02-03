with HAL; use HAL;
with HAL.Time;

package RP.SysTick is
   type Delays is new HAL.Time.Delays with null record;

   procedure Enable;
   procedure Disable;

   function Enabled
      return Boolean;

   overriding
   procedure Delay_Microseconds
      (This : in out Delays;
       Us   : Integer)
   with Pre => Enabled;

   overriding
   procedure Delay_Milliseconds
      (This : in out Delays;
       Ms   : Integer)
   with Pre => Enabled;

   overriding
   procedure Delay_Seconds
      (This : in out Delays;
       S    : Integer)
   with Pre => Enabled;

private

   subtype Time is UInt32;

   Ticks : Time := 0
      with Atomic;

   procedure SysTick_Handler
      with Export        => True,
           Convention    => C,
           External_Name => "isr_systick";

end RP.SysTick;
