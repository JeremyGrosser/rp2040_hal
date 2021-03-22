--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP2040_SVD.PIO; use RP2040_SVD.PIO;
with RP2040_SVD;
with RP.GPIO; use RP.GPIO;
with HAL; use HAL;

package RP.PIO is
   type PIO_Peripheral is private;
   type PIO_Peripheral_Index is range 0 .. 1;
   type PIO_Device
      (Num    : PIO_Peripheral_Index;
       Periph : not null access PIO_Peripheral)
   is tagged limited private;

   type PIO_SM is range 0 .. 3;
   type PIO_SM_Config is record
      clkdiv, execctrl, shiftctrl, pinctrl : UInt32;
   end record;

   type PIO_FIFO_Join is (Join_None, Join_TX, Join_RX);
   for PIO_FIFO_JOIN use (0, 1, 2);

   type PIO_MOV_Status_Type is (TX_Less_Than, RX_Less_Than);
   for PIO_MOV_Status_Type use (0, 1);

   subtype Program_Index is Natural range 0 .. 31;
   subtype Pin_Count is Natural range 0 .. 32;
   subtype Sideset_Bit_Count is Natural range 0 .. 5;

   procedure Set_Out_Pins
      (SM_Config : in out PIO_SM_Config;
       Out_Base  : GPIO_Pin;
       Out_Count : Pin_Count);

   procedure Set_Set_Pins
      (SM_Config : in out PIO_SM_Config;
       Set_Base  : GPIO_Pin;
       Set_Count : Pin_Count);

   procedure Set_In_Pins
      (SM_Config : in out PIO_SM_Config;
       In_Base   : GPIO_Pin);

   procedure Set_Sideset_Pins
      (SM_Config    : in out PIO_SM_Config;
       Sideset_Base : GPIO_Pin);

   procedure Set_Sideset
      (SM_Config : in out PIO_SM_Config;
       Bit_Count : Sideset_Bit_Count;
       Optional  : Boolean;
       Pindirs   : Boolean);

   procedure Set_Clkdiv
      (SM_Config : in out PIO_SM_Config;
       Div       : Float);

   procedure Set_Clkdiv_Int_Frac
      (SM_Config : in out PIO_SM_Config;
       Div_Int   : UInt16;
       Div_Frac  : UInt8);

   procedure Set_Wrap
      (SM_Config   : in out PIO_SM_Config;
       Wrap_Target : Program_Index;
       Wrap        : Program_Index);

   procedure Set_Jmp_Pin
      (SM_Config : in out PIO_SM_Config;
       Pin       : GPIO_Pin);

   procedure Set_In_Shift
      (SM_Config      : in out PIO_SM_Config;
       Shift_Right    : Boolean;
       Autopush       : Boolean;
       Push_Threshold : UInt5);

   procedure Set_Out_Shift
      (SM_Config      : in out PIO_SM_Config;
       Shift_Right    : Boolean;
       Autopull       : Boolean;
       Pull_Threshold : UInt5);

   procedure Set_FIFO_Join
      (SM_Config : in out PIO_SM_Config;
       Join      : PIO_FIFO_Join);

   procedure Set_Out_Special
      (SM_Config        : in out PIO_SM_Config;
       Sticky           : Boolean;
       Has_Enable_Pin   : Boolean;
       Enable_Pin_Index : GPIO_Pin);

   procedure Set_MOV_Status
      (SM_Config  : in out PIO_SM_Config;
       Status_Sel : PIO_MOV_Status_Type;
       Status_N   : UInt5);

   function Default_SM_Config
      return PIO_SM_Config;

   procedure Set_Config
      (PIO    : in out PIO_Device;
       SM     : PIO_SM;
       Config : PIO_SM_Config);

   function GPIO_Function
      (PIO : PIO_Device)
      return RP.GPIO.GPIO_Function;

   function DREQ
      (PIO   : PIO_Device;
       SM    : PIO_SM;
       Is_TX : Boolean)
      return Natural;

private

   type FIFO_Register is array (PIO_SM) of UInt32
      with Pack, Volatile;

   type INSTR_MEM_Register is array (Program_Index) of UInt32
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
      (Num    : PIO_Peripheral_Index;
       Periph : not null access PIO_Peripheral)
   is tagged limited null record;
end RP.PIO;
