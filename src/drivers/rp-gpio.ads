--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--

with RP2040_SVD.IO_BANK0;   use RP2040_SVD.IO_BANK0;
with RP2040_SVD.PADS_BANK0; use RP2040_SVD.PADS_BANK0;
with RP2040_SVD;            use RP2040_SVD;
with HAL;                   use HAL;
with HAL.GPIO;              use HAL.GPIO;

package RP.GPIO
   with Preelaborate
is
   type GPIO_Pin is range 0 .. 29;
   subtype ADC_Pin is GPIO_Pin range 26 .. 29;

   type GPIO_Point is new HAL.GPIO.GPIO_Point with
      record
         Pin : GPIO_Pin;
      end record;

   type GPIO_Config_Mode is (Input, Output, Analog);

   type GPIO_Function is
      (SPI, UART, I2C, PWM, SIO, PIO0, PIO1, CLOCK, USB, HI_Z);

   type GPIO_Pull_Mode is (Floating, Pull_Up, Pull_Down, Pull_Both);

   type GPIO_Drive is (Drive_2mA, Drive_4mA, Drive_8mA, Drive_12mA);

   for GPIO_Function use
      (SPI   => 1,
       UART  => 2,
       I2C   => 3,
       PWM   => 4,
       SIO   => 5,
       PIO0  => 6,
       PIO1  => 7,
       CLOCK => 8,
       USB   => 9,
       HI_Z  => 31);

   type Interrupt_Triggers is (Low_Level, High_Level, Falling_Edge, Rising_Edge)
      with Size => 4;
   for Interrupt_Triggers use
      (Low_Level    => 2#0001#,
       High_Level   => 2#0010#,
       Falling_Edge => 2#0100#,
       Rising_Edge  => 2#1000#);

   procedure Enable;

   function Enabled return Boolean;

   procedure Configure
      (This      : in out GPIO_Point;
       Mode      : GPIO_Config_Mode;
       Pull      : GPIO_Pull_Mode := Floating;
       Func      : GPIO_Function := SIO;
       Schmitt   : Boolean := False;
       Slew_Fast : Boolean := False;
       Drive     : GPIO_Drive := Drive_4mA);
   --  In Analog mode, Pull and Func are ignored and set to Floating and HI_Z

   function Get
      (This : GPIO_Point)
      return Boolean
   with Pre => This.Mode = HAL.GPIO.Input;

   procedure Enable_Interrupt
      (This    : in out GPIO_Point;
       Trigger : Interrupt_Triggers);

   procedure Disable_Interrupt
      (This    : in out GPIO_Point;
       Trigger : Interrupt_Triggers);

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

   overriding
   procedure Set
      (This : in out GPIO_Point);

   overriding
   procedure Clear
      (This : in out GPIO_Point);

   overriding
   procedure Toggle
      (This : in out GPIO_Point);

private

   GPIO_Enabled : Boolean := False;

   subtype GPIO_Pin_Mask is UInt30;

   function Pin_Mask (Pin : GPIO_Pin)
      return GPIO_Pin_Mask;

   type GPIO_CTRL_Register is record
      FUNCSEL : GPIO_Function := HI_Z;
      OUTOVER : GPIO0_CTRL_OUTOVER_Field := NORMAL;
      OEOVER  : GPIO0_CTRL_OEOVER_Field := NORMAL;
      INOVER  : GPIO0_CTRL_INOVER_Field := NORMAL;
      IRQOVER : GPIO0_CTRL_IRQOVER_Field := NORMAL;
   end record
      with Volatile_Full_Access, Size => 32;

   for GPIO_CTRL_Register use record
      FUNCSEL at 0 range 0 .. 4;
      OUTOVER at 0 range 8 .. 9;
      OEOVER  at 0 range 12 .. 13;
      INOVER  at 0 range 16 .. 17;
      IRQOVER at 0 range 28 .. 29;
   end record;

   --  The svd2ada generated binding for IO_BANK doesn't use arrays,
   --  which is annoying. We partially reimplement it here.
   type GPIO_Register is record
      STATUS : aliased GPIO0_STATUS_Register;
      CTRL   : aliased GPIO_CTRL_Register;
   end record
      with Volatile, Size => 64;

   for GPIO_Register use record
      STATUS at 0 range 0 .. 31;
      CTRL   at 4 range 0 .. 31;
   end record;

   type GPIO_Registers is array (GPIO_Pin) of GPIO_Register;
   type INT_Register is array (GPIO_Pin) of UInt4
      with Size           => 120,
           Component_Size => 4;

   type IO_BANK is record
      GPIO              : aliased GPIO_Registers;
      INTR              : aliased INT_Register;
      PROC0_INTE        : aliased INT_Register;
      PROC0_INTF        : aliased INT_Register;
      PROC0_INTS        : aliased INT_Register;
      PROC1_INTE        : aliased INT_Register;
      PROC1_INTF        : aliased INT_Register;
      PROC1_INTS        : aliased INT_Register;
      DORMANT_WAKE_INTE : aliased INT_Register;
      DORMANT_WAKE_INTF : aliased INT_Register;
      DORMANT_WAKE_INTS : aliased INT_Register;
   end record
      with Volatile;
   for IO_BANK use record
      GPIO              at 16#0000# range 0 .. 1919;
      INTR              at 16#00f0# range 0 .. 119;
      PROC0_INTE        at 16#0100# range 0 .. 119;
      PROC0_INTF        at 16#0110# range 0 .. 119;
      PROC0_INTS        at 16#0120# range 0 .. 119;
      PROC1_INTE        at 16#0130# range 0 .. 119;
      PROC1_INTF        at 16#0140# range 0 .. 119;
      PROC1_INTS        at 16#0150# range 0 .. 119;
      DORMANT_WAKE_INTE at 16#0160# range 0 .. 119;
      DORMANT_WAKE_INTF at 16#0170# range 0 .. 119;
      DORMANT_WAKE_INTS at 16#0180# range 0 .. 119;
   end record;

   type PADS_BANK_GPIO_Registers is array (GPIO_Pin) of RP2040_SVD.PADS_BANK0.GPIO_Register;

   type PADS_BANK is record
      VOLTAGE_SELECT : VOLTAGE_SELECT_Register;
      GPIO           : PADS_BANK_GPIO_Registers;
      SWCLK          : SWCLK_Register;
      SWD            : SWD_Register;
   end record
      with Volatile;

   IO_BANK_Periph : aliased IO_BANK
      with Import, Address => IO_BANK0_Base;
   PADS_BANK_Periph : aliased PADS_BANK
      with Import, Address => PADS_BANK0_Base;
end RP.GPIO;
