--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--

with RP2040_SVD.RESETS; use RP2040_SVD.RESETS;
with RP2040_SVD.SIO;    use RP2040_SVD.SIO;

package body RP.GPIO is
   function Pin_Mask (Pin : GPIO_Pin)
      return GPIO_Pin_Mask
   is (GPIO_Pin_Mask (Shift_Left (UInt32 (1), GPIO_Pin'Pos (Pin))));

   procedure Enable is
   begin
      RESETS_Periph.RESET.io_bank0 := False;
      RESETS_Periph.RESET.pads_bank0 := False;
      while not RESETS_Periph.RESET_DONE.io_bank0 or else not RESETS_Periph.RESET_DONE.pads_bank0 loop
         null;
      end loop;
   end Enable;

   procedure Configure
      (This : in out GPIO_Point;
       Mode : HAL.GPIO.GPIO_Config_Mode;
       Pull : HAL.GPIO.GPIO_Pull_Resistor := HAL.GPIO.Floating;
       Func : GPIO_Function := SIO)
   is
      use HAL.GPIO;
      Mask : constant GPIO_Pin_Mask := Pin_Mask (This.Pin);
   begin
      IO_BANK_Periph.GPIO (This.Pin).CTRL.FUNCSEL := Func;

      PADS_BANK_Periph.GPIO (This.Pin).PUE := (Pull = Pull_Up);
      PADS_BANK_Periph.GPIO (This.Pin).PDE := (Pull = Pull_Down);
      PADS_BANK_Periph.GPIO (This.Pin).IE := True;

      if Mode = Output then
         PADS_BANK_Periph.GPIO (This.Pin).OD := False;
         SIO_Periph.GPIO_OUT_CLR.GPIO_OUT_CLR := Mask;
         SIO_Periph.GPIO_OE_SET.GPIO_OE_SET := Mask;
      end if;
   end Configure;

   procedure Set_Interrupt_Handler
      (This    : in out GPIO_Point;
       Handler : Interrupt_Procedure)
   is
   begin
      raise Not_Implemented;
   end Set_Interrupt_Handler;

   procedure Enable_Interrupt
      (This    : in out GPIO_Point;
       Trigger : Interrupt_Triggers)
   is
   begin
      raise Not_Implemented;
   end Enable_Interrupt;

   procedure Disable_Interrupt
      (This    : in out GPIO_Point;
       Trigger : Interrupt_Triggers)
   is
   begin
      raise Not_Implemented;
   end Disable_Interrupt;

   procedure SIO_IRQ_PROC0_Handler is
   begin
      raise Not_Implemented;
   end SIO_IRQ_PROC0_Handler;

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
      use HAL.GPIO;
      Mask : constant GPIO_Pin_Mask := Pin_Mask (This.Pin);
   begin
      if IO_BANK_Periph.GPIO (This.Pin).CTRL.FUNCSEL /= SIO then
         return Unknown_Mode;
      elsif (SIO_Periph.GPIO_OE.GPIO_OE and Mask) /= 0 then
         return Output;
      else
         return Input;
      end if;
   end Mode;

   overriding
   procedure Set_Mode
      (This : in out GPIO_Point;
       Mode : HAL.GPIO.GPIO_Config_Mode)
   is
   begin
      Configure (This, Mode);
   end Set_Mode;

   overriding
   function Pull_Resistor
      (This : GPIO_Point)
      return HAL.GPIO.GPIO_Pull_Resistor
   is
      use HAL.GPIO;
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
      use HAL.GPIO;
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
