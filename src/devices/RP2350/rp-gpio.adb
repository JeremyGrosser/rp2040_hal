--
--  Copyright 2021-2026 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with System;
with HAL; use HAL;

package body RP.GPIO is

   type IO_Register is record
      STATUS : UInt32 := 0;
      CTRL   : UInt32 := 16#0000_001F#;
   end record
      with Volatile, Object_Size => 64;
   for IO_Register use record
      STATUS at 0 range 0 .. 31;
      CTRL   at 4 range 0 .. 31;
   end record;

   type IO_Array is array (GPIO_Pin) of IO_Register
      with Volatile, Component_Size => 64;

   type IRQ_Register is array (Interrupt.Interrupt_Trigger) of Boolean
      with Component_Size => 1, Size => 4;

   type IRQ_Array is array (0 .. 7) of IRQ_Register
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Component_Size => 4,
           Object_Size => 32;

   type IRQ_Group is array (0 .. 5) of IRQ_Array
      with Volatile, Component_Size => 32, Object_Size => 192;

   type IRQ_PROC_Register is record
      INTE : IRQ_Group;
      INTF : IRQ_Group;
      INTS : IRQ_Group;
   end record
      with Volatile, Size => 576;
   for IRQ_PROC_Register use record
      INTE at 16#00# range 0 .. 191;
      INTF at 16#18# range 0 .. 191;
      INTS at 16#30# range 0 .. 191;
   end record;

   type IRQ_PROC_Group is array (Interrupt.Interrupt_CPU) of IRQ_PROC_Register
      with Volatile, Component_Size => 576;

   type IO_BANK_Peripheral is record
      GPIO           : IO_Array;
      INTR           : IRQ_Group;
      PROC           : IRQ_PROC_Group;
      DORMANT_WAKE   : IRQ_Group;
   end record
      with Volatile;
   for IO_BANK_Peripheral use record
      GPIO           at 16#000# range 0 .. 3071;
      INTR           at 16#230# range 0 .. 191;
      PROC           at 16#248# range 0 .. 1151;
      DORMANT_WAKE   at 16#2D8# range 0 .. 191;
   end record;

   type PAD_Register is record
      ISO      : Boolean := True;
      OD       : Boolean := False;
      IE       : Boolean := False;
      DRIVE    : UInt2 := 1;
      PUE      : Boolean := False;
      PDE      : Boolean := True;
      SCHMITT  : Boolean := True;
      SLEWFAST : Boolean := False;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Object_Size => 32;
   for PAD_Register use record
      ISO      at 0 range 8 .. 8;
      OD       at 0 range 7 .. 7;
      IE       at 0 range 6 .. 6;
      DRIVE    at 0 range 4 .. 5;
      PUE      at 0 range 3 .. 3;
      PDE      at 0 range 2 .. 2;
      SCHMITT  at 0 range 1 .. 1;
      SLEWFAST at 0 range 0 .. 0;
   end record;

   type PAD_Array is array (GPIO_Pin) of PAD_Register
      with Volatile, Component_Size => 32;

   type PADS_BANK_Peripheral is record
      VOLTAGE_SELECT : UInt32 := 0;
      GPIO           : PAD_Array;
   end record
      with Volatile;
   for PADS_BANK_Peripheral use record
      VOLTAGE_SELECT at 0 range 0 .. 31;
      GPIO           at 4 range 0 .. 1535;
   end record;

   type SIO_Array is array (GPIO_Pin) of Boolean
      with Volatile,
           Component_Size => 1,
           Object_Size => 32;

   type SIO_Peripheral is record
      GPIO_IN        : SIO_Array;
      GPIO_OUT       : SIO_Array;
      GPIO_OUT_SET   : SIO_Array;
      GPIO_OUT_CLR   : SIO_Array;
      GPIO_OUT_XOR   : SIO_Array;
      GPIO_OE        : SIO_Array;
      GPIO_OE_SET    : SIO_Array;
      GPIO_OE_CLR    : SIO_Array;
      GPIO_OE_XOR    : SIO_Array;
   end record
      with Volatile;
   for SIO_Peripheral use record
      GPIO_IN        at 16#004# range 0 .. 63;
      GPIO_OUT       at 16#010# range 0 .. 63;
      GPIO_OUT_SET   at 16#018# range 0 .. 63;
      GPIO_OUT_CLR   at 16#020# range 0 .. 63;
      GPIO_OUT_XOR   at 16#028# range 0 .. 63;
      GPIO_OE        at 16#030# range 0 .. 63;
      GPIO_OE_SET    at 16#038# range 0 .. 63;
      GPIO_OE_CLR    at 16#040# range 0 .. 63;
      GPIO_OE_XOR    at 16#048# range 0 .. 63;
   end record;

   IO_BANK : IO_BANK_Peripheral
      with Import, Address => System'To_Address (16#4002_8000#);
   PADS_BANK : PADS_BANK_Peripheral
      with Import, Address => System'To_Address (16#4003_8000#);
   SIO_BANK : SIO_Peripheral
      with Import, Address => System'To_Address (16#D000_0000#);

   procedure Isolate
      (Pin     : GPIO_Pin;
       Isolate : Boolean)
   is
   begin
      PADS_BANK.GPIO (Pin).ISO := Isolate;
   end Isolate;

   procedure Drive
      (Pin     : GPIO_Pin;
       Current : GPIO_Drive := 1)
   is
   begin
      if Current = 0 then
         PADS_BANK.GPIO (Pin).OD := True;
      else
         PADS_BANK.GPIO (Pin).DRIVE := UInt2 (Current - 1);
         PADS_BANK.GPIO (Pin).OD := False;
      end if;
   end Drive;

   procedure Func
      (Pin  : GPIO_Pin;
       Func : GPIO_Function)
   is
   begin
      IO_BANK.GPIO (Pin).CTRL := UInt32 (Func);
   end Func;

   procedure Pull
      (Pin  : GPIO_Pin;
       Up   : Boolean := False;
       Down : Boolean := False)
   is
   begin
      PADS_BANK.GPIO (Pin).PUE := Up;
      PADS_BANK.GPIO (Pin).PDE := Down;
   end Pull;

   procedure Output_Enable
      (Pin    : GPIO_Pin;
       Enable : Boolean := True)
   is
   begin
      if Enable then
         SIO_BANK.GPIO_OE_SET (Pin) := True;
      else
         SIO_BANK.GPIO_OE_CLR (Pin) := True;
      end if;
   end Output_Enable;

   procedure Set
      (Pin  : GPIO_Pin;
       High : Boolean := True)
   is
   begin
      if High then
         SIO_BANK.GPIO_OUT_SET (Pin) := True;
      else
         SIO_BANK.GPIO_OUT_CLR (Pin) := True;
      end if;
   end Set;

   procedure Input_Enable
      (Pin    : GPIO_Pin;
       Enable : Boolean := True)
   is
   begin
      PADS_BANK.GPIO (Pin).IE := Enable;
   end Input_Enable;

   procedure Get
      (Pin  : GPIO_Pin;
       High : out Boolean)
   is
   begin
      High := SIO_BANK.GPIO_IN (Pin);
   end Get;

   package body Interrupt is
      procedure Enable
         (Pin     : GPIO_Pin;
          Trigger : Interrupt_Trigger;
          CPU     : Interrupt_CPU := 1)
      is
         Group : constant Natural := Natural (Pin) / 8;
         Index : constant Natural := Natural (Pin) mod 8;
      begin
         IO_BANK.PROC (CPU).INTE (Group) (Index) (Trigger) := True;
      end Enable;

      procedure Disable
         (Pin     : GPIO_Pin;
          Trigger : Interrupt_Trigger;
          CPU     : Interrupt_CPU := 1)
      is
         Group : constant Natural := Natural (Pin) / 8;
         Index : constant Natural := Natural (Pin) mod 8;
      begin
         IO_BANK.PROC (CPU).INTE (Group) (Index) (Trigger) := False;
      end Disable;

      procedure Acknowledge
         (Pin     : GPIO_Pin;
          Trigger : Edge_Trigger)
      is
         Group : constant Natural := Natural (Pin) / 8;
         Index : constant Natural := Natural (Pin) mod 8;
      begin
         IO_BANK.INTR (Group) (Index) (Trigger) := True;
      end Acknowledge;

      procedure Force
         (Pin     : GPIO_Pin;
          Forced  : Boolean;
          Trigger : Interrupt_Trigger;
          CPU     : Interrupt_CPU := 1)
      is
         Group : constant Natural := Natural (Pin) / 8;
         Index : constant Natural := Natural (Pin) mod 8;
      begin
         IO_BANK.PROC (CPU).INTF (Group) (Index) (Trigger) := Forced;
      end Force;

      procedure Enable_Wake
         (Pin     : GPIO_Pin;
          Trigger : Interrupt_Trigger)
      is
         Group : constant Natural := Natural (Pin) / 8;
         Index : constant Natural := Natural (Pin) mod 8;
      begin
         IO_BANK.DORMANT_WAKE (Group) (Index) (Trigger) := True;
      end Enable_Wake;

      procedure Disable_Wake
         (Pin     : GPIO_Pin;
          Trigger : Interrupt_Trigger)
      is
         Group : constant Natural := Natural (Pin) / 8;
         Index : constant Natural := Natural (Pin) mod 8;
      begin
         IO_BANK.DORMANT_WAKE (Group) (Index) (Trigger) := False;
      end Disable_Wake;

      function Triggered
         (Pin     : GPIO_Pin;
          Trigger : Interrupt_Trigger)
          return Boolean
      is
         Group : constant Natural := Natural (Pin) / 8;
         Index : constant Natural := Natural (Pin) mod 8;
      begin
         return IO_BANK.INTR (Group) (Index) (Trigger);
      end Triggered;
   end Interrupt;

   procedure Configure
      (This       : GPIO_Point;
       Mode       : GPIO_Config_Mode;
       Pull       : GPIO_Pull_Mode := Floating;
       Func       : GPIO_Function := SIO;
       Schmitt    : Boolean := False;
       Slew_Fast  : Boolean := False;
       Drive      : GPIO_Drive := Drive_2mA)
   is
   begin
      case Mode is
         when Output =>
            SIO_BANK.GPIO_OE_SET (This.Pin) := True;
            IO_BANK.GPIO (This.Pin).CTRL := UInt32 (Func);
            PADS_BANK.GPIO (This.Pin) :=
               (ISO        => False,
                OD         => False,
                IE         => False,
                DRIVE      => UInt2 (Drive - 1),
                PUE        => (Pull = Pull_Up or else Pull = Pull_Both),
                PDE        => (Pull = Pull_Down or else Pull = Pull_Both),
                SCHMITT    => Schmitt,
                SLEWFAST   => Slew_Fast);
         when Input =>
            SIO_BANK.GPIO_OE_CLR (This.Pin) := True;
            IO_BANK.GPIO (This.Pin).CTRL := UInt32 (Func);
            PADS_BANK.GPIO (This.Pin) :=
               (ISO        => False,
                OD         => False,
                IE         => True,
                DRIVE      => 0,
                PUE        => (Pull = Pull_Up or else Pull = Pull_Both),
                PDE        => (Pull = Pull_Down or else Pull = Pull_Both),
                SCHMITT    => Schmitt,
                SLEWFAST   => Slew_Fast);
         when Analog =>
            SIO_BANK.GPIO_OE_CLR (This.Pin) := True;
            IO_BANK.GPIO (This.Pin).CTRL := 0;
            PADS_BANK.GPIO (This.Pin) :=
               (ISO        => False,
                OD         => True,
                IE         => False,
                DRIVE      => 0,
                PUE        => False,
                PDE        => False,
                SCHMITT    => False,
                SLEWFAST   => False);
      end case;
   end Configure;

   overriding
   function Support
      (This : GPIO_Point;
       Capa : HAL.GPIO.Capability)
       return Boolean
   is (True);

   overriding
   function Mode
      (This : GPIO_Point)
      return HAL.GPIO.GPIO_Mode
   is
   begin
      if IO_BANK.GPIO (This.Pin).CTRL /= UInt32 (SIO) then
         return HAL.GPIO.Unknown_Mode;
      end if;

      if SIO_BANK.GPIO_OE (This.Pin) then
         return HAL.GPIO.Output;
      else
         return HAL.GPIO.Input;
      end if;
   end Mode;

   overriding
   procedure Set_Mode
      (This : in out GPIO_Point;
       Mode : HAL.GPIO.GPIO_Config_Mode)
   is
      use type HAL.GPIO.GPIO_Config_Mode;
   begin
      IO_BANK.GPIO (This.Pin).CTRL := UInt32 (SIO);
      PADS_BANK.GPIO (This.Pin).OD := Mode = HAL.GPIO.Input;
      PADS_BANK.GPIO (This.Pin).IE := Mode = HAL.GPIO.Input;
      SIO_BANK.GPIO_OE (This.Pin) := Mode = HAL.GPIO.Output;
   end Set_Mode;

   overriding
   function Pull_Resistor
      (This : GPIO_Point)
      return HAL.GPIO.GPIO_Pull_Resistor
   is
      Pad : constant PAD_Register := PADS_BANK.GPIO (This.Pin);
   begin
      if Pad.PUE then
         return HAL.GPIO.Pull_Up;
      elsif Pad.PDE then
         return HAL.GPIO.Pull_Down;
      else
         return HAL.GPIO.Floating;
      end if;
   end Pull_Resistor;

   overriding
   procedure Set_Pull_Resistor
      (This : in out GPIO_Point;
       Pull : HAL.GPIO.GPIO_Pull_Resistor)
   is
      use type HAL.GPIO.GPIO_Pull_Resistor;
   begin
      PADS_BANK.GPIO (This.Pin).PUE := (Pull = HAL.GPIO.Pull_Up);
      PADS_BANK.GPIO (This.Pin).PDE := (Pull = HAL.GPIO.Pull_Down);
   end Set_Pull_Resistor;

   overriding
   function Set
      (This : GPIO_Point)
      return Boolean
   is (SIO_BANK.GPIO_IN (This.Pin));

   overriding
   procedure Set
      (This : in out GPIO_Point)
   is
   begin
      SIO_BANK.GPIO_OUT_SET (This.Pin) := True;
   end Set;

   overriding
   procedure Clear
      (This : in out GPIO_Point)
   is
   begin
      SIO_BANK.GPIO_OUT_CLR (This.Pin) := True;
   end Clear;

   overriding
   procedure Toggle
      (This : in out GPIO_Point)
   is
   begin
      SIO_BANK.GPIO_OUT_XOR (This.Pin) := True;
   end Toggle;

end RP.GPIO;
