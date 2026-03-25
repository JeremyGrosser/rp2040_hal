pragma Style_Checks (Off);

--  Copyright (c) 2020 Raspberry Pi (Trading) Ltd.
--
--  SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2040.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

--  Simple PWM
package RP2040_SVD.PWM is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   type CH0_CSR_DIVMODE_Field is
     (--  Free-running counting at rate dictated by fractional divider
      div,
      --  Fractional divider operation is gated by the PWM B pin.
      level,
      --  Counter advances with each rising edge of the PWM B pin.
      rise,
      --  Counter advances with each falling edge of the PWM B pin.
      fall)
     with Size => 2;
   for CH0_CSR_DIVMODE_Field use
     (div => 0,
      level => 1,
      rise => 2,
      fall => 3);

   --  Control and status register
   type CH0_CSR_Register is record
      --  Enable the PWM channel.
      EN            : Boolean := False;
      --  1: Enable phase-correct modulation. 0: Trailing-edge
      PH_CORRECT    : Boolean := False;
      --  Invert output A
      A_INV         : Boolean := False;
      --  Invert output B
      B_INV         : Boolean := False;
      DIVMODE       : CH0_CSR_DIVMODE_Field := RP2040_SVD.PWM.div;
      --  After a write operation all bits in the field are cleared (set to
      --  zero). Retard the phase of the counter by 1 count, while it is
      --  running.\n Self-clearing. Write a 1, and poll until low. Counter must
      --  be running.
      PH_RET        : Boolean := False;
      --  After a write operation all bits in the field are cleared (set to
      --  zero). Advance the phase of the counter by 1 count, while it is
      --  running.\n Self-clearing. Write a 1, and poll until low. Counter must
      --  be running\n at less than full speed (div_int + div_frac / 16 > 1)
      PH_ADV        : Boolean := False;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH0_CSR_Register use record
      EN            at 0 range 0 .. 0;
      PH_CORRECT    at 0 range 1 .. 1;
      A_INV         at 0 range 2 .. 2;
      B_INV         at 0 range 3 .. 3;
      DIVMODE       at 0 range 4 .. 5;
      PH_RET        at 0 range 6 .. 6;
      PH_ADV        at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CH0_DIV_FRAC_Field is HAL.UInt4;
   subtype CH0_DIV_INT_Field is HAL.UInt8;

   --  INT and FRAC form a fixed-point fractional number.\n Counting rate is
   --  system clock frequency divided by this number.\n Fractional division
   --  uses simple 1st-order sigma-delta.
   type CH0_DIV_Register is record
      FRAC           : CH0_DIV_FRAC_Field := 16#0#;
      INT            : CH0_DIV_INT_Field := 16#1#;
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH0_DIV_Register use record
      FRAC           at 0 range 0 .. 3;
      INT            at 0 range 4 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype CH0_CTR_CH0_CTR_Field is HAL.UInt16;

   --  Direct access to the PWM counter
   type CH0_CTR_Register is record
      CH0_CTR        : CH0_CTR_CH0_CTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH0_CTR_Register use record
      CH0_CTR        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CH0_CC_A_Field is HAL.UInt16;
   subtype CH0_CC_B_Field is HAL.UInt16;

   --  Counter compare values
   type CH0_CC_Register is record
      A : CH0_CC_A_Field := 16#0#;
      B : CH0_CC_B_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH0_CC_Register use record
      A at 0 range 0 .. 15;
      B at 0 range 16 .. 31;
   end record;

   subtype CH0_TOP_CH0_TOP_Field is HAL.UInt16;

   --  Counter wrap value
   type CH0_TOP_Register is record
      CH0_TOP        : CH0_TOP_CH0_TOP_Field := 16#FFFF#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH0_TOP_Register use record
      CH0_TOP        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   type CH1_CSR_DIVMODE_Field is
     (--  Free-running counting at rate dictated by fractional divider
      div,
      --  Fractional divider operation is gated by the PWM B pin.
      level,
      --  Counter advances with each rising edge of the PWM B pin.
      rise,
      --  Counter advances with each falling edge of the PWM B pin.
      fall)
     with Size => 2;
   for CH1_CSR_DIVMODE_Field use
     (div => 0,
      level => 1,
      rise => 2,
      fall => 3);

   --  Control and status register
   type CH1_CSR_Register is record
      --  Enable the PWM channel.
      EN            : Boolean := False;
      --  1: Enable phase-correct modulation. 0: Trailing-edge
      PH_CORRECT    : Boolean := False;
      --  Invert output A
      A_INV         : Boolean := False;
      --  Invert output B
      B_INV         : Boolean := False;
      DIVMODE       : CH1_CSR_DIVMODE_Field := RP2040_SVD.PWM.div;
      --  After a write operation all bits in the field are cleared (set to
      --  zero). Retard the phase of the counter by 1 count, while it is
      --  running.\n Self-clearing. Write a 1, and poll until low. Counter must
      --  be running.
      PH_RET        : Boolean := False;
      --  After a write operation all bits in the field are cleared (set to
      --  zero). Advance the phase of the counter by 1 count, while it is
      --  running.\n Self-clearing. Write a 1, and poll until low. Counter must
      --  be running\n at less than full speed (div_int + div_frac / 16 > 1)
      PH_ADV        : Boolean := False;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH1_CSR_Register use record
      EN            at 0 range 0 .. 0;
      PH_CORRECT    at 0 range 1 .. 1;
      A_INV         at 0 range 2 .. 2;
      B_INV         at 0 range 3 .. 3;
      DIVMODE       at 0 range 4 .. 5;
      PH_RET        at 0 range 6 .. 6;
      PH_ADV        at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CH1_DIV_FRAC_Field is HAL.UInt4;
   subtype CH1_DIV_INT_Field is HAL.UInt8;

   --  INT and FRAC form a fixed-point fractional number.\n Counting rate is
   --  system clock frequency divided by this number.\n Fractional division
   --  uses simple 1st-order sigma-delta.
   type CH1_DIV_Register is record
      FRAC           : CH1_DIV_FRAC_Field := 16#0#;
      INT            : CH1_DIV_INT_Field := 16#1#;
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH1_DIV_Register use record
      FRAC           at 0 range 0 .. 3;
      INT            at 0 range 4 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype CH1_CTR_CH1_CTR_Field is HAL.UInt16;

   --  Direct access to the PWM counter
   type CH1_CTR_Register is record
      CH1_CTR        : CH1_CTR_CH1_CTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH1_CTR_Register use record
      CH1_CTR        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CH1_CC_A_Field is HAL.UInt16;
   subtype CH1_CC_B_Field is HAL.UInt16;

   --  Counter compare values
   type CH1_CC_Register is record
      A : CH1_CC_A_Field := 16#0#;
      B : CH1_CC_B_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH1_CC_Register use record
      A at 0 range 0 .. 15;
      B at 0 range 16 .. 31;
   end record;

   subtype CH1_TOP_CH1_TOP_Field is HAL.UInt16;

   --  Counter wrap value
   type CH1_TOP_Register is record
      CH1_TOP        : CH1_TOP_CH1_TOP_Field := 16#FFFF#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH1_TOP_Register use record
      CH1_TOP        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   type CH2_CSR_DIVMODE_Field is
     (--  Free-running counting at rate dictated by fractional divider
      div,
      --  Fractional divider operation is gated by the PWM B pin.
      level,
      --  Counter advances with each rising edge of the PWM B pin.
      rise,
      --  Counter advances with each falling edge of the PWM B pin.
      fall)
     with Size => 2;
   for CH2_CSR_DIVMODE_Field use
     (div => 0,
      level => 1,
      rise => 2,
      fall => 3);

   --  Control and status register
   type CH2_CSR_Register is record
      --  Enable the PWM channel.
      EN            : Boolean := False;
      --  1: Enable phase-correct modulation. 0: Trailing-edge
      PH_CORRECT    : Boolean := False;
      --  Invert output A
      A_INV         : Boolean := False;
      --  Invert output B
      B_INV         : Boolean := False;
      DIVMODE       : CH2_CSR_DIVMODE_Field := RP2040_SVD.PWM.div;
      --  After a write operation all bits in the field are cleared (set to
      --  zero). Retard the phase of the counter by 1 count, while it is
      --  running.\n Self-clearing. Write a 1, and poll until low. Counter must
      --  be running.
      PH_RET        : Boolean := False;
      --  After a write operation all bits in the field are cleared (set to
      --  zero). Advance the phase of the counter by 1 count, while it is
      --  running.\n Self-clearing. Write a 1, and poll until low. Counter must
      --  be running\n at less than full speed (div_int + div_frac / 16 > 1)
      PH_ADV        : Boolean := False;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH2_CSR_Register use record
      EN            at 0 range 0 .. 0;
      PH_CORRECT    at 0 range 1 .. 1;
      A_INV         at 0 range 2 .. 2;
      B_INV         at 0 range 3 .. 3;
      DIVMODE       at 0 range 4 .. 5;
      PH_RET        at 0 range 6 .. 6;
      PH_ADV        at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CH2_DIV_FRAC_Field is HAL.UInt4;
   subtype CH2_DIV_INT_Field is HAL.UInt8;

   --  INT and FRAC form a fixed-point fractional number.\n Counting rate is
   --  system clock frequency divided by this number.\n Fractional division
   --  uses simple 1st-order sigma-delta.
   type CH2_DIV_Register is record
      FRAC           : CH2_DIV_FRAC_Field := 16#0#;
      INT            : CH2_DIV_INT_Field := 16#1#;
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH2_DIV_Register use record
      FRAC           at 0 range 0 .. 3;
      INT            at 0 range 4 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype CH2_CTR_CH2_CTR_Field is HAL.UInt16;

   --  Direct access to the PWM counter
   type CH2_CTR_Register is record
      CH2_CTR        : CH2_CTR_CH2_CTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH2_CTR_Register use record
      CH2_CTR        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CH2_CC_A_Field is HAL.UInt16;
   subtype CH2_CC_B_Field is HAL.UInt16;

   --  Counter compare values
   type CH2_CC_Register is record
      A : CH2_CC_A_Field := 16#0#;
      B : CH2_CC_B_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH2_CC_Register use record
      A at 0 range 0 .. 15;
      B at 0 range 16 .. 31;
   end record;

   subtype CH2_TOP_CH2_TOP_Field is HAL.UInt16;

   --  Counter wrap value
   type CH2_TOP_Register is record
      CH2_TOP        : CH2_TOP_CH2_TOP_Field := 16#FFFF#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH2_TOP_Register use record
      CH2_TOP        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   type CH3_CSR_DIVMODE_Field is
     (--  Free-running counting at rate dictated by fractional divider
      div,
      --  Fractional divider operation is gated by the PWM B pin.
      level,
      --  Counter advances with each rising edge of the PWM B pin.
      rise,
      --  Counter advances with each falling edge of the PWM B pin.
      fall)
     with Size => 2;
   for CH3_CSR_DIVMODE_Field use
     (div => 0,
      level => 1,
      rise => 2,
      fall => 3);

   --  Control and status register
   type CH3_CSR_Register is record
      --  Enable the PWM channel.
      EN            : Boolean := False;
      --  1: Enable phase-correct modulation. 0: Trailing-edge
      PH_CORRECT    : Boolean := False;
      --  Invert output A
      A_INV         : Boolean := False;
      --  Invert output B
      B_INV         : Boolean := False;
      DIVMODE       : CH3_CSR_DIVMODE_Field := RP2040_SVD.PWM.div;
      --  After a write operation all bits in the field are cleared (set to
      --  zero). Retard the phase of the counter by 1 count, while it is
      --  running.\n Self-clearing. Write a 1, and poll until low. Counter must
      --  be running.
      PH_RET        : Boolean := False;
      --  After a write operation all bits in the field are cleared (set to
      --  zero). Advance the phase of the counter by 1 count, while it is
      --  running.\n Self-clearing. Write a 1, and poll until low. Counter must
      --  be running\n at less than full speed (div_int + div_frac / 16 > 1)
      PH_ADV        : Boolean := False;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH3_CSR_Register use record
      EN            at 0 range 0 .. 0;
      PH_CORRECT    at 0 range 1 .. 1;
      A_INV         at 0 range 2 .. 2;
      B_INV         at 0 range 3 .. 3;
      DIVMODE       at 0 range 4 .. 5;
      PH_RET        at 0 range 6 .. 6;
      PH_ADV        at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CH3_DIV_FRAC_Field is HAL.UInt4;
   subtype CH3_DIV_INT_Field is HAL.UInt8;

   --  INT and FRAC form a fixed-point fractional number.\n Counting rate is
   --  system clock frequency divided by this number.\n Fractional division
   --  uses simple 1st-order sigma-delta.
   type CH3_DIV_Register is record
      FRAC           : CH3_DIV_FRAC_Field := 16#0#;
      INT            : CH3_DIV_INT_Field := 16#1#;
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH3_DIV_Register use record
      FRAC           at 0 range 0 .. 3;
      INT            at 0 range 4 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype CH3_CTR_CH3_CTR_Field is HAL.UInt16;

   --  Direct access to the PWM counter
   type CH3_CTR_Register is record
      CH3_CTR        : CH3_CTR_CH3_CTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH3_CTR_Register use record
      CH3_CTR        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CH3_CC_A_Field is HAL.UInt16;
   subtype CH3_CC_B_Field is HAL.UInt16;

   --  Counter compare values
   type CH3_CC_Register is record
      A : CH3_CC_A_Field := 16#0#;
      B : CH3_CC_B_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH3_CC_Register use record
      A at 0 range 0 .. 15;
      B at 0 range 16 .. 31;
   end record;

   subtype CH3_TOP_CH3_TOP_Field is HAL.UInt16;

   --  Counter wrap value
   type CH3_TOP_Register is record
      CH3_TOP        : CH3_TOP_CH3_TOP_Field := 16#FFFF#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH3_TOP_Register use record
      CH3_TOP        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   type CH4_CSR_DIVMODE_Field is
     (--  Free-running counting at rate dictated by fractional divider
      div,
      --  Fractional divider operation is gated by the PWM B pin.
      level,
      --  Counter advances with each rising edge of the PWM B pin.
      rise,
      --  Counter advances with each falling edge of the PWM B pin.
      fall)
     with Size => 2;
   for CH4_CSR_DIVMODE_Field use
     (div => 0,
      level => 1,
      rise => 2,
      fall => 3);

   --  Control and status register
   type CH4_CSR_Register is record
      --  Enable the PWM channel.
      EN            : Boolean := False;
      --  1: Enable phase-correct modulation. 0: Trailing-edge
      PH_CORRECT    : Boolean := False;
      --  Invert output A
      A_INV         : Boolean := False;
      --  Invert output B
      B_INV         : Boolean := False;
      DIVMODE       : CH4_CSR_DIVMODE_Field := RP2040_SVD.PWM.div;
      --  After a write operation all bits in the field are cleared (set to
      --  zero). Retard the phase of the counter by 1 count, while it is
      --  running.\n Self-clearing. Write a 1, and poll until low. Counter must
      --  be running.
      PH_RET        : Boolean := False;
      --  After a write operation all bits in the field are cleared (set to
      --  zero). Advance the phase of the counter by 1 count, while it is
      --  running.\n Self-clearing. Write a 1, and poll until low. Counter must
      --  be running\n at less than full speed (div_int + div_frac / 16 > 1)
      PH_ADV        : Boolean := False;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH4_CSR_Register use record
      EN            at 0 range 0 .. 0;
      PH_CORRECT    at 0 range 1 .. 1;
      A_INV         at 0 range 2 .. 2;
      B_INV         at 0 range 3 .. 3;
      DIVMODE       at 0 range 4 .. 5;
      PH_RET        at 0 range 6 .. 6;
      PH_ADV        at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CH4_DIV_FRAC_Field is HAL.UInt4;
   subtype CH4_DIV_INT_Field is HAL.UInt8;

   --  INT and FRAC form a fixed-point fractional number.\n Counting rate is
   --  system clock frequency divided by this number.\n Fractional division
   --  uses simple 1st-order sigma-delta.
   type CH4_DIV_Register is record
      FRAC           : CH4_DIV_FRAC_Field := 16#0#;
      INT            : CH4_DIV_INT_Field := 16#1#;
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH4_DIV_Register use record
      FRAC           at 0 range 0 .. 3;
      INT            at 0 range 4 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype CH4_CTR_CH4_CTR_Field is HAL.UInt16;

   --  Direct access to the PWM counter
   type CH4_CTR_Register is record
      CH4_CTR        : CH4_CTR_CH4_CTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH4_CTR_Register use record
      CH4_CTR        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CH4_CC_A_Field is HAL.UInt16;
   subtype CH4_CC_B_Field is HAL.UInt16;

   --  Counter compare values
   type CH4_CC_Register is record
      A : CH4_CC_A_Field := 16#0#;
      B : CH4_CC_B_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH4_CC_Register use record
      A at 0 range 0 .. 15;
      B at 0 range 16 .. 31;
   end record;

   subtype CH4_TOP_CH4_TOP_Field is HAL.UInt16;

   --  Counter wrap value
   type CH4_TOP_Register is record
      CH4_TOP        : CH4_TOP_CH4_TOP_Field := 16#FFFF#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH4_TOP_Register use record
      CH4_TOP        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   type CH5_CSR_DIVMODE_Field is
     (--  Free-running counting at rate dictated by fractional divider
      div,
      --  Fractional divider operation is gated by the PWM B pin.
      level,
      --  Counter advances with each rising edge of the PWM B pin.
      rise,
      --  Counter advances with each falling edge of the PWM B pin.
      fall)
     with Size => 2;
   for CH5_CSR_DIVMODE_Field use
     (div => 0,
      level => 1,
      rise => 2,
      fall => 3);

   --  Control and status register
   type CH5_CSR_Register is record
      --  Enable the PWM channel.
      EN            : Boolean := False;
      --  1: Enable phase-correct modulation. 0: Trailing-edge
      PH_CORRECT    : Boolean := False;
      --  Invert output A
      A_INV         : Boolean := False;
      --  Invert output B
      B_INV         : Boolean := False;
      DIVMODE       : CH5_CSR_DIVMODE_Field := RP2040_SVD.PWM.div;
      --  After a write operation all bits in the field are cleared (set to
      --  zero). Retard the phase of the counter by 1 count, while it is
      --  running.\n Self-clearing. Write a 1, and poll until low. Counter must
      --  be running.
      PH_RET        : Boolean := False;
      --  After a write operation all bits in the field are cleared (set to
      --  zero). Advance the phase of the counter by 1 count, while it is
      --  running.\n Self-clearing. Write a 1, and poll until low. Counter must
      --  be running\n at less than full speed (div_int + div_frac / 16 > 1)
      PH_ADV        : Boolean := False;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH5_CSR_Register use record
      EN            at 0 range 0 .. 0;
      PH_CORRECT    at 0 range 1 .. 1;
      A_INV         at 0 range 2 .. 2;
      B_INV         at 0 range 3 .. 3;
      DIVMODE       at 0 range 4 .. 5;
      PH_RET        at 0 range 6 .. 6;
      PH_ADV        at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CH5_DIV_FRAC_Field is HAL.UInt4;
   subtype CH5_DIV_INT_Field is HAL.UInt8;

   --  INT and FRAC form a fixed-point fractional number.\n Counting rate is
   --  system clock frequency divided by this number.\n Fractional division
   --  uses simple 1st-order sigma-delta.
   type CH5_DIV_Register is record
      FRAC           : CH5_DIV_FRAC_Field := 16#0#;
      INT            : CH5_DIV_INT_Field := 16#1#;
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH5_DIV_Register use record
      FRAC           at 0 range 0 .. 3;
      INT            at 0 range 4 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype CH5_CTR_CH5_CTR_Field is HAL.UInt16;

   --  Direct access to the PWM counter
   type CH5_CTR_Register is record
      CH5_CTR        : CH5_CTR_CH5_CTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH5_CTR_Register use record
      CH5_CTR        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CH5_CC_A_Field is HAL.UInt16;
   subtype CH5_CC_B_Field is HAL.UInt16;

   --  Counter compare values
   type CH5_CC_Register is record
      A : CH5_CC_A_Field := 16#0#;
      B : CH5_CC_B_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH5_CC_Register use record
      A at 0 range 0 .. 15;
      B at 0 range 16 .. 31;
   end record;

   subtype CH5_TOP_CH5_TOP_Field is HAL.UInt16;

   --  Counter wrap value
   type CH5_TOP_Register is record
      CH5_TOP        : CH5_TOP_CH5_TOP_Field := 16#FFFF#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH5_TOP_Register use record
      CH5_TOP        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   type CH6_CSR_DIVMODE_Field is
     (--  Free-running counting at rate dictated by fractional divider
      div,
      --  Fractional divider operation is gated by the PWM B pin.
      level,
      --  Counter advances with each rising edge of the PWM B pin.
      rise,
      --  Counter advances with each falling edge of the PWM B pin.
      fall)
     with Size => 2;
   for CH6_CSR_DIVMODE_Field use
     (div => 0,
      level => 1,
      rise => 2,
      fall => 3);

   --  Control and status register
   type CH6_CSR_Register is record
      --  Enable the PWM channel.
      EN            : Boolean := False;
      --  1: Enable phase-correct modulation. 0: Trailing-edge
      PH_CORRECT    : Boolean := False;
      --  Invert output A
      A_INV         : Boolean := False;
      --  Invert output B
      B_INV         : Boolean := False;
      DIVMODE       : CH6_CSR_DIVMODE_Field := RP2040_SVD.PWM.div;
      --  After a write operation all bits in the field are cleared (set to
      --  zero). Retard the phase of the counter by 1 count, while it is
      --  running.\n Self-clearing. Write a 1, and poll until low. Counter must
      --  be running.
      PH_RET        : Boolean := False;
      --  After a write operation all bits in the field are cleared (set to
      --  zero). Advance the phase of the counter by 1 count, while it is
      --  running.\n Self-clearing. Write a 1, and poll until low. Counter must
      --  be running\n at less than full speed (div_int + div_frac / 16 > 1)
      PH_ADV        : Boolean := False;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH6_CSR_Register use record
      EN            at 0 range 0 .. 0;
      PH_CORRECT    at 0 range 1 .. 1;
      A_INV         at 0 range 2 .. 2;
      B_INV         at 0 range 3 .. 3;
      DIVMODE       at 0 range 4 .. 5;
      PH_RET        at 0 range 6 .. 6;
      PH_ADV        at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CH6_DIV_FRAC_Field is HAL.UInt4;
   subtype CH6_DIV_INT_Field is HAL.UInt8;

   --  INT and FRAC form a fixed-point fractional number.\n Counting rate is
   --  system clock frequency divided by this number.\n Fractional division
   --  uses simple 1st-order sigma-delta.
   type CH6_DIV_Register is record
      FRAC           : CH6_DIV_FRAC_Field := 16#0#;
      INT            : CH6_DIV_INT_Field := 16#1#;
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH6_DIV_Register use record
      FRAC           at 0 range 0 .. 3;
      INT            at 0 range 4 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype CH6_CTR_CH6_CTR_Field is HAL.UInt16;

   --  Direct access to the PWM counter
   type CH6_CTR_Register is record
      CH6_CTR        : CH6_CTR_CH6_CTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH6_CTR_Register use record
      CH6_CTR        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CH6_CC_A_Field is HAL.UInt16;
   subtype CH6_CC_B_Field is HAL.UInt16;

   --  Counter compare values
   type CH6_CC_Register is record
      A : CH6_CC_A_Field := 16#0#;
      B : CH6_CC_B_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH6_CC_Register use record
      A at 0 range 0 .. 15;
      B at 0 range 16 .. 31;
   end record;

   subtype CH6_TOP_CH6_TOP_Field is HAL.UInt16;

   --  Counter wrap value
   type CH6_TOP_Register is record
      CH6_TOP        : CH6_TOP_CH6_TOP_Field := 16#FFFF#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH6_TOP_Register use record
      CH6_TOP        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   type CH7_CSR_DIVMODE_Field is
     (--  Free-running counting at rate dictated by fractional divider
      div,
      --  Fractional divider operation is gated by the PWM B pin.
      level,
      --  Counter advances with each rising edge of the PWM B pin.
      rise,
      --  Counter advances with each falling edge of the PWM B pin.
      fall)
     with Size => 2;
   for CH7_CSR_DIVMODE_Field use
     (div => 0,
      level => 1,
      rise => 2,
      fall => 3);

   --  Control and status register
   type CH7_CSR_Register is record
      --  Enable the PWM channel.
      EN            : Boolean := False;
      --  1: Enable phase-correct modulation. 0: Trailing-edge
      PH_CORRECT    : Boolean := False;
      --  Invert output A
      A_INV         : Boolean := False;
      --  Invert output B
      B_INV         : Boolean := False;
      DIVMODE       : CH7_CSR_DIVMODE_Field := RP2040_SVD.PWM.div;
      --  After a write operation all bits in the field are cleared (set to
      --  zero). Retard the phase of the counter by 1 count, while it is
      --  running.\n Self-clearing. Write a 1, and poll until low. Counter must
      --  be running.
      PH_RET        : Boolean := False;
      --  After a write operation all bits in the field are cleared (set to
      --  zero). Advance the phase of the counter by 1 count, while it is
      --  running.\n Self-clearing. Write a 1, and poll until low. Counter must
      --  be running\n at less than full speed (div_int + div_frac / 16 > 1)
      PH_ADV        : Boolean := False;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH7_CSR_Register use record
      EN            at 0 range 0 .. 0;
      PH_CORRECT    at 0 range 1 .. 1;
      A_INV         at 0 range 2 .. 2;
      B_INV         at 0 range 3 .. 3;
      DIVMODE       at 0 range 4 .. 5;
      PH_RET        at 0 range 6 .. 6;
      PH_ADV        at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CH7_DIV_FRAC_Field is HAL.UInt4;
   subtype CH7_DIV_INT_Field is HAL.UInt8;

   --  INT and FRAC form a fixed-point fractional number.\n Counting rate is
   --  system clock frequency divided by this number.\n Fractional division
   --  uses simple 1st-order sigma-delta.
   type CH7_DIV_Register is record
      FRAC           : CH7_DIV_FRAC_Field := 16#0#;
      INT            : CH7_DIV_INT_Field := 16#1#;
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH7_DIV_Register use record
      FRAC           at 0 range 0 .. 3;
      INT            at 0 range 4 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype CH7_CTR_CH7_CTR_Field is HAL.UInt16;

   --  Direct access to the PWM counter
   type CH7_CTR_Register is record
      CH7_CTR        : CH7_CTR_CH7_CTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH7_CTR_Register use record
      CH7_CTR        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CH7_CC_A_Field is HAL.UInt16;
   subtype CH7_CC_B_Field is HAL.UInt16;

   --  Counter compare values
   type CH7_CC_Register is record
      A : CH7_CC_A_Field := 16#0#;
      B : CH7_CC_B_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH7_CC_Register use record
      A at 0 range 0 .. 15;
      B at 0 range 16 .. 31;
   end record;

   subtype CH7_TOP_CH7_TOP_Field is HAL.UInt16;

   --  Counter wrap value
   type CH7_TOP_Register is record
      CH7_TOP        : CH7_TOP_CH7_TOP_Field := 16#FFFF#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH7_TOP_Register use record
      CH7_TOP        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  EN_CH array
   type EN_CH_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for EN_CH
   type EN_CH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CH as a value
            Val : HAL.UInt8;
         when True =>
            --  CH as an array
            Arr : EN_CH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for EN_CH_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  This register aliases the CSR_EN bits for all channels.\n Writing to
   --  this register allows multiple channels to be enabled\n or disabled
   --  simultaneously, so they can run in perfect sync.\n For each channel,
   --  there is only one physical EN register bit,\n which can be accessed
   --  through here or CHx_CSR.
   type EN_Register is record
      CH            : EN_CH_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EN_Register use record
      CH            at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  INTR_CH array
   type INTR_CH_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for INTR_CH
   type INTR_CH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CH as a value
            Val : HAL.UInt8;
         when True =>
            --  CH as an array
            Arr : INTR_CH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for INTR_CH_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  Raw Interrupts
   type INTR_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      CH            : INTR_CH_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTR_Register use record
      CH            at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  INTE_CH array
   type INTE_CH_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for INTE_CH
   type INTE_CH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CH as a value
            Val : HAL.UInt8;
         when True =>
            --  CH as an array
            Arr : INTE_CH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for INTE_CH_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  Interrupt Enable
   type INTE_Register is record
      CH            : INTE_CH_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTE_Register use record
      CH            at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  INTF_CH array
   type INTF_CH_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for INTF_CH
   type INTF_CH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CH as a value
            Val : HAL.UInt8;
         when True =>
            --  CH as an array
            Arr : INTF_CH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for INTF_CH_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  Interrupt Force
   type INTF_Register is record
      CH            : INTF_CH_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTF_Register use record
      CH            at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  INTS_CH array
   type INTS_CH_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for INTS_CH
   type INTS_CH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CH as a value
            Val : HAL.UInt8;
         when True =>
            --  CH as an array
            Arr : INTS_CH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for INTS_CH_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  Interrupt status after masking & forcing
   type INTS_Register is record
      --  Read-only.
      CH            : INTS_CH_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTS_Register use record
      CH            at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Simple PWM
   type PWM_Peripheral is record
      --  Control and status register
      CH0_CSR : aliased CH0_CSR_Register;
      --  INT and FRAC form a fixed-point fractional number.\n Counting rate is
      --  system clock frequency divided by this number.\n Fractional division
      --  uses simple 1st-order sigma-delta.
      CH0_DIV : aliased CH0_DIV_Register;
      --  Direct access to the PWM counter
      CH0_CTR : aliased CH0_CTR_Register;
      --  Counter compare values
      CH0_CC  : aliased CH0_CC_Register;
      --  Counter wrap value
      CH0_TOP : aliased CH0_TOP_Register;
      --  Control and status register
      CH1_CSR : aliased CH1_CSR_Register;
      --  INT and FRAC form a fixed-point fractional number.\n Counting rate is
      --  system clock frequency divided by this number.\n Fractional division
      --  uses simple 1st-order sigma-delta.
      CH1_DIV : aliased CH1_DIV_Register;
      --  Direct access to the PWM counter
      CH1_CTR : aliased CH1_CTR_Register;
      --  Counter compare values
      CH1_CC  : aliased CH1_CC_Register;
      --  Counter wrap value
      CH1_TOP : aliased CH1_TOP_Register;
      --  Control and status register
      CH2_CSR : aliased CH2_CSR_Register;
      --  INT and FRAC form a fixed-point fractional number.\n Counting rate is
      --  system clock frequency divided by this number.\n Fractional division
      --  uses simple 1st-order sigma-delta.
      CH2_DIV : aliased CH2_DIV_Register;
      --  Direct access to the PWM counter
      CH2_CTR : aliased CH2_CTR_Register;
      --  Counter compare values
      CH2_CC  : aliased CH2_CC_Register;
      --  Counter wrap value
      CH2_TOP : aliased CH2_TOP_Register;
      --  Control and status register
      CH3_CSR : aliased CH3_CSR_Register;
      --  INT and FRAC form a fixed-point fractional number.\n Counting rate is
      --  system clock frequency divided by this number.\n Fractional division
      --  uses simple 1st-order sigma-delta.
      CH3_DIV : aliased CH3_DIV_Register;
      --  Direct access to the PWM counter
      CH3_CTR : aliased CH3_CTR_Register;
      --  Counter compare values
      CH3_CC  : aliased CH3_CC_Register;
      --  Counter wrap value
      CH3_TOP : aliased CH3_TOP_Register;
      --  Control and status register
      CH4_CSR : aliased CH4_CSR_Register;
      --  INT and FRAC form a fixed-point fractional number.\n Counting rate is
      --  system clock frequency divided by this number.\n Fractional division
      --  uses simple 1st-order sigma-delta.
      CH4_DIV : aliased CH4_DIV_Register;
      --  Direct access to the PWM counter
      CH4_CTR : aliased CH4_CTR_Register;
      --  Counter compare values
      CH4_CC  : aliased CH4_CC_Register;
      --  Counter wrap value
      CH4_TOP : aliased CH4_TOP_Register;
      --  Control and status register
      CH5_CSR : aliased CH5_CSR_Register;
      --  INT and FRAC form a fixed-point fractional number.\n Counting rate is
      --  system clock frequency divided by this number.\n Fractional division
      --  uses simple 1st-order sigma-delta.
      CH5_DIV : aliased CH5_DIV_Register;
      --  Direct access to the PWM counter
      CH5_CTR : aliased CH5_CTR_Register;
      --  Counter compare values
      CH5_CC  : aliased CH5_CC_Register;
      --  Counter wrap value
      CH5_TOP : aliased CH5_TOP_Register;
      --  Control and status register
      CH6_CSR : aliased CH6_CSR_Register;
      --  INT and FRAC form a fixed-point fractional number.\n Counting rate is
      --  system clock frequency divided by this number.\n Fractional division
      --  uses simple 1st-order sigma-delta.
      CH6_DIV : aliased CH6_DIV_Register;
      --  Direct access to the PWM counter
      CH6_CTR : aliased CH6_CTR_Register;
      --  Counter compare values
      CH6_CC  : aliased CH6_CC_Register;
      --  Counter wrap value
      CH6_TOP : aliased CH6_TOP_Register;
      --  Control and status register
      CH7_CSR : aliased CH7_CSR_Register;
      --  INT and FRAC form a fixed-point fractional number.\n Counting rate is
      --  system clock frequency divided by this number.\n Fractional division
      --  uses simple 1st-order sigma-delta.
      CH7_DIV : aliased CH7_DIV_Register;
      --  Direct access to the PWM counter
      CH7_CTR : aliased CH7_CTR_Register;
      --  Counter compare values
      CH7_CC  : aliased CH7_CC_Register;
      --  Counter wrap value
      CH7_TOP : aliased CH7_TOP_Register;
      --  This register aliases the CSR_EN bits for all channels.\n Writing to
      --  this register allows multiple channels to be enabled\n or disabled
      --  simultaneously, so they can run in perfect sync.\n For each channel,
      --  there is only one physical EN register bit,\n which can be accessed
      --  through here or CHx_CSR.
      EN      : aliased EN_Register;
      --  Raw Interrupts
      INTR    : aliased INTR_Register;
      --  Interrupt Enable
      INTE    : aliased INTE_Register;
      --  Interrupt Force
      INTF    : aliased INTF_Register;
      --  Interrupt status after masking & forcing
      INTS    : aliased INTS_Register;
   end record
     with Volatile;

   for PWM_Peripheral use record
      CH0_CSR at 16#0# range 0 .. 31;
      CH0_DIV at 16#4# range 0 .. 31;
      CH0_CTR at 16#8# range 0 .. 31;
      CH0_CC  at 16#C# range 0 .. 31;
      CH0_TOP at 16#10# range 0 .. 31;
      CH1_CSR at 16#14# range 0 .. 31;
      CH1_DIV at 16#18# range 0 .. 31;
      CH1_CTR at 16#1C# range 0 .. 31;
      CH1_CC  at 16#20# range 0 .. 31;
      CH1_TOP at 16#24# range 0 .. 31;
      CH2_CSR at 16#28# range 0 .. 31;
      CH2_DIV at 16#2C# range 0 .. 31;
      CH2_CTR at 16#30# range 0 .. 31;
      CH2_CC  at 16#34# range 0 .. 31;
      CH2_TOP at 16#38# range 0 .. 31;
      CH3_CSR at 16#3C# range 0 .. 31;
      CH3_DIV at 16#40# range 0 .. 31;
      CH3_CTR at 16#44# range 0 .. 31;
      CH3_CC  at 16#48# range 0 .. 31;
      CH3_TOP at 16#4C# range 0 .. 31;
      CH4_CSR at 16#50# range 0 .. 31;
      CH4_DIV at 16#54# range 0 .. 31;
      CH4_CTR at 16#58# range 0 .. 31;
      CH4_CC  at 16#5C# range 0 .. 31;
      CH4_TOP at 16#60# range 0 .. 31;
      CH5_CSR at 16#64# range 0 .. 31;
      CH5_DIV at 16#68# range 0 .. 31;
      CH5_CTR at 16#6C# range 0 .. 31;
      CH5_CC  at 16#70# range 0 .. 31;
      CH5_TOP at 16#74# range 0 .. 31;
      CH6_CSR at 16#78# range 0 .. 31;
      CH6_DIV at 16#7C# range 0 .. 31;
      CH6_CTR at 16#80# range 0 .. 31;
      CH6_CC  at 16#84# range 0 .. 31;
      CH6_TOP at 16#88# range 0 .. 31;
      CH7_CSR at 16#8C# range 0 .. 31;
      CH7_DIV at 16#90# range 0 .. 31;
      CH7_CTR at 16#94# range 0 .. 31;
      CH7_CC  at 16#98# range 0 .. 31;
      CH7_TOP at 16#9C# range 0 .. 31;
      EN      at 16#A0# range 0 .. 31;
      INTR    at 16#A4# range 0 .. 31;
      INTE    at 16#A8# range 0 .. 31;
      INTF    at 16#AC# range 0 .. 31;
      INTS    at 16#B0# range 0 .. 31;
   end record;

   --  Simple PWM
   PWM_Periph : aliased PWM_Peripheral
     with Import, Address => PWM_Base;

end RP2040_SVD.PWM;
