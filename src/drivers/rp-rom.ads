--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--

with RP2040_SVD; use RP2040_SVD;
with HAL;        use HAL;
with Interfaces.C;
with System;

package RP.ROM is
   rom_id : constant array (0 .. 2) of UInt8
   with Import     => True,
        Address    => System'To_Address (16#00000010#);

   --  2.8.3.1. Bootrom Functions
   function rom_hword_as_ptr
      (Address : System.Address)
      return System.Address;

   function rom_table_lookup
      (Table : System.Address;
       Code  : UInt32)
       return System.Address
   with Import     => True,
        Convention => C,
        Address    => rom_hword_as_ptr (System'To_Address (16#00000018#));

   function rom_table_code
      (C1, C2 : Character)
      return UInt32;

   --  called from crt0.S
   function rom_func_lookup
      (Code : UInt32)
      return System.Address
   with Export        => True,
        Convention    => C,
        External_Name => "rom_func_lookup";

   function rom_data_lookup
      (Code : UInt32)
      return System.Address;

   --  2.8.3.1.1. Fast Bit Counting / Manipulation Functions
   function popcount32
      (Value : UInt32)
       return UInt32
   with Import     => True,
        Convention => C,
        Address    => rom_func_lookup (rom_table_code ('P', '3'));

   function reverse32
      (Value : UInt32)
       return UInt32
   with Import     => True,
        Convention => C,
        Address    => rom_func_lookup (rom_table_code ('R', '3'));

   function clz32
      (Value : UInt32)
       return UInt32
   with Import     => True,
        Convention => C,
        Address    => rom_func_lookup (rom_table_code ('L', '3'));

   function ctz32
      (Value : UInt32)
       return UInt32
   with Import     => True,
        Convention => C,
        Address    => rom_func_lookup (rom_table_code ('T', '3'));

   --  2.8.3.1.2. Fast Bulk Memory Fill / Copy Functions
   function memset
      (Ptr : System.Address;
       C   : UInt8;
       N   : UInt32)
       return System.Address
   with Import     => True,
        Convention => C,
        Address    => rom_func_lookup (rom_table_code ('M', 'S'));

   function memset4
      (Ptr : System.Address;
       C   : UInt8;
       N   : UInt32)
       return System.Address
   with Import     => True,
        Convention => C,
        Address    => rom_func_lookup (rom_table_code ('M', '4'));

   --  2.8.3.1.3. Flash Access Functions
   procedure connect_internal_flash
   with Import     => True,
        Convention => C,
        Address    => rom_func_lookup (rom_table_code ('I', 'F'));

   procedure flash_exit_xip
   with Import     => True,
        Convention => C,
        Address    => rom_func_lookup (rom_table_code ('E', 'X'));

   procedure flash_range_erase
      (Addr       : System.Address;
       Count      : Interfaces.C.size_t;
       Block_Size : UInt32;
       Block_Cmd  : UInt8)
   with Import     => True,
        Convention => C,
        Address    => rom_func_lookup (rom_table_code ('R', 'E'));

   procedure flash_range_program
      (Addr       : System.Address;
       Data       : System.Address;
       Count      : Interfaces.C.size_t)
   with Import     => True,
        Convention => C,
        Address    => rom_func_lookup (rom_table_code ('R', 'P'));

   procedure flash_flush_cache
   with Import     => True,
        Convention => C,
        Address    => rom_func_lookup (rom_table_code ('F', 'C'));

   procedure flash_enter_cmd_xip
   with Import     => True,
        Convention => C,
        Address    => rom_func_lookup (rom_table_code ('C', 'X'));

   --  2.8.3.1.4. Debugging Support Functions
   procedure debug_trampoline
   with Import     => True,
        Convention => C,
        Address    => rom_func_lookup (rom_table_code ('D', 'T'));

   --  2.8.3.1.5. Miscellaneous Functions
   procedure reset_to_usb_boot
      (GPIO_Activity_Pin_Mask : UInt32;
       Disable_Interface_Mask : UInt32)
   with Import     => True,
        Convention => C,
        Address    => rom_func_lookup (rom_table_code ('U', 'B'));

   procedure wait_for_vector
   with Import     => True,
        Convention => C,
        Address    => rom_func_lookup (rom_table_code ('W', 'V'));

   --  2.8.3.2. Fast Floating Point Library
   --  TODO

   --  2.8.3.3. Bootrom Data
   --  TODO these read as null strings?
   copyright_string : access Interfaces.C.char_array
   with Import     => True,
        Address    => rom_data_lookup (rom_table_code ('C', 'R'));

   git_revision : access Interfaces.C.char_array
   with Import     => True,
        Address    => rom_data_lookup (rom_table_code ('G', 'R'));

   fplib_start : System.Address
   with Import     => True,
        Address    => rom_data_lookup (rom_table_code ('F', 'S'));
end RP.ROM;
