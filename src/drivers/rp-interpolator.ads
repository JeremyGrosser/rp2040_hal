--
--  Copyright 2021 (C) Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
--  2.3.1.6 Interpolator
--
--  Stare at Figure 8 on page 33 of the datasheet until it makes sense.
--
--  There are two interpolators per core, mapped via the SIO peripheral. This
--  driver treats them as separate peripherals, but they really aren't.
--
--  Due to the relatively simple structure of the INTERP registers and the
--  desire for single cycle operation, this driver exposes the register records
--  directly rather than wrapping them with procedures.
--
with HAL; use HAL;

package RP.Interpolator is

   type Lane_Config is record
      --  Logical right-shift applied to ACCUM before masking
      SHIFT          : UInt5   := 0;

      --  Least significant bit allowed to pass by the mask (inclusive)
      MASK_LSB       : UInt5   := 0;

      --  Most significant bit allowed to pass by the mask (inclusive)
      --  Setting MSB < LSB may cause chip to turn inside-out
      --
      --  The reset value of MASK_MSB is 0, but the SDK uses 31 in the default
      --  config, which seems preferable.
      MASK_MSB       : UInt5   := 31;

      --  The shifted and masked accumulator value is sign-extended to 32 bits
      --  before adding to BASE
      SIGNED         : Boolean := False;

      --  Feed the opposite lane's result into this lane's shift+mask
      --  hardware on POP
      CROSS_INPUT    : Boolean := False;

      --  Feed the opposite lane's result into this lane's accumulator
      --  on pop
      CROSS_RESULT   : Boolean := False;

      --  Mask and shift is bypassed for this lane's result. This does not
      --  affect the FULL (Lane 2) result.
      ADD_RAW        : Boolean := False;

      --  ORed into bits 29:28 of the lane result presented to the processor on the bus.
      FORCE_MSB      : UInt2   := 0;

      --  BLEND is only on INTERP_0 Lane 0.
      --
      --  LANE1 result is a linear interpolation between BASE0 and BASE1,
      --  controlled by the 8 LSBs of lane 1 shift and mask value (a fractional
      --  number between 0 and 255/256ths)
      --
      --  LANE0 result does not have BASE0 added (yields only the 8 LSBs of
      --  lane 1 shift+mask value)
      --
      --  FULL result does not have lane 1 shift+mask value added (BASE2 + lane 0 shift+mask)
      --
      --  LANE1 SIGNED flag controls whether the interpolation is signed or unsigned.
      BLEND          : Boolean := False;

      --  CLAMP is only on INTERP_1 Lane 0
      --
      --  LANE0 result is shifted and masked ACCUM0, clamped by a lower bound
      --  of BASE0 and upper bound of BASE1.
      --
      --  Signedness of these comparisons is determined by CTRL (0).SIGNED
      CLAMP          : Boolean := False;

      --  Overflow flags are only present on Lane 0
      --
      --  Indicates if any masked-off MSBs in either ACCUM are set
      OVERF           : Boolean := False;

      --  Indicates if any masked-off MSBs in ACCUM0 are set
      OVERF1          : Boolean := False;

      --  Indicates if any masked-off MSBs in ACCUM1 are set
      OVERF0          : Boolean := False;
   end record
      with Volatile_Full_Access,
           Size => 32;

   for Lane_Config use record
      SHIFT          at 0 range 0 .. 4;
      MASK_LSB       at 0 range 5 .. 9;
      MASK_MSB       at 0 range 10 .. 14;
      SIGNED         at 0 range 15 .. 15;
      CROSS_INPUT    at 0 range 16 .. 16;
      CROSS_RESULT   at 0 range 17 .. 17;
      ADD_RAW        at 0 range 18 .. 18;
      FORCE_MSB      at 0 range 19 .. 20;
      BLEND          at 0 range 21 .. 21;
      CLAMP          at 0 range 22 .. 22;
      OVERF0         at 0 range 23 .. 23;
      OVERF1         at 0 range 24 .. 24;
      OVERF          at 0 range 25 .. 25;
   end record;

   --  Lane 2 is special and only has BASE, PEEK, and POP registers
   --  The datasheet sometimes refers to Lane 2 as the "FULL" lane
   type Lane is range 0 .. 2;

   type ACCUM_Register  is array (Lane range 0 .. 1) of UInt32;
   type LANE_Register   is array (Lane) of UInt32;
   type CTRL_Register   is array (Lane range 0 .. 1) of Lane_Config;
   type ADD_Register    is array (Lane range 0 .. 1) of UInt24
      with Component_Size => 32;

   --  These register names are simplified and combined into arrays where
   --  possible and may not match the datasheet. The upstream SDK does
   --  something similar.
   type INTERP_Peripheral is record
      ACCUM       : ACCUM_Register;
      BASE        : LANE_Register;
      POP         : LANE_Register;
      PEEK        : LANE_Register;
      CTRL        : CTRL_Register;
      ADD         : ADD_Register;
      BASE_1AND0  : UInt32;
   end record
      with Volatile,
           Size => 512;

   for INTERP_Peripheral use record
      ACCUM       at 16#00# range 0 .. 63;
      BASE        at 16#08# range 0 .. 95;
      POP         at 16#14# range 0 .. 95;
      PEEK        at 16#20# range 0 .. 95;
      CTRL        at 16#2C# range 0 .. 63;
      ADD         at 16#34# range 0 .. 63;
      BASE_1AND0  at 16#3C# range 0 .. 31;
   end record;

end RP.Interpolator;
