--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--

with RP2040_SVD.IO_BANK0;   use RP2040_SVD.IO_BANK0;
with RP2040_SVD.PADS_BANK0; use RP2040_SVD.PADS_BANK0;
with RP2040_SVD;            use RP2040_SVD;
with HAL;                   use HAL;
with HAL.GPIO;
with System;

package RP.GPIO is
   subtype GPIO_Pin is Natural range 0 .. 29;
   type GPIO_Point (Pin : GPIO_Pin) is new HAL.GPIO.GPIO_Point with
      null record;

   type GPIO_Function is
      (SPI, UART, I2C, PWM, SIO, PIO_0, PIO_1, CLOCK, USB, None);

   for GPIO_Function use
      (SPI   => 1,
       UART  => 2,
       I2C   => 3,
       PWM   => 4,
       SIO   => 5,
       PIO_0 => 6,
       PIO_1 => 7,
       CLOCK => 8,
       USB   => 9,
       None  => 31);

   type Interrupt_Triggers is (Rising_Edge, Falling_Edge, High_Level, Low_Level);
   type Interrupt_Procedure is access procedure;

   procedure Enable;

   procedure Configure
      (This : in out GPIO_Point;
       Mode : HAL.GPIO.GPIO_Config_Mode;
       Pull : HAL.GPIO.GPIO_Pull_Resistor := HAL.GPIO.Floating;
       Func : GPIO_Function := SIO);

   procedure Set_Interrupt_Handler
      (This    : in out GPIO_Point;
       Handler : Interrupt_Procedure);

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

   GPIO_Interrupts : array (GPIO_Pin) of Interrupt_Procedure := (others => null);

   procedure SIO_IRQ_PROC0_Handler
      with Export => True,
           Convention => C,
           External_Name => "isr_irq14";

   subtype GPIO_Pin_Mask is UInt30;

   function Pin_Mask (Pin : GPIO_Pin)
      return GPIO_Pin_Mask;

   type GPIO_CTRL_Register is record
      FUNCSEL : GPIO_Function := None;
      OUTOVER : GPIO0_CTRL_OUTOVER_Field := NORMAL;
      OEOVER  : GPIO0_CTRL_OEOVER_Field := NORMAL;
      INOVER  : GPIO0_CTRL_INOVER_Field := NORMAL;
      IRQOVER : GPIO0_CTRL_IRQOVER_Field := NORMAL;
   end record
      with Size      => 32,
           Bit_Order => System.Low_Order_First,
           Volatile_Full_Access;

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
      with Bit_Order => System.Low_Order_First,
           Size => 64;

   for GPIO_Register use record
      STATUS at 0 range 0 .. 31;
      CTRL   at 4 range 0 .. 31;
   end record;

   type INT_Register is record
      LEVEL_LOW_0  : Boolean := False;
      LEVEL_HIGH_0 : Boolean := False;
      EDGE_LOW_0   : Boolean := False;
      EDGE_HIGH_0  : Boolean := False;
      LEVEL_LOW_1  : Boolean := False;
      LEVEL_HIGH_1 : Boolean := False;
      EDGE_LOW_1   : Boolean := False;
      EDGE_HIGH_1  : Boolean := False;
   end record
      with Size      => 8,
           Bit_Order => System.Low_Order_First,
           Volatile_Full_Access;

   for INT_Register use record
      LEVEL_LOW_0  at 0 range 0 .. 0;
      LEVEL_HIGH_0 at 0 range 1 .. 1;
      EDGE_LOW_0   at 0 range 2 .. 2;
      EDGE_HIGH_0  at 0 range 3 .. 3;
      LEVEL_LOW_1  at 0 range 4 .. 4;
      LEVEL_HIGH_1 at 0 range 5 .. 5;
      EDGE_LOW_1   at 0 range 6 .. 6;
      EDGE_HIGH_1  at 0 range 7 .. 7;
   end record;

   type GPIO_Registers is array (GPIO_Pin) of GPIO_Register;
   type INT_Registers is array (0 .. GPIO_Pin'Last / 2) of INT_Register;

   type IO_BANK is record
      GPIO              : aliased GPIO_Registers;
      INTR              : aliased INT_Registers;
      PROC0_INTE        : aliased INT_Registers;
      PROC0_INTF        : aliased INT_Registers;
      PROC1_INTE        : aliased INT_Registers;
      PROC1_INTF        : aliased INT_Registers;
      DORMANT_WAKE_INTE : aliased INT_Registers;
      DORMANT_WAKE_INTF : aliased INT_Registers;
   end record;

   type PADS_BANK_GPIO_Registers is array (GPIO_Pin) of RP2040_SVD.PADS_BANK0.GPIO_Register;

   type PADS_BANK is record
      VOLTAGE_SELECT : aliased VOLTAGE_SELECT_Register;
      GPIO           : aliased PADS_BANK_GPIO_Registers;
      SWCLK          : aliased SWCLK_Register;
      SWD            : aliased SWD_Register;
   end record;

   IO_BANK_Periph : aliased IO_BANK
      with Import, Address => IO_BANK0_Base;
   PADS_BANK_Periph : aliased PADS_BANK
      with Import, Address => PADS_BANK0_Base;
end RP.GPIO;
