--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with Interfaces.C; use Interfaces.C;
with Interfaces;   use Interfaces;

pragma Warnings (Off, """System.Bootrom"" is an internal GNAT unit");
with System.Bootrom;
with System;

package RP.ROM is

   --  2.8.3.1.1. Fast Bit Counting / Manipulation Functions
   function popcount32
      (Value : Unsigned_32)
       return Unsigned_32
   with Import,
        Convention => C,
        Address    => System.Bootrom.ROM_Func_Lookup
           (System.Bootrom.ROM_Table_Code ('P', '3'));

   function reverse32
      (Value : Unsigned_32)
       return Unsigned_32
   with Import,
        Convention => C,
        Address    => System.Bootrom.ROM_Func_Lookup
           (System.Bootrom.ROM_Table_Code ('R', '3'));

   function clz32
      (Value : Unsigned_32)
       return Unsigned_32
   with Import,
        Convention => C,
        Address    => System.Bootrom.ROM_Func_Lookup
           (System.Bootrom.ROM_Table_Code ('L', '3'));

   function ctz32
      (Value : Unsigned_32)
       return Unsigned_32
   with Import,
        Convention => C,
        Address    => System.Bootrom.ROM_Func_Lookup
           (System.Bootrom.ROM_Table_Code ('T', '3'));

   --  2.8.3.1.2. Fast Bulk Memory Fill / Copy Functions
   function memset
      (Ptr : System.Address;
       C   : Unsigned_8;
       N   : Unsigned_32)
       return System.Address
   with Import,
        Convention => C,
        Address    => System.Bootrom.ROM_Func_Lookup
           (System.Bootrom.ROM_Table_Code ('M', 'S'));

   function memset4
      (Ptr : System.Address;
       C   : Unsigned_8;
       N   : Unsigned_32)
       return System.Address
   with Import,
        Convention => C,
        Address    => System.Bootrom.ROM_Func_Lookup
           (System.Bootrom.ROM_Table_Code ('M', '4'));

   --  2.8.3.1.3. Flash Access Functions
   procedure connect_internal_flash
   with Import,
        Convention => C,
        Address    => System.Bootrom.ROM_Func_Lookup
           (System.Bootrom.ROM_Table_Code ('I', 'F'));

   procedure flash_exit_xip
   with Import,
        Convention => C,
        Address    => System.Bootrom.ROM_Func_Lookup
           (System.Bootrom.ROM_Table_Code ('E', 'X'));

   procedure flash_range_erase
      (Addr       : Unsigned_32;
       Count      : Interfaces.C.size_t;
       Block_Size : Unsigned_32;
       Block_Cmd  : Unsigned_8)
   with Import,
        Convention => C,
        Address    => System.Bootrom.ROM_Func_Lookup
           (System.Bootrom.ROM_Table_Code ('R', 'E'));

   procedure flash_range_program
      (Addr       : Unsigned_32;
       Data       : System.Address;
       Count      : Interfaces.C.size_t)
   with Import,
        Convention => C,
        Address    => System.Bootrom.ROM_Func_Lookup
           (System.Bootrom.ROM_Table_Code ('R', 'P'));

   procedure flash_flush_cache
   with Import,
        Convention => C,
        Address    => System.Bootrom.ROM_Func_Lookup
           (System.Bootrom.ROM_Table_Code ('F', 'C'));

   procedure flash_enter_cmd_xip
   with Import,
        Convention => C,
        Address    => System.Bootrom.ROM_Func_Lookup
           (System.Bootrom.ROM_Table_Code ('C', 'X'));

   --  2.8.3.1.4. Debugging Support Functions
   procedure debug_trampoline
   with Import,
        Convention => C,
        Address    => System.Bootrom.ROM_Func_Lookup
           (System.Bootrom.ROM_Table_Code ('D', 'T'));

   --  2.8.3.1.5. Miscellaneous Functions
   procedure reset_to_usb_boot
      (GPIO_Activity_Pin_Mask : Unsigned_32;
       Disable_Interface_Mask : Unsigned_32)
   with Import,
        Convention => C,
        Address    => System.Bootrom.ROM_Func_Lookup
           (System.Bootrom.ROM_Table_Code ('U', 'B'));

   procedure wait_for_vector
   with Import,
        Convention => C,
        Address    => System.Bootrom.ROM_Func_Lookup
           (System.Bootrom.ROM_Table_Code ('W', 'V'));

   --  2.8.3.3. Bootrom Data
   function copyright_string
      return String;

   function git_revision
      return Unsigned_32;

end RP.ROM;
