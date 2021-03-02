--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP2040_SVD.RESETS;
with RP.Clock;

package body RP.PIO is
   function Mask
      (SM : State_Machines)
      return UInt4
   is
      M : UInt8 := 0;
   begin
      for I in SM'Range loop
         if SM (I) then
            M := M or Shift_Left (1, Natural (I));
         end if;
      end loop;
      return UInt4 (M);
   end Mask;

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

   procedure Initialize
   is
      use RP2040_SVD.RESETS;
   begin
      RESETS_Periph.RESET.pio.Val := 2#00#;
      while RESETS_Periph.RESET_DONE.pio.Val /= 2#11# loop
         null;
      end loop;
   end Initialize;

   procedure Enable
      (This : in out PIO_Device;
       SM   : State_Machines)
   is
   begin
      This.Periph.CTRL.SM_ENABLE := This.Periph.CTRL.SM_ENABLE or Mask (SM);
   end Enable;

   procedure Disable
      (This : in out PIO_Device;
       SM   : State_Machines)
   is
   begin
      This.Periph.CTRL.SM_ENABLE := This.Periph.CTRL.SM_ENABLE and not Mask (SM);
   end Disable;

   procedure Restart
      (This : in out PIO_Device;
       SM   : State_Machines)
   is
   begin
      This.Periph.CTRL.SM_RESTART := Mask (SM);
   end Restart;

   procedure Configure
      (This   : in out PIO_Device;
       SM     : State_Machine;
       Config : State_Machine_Configuration)
   is
      P : SM_Register renames This.Periph.SM (SM);
   begin
      P.CLKDIV :=
         (INT    => Div_Integer (Config.Clock_Divider),
          FRAC   => Div_Fraction (Config.Clock_Divider),
          others => <>);
      P.PINCTRL :=
         (OUT_BASE      => SM0_PINCTRL_OUT_BASE_Field (Config.Out_Base.Pin),
          OUT_COUNT     => SM0_PINCTRL_OUT_COUNT_Field (Config.Out_Count),
          SET_BASE      => SM0_PINCTRL_SET_BASE_Field (Config.Set_Base.Pin),
          SET_COUNT     => SM0_PINCTRL_SET_COUNT_Field (Config.Set_Count),
          IN_BASE       => SM0_PINCTRL_IN_BASE_Field (Config.In_Base.Pin),
          SIDESET_BASE  => SM0_PINCTRL_SIDESET_BASE_Field (Config.Sideset_Base.Pin),
          SIDESET_COUNT => SM0_PINCTRL_SIDESET_COUNT_Field (Config.Sideset_Count));
      P.EXECCTRL.SIDE_EN := Config.Sideset_Optional;
      P.EXECCTRL.SIDE_PINDIR := Config.Sideset_Pindir;
      P.EXECCTRL.JMP_PIN := SM0_EXECCTRL_JMP_PIN_Field (Config.Jmp_Pin.Pin);
      P.SHIFTCTRL :=
         (AUTOPULL     => Config.Autopull,
          AUTOPUSH     => Config.Autopush,
          PULL_THRESH  => Config.Pull_Threshold,
          PUSH_THRESH  => Config.Push_Threshold,
          OUT_SHIFTDIR => Config.Shift_Out_Right,
          IN_SHIFTDIR  => Config.Shift_In_Right,
          others       => <>);
   end Configure;

   function To_Divider
      (Frequency : Hertz)
       return Divider
   is (Divider (Float (RP.Clock.Frequency (RP.Clock.SYS)) / Float (Frequency)));

   procedure Load
      (This        : in out PIO_Device;
       SM          : State_Machine;
       Prog        : Program;
       Wrap        : Program_Index;
       Wrap_Target : Program_Index;
       Offset      : Program_Index := Program_Index'First)
   is
      P : access PIO_Peripheral renames This.Periph;
   begin
      for I in Prog'Range loop
         P.INSTR_MEM (Offset + (I - Prog'First)) := UInt32 (Prog (I));
      end loop;
      This.Periph.SM (SM).EXECCTRL.WRAP_TOP := SM0_EXECCTRL_WRAP_TOP_Field (Wrap);
      This.Periph.SM (SM).EXECCTRL.WRAP_BOTTOM := SM0_EXECCTRL_WRAP_BOTTOM_Field (Wrap_Target);
      Execute (This, SM, Instruction (Offset)); --  Jump to the first instruction
   end Load;

   procedure Execute
      (This : in out PIO_Device;
       SM   : State_Machine;
       Insn : Instruction)
   is
   begin
      This.Periph.SM (SM).INSTR.SM0_INSTR := SM0_INSTR_SM0_INSTR_Field (Insn);
   end Execute;

   function Address
      (This : PIO_Device;
       SM   : State_Machine)
      return Program_Index
   is (Program_Index (This.Periph.SM (SM).ADDR.SM0_ADDR));

   procedure Receive
      (This : in out PIO_Device;
       SM   : State_Machine;
       Data : out UInt32_Array)
   is
      P : access PIO_Peripheral renames This.Periph;
   begin
      for I in Data'Range loop
         while P.FSTAT.RXFULL = 0 loop
            null;
         end loop;
         Data (I) := P.RXF (SM);
      end loop;
   end Receive;

   procedure Receive
      (This : in out PIO_Device;
       SM   : State_Machine;
       Data : out UInt32)
   is
      P : access PIO_Peripheral renames This.Periph;
   begin
      while P.FSTAT.RXFULL = 0 loop
         null;
      end loop;
      Data := P.RXF (SM);
   end Receive;

   procedure Transmit
      (This : in out PIO_Device;
       SM   : State_Machine;
       Data : UInt32_Array)
   is
      P : access PIO_Peripheral renames This.Periph;
   begin
      for I in Data'Range loop
         while P.FSTAT.TXEMPTY = 0 loop
            null;
         end loop;
         P.TXF (SM) := Data (I);
      end loop;
   end Transmit;

   procedure Transmit
      (This : in out PIO_Device;
       SM   : State_Machine;
       Data : UInt32)
   is
      P : access PIO_Peripheral renames This.Periph;
   begin
      while P.FSTAT.TXEMPTY = 0 loop
         null;
      end loop;
      This.Periph.TXF (SM) := Data;
   end Transmit;

end RP.PIO;
