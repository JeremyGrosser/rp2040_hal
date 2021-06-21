--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
pragma Style_Checks (Off);
with Interfaces; use Interfaces;

package RP.ROM.Floating_Point is

   type Soft_Float_Table_Fields is record
      fadd         : System.Address;
      fsub         : System.Address;
      fmul         : System.Address;
      fdiv         : System.Address;
      deprecated_1 : System.Address;
      deprecated_2 : System.Address;
      fsqrt        : System.Address;
      float2int    : System.Address;
      float2fix    : System.Address;
      float2uint   : System.Address;
      float2ufix   : System.Address;
      int2float    : System.Address;
      fix2float    : System.Address;
      uint2float   : System.Address;
      ufix2float   : System.Address;
      fcos         : System.Address;
      fsin         : System.Address;
      ftan         : System.Address;
      deprecated_3 : System.Address;
      fexp         : System.Address;
      fln          : System.Address;

      --  V2 bootrom only
      fcmp         : System.Address;
      fatan2       : System.Address;
      int642float  : System.Address;
      fix642float  : System.Address;
      uint642float : System.Address;
      ufix642float : System.Address;
      float2int64  : System.Address;
      float2fix64  : System.Address;
      float2uint64 : System.Address;
      float2ufix64 : System.Address;
      float2double : System.Address;
   end record
      with Size => 16#80# * 8;

   --  2.8.3.2. Fast Floating Point Library
   fplib_start : System.Address
   with Import     => True,
        Convention => C,
        Address    => rom_data_lookup (rom_table_code ('F', 'S'));

   Soft_Float_Table : constant Soft_Float_Table_Fields
   with Import     => True,
        Address    => rom_data_lookup (rom_table_code ('S', 'F'));

   function fadd (A, B : Float)
      return Float
   with Import => True,
        Convention => C,
        Address => Soft_Float_Table.fadd;

   function fsub (A, B : Float)
      return Float
   with Import => True,
        Convention => C,
        Address => Soft_Float_Table.fsub;

   function fmul (A, B : Float)
      return Float
   with Import => True,
        Convention => C,
        Address => Soft_Float_Table.fmul;

   function fdiv (A, B : Float)
      return Float
   with Import => True,
        Convention => C,
        Address => Soft_Float_Table.fdiv;

   function fsqrt (V : Float)
      return Float
   with Import => True,
        Convention => C,
        Address => Soft_Float_Table.fsqrt;

   function float2int (V : Float)
      return Integer
   with Import => True,
        Convention => C,
        Address => Soft_Float_Table.float2int;

   function float2fix
      (V : Float;
       N : Integer)
      return Integer
   with Import => True,
        Convention => C,
        Address => Soft_Float_Table.float2fix;

   function float2uint
      (V : Float)
      return Unsigned_32
   with Import => True,
        Convention => C,
        Address => Soft_Float_Table.float2uint;

   function float2ufix
      (V : Float;
       N : Integer)
       return Unsigned_32
   with Import => True,
        Convention => C,
        Address => Soft_Float_Table.float2ufix;

   function int2float
      (V : Integer)
      return Float
   with Import => True,
        Convention => C,
        Address => Soft_Float_Table.int2float;

   function fix2float
      (V : Integer_32;
       N : Integer)
       return Float
   with Import => True,
        Convention => C,
        Address => Soft_Float_Table.fix2float;

   function uint2float
      (V : Unsigned_32)
      return Float
   with Import => True,
        Convention => C,
        Address => Soft_Float_Table.uint2float;

   function ufix2float
      (V : Unsigned_32;
       N : Integer)
      return Float
   with Import => True,
        Convention => C,
        Address => Soft_Float_Table.ufix2float;

   function fcos
      (Angle : Float)
      return Float
   with Import => True,
        Convention => C,
        Address => Soft_Float_Table.fcos;

   function fsin
      (Angle : Float)
      return Float
   with Import => True,
        Convention => C,
        Address => Soft_Float_Table.fsin;

   function ftan
      (Angle : Float)
      return Float
   with Import => True,
        Convention => C,
        Address => Soft_Float_Table.ftan;

   function fexp
      (Angle : Float)
      return Float
   with Import => True,
        Convention => C,
        Address => Soft_Float_Table.fexp;

   function fln
      (Angle : Float)
      return Float
   with Import => True,
        Convention => C,
        Address => Soft_Float_Table.fln;

   --  The following functions are only available in bootrom V2

   function fcmp
      (A, B : Float)
      return Integer
   with Import => True,
        Convention => C,
        Address => Soft_Float_Table.fcmp;

   function fatan2
      (Y, X : Float)
      return Integer
   with Import => True,
        Convention => C,
        Address => Soft_Float_Table.fatan2;

   function int642float
      (V : Integer_64)
      return Float
   with Import => True,
        Convention => C,
        Address => Soft_Float_Table.int642float;

   function fix642float
      (V : Integer_64;
       N : Integer)
      return Float
   with Import => True,
        Convention => C,
        Address => Soft_Float_Table.fix642float;

   function uint642float
      (V : Unsigned_64)
      return Float
   with Import => True,
        Convention => C,
        Address => Soft_Float_Table.uint642float;

   function float2int64
      (V : Float)
      return Integer_64
   with Import => True,
        Convention => C,
        Address => Soft_Float_Table.float2int64;

   function float2fix64
      (V : Float)
      return Integer_64
   with Import => True,
        Convention => C,
        Address => Soft_Float_Table.float2fix64;

   function float2uint64
      (V : Float)
      return Unsigned_64
   with Import => True,
        Convention => C,
        Address => Soft_Float_Table.float2uint64;

   function float2ufix64
      (V : Float)
      return Unsigned_64
   with Import => True,
        Convention => C,
        Address => Soft_Float_Table.float2ufix64;

   function float2double
      (V : Float)
      return Interfaces.C.double
   with Import => True,
        Convention => C,
        Address => Soft_Float_Table.float2double;

end RP.ROM.Floating_Point;
