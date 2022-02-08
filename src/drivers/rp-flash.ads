--
--  Copyright (C) 2022 Fabien Chouteau <fabien.chouteau@gmail.com>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with System;

package RP.Flash is

   Flash_Size  : constant := 16 * 1024 * 1024;
   --  XIP maps up to 16 MB of flash. Actual flash chip may be smaller.
   Page_Size   : constant := 256;
   Sector_Size : constant := 4096;

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
       Length     : Natural;
       Block_Size : Natural := 65536)
     with No_Inline, Linker_Section => ".time_critical",
          Pre => (Length mod Sector_Size) = 0
                 and (Offset mod Sector_Size) = 0
                 and Offset + Flash_Offset (Length) <= Flash_Offset'Last;
   --  Block_Size must be a power of 2.
   --  Erase Length bytes of flash starting at Offset bytes from
   --  the beginning of flash. Length and Offset must be multiples of 4096.
   --
   --  Generally Block_Size > 4096. This accelerates Erase speed.
   --  To use sector-erase only, set Block_Size to some value larger than flash.
   --  To override the default 20h erase cmd, set Block_Size == 4096.
   --
   --  XXX: This is the behavior from the ROM, which is dumb. I will likely
   --       reimplement Erase without using the ROM functions soon.

   procedure Program
      (Offset : Flash_Offset;
       Source : System.Address;
       Length : Natural)
     with No_Inline, Linker_Section => ".time_critical",
     Pre => (Length mod Page_Size) = 0
            and (Offset mod Page_Size) = 0
            and Offset + Flash_Offset (Length) <= Flash_Offset'Last
            and not In_Flash (Source);
   --  Program Length bytes of flash starting at Offset bytes from the beginning
   --  of flash using the Source buffer. Length must be a multiple of 256.

private

   XIP_BASE             : constant := 16#10000000#;
   Block_Erase_Command  : constant := 16#d8#;

end RP.Flash;
