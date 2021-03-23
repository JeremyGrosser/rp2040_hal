--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP2040_SVD.RESETS; use RP2040_SVD.RESETS;
with RP.Clock;

package body RP.PIO is
   procedure Enable
      (This : in out PIO_Device)
   is
   begin
      RESETS_Periph.RESET.pio.Arr (This.Num) := False;
      while not RESETS_Periph.RESET_DONE.pio.Arr (This.Num) loop
         null;
      end loop;
   end Enable;

   procedure Disable
      (This : in out PIO_Device)
   is
   begin
      RESETS_Periph.RESET.pio.Arr (This.Num) := True;
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
      Div : Divider := Divider (Float (RP.Clock.Frequency (RP.Clock.SYS)) / Float (Frequency));
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
   is
      C : PIO_SM_Config := (others => <>);
   begin
      Set_Clkdiv_Int_Frac (C, 1, 0);
      Set_Wrap (C, 0, 31);
      Set_In_Shift (C, True, False, 32);
      Set_Out_Shift (C, True, False, 32);
      return C;
   end Default_SM_Config;

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
   begin
      This.Periph.CTRL.SM_ENABLE := CTRL_SM_ENABLE_Field
         (Shift_Left (UInt32 (1), Natural (SM)));
   end Set_Enabled;

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

      This.Periph.FDEBUG :=
         (RXSTALL => 1,
          RXUNDER => 1,
          TXOVER  => 1,
          TXSTALL => 1,
          others  => <>);

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
   begin
      for I in Prog'Range loop
         This.Periph.INSTR_MEM (Offset + I - Prog'First) := UInt32 (Prog (I));
      end loop;
   end Load;

   procedure Put
      (This : in out PIO_Device;
       SM   : PIO_SM;
       Data : UInt32)
   is
   begin
      while This.Periph.FSTAT.TXEMPTY = 0 loop
         null;
      end loop;
      This.Periph.TXF (SM) := Data;
   end Put;

   procedure Get
      (This : in out PIO_Device;
       SM   : PIO_SM;
       Data : out UInt32)
   is
   begin
      while This.Periph.FSTAT.RXFULL = 0 loop
         null;
      end loop;
      Data := This.Periph.RXF (SM);
   end Get;

end RP.PIO;
