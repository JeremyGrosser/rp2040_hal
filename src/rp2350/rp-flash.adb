--
--  Copyright (C) 2022 Fabien Chouteau <fabien.chouteau@gmail.com>
--  Copyright (C) 2026 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with System.Storage_Elements; use System.Storage_Elements;
with System.Machine_Code; use System.Machine_Code;
with Atomic.Critical_Section;
with Interfaces.C;

package body RP.Flash is

   -------------
   -- Bootrom --
   -------------

   --  RP2350 datasheet 5.4.1: 16-bit pointer to rom_table_lookup_val()
   BOOTROM_TABLE_LOOKUP : constant := 16#0000_0016#;
   RT_FLAG_FUNC_ARM_SEC : constant := 16#0004#;

   type ROM_Functions is record
      Connect_Internal_Flash : System.Address := System.Null_Address;
      Flash_Exit_XIP         : System.Address := System.Null_Address;
      Flash_Range_Erase      : System.Address := System.Null_Address;
      Flash_Range_Program    : System.Address := System.Null_Address;
      Flash_Flush_Cache      : System.Address := System.Null_Address;
   end record;

   ROM : ROM_Functions;

   --  The XIP setup function (formerly boot2) is saved by the bootrom in the
   --  first 256 bytes of boot RAM. Boot RAM is never executable, so it is
   --  copied to SRAM and run from there to restore the XIP mode found at boot.
   BOOTRAM_BASE     : constant := 16#400E_0000#;
   XIP_Setup_Words  : constant := 64;
   XIP_Setup        : HAL.UInt32_Array (1 .. XIP_Setup_Words) := (others => 0);
   Initialized      : Boolean := False;

   function ROM_Func_Lookup
      (C1, C2 : Character)
      return System.Address;

   procedure Initialize;
   --  Look up bootrom functions and copy the XIP setup function. Must be
   --  called while XIP is still working.

   procedure Enter_Serial_Mode
     with Inline_Always;

   procedure Restore_XIP
     with Inline_Always;

   procedure Flash_Do_Cmd
      (Tx : UInt8_Array;
       Rx : out UInt8_Array)
     with No_Inline, Linker_Section => ".gnu.linkonce.d.time_critical";

   ---------
   -- QMI --
   ---------

   type DIRECT_CSR_Register is record
      RXDELAY     : UInt2 := 0;
      CLKDIV      : UInt8 := 6;
      RXLEVEL     : UInt3 := 0;
      RXFULL      : Boolean := False;
      RXEMPTY     : Boolean := False;
      TXLEVEL     : UInt3 := 0;
      TXEMPTY     : Boolean := False;
      TXFULL      : Boolean := False;
      AUTO_CS1N   : Boolean := False;
      AUTO_CS0N   : Boolean := False;
      ASSERT_CS1N : Boolean := False;
      ASSERT_CS0N : Boolean := False;
      BUSY        : Boolean := False;
      EN          : Boolean := False;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Async_Writers,
           Object_Size => 32;
   for DIRECT_CSR_Register use record
      RXDELAY     at 0 range 30 .. 31;
      CLKDIV      at 0 range 22 .. 29;
      RXLEVEL     at 0 range 18 .. 20;
      RXFULL      at 0 range 17 .. 17;
      RXEMPTY     at 0 range 16 .. 16;
      TXLEVEL     at 0 range 12 .. 14;
      TXEMPTY     at 0 range 11 .. 11;
      TXFULL      at 0 range 10 .. 10;
      AUTO_CS1N   at 0 range 7 .. 7;
      AUTO_CS0N   at 0 range 6 .. 6;
      ASSERT_CS1N at 0 range 3 .. 3;
      ASSERT_CS0N at 0 range 2 .. 2;
      BUSY        at 0 range 1 .. 1;
      EN          at 0 range 0 .. 0;
   end record;

   type QMI_Peripheral is record
      DIRECT_CSR : DIRECT_CSR_Register;
      DIRECT_TX  : UInt32;
      DIRECT_RX  : UInt32;
   end record
      with Volatile;
   for QMI_Peripheral use record
      DIRECT_CSR at 16#00# range 0 .. 31;
      DIRECT_TX  at 16#04# range 0 .. 31;
      DIRECT_RX  at 16#08# range 0 .. 31;
   end record;

   QMI : QMI_Peripheral
      with Import, Address => System'To_Address (16#400D_0000#);

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

   ---------------------
   -- ROM_Func_Lookup --
   ---------------------

   function ROM_Func_Lookup
      (C1, C2 : Character)
      return System.Address
   is
      use type System.Address;
      Lookup_Ptr : constant UInt16
         with Import, Address => System'To_Address (BOOTROM_TABLE_LOOKUP);

      --  The pointer in the bootrom already has the thumb bit set
      function Lookup
         (Code, Mask : UInt32)
         return System.Address
      with Import,
           Convention => C,
           Address    => To_Address (Integer_Address (Lookup_Ptr));

      Code   : constant UInt32 :=
         Shift_Left (UInt32 (Character'Pos (C2)), 8) or UInt32 (Character'Pos (C1));
      Result : constant System.Address := Lookup (Code, RT_FLAG_FUNC_ARM_SEC);
   begin
      if Result = System.Null_Address then
         raise Program_Error with "bootrom function not found";
      end if;
      return Result;
   end ROM_Func_Lookup;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize is
      Bootram : HAL.UInt32_Array (XIP_Setup'Range)
         with Import, Address => System'To_Address (BOOTRAM_BASE);
   begin
      if not Initialized then
         ROM :=
            (Connect_Internal_Flash => ROM_Func_Lookup ('I', 'F'),
             Flash_Exit_XIP         => ROM_Func_Lookup ('E', 'X'),
             Flash_Range_Erase      => ROM_Func_Lookup ('R', 'E'),
             Flash_Range_Program    => ROM_Func_Lookup ('R', 'P'),
             Flash_Flush_Cache      => ROM_Func_Lookup ('F', 'C'));
         XIP_Setup := Bootram;

         --  __compiler_memory_barrier();
         Asm ("", Clobber => "memory", Volatile => True);

         Initialized := True;
      end if;
   end Initialize;

   -----------------------
   -- Enter_Serial_Mode --
   -----------------------

   procedure Enter_Serial_Mode is
      procedure Connect_Internal_Flash
         with Import, Convention => C, Address => ROM.Connect_Internal_Flash;
      procedure Flash_Exit_XIP
         with Import, Convention => C, Address => ROM.Flash_Exit_XIP;
   begin
      --  __compiler_memory_barrier();
      Asm ("", Clobber => "memory", Volatile => True);
      Connect_Internal_Flash;
      Flash_Exit_XIP;
   end Enter_Serial_Mode;

   -----------------
   -- Restore_XIP --
   -----------------

   procedure Restore_XIP is
      procedure Flash_Flush_Cache
         with Import, Convention => C, Address => ROM.Flash_Flush_Cache;

      --  Addr + 1 for ARM thumb mode call
      procedure XIP_Setup_Call
         with Import,
              Convention => C,
              Address    => To_Address (To_Integer (XIP_Setup'Address) + 1);
   begin
      Flash_Flush_Cache;

      --  flash_exit_xip leaves a slow but working 03h XIP mode behind, so
      --  if the bootrom did not save a setup function there's nothing to do.
      if XIP_Setup (XIP_Setup'First) /= 0 then
         XIP_Setup_Call;
      end if;
   end Restore_XIP;

   -----------
   -- Erase --
   -----------

   procedure Erase
      (Offset : Flash_Offset;
       Length : Natural)
   is
      State : Atomic.Critical_Section.Interrupt_State;
   begin
      Initialize;

      declare
         --  Declared after Initialize, the address is read at elaboration
         procedure Flash_Range_Erase
            (Addr       : UInt32;
             Count      : Interfaces.C.size_t;
             Block_Size : UInt32;
             Block_Cmd  : UInt8)
         with Import, Convention => C, Address => ROM.Flash_Range_Erase;
      begin
         --  No flash accesses after this point
         Atomic.Critical_Section.Enter (State);
         Enter_Serial_Mode;

         Flash_Range_Erase
           (Addr       => UInt32 (Offset),
            Count      => Interfaces.C.size_t (Length),
            Block_Size => Block_Size,
            Block_Cmd  => Block_Erase_Command);

         Restore_XIP;
         Atomic.Critical_Section.Leave (State);
      end;
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
      Initialize;

      declare
         --  Declared after Initialize, the address is read at elaboration
         procedure Flash_Range_Program
            (Addr  : UInt32;
             Data  : System.Address;
             Count : Interfaces.C.size_t)
         with Import, Convention => C, Address => ROM.Flash_Range_Program;
      begin
         --  No flash accesses after this point
         Atomic.Critical_Section.Enter (State);
         Enter_Serial_Mode;

         Flash_Range_Program
           (Addr  => UInt32 (Offset),
            Data  => Source,
            Count => Interfaces.C.size_t (Length));

         Restore_XIP;
         Atomic.Critical_Section.Leave (State);
      end;
   end Program;

   ------------------
   -- Flash_Do_Cmd --
   ------------------

   procedure Flash_Do_Cmd
      (Tx    : UInt8_Array;
       Rx    : out UInt8_Array)
   is
      State        : Atomic.Critical_Section.Interrupt_State;
      Flags        : DIRECT_CSR_Register;
      Tx_Remaining : Natural := Tx'Length;
      Rx_Remaining : Natural := Rx'Length;
      Tx_Index     : Integer := Tx'First;
      Rx_Index     : Integer := Rx'First;
   begin
      Initialize;

      --  No flash accesses after this point
      Atomic.Critical_Section.Enter (State);
      Enter_Serial_Mode;

      QMI.DIRECT_CSR.EN := True;
      while QMI.DIRECT_CSR.BUSY loop
         null;
      end loop;
      QMI.DIRECT_CSR.ASSERT_CS0N := True;

      --  QMI stalls rather than overflowing DIRECT_RX, so there's no need to
      --  limit the number of bytes in flight.
      while Tx_Remaining > 0 or else Rx_Remaining > 0 loop
         Flags := QMI.DIRECT_CSR;
         if not Flags.TXFULL and then Tx_Remaining > 0 then
            QMI.DIRECT_TX := UInt32 (Tx (Tx_Index));
            Tx_Index := Tx_Index + 1;
            Tx_Remaining := Tx_Remaining - 1;
         end if;

         if not Flags.RXEMPTY and then Rx_Remaining > 0 then
            Rx (Rx_Index) := UInt8 (QMI.DIRECT_RX and 16#FF#);
            Rx_Index := Rx_Index + 1;
            Rx_Remaining := Rx_Remaining - 1;
         end if;
      end loop;

      while QMI.DIRECT_CSR.BUSY loop
         null;
      end loop;
      QMI.DIRECT_CSR.ASSERT_CS0N := False;
      QMI.DIRECT_CSR.EN := False;

      Restore_XIP;
      Atomic.Critical_Section.Leave (State);
   end Flash_Do_Cmd;

   function Unique_Id
      return UInt64
   is
      FLASH_RUID_CMD : constant := 16#4B#;
      Dummy_Length   : constant := 4;
      Data_Length    : constant := 8;
      Length         : constant := 1 + Dummy_Length + Data_Length;
      Tx             : UInt8_Array (1 .. Length) := (others => 0);
      Rx             : UInt8_Array (1 .. Length);
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
