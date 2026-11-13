--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP.GPIO; use RP.GPIO;
with RP.Reset;

package body RP.ADC is
   use HAL;

   type CS_Register is record
      RROBIN      : UInt5 := 0;
      AINSEL      : UInt3 := 0;
      ERR_STICKY  : Boolean := False;
      ERR         : Boolean := False;
      READY       : Boolean := False;
      START_MANY  : Boolean := False;
      START_ONCE  : Boolean := False;
      TS_EN       : Boolean := False;
      EN          : Boolean := False;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Async_Writers,
           Object_Size => 32;
   for CS_Register use record
      RROBIN      at 0 range 16 .. 20;
      AINSEL      at 0 range 12 .. 14;
      ERR_STICKY  at 0 range 10 .. 10;
      ERR         at 0 range 9 .. 9;
      READY       at 0 range 8 .. 8;
      START_MANY  at 0 range 3 .. 3;
      START_ONCE  at 0 range 2 .. 2;
      TS_EN       at 0 range 1 .. 1;
      EN          at 0 range 0 .. 0;
   end record;

   type FCS_Register is record
      THRESH   : UInt4 := 0;
      LEVEL    : UInt4 := 0;
      OVER     : Boolean := False;
      UNDER    : Boolean := False;
      FULL     : Boolean := False;
      EMPTY    : Boolean := False;
      DREQ_EN  : Boolean := False;
      ERR      : Boolean := False;
      SHIFT    : Boolean := False;
      EN       : Boolean := False;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Async_Writers,
           Object_Size => 32;
   for FCS_Register use record
      THRESH   at 0 range 24 .. 27;
      LEVEL    at 0 range 16 .. 19;
      OVER     at 0 range 11 .. 11;
      UNDER    at 0 range 10 .. 10;
      FULL     at 0 range 9 .. 9;
      EMPTY    at 0 range 8 .. 8;
      DREQ_EN  at 0 range 3 .. 3;
      ERR      at 0 range 2 .. 2;
      SHIFT    at 0 range 1 .. 1;
      EN       at 0 range 0 .. 0;
   end record;

   type FIFO_Register is record
      ERR : Boolean := False;
      VAL : UInt12 := 0;
   end record
      with Volatile_Full_Access,
           Effective_Reads,
           Async_Writers,
           Object_Size => 32;
   for FIFO_Register use record
      ERR at 0 range 15 .. 15;
      VAL at 0 range 0 .. 11;
   end record;

   type DIV_Register is record
      INT   : UInt16 := 0;
      FRAC  : UInt8 := 0;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Object_Size => 32;
   for DIV_Register use record
      INT   at 0 range 8 .. 23;
      FRAC  at 0 range 0 .. 7;
   end record;

   type ADC_Peripheral is record
      CS    : aliased CS_Register;
      FCS   : aliased FCS_Register;
      FIFO  : aliased FIFO_Register;
      DIV   : aliased DIV_Register;
   end record
      with Volatile;
   for ADC_Peripheral use record
      CS    at 16#00# range 0 .. 31;
      FCS   at 16#08# range 0 .. 31;
      FIFO  at 16#0C# range 0 .. 31;
      DIV   at 16#10# range 0 .. 31;
   end record;

   P : ADC_Peripheral
      with Import, Address => System'To_Address (16#4004_C000#);

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

   procedure Enable
   is
      use RP.Reset;
   begin
      RP.Clock.Enable_ADC;
      Reset_Peripheral (Reset_ADC);

      P.CS.EN := True;
      while not P.CS.READY loop
         null;
      end loop;

      --  Enable FIFO and DMA operation
      P.FCS :=
         (DREQ_EN => True,
          EN      => True,
          THRESH  => 1,
          others  => <>);
   end Enable;

   procedure Disable
   is
   begin
      P.CS.EN := False;
   end Disable;

   function Enabled
      return Boolean
   is (P.CS.EN and P.CS.READY);

   procedure Configure
      (Channel : ADC_Channel)
   is
   begin
      if Channel = Temperature_Sensor then
         P.CS.TS_EN := True;
      else
         declare
            Point : constant GPIO_Point := (Pin => GPIO_Pin (Channel) + 26);
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
      P.CS.START_MANY := (Mode = Free_Running);
   end Set_Mode;

   procedure Set_Round_Robin
      (Channels : ADC_Channels)
   is
      Val : UInt32 := 0;
   begin
      for Ch of Channels loop
         Val := Shift_Left (Val, 1);
         if Ch then
            Val := Val or 1;
         end if;
      end loop;
      P.CS.RROBIN := UInt5 (Val);
   end Set_Round_Robin;

   procedure Set_Divider
      (Div : ADC_Divider)
   is
   begin
      P.DIV :=
         (INT    => Div_Integer (Div),
          FRAC   => Div_Fraction (Div));
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
      P.FCS.SHIFT := (Bits = 8);
   end Set_Sample_Bits;

   function Read
      (Channel : ADC_Channel)
      return Analog_Value
   is
   begin
      P.CS.AINSEL := UInt3 (Channel);
      return Read;
   end Read;

   function Read
      return Analog_Value
   is
   begin
      if not P.CS.START_MANY then
         P.CS.START_ONCE := True;
      end if;
      while P.FCS.EMPTY loop
         null;
      end loop;
      return Analog_Value (P.FIFO.VAL);
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
      P.CS.TS_EN := True;
      Temp := Ref_Temp - Celsius ((Read_Microvolts (Temperature_Sensor, VREF) - Vbe) / Slope);
      P.CS.TS_EN := False;
      return Temp;
   end Temperature;

   function To_ADC_Channel
      (Pin : RP.GPIO.GPIO_Pin)
      return ADC_Channel
   is (ADC_Channel (Pin - 26));

   function To_ADC_Channel
      (Point : RP.GPIO.GPIO_Point)
      return ADC_Channel
   is (To_ADC_Channel (Point.Pin));

   function FIFO_Address
      return System.Address
   is (P.FIFO'Address);

end RP.ADC;
