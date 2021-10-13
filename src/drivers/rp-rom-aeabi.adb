with RP.ROM.Floating_Point;

package body RP.ROM.AEABI is
   function fadd (A, B : Float) return Float is
      (RP.ROM.Floating_Point.fadd (A, B));
   function fsub (A, B : Float) return Float is
      (RP.ROM.Floating_Point.fsub (A, B));
   function fmul (A, B : Float) return Float is
      (RP.ROM.Floating_Point.fmul (A, B));
   function fdiv (A, B : Float) return Float is
      (RP.ROM.Floating_Point.fdiv (A, B));
   function fsqrt (V : Float) return Float is
      (RP.ROM.Floating_Point.fsqrt (V));
   function float2int (V : Float) return Integer is
      (RP.ROM.Floating_Point.float2int (V));
   function float2uint (V : Float) return Unsigned_32 is
      (RP.ROM.Floating_Point.float2uint (V));
   function fcos (Angle : Float) return Float is
      (RP.ROM.Floating_Point.fcos (Angle));
   function fsin (Angle : Float) return Float is
      (RP.ROM.Floating_Point.fsin (Angle));
   function ftan (Angle : Float) return Float is
      (RP.ROM.Floating_Point.ftan (Angle));

   --  The following functions are only available in bootrom V2
   function int642float (V : Integer_64) return Float is
      (RP.ROM.Floating_Point.int642float (V));
   function uint642float (V : Unsigned_64) return Float is
      (RP.ROM.Floating_Point.uint642float (V));
   function int2float (V : Integer) return Float is
      (RP.ROM.Floating_Point.int2float (V));
   function float2int64 (V : Float) return Integer_64 is
      (RP.ROM.Floating_Point.float2int64 (V));
   function float2uint64 (V : Float) return Unsigned_64 is
      (RP.ROM.Floating_Point.float2uint64 (V));
   function float2double (V : Float) return Interfaces.C.double is
      (RP.ROM.Floating_Point.float2double (V));

end RP.ROM.AEABI;
