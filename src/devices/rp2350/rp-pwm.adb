--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP.Reset;

package body RP.PWM is
   type CSR_Register is record
      PH_ADV      : Boolean := False;
      PH_RET      : Boolean := False;
      DIVMODE     : UInt2 := 0;
      B_INV       : Boolean := False;
      A_INV       : Boolean := False;
      PH_CORRECT  : Boolean := False;
      EN          : Boolean := False;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Writers,
           Async_Readers,
           Object_Size => 32;
   for CSR_Register use record
      PH_ADV      at 0 range 7 .. 7;
      PH_RET      at 0 range 6 .. 6;
      DIVMODE     at 0 range 4 .. 5;
      B_INV       at 0 range 3 .. 3;
      A_INV       at 0 range 2 .. 2;
      PH_CORRECT  at 0 range 1 .. 1;
      EN          at 0 range 0 .. 0;
   end record;

   type DIV_Register is record
      INT  : UInt8 := 1;
      FRAC : UInt4 := 0;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Object_Size => 32;
   for DIV_Register use record
      INT   at 0 range 4 .. 11;
      FRAC  at 0 range 0 .. 3;
   end record;

   type CC_Register is record
      B : UInt16 := 0;
      A : UInt16 := 0;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Object_Size => 32;
   for CC_Register use record
      B at 0 range 16 .. 31;
      A at 0 range 0 .. 15;
   end record;

   type PWM_Slice_Register is record
      CSR : CSR_Register;
      DIV : DIV_Register;
      CTR : UInt16 := 16#0000#;
      CC  : CC_Register;
      TOP : UInt16 := 16#FFFF#;
   end record
      with Volatile,
           Object_Size => 160;

   for PWM_Slice_Register use record
      CSR at 16#00# range 0 .. 31;
      DIV at 16#04# range 0 .. 31;
      CTR at 16#08# range 0 .. 15;
      CC  at 16#0C# range 0 .. 31;
      TOP at 16#10# range 0 .. 15;
   end record;

   type PWM_Slices is array (PWM_Slice) of PWM_Slice_Register
      with Volatile,
           Component_Size => 160;

   pragma Warnings (Off, "16 bits of ""*"" unused");
   type IRQ_Register is record
      INTE : PWM_Slice_Array;
      INTF : PWM_Slice_Array;
      INTS : PWM_Slice_Array;
   end record
      with Volatile, Object_Size => 96;
   for IRQ_Register use record
      INTE at 0 range 0 .. 11;
      INTF at 4 range 0 .. 11;
      INTS at 8 range 0 .. 11;
   end record;

   type IRQ_Array is array (PWM_IRQ) of IRQ_Register
      with Volatile, Component_Size => 96;

   type PWM_Peripheral is record
      CH    : PWM_Slices;
      EN    : PWM_Slice_Array;
      INTR  : PWM_Slice_Array;
      IRQ   : IRQ_Array;
   end record
      with Volatile;
   for PWM_Peripheral use record
      CH    at 16#000# range 0 .. 1919;
      EN    at 16#0F0# range 0 .. 31;
      INTR  at 16#0F4# range 0 .. 31;
      IRQ   at 16#0F8# range 0 .. 191;
   end record;
   pragma Warnings (On, "16 bits of ""*"" unused");

   PWM_Periph : aliased PWM_Peripheral
      with Import, Address => System'To_Address (16#400A_8000#);

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

   procedure Initialize is
      use RP.Reset;
   begin
      RP.Clock.Enable_PERI;
      Reset_Peripheral (Reset_PWM);
      PWM_Periph.EN := (others => False);
      for Slice in PWM_Periph.CH'Range loop
         PWM_Periph.CH (Slice) := (others => <>);
      end loop;
      Initialized := True;
   end Initialize;

   function To_PWM
      (GPIO : RP.GPIO.GPIO_Point)
      return PWM_Point
   is
      Pin      : constant UInt32 := UInt32 (GPIO.Pin);
      Channel  : constant UInt32 := Pin and 1;
      Slice    : UInt32 := Shift_Right (Pin, 1);
   begin
      if Pin < 32 then
         Slice := Pin and 2#111#;
      else
         Slice := 8 + (Pin and 2#11#);
      end if;
      return PWM_Point'
         (Slice   => PWM_Slice (Slice),
          Channel => PWM_Channel'Val (Natural (Channel)));
   end To_PWM;

   procedure Enable
      (Slice : PWM_Slice)
   is
   begin
      PWM_Periph.EN (Slice) := True;
   end Enable;

   procedure Disable
      (Slice : PWM_Slice)
   is
   begin
      PWM_Periph.EN (Slice) := False;
   end Disable;

   procedure Enable
      (Slices : PWM_Slice_Array)
   is
      Val : PWM_Slice_Array := PWM_Periph.EN;
   begin
      for S in Slices'Range loop
         if Slices (S) then
            Val (S) := True;
         end if;
      end loop;
      PWM_Periph.EN := Val;
   end Enable;

   procedure Disable
      (Slices : PWM_Slice_Array)
   is
      Val : PWM_Slice_Array := PWM_Periph.EN;
   begin
      for S in Slices'Range loop
         if Slices (S) then
            Val (S) := False;
         end if;
      end loop;
      PWM_Periph.EN := Val;
   end Disable;

   function Enabled
      (Slice : PWM_Slice)
      return Boolean
   is (PWM_Periph.EN (Slice));

   procedure Set_Mode
      (Slice : PWM_Slice;
       Mode  : PWM_Divider_Mode)
   is
   begin
      PWM_Periph.CH (Slice).CSR.DIVMODE := UInt2
         (PWM_Divider_Mode'Enum_Rep (Mode));
   end Set_Mode;

   procedure Set_Interval
      (Slice  : PWM_Slice;
       Clocks : Period)
   is
   begin
      PWM_Periph.CH (Slice).TOP := Clocks;
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
   begin
      PWM_Periph.CH (Slice).DIV :=
         (INT  => Div_Integer (Div),
          FRAC => Div_Fraction (Div));
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
   is (PWM_Periph.CH (Slice).CTR);

   procedure Set_Count
      (Slice : PWM_Slice;
       Value : Period)
   is
   begin
      PWM_Periph.CH (Slice).CTR := Value;
   end Set_Count;

   function Compare_Reg_Address
      (Slice : PWM_Slice)
      return System.Address
   is (PWM_Periph.CH (Slice).CC'Address);

   procedure Enable_Interrupt
      (Slice : PWM_Slice;
       IRQ   : PWM_IRQ := 0)
   is
   begin
      PWM_Periph.IRQ (IRQ).INTE (Slice) := True;
   end Enable_Interrupt;

   procedure Disable_Interrupt
      (Slice : PWM_Slice;
       IRQ   : PWM_IRQ := 0)
   is
   begin
      PWM_Periph.IRQ (IRQ).INTE (Slice) := False;
   end Disable_Interrupt;

   procedure Acknowledge_Interrupt
      (Slice : PWM_Slice)
   is
   begin
      PWM_Periph.INTR (Slice) := True;
   end Acknowledge_Interrupt;
end RP.PWM;
