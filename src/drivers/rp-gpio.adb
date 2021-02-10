--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--

with Cortex_M_SVD.NVIC;     use Cortex_M_SVD.NVIC;
with RP2040_SVD.Interrupts; use RP2040_SVD.Interrupts;
with RP2040_SVD.RESETS;     use RP2040_SVD.RESETS;
with RP2040_SVD.SIO;        use RP2040_SVD.SIO;

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

      IO_BANK_Periph.PROC0_INTE := (others => 0);
      IO_BANK_Periph.PROC1_INTE := (others => 0);
      NVIC_Periph.NVIC_ICPR := Shift_Left (1, IO_IRQ_BANK0_Interrupt);
      NVIC_Periph.NVIC_ISER := NVIC_Periph.NVIC_ISER or Shift_Left (1, IO_IRQ_BANK0_Interrupt);
   end Enable;

   function Enabled
      return Boolean
   is (RESETS_Periph.RESET_DONE.io_bank0);

   procedure Configure
      (This : in out GPIO_Point;
       Mode : GPIO_Config_Mode;
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
      GPIO_Interrupt_Handlers (This.Pin) := Handler;
   end Set_Interrupt_Handler;

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

   procedure IO_IRQ_PROC0_Handler is
      Handler : Interrupt_Procedure;
      T       : UInt4;
   begin
      for Pin in IO_BANK_Periph.PROC0_INTS'Range loop
         if IO_BANK_Periph.PROC0_INTS (Pin) /= 0 then
            for Trigger in Interrupt_Triggers'Range loop
               T := IO_BANK_Periph.PROC0_INTS (Pin) and Interrupt_Triggers'Enum_Rep (Trigger);
               if T /= 0 then
                  Handler := GPIO_Interrupt_Handlers (Pin);
                  if Handler /= null then
                     Handler.all (Trigger);
                  end if;
                  IO_BANK_Periph.INTR (Pin) := T;
               end if;
            end loop;
         end if;
      end loop;
   end IO_IRQ_PROC0_Handler;

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
