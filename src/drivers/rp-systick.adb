with Cortex_M_SVD.SysTick;  use Cortex_M_SVD.SysTick;
with Cortex_M_SVD.NVIC;     use Cortex_M_SVD.NVIC;
with RP.Clock;
with Runtime;

package body RP.SysTick is
   procedure Enable is
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

   procedure Disable is
   begin
      SysTick_Periph.CSR.ENABLE := Disable;
   end Disable;

   function Enabled
      return Boolean
   is
   begin
      return SysTick_Periph.CSR.ENABLE = Enable;
   end Enabled;

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
      T : constant Time := Ticks + Time (Ms);
   begin
      --  Handle UInt32 overflow gracefully
      if Ticks > T then
         while Ticks > T loop
            Runtime.Wait_For_Interrupt;
         end loop;
      end if;

      while Ticks < T loop
         Runtime.Wait_For_Interrupt;
      end loop;
   end Delay_Milliseconds;

   overriding
   procedure Delay_Seconds
      (This : in out Delays;
       S    : Integer)
   is
   begin
      Delay_Milliseconds (This, S * 1000);
   end Delay_Seconds;

   procedure SysTick_Handler is
   begin
      Ticks := Ticks + 1;
   end SysTick_Handler;

end RP.SysTick;
