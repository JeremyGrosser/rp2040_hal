with System;

with HAL;
with Interfaces.C; use Interfaces.C;

package RP.Flash is

   FLASH_PAGE_SIZE       : constant := 256;
   FLASH_SECTOR_SIZE     : constant := 4096;
   FLASH_BLOCK_SIZE      : constant := 65536;

   XIP_BASE              : constant := 16#10000000#;

   --  At some point during the execution of the procedures of this package
   --  the flash memory will be turned off. Any code that access the flash
   --  will trigger a fault.
   --
   --  This is why the procedures are flagged No_Inline and their code located
   --  in RAM (using the linker section ".time_critical").
   --
   --  Any interrupt that may execute from flash must be masked. If a second
   --  core is running, make sure it only executes code in RAM or bootrom.

   procedure Flash_Range_Erase (Offset : HAL.UInt32;
                                Count  : size_t)
     with No_Inline, Linker_Section => ".time_critical",
     Pre => (Count mod FLASH_SECTOR_SIZE) = 0;
   --  Erase Count bytes of flash starting at Offset bytes from the beginning of
   --  flash. Count must be a multiple of sector size (4096).

   procedure Flash_Range_Program (Offset : HAL.UInt32;
                                  Src    : System.Address;
                                  Count  : size_t)
     with No_Inline, Linker_Section => ".time_critical",
     Pre => (Count mod FLASH_PAGE_SIZE) = 0;
   --  Programm Count bytes of flash starting at Offset bytes from the beginning
   --  of flash using the Src buffer. Count must be a multiple of page size
   --  (256).

private

   FLASH_BLOCK_ERASE_CMD : constant := 16#d8#;

end RP.Flash;
