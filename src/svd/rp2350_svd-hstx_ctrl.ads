pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

--  Control interface to HSTX. For FIFO write access and status, see the
--  HSTX_FIFO register block.
package RP2350_SVD.HSTX_CTRL is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CSR_COUPLED_SEL_Field is HAL.UInt2;
   subtype CSR_SHIFT_Field is HAL.UInt5;
   subtype CSR_N_SHIFTS_Field is HAL.UInt5;
   subtype CSR_CLKPHASE_Field is HAL.UInt4;
   subtype CSR_CLKDIV_Field is HAL.UInt4;

   type CSR_Register is record
      --  When EN is 1, the HSTX will shift out data as it appears in the FIFO.
      --  As long as there is data, the HSTX shift register will shift once per
      --  clock cycle, and the frequency of popping from the FIFO is determined
      --  by the ratio of SHIFT and SHIFT_THRESH. When EN is 0, the FIFO is not
      --  popped. The shift counter and clock generator are also reset to their
      --  initial state for as long as EN is low. Note the initial phase of the
      --  clock generator can be configured by the CLKPHASE field. Once the
      --  HSTX is enabled again, and data is pushed to the FIFO, the generated
      --  clock's first rising edge will be one half-period after the first
      --  data is launched.
      EN             : Boolean := False;
      --  Enable the command expander. When 0, raw FIFO data is passed directly
      --  to the output shift register. When 1, the command expander can
      --  perform simple operations such as run length decoding on data between
      --  the FIFO and the shift register. Do not change CXPD_EN whilst EN is
      --  set. It's safe to set CXPD_EN simultaneously with setting EN.
      EXPAND_EN      : Boolean := False;
      --  unspecified
      Reserved_2_3   : HAL.UInt2 := 16#0#;
      --  Enable the PIO-to-HSTX 1:1 connection. The HSTX must be clocked
      --  *directly* from the system clock (not just from some other clock
      --  source of the same frequency) for this synchronous interface to
      --  function correctly. When COUPLED_MODE is set, BITx_SEL_P and SEL_N
      --  indices 24 through 31 will select bits from the 8-bit PIO-to-HSTX
      --  path, rather than shifter bits. Indices of 0 through 23 will still
      --  index the shift register as normal. The PIO outputs connected to the
      --  PIO-to-HSTX bus are those same outputs that would appear on the
      --  HSTX-capable pins if those pins' FUNCSELs were set to PIO instead of
      --  HSTX. For example, if HSTX is on GPIOs 12 through 19, then PIO
      --  outputs 12 through 19 are connected to the HSTX when coupled mode is
      --  engaged.
      COUPLED_MODE   : Boolean := False;
      --  Select which PIO to use for coupled mode operation.
      COUPLED_SEL    : CSR_COUPLED_SEL_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      --  How many bits to right-rotate the shift register by each cycle. The
      --  use of a rotate rather than a shift allows left shifts to be
      --  emulated, by subtracting the left-shift amount from 32. It also
      --  allows data to be repeated, when the product of SHIFT and N_SHIFTS is
      --  greater than 32.
      SHIFT          : CSR_SHIFT_Field := 16#6#;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
      --  Number of times to shift the shift register before refilling it from
      --  the FIFO. (A count of how many times it has been shifted, *not* the
      --  total shift distance.) A register value of 0 means shift 32 times.
      N_SHIFTS       : CSR_N_SHIFTS_Field := 16#5#;
      --  unspecified
      Reserved_21_23 : HAL.UInt3 := 16#0#;
      --  Set the initial phase of the generated clock. A CLKPHASE of 0 means
      --  the clock is initially low, and the first rising edge occurs after
      --  one half period of the generated clock (i.e. CLKDIV/2 cycles of
      --  clk_hstx). Incrementing CLKPHASE by 1 will advance the initial clock
      --  phase by one half clk_hstx period. For example, if CLKDIV=2 and
      --  CLKPHASE=1: * The clock will be initially low * The first rising edge
      --  will be 0.5 clk_hstx cycles after asserting first data * The first
      --  falling edge will be 1.5 clk_hstx cycles after asserting first data
      --  This configuration would be suitable for serialising at a bit rate of
      --  clk_hstx with a centre-aligned DDR clock. When the HSTX is halted by
      --  clearing CSR_EN, the clock generator will return to its initial phase
      --  as configured by the CLKPHASE field. Note CLKPHASE must be strictly
      --  less than double the value of CLKDIV (one full period), else its
      --  operation is undefined.
      CLKPHASE       : CSR_CLKPHASE_Field := 16#0#;
      --  Clock period of the generated clock, measured in HSTX clock cycles.
      --  Can be odd or even. The generated clock advances only on cycles where
      --  the shift register shifts. For example, a clkdiv of 5 would generate
      --  a complete output clock period for every 5 HSTX clocks (or every 10
      --  half-clocks). A CLKDIV value of 0 is mapped to a period of 16 HSTX
      --  clock cycles.
      CLKDIV         : CSR_CLKDIV_Field := 16#1#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CSR_Register use record
      EN             at 0 range 0 .. 0;
      EXPAND_EN      at 0 range 1 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      COUPLED_MODE   at 0 range 4 .. 4;
      COUPLED_SEL    at 0 range 5 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      SHIFT          at 0 range 8 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      N_SHIFTS       at 0 range 16 .. 20;
      Reserved_21_23 at 0 range 21 .. 23;
      CLKPHASE       at 0 range 24 .. 27;
      CLKDIV         at 0 range 28 .. 31;
   end record;

   subtype BIT_SEL_P_Field is HAL.UInt5;
   subtype BIT_SEL_N_Field is HAL.UInt5;

   --  Data control register for output bit 0
   type BIT_Register is record
      --  Shift register data bit select for the first half of the HSTX clock
      --  cycle
      SEL_P          : BIT_SEL_P_Field := 16#0#;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      --  Shift register data bit select for the second half of the HSTX clock
      --  cycle
      SEL_N          : BIT_SEL_N_Field := 16#0#;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
      --  Invert this data output (logical NOT)
      INV            : Boolean := False;
      --  Connect this output to the generated clock, rather than the data
      --  shift register. SEL_P and SEL_N are ignored if this bit is set, but
      --  INV can still be set to generate an antiphase clock.
      CLK            : Boolean := False;
      --  unspecified
      Reserved_18_31 : HAL.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BIT_Register use record
      SEL_P          at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      SEL_N          at 0 range 8 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      INV            at 0 range 16 .. 16;
      CLK            at 0 range 17 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   subtype EXPAND_SHIFT_RAW_SHIFT_Field is HAL.UInt5;
   subtype EXPAND_SHIFT_RAW_N_SHIFTS_Field is HAL.UInt5;
   subtype EXPAND_SHIFT_ENC_SHIFT_Field is HAL.UInt5;
   subtype EXPAND_SHIFT_ENC_N_SHIFTS_Field is HAL.UInt5;

   --  Configure the optional shifter inside the command expander
   type EXPAND_SHIFT_Register is record
      --  How many bits to right-rotate the shift register by each time data is
      --  pushed to the output shifter, when the current command is a raw data
      --  command.
      RAW_SHIFT      : EXPAND_SHIFT_RAW_SHIFT_Field := 16#0#;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      --  Number of times to consume from the shift register before refilling
      --  it from the FIFO, when the current command is a raw data command. A
      --  register value of 0 means shift 32 times.
      RAW_N_SHIFTS   : EXPAND_SHIFT_RAW_N_SHIFTS_Field := 16#1#;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
      --  How many bits to right-rotate the shift register by each time data is
      --  pushed to the output shifter, when the current command is an encoded
      --  data command (e.g. TMDS).
      ENC_SHIFT      : EXPAND_SHIFT_ENC_SHIFT_Field := 16#0#;
      --  unspecified
      Reserved_21_23 : HAL.UInt3 := 16#0#;
      --  Number of times to consume from the shift register before refilling
      --  it from the FIFO, when the current command is an encoded data command
      --  (e.g. TMDS). A register value of 0 means shift 32 times.
      ENC_N_SHIFTS   : EXPAND_SHIFT_ENC_N_SHIFTS_Field := 16#1#;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EXPAND_SHIFT_Register use record
      RAW_SHIFT      at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      RAW_N_SHIFTS   at 0 range 8 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      ENC_SHIFT      at 0 range 16 .. 20;
      Reserved_21_23 at 0 range 21 .. 23;
      ENC_N_SHIFTS   at 0 range 24 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype EXPAND_TMDS_L0_ROT_Field is HAL.UInt5;
   subtype EXPAND_TMDS_L0_NBITS_Field is HAL.UInt3;
   subtype EXPAND_TMDS_L1_ROT_Field is HAL.UInt5;
   subtype EXPAND_TMDS_L1_NBITS_Field is HAL.UInt3;
   subtype EXPAND_TMDS_L2_ROT_Field is HAL.UInt5;
   subtype EXPAND_TMDS_L2_NBITS_Field is HAL.UInt3;

   --  Configure the optional TMDS encoder inside the command expander
   type EXPAND_TMDS_Register is record
      --  Right-rotate applied to the current shifter data before the lane 0
      --  TMDS encoder.
      L0_ROT         : EXPAND_TMDS_L0_ROT_Field := 16#0#;
      --  Number of valid data bits for the lane 0 TMDS encoder, starting from
      --  bit 7 of the rotated data. Field values of 0 -> 7 encode counts of 1
      --  -> 8 bits.
      L0_NBITS       : EXPAND_TMDS_L0_NBITS_Field := 16#0#;
      --  Right-rotate applied to the current shifter data before the lane 1
      --  TMDS encoder.
      L1_ROT         : EXPAND_TMDS_L1_ROT_Field := 16#0#;
      --  Number of valid data bits for the lane 1 TMDS encoder, starting from
      --  bit 7 of the rotated data. Field values of 0 -> 7 encode counts of 1
      --  -> 8 bits.
      L1_NBITS       : EXPAND_TMDS_L1_NBITS_Field := 16#0#;
      --  Right-rotate applied to the current shifter data before the lane 2
      --  TMDS encoder.
      L2_ROT         : EXPAND_TMDS_L2_ROT_Field := 16#0#;
      --  Number of valid data bits for the lane 2 TMDS encoder, starting from
      --  bit 7 of the rotated data. Field values of 0 -> 7 encode counts of 1
      --  -> 8 bits.
      L2_NBITS       : EXPAND_TMDS_L2_NBITS_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EXPAND_TMDS_Register use record
      L0_ROT         at 0 range 0 .. 4;
      L0_NBITS       at 0 range 5 .. 7;
      L1_ROT         at 0 range 8 .. 12;
      L1_NBITS       at 0 range 13 .. 15;
      L2_ROT         at 0 range 16 .. 20;
      L2_NBITS       at 0 range 21 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Control interface to HSTX. For FIFO write access and status, see the
   --  HSTX_FIFO register block.
   type HSTX_CTRL_Peripheral is record
      CSR          : aliased CSR_Register;
      --  Data control register for output bit 0
      BIT0         : aliased BIT_Register;
      --  Data control register for output bit 1
      BIT1         : aliased BIT_Register;
      --  Data control register for output bit 2
      BIT2         : aliased BIT_Register;
      --  Data control register for output bit 3
      BIT3         : aliased BIT_Register;
      --  Data control register for output bit 4
      BIT4         : aliased BIT_Register;
      --  Data control register for output bit 5
      BIT5         : aliased BIT_Register;
      --  Data control register for output bit 6
      BIT6         : aliased BIT_Register;
      --  Data control register for output bit 7
      BIT7         : aliased BIT_Register;
      --  Configure the optional shifter inside the command expander
      EXPAND_SHIFT : aliased EXPAND_SHIFT_Register;
      --  Configure the optional TMDS encoder inside the command expander
      EXPAND_TMDS  : aliased EXPAND_TMDS_Register;
   end record
     with Volatile;

   for HSTX_CTRL_Peripheral use record
      CSR          at 16#0# range 0 .. 31;
      BIT0         at 16#4# range 0 .. 31;
      BIT1         at 16#8# range 0 .. 31;
      BIT2         at 16#C# range 0 .. 31;
      BIT3         at 16#10# range 0 .. 31;
      BIT4         at 16#14# range 0 .. 31;
      BIT5         at 16#18# range 0 .. 31;
      BIT6         at 16#1C# range 0 .. 31;
      BIT7         at 16#20# range 0 .. 31;
      EXPAND_SHIFT at 16#24# range 0 .. 31;
      EXPAND_TMDS  at 16#28# range 0 .. 31;
   end record;

   --  Control interface to HSTX. For FIFO write access and status, see the
   --  HSTX_FIFO register block.
   HSTX_CTRL_Periph : aliased HSTX_CTRL_Peripheral
     with Import, Address => HSTX_CTRL_Base;

end RP2350_SVD.HSTX_CTRL;
