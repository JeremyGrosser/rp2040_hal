--
--  Copyright (C) 2022 Fabien Chouteau <fabien.chouteau@gmail.com>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with System.Storage_Elements; use System.Storage_Elements;
with System.Machine_Code; use System.Machine_Code;
with Atomic.Critical_Section;
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
     with No_Inline, Linker_Section => ".gnu.linkonce.d.time_critical";
   --  If not done already, copy the code from bootrom into a RAM buffer

   procedure Flash_Enable_XIP_Via_Boot2
     with No_Inline, Linker_Section => ".gnu.linkonce.d.time_critical";
   --  Execute the copy of bootrom procedure in RAM

   procedure Flash_CS_Force
      (High : Boolean)
     with No_Inline, Linker_Section => ".gnu.linkonce.d.time_critical";

   procedure Flash_Do_Cmd
      (Tx : UInt8_Array;
       Rx : out UInt8_Array)
     with No_Inline, Linker_Section => ".gnu.linkonce.d.time_critical";

   --  Chip select override, IO_QSPI.GPIO_QSPI_SS_CTRL
   type SS_CTRL_Register is record
      IRQOVER  : UInt2 := 0;
      INOVER   : UInt2 := 0;
      OEOVER   : UInt2 := 0;
      OUTOVER  : UInt2 := 0;
      FUNCSEL  : UInt5 := 16#1F#;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Object_Size => 32;
   for SS_CTRL_Register use record
      IRQOVER  at 0 range 28 .. 29;
      INOVER   at 0 range 16 .. 17;
      OEOVER   at 0 range 12 .. 13;
      OUTOVER  at 0 range 8 .. 9;
      FUNCSEL  at 0 range 0 .. 4;
   end record;

   OUTOVER_LOW  : constant UInt2 := 2;
   OUTOVER_HIGH : constant UInt2 := 3;

   SS_CTRL : SS_CTRL_Register
      with Import, Address => System'To_Address (16#4001_800C#);

   type SR_Register is record
      RFNE : Boolean := False;
      TFNF : Boolean := False;
   end record
      with Volatile_Full_Access,
           Async_Writers,
           Object_Size => 32;
   for SR_Register use record
      RFNE at 0 range 3 .. 3;
      TFNF at 0 range 1 .. 1;
   end record;

   type XIP_SSI_Peripheral is record
      SR  : SR_Register;
      DR0 : UInt32;
   end record
      with Volatile;
   for XIP_SSI_Peripheral use record
      SR  at 16#28# range 0 .. 31;
      DR0 at 16#60# range 0 .. 31;
   end record;

   XIP_SSI : XIP_SSI_Peripheral
      with Import, Address => System'To_Address (16#1800_0000#);

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

      RP.ROM.flash_range_program (Addr  => Interfaces.Unsigned_32 (Offset),
                                  Data  => Source,
                                  Count => Interfaces.C.size_t (Length));
      RP.ROM.flash_flush_cache;

      Flash_Enable_XIP_Via_Boot2;

      Atomic.Critical_Section.Leave (State);
   end Program;

   procedure Flash_CS_Force
      (High : Boolean)
   is
   begin
      SS_CTRL.OUTOVER := (if High then OUTOVER_HIGH else OUTOVER_LOW);
   end Flash_CS_Force;

   procedure Flash_Do_Cmd
      (Tx    : UInt8_Array;
       Rx    : out UInt8_Array)
   is
      State : Atomic.Critical_Section.Interrupt_State;
      Flags : SR_Register;

      Max_In_Flight : constant := 16 - 2;
      Tx_Remaining  : Natural := Tx'Length;
      Rx_Remaining  : Natural := Rx'Length;
      Tx_Index      : Integer := Tx'First;
      Rx_Index      : Integer := Rx'First;
   begin
      Flash_Init_Boot2_Copyout;

      --  No flash accesses after this point
      Atomic.Critical_Section.Enter (State);

      --  __compiler_memory_barrier();
      Asm ("", Clobber => "memory", Volatile => True);
      RP.ROM.connect_internal_flash;
      RP.ROM.flash_exit_xip;
      Flash_CS_Force (False);

      while Tx_Remaining > 0 or Rx_Remaining > 0 loop
         Flags := XIP_SSI.SR;
         if Flags.TFNF and Tx_Remaining > 0 and (Rx_Remaining - Tx_Remaining) < Max_In_Flight then
            XIP_SSI.DR0 := UInt32 (Tx (Tx_Index));
            Tx_Index := Tx_Index + 1;
            Tx_Remaining := Tx_Remaining - 1;
         end if;

         if Flags.RFNE and Rx_Remaining > 0 then
            Rx (Rx_Index) := UInt8 (XIP_SSI.DR0);
            Rx_Index := Rx_Index + 1;
            Rx_Remaining := Rx_Remaining - 1;
         end if;
      end loop;

      Flash_CS_Force (True);
      RP.ROM.flash_flush_cache;
      Flash_Enable_XIP_Via_Boot2;
      Atomic.Critical_Section.Leave (State);
   end Flash_Do_Cmd;

   function Unique_Id
      return UInt64
   is
      FLASH_RUID_CMD : constant := 16#4B#;
      Dummy_Length   : constant := 4;
      Data_Length    : constant := 8;
      Length         : constant := 1 + Dummy_Length + Data_Length;
      Tx, Rx         : UInt8_Array (1 .. Length);
      Id             : UInt64 := 0;
   begin
      Tx (1) := FLASH_RUID_CMD;
      Flash_Do_Cmd (Tx, Rx);
      for I in Rx'Last - 7 .. Rx'Last loop
         Id := Shift_Left (Id, 8) or UInt64 (Rx (I));
      end loop;
      return Id;
   end Unique_Id;

end RP.Flash;
