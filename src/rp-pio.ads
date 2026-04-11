--
--  Copyright 2021-2026 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP.Device_Parameters;
with RP.GPIO;
with RP.DMA;
with HAL; use HAL;
with System;

package RP.PIO
   with Preelaborate
is
   type Device is range 0 .. RP.Device_Parameters.PIO_Count - 1;
   type SM_Index is range 0 .. 3;
   type SM_Mask is array (SM_Index) of Boolean
      with Size => 4, Component_Size => 1;
   type SM_Config is private;

   subtype PIO_Address is Natural range 0 .. 31;
   subtype PIO_Instruction is UInt16;
   type Program is array (PIO_Address range <>) of PIO_Instruction;

   subtype Pin_Count is Natural range 0 .. 32;
   subtype Sideset_Bit_Count is Natural range 0 .. 5;

   Divider_Fraction : constant := 1.0 / 2.0 ** 8;
   type Divider is delta Divider_Fraction
      range 0.0 .. (2.0 ** 16 - Divider_Fraction);

   procedure Enable
      (This : Device);

   procedure Disable
      (This : Device);

   procedure Set_Out_Pins
      (Config    : in out SM_Config;
       Out_Base  : RP.GPIO.GPIO_Pin;
       Out_Count : Pin_Count);

   procedure Set_Set_Pins
      (Config    : in out SM_Config;
       Set_Base  : RP.GPIO.GPIO_Pin;
       Set_Count : Pin_Count);

   procedure Set_In_Pins
      (Config    : in out SM_Config;
       In_Base   : RP.GPIO.GPIO_Pin);

   procedure Set_Sideset_Pins
      (Config       : in out SM_Config;
       Sideset_Base : RP.GPIO.GPIO_Pin);

   procedure Set_Sideset
      (Config    : in out SM_Config;
       Bit_Count : Sideset_Bit_Count;
       Optional  : Boolean;
       Pindirs   : Boolean);

   procedure Set_Clock_Frequency
      (Config    : in out SM_Config;
       Frequency : Hertz);

   procedure Set_Clock_Divider
      (Config : in out SM_Config;
       Div    : Divider);

   procedure Set_Clkdiv_Int_Frac
      (Config    : in out SM_Config;
       Div_Int   : UInt16;
       Div_Frac  : UInt8);

   procedure Set_Wrap
      (Config      : in out SM_Config;
       Wrap_Target : PIO_Address;
       Wrap        : PIO_Address);

   procedure Set_Jmp_Pin
      (Config : in out SM_Config;
       Pin    : RP.GPIO.GPIO_Pin);

   subtype Shift_Threshold is Natural range 1 .. 32;

   procedure Set_In_Shift
      (Config         : in out SM_Config;
       Shift_Right    : Boolean;
       Autopush       : Boolean;
       Push_Threshold : Shift_Threshold);

   procedure Set_Out_Shift
      (Config         : in out SM_Config;
       Shift_Right    : Boolean;
       Autopull       : Boolean;
       Pull_Threshold : Shift_Threshold);

   procedure Set_FIFO_Join
      (Config  : in out SM_Config;
       Join_TX : Boolean;
       Join_RX : Boolean);

   procedure Set_Out_Special
      (Config           : in out SM_Config;
       Sticky           : Boolean;
       Has_Enable_Pin   : Boolean;
       Enable_Pin_Index : RP.GPIO.GPIO_Pin);

   type MOV_Status_Type is (TX_Less_Than, RX_Less_Than);

   procedure Set_MOV_Status
      (Config     : in out SM_Config;
       Status_Sel : MOV_Status_Type;
       Status_N   : UInt4);

   function Default_SM_Config
      return SM_Config;

   procedure Set_Config
      (This   : Device;
       SM     : SM_Index;
       Config : SM_Config);

   function GPIO_Function
      (PIO : Device)
      return RP.GPIO.GPIO_Function;

   procedure Set_Enabled
      (This    : Device;
       SM      : SM_Index;
       Enabled : Boolean);

   procedure Set_Enabled
      (This : Device;
       SM   : SM_Mask);

   function Enabled
      (This : Device)
      return SM_Mask;

   procedure Clear_FIFOs
      (This    : Device;
       SM      : SM_Index);

   procedure SM_Initialize
      (This       : Device;
       SM         : SM_Index;
       Initial_PC : PIO_Address;
       Config     : SM_Config);

   type Pin_Direction is (Input, Output);

   procedure Set_Pin_Direction
      (This      : Device;
       SM        : SM_Index;
       Pin       : RP.GPIO.GPIO_Pin;
       Direction : Pin_Direction);

   procedure Execute
      (This        : Device;
       SM          : SM_Index;
       Instruction : PIO_Instruction);

   procedure Load
      (This   : Device;
       Prog   : Program;
       Offset : PIO_Address)
   with Pre => (Offset + Prog'Length - 1) <= PIO_Address'Last;

   procedure Put
      (This : Device;
       SM   : SM_Index;
       Data : UInt32);
   --  Put one word in the TX FIFO of the given state machine. If the FIFO is
   --  full, this call will run a busy loop until there's room for the data.

   procedure Put
      (This : Device;
       SM   : SM_Index;
       Data : UInt32_Array);
   --  Put data in the TX FIFO of the given state machine. If the FIFO is
   --  full, this call will run a busy loop until there's room for the data.

   procedure Try_Put
      (This    : Device;
       SM      : SM_Index;
       Data    : UInt32;
       Success : out Boolean);
   --  Try to put one word in the TX FIFO of the given state machine. If the
   --  FIFO is full, Success is set to False and the data not transmitted.

   procedure Get
      (This : Device;
       SM   : SM_Index;
       Data : out UInt32);
   --  Get one word from the RX FIFO of the given state machine. If the FIFO
   --  is empty, this call will run a busy loop until there's data available.

   procedure Get
      (This : Device;
       SM   : SM_Index;
       Data : out UInt32_Array);
   --  Get data from the RX FIFO of the given state machine. If the FIFO is
   --  empty, this call will run a busy loop until there's data available.

   procedure Try_Get
      (This    : Device;
       SM      : SM_Index;
       Data    : out UInt32;
       Success : out Boolean);
   --  Try to get one word from the RX FIFO of the given state machine. If the
   --  FIFO is empty, Success is set to False and Data is not set.

   function RX_FIFO_Full
      (This : Device;
       SM   : SM_Index)
       return Boolean;

   function RX_FIFO_Empty
      (This : Device;
       SM   : SM_Index)
       return Boolean;

   function TX_FIFO_Full
      (This : Device;
       SM   : SM_Index)
       return Boolean;

   function TX_FIFO_Empty
      (This : Device;
       SM   : SM_Index)
       return Boolean;

   function TX_FIFO_Address
      (This : Device;
       SM   : SM_Index)
      return System.Address;

   function RX_FIFO_Address
      (This : Device;
       SM   : SM_Index)
      return System.Address;

   type SM_FIFO_Status is record
      TXSTALL  : Boolean;
      --  State machine has stalled on empty TX FIFO during a blocking PULL, or
      --  an OUT with autopull enabled.

      TXOVER   : Boolean;
      --  TX FIFO overflow (i.e. write-on-full by the system) has occurred.
      --  Write-on-full does not alter the state or contents of the FIFO in any
      --  way, but the data that the system attempted to write is dropped, so
      --  if this flag is set, your software has quite likely dropped some data
      --  on the floor.

      RXUNDER  : Boolean;
      --  RX FIFO underflow (i.e. read-on-empty by the system) has occurred.
      --  Read-on-empty does not perturb the state of the FIFO in any way, but
      --  the data returned by reading from an empty FIFO is undefined, so this
      --  flag generally only becomes set due to some kind of software error.

      RXSTALL  : Boolean;
      --  State machine has stalled on full RX FIFO during a blocking PUSH, or
      --  an IN with autopush enabled. This flag is also set when a nonblocking
      --  PUSH to a full FIFO took place, in which case the state machine has
      --  dropped data.
   end record;

   function FIFO_Status
      (This : Device;
       SM   : SM_Index)
       return SM_FIFO_Status;

   procedure Clear_FIFO_Status
      (This  : Device;
       SM    : SM_Index;
       Flags : SM_FIFO_Status := (others => True));

   type PIO_IRQ_ID is range 0 .. 1;

   type PIO_IRQ_Flag is (SM_IRQ, RXNEMPTY, TXNFULL);

   procedure Enable_IRQ_Flag
      (This : Device;
       IRQ  : PIO_IRQ_ID;
       SM   : SM_Index;
       Flag : PIO_IRQ_Flag);
   --  Enable a system-level IRQ

   procedure Disable_IRQ_Flag
      (This : Device;
       IRQ  : PIO_IRQ_ID;
       SM   : SM_Index;
       Flag : PIO_IRQ_Flag);
   --  Disable a system-level IRQ

   function IRQ_Flag_Status
      (This : Device;
       IRQ  : PIO_IRQ_ID;
       SM   : SM_Index;
       Flag : PIO_IRQ_Flag)
       return Boolean;
   --  Return True if a system-level IRQ is signaled (after masking and forcing)

   procedure Force_IRQ_Flag
      (This : Device;
       IRQ  : PIO_IRQ_ID;
       SM   : SM_Index;
       Flag : PIO_IRQ_Flag);
   --  Force a system-level IRQ

   procedure Clear_Force_IRQ_Flag
      (This : Device;
       IRQ  : PIO_IRQ_ID;
       SM   : SM_Index;
       Flag : PIO_IRQ_Flag);
   --  Clear force a system-level IRQ

   type SM_IRQ_Flag is range 0 .. 7;

   procedure Ack_SM_IRQ
      (This : Device;
       Flag : SM_IRQ_Flag);
   --  Acknolege a state-machine-level IRQ

   function SM_IRQ_Status
      (This : Device;
       Flag : SM_IRQ_Flag)
       return Boolean;
   --  Return True if a state-machine-level IRQ is signaled

   procedure Force_SM_IRQ
      (This : Device;
       Flag : SM_IRQ_Flag);
   --  Force a state-machine-level IRQ

   procedure Clear_Force_SM_IRQ
      (This : Device;
       Flag : SM_IRQ_Flag);
   --  Clear force a state-machine-level IRQ

   function DMA_TX_Trigger
      (This : Device;
       SM   : SM_Index)
       return RP.DMA.DMA_Request_Trigger;

   function DMA_RX_Trigger
      (This : Device;
       SM   : SM_Index)
       return RP.DMA.DMA_Request_Trigger;

   function Current_Instruction_Address
      (This : Device;
       SM   : SM_Index)
       return PIO_Address;
   --  Current instruction address of the given state machine.

   --  Deprecated names, compatibility definitions
   subtype PIO_Device is Device;
   subtype PIO_SM is SM_Index;
   subtype PIO_SM_Config is SM_Config;

private

   type CLKDIV_Register is record
      INT  : UInt16 := 1;
      FRAC : UInt8 := 0;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Object_Size => 32;
   for CLKDIV_Register use record
      INT  at 0 range 16 .. 31;
      FRAC at 0 range 8 .. 15;
   end record;

   type SHIFTCTRL_Register is record
      FJOIN_RX       : Boolean := False;
      FJOIN_TX       : Boolean := False;
      PULL_THRESH    : UInt5 := 0;
      PUSH_THRESH    : UInt5 := 0;
      OUT_SHIFTDIR   : Boolean := True;
      IN_SHIFTDIR    : Boolean := True;
      AUTOPULL       : Boolean := False;
      AUTOPUSH       : Boolean := False;
      FJOIN_RX_PUT   : Boolean := False; --  RP2350 only
      FJOIN_RX_GET   : Boolean := False; --  RP2350 only
      IN_COUNT       : UInt5 := 0; --  RP2350 only
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Object_Size => 32;
   for SHIFTCTRL_Register use record
      FJOIN_RX       at 0 range 31 .. 31;
      FJOIN_TX       at 0 range 30 .. 30;
      PULL_THRESH    at 0 range 25 .. 29;
      PUSH_THRESH    at 0 range 20 .. 24;
      OUT_SHIFTDIR   at 0 range 19 .. 19;
      IN_SHIFTDIR    at 0 range 18 .. 18;
      AUTOPULL       at 0 range 17 .. 17;
      AUTOPUSH       at 0 range 16 .. 16;
      FJOIN_RX_PUT   at 0 range 15 .. 15;
      FJOIN_RX_GET   at 0 range 14 .. 14;
      IN_COUNT       at 0 range 0 .. 4;
   end record;

   type PINCTRL_Register is record
      SIDESET_COUNT  : UInt3 := 0;
      SET_COUNT      : UInt3 := 0;
      OUT_COUNT      : UInt6 := 0;
      IN_BASE        : UInt5 := 0;
      SIDESET_BASE   : UInt5 := 0;
      SET_BASE       : UInt5 := 0;
      OUT_BASE       : UInt5 := 0;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Object_Size => 32;
   for PINCTRL_Register use record
      SIDESET_COUNT  at 0 range 29 .. 31;
      SET_COUNT      at 0 range 26 .. 28;
      OUT_COUNT      at 0 range 20 .. 25;
      IN_BASE        at 0 range 15 .. 19;
      SIDESET_BASE   at 0 range 10 .. 14;
      SET_BASE       at 0 range 5 .. 9;
      OUT_BASE       at 0 range 0 .. 4;
   end record;

   type SM_Register is record
      CLKDIV    : CLKDIV_Register;
      EXECCTRL  : UInt32 := 0;
      SHIFTCTRL : SHIFTCTRL_Register;
      ADDR      : UInt32 := 0;
      INSTR     : UInt32 := 0;
      PINCTRL   : PINCTRL_Register;
   end record
      with Volatile;
   for SM_Register use record
      CLKDIV      at 16#00# range 0 .. 31;
      EXECCTRL    at 16#04# range 0 .. 31;
      SHIFTCTRL   at 16#08# range 0 .. 31;
      ADDR        at 16#0C# range 0 .. 31;
      INSTR       at 16#10# range 0 .. 31;
      PINCTRL     at 16#14# range 0 .. 31;
   end record;

   type SM_Config is new SM_Register;

end RP.PIO;
