pragma Style_Checks (Off);

--  Copyright (c) 2020 Raspberry Pi (Trading) Ltd.
--
--  SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2040.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

--  QSPI flash execute-in-place block
package RP2040_SVD.XIP_CTRL is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Cache control
   type CTRL_Register is record
      --  When 1, enable the cache. When the cache is disabled, all XIP
      --  accesses\n will go straight to the flash, without querying the cache.
      --  When enabled,\n cacheable XIP accesses will query the cache, and the
      --  flash will\n not be accessed if the tag matches and the valid bit is
      --  set.\n\n If the cache is enabled, cache-as-SRAM accesses have no
      --  effect on the\n cache data RAM, and will produce a bus error
      --  response.
      EN            : Boolean := True;
      --  When 1, writes to any alias other than 0x0 (caching, allocating)\n
      --  will produce a bus fault. When 0, these writes are silently
      --  ignored.\n In either case, writes to the 0x0 alias will deallocate on
      --  tag match,\n as usual.
      ERR_BADWRITE  : Boolean := True;
      --  unspecified
      Reserved_2_2  : HAL.Bit := 16#0#;
      --  When 1, the cache memories are powered down. They retain state,\n but
      --  can not be accessed. This reduces static power dissipation.\n Writing
      --  1 to this bit forces CTRL_EN to 0, i.e. the cache cannot\n be enabled
      --  when powered down.\n Cache-as-SRAM accesses will produce a bus error
      --  response when\n the cache is powered down.
      POWER_DOWN    : Boolean := False;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CTRL_Register use record
      EN            at 0 range 0 .. 0;
      ERR_BADWRITE  at 0 range 1 .. 1;
      Reserved_2_2  at 0 range 2 .. 2;
      POWER_DOWN    at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  Cache Flush control
   type FLUSH_Register is record
      --  After a write operation all bits in the field are cleared (set to
      --  zero). Write 1 to flush the cache. This clears the tag memory, but\n
      --  the data memory retains its contents. (This means cache-as-SRAM\n
      --  contents is not affected by flush or reset.)\n Reading will hold the
      --  bus (stall the processor) until the flush\n completes. Alternatively
      --  STAT can be polled until completion.
      FLUSH         : Boolean := False;
      --  unspecified
      Reserved_1_31 : HAL.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FLUSH_Register use record
      FLUSH         at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Cache Status
   type STAT_Register is record
      --  Read-only. Reads as 0 while a cache flush is in progress, and 1
      --  otherwise.\n The cache is flushed whenever the XIP block is reset,
      --  and also\n when requested via the FLUSH register.
      FLUSH_READY   : Boolean;
      --  Read-only. When 1, indicates the XIP streaming FIFO is completely
      --  empty.
      FIFO_EMPTY    : Boolean;
      --  Read-only. When 1, indicates the XIP streaming FIFO is completely
      --  full.\n The streaming FIFO is 2 entries deep, so the full and empty\n
      --  flag allow its level to be ascertained.
      FIFO_FULL     : Boolean;
      --  unspecified
      Reserved_3_31 : HAL.UInt29;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for STAT_Register use record
      FLUSH_READY   at 0 range 0 .. 0;
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
      --  streaming FIFO.\n Increments automatically after each flash access.\n
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
      --  Write a nonzero value to start a streaming read. This will then\n
      --  progress in the background, using flash idle cycles to transfer\n a
      --  linear data block from flash to the streaming FIFO.\n Decrements
      --  automatically (1 at a time) as the stream\n progresses, and halts on
      --  reaching 0.\n Write 0 to halt an in-progress stream, and discard any
      --  in-flight\n read, so that a new stream can immediately be started
      --  (after\n draining the FIFO and reinitialising STREAM_ADDR)
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
      --  Cache control
      CTRL        : aliased CTRL_Register;
      --  Cache Flush control
      FLUSH       : aliased FLUSH_Register;
      --  Cache Status
      STAT        : aliased STAT_Register;
      --  Cache Hit counter\n A 32 bit saturating counter that increments upon
      --  each cache hit,\n i.e. when an XIP access is serviced directly from
      --  cached data.\n Write any value to clear.
      CTR_HIT     : aliased HAL.UInt32;
      --  Cache Access counter\n A 32 bit saturating counter that increments
      --  upon each XIP access,\n whether the cache is hit or not. This
      --  includes noncacheable accesses.\n Write any value to clear.
      CTR_ACC     : aliased HAL.UInt32;
      --  FIFO stream address
      STREAM_ADDR : aliased STREAM_ADDR_Register;
      --  FIFO stream control
      STREAM_CTR  : aliased STREAM_CTR_Register;
      --  FIFO stream data\n Streamed data is buffered here, for retrieval by
      --  the system DMA.\n This FIFO can also be accessed via the XIP_AUX
      --  slave, to avoid exposing\n the DMA to bus stalls caused by other XIP
      --  traffic.
      STREAM_FIFO : aliased HAL.UInt32;
   end record
     with Volatile;

   for XIP_CTRL_Peripheral use record
      CTRL        at 16#0# range 0 .. 31;
      FLUSH       at 16#4# range 0 .. 31;
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

end RP2040_SVD.XIP_CTRL;
