--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with Rp2040_Hal_Config;
with HAL; use HAL;
with System;
with RP.GPIO;
with RP.Clock;

package RP.PWM is

   package Config renames Rp2040_Hal_Config;
   use type Config.Device_Kind;
   Slice_Count : constant :=
      (case Config.Device is
         when Config.RP2040 => 8,
         when others => 12);
   IRQ_Count : constant :=
      (case Config.Device is
         when Config.RP2040 => 1,
         when others => 2);

   type PWM_Slice is range 0 .. Slice_Count - 1;
   type PWM_IRQ is range 0 .. IRQ_Count - 1;
   type PWM_Channel is (A, B);

   type PWM_Divider_Mode is
      (Free_Running,
       Gated,          --  Slice counter only runs while channel B is high
       Rising_Edge,    --  Slice counter increments on channel B rising edge
       Falling_Edge);  --  Slice counter increments on channel B falling edge

   for PWM_Divider_Mode use
      (Free_Running => 0,
       Gated        => 1,
       Rising_Edge  => 2,
       Falling_Edge => 3);

   type PWM_Point is record
      Slice   : PWM_Slice;
      Channel : PWM_Channel;
   end record;

   type PWM_Slice_Array is array (PWM_Slice) of Boolean
      with Component_Size => 1;

   Divider_Fraction : constant := 1.0 / (2.0 ** 4);
   type Divider is delta Divider_Fraction range 1.0 .. (2.0 ** 8);

   subtype Period is UInt16;

   --  Initialize must be called before any other PWM configuration
   Initialized : Boolean := False;

   procedure Initialize
      with Post => Initialized;

   function To_PWM
      (GPIO : RP.GPIO.GPIO_Point)
      return PWM_Point;

   procedure Set_Mode
      (Slice : PWM_Slice;
       Mode  : PWM_Divider_Mode)
   with Pre => Initialized;

   --  clk_sys gets divided by Divider
   procedure Set_Divider
      (Slice : PWM_Slice;
       Div   : Divider)
   with Pre => Initialized;

   --  Set_Frequency is a convenience method that calculates the closest
   --  divider for the target frequency. This may be less accurate than using
   --  Set_Divider due to rounding errors.
   procedure Set_Frequency
      (Slice     : PWM_Slice;
       Frequency : Hertz)
       with Pre => Initialized
               and Frequency in RP.Clock.Frequency (RP.Clock.SYS) / 256 .. RP.Clock.Frequency (RP.Clock.SYS);

   --  on each divided clock cycle, a counter is incremented toward Clocks and
   --  wraps around when it matches this value
   procedure Set_Interval
      (Slice  : PWM_Slice;
       Clocks : Period)
   with Pre => Initialized;

   --  on each divided clock cycle, the counter is compared with this value and
   --  the output is low if >= Clocks. This can be set independently for each
   --  channel in the slice.
   procedure Set_Duty_Cycle
      (Slice     : PWM_Slice;
       Channel_A : Period;
       Channel_B : Period)
   with Pre => Initialized;

   procedure Set_Duty_Cycle
      (Slice      : PWM_Slice;
       Channel    : PWM_Channel;
       Duty_Cycle : Period)
   with Pre => Initialized;

   procedure Enable
      (Slice : PWM_Slice)
   with Pre => Initialized;

   procedure Disable
      (Slice : PWM_Slice)
   with Pre => Initialized;

   procedure Enable
      (Slices : PWM_Slice_Array)
   with Pre => Initialized;

   procedure Disable
      (Slices : PWM_Slice_Array)
   with Pre => Initialized;

   function Enabled
      (Slice : PWM_Slice)
      return Boolean;

   procedure Set_Invert
      (Slice     : PWM_Slice;
       Channel_A : Boolean;
       Channel_B : Boolean)
    with Pre => Initialized;

   procedure Set_Phase_Correction
      (Slice   : PWM_Slice;
       Enabled : Boolean)
    with Pre => Initialized;

   procedure Advance_Phase
      (Slice : PWM_Slice)
      with Pre => Enabled (Slice);

   procedure Retard_Phase
      (Slice : PWM_Slice)
      with Pre => Enabled (Slice);

   function Count
      (Slice : PWM_Slice)
      return UInt16;

   procedure Set_Count
      (Slice : PWM_Slice;
       Value : Period)
   with Pre => Initialized;

   function Compare_Reg_Address
      (Slice : PWM_Slice)
      return System.Address;
   --  For DMA transfers

   procedure Enable_Interrupt
      (Slice : PWM_Slice;
       IRQ   : PWM_IRQ := 0);

   procedure Disable_Interrupt
      (Slice : PWM_Slice;
       IRQ   : PWM_IRQ := 0);

   procedure Acknowledge_Interrupt
      (Slice : PWM_Slice);
end RP.PWM;
