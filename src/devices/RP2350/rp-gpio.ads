--
--  Copyright 2021-2026 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with Rp2040_Hal_Config;
with HAL.GPIO;
with HAL;

package RP.GPIO
   with Preelaborate
is

   ---------------------------
   --  Low level interface  --
   ---------------------------

   type GPIO_Pin is range 0 .. Rp2040_Hal_Config.GPIO_Pin_Count - 1;

   type GPIO_Function is range 0 .. 11;
   type GPIO_Drive is range 0 .. 4;

   --  After reset, all input and output buffers are disabled, output level is
   --  low, isolation latches are enabled

   procedure Isolate
      (Pin     : GPIO_Pin;
       Isolate : Boolean);

   procedure Drive
      (Pin     : GPIO_Pin;
       Current : GPIO_Drive := 1);

   procedure Func
      (Pin  : GPIO_Pin;
       Func : GPIO_Function);

   procedure Pull
      (Pin  : GPIO_Pin;
       Up   : Boolean := False;
       Down : Boolean := False);
   --  Enable pull resistors.
   --  Enabling both Up and Down simultaneously sets Bus Keeper Mode (9.6.1)

   procedure Output_Enable
      (Pin    : GPIO_Pin;
       Enable : Boolean := True);
   --  Enable the output buffer

   procedure Set
      (Pin  : GPIO_Pin;
       High : Boolean := True);
   --  Set the output level

   procedure Input_Enable
      (Pin    : GPIO_Pin;
       Enable : Boolean := True);
   --  Enable the input buffer

   procedure Get
      (Pin  : GPIO_Pin;
       High : out Boolean);
   --  Get the input level

   HI_Z  : constant GPIO_Function := 0;
   HSTX  : constant GPIO_Function := 0;
   SPI   : constant GPIO_Function := 1;
   UART  : constant GPIO_Function := 2;
   I2C   : constant GPIO_Function := 3;
   PWM   : constant GPIO_Function := 4;
   SIO   : constant GPIO_Function := 5;
   PIO0  : constant GPIO_Function := 6;
   PIO1  : constant GPIO_Function := 7;
   PIO2  : constant GPIO_Function := 8;
   CLK   : constant GPIO_Function := 9;
   USB   : constant GPIO_Function := 10;
   UARTN : constant GPIO_Function := 11;

   Off         : constant GPIO_Drive := 0;
   Drive_2mA   : constant GPIO_Drive := 1;
   Drive_4mA   : constant GPIO_Drive := 2;
   Drive_8mA   : constant GPIO_Drive := 3;
   Drive_12mA  : constant GPIO_Drive := 4;

   subtype ADC_Pin is GPIO_Pin
      with Static_Predicate => ADC_Pin in 26 .. 29 or ADC_Pin in 40 .. 47;

   ----------------------------
   --  High level interface  --
   ----------------------------

   type GPIO_Point is new HAL.GPIO.GPIO_Point with record
      Pin : GPIO_Pin;
   end record;

   type GPIO_Config_Mode is (Input, Output, Analog);
   type GPIO_Pull_Mode is (Floating, Pull_Up, Pull_Down, Pull_Both);

   procedure Configure
      (This       : GPIO_Point;
       Mode       : GPIO_Config_Mode;
       Pull       : GPIO_Pull_Mode := Floating;
       Func       : GPIO_Function := SIO;
       Schmitt    : Boolean := False;
       Slew_Fast  : Boolean := False;
       Drive      : GPIO_Drive := Drive_2mA);

   overriding
   function Support
      (This : GPIO_Point;
       Capa : HAL.GPIO.Capability)
       return Boolean;

   overriding
   function Mode
      (This : GPIO_Point)
      return HAL.GPIO.GPIO_Mode;

   overriding
   procedure Set_Mode
      (This : in out GPIO_Point;
       Mode : HAL.GPIO.GPIO_Config_Mode);

   overriding
   function Pull_Resistor
      (This : GPIO_Point)
      return HAL.GPIO.GPIO_Pull_Resistor;

   overriding
   procedure Set_Pull_Resistor
      (This : in out GPIO_Point;
       Pull : HAL.GPIO.GPIO_Pull_Resistor);

   overriding
   function Set
      (This : GPIO_Point)
      return Boolean;

   function Get
      (This : GPIO_Point)
      return Boolean
   renames Set;

   overriding
   procedure Set
      (This : in out GPIO_Point);

   overriding
   procedure Clear
      (This : in out GPIO_Point);

   overriding
   procedure Toggle
      (This : in out GPIO_Point);

end RP.GPIO;
