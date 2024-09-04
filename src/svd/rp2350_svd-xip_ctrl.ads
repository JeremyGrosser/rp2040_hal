pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

--  QSPI flash execute-in-place block
package RP2350_SVD.XIP_CTRL is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  CTRL_WRITABLE_M array
   type CTRL_WRITABLE_M_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for CTRL_WRITABLE_M
   type CTRL_WRITABLE_M_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  WRITABLE_M as a value
            Val : HAL.UInt2;
         when True =>
            --  WRITABLE_M as an array
            Arr : CTRL_WRITABLE_M_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for CTRL_WRITABLE_M_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Cache control register. Read-only from a Non-secure context.
   type CTRL_Register is record
      --  When 1, enable the cache for Secure accesses. When enabled, Secure
      --  XIP accesses to the cached (addr[26] == 0) window will query the
      --  cache, and QSPI accesses are performed only if the requested data is
      --  not present. When disabled, Secure access ignore the cache contents,
      --  and always access the QSPI interface. Accesses to the uncached
      --  (addr[26] == 1) window will never query the cache, irrespective of
      --  this bit. There is no cache-as-SRAM address window. Cache lines are
      --  allocated for SRAM-like use by individually pinning them, and keeping
      --  the cache enabled.
      EN_SECURE              : Boolean := True;
      --  When 1, enable the cache for Non-secure accesses. When enabled,
      --  Non-secure XIP accesses to the cached (addr[26] == 0) window will
      --  query the cache, and QSPI accesses are performed only if the
      --  requested data is not present. When disabled, Secure access ignore
      --  the cache contents, and always access the QSPI interface. Accesses to
      --  the uncached (addr[26] == 1) window will never query the cache,
      --  irrespective of this bit.
      EN_NONSECURE           : Boolean := True;
      --  unspecified
      Reserved_2_2           : HAL.Bit := 16#0#;
      --  When 1, the cache memories are powered down. They retain state, but
      --  can not be accessed. This reduces static power dissipation. Writing 1
      --  to this bit forces CTRL_EN_SECURE and CTRL_EN_NONSECURE to 0, i.e.
      --  the cache cannot be enabled when powered down.
      POWER_DOWN             : Boolean := False;
      --  When 1, Secure accesses to the uncached window (addr[27:26] == 1)
      --  will generate a bus error. This may reduce the number of SAU/MPU/PMP
      --  regions required to protect flash contents. Note this does not
      --  disable access to the uncached, untranslated window -- see
      --  NO_UNTRANSLATED_SEC.
      NO_UNCACHED_SEC        : Boolean := False;
      --  When 1, Non-secure accesses to the uncached window (addr[27:26] == 1)
      --  will generate a bus error. This may reduce the number of SAU/MPU/PMP
      --  regions required to protect flash contents. Note this does not
      --  disable access to the uncached, untranslated window -- see
      --  NO_UNTRANSLATED_SEC.
      NO_UNCACHED_NONSEC     : Boolean := False;
      --  When 1, Secure accesses to the uncached, untranslated window
      --  (addr[27:26] == 3) will generate a bus error.
      NO_UNTRANSLATED_SEC    : Boolean := False;
      --  When 1, Non-secure accesses to the uncached, untranslated window
      --  (addr[27:26] == 3) will generate a bus error.
      NO_UNTRANSLATED_NONSEC : Boolean := True;
      --  When 0, Non-secure accesses to the cache maintenance address window
      --  (addr[27] == 1, addr[26] == 0) will generate a bus error. When 1,
      --  Non-secure accesses can perform cache maintenance operations by
      --  writing to the cache maintenance address window. Cache maintenance
      --  operations may be used to corrupt Secure data by invalidating cache
      --  lines inappropriately, or map Secure content into a Non-secure region
      --  by pinning cache lines. Therefore this bit should generally be set to
      --  0, unless Secure code is not using the cache. Care should also be
      --  taken to clear the cache data memory and tag memory before granting
      --  maintenance operations to Non-secure code.
      MAINT_NONSEC           : Boolean := False;
      --  When 1, route all cached+Secure accesses to way 0 of the cache, and
      --  route all cached+Non-secure accesses to way 1 of the cache. This
      --  partitions the cache into two half-sized direct-mapped regions, such
      --  that Non-secure code can not observe cache line state changes caused
      --  by Secure execution. A full cache flush is required when changing the
      --  value of SPLIT_WAYS. The flush should be performed whilst SPLIT_WAYS
      --  is 0, so that both cache ways are accessible for invalidation.
      SPLIT_WAYS             : Boolean := False;
      --  If 1, enable writes to XIP memory window 0 (addresses 0x10000000
      --  through 0x10ffffff, and their uncached mirrors). If 0, this region is
      --  read-only. XIP memory is *read-only by default*. This bit must be set
      --  to enable writes if a RAM device is attached on QSPI chip select 0.
      --  The default read-only behaviour avoids two issues with writing to a
      --  read-only QSPI device (e.g. flash). First, a write will initially
      --  appear to succeed due to caching, but the data will eventually be
      --  lost when the written line is evicted, causing unpredictable
      --  behaviour. Second, when a written line is evicted, it will cause a
      --  write command to be issued to the flash, which can break the flash
      --  out of its continuous read mode. After this point, flash reads will
      --  return garbage. This is a security concern, as it allows Non-secure
      --  software to break Secure flash reads if it has permission to write to
      --  any flash address. Note the read-only behaviour is implemented by
      --  downgrading writes to reads, so writes will still cause allocation of
      --  an address, but have no other effect.
      WRITABLE_M             : CTRL_WRITABLE_M_Field :=
                                (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_12_31         : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CTRL_Register use record
      EN_SECURE              at 0 range 0 .. 0;
      EN_NONSECURE           at 0 range 1 .. 1;
      Reserved_2_2           at 0 range 2 .. 2;
      POWER_DOWN             at 0 range 3 .. 3;
      NO_UNCACHED_SEC        at 0 range 4 .. 4;
      NO_UNCACHED_NONSEC     at 0 range 5 .. 5;
      NO_UNTRANSLATED_SEC    at 0 range 6 .. 6;
      NO_UNTRANSLATED_NONSEC at 0 range 7 .. 7;
      MAINT_NONSEC           at 0 range 8 .. 8;
      SPLIT_WAYS             at 0 range 9 .. 9;
      WRITABLE_M             at 0 range 10 .. 11;
      Reserved_12_31         at 0 range 12 .. 31;
   end record;

   type STAT_Register is record
      --  unspecified
      Reserved_0_0  : HAL.Bit;
      --  Read-only. When 1, indicates the XIP streaming FIFO is completely
      --  empty.
      FIFO_EMPTY    : Boolean;
      --  Read-only. When 1, indicates the XIP streaming FIFO is completely
      --  full. The streaming FIFO is 2 entries deep, so the full and empty
      --  flag allow its level to be ascertained.
      FIFO_FULL     : Boolean;
      --  unspecified
      Reserved_3_31 : HAL.UInt29;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for STAT_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      FIFO_EMPTY    at 0 range 1 .. 1;
      FIFO_FULL     at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype STREAM_ADDR_STREAM_ADDR_Field is HAL.UInt30;

   --  FIFO stream address
   type STREAM_ADDR_Register is record
      --  unspecified
      Reserved_0_1 : HAL.UInt2 := 16#0#;
      --  The address of the next word to be streamed from flash to the
      --  streaming FIFO. Increments automatically after each flash access.
      --  Write the initial access address here before starting a streaming
      --  read.
      STREAM_ADDR  : STREAM_ADDR_STREAM_ADDR_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for STREAM_ADDR_Register use record
      Reserved_0_1 at 0 range 0 .. 1;
      STREAM_ADDR  at 0 range 2 .. 31;
   end record;

   subtype STREAM_CTR_STREAM_CTR_Field is HAL.UInt22;

   --  FIFO stream control
   type STREAM_CTR_Register is record
      --  Write a nonzero value to start a streaming read. This will then
      --  progress in the background, using flash idle cycles to transfer a
      --  linear data block from flash to the streaming FIFO. Decrements
      --  automatically (1 at a time) as the stream progresses, and halts on
      --  reaching 0. Write 0 to halt an in-progress stream, and discard any
      --  in-flight read, so that a new stream can immediately be started
      --  (after draining the FIFO and reinitialising STREAM_ADDR)
      STREAM_CTR     : STREAM_CTR_STREAM_CTR_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for STREAM_CTR_Register use record
      STREAM_CTR     at 0 range 0 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  QSPI flash execute-in-place block
   type XIP_CTRL_Peripheral is record
      --  Cache control register. Read-only from a Non-secure context.
      CTRL        : aliased CTRL_Register;
      STAT        : aliased STAT_Register;
      --  Cache Hit counter
      CTR_HIT     : aliased HAL.UInt32;
      --  Cache Access counter
      CTR_ACC     : aliased HAL.UInt32;
      --  FIFO stream address
      STREAM_ADDR : aliased STREAM_ADDR_Register;
      --  FIFO stream control
      STREAM_CTR  : aliased STREAM_CTR_Register;
      --  FIFO stream data
      STREAM_FIFO : aliased HAL.UInt32;
   end record
     with Volatile;

   for XIP_CTRL_Peripheral use record
      CTRL        at 16#0# range 0 .. 31;
      STAT        at 16#8# range 0 .. 31;
      CTR_HIT     at 16#C# range 0 .. 31;
      CTR_ACC     at 16#10# range 0 .. 31;
      STREAM_ADDR at 16#14# range 0 .. 31;
      STREAM_CTR  at 16#18# range 0 .. 31;
      STREAM_FIFO at 16#1C# range 0 .. 31;
   end record;

   --  QSPI flash execute-in-place block
   XIP_CTRL_Periph : aliased XIP_CTRL_Peripheral
     with Import, Address => XIP_CTRL_Base;

end RP2350_SVD.XIP_CTRL;
