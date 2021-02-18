with RP2040_SVD.RESETS;
with RP.Clock;

package body RP.PIO is
   function SM_Mask
      (SM : State_Machine)
      return UInt4
   is (UInt4 (Shift_Left (UInt8 (1), State_Machine'Pos (SM))));

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
      (This : PIO_Point)
   is
   begin
      This.Periph.CTRL.SM_ENABLE := This.Periph.CTRL.SM_ENABLE or SM_Mask (This.SM);
   end Enable;

   procedure Disable
      (This : PIO_Point)
   is
   begin
      This.Periph.CTRL.SM_ENABLE := This.Periph.CTRL.SM_ENABLE xor SM_Mask (This.SM);
   end Disable;

   procedure Restart
      (This : PIO_Point)
   is
   begin
      This.Periph.CTRL.SM_RESTART := SM_Mask (This.SM);
   end Restart;

   procedure Set_Divider
      (This : PIO_Point;
       Div  : Divider)
   is
   begin
      This.Periph.SM (This.SM).CLKDIV :=
         (INT    => Div_Integer (Div),
          FRAC   => Div_Fraction (Div),
          others => <>);
   end Set_Divider;

   procedure Set_Frequency
      (This      : PIO_Point;
       Frequency : Hertz)
   is
   begin
      Set_Divider (This, Divider (RP.Clock.Frequency (RP.Clock.SYS) / Frequency));
   end Set_Frequency;

   procedure Set_Out_Pins
      (This  : PIO_Point;
       Base  : RP.GPIO.GPIO_Point;
       Count : Natural)
   is
      SM : SM_Register renames This.Periph.SM (This.SM);
   begin
      SM.PINCTRL.OUT_BASE := SM0_PINCTRL_OUT_BASE_Field (Base.Pin);
      SM.PINCTRL.OUT_COUNT := SM0_PINCTRL_OUT_COUNT_Field (Count);
   end Set_Out_Pins;

   procedure Set_Set_Pins
      (This  : PIO_Point;
       Base  : RP.GPIO.GPIO_Point;
       Count : Natural)
   is
      SM : SM_Register renames This.Periph.SM (This.SM);
   begin
      SM.PINCTRL.SET_BASE := SM0_PINCTRL_SET_BASE_Field (Base.Pin);
      SM.PINCTRL.SET_COUNT := SM0_PINCTRL_SET_COUNT_Field (Count);
   end Set_Set_Pins;

   procedure Set_In_Pins
      (This : PIO_Point;
       Base : RP.GPIO.GPIO_Point)
   is
      SM : SM_Register renames This.Periph.SM (This.SM);
   begin
      SM.PINCTRL.IN_BASE := SM0_PINCTRL_IN_BASE_Field (Base.Pin);
   end Set_In_Pins;

   procedure Set_Sideset_Pins
      (This : PIO_Point;
       Base : RP.GPIO.GPIO_Point)
   is
      SM : SM_Register renames This.Periph.SM (This.SM);
   begin
      SM.PINCTRL.SIDESET_BASE := SM0_PINCTRL_SIDESET_BASE_Field (Base.Pin);
   end Set_Sideset_Pins;

   procedure Set_Sideset
      (This      : PIO_Point;
       Bit_Count : Natural;
       Optional  : Boolean;
       Pin_Dirs  : Boolean)
   is
      SM : SM_Register renames This.Periph.SM (This.SM);
   begin
      SM.PINCTRL.SIDESET_COUNT := SM0_PINCTRL_SIDESET_COUNT_Field (Bit_Count);
      SM.EXECCTRL.SIDE_EN := Optional;
      SM.EXECCTRL.SIDE_PINDIR := Pin_Dirs;
   end Set_Sideset;

   procedure Set_Jmp_Pin
      (This  : PIO_Point;
       Point : RP.GPIO.GPIO_Point)
   is
      SM : SM_Register renames This.Periph.SM (This.SM);
   begin
      SM.EXECCTRL.JMP_PIN := SM0_EXECCTRL_JMP_PIN_Field (Point.Pin);
   end Set_Jmp_Pin;

   procedure Load
      (This        : PIO_Point;
       Prog        : Program;
       Wrap        : Program_Index;
       Wrap_Target : Program_Index;
       Offset      : Program_Index := Program_Index'First)
   is
      P  : access PIO_Peripheral renames This.Periph;
      SM : SM_Register renames This.Periph.SM (This.SM);
   begin
      for I in Offset .. Offset + Prog'Length - 1 loop
         P.INSTR_MEM (I) := UInt32 (Prog (Prog'First + I));
      end loop;
      SM.EXECCTRL.WRAP_TOP := SM0_EXECCTRL_WRAP_TOP_Field (Wrap_Target);
      SM.EXECCTRL.WRAP_BOTTOM := SM0_EXECCTRL_WRAP_BOTTOM_Field (Wrap);
      This.Execute (Instruction (Offset)); --  Jump to the first instruction
   end Load;

   procedure Execute
      (This : PIO_Point;
       Insn : Instruction)
   is
   begin
      This.Periph.SM (This.SM).INSTR.SM0_INSTR := SM0_INSTR_SM0_INSTR_Field (Insn);
   end Execute;

   function Address
      (This : PIO_Point)
      return Program_Index
   is (Program_Index (This.Periph.SM (This.SM).ADDR.SM0_ADDR));

   procedure Receive
      (This : PIO_Point;
       Data : out UInt32_Array)
   is
      P : access PIO_Peripheral renames This.Periph;
   begin
      for I in Data'Range loop
         while P.FSTAT.RXFULL = 0 loop
            null;
         end loop;
         Data (I) := P.RXF (This.SM);
      end loop;
   end Receive;

   procedure Receive
      (This : PIO_Point;
       Data : out UInt32)
   is
      P : access PIO_Peripheral renames This.Periph;
   begin
      while P.FSTAT.RXFULL = 0 loop
         null;
      end loop;
      Data := P.RXF (This.SM);
   end Receive;

   procedure Transmit
      (This : PIO_Point;
       Data : UInt32_Array)
   is
      P : access PIO_Peripheral renames This.Periph;
   begin
      for I in Data'Range loop
         while P.FSTAT.TXEMPTY = 0 loop
            null;
         end loop;
         P.TXF (This.SM) := Data (I);
      end loop;
   end Transmit;

   procedure Transmit
      (This : PIO_Point;
       Data : UInt32)
   is
      P : access PIO_Peripheral renames This.Periph;
   begin
      while P.FSTAT.TXEMPTY = 0 loop
         null;
      end loop;
      This.Periph.TXF (This.SM) := Data;
   end Transmit;

end RP.PIO;
