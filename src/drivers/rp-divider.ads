with Ada.Unchecked_Conversion;
with HAL; use HAL;

package RP.Divider
   with Preelaborate
is
   subtype Int32 is Integer;

   --  Run-time ABI for the Arm® Architecture
   --  5.3.1 Integer (32/32 → 32) division functions
   --  https://github.com/ARM-software/abi-aa/blob/main/rtabi32/rtabi32.rst#531integer-3232--32-division-functions
   --
   --  "Separate modulo functions would have little value because modulo on its
   --  own is rare."
   --
   --  The ABI expects the return from idivmod and uidivmod to return values in
   --  both the r0 and r1 registers. We use C_Pass_By_Copy and hope the
   --  compiler does the right thing.
   type idiv_return is record
      Quotient, Remainder : Int32;
   end record
      with Convention => C_Pass_By_Copy;

   type uidiv_return is record
      Quotient, Remainder : UInt32;
   end record
      with Convention => C_Pass_By_Copy;

   function idiv (Numerator, Denominator : Int32) return Int32
      with Export, Convention => C, External_Name => "__aeabi_idiv";
   function idivmod (Numerator, Denominator : Int32) return idiv_return
      with Export, Convention => C, External_Name => "__aeabi_idivmod";
   function uidiv (Numerator, Denominator : UInt32) return UInt32
      with Export, Convention => C, External_Name => "__aeabi_uidiv";
   function uidivmod (Numerator, Denominator : UInt32) return uidiv_return
      with Export, Convention => C, External_Name => "__aeabi_uidivmod";

private

   --  The SVD defines the signed Numerator register aliases incorrectly as
   --  HAL.UInt32. The quotient and remainder registers are shared for both signed
   --  and unsigned conversion, so we would need two separate record types. Or
   --  just use unchecked conversion inside the signed functions.
   function To_UInt32 is new Ada.Unchecked_Conversion
      (Source => Int32, Target => UInt32);
   function To_Int32 is new Ada.Unchecked_Conversion
      (Source => UInt32, Target => Int32);

   function idiv0 return Int32
      with Import, Convention => C, External_Name => "__aeabi_idiv0";

end RP.Divider;
