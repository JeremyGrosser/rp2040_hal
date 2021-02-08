--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP2040_SVD.RESETS; use RP2040_SVD.RESETS;
with RP2040_SVD.ADC; use RP2040_SVD.ADC;
with RP.GPIO; use RP.GPIO;
with HAL.GPIO;

package body RP.ADC is
   procedure Enable
   is
   begin
      RESETS_Periph.RESET.adc := False;
      while not RESETS_Periph.RESET_DONE.adc loop
         null;
      end loop;

      ADC_Periph.CS.EN := True;
      while not ADC_Periph.CS.READY loop
         null;
      end loop;
   end Enable;

   function Enabled
      return Boolean
   is (RESETS_Periph.RESET_DONE.adc);

   procedure Configure
      (Channel : ADC_Channel)
   is
   begin
      if Channel = Temperature_Sensor then
         ADC_Periph.CS.TS_EN := True;
      else
         if not RP.GPIO.Enabled then
            RP.GPIO.Enable;
         end if;
         declare
            Point : GPIO_Point := (Pin => GPIO_Pin (Channel) + 26);
         begin
            Configure
               (This => Point,
                Mode => Analog,
                Pull => HAL.GPIO.Floating,
                Func => HI_Z);
         end;
      end if;
   end Configure;

   function Read
      (Channel : ADC_Channel)
      return Analog_Value
   is
   begin
      ADC_Periph.CS.AINSEL := CS_AINSEL_Field (Channel);
      ADC_Periph.CS.START_ONCE := True;
      while not ADC_Periph.CS.READY loop
         null;
      end loop;
      return Analog_Value (ADC_Periph.RESULT.RESULT);
   end Read;

   function Read_Microvolts
      (Channel : ADC_Channel;
       VREF    : Microvolts := 3_300_000)
      return Microvolts
   is
      use type Analog_Value;
      Counts : constant Analog_Value := Read (Channel);
   begin
      if Counts = 0 then
         return 0;
      else
         return (VREF / (Microvolts (Analog_Value'Last) + 1)) * Microvolts (Counts);
      end if;
   end Read_Microvolts;

   function Temperature
      (Ref_Temp : Celsius := 27;
       Vbe      : Microvolts := 706_000;
       Slope    : Microvolts := 1_721)
      return Celsius
   is
   begin
      return Ref_Temp - Celsius ((Read_Microvolts (Temperature_Sensor) - Vbe) / Slope);
   end Temperature;
end RP.ADC;
