with RP.Clock;
with HAL;

package RP.ADC is
   subtype Analog_Value is HAL.UInt12;
   subtype ADC_Channel is Natural range 0 .. 4;

   Temperature_Sensor : constant ADC_Channel := 4;

   procedure Enable;
   function Enabled return Boolean;

   procedure Configure
      (Channel : ADC_Channel)
   with Pre => RP.Clock.Frequency (RP.Clock.ADC) = 48_000_000;

   function Read
      (Channel : ADC_Channel)
      return Analog_Value;
end RP.ADC;
