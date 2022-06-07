--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
package RP.ROM.Floating_Point
   with Preelaborate
is
   procedure Initialize
     with Export,
          Convention    => C,
          External_Name => "__gnat_initialize_bootrom";
   --  __gnat_initialize_bootrom must be called before any of the __aeabi
   --  functions, which means it needs to be called before elaboration.
   --  crt0.S takes care of this, unless Use_Startup=false.

   --  Run-time ABI for the Arm® Architecture
   --  https://github.com/ARM-software/abi-aa/blob/main/rtabi32/rtabi32.rst
   function fadd (A, B : Float) return Float
      with Export, Convention => C, External_Name => "__aeabi_fadd";
   function fsub (A, B : Float) return Float
      with Export, Convention => C, External_Name => "__aeabi_fsub";
   function frsub (A, B : Float) return Float
      with Export, Convention => C, External_Name => "__aeabi_frsub";
   function fmul (A, B : Float) return Float
      with Export, Convention => C, External_Name => "__aeabi_fmul";
   function fdiv (A, B : Float) return Float
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

   function int2float (V : int) return Float
      with Export, Convention => C, External_Name => "__aeabi_i2f";
   --  pico-sdk doesn't use int2float and instead implements __aeabi_i2f in
   --  software. Maybe the ROM is missing an edge case?

   function uint2float (V : unsigned) return Float
      with Export, Convention => C, External_Name => "__aeabi_ui2f";

   function float2int (V : Float) return int
      with Export, Convention => C, External_Name => "__aeabi_f2iz";
   --  pico-sdk rewrites this one too

   function float2uint (V : Float) return unsigned
      with Export, Convention => C, External_Name => "__aeabi_f2uiz";

   function fsqrt (V : Float) return Float
      with Export, Convention => C, External_Name => "sqrtf";

   --  These trig functions only work in the range -128.0 .. 128.0 and return
   --  slightly incorrect values. Use at your own risk.
   function fsin (V : Float) return Float;
   --   with Export, Convention => C, External_Name => "sinf";
   function fcos (V : Float) return Float;
   --   with Export, Convention => C, External_Name => "cosf";
   function ftan (V : Float) return Float;
   --   with Export, Convention => C, External_Name => "tanf";
   function fexp (V : Float) return Float;
   --   with Export, Convention => C, External_Name => "expf";
   function fln (V : Float) return Float;
   --   with Export, Convention => C, External_Name => "logf";
end RP.ROM.Floating_Point;
