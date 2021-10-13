--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with Interfaces; use Interfaces;
with Interfaces.C;

package RP.ROM.AEABI is

   function fadd (A, B : Float)
      return Float
   with Export,
        Convention => C,
        External_Name => "__aeabi_fadd";

   function fsub (A, B : Float)
      return Float
   with Export,
        Convention => C,
        External_Name => "__aeabi_fsub";

   function fmul (A, B : Float)
      return Float
   with Export,
        Convention => C,
        External_Name => "__aeabi_fmul";

   function fdiv (A, B : Float)
      return Float
   with Export,
        Convention => C,
        External_Name => "__aeabi_fdiv";

   function fsqrt (V : Float)
      return Float
   with Export,
        Convention => C,
        External_Name => "__aeabi_fsqrt";

   function float2int (V : Float)
      return Integer
   with Export,
        Convention => C,
        External_Name => "__aeabi_f2iz";

   function fcos
      (Angle : Float)
      return Float
   with Export,
        Convention => C,
        External_Name => "__aeabi_fcos";

   function fsin
      (Angle : Float)
      return Float
   with Export,
        Convention => C,
        External_Name => "__aeabi_fsin";

   function ftan
      (Angle : Float)
      return Float
   with Export,
        Convention => C,
        External_Name => "__aeabi_ftan";

   --  The following functions are only available in bootrom V2

   function int642float
      (V : Integer_64)
      return Float
   with Export,
        Convention => C,
        External_Name => "__aeabi_l2f";

   function uint642float
      (V : Unsigned_64)
      return Float
   with Export,
        Convention => C,
        External_Name => "__aeabi_ul2f";

   function int2float
      (V : Integer)
      return Float
   with Export,
        Convention => C,
        External_Name => "__aeabi_i2f";

   function float2int64
      (V : Float)
      return Integer_64
   with Export,
        Convention => C,
        External_Name => "__aeabi_f2lz";

   function float2uint64
      (V : Float)
      return Unsigned_64
   with Export,
        Convention => C,
        External_Name => "__aeabi_f2ulz";

   function float2double
      (V : Float)
      return Interfaces.C.double
   with Export,
        Convention => C,
        External_Name => "__aeabi_f2d";

end RP.ROM.AEABI;
