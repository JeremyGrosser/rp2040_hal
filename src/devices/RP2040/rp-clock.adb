--
--  Copyright 2021-2026 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with System;

package body RP.Clock is

   type CLK_CTRL_Register is record
      NUDGE    : Boolean := False;
      PHASE    : UInt2 := 0;
      DC50     : Boolean := False;
      ENABLE   : Boolean := False;
      KILL     : Boolean := False;
      AUXSRC   : UInt4 := 0;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Size => 32;
   for CLK_CTRL_Register use record
      NUDGE    at 0 range 20 .. 20;
      PHASE    at 0 range 16 .. 17;
      DC50     at 0 range 12 .. 12;
      ENABLE   at 0 range 11 .. 11;
      KILL     at 0 range 10 .. 10;
      AUXSRC   at 0 range 5 .. 8;
   end record;

   type GPOUT_Register is record
      CTRL     : CLK_CTRL_Register;
      DIV      : GP_Divider := 1.0;
      SELECTED : UInt32 := 1;
   end record
      with Volatile, Size => 96;
   for GPOUT_Register use record
      CTRL     at 0 range 0 .. 31;
      DIV      at 4 range 0 .. 31;
      SELECTED at 8 range 0 .. 31;
   end record;

   type GPOUT_Array is array (GP_Output) of GPOUT_Register
      with Volatile, Component_Size => 96;

   type FC0_STATUS_Register is record
      DIED     : Boolean := False;
      FAST     : Boolean := False;
      SLOW     : Boolean := False;
      FAIL     : Boolean := False;
      WAITING  : Boolean := False;
      RUNNING  : Boolean := False;
      DONE     : Boolean := False;
      PASS     : Boolean := False;
   end record
      with Volatile_Full_Access,
           Async_Writers,
           Size => 32;
   for FC0_STATUS_Register use record
      DIED     at 0 range 28 .. 28;
      FAST     at 0 range 24 .. 24;
      SLOW     at 0 range 20 .. 20;
      FAIL     at 0 range 16 .. 16;
      WAITING  at 0 range 12 .. 12;
      RUNNING  at 0 range 8 .. 8;
      DONE     at 0 range 4 .. 4;
      PASS     at 0 range 0 .. 0;
   end record;

   type FC0_RESULT_Register is record
      KHZ   : UInt25 := 0;
      FRAC  : UInt5 := 0;
   end record
      with Volatile_Full_Access,
           Async_Writers,
           Size => 32;
   for FC0_RESULT_Register use record
      KHZ   at 0 range 5 .. 29;
      FRAC  at 0 range 0 .. 4;
   end record;

   type CLOCKS_Peripheral is record
      GPOUT          : GPOUT_Array;
      CLK_PERI_CTRL  : CLK_CTRL_Register;
      CLK_ADC_CTRL   : CLK_CTRL_Register;
      CLK_RTC_CTRL   : CLK_CTRL_Register;
      FC0_INTERVAL   : UInt32;
      FC0_SRC        : FC_Source;
      FC0_STATUS     : FC0_STATUS_Register;
      FC0_RESULT     : FC0_RESULT_Register;
   end record
      with Volatile;
   for CLOCKS_Peripheral use record
      GPOUT          at 16#00# range 0 .. 383;
      CLK_PERI_CTRL  at 16#48# range 0 .. 31;
      CLK_ADC_CTRL   at 16#60# range 0 .. 31;
      CLK_RTC_CTRL   at 16#6C# range 0 .. 31;
      FC0_INTERVAL   at 16#90# range 0 .. 31;
      FC0_SRC        at 16#94# range 0 .. 31;
      FC0_STATUS     at 16#98# range 0 .. 31;
      FC0_RESULT     at 16#9C# range 0 .. 31;
   end record;

   CLOCKS : CLOCKS_Peripheral
      with Import, Address => System'To_Address (16#4001_0000#);

   procedure Set_Divider
      (GP  : GP_Output;
       Div : GP_Divider)
   is
   begin
      CLOCKS.GPOUT (GP).DIV := Div;
   end Set_Divider;

   procedure Set_Source
      (GP     : GP_Output;
       Source : GP_Source)
   is
   begin
      CLOCKS.GPOUT (GP).CTRL.AUXSRC := UInt4 (GP_Source'Pos (Source) - 1);
   end Set_Source;

   procedure Enable
      (CID : GP_Output)
   is
   begin
      CLOCKS.GPOUT (CID).CTRL.ENABLE := True;
   end Enable;

   procedure Disable
      (CID : GP_Output)
   is
   begin
      CLOCKS.GPOUT (CID).CTRL.ENABLE := False;
   end Disable;

   function Enabled
      (CID : GP_Output)
      return Boolean
   is (CLOCKS.GPOUT (CID).CTRL.ENABLE);

   function Frequency
      (CID      : FC_Source;
       Rounded  : Boolean := True;
       Accuracy : UInt4 := 15)
       return Hertz
   is
   begin
      CLOCKS.FC0_INTERVAL := UInt32 (Accuracy);
      CLOCKS.FC0_SRC := CID;
      loop
         exit when CLOCKS.FC0_STATUS.DONE;
      end loop;

      if CLOCKS.FC0_STATUS.DIED then
         return 0;
      else
         declare
            Result : constant FC0_RESULT_Register := CLOCKS.FC0_RESULT;
            F : Hertz := Hertz (Result.KHZ) * 1_000;
         begin
            if not Rounded then
               F := F + ((Hertz (Result.FRAC) * 3125) / 100);
            end if;
            return F;
         end;
      end if;
   end Frequency;

   procedure Enable_ADC is
   begin
      CLOCKS.CLK_ADC_CTRL :=
         (NUDGE   => False,
          PHASE   => 0,
          DC50    => False,
          ENABLE  => True,
          KILL    => False,
          AUXSRC  => 0); --  PLL_USB
   end Enable_ADC;

   procedure Enable_PERI is
   begin
      CLOCKS.CLK_PERI_CTRL :=
         (NUDGE   => False,
          PHASE   => 0,
          DC50    => False,
          ENABLE  => True,
          KILL    => False,
          AUXSRC  => 0); --  SYS
   end Enable_PERI;

   procedure Enable_RTC is
   begin
      CLOCKS.CLK_RTC_CTRL :=
         (NUDGE   => False,
          PHASE   => 0,
          DC50    => False,
          ENABLE  => True,
          KILL    => False,
          AUXSRC  => 1); --  PLL_SYS
   end Enable_RTC;

end RP.Clock;
