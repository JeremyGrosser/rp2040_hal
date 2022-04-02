--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with Interfaces.C; use Interfaces.C;
with Interfaces;   use Interfaces;
with System;

package RP.ROM is

   type Short_Address is new Unsigned_16;
   --  Some lookup tables use halfwords

   type Magic_Field is array (1 .. 3) of Unsigned_8;
   --  Magic should always be ('M', 'u', 1)

   type Table_Code is new Unsigned_32;
   --  Function and Data table entries are indexed by a two-character mnemonic,
   --  stored in a 32-bit field.  The top two bytes are always zero, presumably
   --  reserved for future use.

   type Header_Fields is record
      Initial_SP        : System.Address;
      Reset_Handler     : System.Address;
      NMI_Handler       : System.Address;
      HardFault_Handler : System.Address;
      Magic             : Magic_Field;
      Version           : Unsigned_8;
      Func_Table        : Short_Address;
      Data_Table        : Short_Address;
      Table_Lookup      : Short_Address;
   end record
      with Size => 208;

   Header : constant Header_Fields
      with Import, Address => System'To_Address (16#0000_0000#);

   function ROM_Table_Code
      (C1, C2 : Character)
      return Table_Code;

   function ROM_Table_Lookup
      (Table : System.Address;
       Code  : Table_Code)
       return System.Address;

   function ROM_Func_Lookup
      (Code : Table_Code)
      return System.Address
   with Export,
        Convention    => C,
        External_Name => "rom_func_lookup";
   pragma Weak_External (ROM_Func_Lookup);

   function ROM_Data_Lookup
      (Code : Table_Code)
      return System.Address;

   --  2.8.3.1.1. Fast Bit Counting / Manipulation Functions
   function popcount32
      (Value : Unsigned_32)
       return Unsigned_32
   with Import,
        Convention => C,
        Address    => ROM_Func_Lookup (ROM_Table_Code ('P', '3'));

   function reverse32
      (Value : Unsigned_32)
       return Unsigned_32
   with Import,
        Convention => C,
        Address    => ROM_Func_Lookup (ROM_Table_Code ('R', '3'));

   function clz32
      (Value : Unsigned_32)
       return Unsigned_32
   with Import,
        Convention => C,
        Address    => ROM_Func_Lookup (ROM_Table_Code ('L', '3'));

   function ctz32
      (Value : Unsigned_32)
       return Unsigned_32
   with Import,
        Convention => C,
        Address    => ROM_Func_Lookup (ROM_Table_Code ('T', '3'));

   --  2.8.3.1.2. Fast Bulk Memory Fill / Copy Functions
   function memset
      (Ptr : System.Address;
       C   : Unsigned_8;
       N   : Unsigned_32)
       return System.Address
   with Import,
        Convention => C,
        Address    => ROM_Func_Lookup (ROM_Table_Code ('M', 'S'));

   function memset4
      (Ptr : System.Address;
       C   : Unsigned_8;
       N   : Unsigned_32)
       return System.Address
   with Import,
        Convention => C,
        Address    => ROM_Func_Lookup (ROM_Table_Code ('M', '4'));

   --  2.8.3.1.3. Flash Access Functions
   procedure connect_internal_flash
   with Import,
        Convention => C,
        Address    => ROM_Func_Lookup (ROM_Table_Code ('I', 'F'));

   procedure flash_exit_xip
   with Import,
        Convention => C,
        Address    => ROM_Func_Lookup (ROM_Table_Code ('E', 'X'));

   procedure flash_range_erase
      (Addr       : Unsigned_32;
       Count      : Interfaces.C.size_t;
       Block_Size : Unsigned_32;
       Block_Cmd  : Unsigned_8)
   with Import,
        Convention => C,
        Address    => ROM_Func_Lookup (ROM_Table_Code ('R', 'E'));

   procedure flash_range_program
      (Addr       : System.Address;
       Data       : System.Address;
       Count      : Interfaces.C.size_t)
   with Import,
        Convention => C,
        Address    => ROM_Func_Lookup (ROM_Table_Code ('R', 'P'));

   procedure flash_flush_cache
   with Import,
        Convention => C,
        Address    => ROM_Func_Lookup (ROM_Table_Code ('F', 'C'));

   procedure flash_enter_cmd_xip
   with Import,
        Convention => C,
        Address    => ROM_Func_Lookup (ROM_Table_Code ('C', 'X'));

   --  2.8.3.1.4. Debugging Support Functions
   procedure debug_trampoline
   with Import,
        Convention => C,
        Address    => ROM_Func_Lookup (ROM_Table_Code ('D', 'T'));

   --  2.8.3.1.5. Miscellaneous Functions
   procedure reset_to_usb_boot
      (GPIO_Activity_Pin_Mask : Unsigned_32;
       Disable_Interface_Mask : Unsigned_32)
   with Import,
        Convention => C,
        Address    => ROM_Func_Lookup (ROM_Table_Code ('U', 'B'));

   procedure wait_for_vector
   with Import,
        Convention => C,
        Address    => ROM_Func_Lookup (ROM_Table_Code ('W', 'V'));

   --  2.8.3.3. Bootrom Data
   function copyright_string
      return String;

   function git_revision
      return Unsigned_32;

end RP.ROM;
