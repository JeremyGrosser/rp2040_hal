--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
package body RP.ROM is

   function ROM_Table_Code
      (C1, C2 : Character)
      return Table_Code
   is ((Table_Code (Character'Pos (C2)) * 256) or
       Table_Code (Character'Pos (C1)));

   function ROM_Table_Lookup
      (Table : System.Address;
       Code  : Table_Code)
       return System.Address
   is
      function Internal_Table_Lookup
        (Table : System.Address;
         Code  : Table_Code)
         return System.Address
      with Import,
           Convention => C,
           Address => System'To_Address (Header.Table_Lookup);
   begin
      return Internal_Table_Lookup (Table, Code);
   end ROM_Table_Lookup;

   function ROM_Func_Lookup
      (Code : Table_Code)
      return System.Address
   is (ROM_Table_Lookup (System'To_Address (Header.Func_Table), Code));

   function ROM_Data_Lookup
      (Code : Table_Code)
      return System.Address
   is (ROM_Table_Lookup (System'To_Address (Header.Data_Table), Code));

   function copyright_string
      return String
   is
      --  The copyright string is max 33 characters long in all versions of the
      --  ROM.
      S : constant String (1 .. 34)
         with Import, Address => ROM_Data_Lookup (ROM_Table_Code ('C', 'R'));
      I : Integer := S'First;
   begin
      while I <= S'Last loop
         if S (I) = ASCII.NUL then
            return S (S'First .. I - 1);
         end if;
         I := I + 1;
      end loop;
      return S;
   end copyright_string;

end RP.ROM;
