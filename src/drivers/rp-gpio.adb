--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--

with RP2040_SVD.SIO; use RP2040_SVD.SIO;
with RP.Reset;

package body RP.GPIO is
   function Pin_Mask (Pin : GPIO_Pin)
      return GPIO_Pin_Mask
   is (GPIO_Pin_Mask (Shift_Left (UInt32 (1), GPIO_Pin'Pos (Pin))));

   procedure Enable is
      use RP.Reset;
   begin
      Reset_Peripheral (Reset_IO_BANK0);
      Reset_Peripheral (Reset_PADS_BANK0);

      --  Errata RP2040-E6
      --
      --  GPIO26-29 are shared with ADC inputs AIN0-3. The GPIO digital input
      --  is enabled after RUN is released. If the pins are connected to an
      --  analogue signal to measure, there could be unexpected signal levels
      --  on these pads. This is unlikely to cause a problem as the digital
      --  inputs have hysteresis enabled by default.

      for Pin in ADC_Pin'Range loop
         PADS_BANK_Periph.GPIO (Pin).IE := False;
         PADS_BANK_Periph.GPIO (Pin).OD := True;
      end loop;

      IO_BANK_Periph.PROC0_INTE := (others => 0);
      IO_BANK_Periph.PROC1_INTE := (others => 0);

      GPIO_Enabled := True;
   end Enable;

   function Enabled
      return Boolean
   is (GPIO_Enabled);

   procedure Configure
      (This      : in out GPIO_Point;
       Mode      : GPIO_Config_Mode;
       Pull      : GPIO_Pull_Mode := Floating;
       Func      : GPIO_Function := SIO;
       Schmitt   : Boolean := False;
       Slew_Fast : Boolean := False;
       Drive     : GPIO_Drive := Drive_4mA)
   is
      Mask : constant GPIO_Pin_Mask := Pin_Mask (This.Pin);
   begin
      if not Enabled then
         Enable;
      end if;

      IO_BANK_Periph.GPIO (This.Pin).CTRL :=
         (FUNCSEL => Func,
          others  => <>);

      case Mode is
         when Input =>
            PADS_BANK_Periph.GPIO (This.Pin) :=
               (PUE      => (Pull = Pull_Both or Pull = Pull_Up),
                PDE      => (Pull = Pull_Both or Pull = Pull_Down),
                IE       => True,
                OD       => True,
                SCHMITT  => Schmitt,
                SLEWFAST => Slew_Fast,
                DRIVE    => GPIO0_DRIVE_Field'Val (GPIO_Drive'Pos (Drive)),
                others   => <>);
         when Output =>
            PADS_BANK_Periph.GPIO (This.Pin) :=
               (PUE      => (Pull = Pull_Both or Pull = Pull_Up),
                PDE      => (Pull = Pull_Both or Pull = Pull_Down),
                IE       => True,
                OD       => False,
                SCHMITT  => Schmitt,
                SLEWFAST => Slew_Fast,
                DRIVE    => GPIO0_DRIVE_Field'Val (GPIO_Drive'Pos (Drive)),
                others   => <>);
            SIO_Periph.GPIO_OUT_CLR.GPIO_OUT_CLR := Mask;
            SIO_Periph.GPIO_OE_SET.GPIO_OE_SET := Mask;
         when Analog =>
            PADS_BANK_Periph.GPIO (This.Pin) :=
               (PUE      => False,
                PDE      => False,
                IE       => True,
                OD       => True,
                SCHMITT  => Schmitt,
                SLEWFAST => Slew_Fast,
                DRIVE    => GPIO0_DRIVE_Field'Val (GPIO_Drive'Pos (Drive)),
                others   => <>);
            IO_BANK_Periph.GPIO (This.Pin).CTRL.FUNCSEL := HI_Z;
      end case;
   end Configure;

   function Get
      (This : GPIO_Point)
      return Boolean
   is ((SIO_Periph.GPIO_IN.GPIO_IN and Pin_Mask (This.Pin)) /= 0);

   procedure Enable_Interrupt
      (This    : in out GPIO_Point;
       Trigger : Interrupt_Triggers)
   is
      INTE : UInt4 := IO_BANK_Periph.PROC0_INTE (This.Pin);
   begin
      INTE := INTE or Interrupt_Triggers'Enum_Rep (Trigger);

      --  Clear pending event before enabling the interrupt
      IO_BANK_Periph.INTR (This.Pin) := INTE;

      IO_BANK_Periph.PROC0_INTE (This.Pin) := INTE;
   end Enable_Interrupt;

   procedure Disable_Interrupt
      (This    : in out GPIO_Point;
       Trigger : Interrupt_Triggers)
   is
      INTE : UInt4 := IO_BANK_Periph.PROC0_INTE (This.Pin);
   begin
      INTE := INTE and not Interrupt_Triggers'Enum_Rep (Trigger);
      IO_BANK_Periph.PROC0_INTE (This.Pin) := INTE;
   end Disable_Interrupt;

   procedure Acknowledge_Interrupt
      (Pin : GPIO_Pin;
       Trigger : Interrupt_Triggers)
   is
      T : UInt4;
   begin
      T := IO_BANK_Periph.PROC0_INTS (Pin) and Interrupt_Triggers'Enum_Rep (Trigger);
      IO_BANK_Periph.INTR (Pin) := T;
   end Acknowledge_Interrupt;

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
      if IO_BANK_Periph.GPIO (This.Pin).CTRL.FUNCSEL /= SIO then
         return Unknown_Mode;
      elsif PADS_BANK_Periph.GPIO (This.Pin).OD then
         return Input;
      else
         return Output;
      end if;
   end Mode;

   overriding
   procedure Set_Mode
      (This : in out GPIO_Point;
       Mode : HAL.GPIO.GPIO_Config_Mode)
   is
   begin
      case Mode is
         when HAL.GPIO.Input =>
            Configure (This, Input);
         when HAL.GPIO.Output =>
            Configure (This, Output);
      end case;
   end Set_Mode;

   overriding
   function Pull_Resistor
      (This : GPIO_Point)
      return HAL.GPIO.GPIO_Pull_Resistor
   is
   begin
      if PADS_BANK_Periph.GPIO (This.Pin).PUE then
         return Pull_Up;
      elsif PADS_BANK_Periph.GPIO (This.Pin).PDE then
         return Pull_Down;
      else
         return Floating;
      end if;
   end Pull_Resistor;

   overriding
   procedure Set_Pull_Resistor
      (This : in out GPIO_Point;
       Pull : HAL.GPIO.GPIO_Pull_Resistor)
   is
   begin
      case Pull is
         when Pull_Up =>
            PADS_BANK_Periph.GPIO (This.Pin).PUE := True;
            PADS_BANK_Periph.GPIO (This.Pin).PDE := False;
         when Pull_Down =>
            PADS_BANK_Periph.GPIO (This.Pin).PUE := False;
            PADS_BANK_Periph.GPIO (This.Pin).PDE := True;
         when Floating =>
            PADS_BANK_Periph.GPIO (This.Pin).PUE := False;
            PADS_BANK_Periph.GPIO (This.Pin).PDE := False;
      end case;
   end Set_Pull_Resistor;

   overriding
   function Set
      (This : GPIO_Point)
      return Boolean
   is ((SIO_Periph.GPIO_IN.GPIO_IN and Pin_Mask (This.Pin)) /= 0);

   overriding
   procedure Set
      (This : in out GPIO_Point)
   is
   begin
      SIO_Periph.GPIO_OUT_SET.GPIO_OUT_SET := Pin_Mask (This.Pin);
   end Set;

   overriding
   procedure Clear
      (This : in out GPIO_Point)
   is
   begin
      SIO_Periph.GPIO_OUT_CLR.GPIO_OUT_CLR := Pin_Mask (This.Pin);
   end Clear;

   overriding
   procedure Toggle
      (This : in out GPIO_Point)
   is
   begin
      SIO_Periph.GPIO_OUT_XOR.GPIO_OUT_XOR := Pin_Mask (This.Pin);
   end Toggle;

end RP.GPIO;
