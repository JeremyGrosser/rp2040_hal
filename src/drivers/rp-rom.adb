--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--

package body RP.ROM is
   --  2.8.3.1. Bootrom Functions
   function rom_hword_as_ptr
      (Address : System.Address)
      return System.Address
   is
      Pointer : UInt16;
      for Pointer'Address use Address;
   begin
      return System'To_Address (Pointer);
   end rom_hword_as_ptr;

   function rom_table_code
      (C1, C2 : Character)
      return UInt32
   is
   begin
      return Shift_Left (UInt32 (Character'Pos (C2)), 8) or UInt32 (Character'Pos (C1));
   end rom_table_code;

   function rom_func_lookup
      (Code : UInt32)
      return System.Address
   is
      func_table : constant System.Address :=
         rom_hword_as_ptr (System'To_Address (16#14#));
   begin
      return rom_table_lookup (func_table, Code);
   end rom_func_lookup;

   function rom_data_lookup
      (Code : UInt32)
      return System.Address
   is
      data_table : constant System.Address :=
         rom_hword_as_ptr (System'To_Address (16#16#));
   begin
      return rom_table_lookup (data_table, Code);
   end rom_data_lookup;
end RP.ROM;
