--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with Ada.Unchecked_Conversion;
with RP.Clock;
with RP.Reset;
with RP2040_SVD.Interrupts;

package body RP.PIO is
   procedure Enable
      (This : in out PIO_Device)
   is
      use RP.Reset;
   begin
      case This.Num is
         when 0 => Reset_Peripheral (Reset_PIO0);
         when 1 => Reset_Peripheral (Reset_PIO1);
      end case;
   end Enable;

   procedure Disable
      (This : in out PIO_Device)
   is
   begin
      This.Periph.CTRL.SM_ENABLE := 0;
   end Disable;

   procedure Set_Out_Pins
      (Config    : in out PIO_SM_Config;
       Out_Base  : GPIO_Pin;
       Out_Count : Pin_Count)
   is
   begin
      Config.PINCTRL.OUT_BASE := SM0_PINCTRL_OUT_BASE_Field (Out_Base);
      Config.PINCTRL.OUT_COUNT := SM0_PINCTRL_OUT_COUNT_Field (Out_Count);
   end Set_Out_Pins;

   procedure Set_Set_Pins
      (Config    : in out PIO_SM_Config;
       Set_Base  : GPIO_Pin;
       Set_Count : Pin_Count)
   is
   begin
      Config.PINCTRL.SET_BASE := SM0_PINCTRL_SET_BASE_Field (Set_Base);
      Config.PINCTRL.SET_COUNT := SM0_PINCTRL_SET_COUNT_Field (Set_Count);
   end Set_Set_Pins;

   procedure Set_In_Pins
      (Config    : in out PIO_SM_Config;
       In_Base   : GPIO_Pin)
   is
   begin
      Config.PINCTRL.IN_BASE := SM0_PINCTRL_IN_BASE_Field (In_Base);
   end Set_In_Pins;

   procedure Set_Sideset_Pins
      (Config       : in out PIO_SM_Config;
       Sideset_Base : GPIO_Pin)
   is
   begin
      Config.PINCTRL.SIDESET_BASE := SM0_PINCTRL_SIDESET_BASE_Field (Sideset_Base);
   end Set_Sideset_Pins;

   procedure Set_Sideset
      (Config    : in out PIO_SM_Config;
       Bit_Count : Sideset_Bit_Count;
       Optional  : Boolean;
       Pindirs   : Boolean)
   is
   begin
      Config.PINCTRL.SIDESET_COUNT := SM0_PINCTRL_SIDESET_COUNT_Field (Bit_Count);
      Config.EXECCTRL.SIDE_EN := Optional;
      Config.EXECCTRL.SIDE_PINDIR := Pindirs;
   end Set_Sideset;

   procedure Set_Clock_Frequency
      (Config    : in out PIO_SM_Config;
       Frequency : Hertz)
   is
      Div : constant Divider :=
         Divider (Float (RP.Clock.Frequency (RP.Clock.SYS)) / Float (Frequency));
   begin
      Set_Clock_Divider (Config, Div);
   end Set_Clock_Frequency;

   function Div_Integer
      (Div : Divider)
      return SM0_CLKDIV_INT_Field
   is
      I : constant Natural := Natural (Div);
   begin
      if Divider (I) > Div then
         return SM0_CLKDIV_INT_Field (I - 1);
      else
         return SM0_CLKDIV_INT_Field (I);
      end if;
   end Div_Integer;

   function Div_Fraction
      (Div : Divider)
      return SM0_CLKDIV_FRAC_Field
   is (SM0_CLKDIV_FRAC_Field ((Div - Divider (Div_Integer (Div))) * 2 ** SM0_CLKDIV_FRAC_Field'Size));

   procedure Set_Clock_Divider
      (Config : in out PIO_SM_Config;
       Div    : Divider)
   is
   begin
      Set_Clkdiv_Int_Frac (Config, Div_Integer (Div), Div_Fraction (Div));
   end Set_Clock_Divider;

   procedure Set_Clkdiv_Int_Frac
      (Config   : in out PIO_SM_Config;
       Div_Int  : UInt16;
       Div_Frac : UInt8)
   is
   begin
      Config.CLKDIV :=
         (INT    => SM0_CLKDIV_INT_Field (Div_Int),
          FRAC   => SM0_CLKDIV_FRAC_Field (Div_Frac),
          others => 0);
   end Set_Clkdiv_Int_Frac;

   procedure Set_Wrap
      (Config      : in out PIO_SM_Config;
       Wrap_Target : PIO_Address;
       Wrap        : PIO_Address)
   is
   begin
      Config.EXECCTRL.WRAP_BOTTOM := SM0_EXECCTRL_WRAP_BOTTOM_Field (Wrap_Target);
      Config.EXECCTRL.WRAP_TOP := SM0_EXECCTRL_WRAP_TOP_Field (Wrap);
   end Set_Wrap;

   procedure Set_Jmp_Pin
      (Config : in out PIO_SM_Config;
       Pin    : GPIO_Pin)
   is
   begin
      Config.EXECCTRL.JMP_PIN := SM0_EXECCTRL_JMP_PIN_Field (Pin);
   end Set_Jmp_Pin;

   procedure Set_In_Shift
      (Config         : in out PIO_SM_Config;
       Shift_Right    : Boolean;
       Autopush       : Boolean;
       Push_Threshold : Shift_Threshold)
   is
      Thresh : SM0_SHIFTCTRL_PUSH_THRESH_Field;
   begin
      Config.SHIFTCTRL.IN_SHIFTDIR := Shift_Right;
      Config.SHIFTCTRL.AUTOPUSH := Autopush;
      if Push_Threshold = 32 then
         Thresh := 0;
      else
         Thresh := SM0_SHIFTCTRL_PUSH_THRESH_Field (Push_Threshold);
      end if;
      Config.SHIFTCTRL.PUSH_THRESH := Thresh;
   end Set_In_Shift;

   procedure Set_Out_Shift
      (Config         : in out PIO_SM_Config;
       Shift_Right    : Boolean;
       Autopull       : Boolean;
       Pull_Threshold : Shift_Threshold)
   is
      Thresh : SM0_SHIFTCTRL_PULL_THRESH_Field;
   begin
      Config.SHIFTCTRL.OUT_SHIFTDIR := Shift_Right;
      Config.SHIFTCTRL.AUTOPULL := Autopull;
      if Pull_Threshold = 32 then
         Thresh := 0;
      else
         Thresh := SM0_SHIFTCTRL_PULL_THRESH_Field (Pull_Threshold);
      end if;
      Config.SHIFTCTRL.PULL_THRESH := Thresh;
   end Set_Out_Shift;

   procedure Set_FIFO_Join
      (Config  : in out PIO_SM_Config;
       Join_TX : Boolean;
       Join_RX : Boolean)
   is
   begin
      Config.SHIFTCTRL.FJOIN_TX := Join_TX;
      Config.SHIFTCTRL.FJOIN_RX := Join_RX;
   end Set_FIFO_Join;

   procedure Set_Out_Special
      (Config           : in out PIO_SM_Config;
       Sticky           : Boolean;
       Has_Enable_Pin   : Boolean;
       Enable_Pin_Index : GPIO_Pin)
   is
   begin
      Config.EXECCTRL.OUT_STICKY := Sticky;
      Config.EXECCTRL.INLINE_OUT_EN := Has_Enable_Pin;
      Config.EXECCTRL.OUT_EN_SEL := SM0_EXECCTRL_OUT_EN_SEL_Field (Enable_Pin_Index);
   end Set_Out_Special;

   procedure Set_MOV_Status
      (Config     : in out PIO_SM_Config;
       Status_Sel : PIO_MOV_Status_Type;
       Status_N   : UInt4)
   is
   begin
      case Status_Sel is
         when TX_Less_Than =>
            Config.EXECCTRL.STATUS_SEL := TXLEVEL;
         when RX_Less_Than =>
            Config.EXECCTRL.STATUS_SEL := RXLEVEL;
      end case;
      Config.EXECCTRL.STATUS_N := Status_N;
   end Set_MOV_Status;

   function Default_SM_Config
      return PIO_SM_Config
   is (PIO_SM_Config'(others => <>));
   --  Default_SM_Config is equivalent to:
   --
   --  Set_Clkdiv_Int_Frac (C,
   --      Div_Int  => 1,
   --      Div_Frac => 0);
   --   Set_Wrap (C,
   --      Wrap_Target => 0,
   --      Wrap        => 31);
   --   Set_In_Shift (C,
   --      Shift_Right    => True,
   --      Autopush       => False,
   --      Push_Threshold => 32);
   --   Set_Out_Shift (C,
   --      Shift_Right    => True,
   --      Autopull       => False,
   --      Pull_Threshold => 32);

   procedure Set_Config
      (This   : in out PIO_Device;
       SM     : PIO_SM;
       Config : PIO_SM_Config)
   is
   begin
      This.Periph.SM (SM).CLKDIV := Config.CLKDIV;
      This.Periph.SM (SM).EXECCTRL := Config.EXECCTRL;
      This.Periph.SM (SM).SHIFTCTRL := Config.SHIFTCTRL;
      This.Periph.SM (SM).PINCTRL := Config.PINCTRL;
   end Set_Config;

   function GPIO_Function
      (PIO : PIO_Device)
      return RP.GPIO.GPIO_Function
   is
   begin
      case PIO.Num is
         when 0 => return RP.GPIO.PIO0;
         when 1 => return RP.GPIO.PIO1;
      end case;
   end GPIO_Function;

   procedure Set_Enabled
      (This    : in out PIO_Device;
       SM      : PIO_SM;
       Enabled : Boolean)
   is
      Mask : constant CTRL_SM_ENABLE_Field := CTRL_SM_ENABLE_Field
         (Shift_Left (UInt32 (1), Natural (SM)));
   begin
      if Enabled then
         This.Periph.CTRL.SM_ENABLE := This.Periph.CTRL.SM_ENABLE or Mask;
      else
         This.Periph.CTRL.SM_ENABLE := This.Periph.CTRL.SM_ENABLE and not Mask;
      end if;
   end Set_Enabled;

   procedure Set_Enabled
      (This : in out PIO_Device;
       SM   : PIO_SM_Mask)
   is
      function To_UInt4 is new Ada.Unchecked_Conversion
         (Source => PIO_SM_Mask,
          Target => UInt4);
   begin
      This.Periph.CTRL.SM_ENABLE := To_UInt4 (SM);
   end Set_Enabled;

   function Enabled
      (This : PIO_Device)
      return PIO_SM_Mask
   is
      function To_PIO_SM_Mask is new Ada.Unchecked_Conversion
         (Source => UInt4,
          Target => PIO_SM_Mask);
   begin
      return To_PIO_SM_Mask (This.Periph.CTRL.SM_ENABLE);
   end Enabled;

   procedure Clear_FIFOs
      (This : in out PIO_Device;
       SM   : PIO_SM)
   is
   begin
      This.Periph.SM (SM).SHIFTCTRL.FJOIN_RX :=
         This.Periph.SM (SM).SHIFTCTRL.FJOIN_RX xor True;
      This.Periph.SM (SM).SHIFTCTRL.FJOIN_RX :=
         This.Periph.SM (SM).SHIFTCTRL.FJOIN_RX xor True;
   end Clear_FIFOs;

   procedure SM_Initialize
      (This       : in out PIO_Device;
       SM         : PIO_SM;
       Initial_PC : PIO_Address;
       Config     : PIO_SM_Config)
   is
   begin
      Set_Enabled (This, SM, False);
      Set_Config (This, SM, Config);
      Clear_FIFOs (This, SM);

      This.Periph.FDEBUG := (others => (others => True));

      This.Periph.CTRL.SM_RESTART := CTRL_SM_RESTART_Field
         (Shift_Left (UInt32 (1), Natural (SM)));
      This.Periph.CTRL.CLKDIV_RESTART := CTRL_CLKDIV_RESTART_Field
         (Shift_Left (UInt32 (1), Natural (SM)));

      Execute (This, SM, PIO_Instruction (Initial_PC));
   end SM_Initialize;

   procedure Set_Pin_Direction
      (This      : in out PIO_Device;
       SM        : PIO_SM;
       Pin       : GPIO_Pin;
       Direction : PIO_Pin_Direction)
   is
      Save : constant SM0_PINCTRL_Register := This.Periph.SM (SM).PINCTRL;
      Instruction : PIO_Instruction;
   begin
      This.Periph.SM (SM).PINCTRL :=
         (SET_COUNT => 1,
          SET_BASE  => SM0_PINCTRL_SET_BASE_Field (Pin),
          others    => <>);
      case Direction is
         when Output =>
            Instruction := 16#e081#;
         when Input =>
            Instruction := 16#e080#;
      end case;
      Execute (This, SM, Instruction);
      This.Periph.SM (SM).PINCTRL := Save;
   end Set_Pin_Direction;

   procedure Execute
      (This        : in out PIO_Device;
       SM          : PIO_SM;
       Instruction : PIO_Instruction)
   is
   begin
      This.Periph.SM (SM).INSTR.SM0_INSTR := Instruction;
   end Execute;

   procedure Load
      (This        : in out PIO_Device;
       Prog        : Program;
       Offset      : PIO_Address)
   is
      Insn : PIO_Instruction;
   begin
      for I in Prog'Range loop
         Insn := Prog (I);

         --  Check for JMP instruction
         if (Insn and 2#111_00000_000_00000#) = 2#000_00000_000_00000# then
            --  JMP instructions use absolute target addresses. If the program
            --  is loaded at an offset, the JMP targets have to be adjusted with
            --  this offset.

            Insn := Insn + PIO_Instruction (Offset);
         end if;

         This.Periph.INSTR_MEM (Offset + I - Prog'First) := UInt32 (Insn);
      end loop;
   end Load;

   procedure Put
      (This : in out PIO_Device;
       SM   : PIO_SM;
       Data : UInt32)
   is
   begin
      while This.Periph.FSTAT.TXFULL (SM) loop
         null;
      end loop;
      This.Periph.TXF (SM) := Data;
   end Put;

   procedure Put
      (This : in out PIO_Device;
       SM   : PIO_SM;
       Data : UInt32_Array)
   is
   begin
      for D of Data loop
         while This.Periph.FSTAT.TXFULL (SM) loop
            null;
         end loop;
         This.Periph.TXF (SM) := D;
      end loop;
   end Put;

   procedure Try_Put
     (This    : in out PIO_Device;
      SM      : PIO_SM;
      Data    : UInt32;
      Success : out Boolean)
   is
   begin
      Success := not This.TX_FIFO_Full (SM);
      if Success then
         This.Periph.TXF (SM) := Data;
      end if;
   end Try_Put;

   procedure Get
      (This : in out PIO_Device;
       SM   : PIO_SM;
       Data : out UInt32)
   is
   begin
      while This.Periph.FSTAT.RXEMPTY (SM) loop
         null;
      end loop;
      Data := This.Periph.RXF (SM);
   end Get;

   procedure Get
      (This : in out PIO_Device;
       SM   : PIO_SM;
       Data : out UInt32_Array)
   is
   begin
      for I in Data'Range loop
         while This.Periph.FSTAT.RXEMPTY (SM) loop
            null;
         end loop;
         Data (I) := This.Periph.RXF (SM);
      end loop;
   end Get;

   procedure Try_Get
      (This    : in out PIO_Device;
       SM      : PIO_SM;
       Data    : out UInt32;
       Success : out Boolean)
   is
   begin
      Success := not This.RX_FIFO_Empty (SM);
      if Success then
         Data := This.Periph.RXF (SM);
      end if;
   end Try_Get;

   function RX_FIFO_Full (This : PIO_Device; SM : PIO_SM) return Boolean
   is (This.Periph.FSTAT.RXFULL (SM));

   function RX_FIFO_Empty (This : PIO_Device; SM : PIO_SM) return Boolean
   is (This.Periph.FSTAT.RXEMPTY (SM));

   function TX_FIFO_Full (This : PIO_Device; SM : PIO_SM) return Boolean
   is (This.Periph.FSTAT.TXFULL (SM));

   function TX_FIFO_Empty (This : PIO_Device; SM : PIO_SM) return Boolean
   is (This.Periph.FSTAT.TXEMPTY (SM));

   function TX_FIFO_Address
      (This : PIO_Device;
       SM   : PIO_SM)
      return System.Address
   is (This.Periph.TXF (SM)'Address);

   function RX_FIFO_Address
      (This : PIO_Device;
       SM   : PIO_SM)
      return System.Address
   is (This.Periph.RXF (SM)'Address);

   function FIFO_Status
      (This : PIO_Device;
       SM   : PIO_SM)
       return SM_FIFO_Status
   is (SM_FIFO_Status'
      (TXSTALL  => This.Periph.FDEBUG.TXSTALL (SM),
       TXOVER   => This.Periph.FDEBUG.TXOVER (SM),
       RXUNDER  => This.Periph.FDEBUG.RXUNDER (SM),
       RXSTALL  => This.Periph.FDEBUG.RXSTALL (SM)));

   procedure Clear_FIFO_Status
      (This  : in out PIO_Device;
       SM    : PIO_SM;
       Flags : SM_FIFO_Status := (others => True))
   is
      Mask : PIO_SM_Mask := (others => False);
      None : constant PIO_SM_Mask := (others => False);
   begin
      Mask (SM) := True;
      This.Periph.FDEBUG :=
         (TXSTALL => (if Flags.TXSTALL then Mask else None),
          TXOVER  => (if Flags.TXOVER  then Mask else None),
          RXUNDER => (if Flags.RXUNDER then Mask else None),
          RXSTALL => (if Flags.RXSTALL then Mask else None));
   end Clear_FIFO_Status;

   function NVIC_IRQ_Line
      (This : PIO_Device;
       IRQ  : PIO_IRQ_ID)
      return Cortex_M.NVIC.Interrupt_ID
   is
      use RP2040_SVD.Interrupts;
   begin
      case This.Num is
         when 0 =>
            case IRQ is
               when 0 => return PIO0_IRQ_0_Interrupt;
               when 1 => return PIO0_IRQ_1_Interrupt;
            end case;
         when 1 =>
            case IRQ is
               when 0 => return PIO1_IRQ_0_Interrupt;
               when 1 => return PIO1_IRQ_1_Interrupt;
            end case;
      end case;
   end NVIC_IRQ_Line;

   procedure Enable_IRQ (This : in out PIO_Device;
                         IRQ  :        PIO_IRQ_ID)
   is
      Line : constant Cortex_M.NVIC.Interrupt_ID := NVIC_IRQ_Line (This, IRQ);
   begin
      Cortex_M.NVIC.Clear_Pending (Line);
      Cortex_M.NVIC.Enable_Interrupt (Line);
   end Enable_IRQ;

   procedure Disable_IRQ (This : in out PIO_Device;
                          IRQ  :        PIO_IRQ_ID)
   is
      Line : constant Cortex_M.NVIC.Interrupt_ID := NVIC_IRQ_Line (This, IRQ);
   begin
      Cortex_M.NVIC.Disable_Interrupt (Line);
   end Disable_IRQ;

   procedure Enable_IRQ_Flag (This : in out PIO_Device;
                              IRQ  :        PIO_IRQ_ID;
                              Flag :        PIO_IRQ_Flag)
   is
      INTE_Addr : constant System.Address :=
        (case IRQ is
            when 0 => This.Periph.IRQ0_INTE'Address,
            when 1 => This.Periph.IRQ1_INTE'Address);

      INTE : UInt32
        with Address => INTE_Addr, Volatile_Full_Access;
   begin

      INTE := INTE or Flag'Enum_Rep;
   end Enable_IRQ_Flag;

   procedure Disable_IRQ_Flag (This : in out PIO_Device;
                               IRQ  :        PIO_IRQ_ID;
                               Flag :        PIO_IRQ_Flag)
   is
      INTE_Addr : constant System.Address :=
        (case IRQ is
            when 0 => This.Periph.IRQ0_INTE'Address,
            when 1 => This.Periph.IRQ1_INTE'Address);

      INTE : UInt32
        with Address => INTE_Addr, Volatile_Full_Access;
   begin
      INTE := INTE and (not Flag'Enum_Rep);
   end Disable_IRQ_Flag;

   function IRQ_Flag_Status (This : in out PIO_Device;
                             IRQ  :        PIO_IRQ_ID;
                             Flag :        PIO_IRQ_Flag)
                             return Boolean
   is
      INTS_Addr : constant System.Address :=
        (case IRQ is
            when 0 => This.Periph.IRQ0_INTS'Address,
            when 1 => This.Periph.IRQ1_INTS'Address);

      INTS : UInt32
        with Address => INTS_Addr, Volatile_Full_Access;
   begin
      return (INTS and Flag'Enum_Rep) /= 0;
   end IRQ_Flag_Status;

   procedure Force_IRQ_Flag (This : in out PIO_Device;
                             IRQ  :        PIO_IRQ_ID;
                             Flag :        PIO_IRQ_Flag)
   is
      INTF_Addr : constant System.Address :=
        (case IRQ is
            when 0 => This.Periph.IRQ0_INTF'Address,
            when 1 => This.Periph.IRQ1_INTF'Address);

      INTF : UInt32
        with Address => INTF_Addr, Volatile_Full_Access;
   begin
      INTF := INTF or Flag'Enum_Rep;
   end Force_IRQ_Flag;

   procedure Clear_Force_IRQ_Flag (This : in out PIO_Device;
                                   IRQ  :        PIO_IRQ_ID;
                                   Flag :        PIO_IRQ_Flag)
   is
      INTF_Addr : constant System.Address :=
        (case IRQ is
            when 0 => This.Periph.IRQ0_INTF'Address,
            when 1 => This.Periph.IRQ1_INTF'Address);

      INTF : UInt32
        with Address => INTF_Addr, Volatile_Full_Access;
   begin
      INTF := INTF and (not Flag'Enum_Rep);
   end Clear_Force_IRQ_Flag;

   procedure Ack_SM_IRQ (This : in out PIO_Device;
                         Flag :        PIO_SM_IRQ_Flag)
   is
      Mask : constant UInt8 := Shift_Left (1,  Natural (Flag));
   begin
      --  Write 1 to clear
      This.Periph.IRQ.IRQ := Mask;
   end Ack_SM_IRQ;

   --  Acknolege a state-machine-level IRQ

   function SM_IRQ_Status (This : in out PIO_Device;
                           Flag :        PIO_SM_IRQ_Flag)
                           return Boolean
   is
      Mask : constant UInt8 := Shift_Left (1,  Natural (Flag));
   begin
      return (This.Periph.IRQ.IRQ and Mask) /= 0;
   end SM_IRQ_Status;

   procedure Force_SM_IRQ (This : in out PIO_Device;
                           Flag :        PIO_SM_IRQ_Flag)
   is
      Mask : constant UInt8 := Shift_Left (1,  Natural (Flag));
   begin
      This.Periph.IRQ_FORCE.IRQ_FORCE :=
        This.Periph.IRQ_FORCE.IRQ_FORCE or Mask;
   end Force_SM_IRQ;

   procedure Clear_Force_SM_IRQ (This : in out PIO_Device;
                                 Flag :        PIO_SM_IRQ_Flag)
   is
      Mask : constant UInt8 := Shift_Left (1,  Natural (Flag));
   begin
      This.Periph.IRQ_FORCE.IRQ_FORCE :=
        This.Periph.IRQ_FORCE.IRQ_FORCE and (not Mask);
   end Clear_Force_SM_IRQ;

   function DMA_TX_Trigger
      (This : PIO_Device;
       SM   : PIO_SM)
       return RP.DMA.DMA_Request_Trigger
   is (RP.DMA.DMA_Request_Trigger'Val (This.Num * 8 + Natural (SM)));

   function DMA_RX_Trigger
      (This : PIO_Device;
       SM   : PIO_SM)
       return RP.DMA.DMA_Request_Trigger
   is (RP.DMA.DMA_Request_Trigger'Val (This.Num * 8 + Natural (SM) + 4));

   function Current_Instruction_Address
      (This : PIO_Device;
       SM   : PIO_SM)
       return PIO_Address
   is (PIO_Address (This.Periph.SM (SM).ADDR.SM0_ADDR));

end RP.PIO;
