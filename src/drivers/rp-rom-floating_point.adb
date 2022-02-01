--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
pragma Warnings (Off, "actuals for this call may be in wrong order");
with Atomic.Critical_Section;

package body RP.ROM.Floating_Point is

   type rom_fadd is access function (A, B : C_float) return C_float
      with Convention => C;
   type rom_fsub is access function (A, B : C_float) return C_float
      with Convention => C;
   type rom_fmul is access function (A, B : C_float) return C_float
      with Convention => C;
   type rom_fdiv is access function (A, B : C_float) return C_float
      with Convention => C;
   type rom_fsqrt is access function (V : C_float) return C_float
      with Convention => C;
   type rom_int2float is access function (V : int) return C_float
      with Convention => C;
   type rom_int642float is access function (V : long_long) return C_float
      with Convention => C;
   type rom_uint2float is access function (V : unsigned) return C_float
      with Convention => C;
   type rom_uint642float is access function (V : unsigned_long_long) return C_float
      with Convention => C;
   type rom_float2int is access function (V : C_float) return int
      with Convention => C;
   type rom_float2int64 is access function (V : C_float) return long_long
      with Convention => C;
   type rom_float2uint is access function (V : C_float) return unsigned
      with Convention => C;
   type rom_float2uint64 is access function (V : C_float) return unsigned_long_long
      with Convention => C;
   type rom_float2double is access function (V : C_float) return double
      with Convention => C;
   type rom_fsin is access function (V : C_float) return C_float
      with Convention => C;
   type rom_fcos is access function (V : C_float) return C_float
      with Convention => C;
   type rom_ftan is access function (V : C_float) return C_float
      with Convention => C;
   type rom_fexp is access function (V : C_float) return C_float
      with Convention => C;
   type rom_fln is access function (V : C_float) return C_float
      with Convention => C;

   --  Table 180
   --  Single-precision Floating Point Function Table
   type Soft_Float_Table_Fields is record
      fadd        : rom_fadd;
      fsub        : rom_fsub;
      fmul        : rom_fmul;
      fdiv        : rom_fdiv;
      fsqrt       : rom_fsqrt;
      float2int   : rom_float2int;
      float2fix   : System.Address;
      float2uint  : rom_float2uint;
      float2ufix  : System.Address;
      int2float   : rom_int2float;
      fix2float   : System.Address;
      uint2float  : rom_uint2float;
      ufix2float  : System.Address;
      fcos        : rom_fcos;
      fsin        : rom_fsin;
      ftan        : rom_ftan;
      fexp        : rom_fexp;
      fln         : rom_fln;

      --  if Header.Version >= 2
      fcmp           : System.Address;
      fatan2         : System.Address;
      int642float    : rom_int642float;
      fix642float    : System.Address;
      uint642float   : rom_uint642float;
      ufix642float   : System.Address;
      float2int64    : rom_float2int64;
      float2fix64    : System.Address;
      float2uint64   : rom_float2uint64;
      float2ufix64   : System.Address;
      float2double   : rom_float2double;

      --  if Header.Version >= 3
      fsincos        : System.Address;
   end record
     with Size => 16#80# * 8;

   for Soft_Float_Table_Fields use record
      fadd           at 16#00# range 0 .. 31;
      fsub           at 16#04# range 0 .. 31;
      fmul           at 16#08# range 0 .. 31;
      fdiv           at 16#0C# range 0 .. 31;
      fsqrt          at 16#18# range 0 .. 31;
      float2int      at 16#1C# range 0 .. 31;
      float2fix      at 16#20# range 0 .. 31;
      float2uint     at 16#24# range 0 .. 31;
      float2ufix     at 16#28# range 0 .. 31;
      int2float      at 16#2C# range 0 .. 31;
      fix2float      at 16#30# range 0 .. 31;
      uint2float     at 16#34# range 0 .. 31;
      ufix2float     at 16#38# range 0 .. 31;
      fcos           at 16#3C# range 0 .. 31;
      fsin           at 16#40# range 0 .. 31;
      ftan           at 16#44# range 0 .. 31;
      fsincos        at 16#48# range 0 .. 31;
      fexp           at 16#4C# range 0 .. 31;
      fln            at 16#50# range 0 .. 31;
      fcmp           at 16#54# range 0 .. 31;
      fatan2         at 16#58# range 0 .. 31;
      int642float    at 16#5C# range 0 .. 31;
      fix642float    at 16#60# range 0 .. 31;
      uint642float   at 16#64# range 0 .. 31;
      ufix642float   at 16#68# range 0 .. 31;
      float2int64    at 16#6C# range 0 .. 31;
      float2fix64    at 16#70# range 0 .. 31;
      float2uint64   at 16#74# range 0 .. 31;
      float2ufix64   at 16#78# range 0 .. 31;
      float2double   at 16#7C# range 0 .. 31;
   end record;

   Soft_Float_Table : access constant Soft_Float_Table_Fields;

   procedure Initialize is
      SFT : aliased constant Soft_Float_Table_Fields
         with Import, Address => ROM_Data_Lookup (ROM_Table_Code ('S', 'F'));
   begin
      Soft_Float_Table := SFT'Unchecked_Access;
   end Initialize;

   function fadd (A, B : Float) return Float is
      (Float (Soft_Float_Table.fadd (C_float (A), C_float (B))));
   function fsub (A, B : Float) return Float is
      (Float (Soft_Float_Table.fsub (C_float (A), C_float (B))));
   function frsub (A, B : Float) return Float is
      (Float (Soft_Float_Table.fsub (C_float (B), C_float (A))));
   function fmul (A, B : Float) return Float is
      (Float (Soft_Float_Table.fmul (C_float (A), C_float (B))));

   function fdiv (A, B : Float) return Float is
      State  : Atomic.Critical_Section.Interrupt_State;
      Result : C_float;
   begin
      Atomic.Critical_Section.Enter (State);
      Result := Soft_Float_Table.fdiv (C_float (A), C_float (B));
      Atomic.Critical_Section.Leave (State);
      return Float (Result);
   end fdiv;

   function int2float (V : int) return Float is
      (Float (Soft_Float_Table.int2float (V)));
   function int642float (V : long_long) return Float is
      (Float (Soft_Float_Table.int642float (V)));
   function uint2float (V : unsigned) return Float is
      (Float (Soft_Float_Table.uint2float (V)));
   function uint642float (V : unsigned_long_long) return Float is
      (Float (Soft_Float_Table.uint642float (V)));
   function float2int (V : Float) return int is
      (Soft_Float_Table.float2int (C_float (V)));
   function float2int64 (V : Float) return long_long is
      (Soft_Float_Table.float2int64 (C_float (V)));
   function float2uint (V : Float) return unsigned is
      (Soft_Float_Table.float2uint (C_float (V)));
   function float2uint64 (V : Float) return unsigned_long_long is
      (Soft_Float_Table.float2uint64 (C_float (V)));
   function float2double (V : Float) return double is
      (Soft_Float_Table.float2double (C_float (V)));
   function fsqrt (V : Float) return Float is
      (Float (Soft_Float_Table.fsqrt (C_float (V))));
   function fsin (V : Float) return Float is
      (Float (Soft_Float_Table.fsin (C_float (V))));
   function fcos (V : Float) return Float is
      (Float (Soft_Float_Table.fcos (C_float (V))));
   function ftan (V : Float) return Float is
      (Float (Soft_Float_Table.ftan (C_float (V))));
   function fexp (V : Float) return Float is
      (Float (Soft_Float_Table.fexp (C_float (V))));
   function fln (V : Float) return Float is
      (Float (Soft_Float_Table.fln (C_float (V))));
end RP.ROM.Floating_Point;
