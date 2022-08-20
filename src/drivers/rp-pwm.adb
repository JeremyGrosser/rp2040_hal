--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP.Reset;

package body RP.PWM is

   procedure Initialize is
      use RP.Reset;
   begin
      RP.Clock.Enable (RP.Clock.PERI);
      Reset_Peripheral (Reset_PWM);
      PWM_Periph.EN.CH.Val := 0;
      for Slice in PWM_Periph.CH'Range loop
         PWM_Periph.CH (Slice) := (others => <>);
      end loop;
      Initialized := True;
   end Initialize;

   function To_PWM
      (GPIO : RP.GPIO.GPIO_Point)
      return PWM_Point
   is ((Slice   => PWM_Slice (Shift_Right (UInt32 (GPIO.Pin), 1) and 2#111#),
        Channel => PWM_Channel'Val (UInt32 (GPIO.Pin) and 1)));

   procedure Enable
      (Slice : PWM_Slice)
   is
   begin
      PWM_Periph.EN.CH.Arr (Natural (Slice)) := True;
   end Enable;

   procedure Disable
      (Slice : PWM_Slice)
   is
   begin
      PWM_Periph.EN.CH.Arr (Natural (Slice)) := False;
   end Disable;

   function To_Mask
      (Slices : PWM_Slice_Array)
      return UInt8
   is
      Mask : UInt8 := 0;
   begin
      for I in Slices'Range loop
         if Slices (I) then
            Mask := Mask or Shift_Left (1, Natural (I));
         end if;
      end loop;
      return Mask;
   end To_Mask;

   procedure Enable
      (Slices : PWM_Slice_Array)
   is
      Mask : constant UInt8 := To_Mask (Slices);
   begin
      PWM_Periph.EN.CH.Val := PWM_Periph.EN.CH.Val or Mask;
   end Enable;

   procedure Disable
      (Slices : PWM_Slice_Array)
   is
      Mask : constant UInt8 := To_Mask (Slices);
   begin
      PWM_Periph.EN.CH.Val := PWM_Periph.EN.CH.Val and not Mask;
   end Disable;

   function Enabled
      (Slice : PWM_Slice)
      return Boolean
   is (PWM_Periph.EN.CH.Arr (Natural (Slice)));

   procedure Set_Mode
      (Slice : PWM_Slice;
       Mode  : PWM_Divider_Mode)
   is
      use RP2040_SVD.PWM;
   begin
      PWM_Periph.CH (Slice).CSR.DIVMODE :=
         CH0_CSR_DIVMODE_Field'Enum_Val (PWM_Divider_Mode'Enum_Rep (Mode));
   end Set_Mode;

   procedure Set_Interval
      (Slice  : PWM_Slice;
       Clocks : Period)
   is
   begin
      PWM_Periph.CH (Slice).TOP.CH0_TOP := Clocks;
   end Set_Interval;

   procedure Set_Duty_Cycle
      (Slice     : PWM_Slice;
       Channel_A : Period;
       Channel_B : Period)
   is
   begin
      PWM_Periph.CH (Slice).CC.A := Channel_A;
      PWM_Periph.CH (Slice).CC.B := Channel_B;
   end Set_Duty_Cycle;

   procedure Set_Duty_Cycle
      (Slice      : PWM_Slice;
       Channel    : PWM_Channel;
       Duty_Cycle : Period)
   is
   begin
      case Channel is
         when A =>
            PWM_Periph.CH (Slice).CC.A := Duty_Cycle;
         when B =>
            PWM_Periph.CH (Slice).CC.B := Duty_Cycle;
      end case;
   end Set_Duty_Cycle;

   procedure Set_Invert
      (Slice     : PWM_Slice;
       Channel_A : Boolean;
       Channel_B : Boolean)
   is
   begin
      PWM_Periph.CH (Slice).CSR.A_INV := Channel_A;
      PWM_Periph.CH (Slice).CSR.B_INV := Channel_B;
   end Set_Invert;

   procedure Set_Phase_Correction
      (Slice   : PWM_Slice;
       Enabled : Boolean)
   is
   begin
      PWM_Periph.CH (Slice).CSR.PH_CORRECT := Enabled;
   end Set_Phase_Correction;

   procedure Advance_Phase
      (Slice : PWM_Slice)
   is
   begin
      PWM_Periph.CH (Slice).CSR.PH_ADV := True;
      while PWM_Periph.CH (Slice).CSR.PH_ADV loop
         null;
      end loop;
   end Advance_Phase;

   procedure Retard_Phase
      (Slice : PWM_Slice)
   is
   begin
      PWM_Periph.CH (Slice).CSR.PH_RET := True;
      while PWM_Periph.CH (Slice).CSR.PH_RET loop
         null;
      end loop;
   end Retard_Phase;

   procedure Set_Divider
      (Slice : PWM_Slice;
       Div   : Divider)
   is
      use RP2040_SVD.PWM;
      D : constant CH0_DIV_Register :=
         (INT    => CH0_DIV_INT_Field (Div_Integer (Div)),
          FRAC   => CH0_DIV_FRAC_Field (Div_Fraction (Div)),
          others => <>);
   begin
      PWM_Periph.CH (Slice).DIV := D;
   end Set_Divider;

   procedure Set_Frequency
      (Slice     : PWM_Slice;
       Frequency : Hertz)
   is
      Clk_Sys : constant Hertz := RP.Clock.Frequency (RP.Clock.SYS);
      Div     : constant Divider := Divider (Clk_Sys / Frequency);
   begin
      Set_Divider (Slice, Div);
   end Set_Frequency;

   function Count
      (Slice : PWM_Slice)
      return UInt16
   is (PWM_Periph.CH (Slice).CTR.CH0_CTR);

   procedure Set_Count
      (Slice : PWM_Slice;
       Value : Period)
   is
   begin
      PWM_Periph.CH (Slice).CTR.CH0_CTR := Value;
   end Set_Count;

   function Compare_Reg_Address (Slice : PWM_Slice) return System.Address is
   begin
      return PWM_Periph.CH (Slice).CC'Address;
   end Compare_Reg_Address;

   function Div_Integer
      (V : Divider)
      return UInt8
   is
      I : constant Natural := Natural (V);
   begin
      if V = Divider'Last then
         return 0;
      elsif Divider (I) > V then
         return UInt8 (I - 1);
      else
         return UInt8 (I);
      end if;
   end Div_Integer;

   function Div_Fraction
      (V : Divider)
      return UInt4
   is
   begin
      if V = Divider'Last then
         return 0;
      else
         return UInt4 ((V - Divider (Div_Integer (V))) * 2 ** 4);
      end if;
   end Div_Fraction;

   function Div_Value
      (Int  : UInt8;
       Frac : UInt4)
       return Divider
   is
   begin
      if Int = 0 then
         return Divider'Last;
      else
         return Divider (Int) + (Divider (Frac) / 2 ** 4);
      end if;
   end Div_Value;

end RP.PWM;
