--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with Ada.Unchecked_Conversion;
with RP.Clock;
with RP.GPIO;
with System;
with HAL;

package RP.ADC is
   subtype Analog_Value is HAL.UInt12;

   subtype ADC_Channel is Natural range 0 .. 4;

   type ADC_Channels is array (ADC_Channel) of Boolean
      with Component_Size => 1,
           Size           => 5;

   type Microvolts is new Integer;

   --  The temperature sensor is not terribly accurate, so whole integer
   --  resolution is fine.
   type Celsius is new Integer;

   Temperature_Sensor : constant ADC_Channel := 4;

   procedure Enable;
   procedure Disable;

   function Enabled return Boolean;

   --  Configure the GPIO pin for analog input
   procedure Configure
      (Channel : ADC_Channel)
   with Pre => RP.Clock.Frequency (RP.Clock.ADC) = 48_000_000;

   procedure Configure
      (Channels : ADC_Channels)
   with Pre => RP.Clock.Frequency (RP.Clock.ADC) = 48_000_000;

   type ADC_Mode is (One_Shot, Free_Running);

   --  The ADC starts in One_Shot mode. Read will start a conversion and wait
   --  for it to complete before returning. In Free_Running mode, Read returns
   --  as soon as a sample is available.
   procedure Set_Mode
      (Mode : ADC_Mode);

   --  In round robin mode, the next enabled channel is selected after each read.
   procedure Set_Round_Robin
      (Channels : ADC_Channels);

   ADC_Divider_Fraction : constant := 1.0 / (2.0 ** 8);
   type ADC_Divider is delta ADC_Divider_Fraction range 0.0 .. (2.0 ** 16) - ADC_Divider_Fraction;

   --  If Div = 0, conversions run at the maximum rate
   procedure Set_Divider
      (Div : ADC_Divider);

   --  Set the conversion rate for free running mode
   procedure Set_Sample_Rate
      (Rate : Hertz)
      with Pre => Rate in 1 .. 500_000;

   type ADC_Sample_Bits is new Positive
      with Dynamic_Predicate => ADC_Sample_Bits in 8 | 12;

   --  If Bits = 8 then samples are automatically right shifted by 4 bits.
   procedure Set_Sample_Bits
      (Bits : ADC_Sample_Bits);

   function Read
      (Channel : ADC_Channel)
      return Analog_Value;

   function Read
      return Analog_Value;

   function Read_Microvolts
      (Channel : ADC_Channel;
       VREF    : Microvolts := 3_300_000)
       return Microvolts;

   --  Temperature constants from datasheet section 4.9.4
   --  May need calibration.
   function Temperature
      (Ref_Temp : Celsius := 27;
       Vbe      : Microvolts := 706_000;
       Slope    : Microvolts := 1_721;
       VREF     : Microvolts := 3_300_000)
      return Celsius;

   function To_ADC_Channel
      (Point : RP.GPIO.GPIO_Point)
      return ADC_Channel
      with Pre => Point.Pin in RP.GPIO.ADC_Pin;

   function FIFO_Address
      return System.Address;

private

   function To_UInt5 is new Ada.Unchecked_Conversion
      (Source => ADC_Channels,
       Target => HAL.UInt5);

   function Div_Integer
      (V : ADC_Divider)
      return HAL.UInt16;

   function Div_Fraction
      (V : ADC_Divider)
      return HAL.UInt8;

end RP.ADC;
