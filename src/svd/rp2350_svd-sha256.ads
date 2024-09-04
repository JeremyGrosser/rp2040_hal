pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

--  SHA-256 hash function implementation
package RP2350_SVD.SHA256 is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Configure DREQ logic for the correct DMA data size. Must be configured
   --  before the DMA channel is triggered. The SHA-256 core's DREQ logic
   --  requests one entire block of data at once, since there is no FIFO, and
   --  data goes straight into the core's message schedule and digest hardware.
   --  Therefore, when transferring data with DMA, CSR_DMA_SIZE must be
   --  configured in advance so that the correct number of transfers can be
   --  requested per block.
   type CSR_DMA_SIZE_Field is
     (Val_8bit,
      Val_16bit,
      Val_32bit)
     with Size => 2;
   for CSR_DMA_SIZE_Field use
     (Val_8bit => 0,
      Val_16bit => 1,
      Val_32bit => 2);

   --  Control and status register
   type CSR_Register is record
      --  Write-only. Write 1 to prepare the SHA-256 core for a new checksum.
      --  The SUMx registers are initialised to the proper values (fractional
      --  bits of square roots of first 8 primes) and internal counters are
      --  cleared. This immediately forces WDATA_RDY and SUM_VLD high. START
      --  must be written before initiating a DMA transfer to the SHA-256 core,
      --  because the core will always request 16 transfers at a time (1
      --  512-bit block). Additionally, the DMA channel should be configured
      --  for a multiple of 16 32-bit transfers.
      START             : Boolean := False;
      --  Read-only. If 1, the SHA-256 core is ready to accept more data
      --  through the WDATA register. After writing 16 words, this flag will go
      --  low for 57 cycles whilst the core completes its digest.
      WDATA_RDY         : Boolean := True;
      --  Read-only. If 1, the SHA-256 checksum presented in registers SUM0
      --  through SUM7 is currently valid. Goes low when WDATA is first
      --  written, then returns high once 16 words have been written and the
      --  digest of the current 512-bit block has subsequently completed.
      SUM_VLD           : Boolean := True;
      --  unspecified
      Reserved_3_3      : HAL.Bit := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Set when a write occurs whilst the SHA-256 core is not
      --  ready for data (WDATA_RDY is low). Write one to clear.
      ERR_WDATA_NOT_RDY : Boolean := False;
      --  unspecified
      Reserved_5_7      : HAL.UInt3 := 16#0#;
      --  Configure DREQ logic for the correct DMA data size. Must be
      --  configured before the DMA channel is triggered. The SHA-256 core's
      --  DREQ logic requests one entire block of data at once, since there is
      --  no FIFO, and data goes straight into the core's message schedule and
      --  digest hardware. Therefore, when transferring data with DMA,
      --  CSR_DMA_SIZE must be configured in advance so that the correct number
      --  of transfers can be requested per block.
      DMA_SIZE          : CSR_DMA_SIZE_Field := RP2350_SVD.SHA256.Val_32bit;
      --  unspecified
      Reserved_10_11    : HAL.UInt2 := 16#0#;
      --  Enable byte swapping of 32-bit values at the point they are committed
      --  to the SHA message scheduler. This block's bus interface assembles
      --  byte/halfword data into message words in little-endian order, so that
      --  DMAing the same buffer with different transfer sizes always gives the
      --  same result on a little-endian system like RP2350. However, when
      --  marshalling bytes into blocks, SHA expects that the first byte is the
      --  *most significant* in each message word. To resolve this, once the
      --  bus interface has accumulated 32 bits of data (either a word write,
      --  two halfword writes in little-endian order, or four byte writes in
      --  little-endian order) the final value can be byte-swapped before
      --  passing to the actual SHA core. This feature is enabled by default
      --  because using the SHA core to checksum byte buffers is expected to be
      --  more common than having preformatted SHA message words lying around.
      BSWAP             : Boolean := True;
      --  unspecified
      Reserved_13_31    : HAL.UInt19 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CSR_Register use record
      START             at 0 range 0 .. 0;
      WDATA_RDY         at 0 range 1 .. 1;
      SUM_VLD           at 0 range 2 .. 2;
      Reserved_3_3      at 0 range 3 .. 3;
      ERR_WDATA_NOT_RDY at 0 range 4 .. 4;
      Reserved_5_7      at 0 range 5 .. 7;
      DMA_SIZE          at 0 range 8 .. 9;
      Reserved_10_11    at 0 range 10 .. 11;
      BSWAP             at 0 range 12 .. 12;
      Reserved_13_31    at 0 range 13 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  SHA-256 hash function implementation
   type SHA256_Peripheral is record
      --  Control and status register
      CSR   : aliased CSR_Register;
      --  Write data register
      WDATA : aliased HAL.UInt32;
      --  256-bit checksum result. Contents are undefined when CSR_SUM_VLD is
      --  0.
      SUM0  : aliased HAL.UInt32;
      --  256-bit checksum result. Contents are undefined when CSR_SUM_VLD is
      --  0.
      SUM1  : aliased HAL.UInt32;
      --  256-bit checksum result. Contents are undefined when CSR_SUM_VLD is
      --  0.
      SUM2  : aliased HAL.UInt32;
      --  256-bit checksum result. Contents are undefined when CSR_SUM_VLD is
      --  0.
      SUM3  : aliased HAL.UInt32;
      --  256-bit checksum result. Contents are undefined when CSR_SUM_VLD is
      --  0.
      SUM4  : aliased HAL.UInt32;
      --  256-bit checksum result. Contents are undefined when CSR_SUM_VLD is
      --  0.
      SUM5  : aliased HAL.UInt32;
      --  256-bit checksum result. Contents are undefined when CSR_SUM_VLD is
      --  0.
      SUM6  : aliased HAL.UInt32;
      --  256-bit checksum result. Contents are undefined when CSR_SUM_VLD is
      --  0.
      SUM7  : aliased HAL.UInt32;
   end record
     with Volatile;

   for SHA256_Peripheral use record
      CSR   at 16#0# range 0 .. 31;
      WDATA at 16#4# range 0 .. 31;
      SUM0  at 16#8# range 0 .. 31;
      SUM1  at 16#C# range 0 .. 31;
      SUM2  at 16#10# range 0 .. 31;
      SUM3  at 16#14# range 0 .. 31;
      SUM4  at 16#18# range 0 .. 31;
      SUM5  at 16#1C# range 0 .. 31;
      SUM6  at 16#20# range 0 .. 31;
      SUM7  at 16#24# range 0 .. 31;
   end record;

   --  SHA-256 hash function implementation
   SHA256_Periph : aliased SHA256_Peripheral
     with Import, Address => SHA256_Base;

end RP2350_SVD.SHA256;
