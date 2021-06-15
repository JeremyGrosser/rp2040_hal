--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP2040_SVD.PIO; use RP2040_SVD.PIO;
with RP2040_SVD;
with RP.GPIO; use RP.GPIO;
with HAL; use HAL;
with System;

package RP.PIO is
   type PIO_Peripheral is private;
   subtype PIO_Number is Natural range 0 .. 1;
   type PIO_Device
      (Num    : PIO_Number;
       Periph : not null access PIO_Peripheral)
   is tagged private;

   type PIO_SM is range 0 .. 3;
   type PIO_SM_Mask is array (PIO_SM) of Boolean
      with Pack, Size => 4;

   type PIO_SM_Config is private;

   subtype PIO_Address is Natural range 0 .. 31;
   subtype PIO_Instruction is UInt16;
   type Program is array (PIO_Address range <>) of PIO_Instruction;

   subtype Pin_Count is Natural range 0 .. 32;
   subtype Sideset_Bit_Count is Natural range 0 .. 5;

   Divider_Fraction : constant := 1.0 / 2.0 ** SM0_CLKDIV_FRAC_Field'Size;
   type Divider is
      delta Divider_Fraction
      range 0.0 .. (2.0 ** SM0_CLKDIV_INT_Field'Size - Divider_Fraction);

   procedure Enable
      (This : in out PIO_Device);

   procedure Disable
      (This : in out PIO_Device);

   procedure Set_Out_Pins
      (Config    : in out PIO_SM_Config;
       Out_Base  : GPIO_Pin;
       Out_Count : Pin_Count);

   procedure Set_Set_Pins
      (Config    : in out PIO_SM_Config;
       Set_Base  : GPIO_Pin;
       Set_Count : Pin_Count);

   procedure Set_In_Pins
      (Config    : in out PIO_SM_Config;
       In_Base   : GPIO_Pin);

   procedure Set_Sideset_Pins
      (Config       : in out PIO_SM_Config;
       Sideset_Base : GPIO_Pin);

   procedure Set_Sideset
      (Config    : in out PIO_SM_Config;
       Bit_Count : Sideset_Bit_Count;
       Optional  : Boolean;
       Pindirs   : Boolean);

   procedure Set_Clock_Frequency
      (Config    : in out PIO_SM_Config;
       Frequency : Hertz);

   procedure Set_Clock_Divider
      (Config : in out PIO_SM_Config;
       Div    : Divider);

   procedure Set_Clkdiv_Int_Frac
      (Config    : in out PIO_SM_Config;
       Div_Int   : UInt16;
       Div_Frac  : UInt8);

   procedure Set_Wrap
      (Config      : in out PIO_SM_Config;
       Wrap_Target : PIO_Address;
       Wrap        : PIO_Address);

   procedure Set_Jmp_Pin
      (Config    : in out PIO_SM_Config;
       Pin       : GPIO_Pin);

   subtype Shift_Threshold is Natural range 1 .. 32;

   procedure Set_In_Shift
      (Config         : in out PIO_SM_Config;
       Shift_Right    : Boolean;
       Autopush       : Boolean;
       Push_Threshold : Shift_Threshold);

   procedure Set_Out_Shift
      (Config         : in out PIO_SM_Config;
       Shift_Right    : Boolean;
       Autopull       : Boolean;
       Pull_Threshold : Shift_Threshold);

   procedure Set_FIFO_Join
      (Config  : in out PIO_SM_Config;
       Join_TX : Boolean;
       Join_RX : Boolean);

   procedure Set_Out_Special
      (Config           : in out PIO_SM_Config;
       Sticky           : Boolean;
       Has_Enable_Pin   : Boolean;
       Enable_Pin_Index : GPIO_Pin);

   type PIO_MOV_Status_Type is (TX_Less_Than, RX_Less_Than);

   procedure Set_MOV_Status
      (Config     : in out PIO_SM_Config;
       Status_Sel : PIO_MOV_Status_Type;
       Status_N   : UInt4);

   function Default_SM_Config
      return PIO_SM_Config;

   procedure Set_Config
      (This   : in out PIO_Device;
       SM     : PIO_SM;
       Config : PIO_SM_Config);

   function GPIO_Function
      (PIO : PIO_Device)
      return RP.GPIO.GPIO_Function;

   procedure Set_Enabled
      (This    : in out PIO_Device;
       SM      : PIO_SM;
       Enabled : Boolean);

   procedure Set_Enabled
      (This : in out PIO_Device;
       SM   : PIO_SM_Mask);

   function Enabled
      (This : PIO_Device)
      return PIO_SM_Mask;

   procedure Clear_FIFOs
      (This    : in out PIO_Device;
       SM      : PIO_SM);

   procedure SM_Initialize
      (This       : in out PIO_Device;
       SM         : PIO_SM;
       Initial_PC : PIO_Address;
       Config     : PIO_SM_Config);

   type PIO_Pin_Direction is (Input, Output);

   procedure Set_Pin_Direction
      (This      : in out PIO_Device;
       SM        : PIO_SM;
       Pin       : GPIO_Pin;
       Direction : PIO_Pin_Direction);

   procedure Execute
      (This        : in out PIO_Device;
       SM          : PIO_SM;
       Instruction : PIO_Instruction);

   procedure Load
      (This        : in out PIO_Device;
       Prog        : Program;
       Offset      : PIO_Address)
   with Pre => (Offset + Prog'Length) <= PIO_Address'Last;

   procedure Put
      (This : in out PIO_Device;
       SM   : PIO_SM;
       Data : UInt32);

   procedure Put
      (This : in out PIO_Device;
       SM   : PIO_SM;
       Data : UInt32_Array);

   procedure Get
      (This : in out PIO_Device;
       SM   : PIO_SM;
       Data : out UInt32);

   procedure Get
      (This : in out PIO_Device;
       SM   : PIO_SM;
       Data : out UInt32_Array);

   function TX_FIFO_Address
      (This : PIO_Device;
       SM   : PIO_SM)
      return System.Address;

   function RX_FIFO_Address
      (This : PIO_Device;
       SM   : PIO_SM)
      return System.Address;

private

   function Div_Integer
      (Div : Divider)
      return SM0_CLKDIV_INT_Field;

   function Div_Fraction
      (Div : Divider)
      return SM0_CLKDIV_FRAC_Field;

   type PIO_SM_Config is record
      CLKDIV    : SM0_CLKDIV_Register;
      EXECCTRL  : SM0_EXECCTRL_Register;
      SHIFTCTRL : SM0_SHIFTCTRL_Register;
      PINCTRL   : SM0_PINCTRL_Register;
   end record;

   type FIFO_Register is array (PIO_SM) of UInt32
      with Pack, Volatile;

   type INSTR_MEM_Register is array (PIO_Address) of UInt32
      with Volatile;

   type SM_Register is record
      CLKDIV    : aliased SM0_CLKDIV_Register;
      EXECCTRL  : aliased SM0_EXECCTRL_Register;
      SHIFTCTRL : aliased SM0_SHIFTCTRL_Register;
      ADDR      : aliased SM0_ADDR_Register;
      INSTR     : aliased SM0_INSTR_Register;
      PINCTRL   : aliased SM0_PINCTRL_Register;
   end record
      with Pack, Volatile;

   type SM_Register_Array is array (PIO_SM) of SM_Register
      with Pack, Volatile;

   type PIO_Peripheral is record
      CTRL              : aliased CTRL_Register;
      FSTAT             : aliased FSTAT_Register;
      FDEBUG            : aliased FDEBUG_Register;
      FLEVEL            : aliased FLEVEL_Register;
      TXF               : aliased FIFO_Register;
      RXF               : aliased FIFO_Register;
      IRQ               : aliased IRQ_Register;
      IRQ_FORCE         : aliased IRQ_FORCE_Register;
      INPUT_SYNC_BYPASS : aliased HAL.UInt32;
      DBG_PADOUT        : aliased HAL.UInt32;
      DBG_PADOE         : aliased HAL.UInt32;
      DBG_CFGINFO       : aliased DBG_CFGINFO_Register;
      INSTR_MEM         : aliased INSTR_MEM_Register;
      SM                : aliased SM_Register_Array;
      INTR              : aliased INTR_Register;
      IRQ0_INTE         : aliased IRQ0_INTE_Register;
      IRQ0_INTF         : aliased IRQ0_INTF_Register;
      IRQ0_INTS         : aliased IRQ0_INTS_Register;
      IRQ1_INTE         : aliased IRQ1_INTE_Register;
      IRQ1_INTF         : aliased IRQ1_INTF_Register;
      IRQ1_INTS         : aliased IRQ1_INTS_Register;
   end record
      with Size => 2592,
           Volatile;

   type PIO_Device
      (Num    : PIO_Number;
       Periph : not null access PIO_Peripheral)
   is tagged null record;
end RP.PIO;
