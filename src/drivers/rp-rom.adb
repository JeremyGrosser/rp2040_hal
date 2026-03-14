--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
package body RP.ROM is

   function copyright_string
      return String
   is
      --  The copyright string is max 33 characters long in all versions of the
      --  ROM.
      S : constant String (1 .. 34)
         with Import, Address => System.Bootrom.ROM_Data_Lookup (System.Bootrom.ROM_Table_Code ('C', 'R'));
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

   function git_revision
      return Unsigned_32
   is
      GR : constant Unsigned_32
         with Import, Address => System.Bootrom.ROM_Data_Lookup (System.Bootrom.ROM_Table_Code ('G', 'R'));
   begin
      return GR;
   end git_revision;

end RP.ROM;
