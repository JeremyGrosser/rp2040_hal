--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP2040_SVD.ADC; use RP2040_SVD.ADC;
with RP.GPIO; use RP.GPIO;
with RP.Reset;

package body RP.ADC is
   use HAL;

   procedure Enable
   is
      use RP.Reset;
   begin
      RP.Clock.Enable (RP.Clock.ADC);
      Reset_Peripheral (Reset_ADC);

      ADC_Periph.CS.EN := True;
      while not ADC_Periph.CS.READY loop
         null;
      end loop;

      --  Enable FIFO and DMA operation
      ADC_Periph.FCS :=
         (DREQ_EN => True,
          EN      => True,
          THRESH  => 1,
          others  => <>);
   end Enable;

   procedure Disable
   is
   begin
      ADC_Periph.CS.EN := False;
      RP.Clock.Disable (RP.Clock.ADC);
   end Disable;

   function Enabled
      return Boolean
   is (ADC_Periph.CS.EN and ADC_Periph.CS.READY);

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
                Pull => Floating,
                Func => HI_Z);
         end;
      end if;
   end Configure;

   procedure Configure
      (Channels : ADC_Channels)
   is
   begin
      for I in Channels'Range loop
         if Channels (I) then
            Configure (I);
         end if;
      end loop;
   end Configure;

   procedure Set_Mode
      (Mode : ADC_Mode)
   is
   begin
      ADC_Periph.CS.START_MANY := (Mode = Free_Running);
   end Set_Mode;

   procedure Set_Round_Robin
      (Channels : ADC_Channels)
   is
   begin
      ADC_Periph.CS.RROBIN := To_UInt5 (Channels);
   end Set_Round_Robin;

   procedure Set_Divider
      (Div : ADC_Divider)
   is
   begin
      ADC_Periph.DIV :=
         (INT    => Div_Integer (Div),
          FRAC   => Div_Fraction (Div),
          others => <>);
   end Set_Divider;

   procedure Set_Sample_Rate
      (Rate : Hertz)
   is
      Clk_ADC : constant Hertz := RP.Clock.Frequency (RP.Clock.ADC);
      Div     : constant ADC_Divider := ADC_Divider (Float (Clk_ADC) / Float (Rate)) - 1.0;
   begin
      Set_Divider (Div);
   end Set_Sample_Rate;

   procedure Set_Sample_Bits
      (Bits : ADC_Sample_Bits)
   is
   begin
      ADC_Periph.FCS.SHIFT := (Bits = 8);
   end Set_Sample_Bits;

   function Read
      (Channel : ADC_Channel)
      return Analog_Value
   is
   begin
      ADC_Periph.CS.AINSEL := CS_AINSEL_Field (Channel);
      return Read;
   end Read;

   function Read
      return Analog_Value
   is
   begin
      if not ADC_Periph.CS.START_MANY then
         ADC_Periph.CS.START_ONCE := True;
      end if;
      while ADC_Periph.FCS.EMPTY loop
         null;
      end loop;
      return Analog_Value (ADC_Periph.FIFO.VAL);
   end Read;

   function Read_Microvolts
      (Channel : ADC_Channel;
       VREF    : Microvolts := 3_300_000)
      return Microvolts
   is
      Conversion_Factor : constant Float := Float (VREF) / Float (Analog_Value'Last);
      Counts            : constant Analog_Value := Read (Channel);
   begin
      return Microvolts (Conversion_Factor * Float (Counts));
   end Read_Microvolts;

   function Temperature
      (Ref_Temp : Celsius := 27;
       Vbe      : Microvolts := 706_000;
       Slope    : Microvolts := 1_721;
       VREF     : Microvolts := 3_300_000)
      return Celsius
   is
      Temp : Celsius;
   begin
      ADC_Periph.CS.TS_EN := True;
      Temp := Ref_Temp - Celsius ((Read_Microvolts (Temperature_Sensor, VREF) - Vbe) / Slope);
      ADC_Periph.CS.TS_EN := False;
      return Temp;
   end Temperature;

   function To_ADC_Channel
      (Point : RP.GPIO.GPIO_Point)
      return ADC_Channel
   is (ADC_Channel (Point.Pin - 26));

   function Div_Integer
      (V : ADC_Divider)
      return UInt16
   is
      I : constant Natural := Natural (V);
   begin
      if ADC_Divider (I) > V then
         return UInt16 (I - 1);
      else
         return UInt16 (I);
      end if;
   end Div_Integer;

   function Div_Fraction
      (V : ADC_Divider)
      return UInt8
   is (UInt8 ((V - ADC_Divider (Div_Integer (V))) * 2 ** 8));

   function FIFO_Address
      return System.Address
   is (ADC_Periph.FIFO'Address);

end RP.ADC;
