--
--  Copyright 2021-2026 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with Ada.Unchecked_Conversion;
with RP.Reset;
with RP.Clock;

package body RP.PIO is

   --  EXECCTRL has different layout on RP2350
   --  store it as UInt32 and convert
   type EXECCTRL_Register is record
      EXEC_STALLED   : Boolean := False;
      SIDE_EN        : Boolean := False;
      SIDE_PINDIR    : Boolean := False;
      JMP_PIN        : UInt5 := 0;
      OUT_EN_SEL     : UInt5 := 0;
      INLINE_OUT_EN  : Boolean := False;
      OUT_STICKY     : Boolean := False;
      WRAP_TOP       : UInt5 := 16#1F#;
      WRAP_BOTTOM    : UInt5 := 0;
      STATUS_SEL     : Boolean := False;
      STATUS_N       : UInt4 := 0;
   end record
--      with Volatile_Full_Access,
--           Effective_Writes,
--           Async_Readers,
--           Async_Writers,
        with Object_Size => 32;
   for EXECCTRL_Register use record
      EXEC_STALLED   at 0 range 31 .. 31;
      SIDE_EN        at 0 range 30 .. 30;
      SIDE_PINDIR    at 0 range 29 .. 29;
      JMP_PIN        at 0 range 24 .. 28;
      OUT_EN_SEL     at 0 range 19 .. 23;
      INLINE_OUT_EN  at 0 range 18 .. 18;
      OUT_STICKY     at 0 range 17 .. 17;
      WRAP_TOP       at 0 range 12 .. 16;
      WRAP_BOTTOM    at 0 range 7 .. 11;
      STATUS_SEL     at 0 range 4 .. 4;
      STATUS_N       at 0 range 0 .. 3;
   end record;

   function To_UInt32 is new Ada.Unchecked_Conversion (EXECCTRL_Register, UInt32);
   function To_EXECCTRL is new Ada.Unchecked_Conversion (UInt32, EXECCTRL_Register);

   type CTRL_Register is record
      CLKDIV_RESTART : SM_Mask;
      SM_RESTART     : SM_Mask;
      SM_ENABLE      : SM_Mask;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Object_Size => 32;
   for CTRL_Register use record
      CLKDIV_RESTART at 0 range 8 .. 11;
      SM_RESTART     at 0 range 4 .. 7;
      SM_ENABLE      at 0 range 0 .. 3;
   end record;

   type FSTAT_Register is record
      TXEMPTY  : SM_Mask := (others => True);
      TXFULL   : SM_Mask := (others => False);
      RXEMPTY  : SM_Mask := (others => True);
      RXFULL   : SM_Mask := (others => False);
   end record
      with Volatile_Full_Access,
           Async_Writers,
           Object_Size => 32;
   for FSTAT_Register use record
      TXEMPTY  at 0 range 24 .. 27;
      TXFULL   at 0 range 16 .. 19;
      RXEMPTY  at 0 range 8 .. 11;
      RXFULL   at 0 range 0 .. 3;
   end record;

   type FDEBUG_Register is record
      TXSTALL  : SM_Mask;
      TXOVER   : SM_Mask;
      RXUNDER  : SM_Mask;
      RXSTALL  : SM_Mask;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Writers,
           Async_Readers,
           Object_Size => 32;
   for FDEBUG_Register use record
      TXSTALL  at 0 range 24 .. 27;
      TXOVER   at 0 range 16 .. 19;
      RXUNDER  at 0 range 8 .. 11;
      RXSTALL  at 0 range 0 .. 3;
   end record;

   type FIFO_Array is array (SM_Index) of UInt32
      with Component_Size => 32;

   type IRQ_Array is array (SM_IRQ_Flag) of Boolean
      with Component_Size => 1;

   type IRQ_Register is record
      SM : IRQ_Array := (others => False);
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Async_Writers,
           Object_Size => 32;
   for IRQ_Register use record
      SM at 0 range 0 .. 7;
   end record;

   type SM_Array is array (SM_Index) of SM_Register
      with Volatile, Component_Size => 192;

   type INSTR_MEM_Array is array (PIO_Address) of PIO_Instruction
      with Component_Size => 32;

   type INT_Flag_Array is array (PIO_IRQ_Flag) of SM_Mask
      with Component_Size => 4, Size => 12;

   type INT_Register is record
      Flag : INT_Flag_Array;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Async_Writers,
           Object_Size => 32;
   for INT_Register use record
      Flag     at 0 range 0 .. 11;
   end record;

   type INT_Group is record
      INTE : INT_Register;
      INTF : INT_Register;
      INTS : INT_Register;
   end record
      with Volatile;
   for INT_Group use record
      INTE at 0 range 0 .. 31;
      INTF at 4 range 0 .. 31;
      INTS at 8 range 0 .. 31;
   end record;

   type INT_Array is array (PIO_IRQ_ID) of INT_Group
      with Component_Size => 96;

   type PIO_Peripheral is record
      CTRL        : CTRL_Register;
      FSTAT       : FSTAT_Register;
      FDEBUG      : FDEBUG_Register;
      TXF         : FIFO_Array;
      RXF         : FIFO_Array;
      IRQ         : IRQ_Register;
      IRQ_FORCE   : IRQ_Register;
      INSTR_MEM   : INSTR_MEM_Array;
      INTR        : INT_Register;
      INT         : INT_Array; --  IRQn_INTE, IRQn_INTF, IRQn_INTS
      SM          : SM_Array;
   end record
      with Volatile;
   for PIO_Peripheral use record
      CTRL        at 16#000# range 0 .. 31;
      FSTAT       at 16#004# range 0 .. 31;
      FDEBUG      at 16#008# range 0 .. 31;
      TXF         at 16#010# range 0 .. 127;
      RXF         at 16#020# range 0 .. 127;
      IRQ         at 16#030# range 0 .. 31;
      IRQ_FORCE   at 16#034# range 0 .. 31;
      INSTR_MEM   at 16#048# range 0 .. 1023;
      INTR        at 16#128# range 0 .. 31;
      INT         at 16#12C# range 0 .. 191;
      SM          at 16#0C8# range 0 .. 767;
   end record;

   pragma Warnings (Off, "component of ""PIO_Array"" padded by * bits");
   type PIO_Array is array (Device) of PIO_Peripheral
      with Volatile, Component_Size => 16#0010_0000# * 8;
   pragma Warnings (On, "component of ""PIO_Array"" padded by * bits");

   PIO : PIO_Array
      with Import, Address => System'To_Address (16#5020_0000#);

   procedure Enable
      (This : Device)
   is
      use RP.Reset;
      R : constant Reset_Id := Reset_Id'Val
         (Reset_Id'Pos (Reset_PIO0) + Natural (This));
   begin
      Reset_Peripheral (R);
   end Enable;

   procedure Disable
      (This : Device)
   is
   begin
      PIO (This).CTRL.SM_ENABLE := (others => False);
   end Disable;

   procedure Set_Out_Pins
      (Config    : in out SM_Config;
       Out_Base  : RP.GPIO.GPIO_Pin;
       Out_Count : Pin_Count)
   is
   begin
      Config.PINCTRL.OUT_BASE := UInt5 (Out_Base);
      Config.PINCTRL.OUT_COUNT := UInt6 (Out_Count);
   end Set_Out_Pins;

   procedure Set_Set_Pins
      (Config    : in out SM_Config;
       Set_Base  : RP.GPIO.GPIO_Pin;
       Set_Count : Pin_Count)
   is
   begin
      Config.PINCTRL.SET_BASE := UInt5 (Set_Base);
      Config.PINCTRL.SET_COUNT := UInt3 (Set_Count);
   end Set_Set_Pins;

   procedure Set_In_Pins
      (Config    : in out SM_Config;
       In_Base   : RP.GPIO.GPIO_Pin)
   is
   begin
      Config.PINCTRL.IN_BASE := UInt5 (In_Base);
   end Set_In_Pins;

   procedure Set_Sideset_Pins
      (Config       : in out SM_Config;
       Sideset_Base : RP.GPIO.GPIO_Pin)
   is
   begin
      Config.PINCTRL.SIDESET_BASE := UInt5 (Sideset_Base);
   end Set_Sideset_Pins;

   procedure Set_Sideset
      (Config    : in out SM_Config;
       Bit_Count : Sideset_Bit_Count;
       Optional  : Boolean;
       Pindirs   : Boolean)
   is
      EXECCTRL : EXECCTRL_Register := To_EXECCTRL (Config.EXECCTRL);
   begin
      EXECCTRL.SIDE_EN := Optional;
      EXECCTRL.SIDE_PINDIR := Pindirs;
      Config.EXECCTRL := To_UInt32 (EXECCTRL);
      Config.PINCTRL.SIDESET_COUNT := UInt3 (Bit_Count);
   end Set_Sideset;

   procedure Set_Clock_Frequency
      (Config    : in out SM_Config;
       Frequency : Hertz)
   is
      Div : constant Divider :=
         Divider (Float (RP.Clock.Frequency (RP.Clock.SYS)) / Float (Frequency));
   begin
      Set_Clock_Divider (Config, Div);
   end Set_Clock_Frequency;

   function Div_Integer
      (Div : Divider)
      return UInt16
   is
      I : constant Natural := Natural (Div);
   begin
      if Divider (I) > Div then
         return UInt16 (I - 1);
      else
         return UInt16 (I);
      end if;
   end Div_Integer;

   function Div_Fraction
      (Div : Divider)
      return UInt8
   is (UInt8 ((Div - Divider (Div_Integer (Div))) * 2 ** UInt8'Size));

   procedure Set_Clock_Divider
      (Config : in out SM_Config;
       Div    : Divider)
   is
   begin
      Set_Clkdiv_Int_Frac (Config, Div_Integer (Div), Div_Fraction (Div));
   end Set_Clock_Divider;

   procedure Set_Clkdiv_Int_Frac
      (Config    : in out SM_Config;
       Div_Int   : UInt16;
       Div_Frac  : UInt8)
   is
   begin
      Config.CLKDIV :=
         (INT  => Div_Int,
          FRAC => Div_Frac);
   end Set_Clkdiv_Int_Frac;

   procedure Set_Wrap
      (Config      : in out SM_Config;
       Wrap_Target : PIO_Address;
       Wrap        : PIO_Address)
   is
      EXECCTRL : EXECCTRL_Register := To_EXECCTRL (Config.EXECCTRL);
   begin
      EXECCTRL.WRAP_BOTTOM := UInt5 (Wrap_Target);
      EXECCTRL.WRAP_TOP := UInt5 (Wrap);
      Config.EXECCTRL := To_UInt32 (EXECCTRL);
   end Set_Wrap;

   procedure Set_Jmp_Pin
      (Config : in out SM_Config;
       Pin    : RP.GPIO.GPIO_Pin)
   is
      EXECCTRL : EXECCTRL_Register := To_EXECCTRL (Config.EXECCTRL);
   begin
      EXECCTRL.JMP_PIN := UInt5 (Pin);
      Config.EXECCTRL := To_UInt32 (EXECCTRL);
   end Set_Jmp_Pin;

   procedure Set_In_Shift
      (Config         : in out SM_Config;
       Shift_Right    : Boolean;
       Autopush       : Boolean;
       Push_Threshold : Shift_Threshold)
   is
   begin
      Config.SHIFTCTRL.IN_SHIFTDIR := Shift_Right;
      Config.SHIFTCTRL.AUTOPUSH := Autopush;
      if Push_Threshold = 32 then
         Config.SHIFTCTRL.PUSH_THRESH := 0;
      else
         Config.SHIFTCTRL.PUSH_THRESH := UInt5 (Push_Threshold);
      end if;
   end Set_In_Shift;

   procedure Set_Out_Shift
      (Config         : in out SM_Config;
       Shift_Right    : Boolean;
       Autopull       : Boolean;
       Pull_Threshold : Shift_Threshold)
   is
   begin
      Config.SHIFTCTRL.OUT_SHIFTDIR := Shift_Right;
      Config.SHIFTCTRL.AUTOPULL := Autopull;
      if Pull_Threshold = 32 then
         Config.SHIFTCTRL.PULL_THRESH := 0;
      else
         Config.SHIFTCTRL.PULL_THRESH := UInt5 (Pull_Threshold);
      end if;
   end Set_Out_Shift;

   procedure Set_FIFO_Join
      (Config  : in out SM_Config;
       Join_TX : Boolean;
       Join_RX : Boolean)
   is
   begin
      Config.SHIFTCTRL.FJOIN_TX := Join_TX;
      Config.SHIFTCTRL.FJOIN_RX := Join_RX;
   end Set_FIFO_Join;

   procedure Set_Out_Special
      (Config           : in out SM_Config;
       Sticky           : Boolean;
       Has_Enable_Pin   : Boolean;
       Enable_Pin_Index : RP.GPIO.GPIO_Pin)
   is
      EXECCTRL : EXECCTRL_Register := To_EXECCTRL (Config.EXECCTRL);
   begin
      EXECCTRL.OUT_STICKY := Sticky;
      EXECCTRL.INLINE_OUT_EN := Has_Enable_Pin;
      EXECCTRL.OUT_EN_SEL := UInt5 (Enable_Pin_Index);
      Config.EXECCTRL := To_UInt32 (EXECCTRL);
   end Set_Out_Special;

   procedure Set_MOV_Status
      (Config     : in out SM_Config;
       Status_Sel : MOV_Status_Type;
       Status_N   : UInt5)
   is
      EXECCTRL : EXECCTRL_Register := To_EXECCTRL (Config.EXECCTRL);
   begin
      EXECCTRL.STATUS_N := UInt4 (Status_N);
      EXECCTRL.STATUS_SEL := Status_Sel = RX_Less_Than;
      Config.EXECCTRL := To_UInt32 (EXECCTRL);
   end Set_MOV_Status;

   function Default_SM_Config
      return SM_Config
   is (SM_Config'(others => <>));

   procedure Set_Config
      (This   : Device;
       SM     : SM_Index;
       Config : SM_Config)
   is
   begin
      PIO (This).SM (SM).CLKDIV := Config.CLKDIV;
      PIO (This).SM (SM).EXECCTRL := Config.EXECCTRL;
      PIO (This).SM (SM).SHIFTCTRL := Config.SHIFTCTRL;
      PIO (This).SM (SM).PINCTRL := Config.PINCTRL;
   end Set_Config;

   function GPIO_Function
      (PIO : Device)
      return RP.GPIO.GPIO_Function
   is
      use type RP.GPIO.GPIO_Function;
   begin
      return RP.GPIO.PIO0 + RP.GPIO.GPIO_Function (PIO);
   end GPIO_Function;

   procedure Set_Enabled
      (This    : Device;
       SM      : SM_Index;
       Enabled : Boolean)
   is
   begin
      PIO (This).CTRL.SM_ENABLE (SM) := Enabled;
   end Set_Enabled;

   procedure Set_Enabled
      (This : Device;
       SM   : SM_Mask)
   is
   begin
      PIO (This).CTRL.SM_ENABLE := SM;
   end Set_Enabled;

   function Enabled
      (This : Device)
      return SM_Mask
   is (PIO (This).CTRL.SM_ENABLE);

   procedure Clear_FIFOs
      (This    : Device;
       SM      : SM_Index)
   is
   begin
      PIO (This).SM (SM).SHIFTCTRL.FJOIN_RX :=
         PIO (This).SM (SM).SHIFTCTRL.FJOIN_RX xor True;
      PIO (This).SM (SM).SHIFTCTRL.FJOIN_RX :=
         PIO (This).SM (SM).SHIFTCTRL.FJOIN_RX xor True;
   end Clear_FIFOs;

   procedure SM_Initialize
      (This       : Device;
       SM         : SM_Index;
       Initial_PC : PIO_Address;
       Config     : SM_Config)
   is
      Mask : SM_Mask := (others => False);
   begin
      Mask (SM) := True;

      Set_Enabled (This, SM, False);
      Set_Config (This, SM, Config);
      Clear_FIFOs (This, SM);

      PIO (This).FDEBUG := (others => Mask);
      PIO (This).CTRL.SM_RESTART := Mask;
      PIO (This).CTRL.CLKDIV_RESTART := Mask;

      Execute (This, SM, PIO_Instruction (Initial_PC));
   end SM_Initialize;

   procedure Set_Pin_Direction
      (This      : Device;
       SM        : SM_Index;
       Pin       : RP.GPIO.GPIO_Pin;
       Direction : Pin_Direction)
   is
      Instruction : constant PIO_Instruction :=
         (if Direction = Output then 16#E081# else 16#E080#);
      Save : PINCTRL_Register;
   begin
      Save := PIO (This).SM (SM).PINCTRL;
      PIO (This).SM (SM).PINCTRL :=
         (SET_COUNT  => 1,
          SET_BASE   => UInt5 (Pin),
          others     => <>);
      Execute (This, SM, Instruction);
      PIO (This).SM (SM).PINCTRL := Save;
   end Set_Pin_Direction;

   procedure Execute
      (This        : Device;
       SM          : SM_Index;
       Instruction : PIO_Instruction)
   is
   begin
      PIO (This).SM (SM).INSTR := UInt32 (Instruction);
   end Execute;

   function Is_JMP
      (Insn : PIO_Instruction)
      return Boolean
   is ((Insn and 16#E000#) = 0);

   procedure Load
      (This   : Device;
       Prog   : Program;
       Offset : PIO_Address)
   is
      J : PIO_Address := Offset;
   begin
      for Instruction of Prog loop
         if Is_JMP (Instruction) then
            PIO (This).INSTR_MEM (J) := Instruction + PIO_Instruction (Offset);
         else
            PIO (This).INSTR_MEM (J) := Instruction;
         end if;
         J := J + 1;
      end loop;
   end Load;

   procedure Put
      (This : Device;
       SM   : SM_Index;
       Data : UInt32)
   is
      TXFULL : Boolean;
   begin
      loop
         TXFULL := PIO (This).FSTAT.TXFULL (SM);
         exit when not TXFULL;
      end loop;
      PIO (This).TXF (SM) := Data;
   end Put;

   procedure Put
      (This : Device;
       SM   : SM_Index;
       Data : UInt32_Array)
   is
   begin
      for D of Data loop
         Put (This, SM, D);
      end loop;
   end Put;

   procedure Try_Put
      (This    : Device;
       SM      : SM_Index;
       Data    : UInt32;
       Success : out Boolean)
   is
   begin
      Success := PIO (This).FSTAT.TXFULL (SM);
      Success := not Success;
      if Success then
         PIO (This).TXF (SM) := Data;
      end if;
   end Try_Put;

   procedure Set_GPIO_Base
      (This : Device;
       Base : PIO_GPIO_Base)
   is
   begin
      raise Constraint_Error with "PIO GPIOBASE not supported on RP2040";
   end Set_GPIO_Base;

   procedure Get
      (This : Device;
       SM   : SM_Index;
       Data : out UInt32)
   is
      RXEMPTY : Boolean;
   begin
      loop
         RXEMPTY := PIO (This).FSTAT.RXEMPTY (SM);
         exit when not RXEMPTY;
      end loop;
      Data := PIO (This).RXF (SM);
   end Get;

   procedure Get
      (This : Device;
       SM   : SM_Index;
       Data : out UInt32_Array)
   is
   begin
      for I in Data'Range loop
         Get (This, SM, Data (I));
      end loop;
   end Get;

   procedure Try_Get
      (This    : Device;
       SM      : SM_Index;
       Data    : out UInt32;
       Success : out Boolean)
   is
   begin
      Success := PIO (This).FSTAT.RXEMPTY (SM);
      Success := not Success;
      if Success then
         Data := PIO (This).RXF (SM);
      end if;
   end Try_Get;

   function RX_FIFO_Full
      (This : Device;
       SM   : SM_Index)
       return Boolean
   is (PIO (This).FSTAT.RXFULL (SM));

   function RX_FIFO_Empty
      (This : Device;
       SM   : SM_Index)
       return Boolean
   is (PIO (This).FSTAT.RXEMPTY (SM));

   function TX_FIFO_Full
      (This : Device;
       SM   : SM_Index)
       return Boolean
   is (PIO (This).FSTAT.TXFULL (SM));

   function TX_FIFO_Empty
      (This : Device;
       SM   : SM_Index)
       return Boolean
   is (PIO (This).FSTAT.TXEMPTY (SM));

   function TX_FIFO_Address
      (This : Device;
       SM   : SM_Index)
      return System.Address
   is (PIO (This).TXF (SM)'Address);

   function RX_FIFO_Address
      (This : Device;
       SM   : SM_Index)
      return System.Address
   is (PIO (This).RXF (SM)'Address);

   function FIFO_Status
      (This : Device;
       SM   : SM_Index)
       return SM_FIFO_Status
   is
      FDEBUG : constant FDEBUG_Register := PIO (This).FDEBUG;
   begin
      return SM_FIFO_Status'
         (TXSTALL => FDEBUG.TXSTALL (SM),
          TXOVER  => FDEBUG.TXOVER (SM),
          RXUNDER => FDEBUG.RXUNDER (SM),
          RXSTALL => FDEBUG.RXSTALL (SM));
   end FIFO_Status;

   procedure Clear_FIFO_Status
      (This  : Device;
       SM    : SM_Index;
       Flags : SM_FIFO_Status := (others => True))
   is
      FDEBUG : FDEBUG_Register := (others => (others => False));
   begin
      FDEBUG.TXSTALL (SM) := Flags.TXSTALL;
      FDEBUG.TXOVER (SM) := Flags.TXOVER;
      FDEBUG.RXUNDER (SM) := Flags.RXUNDER;
      FDEBUG.RXSTALL (SM) := Flags.RXSTALL;
      PIO (This).FDEBUG := FDEBUG;
   end Clear_FIFO_Status;

   procedure Enable_IRQ_Flag
      (This : Device;
       IRQ  : PIO_IRQ_ID;
       SM   : SM_Index;
       Flag : PIO_IRQ_Flag)
   is
   begin
      PIO (This).INT (IRQ).INTE.Flag (Flag) (SM) := True;
   end Enable_IRQ_Flag;

   procedure Disable_IRQ_Flag
      (This : Device;
       IRQ  : PIO_IRQ_ID;
       SM   : SM_Index;
       Flag : PIO_IRQ_Flag)
   is
   begin
      PIO (This).INT (IRQ).INTE.Flag (Flag) (SM) := False;
   end Disable_IRQ_Flag;

   function IRQ_Flag_Status
      (This : Device;
       IRQ  : PIO_IRQ_ID;
       SM   : SM_Index;
       Flag : PIO_IRQ_Flag)
       return Boolean
   is (PIO (This).INT (IRQ).INTS.Flag (Flag) (SM));

   procedure Force_IRQ_Flag
      (This : Device;
       IRQ  : PIO_IRQ_ID;
       SM   : SM_Index;
       Flag : PIO_IRQ_Flag)
   is
   begin
      PIO (This).INT (IRQ).INTF.Flag (Flag) (SM) := True;
   end Force_IRQ_Flag;

   procedure Clear_Force_IRQ_Flag
      (This : Device;
       IRQ  : PIO_IRQ_ID;
       SM   : SM_Index;
       Flag : PIO_IRQ_Flag)
   is
   begin
      PIO (This).INT (IRQ).INTF.Flag (Flag) (SM) := False;
   end Clear_Force_IRQ_Flag;

   procedure Enable_SM_IRQ_Flag
      (This : Device;
       IRQ  : PIO_IRQ_ID;
       Flag : SM_IRQ_Flag)
   is
   begin
      PIO (This).INT (IRQ).INTE.Flag (SM_IRQ) (SM_Index (Flag)) := True;
   end Enable_SM_IRQ_Flag;

   procedure Disable_SM_IRQ_Flag
      (This : Device;
       IRQ  : PIO_IRQ_ID;
       Flag : SM_IRQ_Flag)
   is
   begin
      PIO (This).INT (IRQ).INTE.Flag (SM_IRQ) (SM_Index (Flag)) := False;
   end Disable_SM_IRQ_Flag;

   procedure Ack_SM_IRQ
      (This : Device;
       Flag : SM_IRQ_Flag)
   is
   begin
      PIO (This).IRQ.SM (Flag) := True;
   end Ack_SM_IRQ;

   function SM_IRQ_Status
      (This : Device;
       Flag : SM_IRQ_Flag)
       return Boolean
   is (PIO (This).IRQ.SM (Flag));

   procedure Force_SM_IRQ
      (This : Device;
       Flag : SM_IRQ_Flag)
   is
   begin
      PIO (This).IRQ_FORCE.SM (Flag) := True;
   end Force_SM_IRQ;

   procedure Clear_Force_SM_IRQ
      (This : Device;
       Flag : SM_IRQ_Flag)
   is
   begin
      PIO (This).IRQ_FORCE.SM (Flag) := False;
   end Clear_Force_SM_IRQ;

   function DMA_TX_Trigger
      (This : Device;
       SM   : SM_Index)
       return RP.DMA.DMA_Request_Trigger
   is
      use RP.DMA;
      RT : Natural := DMA_Request_Trigger'Pos (PIO0_TX0);
   begin
      RT := RT + Natural (SM) + (Natural (This) * 8);
      return DMA_Request_Trigger'Val (RT);
   end DMA_TX_Trigger;

   function DMA_RX_Trigger
      (This : Device;
       SM   : SM_Index)
       return RP.DMA.DMA_Request_Trigger
   is
      use RP.DMA;
      RT : Natural := DMA_Request_Trigger'Pos (PIO0_RX0);
   begin
      RT := RT + Natural (SM) + (Natural (This) * 8);
      return DMA_Request_Trigger'Val (RT);
   end DMA_RX_Trigger;

   function Current_Instruction_Address
      (This : Device;
       SM   : SM_Index)
       return PIO_Address
   is (PIO_Address (PIO (This).SM (SM).ADDR));

end RP.PIO;
