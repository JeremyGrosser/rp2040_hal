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

   Clock_Fraction : constant := 1.0 / (2.0 ** 4);
   type Clock_Divider is delta Clock_Fraction range 1.0 .. (2.0 ** 8) - Clock_Fraction;

   subtype Period is UInt16;

   function To_PWM
      (GPIO : RP.GPIO.GPIO_Point)
      return PWM_Point;

   procedure Set_Mode
      (Slice : PWM_Slice;
       Mode  : PWM_Divider_Mode);

   procedure Set_Phase_Correction
      (Slice   : PWM_Slice;
       Enabled : Boolean);

   --  clk_sys gets divided by Divider
   procedure Set_Clock_Divider
      (Slice   : PWM_Slice;
       Divider : Clock_Divider);

   --  on each divided clock cycle, a counter incremented toward Clocks and
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

private

   function Div_Integer
      (V : Clock_Divider)
      return UInt8;

   function Div_Fraction
      (V : Clock_Divider)
      return UInt4;

   function Div_Value
      (Int  : UInt8;
       Frac : UInt4)
      return Clock_Divider;

   type PWM_Slice_Register is record
      CSR : aliased RP2040_SVD.PWM.CH0_CSR_Register;
      DIV : aliased RP2040_SVD.PWM.CH0_DIV_Register;
      CTR : aliased RP2040_SVD.PWM.CH0_CTR_Register;
      CC  : aliased RP2040_SVD.PWM.CH0_CC_Register;
      TOP : aliased RP2040_SVD.PWM.CH0_TOP_Register;
   end record
      with Size => 32 * 5;
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
      with Size => 1440;
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
