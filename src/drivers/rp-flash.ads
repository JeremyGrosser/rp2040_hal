--
--  Copyright (C) 2022 Fabien Chouteau <fabien.chouteau@gmail.com>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with System;

package RP.Flash is

   Flash_Size  : constant := 16#0100_0000#;
   --  XIP maps up to 16 MB of flash. Actual flash chip may be smaller.
   Page_Size   : constant := 16#100#;
   Sector_Size : constant := 16#1000#;

   type Flash_Offset is range 0 .. Flash_Size;

   function To_Address
      (Offset : Flash_Offset)
      return System.Address;

   function In_Flash
      (Addr : System.Address)
      return Boolean;

   function To_Flash_Offset
      (Addr : System.Address)
      return Flash_Offset
   with Pre => In_Flash (Addr);

   --  At some point during the execution of the procedures of this package
   --  the flash memory will be turned off. Any code that access the flash
   --  will trigger a fault.
   --
   --  This is why the procedures are flagged No_Inline and their code located
   --  in RAM (using the linker section ".time_critical").
   --
   --  Any interrupt that may execute from flash must be masked. If a second
   --  core is running, make sure it only executes code in RAM or bootrom.

   procedure Erase
      (Offset     : Flash_Offset;
       Block_Size : Natural;
       Count      : Natural)
     with No_Inline, Linker_Section => ".time_critical",
          Pre => (Block_Size mod Sector_Size) = 0
                 and Offset + Flash_Offset (Count * Block_Size) <= Flash_Offset'Last;
   --  Erase (Block_Size * Count) bytes of flash starting at Offset bytes from
   --  the beginning of flash. Block_Size must be a multiple of 4096. Larger
   --  Block_Size will erase faster.

   procedure Program
      (Offset : Flash_Offset;
       Source : System.Address;
       Length : Natural)
     with No_Inline, Linker_Section => ".time_critical",
     Pre => (Length mod Page_Size) = 0
            and not In_Flash (Source)
            and Offset + Flash_Offset (Length) <= Flash_Offset'Last;
   --  Program Length bytes of flash starting at Offset bytes from the beginning
   --  of flash using the Src buffer. Count must be a multiple of 256.

private

   XIP_BASE             : constant := 16#10000000#;
   Block_Erase_Command  : constant := 16#d8#;

end RP.Flash;
