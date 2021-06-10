--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with Cortex_M_SVD.NVIC;
with RP2040_SVD.RESETS; use RP2040_SVD.RESETS;
with RP2040_SVD.Interrupts;
with RP.Clock;

package body RP.PWM is

   procedure Initialize is
   begin
      RESETS_Periph.RESET.pwm := False;
      while not RESETS_Periph.RESET_DONE.pwm loop
         null;
      end loop;

      PWM_Periph.EN.CH.Val := 0;
      for Slice in PWM_Periph.CH'Range loop
         PWM_Periph.CH (Slice) := (others => <>);
      end loop;
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
      clk_sys : constant Hertz := RP.Clock.Frequency (RP.Clock.SYS);
      Div     : constant Divider := Divider (clk_sys / Frequency);
   begin
      Set_Divider (Slice, Div);
   end Set_Frequency;

   function Count
      (Slice : PWM_Slice)
      return Natural
   is (Natural (PWM_Periph.CH (Slice).CTR.CH0_CTR));

   procedure Set_Count
      (Slice : PWM_Slice;
       Value : Period)
   is
   begin
      PWM_Periph.CH (Slice).CTR.CH0_CTR := Value;
   end Set_Count;

   procedure Attach
      (Slice   : PWM_Slice;
       Handler : PWM_Interrupt_Handler)
   is
      use Cortex_M_SVD.NVIC;
   begin
      Handlers (Slice) := Handler;
      NVIC_Periph.NVIC_ICPR := Shift_Left (1, RP2040_SVD.Interrupts.PWM_IRQ_WRAP_Interrupt);
      NVIC_Periph.NVIC_ISER := Shift_Left (1, RP2040_SVD.Interrupts.PWM_IRQ_WRAP_Interrupt);
      PWM_Periph.INTE.CH.Arr (Natural (Slice)) := True;
   end Attach;

   procedure PWM_IRQ_WRAP_Interrupt is
   begin
      for Slice in PWM_Slice'Range loop
         if PWM_Periph.INTS.CH.Arr (Natural (Slice)) and Handlers (Slice) /= null then
            PWM_Periph.INTR.CH.Arr (Natural (Slice)) := True;
            Handlers (Slice).all;
         end if;
      end loop;
   end PWM_IRQ_WRAP_Interrupt;

   function Div_Integer
      (V : Divider)
      return UInt8
   is
      I : constant Natural := Natural (V);
   begin
      if Divider (I) > V then
         return UInt8 (I - 1);
      else
         return UInt8 (I);
      end if;
   end Div_Integer;

   function Div_Fraction
      (V : Divider)
      return UInt4
   is (UInt4 ((V - Divider (Div_Integer (V))) * 2 ** 4));

   function Div_Value
      (Int  : UInt8;
       Frac : UInt4)
       return Divider
   is (Divider (Int) + (Divider (Frac) / 2 ** 4));

end RP.PWM;
