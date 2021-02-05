with RP2040_SVD.RESETS; use RP2040_SVD.RESETS;
with RP2040_SVD.ADC; use RP2040_SVD.ADC;
with RP.GPIO; use RP.GPIO;
with HAL.GPIO;

package body RP.ADC is
   procedure Configure
      (Channel : ADC_Channel)
   is
      Point : GPIO_Point := (Pin => GPIO_Pin (Channel) + 26);
   begin
      RP.GPIO.Enable;
      Configure (Point, Analog, HAL.GPIO.Floating, HI_Z);

      RESETS_Periph.RESET.adc := False;
      while not RESETS_Periph.RESET_DONE.adc loop
         null;
      end loop;

      ADC_Periph.CS.EN := True;
      while not ADC_Periph.CS.READY loop
         null;
      end loop;

      if Channel = Temperature_Sensor then
         ADC_Periph.CS.TS_EN := True;
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
end RP.ADC;
