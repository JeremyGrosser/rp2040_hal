with System.Storage_Elements; use System.Storage_Elements;
with System.Machine_Code; use System.Machine_Code;

with RP.ROM;

package body RP.Flash is

   procedure Flash_Init_Boot2_Copyout
     with No_Inline, Linker_Section => ".time_critical";
   --  If not done already, copy the code from bootrom into a RAM buffer

   procedure Flash_Enable_XIP_Via_Boot2
     with No_Inline, Linker_Section => ".time_critical";
   --  Execute the copy of bootrom procedure in RAM

   BOOT_SIZE_WORDS     : constant := 64;
   Boot2_Copyout       : HAL.UInt32_Array (1 .. BOOT_SIZE_WORDS);
   Boot2_Copyout_Valid : Boolean := False;

   ------------------------------
   -- Flash_Init_Boot2_Copyout --
   ------------------------------

   procedure Flash_Init_Boot2_Copyout is
      Boot2  : HAL.UInt32_Array (1 .. BOOT_SIZE_WORDS)
        with Address => System'To_Address (XIP_BASE);
   begin
      if Boot2_Copyout_Valid then
         return;
      else
         Boot2_Copyout := Boot2;

         --  __compiler_memory_barrier();
         Asm ("", Clobber => "memory", Volatile => True);

         Boot2_Copyout_Valid := True;
      end if;
   end Flash_Init_Boot2_Copyout;

   --------------------------------
   -- Flash_Enable_XIP_Via_Boot2 --
   --------------------------------

   procedure Flash_Enable_XIP_Via_Boot2 is

      procedure Boot2_Call
        with Import,
             Convention => C,
             Address => To_Address (To_Integer (Boot2_Copyout'Address) + 1);

      --  Addr + 1 for ARM thumb mode call

   begin
      Boot2_Call;
   end Flash_Enable_XIP_Via_Boot2;

   -----------------------
   -- Flash_Range_Erase --
   -----------------------

   procedure Flash_Range_Erase (Offset : HAL.UInt32;
                                Count  : size_t)
   is
   begin

      Flash_Init_Boot2_Copyout;

      --  No flash accesses after this point

      --  __compiler_memory_barrier();
      Asm ("", Clobber => "memory", Volatile => True);

      RP.ROM.connect_internal_flash;

      RP.ROM.flash_exit_xip;

      RP.ROM.flash_range_erase
        (Addr       => To_Address (Integer_Address (Offset)),
         Count      => Count,
         Block_Size => FLASH_BLOCK_SIZE,
         Block_Cmd  => FLASH_BLOCK_ERASE_CMD);

      RP.ROM.flash_flush_cache;

      Flash_Enable_XIP_Via_Boot2;
   end Flash_Range_Erase;

   -------------------------
   -- Flash_Range_Program --
   -------------------------

   procedure Flash_Range_Program (Offset : HAL.UInt32;
                                  Src    : System.Address;
                                  Count  : size_t)
   is
   begin
      Flash_Init_Boot2_Copyout;

      --  No flash accesses after this point

      --  __compiler_memory_barrier();
      Asm ("", Clobber => "memory", Volatile => True);

      RP.ROM.connect_internal_flash;

      RP.ROM.flash_exit_xip;

      RP.ROM.flash_range_program (Addr  => To_Address (Integer_Address (Offset)),
                                  Data  => Src,
                                  Count => Count);
      RP.ROM.flash_flush_cache;

      Flash_Enable_XIP_Via_Boot2;
   end Flash_Range_Program;

end RP.Flash;
