--
--  Copyright (C) 2022 Fabien Chouteau <fabien.chouteau@gmail.com>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with System.Storage_Elements; use System.Storage_Elements;
with System.Machine_Code; use System.Machine_Code;
with Atomic.Critical_Section;
with RP2040_SVD.XIP_SSI;
with Interfaces.C;
with RP.ROM;

package body RP.Flash is

   function In_Flash
      (Addr : System.Address)
      return Boolean
   is
   begin
      return To_Integer (Addr) in XIP_BASE .. (XIP_BASE + Flash_Size);
   end In_Flash;

   function To_Flash_Offset
      (Addr : System.Address)
      return Flash_Offset
   is (Flash_Offset (To_Integer (Addr) - XIP_BASE));

   function To_Address
      (Offset : Flash_Offset)
      return System.Address
   is (To_Address (Integer_Address (Offset) + XIP_BASE));

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
      Boot2  : HAL.UInt32_Array (Boot2_Copyout'Range)
        with Address => System'To_Address (XIP_BASE);
   begin
      if not Boot2_Copyout_Valid then
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

   -----------
   -- Erase --
   -----------

   procedure Erase
      (Offset : Flash_Offset;
       Length : Natural)
   is
      State : Atomic.Critical_Section.Interrupt_State;
   begin

      Flash_Init_Boot2_Copyout;

      --  No flash accesses after this point
      Atomic.Critical_Section.Enter (State);

      --  __compiler_memory_barrier();
      Asm ("", Clobber => "memory", Volatile => True);

      RP.ROM.connect_internal_flash;

      RP.ROM.flash_exit_xip;

      RP.ROM.flash_range_erase
        (Addr       => Interfaces.Unsigned_32 (Offset),
         Count      => Interfaces.C.size_t (Length),
         Block_Size => Interfaces.Unsigned_32 (Block_Size),
         Block_Cmd  => Block_Erase_Command);

      RP.ROM.flash_flush_cache;

      Flash_Enable_XIP_Via_Boot2;

      Atomic.Critical_Section.Leave (State);
   end Erase;

   -------------
   -- Program --
   -------------

   procedure Program
      (Offset : Flash_Offset;
       Source : System.Address;
       Length : Natural)
   is
      State : Atomic.Critical_Section.Interrupt_State;
   begin
      Flash_Init_Boot2_Copyout;

      --  No flash accesses after this point
      Atomic.Critical_Section.Enter (State);

      --  __compiler_memory_barrier();
      Asm ("", Clobber => "memory", Volatile => True);

      RP.ROM.connect_internal_flash;

      RP.ROM.flash_exit_xip;

      RP.ROM.flash_range_program (Addr  => To_Address (Offset),
                                  Data  => Source,
                                  Count => Interfaces.C.size_t (Length));
      RP.ROM.flash_flush_cache;

      Flash_Enable_XIP_Via_Boot2;

      Atomic.Critical_Section.Leave (State);
   end Program;

   procedure Transfer
      (Data : in out UInt32)
   is
      use RP2040_SVD.XIP_SSI;
   begin
      XIP_SSI_Periph.DR0 := Data;
      while XIP_SSI_Periph.TXFLR.TFTFL > 0 or XIP_SSI_Periph.RXFLR.RXTFL = 0 loop
         null;
      end loop;
      Data := XIP_SSI_Periph.DR0;
   end Transfer;

   function Unique_Id
      return UInt64
   is
      State : Atomic.Critical_Section.Interrupt_State;
      Id : UInt64 := 0;
      Data : UInt32;
   begin
      Atomic.Critical_Section.Enter (State);

      --  __compiler_memory_barrier();
      Asm ("", Clobber => "memory", Volatile => True);
      RP.ROM.connect_internal_flash;
      RP.ROM.flash_exit_xip;

      Data := 16#4B00_0000#;
      Transfer (Data);
      for I in 0 .. 1 loop
         Data := 0;
         Transfer (Data);
         Id := Id or Shift_Left (UInt64 (Data), I * 32);
      end loop;

      Flash_Enable_XIP_Via_Boot2;
      Atomic.Critical_Section.Leave (State);

      return Id;
   end Unique_Id;

end RP.Flash;
