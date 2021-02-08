--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP2040_SVD.RESETS; use RP2040_SVD.RESETS;

package body RP.PWM is
   function To_PWM
      (GPIO : RP.GPIO.GPIO_Point)
      return PWM_Point
   is ((Slice   => PWM_Slice (Shift_Right (UInt32 (GPIO.Pin), 1) and 2#111#),
        Channel => PWM_Channel'Val (UInt32 (GPIO.Pin) and 1)));

   procedure Enable
      (Slice : PWM_Slice)
   is
   begin
      if not RESETS_Periph.RESET_DONE.pwm then
         RESETS_Periph.RESET.pwm := False;
         while not RESETS_Periph.RESET_DONE.pwm loop
            null;
         end loop;
      end if;

      PWM_Periph.EN.CH.Arr (Natural (Slice)) := True;
   end Enable;

   procedure Disable
      (Slice : PWM_Slice)
   is
   begin
      PWM_Periph.EN.CH.Arr (Natural (Slice)) := False;
   end Disable;

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
      (Point : PWM_Point;
       Clocks : Period)
   is
   begin
      if Point.Channel = A then
         PWM_Periph.CH (Point.Slice).CC.A := Clocks;
      else
         PWM_Periph.CH (Point.Slice).CC.B := Clocks;
      end if;
   end Set_Duty_Cycle;

   procedure Set_Phase_Correction
      (Slice   : PWM_Slice;
       Enabled : Boolean)
   is
   begin
      PWM_Periph.CH (Slice).CSR.PH_CORRECT := Enabled;
   end Set_Phase_Correction;

   procedure Set_Clock_Divider
      (Slice   : PWM_Slice;
       Divider : Clock_Divider)
   is
      use RP2040_SVD.PWM;
   begin
      PWM_Periph.CH (Slice).DIV :=
         (INT    => CH0_DIV_INT_Field  (Div_Integer (Divider)),
          FRAC   => CH0_DIV_FRAC_Field (Div_Fraction (Divider)),
          others => <>);
   end Set_Clock_Divider;

   function Div_Integer
      (V : Clock_Divider)
      return UInt8
   is
      I : constant Natural := Natural (V);
   begin
      if I > Natural (UInt8'Last) then
         return UInt8 (I - 1);
      else
         return UInt8 (I);
      end if;
   end Div_Integer;

   function Div_Fraction
      (V : Clock_Divider)
      return UInt4
   is (UInt4 ((V - Clock_Divider (Div_Integer (V))) * 2 ** 4));

   function Div_Value
      (Int  : UInt8;
       Frac : UInt4)
       return Clock_Divider
   is (Clock_Divider (Int) + (Clock_Divider (Frac) / 2 ** 4));

end RP.PWM;
