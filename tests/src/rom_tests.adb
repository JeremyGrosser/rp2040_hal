--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Assertions; use AUnit.Assertions;
with RP.ROM;
with Interfaces.C;
with Interfaces;

package body ROM_Tests is
   overriding
   procedure Set_Up
      (T : in out ROM_Test)
   is null;

   procedure Test_Data_Lookup
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use Interfaces;
   begin
      Assert (RP.ROM.copyright_string = "(C) 2020 Raspberry Pi Trading Ltd", "ROM copyright mismatch");
      Assert (RP.ROM.git_revision /= 0, "git_revision is zero");
   end Test_Data_Lookup;

   procedure Test_Floating_Point
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use Interfaces.C;
      use Interfaces;
      --  Don't try to optimize this, please.
      A : Float := 1.1 with Export, Volatile;
      B : Float := 2.0 with Export, Volatile;
      X : C_float := 31.337 with Export, Volatile;
   begin
      Assert ((A + B) = 3.1, "fadd");
      Assert ((A - B) = -0.9, "fsub");
      Assert ((A * B) = 2.2, "fmul");
      Assert ((A / B) = 0.55, "fdiv");

      A := 31.337;
      Assert (Integer (A) = 31, "float2int");
      Assert (Integer_64 (A) = 31, "float2int64");
      Assert (Unsigned_32 (A) = 31, "float2uint");
      Assert (Unsigned_64 (A) = 31, "float2uint64");
      Assert (double (A) = 31.336999893188477, "float2double");

      declare
         I32 : Integer     := 10 with Export, Volatile;
         I64 : Integer_64  := 11 with Export, Volatile;
         U32 : Unsigned_32 := 12 with Export, Volatile;
         U64 : Unsigned_64 := 13 with Export, Volatile;
      begin
         Assert (Float (I32) = 10.0, "int2float");
         Assert (Float (I64) = 11.0, "int642float");
         Assert (Float (U32) = 12.0, "uint2float");
         Assert (Float (U64) = 13.0, "uint642float");
      end;
   end Test_Floating_Point;

   overriding
   procedure Register_Tests
      (T : in out ROM_Test)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Data_Lookup'Access, "Data Lookup");
      Register_Routine (T, Test_Floating_Point'Access, "Floating Point");
   end Register_Tests;

   overriding
   function Name
      (T : ROM_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.ROM"));

end ROM_Tests;
