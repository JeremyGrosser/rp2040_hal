--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP2040_SVD.PWM;
with RP2040_SVD;
with RP.GPIO;
with HAL; use HAL;

package RP.PWM is
   type PWM_Slice is range 0 .. 7;
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

   Divider_Fraction : constant := 1.0 / (2.0 ** 4);
   type Divider is delta Divider_Fraction range Divider_Fraction .. (2.0 ** 8) - Divider_Fraction;

   subtype Period is UInt16;

   function To_PWM
      (GPIO : RP.GPIO.GPIO_Point)
      return PWM_Point;

   procedure Set_Mode
      (Slice : PWM_Slice;
       Mode  : PWM_Divider_Mode);

   --  clk_sys gets divided by Divider
   procedure Set_Divider
      (Slice : PWM_Slice;
       Div   : Divider);

   --  Set_Frequency is a convenience method that calculates the correct
   --  divider for the target frequency
   procedure Set_Frequency
      (Slice     : PWM_Slice;
       Frequency : Hertz)
       with Pre => Frequency > 0;

   --  on each divided clock cycle, a counter is incremented toward Clocks and
   --  wraps around when it matches this value
   procedure Set_Interval
      (Slice  : PWM_Slice;
       Clocks : Period);

   --  on each divided clock cycle, the counter is compared with this value and
   --  the output is low if >= Clocks. This can be set independently for each
   --  channel in the slice.
   procedure Set_Duty_Cycle
      (Point  : PWM_Point;
       Clocks : Period);

   procedure Enable
      (Slice : PWM_Slice);

   procedure Disable
      (Slice : PWM_Slice);

   function Enabled
      (Slice : PWM_Slice)
      return Boolean;

   procedure Set_Invert
      (Point  : PWM_Point;
       Invert : Boolean);

   procedure Set_Phase_Correction
      (Slice   : PWM_Slice;
       Enabled : Boolean);

   procedure Advance_Phase
      (Slice : PWM_Slice)
      with Pre => Enabled (Slice);

   procedure Retard_Phase
      (Slice : PWM_Slice)
      with Pre => Enabled (Slice);

   function Count
      (Slice : PWM_Slice)
      return Natural
      with Pre => Enabled (Slice);

private

   function Div_Integer
      (V : Divider)
      return UInt8;

   function Div_Fraction
      (V : Divider)
      return UInt4;

   function Div_Value
      (Int  : UInt8;
       Frac : UInt4)
      return Divider;

   type PWM_Slice_Register is record
      CSR : aliased RP2040_SVD.PWM.CH0_CSR_Register;
      DIV : aliased RP2040_SVD.PWM.CH0_DIV_Register;
      CTR : aliased RP2040_SVD.PWM.CH0_CTR_Register;
      CC  : aliased RP2040_SVD.PWM.CH0_CC_Register;
      TOP : aliased RP2040_SVD.PWM.CH0_TOP_Register;
   end record
      with Size => 32 * 5,
           Volatile;
   for PWM_Slice_Register use record
      CSR at 0 range 0 .. 31;
      DIV at 4 range 0 .. 31;
      CTR at 8 range 0 .. 31;
      CC  at 12 range 0 .. 31;
      TOP at 16 range 0 .. 31;
   end record;

   type PWM_Slices is array (PWM_Slice) of PWM_Slice_Register;

   type PWM_Peripheral is record
      CH   : PWM_Slices;
      EN   : aliased RP2040_SVD.PWM.EN_Register;
      INTR : aliased RP2040_SVD.PWM.INTR_Register;
      INTE : aliased RP2040_SVD.PWM.INTE_Register;
      INTF : aliased RP2040_SVD.PWM.INTF_Register;
      INTS : aliased RP2040_SVD.PWM.INTS_Register;
   end record
      with Size => 1440,
           Volatile;
   for PWM_Peripheral use record
      CH   at   0 range 0 .. 1279;
      EN   at 160 range 0 .. 31;
      INTR at 164 range 0 .. 31;
      INTE at 168 range 0 .. 31;
      INTF at 172 range 0 .. 31;
      INTS at 176 range 0 .. 31;
   end record;

   PWM_Periph : aliased PWM_Peripheral
      with Import, Address => RP2040_SVD.PWM_Base;
end RP.PWM;
