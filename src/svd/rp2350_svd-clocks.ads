pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package RP2350_SVD.CLOCKS is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Selects the auxiliary clock source, will glitch when switching
   type CLK_GPOUT0_CTRL_AUXSRC_Field is
     (clksrc_pll_sys,
      clksrc_gpin0,
      clksrc_gpin1,
      clksrc_pll_usb,
      clksrc_pll_usb_primary_ref_opcg,
      rosc_clksrc,
      xosc_clksrc,
      lposc_clksrc,
      clk_sys,
      clk_usb,
      clk_adc,
      clk_ref,
      clk_peri,
      clk_hstx,
      otp_clk2fc)
     with Size => 4;
   for CLK_GPOUT0_CTRL_AUXSRC_Field use
     (clksrc_pll_sys => 0,
      clksrc_gpin0 => 1,
      clksrc_gpin1 => 2,
      clksrc_pll_usb => 3,
      clksrc_pll_usb_primary_ref_opcg => 4,
      rosc_clksrc => 5,
      xosc_clksrc => 6,
      lposc_clksrc => 7,
      clk_sys => 8,
      clk_usb => 9,
      clk_adc => 10,
      clk_ref => 11,
      clk_peri => 12,
      clk_hstx => 13,
      otp_clk2fc => 14);

   subtype CLK_GPOUT0_CTRL_PHASE_Field is HAL.UInt2;

   --  Clock control, can be changed on-the-fly (except for auxsrc)
   type CLK_GPOUT0_CTRL_Register is record
      --  unspecified
      Reserved_0_4   : HAL.UInt5 := 16#0#;
      --  Selects the auxiliary clock source, will glitch when switching
      AUXSRC         : CLK_GPOUT0_CTRL_AUXSRC_Field :=
                        RP2350_SVD.CLOCKS.clksrc_pll_sys;
      --  unspecified
      Reserved_9_9   : HAL.Bit := 16#0#;
      --  Asynchronously kills the clock generator, enable must be set low
      --  before deasserting kill
      KILL           : Boolean := False;
      --  Starts and stops the clock generator cleanly
      ENABLE         : Boolean := False;
      --  Enables duty cycle correction for odd divisors, can be changed
      --  on-the-fly
      DC50           : Boolean := False;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
      --  This delays the enable signal by up to 3 cycles of the input clock
      --  This must be set before the clock is enabled to have any effect
      PHASE          : CLK_GPOUT0_CTRL_PHASE_Field := 16#0#;
      --  unspecified
      Reserved_18_19 : HAL.UInt2 := 16#0#;
      --  An edge on this signal shifts the phase of the output by 1 cycle of
      --  the input clock This can be done at any time
      NUDGE          : Boolean := False;
      --  unspecified
      Reserved_21_27 : HAL.UInt7 := 16#0#;
      --  Read-only. clock generator is enabled
      ENABLED        : Boolean := False;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_GPOUT0_CTRL_Register use record
      Reserved_0_4   at 0 range 0 .. 4;
      AUXSRC         at 0 range 5 .. 8;
      Reserved_9_9   at 0 range 9 .. 9;
      KILL           at 0 range 10 .. 10;
      ENABLE         at 0 range 11 .. 11;
      DC50           at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      PHASE          at 0 range 16 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      NUDGE          at 0 range 20 .. 20;
      Reserved_21_27 at 0 range 21 .. 27;
      ENABLED        at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype CLK_GPOUT0_DIV_FRAC_Field is HAL.UInt16;
   subtype CLK_GPOUT0_DIV_INT_Field is HAL.UInt16;

   type CLK_GPOUT0_DIV_Register is record
      --  Fractional component of the divisor, can be changed on-the-fly
      FRAC : CLK_GPOUT0_DIV_FRAC_Field := 16#0#;
      --  Integer part of clock divisor, 0 -> max+1, can be changed on-the-fly
      INT  : CLK_GPOUT0_DIV_INT_Field := 16#1#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_GPOUT0_DIV_Register use record
      FRAC at 0 range 0 .. 15;
      INT  at 0 range 16 .. 31;
   end record;

   --  Indicates which src is currently selected (one-hot)
   type CLK_GPOUT0_SELECTED_Register is record
      --  Read-only. This slice does not have a glitchless mux (only the
      --  AUX_SRC field is present, not SRC) so this register is hardwired to
      --  0x1.
      CLK_GPOUT0_SELECTED : Boolean;
      --  unspecified
      Reserved_1_31       : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_GPOUT0_SELECTED_Register use record
      CLK_GPOUT0_SELECTED at 0 range 0 .. 0;
      Reserved_1_31       at 0 range 1 .. 31;
   end record;

   --  Selects the auxiliary clock source, will glitch when switching
   type CLK_GPOUT1_CTRL_AUXSRC_Field is
     (clksrc_pll_sys,
      clksrc_gpin0,
      clksrc_gpin1,
      clksrc_pll_usb,
      clksrc_pll_usb_primary_ref_opcg,
      rosc_clksrc,
      xosc_clksrc,
      lposc_clksrc,
      clk_sys,
      clk_usb,
      clk_adc,
      clk_ref,
      clk_peri,
      clk_hstx,
      otp_clk2fc)
     with Size => 4;
   for CLK_GPOUT1_CTRL_AUXSRC_Field use
     (clksrc_pll_sys => 0,
      clksrc_gpin0 => 1,
      clksrc_gpin1 => 2,
      clksrc_pll_usb => 3,
      clksrc_pll_usb_primary_ref_opcg => 4,
      rosc_clksrc => 5,
      xosc_clksrc => 6,
      lposc_clksrc => 7,
      clk_sys => 8,
      clk_usb => 9,
      clk_adc => 10,
      clk_ref => 11,
      clk_peri => 12,
      clk_hstx => 13,
      otp_clk2fc => 14);

   subtype CLK_GPOUT1_CTRL_PHASE_Field is HAL.UInt2;

   --  Clock control, can be changed on-the-fly (except for auxsrc)
   type CLK_GPOUT1_CTRL_Register is record
      --  unspecified
      Reserved_0_4   : HAL.UInt5 := 16#0#;
      --  Selects the auxiliary clock source, will glitch when switching
      AUXSRC         : CLK_GPOUT1_CTRL_AUXSRC_Field :=
                        RP2350_SVD.CLOCKS.clksrc_pll_sys;
      --  unspecified
      Reserved_9_9   : HAL.Bit := 16#0#;
      --  Asynchronously kills the clock generator, enable must be set low
      --  before deasserting kill
      KILL           : Boolean := False;
      --  Starts and stops the clock generator cleanly
      ENABLE         : Boolean := False;
      --  Enables duty cycle correction for odd divisors, can be changed
      --  on-the-fly
      DC50           : Boolean := False;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
      --  This delays the enable signal by up to 3 cycles of the input clock
      --  This must be set before the clock is enabled to have any effect
      PHASE          : CLK_GPOUT1_CTRL_PHASE_Field := 16#0#;
      --  unspecified
      Reserved_18_19 : HAL.UInt2 := 16#0#;
      --  An edge on this signal shifts the phase of the output by 1 cycle of
      --  the input clock This can be done at any time
      NUDGE          : Boolean := False;
      --  unspecified
      Reserved_21_27 : HAL.UInt7 := 16#0#;
      --  Read-only. clock generator is enabled
      ENABLED        : Boolean := False;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_GPOUT1_CTRL_Register use record
      Reserved_0_4   at 0 range 0 .. 4;
      AUXSRC         at 0 range 5 .. 8;
      Reserved_9_9   at 0 range 9 .. 9;
      KILL           at 0 range 10 .. 10;
      ENABLE         at 0 range 11 .. 11;
      DC50           at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      PHASE          at 0 range 16 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      NUDGE          at 0 range 20 .. 20;
      Reserved_21_27 at 0 range 21 .. 27;
      ENABLED        at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype CLK_GPOUT1_DIV_FRAC_Field is HAL.UInt16;
   subtype CLK_GPOUT1_DIV_INT_Field is HAL.UInt16;

   type CLK_GPOUT1_DIV_Register is record
      --  Fractional component of the divisor, can be changed on-the-fly
      FRAC : CLK_GPOUT1_DIV_FRAC_Field := 16#0#;
      --  Integer part of clock divisor, 0 -> max+1, can be changed on-the-fly
      INT  : CLK_GPOUT1_DIV_INT_Field := 16#1#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_GPOUT1_DIV_Register use record
      FRAC at 0 range 0 .. 15;
      INT  at 0 range 16 .. 31;
   end record;

   --  Indicates which src is currently selected (one-hot)
   type CLK_GPOUT1_SELECTED_Register is record
      --  Read-only. This slice does not have a glitchless mux (only the
      --  AUX_SRC field is present, not SRC) so this register is hardwired to
      --  0x1.
      CLK_GPOUT1_SELECTED : Boolean;
      --  unspecified
      Reserved_1_31       : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_GPOUT1_SELECTED_Register use record
      CLK_GPOUT1_SELECTED at 0 range 0 .. 0;
      Reserved_1_31       at 0 range 1 .. 31;
   end record;

   --  Selects the auxiliary clock source, will glitch when switching
   type CLK_GPOUT2_CTRL_AUXSRC_Field is
     (clksrc_pll_sys,
      clksrc_gpin0,
      clksrc_gpin1,
      clksrc_pll_usb,
      clksrc_pll_usb_primary_ref_opcg,
      rosc_clksrc_ph,
      xosc_clksrc,
      lposc_clksrc,
      clk_sys,
      clk_usb,
      clk_adc,
      clk_ref,
      clk_peri,
      clk_hstx,
      otp_clk2fc)
     with Size => 4;
   for CLK_GPOUT2_CTRL_AUXSRC_Field use
     (clksrc_pll_sys => 0,
      clksrc_gpin0 => 1,
      clksrc_gpin1 => 2,
      clksrc_pll_usb => 3,
      clksrc_pll_usb_primary_ref_opcg => 4,
      rosc_clksrc_ph => 5,
      xosc_clksrc => 6,
      lposc_clksrc => 7,
      clk_sys => 8,
      clk_usb => 9,
      clk_adc => 10,
      clk_ref => 11,
      clk_peri => 12,
      clk_hstx => 13,
      otp_clk2fc => 14);

   subtype CLK_GPOUT2_CTRL_PHASE_Field is HAL.UInt2;

   --  Clock control, can be changed on-the-fly (except for auxsrc)
   type CLK_GPOUT2_CTRL_Register is record
      --  unspecified
      Reserved_0_4   : HAL.UInt5 := 16#0#;
      --  Selects the auxiliary clock source, will glitch when switching
      AUXSRC         : CLK_GPOUT2_CTRL_AUXSRC_Field :=
                        RP2350_SVD.CLOCKS.clksrc_pll_sys;
      --  unspecified
      Reserved_9_9   : HAL.Bit := 16#0#;
      --  Asynchronously kills the clock generator, enable must be set low
      --  before deasserting kill
      KILL           : Boolean := False;
      --  Starts and stops the clock generator cleanly
      ENABLE         : Boolean := False;
      --  Enables duty cycle correction for odd divisors, can be changed
      --  on-the-fly
      DC50           : Boolean := False;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
      --  This delays the enable signal by up to 3 cycles of the input clock
      --  This must be set before the clock is enabled to have any effect
      PHASE          : CLK_GPOUT2_CTRL_PHASE_Field := 16#0#;
      --  unspecified
      Reserved_18_19 : HAL.UInt2 := 16#0#;
      --  An edge on this signal shifts the phase of the output by 1 cycle of
      --  the input clock This can be done at any time
      NUDGE          : Boolean := False;
      --  unspecified
      Reserved_21_27 : HAL.UInt7 := 16#0#;
      --  Read-only. clock generator is enabled
      ENABLED        : Boolean := False;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_GPOUT2_CTRL_Register use record
      Reserved_0_4   at 0 range 0 .. 4;
      AUXSRC         at 0 range 5 .. 8;
      Reserved_9_9   at 0 range 9 .. 9;
      KILL           at 0 range 10 .. 10;
      ENABLE         at 0 range 11 .. 11;
      DC50           at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      PHASE          at 0 range 16 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      NUDGE          at 0 range 20 .. 20;
      Reserved_21_27 at 0 range 21 .. 27;
      ENABLED        at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype CLK_GPOUT2_DIV_FRAC_Field is HAL.UInt16;
   subtype CLK_GPOUT2_DIV_INT_Field is HAL.UInt16;

   type CLK_GPOUT2_DIV_Register is record
      --  Fractional component of the divisor, can be changed on-the-fly
      FRAC : CLK_GPOUT2_DIV_FRAC_Field := 16#0#;
      --  Integer part of clock divisor, 0 -> max+1, can be changed on-the-fly
      INT  : CLK_GPOUT2_DIV_INT_Field := 16#1#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_GPOUT2_DIV_Register use record
      FRAC at 0 range 0 .. 15;
      INT  at 0 range 16 .. 31;
   end record;

   --  Indicates which src is currently selected (one-hot)
   type CLK_GPOUT2_SELECTED_Register is record
      --  Read-only. This slice does not have a glitchless mux (only the
      --  AUX_SRC field is present, not SRC) so this register is hardwired to
      --  0x1.
      CLK_GPOUT2_SELECTED : Boolean;
      --  unspecified
      Reserved_1_31       : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_GPOUT2_SELECTED_Register use record
      CLK_GPOUT2_SELECTED at 0 range 0 .. 0;
      Reserved_1_31       at 0 range 1 .. 31;
   end record;

   --  Selects the auxiliary clock source, will glitch when switching
   type CLK_GPOUT3_CTRL_AUXSRC_Field is
     (clksrc_pll_sys,
      clksrc_gpin0,
      clksrc_gpin1,
      clksrc_pll_usb,
      clksrc_pll_usb_primary_ref_opcg,
      rosc_clksrc_ph,
      xosc_clksrc,
      lposc_clksrc,
      clk_sys,
      clk_usb,
      clk_adc,
      clk_ref,
      clk_peri,
      clk_hstx,
      otp_clk2fc)
     with Size => 4;
   for CLK_GPOUT3_CTRL_AUXSRC_Field use
     (clksrc_pll_sys => 0,
      clksrc_gpin0 => 1,
      clksrc_gpin1 => 2,
      clksrc_pll_usb => 3,
      clksrc_pll_usb_primary_ref_opcg => 4,
      rosc_clksrc_ph => 5,
      xosc_clksrc => 6,
      lposc_clksrc => 7,
      clk_sys => 8,
      clk_usb => 9,
      clk_adc => 10,
      clk_ref => 11,
      clk_peri => 12,
      clk_hstx => 13,
      otp_clk2fc => 14);

   subtype CLK_GPOUT3_CTRL_PHASE_Field is HAL.UInt2;

   --  Clock control, can be changed on-the-fly (except for auxsrc)
   type CLK_GPOUT3_CTRL_Register is record
      --  unspecified
      Reserved_0_4   : HAL.UInt5 := 16#0#;
      --  Selects the auxiliary clock source, will glitch when switching
      AUXSRC         : CLK_GPOUT3_CTRL_AUXSRC_Field :=
                        RP2350_SVD.CLOCKS.clksrc_pll_sys;
      --  unspecified
      Reserved_9_9   : HAL.Bit := 16#0#;
      --  Asynchronously kills the clock generator, enable must be set low
      --  before deasserting kill
      KILL           : Boolean := False;
      --  Starts and stops the clock generator cleanly
      ENABLE         : Boolean := False;
      --  Enables duty cycle correction for odd divisors, can be changed
      --  on-the-fly
      DC50           : Boolean := False;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
      --  This delays the enable signal by up to 3 cycles of the input clock
      --  This must be set before the clock is enabled to have any effect
      PHASE          : CLK_GPOUT3_CTRL_PHASE_Field := 16#0#;
      --  unspecified
      Reserved_18_19 : HAL.UInt2 := 16#0#;
      --  An edge on this signal shifts the phase of the output by 1 cycle of
      --  the input clock This can be done at any time
      NUDGE          : Boolean := False;
      --  unspecified
      Reserved_21_27 : HAL.UInt7 := 16#0#;
      --  Read-only. clock generator is enabled
      ENABLED        : Boolean := False;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_GPOUT3_CTRL_Register use record
      Reserved_0_4   at 0 range 0 .. 4;
      AUXSRC         at 0 range 5 .. 8;
      Reserved_9_9   at 0 range 9 .. 9;
      KILL           at 0 range 10 .. 10;
      ENABLE         at 0 range 11 .. 11;
      DC50           at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      PHASE          at 0 range 16 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      NUDGE          at 0 range 20 .. 20;
      Reserved_21_27 at 0 range 21 .. 27;
      ENABLED        at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype CLK_GPOUT3_DIV_FRAC_Field is HAL.UInt16;
   subtype CLK_GPOUT3_DIV_INT_Field is HAL.UInt16;

   type CLK_GPOUT3_DIV_Register is record
      --  Fractional component of the divisor, can be changed on-the-fly
      FRAC : CLK_GPOUT3_DIV_FRAC_Field := 16#0#;
      --  Integer part of clock divisor, 0 -> max+1, can be changed on-the-fly
      INT  : CLK_GPOUT3_DIV_INT_Field := 16#1#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_GPOUT3_DIV_Register use record
      FRAC at 0 range 0 .. 15;
      INT  at 0 range 16 .. 31;
   end record;

   --  Indicates which src is currently selected (one-hot)
   type CLK_GPOUT3_SELECTED_Register is record
      --  Read-only. This slice does not have a glitchless mux (only the
      --  AUX_SRC field is present, not SRC) so this register is hardwired to
      --  0x1.
      CLK_GPOUT3_SELECTED : Boolean;
      --  unspecified
      Reserved_1_31       : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_GPOUT3_SELECTED_Register use record
      CLK_GPOUT3_SELECTED at 0 range 0 .. 0;
      Reserved_1_31       at 0 range 1 .. 31;
   end record;

   --  Selects the clock source glitchlessly, can be changed on-the-fly
   type CLK_REF_CTRL_SRC_Field is
     (rosc_clksrc_ph,
      clksrc_clk_ref_aux,
      xosc_clksrc,
      lposc_clksrc)
     with Size => 2;
   for CLK_REF_CTRL_SRC_Field use
     (rosc_clksrc_ph => 0,
      clksrc_clk_ref_aux => 1,
      xosc_clksrc => 2,
      lposc_clksrc => 3);

   --  Selects the auxiliary clock source, will glitch when switching
   type CLK_REF_CTRL_AUXSRC_Field is
     (clksrc_pll_usb,
      clksrc_gpin0,
      clksrc_gpin1,
      clksrc_pll_usb_primary_ref_opcg)
     with Size => 2;
   for CLK_REF_CTRL_AUXSRC_Field use
     (clksrc_pll_usb => 0,
      clksrc_gpin0 => 1,
      clksrc_gpin1 => 2,
      clksrc_pll_usb_primary_ref_opcg => 3);

   --  Clock control, can be changed on-the-fly (except for auxsrc)
   type CLK_REF_CTRL_Register is record
      --  Selects the clock source glitchlessly, can be changed on-the-fly
      SRC           : CLK_REF_CTRL_SRC_Field :=
                       RP2350_SVD.CLOCKS.rosc_clksrc_ph;
      --  unspecified
      Reserved_2_4  : HAL.UInt3 := 16#0#;
      --  Selects the auxiliary clock source, will glitch when switching
      AUXSRC        : CLK_REF_CTRL_AUXSRC_Field :=
                       RP2350_SVD.CLOCKS.clksrc_pll_usb;
      --  unspecified
      Reserved_7_31 : HAL.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_REF_CTRL_Register use record
      SRC           at 0 range 0 .. 1;
      Reserved_2_4  at 0 range 2 .. 4;
      AUXSRC        at 0 range 5 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype CLK_REF_DIV_INT_Field is HAL.UInt8;

   type CLK_REF_DIV_Register is record
      --  unspecified
      Reserved_0_15  : HAL.UInt16 := 16#0#;
      --  Integer part of clock divisor, 0 -> max+1, can be changed on-the-fly
      INT            : CLK_REF_DIV_INT_Field := 16#1#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_REF_DIV_Register use record
      Reserved_0_15  at 0 range 0 .. 15;
      INT            at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CLK_REF_SELECTED_CLK_REF_SELECTED_Field is HAL.UInt4;

   --  Indicates which src is currently selected (one-hot)
   type CLK_REF_SELECTED_Register is record
      --  Read-only. The glitchless multiplexer does not switch instantaneously
      --  (to avoid glitches), so software should poll this register to wait
      --  for the switch to complete. This register contains one decoded bit
      --  for each of the clock sources enumerated in the CTRL SRC field. At
      --  most one of these bits will be set at any time, indicating that clock
      --  is currently present at the output of the glitchless mux. Whilst
      --  switching is in progress, this register may briefly show all-0s.
      CLK_REF_SELECTED : CLK_REF_SELECTED_CLK_REF_SELECTED_Field;
      --  unspecified
      Reserved_4_31    : HAL.UInt28;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_REF_SELECTED_Register use record
      CLK_REF_SELECTED at 0 range 0 .. 3;
      Reserved_4_31    at 0 range 4 .. 31;
   end record;

   --  Selects the clock source glitchlessly, can be changed on-the-fly
   type CLK_SYS_CTRL_SRC_Field is
     (clk_ref,
      clksrc_clk_sys_aux)
     with Size => 1;
   for CLK_SYS_CTRL_SRC_Field use
     (clk_ref => 0,
      clksrc_clk_sys_aux => 1);

   --  Selects the auxiliary clock source, will glitch when switching
   type CLK_SYS_CTRL_AUXSRC_Field is
     (clksrc_pll_sys,
      clksrc_pll_usb,
      rosc_clksrc,
      xosc_clksrc,
      clksrc_gpin0,
      clksrc_gpin1)
     with Size => 3;
   for CLK_SYS_CTRL_AUXSRC_Field use
     (clksrc_pll_sys => 0,
      clksrc_pll_usb => 1,
      rosc_clksrc => 2,
      xosc_clksrc => 3,
      clksrc_gpin0 => 4,
      clksrc_gpin1 => 5);

   --  Clock control, can be changed on-the-fly (except for auxsrc)
   type CLK_SYS_CTRL_Register is record
      --  Selects the clock source glitchlessly, can be changed on-the-fly
      SRC           : CLK_SYS_CTRL_SRC_Field := RP2350_SVD.CLOCKS.clk_ref;
      --  unspecified
      Reserved_1_4  : HAL.UInt4 := 16#0#;
      --  Selects the auxiliary clock source, will glitch when switching
      AUXSRC        : CLK_SYS_CTRL_AUXSRC_Field :=
                       RP2350_SVD.CLOCKS.clksrc_pll_sys;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_SYS_CTRL_Register use record
      SRC           at 0 range 0 .. 0;
      Reserved_1_4  at 0 range 1 .. 4;
      AUXSRC        at 0 range 5 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CLK_SYS_DIV_FRAC_Field is HAL.UInt16;
   subtype CLK_SYS_DIV_INT_Field is HAL.UInt16;

   type CLK_SYS_DIV_Register is record
      --  Fractional component of the divisor, can be changed on-the-fly
      FRAC : CLK_SYS_DIV_FRAC_Field := 16#0#;
      --  Integer part of clock divisor, 0 -> max+1, can be changed on-the-fly
      INT  : CLK_SYS_DIV_INT_Field := 16#1#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_SYS_DIV_Register use record
      FRAC at 0 range 0 .. 15;
      INT  at 0 range 16 .. 31;
   end record;

   subtype CLK_SYS_SELECTED_CLK_SYS_SELECTED_Field is HAL.UInt2;

   --  Indicates which src is currently selected (one-hot)
   type CLK_SYS_SELECTED_Register is record
      --  Read-only. The glitchless multiplexer does not switch instantaneously
      --  (to avoid glitches), so software should poll this register to wait
      --  for the switch to complete. This register contains one decoded bit
      --  for each of the clock sources enumerated in the CTRL SRC field. At
      --  most one of these bits will be set at any time, indicating that clock
      --  is currently present at the output of the glitchless mux. Whilst
      --  switching is in progress, this register may briefly show all-0s.
      CLK_SYS_SELECTED : CLK_SYS_SELECTED_CLK_SYS_SELECTED_Field;
      --  unspecified
      Reserved_2_31    : HAL.UInt30;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_SYS_SELECTED_Register use record
      CLK_SYS_SELECTED at 0 range 0 .. 1;
      Reserved_2_31    at 0 range 2 .. 31;
   end record;

   --  Selects the auxiliary clock source, will glitch when switching
   type CLK_PERI_CTRL_AUXSRC_Field is
     (clk_sys,
      clksrc_pll_sys,
      clksrc_pll_usb,
      rosc_clksrc_ph,
      xosc_clksrc,
      clksrc_gpin0,
      clksrc_gpin1)
     with Size => 3;
   for CLK_PERI_CTRL_AUXSRC_Field use
     (clk_sys => 0,
      clksrc_pll_sys => 1,
      clksrc_pll_usb => 2,
      rosc_clksrc_ph => 3,
      xosc_clksrc => 4,
      clksrc_gpin0 => 5,
      clksrc_gpin1 => 6);

   --  Clock control, can be changed on-the-fly (except for auxsrc)
   type CLK_PERI_CTRL_Register is record
      --  unspecified
      Reserved_0_4   : HAL.UInt5 := 16#0#;
      --  Selects the auxiliary clock source, will glitch when switching
      AUXSRC         : CLK_PERI_CTRL_AUXSRC_Field :=
                        RP2350_SVD.CLOCKS.clk_sys;
      --  unspecified
      Reserved_8_9   : HAL.UInt2 := 16#0#;
      --  Asynchronously kills the clock generator, enable must be set low
      --  before deasserting kill
      KILL           : Boolean := False;
      --  Starts and stops the clock generator cleanly
      ENABLE         : Boolean := False;
      --  unspecified
      Reserved_12_27 : HAL.UInt16 := 16#0#;
      --  Read-only. clock generator is enabled
      ENABLED        : Boolean := False;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_PERI_CTRL_Register use record
      Reserved_0_4   at 0 range 0 .. 4;
      AUXSRC         at 0 range 5 .. 7;
      Reserved_8_9   at 0 range 8 .. 9;
      KILL           at 0 range 10 .. 10;
      ENABLE         at 0 range 11 .. 11;
      Reserved_12_27 at 0 range 12 .. 27;
      ENABLED        at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype CLK_PERI_DIV_INT_Field is HAL.UInt2;

   type CLK_PERI_DIV_Register is record
      --  unspecified
      Reserved_0_15  : HAL.UInt16 := 16#0#;
      --  Integer part of clock divisor, 0 -> max+1, can be changed on-the-fly
      INT            : CLK_PERI_DIV_INT_Field := 16#1#;
      --  unspecified
      Reserved_18_31 : HAL.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_PERI_DIV_Register use record
      Reserved_0_15  at 0 range 0 .. 15;
      INT            at 0 range 16 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   --  Indicates which src is currently selected (one-hot)
   type CLK_PERI_SELECTED_Register is record
      --  Read-only. This slice does not have a glitchless mux (only the
      --  AUX_SRC field is present, not SRC) so this register is hardwired to
      --  0x1.
      CLK_PERI_SELECTED : Boolean;
      --  unspecified
      Reserved_1_31     : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_PERI_SELECTED_Register use record
      CLK_PERI_SELECTED at 0 range 0 .. 0;
      Reserved_1_31     at 0 range 1 .. 31;
   end record;

   --  Selects the auxiliary clock source, will glitch when switching
   type CLK_HSTX_CTRL_AUXSRC_Field is
     (clk_sys,
      clksrc_pll_sys,
      clksrc_pll_usb,
      clksrc_gpin0,
      clksrc_gpin1)
     with Size => 3;
   for CLK_HSTX_CTRL_AUXSRC_Field use
     (clk_sys => 0,
      clksrc_pll_sys => 1,
      clksrc_pll_usb => 2,
      clksrc_gpin0 => 3,
      clksrc_gpin1 => 4);

   subtype CLK_HSTX_CTRL_PHASE_Field is HAL.UInt2;

   --  Clock control, can be changed on-the-fly (except for auxsrc)
   type CLK_HSTX_CTRL_Register is record
      --  unspecified
      Reserved_0_4   : HAL.UInt5 := 16#0#;
      --  Selects the auxiliary clock source, will glitch when switching
      AUXSRC         : CLK_HSTX_CTRL_AUXSRC_Field :=
                        RP2350_SVD.CLOCKS.clk_sys;
      --  unspecified
      Reserved_8_9   : HAL.UInt2 := 16#0#;
      --  Asynchronously kills the clock generator, enable must be set low
      --  before deasserting kill
      KILL           : Boolean := False;
      --  Starts and stops the clock generator cleanly
      ENABLE         : Boolean := False;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      --  This delays the enable signal by up to 3 cycles of the input clock
      --  This must be set before the clock is enabled to have any effect
      PHASE          : CLK_HSTX_CTRL_PHASE_Field := 16#0#;
      --  unspecified
      Reserved_18_19 : HAL.UInt2 := 16#0#;
      --  An edge on this signal shifts the phase of the output by 1 cycle of
      --  the input clock This can be done at any time
      NUDGE          : Boolean := False;
      --  unspecified
      Reserved_21_27 : HAL.UInt7 := 16#0#;
      --  Read-only. clock generator is enabled
      ENABLED        : Boolean := False;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_HSTX_CTRL_Register use record
      Reserved_0_4   at 0 range 0 .. 4;
      AUXSRC         at 0 range 5 .. 7;
      Reserved_8_9   at 0 range 8 .. 9;
      KILL           at 0 range 10 .. 10;
      ENABLE         at 0 range 11 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      PHASE          at 0 range 16 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      NUDGE          at 0 range 20 .. 20;
      Reserved_21_27 at 0 range 21 .. 27;
      ENABLED        at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype CLK_HSTX_DIV_INT_Field is HAL.UInt2;

   type CLK_HSTX_DIV_Register is record
      --  unspecified
      Reserved_0_15  : HAL.UInt16 := 16#0#;
      --  Integer part of clock divisor, 0 -> max+1, can be changed on-the-fly
      INT            : CLK_HSTX_DIV_INT_Field := 16#1#;
      --  unspecified
      Reserved_18_31 : HAL.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_HSTX_DIV_Register use record
      Reserved_0_15  at 0 range 0 .. 15;
      INT            at 0 range 16 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   --  Indicates which src is currently selected (one-hot)
   type CLK_HSTX_SELECTED_Register is record
      --  Read-only. This slice does not have a glitchless mux (only the
      --  AUX_SRC field is present, not SRC) so this register is hardwired to
      --  0x1.
      CLK_HSTX_SELECTED : Boolean;
      --  unspecified
      Reserved_1_31     : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_HSTX_SELECTED_Register use record
      CLK_HSTX_SELECTED at 0 range 0 .. 0;
      Reserved_1_31     at 0 range 1 .. 31;
   end record;

   --  Selects the auxiliary clock source, will glitch when switching
   type CLK_USB_CTRL_AUXSRC_Field is
     (clksrc_pll_usb,
      clksrc_pll_sys,
      rosc_clksrc_ph,
      xosc_clksrc,
      clksrc_gpin0,
      clksrc_gpin1)
     with Size => 3;
   for CLK_USB_CTRL_AUXSRC_Field use
     (clksrc_pll_usb => 0,
      clksrc_pll_sys => 1,
      rosc_clksrc_ph => 2,
      xosc_clksrc => 3,
      clksrc_gpin0 => 4,
      clksrc_gpin1 => 5);

   subtype CLK_USB_CTRL_PHASE_Field is HAL.UInt2;

   --  Clock control, can be changed on-the-fly (except for auxsrc)
   type CLK_USB_CTRL_Register is record
      --  unspecified
      Reserved_0_4   : HAL.UInt5 := 16#0#;
      --  Selects the auxiliary clock source, will glitch when switching
      AUXSRC         : CLK_USB_CTRL_AUXSRC_Field :=
                        RP2350_SVD.CLOCKS.clksrc_pll_usb;
      --  unspecified
      Reserved_8_9   : HAL.UInt2 := 16#0#;
      --  Asynchronously kills the clock generator, enable must be set low
      --  before deasserting kill
      KILL           : Boolean := False;
      --  Starts and stops the clock generator cleanly
      ENABLE         : Boolean := False;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      --  This delays the enable signal by up to 3 cycles of the input clock
      --  This must be set before the clock is enabled to have any effect
      PHASE          : CLK_USB_CTRL_PHASE_Field := 16#0#;
      --  unspecified
      Reserved_18_19 : HAL.UInt2 := 16#0#;
      --  An edge on this signal shifts the phase of the output by 1 cycle of
      --  the input clock This can be done at any time
      NUDGE          : Boolean := False;
      --  unspecified
      Reserved_21_27 : HAL.UInt7 := 16#0#;
      --  Read-only. clock generator is enabled
      ENABLED        : Boolean := False;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_USB_CTRL_Register use record
      Reserved_0_4   at 0 range 0 .. 4;
      AUXSRC         at 0 range 5 .. 7;
      Reserved_8_9   at 0 range 8 .. 9;
      KILL           at 0 range 10 .. 10;
      ENABLE         at 0 range 11 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      PHASE          at 0 range 16 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      NUDGE          at 0 range 20 .. 20;
      Reserved_21_27 at 0 range 21 .. 27;
      ENABLED        at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype CLK_USB_DIV_INT_Field is HAL.UInt4;

   type CLK_USB_DIV_Register is record
      --  unspecified
      Reserved_0_15  : HAL.UInt16 := 16#0#;
      --  Integer part of clock divisor, 0 -> max+1, can be changed on-the-fly
      INT            : CLK_USB_DIV_INT_Field := 16#1#;
      --  unspecified
      Reserved_20_31 : HAL.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_USB_DIV_Register use record
      Reserved_0_15  at 0 range 0 .. 15;
      INT            at 0 range 16 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   --  Indicates which src is currently selected (one-hot)
   type CLK_USB_SELECTED_Register is record
      --  Read-only. This slice does not have a glitchless mux (only the
      --  AUX_SRC field is present, not SRC) so this register is hardwired to
      --  0x1.
      CLK_USB_SELECTED : Boolean;
      --  unspecified
      Reserved_1_31    : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_USB_SELECTED_Register use record
      CLK_USB_SELECTED at 0 range 0 .. 0;
      Reserved_1_31    at 0 range 1 .. 31;
   end record;

   --  Selects the auxiliary clock source, will glitch when switching
   type CLK_ADC_CTRL_AUXSRC_Field is
     (clksrc_pll_usb,
      clksrc_pll_sys,
      rosc_clksrc_ph,
      xosc_clksrc,
      clksrc_gpin0,
      clksrc_gpin1)
     with Size => 3;
   for CLK_ADC_CTRL_AUXSRC_Field use
     (clksrc_pll_usb => 0,
      clksrc_pll_sys => 1,
      rosc_clksrc_ph => 2,
      xosc_clksrc => 3,
      clksrc_gpin0 => 4,
      clksrc_gpin1 => 5);

   subtype CLK_ADC_CTRL_PHASE_Field is HAL.UInt2;

   --  Clock control, can be changed on-the-fly (except for auxsrc)
   type CLK_ADC_CTRL_Register is record
      --  unspecified
      Reserved_0_4   : HAL.UInt5 := 16#0#;
      --  Selects the auxiliary clock source, will glitch when switching
      AUXSRC         : CLK_ADC_CTRL_AUXSRC_Field :=
                        RP2350_SVD.CLOCKS.clksrc_pll_usb;
      --  unspecified
      Reserved_8_9   : HAL.UInt2 := 16#0#;
      --  Asynchronously kills the clock generator, enable must be set low
      --  before deasserting kill
      KILL           : Boolean := False;
      --  Starts and stops the clock generator cleanly
      ENABLE         : Boolean := False;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      --  This delays the enable signal by up to 3 cycles of the input clock
      --  This must be set before the clock is enabled to have any effect
      PHASE          : CLK_ADC_CTRL_PHASE_Field := 16#0#;
      --  unspecified
      Reserved_18_19 : HAL.UInt2 := 16#0#;
      --  An edge on this signal shifts the phase of the output by 1 cycle of
      --  the input clock This can be done at any time
      NUDGE          : Boolean := False;
      --  unspecified
      Reserved_21_27 : HAL.UInt7 := 16#0#;
      --  Read-only. clock generator is enabled
      ENABLED        : Boolean := False;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_ADC_CTRL_Register use record
      Reserved_0_4   at 0 range 0 .. 4;
      AUXSRC         at 0 range 5 .. 7;
      Reserved_8_9   at 0 range 8 .. 9;
      KILL           at 0 range 10 .. 10;
      ENABLE         at 0 range 11 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      PHASE          at 0 range 16 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      NUDGE          at 0 range 20 .. 20;
      Reserved_21_27 at 0 range 21 .. 27;
      ENABLED        at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype CLK_ADC_DIV_INT_Field is HAL.UInt4;

   type CLK_ADC_DIV_Register is record
      --  unspecified
      Reserved_0_15  : HAL.UInt16 := 16#0#;
      --  Integer part of clock divisor, 0 -> max+1, can be changed on-the-fly
      INT            : CLK_ADC_DIV_INT_Field := 16#1#;
      --  unspecified
      Reserved_20_31 : HAL.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_ADC_DIV_Register use record
      Reserved_0_15  at 0 range 0 .. 15;
      INT            at 0 range 16 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   --  Indicates which src is currently selected (one-hot)
   type CLK_ADC_SELECTED_Register is record
      --  Read-only. This slice does not have a glitchless mux (only the
      --  AUX_SRC field is present, not SRC) so this register is hardwired to
      --  0x1.
      CLK_ADC_SELECTED : Boolean;
      --  unspecified
      Reserved_1_31    : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_ADC_SELECTED_Register use record
      CLK_ADC_SELECTED at 0 range 0 .. 0;
      Reserved_1_31    at 0 range 1 .. 31;
   end record;

   type DFTCLK_XOSC_CTRL_SRC_Field is
     (NULL_k,
      clksrc_pll_usb_primary,
      clksrc_gpin0)
     with Size => 2;
   for DFTCLK_XOSC_CTRL_SRC_Field use
     (NULL_k => 0,
      clksrc_pll_usb_primary => 1,
      clksrc_gpin0 => 2);

   type DFTCLK_XOSC_CTRL_Register is record
      SRC           : DFTCLK_XOSC_CTRL_SRC_Field := RP2350_SVD.CLOCKS.NULL_k;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DFTCLK_XOSC_CTRL_Register use record
      SRC           at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   type DFTCLK_ROSC_CTRL_SRC_Field is
     (NULL_k,
      clksrc_pll_sys_primary_rosc,
      clksrc_gpin1)
     with Size => 2;
   for DFTCLK_ROSC_CTRL_SRC_Field use
     (NULL_k => 0,
      clksrc_pll_sys_primary_rosc => 1,
      clksrc_gpin1 => 2);

   type DFTCLK_ROSC_CTRL_Register is record
      SRC           : DFTCLK_ROSC_CTRL_SRC_Field := RP2350_SVD.CLOCKS.NULL_k;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DFTCLK_ROSC_CTRL_Register use record
      SRC           at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   type DFTCLK_LPOSC_CTRL_SRC_Field is
     (NULL_k,
      clksrc_pll_usb_primary_lposc,
      clksrc_gpin1)
     with Size => 2;
   for DFTCLK_LPOSC_CTRL_SRC_Field use
     (NULL_k => 0,
      clksrc_pll_usb_primary_lposc => 1,
      clksrc_gpin1 => 2);

   type DFTCLK_LPOSC_CTRL_Register is record
      SRC           : DFTCLK_LPOSC_CTRL_SRC_Field := RP2350_SVD.CLOCKS.NULL_k;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DFTCLK_LPOSC_CTRL_Register use record
      SRC           at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype CLK_SYS_RESUS_CTRL_TIMEOUT_Field is HAL.UInt8;

   type CLK_SYS_RESUS_CTRL_Register is record
      --  This is expressed as a number of clk_ref cycles and must be >= 2x
      --  clk_ref_freq/min_clk_tst_freq
      TIMEOUT        : CLK_SYS_RESUS_CTRL_TIMEOUT_Field := 16#FF#;
      --  Enable resus
      ENABLE         : Boolean := False;
      --  unspecified
      Reserved_9_11  : HAL.UInt3 := 16#0#;
      --  Force a resus, for test purposes only
      FRCE           : Boolean := False;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
      --  For clearing the resus after the fault that triggered it has been
      --  corrected
      CLEAR          : Boolean := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_SYS_RESUS_CTRL_Register use record
      TIMEOUT        at 0 range 0 .. 7;
      ENABLE         at 0 range 8 .. 8;
      Reserved_9_11  at 0 range 9 .. 11;
      FRCE           at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      CLEAR          at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   type CLK_SYS_RESUS_STATUS_Register is record
      --  Read-only. Clock has been resuscitated, correct the error then send
      --  ctrl_clear=1
      RESUSSED      : Boolean;
      --  unspecified
      Reserved_1_31 : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLK_SYS_RESUS_STATUS_Register use record
      RESUSSED      at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype FC0_REF_KHZ_FC0_REF_KHZ_Field is HAL.UInt20;

   --  Reference clock frequency in kHz
   type FC0_REF_KHZ_Register is record
      FC0_REF_KHZ    : FC0_REF_KHZ_FC0_REF_KHZ_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : HAL.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FC0_REF_KHZ_Register use record
      FC0_REF_KHZ    at 0 range 0 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   subtype FC0_MIN_KHZ_FC0_MIN_KHZ_Field is HAL.UInt25;

   --  Minimum pass frequency in kHz. This is optional. Set to 0 if you are not
   --  using the pass/fail flags
   type FC0_MIN_KHZ_Register is record
      FC0_MIN_KHZ    : FC0_MIN_KHZ_FC0_MIN_KHZ_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FC0_MIN_KHZ_Register use record
      FC0_MIN_KHZ    at 0 range 0 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype FC0_MAX_KHZ_FC0_MAX_KHZ_Field is HAL.UInt25;

   --  Maximum pass frequency in kHz. This is optional. Set to 0x1ffffff if you
   --  are not using the pass/fail flags
   type FC0_MAX_KHZ_Register is record
      FC0_MAX_KHZ    : FC0_MAX_KHZ_FC0_MAX_KHZ_Field := 16#1FFFFFF#;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FC0_MAX_KHZ_Register use record
      FC0_MAX_KHZ    at 0 range 0 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype FC0_DELAY_FC0_DELAY_Field is HAL.UInt3;

   --  Delays the start of frequency counting to allow the mux to settle Delay
   --  is measured in multiples of the reference clock period
   type FC0_DELAY_Register is record
      FC0_DELAY     : FC0_DELAY_FC0_DELAY_Field := 16#1#;
      --  unspecified
      Reserved_3_31 : HAL.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FC0_DELAY_Register use record
      FC0_DELAY     at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype FC0_INTERVAL_FC0_INTERVAL_Field is HAL.UInt4;

   --  The test interval is 0.98us * 2**interval, but let's call it 1us *
   --  2**interval The default gives a test interval of 250us
   type FC0_INTERVAL_Register is record
      FC0_INTERVAL  : FC0_INTERVAL_FC0_INTERVAL_Field := 16#8#;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FC0_INTERVAL_Register use record
      FC0_INTERVAL  at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   type FC0_SRC_FC0_SRC_Field is
     (NULL_k,
      pll_sys_clksrc_primary,
      pll_usb_clksrc_primary,
      rosc_clksrc,
      rosc_clksrc_ph,
      xosc_clksrc,
      clksrc_gpin0,
      clksrc_gpin1,
      clk_ref,
      clk_sys,
      clk_peri,
      clk_usb,
      clk_adc,
      clk_hstx,
      lposc_clksrc,
      otp_clk2fc,
      pll_usb_clksrc_primary_dft)
     with Size => 8;
   for FC0_SRC_FC0_SRC_Field use
     (NULL_k => 0,
      pll_sys_clksrc_primary => 1,
      pll_usb_clksrc_primary => 2,
      rosc_clksrc => 3,
      rosc_clksrc_ph => 4,
      xosc_clksrc => 5,
      clksrc_gpin0 => 6,
      clksrc_gpin1 => 7,
      clk_ref => 8,
      clk_sys => 9,
      clk_peri => 10,
      clk_usb => 11,
      clk_adc => 12,
      clk_hstx => 13,
      lposc_clksrc => 14,
      otp_clk2fc => 15,
      pll_usb_clksrc_primary_dft => 16);

   --  Clock sent to frequency counter, set to 0 when not required Writing to
   --  this register initiates the frequency count
   type FC0_SRC_Register is record
      FC0_SRC       : FC0_SRC_FC0_SRC_Field := RP2350_SVD.CLOCKS.NULL_k;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FC0_SRC_Register use record
      FC0_SRC       at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  Frequency counter status
   type FC0_STATUS_Register is record
      --  Read-only. Test passed
      PASS           : Boolean;
      --  unspecified
      Reserved_1_3   : HAL.UInt3;
      --  Read-only. Test complete
      DONE           : Boolean;
      --  unspecified
      Reserved_5_7   : HAL.UInt3;
      --  Read-only. Test running
      RUNNING        : Boolean;
      --  unspecified
      Reserved_9_11  : HAL.UInt3;
      --  Read-only. Waiting for test clock to start
      WAITING        : Boolean;
      --  unspecified
      Reserved_13_15 : HAL.UInt3;
      --  Read-only. Test failed
      FAIL           : Boolean;
      --  unspecified
      Reserved_17_19 : HAL.UInt3;
      --  Read-only. Test clock slower than expected, only valid when
      --  status_done=1
      SLOW           : Boolean;
      --  unspecified
      Reserved_21_23 : HAL.UInt3;
      --  Read-only. Test clock faster than expected, only valid when
      --  status_done=1
      FAST           : Boolean;
      --  unspecified
      Reserved_25_27 : HAL.UInt3;
      --  Read-only. Test clock stopped during test
      DIED           : Boolean;
      --  unspecified
      Reserved_29_31 : HAL.UInt3;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FC0_STATUS_Register use record
      PASS           at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      DONE           at 0 range 4 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      RUNNING        at 0 range 8 .. 8;
      Reserved_9_11  at 0 range 9 .. 11;
      WAITING        at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      FAIL           at 0 range 16 .. 16;
      Reserved_17_19 at 0 range 17 .. 19;
      SLOW           at 0 range 20 .. 20;
      Reserved_21_23 at 0 range 21 .. 23;
      FAST           at 0 range 24 .. 24;
      Reserved_25_27 at 0 range 25 .. 27;
      DIED           at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype FC0_RESULT_FRAC_Field is HAL.UInt5;
   subtype FC0_RESULT_KHZ_Field is HAL.UInt25;

   --  Result of frequency measurement, only valid when status_done=1
   type FC0_RESULT_Register is record
      --  Read-only.
      FRAC           : FC0_RESULT_FRAC_Field;
      --  Read-only.
      KHZ            : FC0_RESULT_KHZ_Field;
      --  unspecified
      Reserved_30_31 : HAL.UInt2;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FC0_RESULT_Register use record
      FRAC           at 0 range 0 .. 4;
      KHZ            at 0 range 5 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  WAKE_EN0_CLK_SYS_I2C array
   type WAKE_EN0_CLK_SYS_I2C_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for WAKE_EN0_CLK_SYS_I2C
   type WAKE_EN0_CLK_SYS_I2C_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CLK_SYS_I2C as a value
            Val : HAL.UInt2;
         when True =>
            --  CLK_SYS_I2C as an array
            Arr : WAKE_EN0_CLK_SYS_I2C_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for WAKE_EN0_CLK_SYS_I2C_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  WAKE_EN0_CLK_SYS_PIO array
   type WAKE_EN0_CLK_SYS_PIO_Field_Array is array (0 .. 2) of Boolean
     with Component_Size => 1, Size => 3;

   --  Type definition for WAKE_EN0_CLK_SYS_PIO
   type WAKE_EN0_CLK_SYS_PIO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CLK_SYS_PIO as a value
            Val : HAL.UInt3;
         when True =>
            --  CLK_SYS_PIO as an array
            Arr : WAKE_EN0_CLK_SYS_PIO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for WAKE_EN0_CLK_SYS_PIO_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   --  enable clock in wake mode
   type WAKE_EN0_Register is record
      CLK_SYS_CLOCKS          : Boolean := True;
      CLK_SYS_ACCESSCTRL      : Boolean := True;
      CLK_ADC                 : Boolean := True;
      CLK_SYS_ADC             : Boolean := True;
      CLK_SYS_BOOTRAM         : Boolean := True;
      CLK_SYS_BUSCTRL         : Boolean := True;
      CLK_SYS_BUSFABRIC       : Boolean := True;
      CLK_SYS_DMA             : Boolean := True;
      CLK_SYS_GLITCH_DETECTOR : Boolean := True;
      CLK_HSTX                : Boolean := True;
      CLK_SYS_HSTX            : Boolean := True;
      CLK_SYS_I2C             : WAKE_EN0_CLK_SYS_I2C_Field :=
                                 (As_Array => False, Val => 16#1#);
      CLK_SYS_IO              : Boolean := True;
      CLK_SYS_JTAG            : Boolean := True;
      CLK_REF_OTP             : Boolean := True;
      CLK_SYS_OTP             : Boolean := True;
      CLK_SYS_PADS            : Boolean := True;
      CLK_SYS_PIO             : WAKE_EN0_CLK_SYS_PIO_Field :=
                                 (As_Array => False, Val => 16#1#);
      CLK_SYS_PLL_SYS         : Boolean := True;
      CLK_SYS_PLL_USB         : Boolean := True;
      CLK_REF_POWMAN          : Boolean := True;
      CLK_SYS_POWMAN          : Boolean := True;
      CLK_SYS_PWM             : Boolean := True;
      CLK_SYS_RESETS          : Boolean := True;
      CLK_SYS_ROM             : Boolean := True;
      CLK_SYS_ROSC            : Boolean := True;
      CLK_SYS_PSM             : Boolean := True;
      CLK_SYS_SHA256          : Boolean := True;
      CLK_SYS_SIO             : Boolean := True;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for WAKE_EN0_Register use record
      CLK_SYS_CLOCKS          at 0 range 0 .. 0;
      CLK_SYS_ACCESSCTRL      at 0 range 1 .. 1;
      CLK_ADC                 at 0 range 2 .. 2;
      CLK_SYS_ADC             at 0 range 3 .. 3;
      CLK_SYS_BOOTRAM         at 0 range 4 .. 4;
      CLK_SYS_BUSCTRL         at 0 range 5 .. 5;
      CLK_SYS_BUSFABRIC       at 0 range 6 .. 6;
      CLK_SYS_DMA             at 0 range 7 .. 7;
      CLK_SYS_GLITCH_DETECTOR at 0 range 8 .. 8;
      CLK_HSTX                at 0 range 9 .. 9;
      CLK_SYS_HSTX            at 0 range 10 .. 10;
      CLK_SYS_I2C             at 0 range 11 .. 12;
      CLK_SYS_IO              at 0 range 13 .. 13;
      CLK_SYS_JTAG            at 0 range 14 .. 14;
      CLK_REF_OTP             at 0 range 15 .. 15;
      CLK_SYS_OTP             at 0 range 16 .. 16;
      CLK_SYS_PADS            at 0 range 17 .. 17;
      CLK_SYS_PIO             at 0 range 18 .. 20;
      CLK_SYS_PLL_SYS         at 0 range 21 .. 21;
      CLK_SYS_PLL_USB         at 0 range 22 .. 22;
      CLK_REF_POWMAN          at 0 range 23 .. 23;
      CLK_SYS_POWMAN          at 0 range 24 .. 24;
      CLK_SYS_PWM             at 0 range 25 .. 25;
      CLK_SYS_RESETS          at 0 range 26 .. 26;
      CLK_SYS_ROM             at 0 range 27 .. 27;
      CLK_SYS_ROSC            at 0 range 28 .. 28;
      CLK_SYS_PSM             at 0 range 29 .. 29;
      CLK_SYS_SHA256          at 0 range 30 .. 30;
      CLK_SYS_SIO             at 0 range 31 .. 31;
   end record;

   --  WAKE_EN1_CLK_SYS_SRAM array
   type WAKE_EN1_CLK_SYS_SRAM_Field_Array is array (0 .. 9) of Boolean
     with Component_Size => 1, Size => 10;

   --  Type definition for WAKE_EN1_CLK_SYS_SRAM
   type WAKE_EN1_CLK_SYS_SRAM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CLK_SYS_SRAM as a value
            Val : HAL.UInt10;
         when True =>
            --  CLK_SYS_SRAM as an array
            Arr : WAKE_EN1_CLK_SYS_SRAM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 10;

   for WAKE_EN1_CLK_SYS_SRAM_Field use record
      Val at 0 range 0 .. 9;
      Arr at 0 range 0 .. 9;
   end record;

   --  WAKE_EN1_CLK_SYS_TIMER array
   type WAKE_EN1_CLK_SYS_TIMER_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for WAKE_EN1_CLK_SYS_TIMER
   type WAKE_EN1_CLK_SYS_TIMER_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CLK_SYS_TIMER as a value
            Val : HAL.UInt2;
         when True =>
            --  CLK_SYS_TIMER as an array
            Arr : WAKE_EN1_CLK_SYS_TIMER_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for WAKE_EN1_CLK_SYS_TIMER_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  enable clock in wake mode
   type WAKE_EN1_Register is record
      CLK_PERI_SPI0    : Boolean := True;
      CLK_SYS_SPI0     : Boolean := True;
      CLK_PERI_SPI1    : Boolean := True;
      CLK_SYS_SPI1     : Boolean := True;
      CLK_SYS_SRAM     : WAKE_EN1_CLK_SYS_SRAM_Field :=
                          (As_Array => False, Val => 16#1#);
      CLK_SYS_SYSCFG   : Boolean := True;
      CLK_SYS_SYSINFO  : Boolean := True;
      CLK_SYS_TBMAN    : Boolean := True;
      CLK_REF_TICKS    : Boolean := True;
      CLK_SYS_TICKS    : Boolean := True;
      CLK_SYS_TIMER    : WAKE_EN1_CLK_SYS_TIMER_Field :=
                          (As_Array => False, Val => 16#1#);
      CLK_SYS_TRNG     : Boolean := True;
      CLK_PERI_UART0   : Boolean := True;
      CLK_SYS_UART0    : Boolean := True;
      CLK_PERI_UART1   : Boolean := True;
      CLK_SYS_UART1    : Boolean := True;
      CLK_SYS_USBCTRL  : Boolean := True;
      CLK_USB          : Boolean := True;
      CLK_SYS_WATCHDOG : Boolean := True;
      CLK_SYS_XIP      : Boolean := True;
      CLK_SYS_XOSC     : Boolean := True;
      --  unspecified
      Reserved_31_31   : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for WAKE_EN1_Register use record
      CLK_PERI_SPI0    at 0 range 0 .. 0;
      CLK_SYS_SPI0     at 0 range 1 .. 1;
      CLK_PERI_SPI1    at 0 range 2 .. 2;
      CLK_SYS_SPI1     at 0 range 3 .. 3;
      CLK_SYS_SRAM     at 0 range 4 .. 13;
      CLK_SYS_SYSCFG   at 0 range 14 .. 14;
      CLK_SYS_SYSINFO  at 0 range 15 .. 15;
      CLK_SYS_TBMAN    at 0 range 16 .. 16;
      CLK_REF_TICKS    at 0 range 17 .. 17;
      CLK_SYS_TICKS    at 0 range 18 .. 18;
      CLK_SYS_TIMER    at 0 range 19 .. 20;
      CLK_SYS_TRNG     at 0 range 21 .. 21;
      CLK_PERI_UART0   at 0 range 22 .. 22;
      CLK_SYS_UART0    at 0 range 23 .. 23;
      CLK_PERI_UART1   at 0 range 24 .. 24;
      CLK_SYS_UART1    at 0 range 25 .. 25;
      CLK_SYS_USBCTRL  at 0 range 26 .. 26;
      CLK_USB          at 0 range 27 .. 27;
      CLK_SYS_WATCHDOG at 0 range 28 .. 28;
      CLK_SYS_XIP      at 0 range 29 .. 29;
      CLK_SYS_XOSC     at 0 range 30 .. 30;
      Reserved_31_31   at 0 range 31 .. 31;
   end record;

   --  SLEEP_EN0_CLK_SYS_I2C array
   type SLEEP_EN0_CLK_SYS_I2C_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for SLEEP_EN0_CLK_SYS_I2C
   type SLEEP_EN0_CLK_SYS_I2C_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CLK_SYS_I2C as a value
            Val : HAL.UInt2;
         when True =>
            --  CLK_SYS_I2C as an array
            Arr : SLEEP_EN0_CLK_SYS_I2C_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for SLEEP_EN0_CLK_SYS_I2C_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  SLEEP_EN0_CLK_SYS_PIO array
   type SLEEP_EN0_CLK_SYS_PIO_Field_Array is array (0 .. 2) of Boolean
     with Component_Size => 1, Size => 3;

   --  Type definition for SLEEP_EN0_CLK_SYS_PIO
   type SLEEP_EN0_CLK_SYS_PIO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CLK_SYS_PIO as a value
            Val : HAL.UInt3;
         when True =>
            --  CLK_SYS_PIO as an array
            Arr : SLEEP_EN0_CLK_SYS_PIO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for SLEEP_EN0_CLK_SYS_PIO_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   --  enable clock in sleep mode
   type SLEEP_EN0_Register is record
      CLK_SYS_CLOCKS          : Boolean := True;
      CLK_SYS_ACCESSCTRL      : Boolean := True;
      CLK_ADC                 : Boolean := True;
      CLK_SYS_ADC             : Boolean := True;
      CLK_SYS_BOOTRAM         : Boolean := True;
      CLK_SYS_BUSCTRL         : Boolean := True;
      CLK_SYS_BUSFABRIC       : Boolean := True;
      CLK_SYS_DMA             : Boolean := True;
      CLK_SYS_GLITCH_DETECTOR : Boolean := True;
      CLK_HSTX                : Boolean := True;
      CLK_SYS_HSTX            : Boolean := True;
      CLK_SYS_I2C             : SLEEP_EN0_CLK_SYS_I2C_Field :=
                                 (As_Array => False, Val => 16#1#);
      CLK_SYS_IO              : Boolean := True;
      CLK_SYS_JTAG            : Boolean := True;
      CLK_REF_OTP             : Boolean := True;
      CLK_SYS_OTP             : Boolean := True;
      CLK_SYS_PADS            : Boolean := True;
      CLK_SYS_PIO             : SLEEP_EN0_CLK_SYS_PIO_Field :=
                                 (As_Array => False, Val => 16#1#);
      CLK_SYS_PLL_SYS         : Boolean := True;
      CLK_SYS_PLL_USB         : Boolean := True;
      CLK_REF_POWMAN          : Boolean := True;
      CLK_SYS_POWMAN          : Boolean := True;
      CLK_SYS_PWM             : Boolean := True;
      CLK_SYS_RESETS          : Boolean := True;
      CLK_SYS_ROM             : Boolean := True;
      CLK_SYS_ROSC            : Boolean := True;
      CLK_SYS_PSM             : Boolean := True;
      CLK_SYS_SHA256          : Boolean := True;
      CLK_SYS_SIO             : Boolean := True;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SLEEP_EN0_Register use record
      CLK_SYS_CLOCKS          at 0 range 0 .. 0;
      CLK_SYS_ACCESSCTRL      at 0 range 1 .. 1;
      CLK_ADC                 at 0 range 2 .. 2;
      CLK_SYS_ADC             at 0 range 3 .. 3;
      CLK_SYS_BOOTRAM         at 0 range 4 .. 4;
      CLK_SYS_BUSCTRL         at 0 range 5 .. 5;
      CLK_SYS_BUSFABRIC       at 0 range 6 .. 6;
      CLK_SYS_DMA             at 0 range 7 .. 7;
      CLK_SYS_GLITCH_DETECTOR at 0 range 8 .. 8;
      CLK_HSTX                at 0 range 9 .. 9;
      CLK_SYS_HSTX            at 0 range 10 .. 10;
      CLK_SYS_I2C             at 0 range 11 .. 12;
      CLK_SYS_IO              at 0 range 13 .. 13;
      CLK_SYS_JTAG            at 0 range 14 .. 14;
      CLK_REF_OTP             at 0 range 15 .. 15;
      CLK_SYS_OTP             at 0 range 16 .. 16;
      CLK_SYS_PADS            at 0 range 17 .. 17;
      CLK_SYS_PIO             at 0 range 18 .. 20;
      CLK_SYS_PLL_SYS         at 0 range 21 .. 21;
      CLK_SYS_PLL_USB         at 0 range 22 .. 22;
      CLK_REF_POWMAN          at 0 range 23 .. 23;
      CLK_SYS_POWMAN          at 0 range 24 .. 24;
      CLK_SYS_PWM             at 0 range 25 .. 25;
      CLK_SYS_RESETS          at 0 range 26 .. 26;
      CLK_SYS_ROM             at 0 range 27 .. 27;
      CLK_SYS_ROSC            at 0 range 28 .. 28;
      CLK_SYS_PSM             at 0 range 29 .. 29;
      CLK_SYS_SHA256          at 0 range 30 .. 30;
      CLK_SYS_SIO             at 0 range 31 .. 31;
   end record;

   --  SLEEP_EN1_CLK_SYS_SRAM array
   type SLEEP_EN1_CLK_SYS_SRAM_Field_Array is array (0 .. 9) of Boolean
     with Component_Size => 1, Size => 10;

   --  Type definition for SLEEP_EN1_CLK_SYS_SRAM
   type SLEEP_EN1_CLK_SYS_SRAM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CLK_SYS_SRAM as a value
            Val : HAL.UInt10;
         when True =>
            --  CLK_SYS_SRAM as an array
            Arr : SLEEP_EN1_CLK_SYS_SRAM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 10;

   for SLEEP_EN1_CLK_SYS_SRAM_Field use record
      Val at 0 range 0 .. 9;
      Arr at 0 range 0 .. 9;
   end record;

   --  SLEEP_EN1_CLK_SYS_TIMER array
   type SLEEP_EN1_CLK_SYS_TIMER_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for SLEEP_EN1_CLK_SYS_TIMER
   type SLEEP_EN1_CLK_SYS_TIMER_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CLK_SYS_TIMER as a value
            Val : HAL.UInt2;
         when True =>
            --  CLK_SYS_TIMER as an array
            Arr : SLEEP_EN1_CLK_SYS_TIMER_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for SLEEP_EN1_CLK_SYS_TIMER_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  enable clock in sleep mode
   type SLEEP_EN1_Register is record
      CLK_PERI_SPI0    : Boolean := True;
      CLK_SYS_SPI0     : Boolean := True;
      CLK_PERI_SPI1    : Boolean := True;
      CLK_SYS_SPI1     : Boolean := True;
      CLK_SYS_SRAM     : SLEEP_EN1_CLK_SYS_SRAM_Field :=
                          (As_Array => False, Val => 16#1#);
      CLK_SYS_SYSCFG   : Boolean := True;
      CLK_SYS_SYSINFO  : Boolean := True;
      CLK_SYS_TBMAN    : Boolean := True;
      CLK_REF_TICKS    : Boolean := True;
      CLK_SYS_TICKS    : Boolean := True;
      CLK_SYS_TIMER    : SLEEP_EN1_CLK_SYS_TIMER_Field :=
                          (As_Array => False, Val => 16#1#);
      CLK_SYS_TRNG     : Boolean := True;
      CLK_PERI_UART0   : Boolean := True;
      CLK_SYS_UART0    : Boolean := True;
      CLK_PERI_UART1   : Boolean := True;
      CLK_SYS_UART1    : Boolean := True;
      CLK_SYS_USBCTRL  : Boolean := True;
      CLK_USB          : Boolean := True;
      CLK_SYS_WATCHDOG : Boolean := True;
      CLK_SYS_XIP      : Boolean := True;
      CLK_SYS_XOSC     : Boolean := True;
      --  unspecified
      Reserved_31_31   : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SLEEP_EN1_Register use record
      CLK_PERI_SPI0    at 0 range 0 .. 0;
      CLK_SYS_SPI0     at 0 range 1 .. 1;
      CLK_PERI_SPI1    at 0 range 2 .. 2;
      CLK_SYS_SPI1     at 0 range 3 .. 3;
      CLK_SYS_SRAM     at 0 range 4 .. 13;
      CLK_SYS_SYSCFG   at 0 range 14 .. 14;
      CLK_SYS_SYSINFO  at 0 range 15 .. 15;
      CLK_SYS_TBMAN    at 0 range 16 .. 16;
      CLK_REF_TICKS    at 0 range 17 .. 17;
      CLK_SYS_TICKS    at 0 range 18 .. 18;
      CLK_SYS_TIMER    at 0 range 19 .. 20;
      CLK_SYS_TRNG     at 0 range 21 .. 21;
      CLK_PERI_UART0   at 0 range 22 .. 22;
      CLK_SYS_UART0    at 0 range 23 .. 23;
      CLK_PERI_UART1   at 0 range 24 .. 24;
      CLK_SYS_UART1    at 0 range 25 .. 25;
      CLK_SYS_USBCTRL  at 0 range 26 .. 26;
      CLK_USB          at 0 range 27 .. 27;
      CLK_SYS_WATCHDOG at 0 range 28 .. 28;
      CLK_SYS_XIP      at 0 range 29 .. 29;
      CLK_SYS_XOSC     at 0 range 30 .. 30;
      Reserved_31_31   at 0 range 31 .. 31;
   end record;

   --  ENABLED0_CLK_SYS_I2C array
   type ENABLED0_CLK_SYS_I2C_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for ENABLED0_CLK_SYS_I2C
   type ENABLED0_CLK_SYS_I2C_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CLK_SYS_I2C as a value
            Val : HAL.UInt2;
         when True =>
            --  CLK_SYS_I2C as an array
            Arr : ENABLED0_CLK_SYS_I2C_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for ENABLED0_CLK_SYS_I2C_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  ENABLED0_CLK_SYS_PIO array
   type ENABLED0_CLK_SYS_PIO_Field_Array is array (0 .. 2) of Boolean
     with Component_Size => 1, Size => 3;

   --  Type definition for ENABLED0_CLK_SYS_PIO
   type ENABLED0_CLK_SYS_PIO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CLK_SYS_PIO as a value
            Val : HAL.UInt3;
         when True =>
            --  CLK_SYS_PIO as an array
            Arr : ENABLED0_CLK_SYS_PIO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for ENABLED0_CLK_SYS_PIO_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   --  indicates the state of the clock enable
   type ENABLED0_Register is record
      --  Read-only.
      CLK_SYS_CLOCKS          : Boolean;
      --  Read-only.
      CLK_SYS_ACCESSCTRL      : Boolean;
      --  Read-only.
      CLK_ADC                 : Boolean;
      --  Read-only.
      CLK_SYS_ADC             : Boolean;
      --  Read-only.
      CLK_SYS_BOOTRAM         : Boolean;
      --  Read-only.
      CLK_SYS_BUSCTRL         : Boolean;
      --  Read-only.
      CLK_SYS_BUSFABRIC       : Boolean;
      --  Read-only.
      CLK_SYS_DMA             : Boolean;
      --  Read-only.
      CLK_SYS_GLITCH_DETECTOR : Boolean;
      --  Read-only.
      CLK_HSTX                : Boolean;
      --  Read-only.
      CLK_SYS_HSTX            : Boolean;
      --  Read-only.
      CLK_SYS_I2C             : ENABLED0_CLK_SYS_I2C_Field;
      --  Read-only.
      CLK_SYS_IO              : Boolean;
      --  Read-only.
      CLK_SYS_JTAG            : Boolean;
      --  Read-only.
      CLK_REF_OTP             : Boolean;
      --  Read-only.
      CLK_SYS_OTP             : Boolean;
      --  Read-only.
      CLK_SYS_PADS            : Boolean;
      --  Read-only.
      CLK_SYS_PIO             : ENABLED0_CLK_SYS_PIO_Field;
      --  Read-only.
      CLK_SYS_PLL_SYS         : Boolean;
      --  Read-only.
      CLK_SYS_PLL_USB         : Boolean;
      --  Read-only.
      CLK_REF_POWMAN          : Boolean;
      --  Read-only.
      CLK_SYS_POWMAN          : Boolean;
      --  Read-only.
      CLK_SYS_PWM             : Boolean;
      --  Read-only.
      CLK_SYS_RESETS          : Boolean;
      --  Read-only.
      CLK_SYS_ROM             : Boolean;
      --  Read-only.
      CLK_SYS_ROSC            : Boolean;
      --  Read-only.
      CLK_SYS_PSM             : Boolean;
      --  Read-only.
      CLK_SYS_SHA256          : Boolean;
      --  Read-only.
      CLK_SYS_SIO             : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ENABLED0_Register use record
      CLK_SYS_CLOCKS          at 0 range 0 .. 0;
      CLK_SYS_ACCESSCTRL      at 0 range 1 .. 1;
      CLK_ADC                 at 0 range 2 .. 2;
      CLK_SYS_ADC             at 0 range 3 .. 3;
      CLK_SYS_BOOTRAM         at 0 range 4 .. 4;
      CLK_SYS_BUSCTRL         at 0 range 5 .. 5;
      CLK_SYS_BUSFABRIC       at 0 range 6 .. 6;
      CLK_SYS_DMA             at 0 range 7 .. 7;
      CLK_SYS_GLITCH_DETECTOR at 0 range 8 .. 8;
      CLK_HSTX                at 0 range 9 .. 9;
      CLK_SYS_HSTX            at 0 range 10 .. 10;
      CLK_SYS_I2C             at 0 range 11 .. 12;
      CLK_SYS_IO              at 0 range 13 .. 13;
      CLK_SYS_JTAG            at 0 range 14 .. 14;
      CLK_REF_OTP             at 0 range 15 .. 15;
      CLK_SYS_OTP             at 0 range 16 .. 16;
      CLK_SYS_PADS            at 0 range 17 .. 17;
      CLK_SYS_PIO             at 0 range 18 .. 20;
      CLK_SYS_PLL_SYS         at 0 range 21 .. 21;
      CLK_SYS_PLL_USB         at 0 range 22 .. 22;
      CLK_REF_POWMAN          at 0 range 23 .. 23;
      CLK_SYS_POWMAN          at 0 range 24 .. 24;
      CLK_SYS_PWM             at 0 range 25 .. 25;
      CLK_SYS_RESETS          at 0 range 26 .. 26;
      CLK_SYS_ROM             at 0 range 27 .. 27;
      CLK_SYS_ROSC            at 0 range 28 .. 28;
      CLK_SYS_PSM             at 0 range 29 .. 29;
      CLK_SYS_SHA256          at 0 range 30 .. 30;
      CLK_SYS_SIO             at 0 range 31 .. 31;
   end record;

   --  ENABLED1_CLK_SYS_SRAM array
   type ENABLED1_CLK_SYS_SRAM_Field_Array is array (0 .. 9) of Boolean
     with Component_Size => 1, Size => 10;

   --  Type definition for ENABLED1_CLK_SYS_SRAM
   type ENABLED1_CLK_SYS_SRAM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CLK_SYS_SRAM as a value
            Val : HAL.UInt10;
         when True =>
            --  CLK_SYS_SRAM as an array
            Arr : ENABLED1_CLK_SYS_SRAM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 10;

   for ENABLED1_CLK_SYS_SRAM_Field use record
      Val at 0 range 0 .. 9;
      Arr at 0 range 0 .. 9;
   end record;

   --  ENABLED1_CLK_SYS_TIMER array
   type ENABLED1_CLK_SYS_TIMER_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for ENABLED1_CLK_SYS_TIMER
   type ENABLED1_CLK_SYS_TIMER_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CLK_SYS_TIMER as a value
            Val : HAL.UInt2;
         when True =>
            --  CLK_SYS_TIMER as an array
            Arr : ENABLED1_CLK_SYS_TIMER_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for ENABLED1_CLK_SYS_TIMER_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  indicates the state of the clock enable
   type ENABLED1_Register is record
      --  Read-only.
      CLK_PERI_SPI0    : Boolean;
      --  Read-only.
      CLK_SYS_SPI0     : Boolean;
      --  Read-only.
      CLK_PERI_SPI1    : Boolean;
      --  Read-only.
      CLK_SYS_SPI1     : Boolean;
      --  Read-only.
      CLK_SYS_SRAM     : ENABLED1_CLK_SYS_SRAM_Field;
      --  Read-only.
      CLK_SYS_SYSCFG   : Boolean;
      --  Read-only.
      CLK_SYS_SYSINFO  : Boolean;
      --  Read-only.
      CLK_SYS_TBMAN    : Boolean;
      --  Read-only.
      CLK_REF_TICKS    : Boolean;
      --  Read-only.
      CLK_SYS_TICKS    : Boolean;
      --  Read-only.
      CLK_SYS_TIMER    : ENABLED1_CLK_SYS_TIMER_Field;
      --  Read-only.
      CLK_SYS_TRNG     : Boolean;
      --  Read-only.
      CLK_PERI_UART0   : Boolean;
      --  Read-only.
      CLK_SYS_UART0    : Boolean;
      --  Read-only.
      CLK_PERI_UART1   : Boolean;
      --  Read-only.
      CLK_SYS_UART1    : Boolean;
      --  Read-only.
      CLK_SYS_USBCTRL  : Boolean;
      --  Read-only.
      CLK_USB          : Boolean;
      --  Read-only.
      CLK_SYS_WATCHDOG : Boolean;
      --  Read-only.
      CLK_SYS_XIP      : Boolean;
      --  Read-only.
      CLK_SYS_XOSC     : Boolean;
      --  unspecified
      Reserved_31_31   : HAL.Bit;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ENABLED1_Register use record
      CLK_PERI_SPI0    at 0 range 0 .. 0;
      CLK_SYS_SPI0     at 0 range 1 .. 1;
      CLK_PERI_SPI1    at 0 range 2 .. 2;
      CLK_SYS_SPI1     at 0 range 3 .. 3;
      CLK_SYS_SRAM     at 0 range 4 .. 13;
      CLK_SYS_SYSCFG   at 0 range 14 .. 14;
      CLK_SYS_SYSINFO  at 0 range 15 .. 15;
      CLK_SYS_TBMAN    at 0 range 16 .. 16;
      CLK_REF_TICKS    at 0 range 17 .. 17;
      CLK_SYS_TICKS    at 0 range 18 .. 18;
      CLK_SYS_TIMER    at 0 range 19 .. 20;
      CLK_SYS_TRNG     at 0 range 21 .. 21;
      CLK_PERI_UART0   at 0 range 22 .. 22;
      CLK_SYS_UART0    at 0 range 23 .. 23;
      CLK_PERI_UART1   at 0 range 24 .. 24;
      CLK_SYS_UART1    at 0 range 25 .. 25;
      CLK_SYS_USBCTRL  at 0 range 26 .. 26;
      CLK_USB          at 0 range 27 .. 27;
      CLK_SYS_WATCHDOG at 0 range 28 .. 28;
      CLK_SYS_XIP      at 0 range 29 .. 29;
      CLK_SYS_XOSC     at 0 range 30 .. 30;
      Reserved_31_31   at 0 range 31 .. 31;
   end record;

   --  Raw Interrupts
   type INTR_Register is record
      --  Read-only.
      CLK_SYS_RESUS : Boolean;
      --  unspecified
      Reserved_1_31 : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTR_Register use record
      CLK_SYS_RESUS at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Interrupt Enable
   type INTE_Register is record
      CLK_SYS_RESUS : Boolean := False;
      --  unspecified
      Reserved_1_31 : HAL.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTE_Register use record
      CLK_SYS_RESUS at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Interrupt Force
   type INTF_Register is record
      CLK_SYS_RESUS : Boolean := False;
      --  unspecified
      Reserved_1_31 : HAL.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTF_Register use record
      CLK_SYS_RESUS at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Interrupt status after masking & forcing
   type INTS_Register is record
      --  Read-only.
      CLK_SYS_RESUS : Boolean;
      --  unspecified
      Reserved_1_31 : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTS_Register use record
      CLK_SYS_RESUS at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type CLOCKS_Peripheral is record
      --  Clock control, can be changed on-the-fly (except for auxsrc)
      CLK_GPOUT0_CTRL      : aliased CLK_GPOUT0_CTRL_Register;
      CLK_GPOUT0_DIV       : aliased CLK_GPOUT0_DIV_Register;
      --  Indicates which src is currently selected (one-hot)
      CLK_GPOUT0_SELECTED  : aliased CLK_GPOUT0_SELECTED_Register;
      --  Clock control, can be changed on-the-fly (except for auxsrc)
      CLK_GPOUT1_CTRL      : aliased CLK_GPOUT1_CTRL_Register;
      CLK_GPOUT1_DIV       : aliased CLK_GPOUT1_DIV_Register;
      --  Indicates which src is currently selected (one-hot)
      CLK_GPOUT1_SELECTED  : aliased CLK_GPOUT1_SELECTED_Register;
      --  Clock control, can be changed on-the-fly (except for auxsrc)
      CLK_GPOUT2_CTRL      : aliased CLK_GPOUT2_CTRL_Register;
      CLK_GPOUT2_DIV       : aliased CLK_GPOUT2_DIV_Register;
      --  Indicates which src is currently selected (one-hot)
      CLK_GPOUT2_SELECTED  : aliased CLK_GPOUT2_SELECTED_Register;
      --  Clock control, can be changed on-the-fly (except for auxsrc)
      CLK_GPOUT3_CTRL      : aliased CLK_GPOUT3_CTRL_Register;
      CLK_GPOUT3_DIV       : aliased CLK_GPOUT3_DIV_Register;
      --  Indicates which src is currently selected (one-hot)
      CLK_GPOUT3_SELECTED  : aliased CLK_GPOUT3_SELECTED_Register;
      --  Clock control, can be changed on-the-fly (except for auxsrc)
      CLK_REF_CTRL         : aliased CLK_REF_CTRL_Register;
      CLK_REF_DIV          : aliased CLK_REF_DIV_Register;
      --  Indicates which src is currently selected (one-hot)
      CLK_REF_SELECTED     : aliased CLK_REF_SELECTED_Register;
      --  Clock control, can be changed on-the-fly (except for auxsrc)
      CLK_SYS_CTRL         : aliased CLK_SYS_CTRL_Register;
      CLK_SYS_DIV          : aliased CLK_SYS_DIV_Register;
      --  Indicates which src is currently selected (one-hot)
      CLK_SYS_SELECTED     : aliased CLK_SYS_SELECTED_Register;
      --  Clock control, can be changed on-the-fly (except for auxsrc)
      CLK_PERI_CTRL        : aliased CLK_PERI_CTRL_Register;
      CLK_PERI_DIV         : aliased CLK_PERI_DIV_Register;
      --  Indicates which src is currently selected (one-hot)
      CLK_PERI_SELECTED    : aliased CLK_PERI_SELECTED_Register;
      --  Clock control, can be changed on-the-fly (except for auxsrc)
      CLK_HSTX_CTRL        : aliased CLK_HSTX_CTRL_Register;
      CLK_HSTX_DIV         : aliased CLK_HSTX_DIV_Register;
      --  Indicates which src is currently selected (one-hot)
      CLK_HSTX_SELECTED    : aliased CLK_HSTX_SELECTED_Register;
      --  Clock control, can be changed on-the-fly (except for auxsrc)
      CLK_USB_CTRL         : aliased CLK_USB_CTRL_Register;
      CLK_USB_DIV          : aliased CLK_USB_DIV_Register;
      --  Indicates which src is currently selected (one-hot)
      CLK_USB_SELECTED     : aliased CLK_USB_SELECTED_Register;
      --  Clock control, can be changed on-the-fly (except for auxsrc)
      CLK_ADC_CTRL         : aliased CLK_ADC_CTRL_Register;
      CLK_ADC_DIV          : aliased CLK_ADC_DIV_Register;
      --  Indicates which src is currently selected (one-hot)
      CLK_ADC_SELECTED     : aliased CLK_ADC_SELECTED_Register;
      DFTCLK_XOSC_CTRL     : aliased DFTCLK_XOSC_CTRL_Register;
      DFTCLK_ROSC_CTRL     : aliased DFTCLK_ROSC_CTRL_Register;
      DFTCLK_LPOSC_CTRL    : aliased DFTCLK_LPOSC_CTRL_Register;
      CLK_SYS_RESUS_CTRL   : aliased CLK_SYS_RESUS_CTRL_Register;
      CLK_SYS_RESUS_STATUS : aliased CLK_SYS_RESUS_STATUS_Register;
      --  Reference clock frequency in kHz
      FC0_REF_KHZ          : aliased FC0_REF_KHZ_Register;
      --  Minimum pass frequency in kHz. This is optional. Set to 0 if you are
      --  not using the pass/fail flags
      FC0_MIN_KHZ          : aliased FC0_MIN_KHZ_Register;
      --  Maximum pass frequency in kHz. This is optional. Set to 0x1ffffff if
      --  you are not using the pass/fail flags
      FC0_MAX_KHZ          : aliased FC0_MAX_KHZ_Register;
      --  Delays the start of frequency counting to allow the mux to settle
      --  Delay is measured in multiples of the reference clock period
      FC0_DELAY            : aliased FC0_DELAY_Register;
      --  The test interval is 0.98us * 2**interval, but let's call it 1us *
      --  2**interval The default gives a test interval of 250us
      FC0_INTERVAL         : aliased FC0_INTERVAL_Register;
      --  Clock sent to frequency counter, set to 0 when not required Writing
      --  to this register initiates the frequency count
      FC0_SRC              : aliased FC0_SRC_Register;
      --  Frequency counter status
      FC0_STATUS           : aliased FC0_STATUS_Register;
      --  Result of frequency measurement, only valid when status_done=1
      FC0_RESULT           : aliased FC0_RESULT_Register;
      --  enable clock in wake mode
      WAKE_EN0             : aliased WAKE_EN0_Register;
      --  enable clock in wake mode
      WAKE_EN1             : aliased WAKE_EN1_Register;
      --  enable clock in sleep mode
      SLEEP_EN0            : aliased SLEEP_EN0_Register;
      --  enable clock in sleep mode
      SLEEP_EN1            : aliased SLEEP_EN1_Register;
      --  indicates the state of the clock enable
      ENABLED0             : aliased ENABLED0_Register;
      --  indicates the state of the clock enable
      ENABLED1             : aliased ENABLED1_Register;
      --  Raw Interrupts
      INTR                 : aliased INTR_Register;
      --  Interrupt Enable
      INTE                 : aliased INTE_Register;
      --  Interrupt Force
      INTF                 : aliased INTF_Register;
      --  Interrupt status after masking & forcing
      INTS                 : aliased INTS_Register;
   end record
     with Volatile;

   for CLOCKS_Peripheral use record
      CLK_GPOUT0_CTRL      at 16#0# range 0 .. 31;
      CLK_GPOUT0_DIV       at 16#4# range 0 .. 31;
      CLK_GPOUT0_SELECTED  at 16#8# range 0 .. 31;
      CLK_GPOUT1_CTRL      at 16#C# range 0 .. 31;
      CLK_GPOUT1_DIV       at 16#10# range 0 .. 31;
      CLK_GPOUT1_SELECTED  at 16#14# range 0 .. 31;
      CLK_GPOUT2_CTRL      at 16#18# range 0 .. 31;
      CLK_GPOUT2_DIV       at 16#1C# range 0 .. 31;
      CLK_GPOUT2_SELECTED  at 16#20# range 0 .. 31;
      CLK_GPOUT3_CTRL      at 16#24# range 0 .. 31;
      CLK_GPOUT3_DIV       at 16#28# range 0 .. 31;
      CLK_GPOUT3_SELECTED  at 16#2C# range 0 .. 31;
      CLK_REF_CTRL         at 16#30# range 0 .. 31;
      CLK_REF_DIV          at 16#34# range 0 .. 31;
      CLK_REF_SELECTED     at 16#38# range 0 .. 31;
      CLK_SYS_CTRL         at 16#3C# range 0 .. 31;
      CLK_SYS_DIV          at 16#40# range 0 .. 31;
      CLK_SYS_SELECTED     at 16#44# range 0 .. 31;
      CLK_PERI_CTRL        at 16#48# range 0 .. 31;
      CLK_PERI_DIV         at 16#4C# range 0 .. 31;
      CLK_PERI_SELECTED    at 16#50# range 0 .. 31;
      CLK_HSTX_CTRL        at 16#54# range 0 .. 31;
      CLK_HSTX_DIV         at 16#58# range 0 .. 31;
      CLK_HSTX_SELECTED    at 16#5C# range 0 .. 31;
      CLK_USB_CTRL         at 16#60# range 0 .. 31;
      CLK_USB_DIV          at 16#64# range 0 .. 31;
      CLK_USB_SELECTED     at 16#68# range 0 .. 31;
      CLK_ADC_CTRL         at 16#6C# range 0 .. 31;
      CLK_ADC_DIV          at 16#70# range 0 .. 31;
      CLK_ADC_SELECTED     at 16#74# range 0 .. 31;
      DFTCLK_XOSC_CTRL     at 16#78# range 0 .. 31;
      DFTCLK_ROSC_CTRL     at 16#7C# range 0 .. 31;
      DFTCLK_LPOSC_CTRL    at 16#80# range 0 .. 31;
      CLK_SYS_RESUS_CTRL   at 16#84# range 0 .. 31;
      CLK_SYS_RESUS_STATUS at 16#88# range 0 .. 31;
      FC0_REF_KHZ          at 16#8C# range 0 .. 31;
      FC0_MIN_KHZ          at 16#90# range 0 .. 31;
      FC0_MAX_KHZ          at 16#94# range 0 .. 31;
      FC0_DELAY            at 16#98# range 0 .. 31;
      FC0_INTERVAL         at 16#9C# range 0 .. 31;
      FC0_SRC              at 16#A0# range 0 .. 31;
      FC0_STATUS           at 16#A4# range 0 .. 31;
      FC0_RESULT           at 16#A8# range 0 .. 31;
      WAKE_EN0             at 16#AC# range 0 .. 31;
      WAKE_EN1             at 16#B0# range 0 .. 31;
      SLEEP_EN0            at 16#B4# range 0 .. 31;
      SLEEP_EN1            at 16#B8# range 0 .. 31;
      ENABLED0             at 16#BC# range 0 .. 31;
      ENABLED1             at 16#C0# range 0 .. 31;
      INTR                 at 16#C4# range 0 .. 31;
      INTE                 at 16#C8# range 0 .. 31;
      INTF                 at 16#CC# range 0 .. 31;
      INTS                 at 16#D0# range 0 .. 31;
   end record;

   CLOCKS_Periph : aliased CLOCKS_Peripheral
     with Import, Address => CLOCKS_Base;

end RP2350_SVD.CLOCKS;
