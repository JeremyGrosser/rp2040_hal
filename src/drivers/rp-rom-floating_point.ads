--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
package RP.ROM.Floating_Point is
   procedure Initialize
     with Export,
          Convention    => C,
          External_Name => "rp_rom_float_initialize";
   --  rp_rom_float_initialize must be called before any of the __aeabi
   --  functions, which means it needs to be called before elaboration.
   --  crt0.S takes care of this, unless Use_Startup=false.

   --  Run-time ABI for the Arm® Architecture
   --  https://github.com/ARM-software/abi-aa/blob/main/rtabi32/rtabi32.rst
   function fadd (A, B : C_float) return C_float
      with Export, Convention => C, External_Name => "__aeabi_fadd";
   function fsub (A, B : C_float) return C_float
      with Export, Convention => C, External_Name => "__aeabi_fsub";
   function frsub (A, B : C_float) return C_float
      with Export, Convention => C, External_Name => "__aeabi_frsub";
   function fmul (A, B : C_float) return C_float
      with Export, Convention => C, External_Name => "__aeabi_fmul";
   function fdiv (A, B : C_float) return C_float
      with Export, Convention => C, External_Name => "__aeabi_fdiv";

   --  __aeabi_cfcmpeq
   --  __aeabi_cfrcmple
   --  __aeabi_cfcmple
   --  __aeabi_fcmpeq
   --  __aeabi_fcmplt
   --  __aeabi_fcmple
   --  __aeabi_fcmpge
   --  __aeabi_fcmpgt
   --  __aeabi_fcmpun

   function int2float (V : int) return C_float
      with Export, Convention => C, External_Name => "__aeabi_i2f";
   --  pico-sdk doesn't use int2float and instead implements __aeabi_i2f in
   --  software. Maybe the ROM is missing an edge case?

   function int642float (V : long_long) return C_float
      with Export, Convention => C, External_Name => "__aeabi_l2f";
   function uint2float (V : unsigned) return C_float
      with Export, Convention => C, External_Name => "__aeabi_ui2f";
   function uint642float (V : unsigned_long_long) return C_float
      with Export, Convention => C, External_Name => "__aeabi_ul2f";

   function float2int (V : C_float) return int
      with Export, Convention => C, External_Name => "__aeabi_f2iz";
   --  pico-sdk rewrites this one too

   function float2int64 (V : C_float) return long_long
      with Export, Convention => C, External_Name => "__aeabi_f2lz";
   function float2uint (V : C_float) return unsigned
      with Export, Convention => C, External_Name => "__aeabi_f2uiz";
   function float2uint64 (V : C_float) return unsigned_long_long
      with Export, Convention => C, External_Name => "__aeabi_f2ulz";
   function float2double (V : C_float) return double
      with Export, Convention => C, External_Name => "__aeabi_f2d";

   function fsqrt (V : C_float) return C_float
      with Export, Convention => C, External_Name => "sqrtf";

   --  These trig functions only work in the range -128.0 .. 128.0 and return
   --  slightly incorrect values. Use at your own risk.
   function fsin (V : C_float) return C_float;
   --   with Export, Convention => C, External_Name => "sinf";
   function fcos (V : C_float) return C_float;
   --   with Export, Convention => C, External_Name => "cosf";
   function ftan (V : C_float) return C_float;
   --   with Export, Convention => C, External_Name => "tanf";
   function fexp (V : C_float) return C_float;
   --   with Export, Convention => C, External_Name => "expf";
   function fln (V : C_float) return C_float;
   --   with Export, Convention => C, External_Name => "logf";
end RP.ROM.Floating_Point;
