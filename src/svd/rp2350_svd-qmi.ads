pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

--  QSPI Memory Interface.
--
--              Provides a memory-mapped interface to up to two SPI/DSPI/QSPI
--  flash or PSRAM devices. Also provides a serial interface for programming
--  and configuration of the external device.
package RP2350_SVD.QMI is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype DIRECT_CSR_TXLEVEL_Field is HAL.UInt3;
   subtype DIRECT_CSR_RXLEVEL_Field is HAL.UInt3;
   subtype DIRECT_CSR_CLKDIV_Field is HAL.UInt8;
   subtype DIRECT_CSR_RXDELAY_Field is HAL.UInt2;

   --  Control and status for direct serial mode Direct serial mode allows the
   --  processor to send and receive raw serial frames, for programming,
   --  configuration and control of the external memory devices. Only SPI mode
   --  0 (CPOL=0 CPHA=0) is supported.
   type DIRECT_CSR_Register is record
      --  Enable direct mode. In direct mode, software controls the chip select
      --  lines, and can perform direct SPI transfers by pushing data to the
      --  DIRECT_TX FIFO, and popping the same amount of data from the
      --  DIRECT_RX FIFO. Memory-mapped accesses will generate bus errors when
      --  direct serial mode is enabled.
      EN             : Boolean := False;
      --  Read-only. Direct mode busy flag. If 1, data is currently being
      --  shifted in/out (or would be if the interface were not stalled on the
      --  RX FIFO), and the chip select must not yet be deasserted. The busy
      --  flag will also be set to 1 if a memory-mapped transfer is still in
      --  progress when direct mode is enabled. Direct mode blocks new
      --  memory-mapped transfers, but can't halt a transfer that is already in
      --  progress. If there is a chance that memory-mapped transfers may be in
      --  progress, the busy flag should be polled for 0 before asserting the
      --  chip select. (In practice you will usually discover this timing
      --  condition through other means, because any subsequent memory-mapped
      --  transfers when direct mode is enabled will return bus errors, which
      --  are difficult to ignore.)
      BUSY           : Boolean := False;
      --  When 1, assert (i.e. drive low) the CS0n chip select line. Note that
      --  this applies even when DIRECT_CSR_EN is 0.
      ASSERT_CS0N    : Boolean := False;
      --  When 1, assert (i.e. drive low) the CS1n chip select line. Note that
      --  this applies even when DIRECT_CSR_EN is 0.
      ASSERT_CS1N    : Boolean := False;
      --  unspecified
      Reserved_4_5   : HAL.UInt2 := 16#0#;
      --  When 1, automatically assert the CS0n chip select line whenever the
      --  BUSY flag is set.
      AUTO_CS0N      : Boolean := False;
      --  When 1, automatically assert the CS1n chip select line whenever the
      --  BUSY flag is set.
      AUTO_CS1N      : Boolean := False;
      --  unspecified
      Reserved_8_9   : HAL.UInt2 := 16#0#;
      --  Read-only. When 1, the DIRECT_TX FIFO is currently full. If the
      --  processor tries to write more data, that data will be ignored.
      TXFULL         : Boolean := False;
      --  Read-only. When 1, the DIRECT_TX FIFO is currently empty. Unless the
      --  processor pushes more data, transmission will stop and BUSY will go
      --  low once the current 8-bit serial frame completes.
      TXEMPTY        : Boolean := False;
      --  Read-only. Current level of DIRECT_TX FIFO
      TXLEVEL        : DIRECT_CSR_TXLEVEL_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
      --  Read-only. When 1, the DIRECT_RX FIFO is currently empty. If the
      --  processor attempts to read more data, the FIFO state is not affected,
      --  but the value returned to the processor is undefined.
      RXEMPTY        : Boolean := False;
      --  Read-only. When 1, the DIRECT_RX FIFO is currently full. The serial
      --  interface will be stalled until data is popped; the interface will
      --  not begin a new serial frame when the DIRECT_TX FIFO is empty or the
      --  DIRECT_RX FIFO is full.
      RXFULL         : Boolean := False;
      --  Read-only. Current level of DIRECT_RX FIFO
      RXLEVEL        : DIRECT_CSR_RXLEVEL_Field := 16#0#;
      --  unspecified
      Reserved_21_21 : HAL.Bit := 16#0#;
      --  Clock divisor for direct serial mode. Divisors of 1..255 are encoded
      --  directly, and the maximum divisor of 256 is encoded by a value of
      --  CLKDIV=0. The clock divisor can be changed on-the-fly by software,
      --  without halting or otherwise coordinating with the serial interface.
      --  The serial interface will sample the latest clock divisor each time
      --  it begins the transmission of a new byte.
      CLKDIV         : DIRECT_CSR_CLKDIV_Field := 16#6#;
      --  Delay the read data sample timing, in units of one half of a system
      --  clock cycle. (Not necessarily half of an SCK cycle.)
      RXDELAY        : DIRECT_CSR_RXDELAY_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DIRECT_CSR_Register use record
      EN             at 0 range 0 .. 0;
      BUSY           at 0 range 1 .. 1;
      ASSERT_CS0N    at 0 range 2 .. 2;
      ASSERT_CS1N    at 0 range 3 .. 3;
      Reserved_4_5   at 0 range 4 .. 5;
      AUTO_CS0N      at 0 range 6 .. 6;
      AUTO_CS1N      at 0 range 7 .. 7;
      Reserved_8_9   at 0 range 8 .. 9;
      TXFULL         at 0 range 10 .. 10;
      TXEMPTY        at 0 range 11 .. 11;
      TXLEVEL        at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      RXEMPTY        at 0 range 16 .. 16;
      RXFULL         at 0 range 17 .. 17;
      RXLEVEL        at 0 range 18 .. 20;
      Reserved_21_21 at 0 range 21 .. 21;
      CLKDIV         at 0 range 22 .. 29;
      RXDELAY        at 0 range 30 .. 31;
   end record;

   subtype DIRECT_TX_DATA_Field is HAL.UInt16;

   --  Configure whether this FIFO record is transferred with single/dual/quad
   --  interface width (0/1/2). Different widths can be mixed freely.
   type DIRECT_TX_IWIDTH_Field is
     (--  Single width
      S,
      --  Dual width
      D,
      --  Quad width
      Q)
     with Size => 2;
   for DIRECT_TX_IWIDTH_Field use
     (S => 0,
      D => 1,
      Q => 2);

   --  Transmit FIFO for direct mode
   type DIRECT_TX_Register is record
      --  Write-only. Data pushed here will be clocked out falling edges of SCK
      --  (or before the very first rising edge of SCK, if this is the first
      --  pulse). For each byte clocked out, the interface will simultaneously
      --  sample one byte, on rising edges of SCK, and push this to the
      --  DIRECT_RX FIFO. For 16-bit data, the least-significant byte is
      --  transmitted first.
      DATA           : DIRECT_TX_DATA_Field := 16#0#;
      --  Write-only. Configure whether this FIFO record is transferred with
      --  single/dual/quad interface width (0/1/2). Different widths can be
      --  mixed freely.
      IWIDTH         : DIRECT_TX_IWIDTH_Field := RP2350_SVD.QMI.S;
      --  Write-only. Data width. If 0, hardware will transmit the 8 LSBs of
      --  the DIRECT_TX DATA field, and return an 8-bit value in the 8 LSBs of
      --  DIRECT_RX. If 1, the full 16-bit width is used. 8-bit and 16-bit
      --  transfers can be mixed freely.
      DWIDTH         : Boolean := False;
      --  Write-only. Output enable (active-high). For single width (SPI), this
      --  field is ignored, and SD0 is always set to output, with SD1 always
      --  set to input. For dual and quad width (DSPI/QSPI), this sets whether
      --  the relevant SDx pads are set to output whilst transferring this FIFO
      --  record. In this case the command/address should have OE set, and the
      --  data transfer should have OE set or clear depending on the direction
      --  of the transfer.
      OE             : Boolean := False;
      --  Write-only. Inhibit the RX FIFO push that would correspond to this TX
      --  FIFO entry. Useful to avoid garbage appearing in the RX FIFO when
      --  pushing the command at the beginning of a SPI transfer.
      NOPUSH         : Boolean := False;
      --  unspecified
      Reserved_21_31 : HAL.UInt11 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DIRECT_TX_Register use record
      DATA           at 0 range 0 .. 15;
      IWIDTH         at 0 range 16 .. 17;
      DWIDTH         at 0 range 18 .. 18;
      OE             at 0 range 19 .. 19;
      NOPUSH         at 0 range 20 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   subtype DIRECT_RX_DIRECT_RX_Field is HAL.UInt16;

   --  Receive FIFO for direct mode
   type DIRECT_RX_Register is record
      --  Read-only. *** This field is modified following a read operation ***.
      --  With each byte clocked out on the serial interface, one byte will
      --  simultaneously be clocked in, and will appear in this FIFO. The
      --  serial interface will stall when this FIFO is full, to avoid dropping
      --  data. When 16-bit data is pushed into the TX FIFO, the corresponding
      --  RX FIFO push will also contain 16 bits of data. The least-significant
      --  byte is the first one received.
      DIRECT_RX      : DIRECT_RX_DIRECT_RX_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DIRECT_RX_Register use record
      DIRECT_RX      at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype M0_TIMING_CLKDIV_Field is HAL.UInt8;
   subtype M0_TIMING_RXDELAY_Field is HAL.UInt3;
   subtype M0_TIMING_MIN_DESELECT_Field is HAL.UInt5;
   subtype M0_TIMING_MAX_SELECT_Field is HAL.UInt6;
   subtype M0_TIMING_SELECT_HOLD_Field is HAL.UInt2;

   --  When page break is enabled, chip select will automatically deassert when
   --  crossing certain power-of-2-aligned address boundaries. The next access
   --  will always begin a new read/write SPI burst, even if the address of the
   --  next access follows in sequence with the last access before the page
   --  boundary. Some flash and PSRAM devices forbid crossing page boundaries
   --  with a single read/write transfer, or restrict the operating frequency
   --  for transfers that do cross page a boundary. This option allows the QMI
   --  to safely support those devices. This field has no effect when COOLDOWN
   --  is disabled.
   type M0_TIMING_PAGEBREAK_Field is
     (--  No page boundary is enforced
      NONE,
      --  Break bursts crossing a 256-byte page boundary
      Val_256,
      --  Break bursts crossing a 1024-byte quad-page boundary
      Val_1024,
      --  Break bursts crossing a 4096-byte sector boundary
      Val_4096)
     with Size => 2;
   for M0_TIMING_PAGEBREAK_Field use
     (NONE => 0,
      Val_256 => 1,
      Val_1024 => 2,
      Val_4096 => 3);

   subtype M0_TIMING_COOLDOWN_Field is HAL.UInt2;

   --  Timing configuration register for memory address window 0.
   type M0_TIMING_Register is record
      --  Clock divisor. Odd and even divisors are supported. Defines the SCK
      --  clock period in units of 1 system clock cycle. Divisors 1..255 are
      --  encoded directly, and a divisor of 256 is encoded with a value of
      --  CLKDIV=0. The clock divisor can be changed on-the-fly, even when the
      --  QMI is currently accessing memory in this address window. All other
      --  parameters must only be changed when the QMI is idle. If software is
      --  increasing CLKDIV in anticipation of an increase in the system clock
      --  frequency, a dummy access to either memory window (and appropriate
      --  processor barriers/fences) must be inserted after the Mx_TIMING write
      --  to ensure the SCK divisor change is in effect _before_ the system
      --  clock is changed.
      CLKDIV         : M0_TIMING_CLKDIV_Field := 16#4#;
      --  Delay the read data sample timing, in units of one half of a system
      --  clock cycle. (Not necessarily half of an SCK cycle.) An RXDELAY of 0
      --  means the sample is captured at the SDI input registers
      --  simultaneously with the rising edge of SCK launched from the SCK
      --  output register. At higher SCK frequencies, RXDELAY may need to be
      --  increased to account for the round trip delay of the pads, and the
      --  clock-to-Q delay of the QSPI memory device.
      RXDELAY        : M0_TIMING_RXDELAY_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : HAL.Bit := 16#0#;
      --  After this window's chip select is deasserted, it remains deasserted
      --  for half an SCK cycle (rounded up to an integer number of system
      --  clock cycles), plus MIN_DESELECT additional system clock cycles,
      --  before the QMI reasserts either chip select pin. Nonzero values may
      --  be required for PSRAM devices which enforce a longer minimum CS
      --  deselect time, so that they can perform internal DRAM refresh cycles
      --  whilst deselected.
      MIN_DESELECT   : M0_TIMING_MIN_DESELECT_Field := 16#0#;
      --  Enforce a maximum assertion duration for this window's chip select,
      --  in units of 64 system clock cycles. If 0, the QMI is permitted to
      --  keep the chip select asserted indefinitely when servicing sequential
      --  memory accesses (see COOLDOWN). This feature is required to meet
      --  timing constraints of PSRAM devices, which specify a maximum chip
      --  select assertion so they can perform DRAM refresh cycles. See also
      --  MIN_DESELECT, which can enforce a minimum deselect time. If a memory
      --  access is in progress at the time MAX_SELECT is reached, the QMI will
      --  wait for the access to complete before deasserting the chip select.
      --  This additional time must be accounted for to calculate a safe
      --  MAX_SELECT value. In the worst case, this may be a fully-formed
      --  serial transfer, including command prefix and address, with a data
      --  payload as large as one cache line.
      MAX_SELECT     : M0_TIMING_MAX_SELECT_Field := 16#0#;
      --  Add up to three additional system clock cycles of active hold between
      --  the last falling edge of SCK and the deassertion of this window's
      --  chip select. The default hold time is one system clock cycle. Note
      --  that flash datasheets usually give chip select active hold time from
      --  the last *rising* edge of SCK, and so even zero hold from the last
      --  falling edge would be safe. Note that this is a minimum hold time
      --  guaranteed by the QMI: the actual chip select active hold may be
      --  slightly longer for read transfers with low clock divisors and/or
      --  high sample delays. Specifically, if the point two cycles after the
      --  last RX data sample is later than the last SCK falling edge, then the
      --  hold time is measured from *this* point. Note also that, in case the
      --  final SCK pulse is masked to save energy (true for non-DTR reads when
      --  COOLDOWN is disabled or PAGE_BREAK is reached), all of QMI's timing
      --  logic behaves as though the clock pulse were still present. The
      --  SELECT_HOLD time is applied from the point where the last SCK falling
      --  edge would be if the clock pulse were not masked.
      SELECT_HOLD    : M0_TIMING_SELECT_HOLD_Field := 16#0#;
      --  Add up to one additional system clock cycle of setup between chip
      --  select assertion and the first rising edge of SCK. The default setup
      --  time is one half SCK period, which is usually sufficient except for
      --  very high SCK frequencies with some flash devices.
      SELECT_SETUP   : Boolean := False;
      --  unspecified
      Reserved_26_27 : HAL.UInt2 := 16#0#;
      --  When page break is enabled, chip select will automatically deassert
      --  when crossing certain power-of-2-aligned address boundaries. The next
      --  access will always begin a new read/write SPI burst, even if the
      --  address of the next access follows in sequence with the last access
      --  before the page boundary. Some flash and PSRAM devices forbid
      --  crossing page boundaries with a single read/write transfer, or
      --  restrict the operating frequency for transfers that do cross page a
      --  boundary. This option allows the QMI to safely support those devices.
      --  This field has no effect when COOLDOWN is disabled.
      PAGEBREAK      : M0_TIMING_PAGEBREAK_Field := RP2350_SVD.QMI.NONE;
      --  Chip select cooldown period. When a memory transfer finishes, the
      --  chip select remains asserted for 64 x COOLDOWN system clock cycles,
      --  plus half an SCK clock period (rounded up for odd SCK divisors).
      --  After this cooldown expires, the chip select is always deasserted to
      --  save power. If the next memory access arrives within the cooldown
      --  period, the QMI may be able to append more SCK cycles to the
      --  currently ongoing SPI transfer, rather than starting a new transfer.
      --  This reduces access latency and increases bus throughput.
      --  Specifically, the next access must be in the same direction
      --  (read/write), access the same memory window (chip select 0/1), and
      --  follow sequentially the address of the last transfer. If any of these
      --  are false, the new access will first deassert the chip select, then
      --  begin a new transfer. If COOLDOWN is 0, the address alignment
      --  configured by PAGEBREAK has been reached, or the total chip select
      --  assertion limit MAX_SELECT has been reached, the cooldown period is
      --  skipped, and the chip select will always be deasserted one half SCK
      --  period after the transfer finishes.
      COOLDOWN       : M0_TIMING_COOLDOWN_Field := 16#1#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for M0_TIMING_Register use record
      CLKDIV         at 0 range 0 .. 7;
      RXDELAY        at 0 range 8 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      MIN_DESELECT   at 0 range 12 .. 16;
      MAX_SELECT     at 0 range 17 .. 22;
      SELECT_HOLD    at 0 range 23 .. 24;
      SELECT_SETUP   at 0 range 25 .. 25;
      Reserved_26_27 at 0 range 26 .. 27;
      PAGEBREAK      at 0 range 28 .. 29;
      COOLDOWN       at 0 range 30 .. 31;
   end record;

   --  The transfer width used for the command prefix, if any
   type M0_RFMT_PREFIX_WIDTH_Field is
     (--  Single width
      S,
      --  Dual width
      D,
      --  Quad width
      Q)
     with Size => 2;
   for M0_RFMT_PREFIX_WIDTH_Field use
     (S => 0,
      D => 1,
      Q => 2);

   --  The transfer width used for the address. The address phase always
   --  transfers 24 bits in total.
   type M0_RFMT_ADDR_WIDTH_Field is
     (--  Single width
      S,
      --  Dual width
      D,
      --  Quad width
      Q)
     with Size => 2;
   for M0_RFMT_ADDR_WIDTH_Field use
     (S => 0,
      D => 1,
      Q => 2);

   --  The width used for the post-address command suffix, if any
   type M0_RFMT_SUFFIX_WIDTH_Field is
     (--  Single width
      S,
      --  Dual width
      D,
      --  Quad width
      Q)
     with Size => 2;
   for M0_RFMT_SUFFIX_WIDTH_Field use
     (S => 0,
      D => 1,
      Q => 2);

   --  The width used for the dummy phase, if any. If width is single, SD0/MOSI
   --  is held asserted low during the dummy phase, and SD1...SD3 are
   --  tristated. If width is dual/quad, all IOs are tristated during the dummy
   --  phase.
   type M0_RFMT_DUMMY_WIDTH_Field is
     (--  Single width
      S,
      --  Dual width
      D,
      --  Quad width
      Q)
     with Size => 2;
   for M0_RFMT_DUMMY_WIDTH_Field use
     (S => 0,
      D => 1,
      Q => 2);

   --  The width used for the data transfer
   type M0_RFMT_DATA_WIDTH_Field is
     (--  Single width
      S,
      --  Dual width
      D,
      --  Quad width
      Q)
     with Size => 2;
   for M0_RFMT_DATA_WIDTH_Field use
     (S => 0,
      D => 1,
      Q => 2);

   --  Length of command prefix, in units of 8 bits. (i.e. 2 cycles for quad
   --  width, 4 for dual, 8 for single)
   type M0_RFMT_PREFIX_LEN_Field is
     (--  No prefix
      NONE,
      --  8-bit prefix
      Val_8)
     with Size => 1;
   for M0_RFMT_PREFIX_LEN_Field use
     (NONE => 0,
      Val_8 => 1);

   --  Length of post-address command suffix, in units of 4 bits. (i.e. 1 cycle
   --  for quad width, 2 for dual, 4 for single) Only values of 0 and 8 bits
   --  are supported.
   type M0_RFMT_SUFFIX_LEN_Field is
     (--  No suffix
      NONE,
      --  8-bit suffix
      Val_8)
     with Size => 2;
   for M0_RFMT_SUFFIX_LEN_Field use
     (NONE => 0,
      Val_8 => 2);

   --  Length of dummy phase between command suffix and data phase, in units of
   --  4 bits. (i.e. 1 cycle for quad width, 2 for dual, 4 for single)
   type M0_RFMT_DUMMY_LEN_Field is
     (--  No dummy phase
      NONE,
      --  4 dummy bits
      Val_4,
      --  8 dummy bits
      Val_8,
      --  12 dummy bits
      Val_12,
      --  16 dummy bits
      Val_16,
      --  20 dummy bits
      Val_20,
      --  24 dummy bits
      Val_24,
      --  28 dummy bits
      Val_28)
     with Size => 3;
   for M0_RFMT_DUMMY_LEN_Field use
     (NONE => 0,
      Val_4 => 1,
      Val_8 => 2,
      Val_12 => 3,
      Val_16 => 4,
      Val_20 => 5,
      Val_24 => 6,
      Val_28 => 7);

   --  Read transfer format configuration for memory address window 0.
   --  Configure the bus width of each transfer phase individually, and
   --  configure the length or presence of the command prefix, command suffix
   --  and dummy/turnaround transfer phases. Only 24-bit addresses are
   --  supported. The reset value of the M0_RFMT register is configured to
   --  support a basic 03h serial read transfer with no additional
   --  configuration.
   type M0_RFMT_Register is record
      --  The transfer width used for the command prefix, if any
      PREFIX_WIDTH   : M0_RFMT_PREFIX_WIDTH_Field := RP2350_SVD.QMI.S;
      --  The transfer width used for the address. The address phase always
      --  transfers 24 bits in total.
      ADDR_WIDTH     : M0_RFMT_ADDR_WIDTH_Field := RP2350_SVD.QMI.S;
      --  The width used for the post-address command suffix, if any
      SUFFIX_WIDTH   : M0_RFMT_SUFFIX_WIDTH_Field := RP2350_SVD.QMI.S;
      --  The width used for the dummy phase, if any. If width is single,
      --  SD0/MOSI is held asserted low during the dummy phase, and SD1...SD3
      --  are tristated. If width is dual/quad, all IOs are tristated during
      --  the dummy phase.
      DUMMY_WIDTH    : M0_RFMT_DUMMY_WIDTH_Field := RP2350_SVD.QMI.S;
      --  The width used for the data transfer
      DATA_WIDTH     : M0_RFMT_DATA_WIDTH_Field := RP2350_SVD.QMI.S;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      --  Length of command prefix, in units of 8 bits. (i.e. 2 cycles for quad
      --  width, 4 for dual, 8 for single)
      PREFIX_LEN     : M0_RFMT_PREFIX_LEN_Field := RP2350_SVD.QMI.Val_8;
      --  unspecified
      Reserved_13_13 : HAL.Bit := 16#0#;
      --  Length of post-address command suffix, in units of 4 bits. (i.e. 1
      --  cycle for quad width, 2 for dual, 4 for single) Only values of 0 and
      --  8 bits are supported.
      SUFFIX_LEN     : M0_RFMT_SUFFIX_LEN_Field := RP2350_SVD.QMI.NONE;
      --  Length of dummy phase between command suffix and data phase, in units
      --  of 4 bits. (i.e. 1 cycle for quad width, 2 for dual, 4 for single)
      DUMMY_LEN      : M0_RFMT_DUMMY_LEN_Field := RP2350_SVD.QMI.NONE;
      --  unspecified
      Reserved_19_27 : HAL.UInt9 := 16#0#;
      --  Enable double transfer rate (DTR) for read commands: address, suffix
      --  and read data phases are active on both edges of SCK. SDO data is
      --  launched centre-aligned on each SCK edge, and SDI data is captured on
      --  the SCK edge that follows its launch. DTR is implemented by halving
      --  the clock rate; SCK has a period of 2 x CLK_DIV throughout the
      --  transfer. The prefix and dummy phases are still single transfer rate.
      --  If the suffix is quad-width, it must be 0 or 8 bits in length, to
      --  ensure an even number of SCK edges.
      DTR            : Boolean := False;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for M0_RFMT_Register use record
      PREFIX_WIDTH   at 0 range 0 .. 1;
      ADDR_WIDTH     at 0 range 2 .. 3;
      SUFFIX_WIDTH   at 0 range 4 .. 5;
      DUMMY_WIDTH    at 0 range 6 .. 7;
      DATA_WIDTH     at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      PREFIX_LEN     at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      SUFFIX_LEN     at 0 range 14 .. 15;
      DUMMY_LEN      at 0 range 16 .. 18;
      Reserved_19_27 at 0 range 19 .. 27;
      DTR            at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype M0_RCMD_PREFIX_Field is HAL.UInt8;
   subtype M0_RCMD_SUFFIX_Field is HAL.UInt8;

   --  Command constants used for reads from memory address window 0. The reset
   --  value of the M0_RCMD register is configured to support a basic 03h
   --  serial read transfer with no additional configuration.
   type M0_RCMD_Register is record
      --  The command prefix bits to prepend on each new transfer, if
      --  Mx_RFMT_PREFIX_LEN is nonzero.
      PREFIX         : M0_RCMD_PREFIX_Field := 16#3#;
      --  The command suffix bits following the address, if Mx_RFMT_SUFFIX_LEN
      --  is nonzero.
      SUFFIX         : M0_RCMD_SUFFIX_Field := 16#A0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for M0_RCMD_Register use record
      PREFIX         at 0 range 0 .. 7;
      SUFFIX         at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  The transfer width used for the command prefix, if any
   type M0_WFMT_PREFIX_WIDTH_Field is
     (--  Single width
      S,
      --  Dual width
      D,
      --  Quad width
      Q)
     with Size => 2;
   for M0_WFMT_PREFIX_WIDTH_Field use
     (S => 0,
      D => 1,
      Q => 2);

   --  The transfer width used for the address. The address phase always
   --  transfers 24 bits in total.
   type M0_WFMT_ADDR_WIDTH_Field is
     (--  Single width
      S,
      --  Dual width
      D,
      --  Quad width
      Q)
     with Size => 2;
   for M0_WFMT_ADDR_WIDTH_Field use
     (S => 0,
      D => 1,
      Q => 2);

   --  The width used for the post-address command suffix, if any
   type M0_WFMT_SUFFIX_WIDTH_Field is
     (--  Single width
      S,
      --  Dual width
      D,
      --  Quad width
      Q)
     with Size => 2;
   for M0_WFMT_SUFFIX_WIDTH_Field use
     (S => 0,
      D => 1,
      Q => 2);

   --  The width used for the dummy phase, if any. If width is single, SD0/MOSI
   --  is held asserted low during the dummy phase, and SD1...SD3 are
   --  tristated. If width is dual/quad, all IOs are tristated during the dummy
   --  phase.
   type M0_WFMT_DUMMY_WIDTH_Field is
     (--  Single width
      S,
      --  Dual width
      D,
      --  Quad width
      Q)
     with Size => 2;
   for M0_WFMT_DUMMY_WIDTH_Field use
     (S => 0,
      D => 1,
      Q => 2);

   --  The width used for the data transfer
   type M0_WFMT_DATA_WIDTH_Field is
     (--  Single width
      S,
      --  Dual width
      D,
      --  Quad width
      Q)
     with Size => 2;
   for M0_WFMT_DATA_WIDTH_Field use
     (S => 0,
      D => 1,
      Q => 2);

   --  Length of command prefix, in units of 8 bits. (i.e. 2 cycles for quad
   --  width, 4 for dual, 8 for single)
   type M0_WFMT_PREFIX_LEN_Field is
     (--  No prefix
      NONE,
      --  8-bit prefix
      Val_8)
     with Size => 1;
   for M0_WFMT_PREFIX_LEN_Field use
     (NONE => 0,
      Val_8 => 1);

   --  Length of post-address command suffix, in units of 4 bits. (i.e. 1 cycle
   --  for quad width, 2 for dual, 4 for single) Only values of 0 and 8 bits
   --  are supported.
   type M0_WFMT_SUFFIX_LEN_Field is
     (--  No suffix
      NONE,
      --  8-bit suffix
      Val_8)
     with Size => 2;
   for M0_WFMT_SUFFIX_LEN_Field use
     (NONE => 0,
      Val_8 => 2);

   --  Length of dummy phase between command suffix and data phase, in units of
   --  4 bits. (i.e. 1 cycle for quad width, 2 for dual, 4 for single)
   type M0_WFMT_DUMMY_LEN_Field is
     (--  No dummy phase
      NONE,
      --  4 dummy bits
      Val_4,
      --  8 dummy bits
      Val_8,
      --  12 dummy bits
      Val_12,
      --  16 dummy bits
      Val_16,
      --  20 dummy bits
      Val_20,
      --  24 dummy bits
      Val_24,
      --  28 dummy bits
      Val_28)
     with Size => 3;
   for M0_WFMT_DUMMY_LEN_Field use
     (NONE => 0,
      Val_4 => 1,
      Val_8 => 2,
      Val_12 => 3,
      Val_16 => 4,
      Val_20 => 5,
      Val_24 => 6,
      Val_28 => 7);

   --  Write transfer format configuration for memory address window 0.
   --  Configure the bus width of each transfer phase individually, and
   --  configure the length or presence of the command prefix, command suffix
   --  and dummy/turnaround transfer phases. Only 24-bit addresses are
   --  supported. The reset value of the M0_WFMT register is configured to
   --  support a basic 02h serial write transfer. However, writes to this
   --  window must first be enabled via the XIP_CTRL_WRITABLE_M0 bit, as XIP
   --  memory is read-only by default.
   type M0_WFMT_Register is record
      --  The transfer width used for the command prefix, if any
      PREFIX_WIDTH   : M0_WFMT_PREFIX_WIDTH_Field := RP2350_SVD.QMI.S;
      --  The transfer width used for the address. The address phase always
      --  transfers 24 bits in total.
      ADDR_WIDTH     : M0_WFMT_ADDR_WIDTH_Field := RP2350_SVD.QMI.S;
      --  The width used for the post-address command suffix, if any
      SUFFIX_WIDTH   : M0_WFMT_SUFFIX_WIDTH_Field := RP2350_SVD.QMI.S;
      --  The width used for the dummy phase, if any. If width is single,
      --  SD0/MOSI is held asserted low during the dummy phase, and SD1...SD3
      --  are tristated. If width is dual/quad, all IOs are tristated during
      --  the dummy phase.
      DUMMY_WIDTH    : M0_WFMT_DUMMY_WIDTH_Field := RP2350_SVD.QMI.S;
      --  The width used for the data transfer
      DATA_WIDTH     : M0_WFMT_DATA_WIDTH_Field := RP2350_SVD.QMI.S;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      --  Length of command prefix, in units of 8 bits. (i.e. 2 cycles for quad
      --  width, 4 for dual, 8 for single)
      PREFIX_LEN     : M0_WFMT_PREFIX_LEN_Field := RP2350_SVD.QMI.Val_8;
      --  unspecified
      Reserved_13_13 : HAL.Bit := 16#0#;
      --  Length of post-address command suffix, in units of 4 bits. (i.e. 1
      --  cycle for quad width, 2 for dual, 4 for single) Only values of 0 and
      --  8 bits are supported.
      SUFFIX_LEN     : M0_WFMT_SUFFIX_LEN_Field := RP2350_SVD.QMI.NONE;
      --  Length of dummy phase between command suffix and data phase, in units
      --  of 4 bits. (i.e. 1 cycle for quad width, 2 for dual, 4 for single)
      DUMMY_LEN      : M0_WFMT_DUMMY_LEN_Field := RP2350_SVD.QMI.NONE;
      --  unspecified
      Reserved_19_27 : HAL.UInt9 := 16#0#;
      --  Enable double transfer rate (DTR) for write commands: address, suffix
      --  and write data phases are active on both edges of SCK. SDO data is
      --  launched centre-aligned on each SCK edge, and SDI data is captured on
      --  the SCK edge that follows its launch. DTR is implemented by halving
      --  the clock rate; SCK has a period of 2 x CLK_DIV throughout the
      --  transfer. The prefix and dummy phases are still single transfer rate.
      --  If the suffix is quad-width, it must be 0 or 8 bits in length, to
      --  ensure an even number of SCK edges.
      DTR            : Boolean := False;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for M0_WFMT_Register use record
      PREFIX_WIDTH   at 0 range 0 .. 1;
      ADDR_WIDTH     at 0 range 2 .. 3;
      SUFFIX_WIDTH   at 0 range 4 .. 5;
      DUMMY_WIDTH    at 0 range 6 .. 7;
      DATA_WIDTH     at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      PREFIX_LEN     at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      SUFFIX_LEN     at 0 range 14 .. 15;
      DUMMY_LEN      at 0 range 16 .. 18;
      Reserved_19_27 at 0 range 19 .. 27;
      DTR            at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype M0_WCMD_PREFIX_Field is HAL.UInt8;
   subtype M0_WCMD_SUFFIX_Field is HAL.UInt8;

   --  Command constants used for writes to memory address window 0. The reset
   --  value of the M0_WCMD register is configured to support a basic 02h
   --  serial write transfer with no additional configuration.
   type M0_WCMD_Register is record
      --  The command prefix bits to prepend on each new transfer, if
      --  Mx_WFMT_PREFIX_LEN is nonzero.
      PREFIX         : M0_WCMD_PREFIX_Field := 16#2#;
      --  The command suffix bits following the address, if Mx_WFMT_SUFFIX_LEN
      --  is nonzero.
      SUFFIX         : M0_WCMD_SUFFIX_Field := 16#A0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for M0_WCMD_Register use record
      PREFIX         at 0 range 0 .. 7;
      SUFFIX         at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype M1_TIMING_CLKDIV_Field is HAL.UInt8;
   subtype M1_TIMING_RXDELAY_Field is HAL.UInt3;
   subtype M1_TIMING_MIN_DESELECT_Field is HAL.UInt5;
   subtype M1_TIMING_MAX_SELECT_Field is HAL.UInt6;
   subtype M1_TIMING_SELECT_HOLD_Field is HAL.UInt2;

   --  When page break is enabled, chip select will automatically deassert when
   --  crossing certain power-of-2-aligned address boundaries. The next access
   --  will always begin a new read/write SPI burst, even if the address of the
   --  next access follows in sequence with the last access before the page
   --  boundary. Some flash and PSRAM devices forbid crossing page boundaries
   --  with a single read/write transfer, or restrict the operating frequency
   --  for transfers that do cross page a boundary. This option allows the QMI
   --  to safely support those devices. This field has no effect when COOLDOWN
   --  is disabled.
   type M1_TIMING_PAGEBREAK_Field is
     (--  No page boundary is enforced
      NONE,
      --  Break bursts crossing a 256-byte page boundary
      Val_256,
      --  Break bursts crossing a 1024-byte quad-page boundary
      Val_1024,
      --  Break bursts crossing a 4096-byte sector boundary
      Val_4096)
     with Size => 2;
   for M1_TIMING_PAGEBREAK_Field use
     (NONE => 0,
      Val_256 => 1,
      Val_1024 => 2,
      Val_4096 => 3);

   subtype M1_TIMING_COOLDOWN_Field is HAL.UInt2;

   --  Timing configuration register for memory address window 1.
   type M1_TIMING_Register is record
      --  Clock divisor. Odd and even divisors are supported. Defines the SCK
      --  clock period in units of 1 system clock cycle. Divisors 1..255 are
      --  encoded directly, and a divisor of 256 is encoded with a value of
      --  CLKDIV=0. The clock divisor can be changed on-the-fly, even when the
      --  QMI is currently accessing memory in this address window. All other
      --  parameters must only be changed when the QMI is idle. If software is
      --  increasing CLKDIV in anticipation of an increase in the system clock
      --  frequency, a dummy access to either memory window (and appropriate
      --  processor barriers/fences) must be inserted after the Mx_TIMING write
      --  to ensure the SCK divisor change is in effect _before_ the system
      --  clock is changed.
      CLKDIV         : M1_TIMING_CLKDIV_Field := 16#4#;
      --  Delay the read data sample timing, in units of one half of a system
      --  clock cycle. (Not necessarily half of an SCK cycle.) An RXDELAY of 0
      --  means the sample is captured at the SDI input registers
      --  simultaneously with the rising edge of SCK launched from the SCK
      --  output register. At higher SCK frequencies, RXDELAY may need to be
      --  increased to account for the round trip delay of the pads, and the
      --  clock-to-Q delay of the QSPI memory device.
      RXDELAY        : M1_TIMING_RXDELAY_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : HAL.Bit := 16#0#;
      --  After this window's chip select is deasserted, it remains deasserted
      --  for half an SCK cycle (rounded up to an integer number of system
      --  clock cycles), plus MIN_DESELECT additional system clock cycles,
      --  before the QMI reasserts either chip select pin. Nonzero values may
      --  be required for PSRAM devices which enforce a longer minimum CS
      --  deselect time, so that they can perform internal DRAM refresh cycles
      --  whilst deselected.
      MIN_DESELECT   : M1_TIMING_MIN_DESELECT_Field := 16#0#;
      --  Enforce a maximum assertion duration for this window's chip select,
      --  in units of 64 system clock cycles. If 0, the QMI is permitted to
      --  keep the chip select asserted indefinitely when servicing sequential
      --  memory accesses (see COOLDOWN). This feature is required to meet
      --  timing constraints of PSRAM devices, which specify a maximum chip
      --  select assertion so they can perform DRAM refresh cycles. See also
      --  MIN_DESELECT, which can enforce a minimum deselect time. If a memory
      --  access is in progress at the time MAX_SELECT is reached, the QMI will
      --  wait for the access to complete before deasserting the chip select.
      --  This additional time must be accounted for to calculate a safe
      --  MAX_SELECT value. In the worst case, this may be a fully-formed
      --  serial transfer, including command prefix and address, with a data
      --  payload as large as one cache line.
      MAX_SELECT     : M1_TIMING_MAX_SELECT_Field := 16#0#;
      --  Add up to three additional system clock cycles of active hold between
      --  the last falling edge of SCK and the deassertion of this window's
      --  chip select. The default hold time is one system clock cycle. Note
      --  that flash datasheets usually give chip select active hold time from
      --  the last *rising* edge of SCK, and so even zero hold from the last
      --  falling edge would be safe. Note that this is a minimum hold time
      --  guaranteed by the QMI: the actual chip select active hold may be
      --  slightly longer for read transfers with low clock divisors and/or
      --  high sample delays. Specifically, if the point two cycles after the
      --  last RX data sample is later than the last SCK falling edge, then the
      --  hold time is measured from *this* point. Note also that, in case the
      --  final SCK pulse is masked to save energy (true for non-DTR reads when
      --  COOLDOWN is disabled or PAGE_BREAK is reached), all of QMI's timing
      --  logic behaves as though the clock pulse were still present. The
      --  SELECT_HOLD time is applied from the point where the last SCK falling
      --  edge would be if the clock pulse were not masked.
      SELECT_HOLD    : M1_TIMING_SELECT_HOLD_Field := 16#0#;
      --  Add up to one additional system clock cycle of setup between chip
      --  select assertion and the first rising edge of SCK. The default setup
      --  time is one half SCK period, which is usually sufficient except for
      --  very high SCK frequencies with some flash devices.
      SELECT_SETUP   : Boolean := False;
      --  unspecified
      Reserved_26_27 : HAL.UInt2 := 16#0#;
      --  When page break is enabled, chip select will automatically deassert
      --  when crossing certain power-of-2-aligned address boundaries. The next
      --  access will always begin a new read/write SPI burst, even if the
      --  address of the next access follows in sequence with the last access
      --  before the page boundary. Some flash and PSRAM devices forbid
      --  crossing page boundaries with a single read/write transfer, or
      --  restrict the operating frequency for transfers that do cross page a
      --  boundary. This option allows the QMI to safely support those devices.
      --  This field has no effect when COOLDOWN is disabled.
      PAGEBREAK      : M1_TIMING_PAGEBREAK_Field := RP2350_SVD.QMI.NONE;
      --  Chip select cooldown period. When a memory transfer finishes, the
      --  chip select remains asserted for 64 x COOLDOWN system clock cycles,
      --  plus half an SCK clock period (rounded up for odd SCK divisors).
      --  After this cooldown expires, the chip select is always deasserted to
      --  save power. If the next memory access arrives within the cooldown
      --  period, the QMI may be able to append more SCK cycles to the
      --  currently ongoing SPI transfer, rather than starting a new transfer.
      --  This reduces access latency and increases bus throughput.
      --  Specifically, the next access must be in the same direction
      --  (read/write), access the same memory window (chip select 0/1), and
      --  follow sequentially the address of the last transfer. If any of these
      --  are false, the new access will first deassert the chip select, then
      --  begin a new transfer. If COOLDOWN is 0, the address alignment
      --  configured by PAGEBREAK has been reached, or the total chip select
      --  assertion limit MAX_SELECT has been reached, the cooldown period is
      --  skipped, and the chip select will always be deasserted one half SCK
      --  period after the transfer finishes.
      COOLDOWN       : M1_TIMING_COOLDOWN_Field := 16#1#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for M1_TIMING_Register use record
      CLKDIV         at 0 range 0 .. 7;
      RXDELAY        at 0 range 8 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      MIN_DESELECT   at 0 range 12 .. 16;
      MAX_SELECT     at 0 range 17 .. 22;
      SELECT_HOLD    at 0 range 23 .. 24;
      SELECT_SETUP   at 0 range 25 .. 25;
      Reserved_26_27 at 0 range 26 .. 27;
      PAGEBREAK      at 0 range 28 .. 29;
      COOLDOWN       at 0 range 30 .. 31;
   end record;

   --  The transfer width used for the command prefix, if any
   type M1_RFMT_PREFIX_WIDTH_Field is
     (--  Single width
      S,
      --  Dual width
      D,
      --  Quad width
      Q)
     with Size => 2;
   for M1_RFMT_PREFIX_WIDTH_Field use
     (S => 0,
      D => 1,
      Q => 2);

   --  The transfer width used for the address. The address phase always
   --  transfers 24 bits in total.
   type M1_RFMT_ADDR_WIDTH_Field is
     (--  Single width
      S,
      --  Dual width
      D,
      --  Quad width
      Q)
     with Size => 2;
   for M1_RFMT_ADDR_WIDTH_Field use
     (S => 0,
      D => 1,
      Q => 2);

   --  The width used for the post-address command suffix, if any
   type M1_RFMT_SUFFIX_WIDTH_Field is
     (--  Single width
      S,
      --  Dual width
      D,
      --  Quad width
      Q)
     with Size => 2;
   for M1_RFMT_SUFFIX_WIDTH_Field use
     (S => 0,
      D => 1,
      Q => 2);

   --  The width used for the dummy phase, if any. If width is single, SD0/MOSI
   --  is held asserted low during the dummy phase, and SD1...SD3 are
   --  tristated. If width is dual/quad, all IOs are tristated during the dummy
   --  phase.
   type M1_RFMT_DUMMY_WIDTH_Field is
     (--  Single width
      S,
      --  Dual width
      D,
      --  Quad width
      Q)
     with Size => 2;
   for M1_RFMT_DUMMY_WIDTH_Field use
     (S => 0,
      D => 1,
      Q => 2);

   --  The width used for the data transfer
   type M1_RFMT_DATA_WIDTH_Field is
     (--  Single width
      S,
      --  Dual width
      D,
      --  Quad width
      Q)
     with Size => 2;
   for M1_RFMT_DATA_WIDTH_Field use
     (S => 0,
      D => 1,
      Q => 2);

   --  Length of command prefix, in units of 8 bits. (i.e. 2 cycles for quad
   --  width, 4 for dual, 8 for single)
   type M1_RFMT_PREFIX_LEN_Field is
     (--  No prefix
      NONE,
      --  8-bit prefix
      Val_8)
     with Size => 1;
   for M1_RFMT_PREFIX_LEN_Field use
     (NONE => 0,
      Val_8 => 1);

   --  Length of post-address command suffix, in units of 4 bits. (i.e. 1 cycle
   --  for quad width, 2 for dual, 4 for single) Only values of 0 and 8 bits
   --  are supported.
   type M1_RFMT_SUFFIX_LEN_Field is
     (--  No suffix
      NONE,
      --  8-bit suffix
      Val_8)
     with Size => 2;
   for M1_RFMT_SUFFIX_LEN_Field use
     (NONE => 0,
      Val_8 => 2);

   --  Length of dummy phase between command suffix and data phase, in units of
   --  4 bits. (i.e. 1 cycle for quad width, 2 for dual, 4 for single)
   type M1_RFMT_DUMMY_LEN_Field is
     (--  No dummy phase
      NONE,
      --  4 dummy bits
      Val_4,
      --  8 dummy bits
      Val_8,
      --  12 dummy bits
      Val_12,
      --  16 dummy bits
      Val_16,
      --  20 dummy bits
      Val_20,
      --  24 dummy bits
      Val_24,
      --  28 dummy bits
      Val_28)
     with Size => 3;
   for M1_RFMT_DUMMY_LEN_Field use
     (NONE => 0,
      Val_4 => 1,
      Val_8 => 2,
      Val_12 => 3,
      Val_16 => 4,
      Val_20 => 5,
      Val_24 => 6,
      Val_28 => 7);

   --  Read transfer format configuration for memory address window 1.
   --  Configure the bus width of each transfer phase individually, and
   --  configure the length or presence of the command prefix, command suffix
   --  and dummy/turnaround transfer phases. Only 24-bit addresses are
   --  supported. The reset value of the M1_RFMT register is configured to
   --  support a basic 03h serial read transfer with no additional
   --  configuration.
   type M1_RFMT_Register is record
      --  The transfer width used for the command prefix, if any
      PREFIX_WIDTH   : M1_RFMT_PREFIX_WIDTH_Field := RP2350_SVD.QMI.S;
      --  The transfer width used for the address. The address phase always
      --  transfers 24 bits in total.
      ADDR_WIDTH     : M1_RFMT_ADDR_WIDTH_Field := RP2350_SVD.QMI.S;
      --  The width used for the post-address command suffix, if any
      SUFFIX_WIDTH   : M1_RFMT_SUFFIX_WIDTH_Field := RP2350_SVD.QMI.S;
      --  The width used for the dummy phase, if any. If width is single,
      --  SD0/MOSI is held asserted low during the dummy phase, and SD1...SD3
      --  are tristated. If width is dual/quad, all IOs are tristated during
      --  the dummy phase.
      DUMMY_WIDTH    : M1_RFMT_DUMMY_WIDTH_Field := RP2350_SVD.QMI.S;
      --  The width used for the data transfer
      DATA_WIDTH     : M1_RFMT_DATA_WIDTH_Field := RP2350_SVD.QMI.S;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      --  Length of command prefix, in units of 8 bits. (i.e. 2 cycles for quad
      --  width, 4 for dual, 8 for single)
      PREFIX_LEN     : M1_RFMT_PREFIX_LEN_Field := RP2350_SVD.QMI.Val_8;
      --  unspecified
      Reserved_13_13 : HAL.Bit := 16#0#;
      --  Length of post-address command suffix, in units of 4 bits. (i.e. 1
      --  cycle for quad width, 2 for dual, 4 for single) Only values of 0 and
      --  8 bits are supported.
      SUFFIX_LEN     : M1_RFMT_SUFFIX_LEN_Field := RP2350_SVD.QMI.NONE;
      --  Length of dummy phase between command suffix and data phase, in units
      --  of 4 bits. (i.e. 1 cycle for quad width, 2 for dual, 4 for single)
      DUMMY_LEN      : M1_RFMT_DUMMY_LEN_Field := RP2350_SVD.QMI.NONE;
      --  unspecified
      Reserved_19_27 : HAL.UInt9 := 16#0#;
      --  Enable double transfer rate (DTR) for read commands: address, suffix
      --  and read data phases are active on both edges of SCK. SDO data is
      --  launched centre-aligned on each SCK edge, and SDI data is captured on
      --  the SCK edge that follows its launch. DTR is implemented by halving
      --  the clock rate; SCK has a period of 2 x CLK_DIV throughout the
      --  transfer. The prefix and dummy phases are still single transfer rate.
      --  If the suffix is quad-width, it must be 0 or 8 bits in length, to
      --  ensure an even number of SCK edges.
      DTR            : Boolean := False;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for M1_RFMT_Register use record
      PREFIX_WIDTH   at 0 range 0 .. 1;
      ADDR_WIDTH     at 0 range 2 .. 3;
      SUFFIX_WIDTH   at 0 range 4 .. 5;
      DUMMY_WIDTH    at 0 range 6 .. 7;
      DATA_WIDTH     at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      PREFIX_LEN     at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      SUFFIX_LEN     at 0 range 14 .. 15;
      DUMMY_LEN      at 0 range 16 .. 18;
      Reserved_19_27 at 0 range 19 .. 27;
      DTR            at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype M1_RCMD_PREFIX_Field is HAL.UInt8;
   subtype M1_RCMD_SUFFIX_Field is HAL.UInt8;

   --  Command constants used for reads from memory address window 1. The reset
   --  value of the M1_RCMD register is configured to support a basic 03h
   --  serial read transfer with no additional configuration.
   type M1_RCMD_Register is record
      --  The command prefix bits to prepend on each new transfer, if
      --  Mx_RFMT_PREFIX_LEN is nonzero.
      PREFIX         : M1_RCMD_PREFIX_Field := 16#3#;
      --  The command suffix bits following the address, if Mx_RFMT_SUFFIX_LEN
      --  is nonzero.
      SUFFIX         : M1_RCMD_SUFFIX_Field := 16#A0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for M1_RCMD_Register use record
      PREFIX         at 0 range 0 .. 7;
      SUFFIX         at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  The transfer width used for the command prefix, if any
   type M1_WFMT_PREFIX_WIDTH_Field is
     (--  Single width
      S,
      --  Dual width
      D,
      --  Quad width
      Q)
     with Size => 2;
   for M1_WFMT_PREFIX_WIDTH_Field use
     (S => 0,
      D => 1,
      Q => 2);

   --  The transfer width used for the address. The address phase always
   --  transfers 24 bits in total.
   type M1_WFMT_ADDR_WIDTH_Field is
     (--  Single width
      S,
      --  Dual width
      D,
      --  Quad width
      Q)
     with Size => 2;
   for M1_WFMT_ADDR_WIDTH_Field use
     (S => 0,
      D => 1,
      Q => 2);

   --  The width used for the post-address command suffix, if any
   type M1_WFMT_SUFFIX_WIDTH_Field is
     (--  Single width
      S,
      --  Dual width
      D,
      --  Quad width
      Q)
     with Size => 2;
   for M1_WFMT_SUFFIX_WIDTH_Field use
     (S => 0,
      D => 1,
      Q => 2);

   --  The width used for the dummy phase, if any. If width is single, SD0/MOSI
   --  is held asserted low during the dummy phase, and SD1...SD3 are
   --  tristated. If width is dual/quad, all IOs are tristated during the dummy
   --  phase.
   type M1_WFMT_DUMMY_WIDTH_Field is
     (--  Single width
      S,
      --  Dual width
      D,
      --  Quad width
      Q)
     with Size => 2;
   for M1_WFMT_DUMMY_WIDTH_Field use
     (S => 0,
      D => 1,
      Q => 2);

   --  The width used for the data transfer
   type M1_WFMT_DATA_WIDTH_Field is
     (--  Single width
      S,
      --  Dual width
      D,
      --  Quad width
      Q)
     with Size => 2;
   for M1_WFMT_DATA_WIDTH_Field use
     (S => 0,
      D => 1,
      Q => 2);

   --  Length of command prefix, in units of 8 bits. (i.e. 2 cycles for quad
   --  width, 4 for dual, 8 for single)
   type M1_WFMT_PREFIX_LEN_Field is
     (--  No prefix
      NONE,
      --  8-bit prefix
      Val_8)
     with Size => 1;
   for M1_WFMT_PREFIX_LEN_Field use
     (NONE => 0,
      Val_8 => 1);

   --  Length of post-address command suffix, in units of 4 bits. (i.e. 1 cycle
   --  for quad width, 2 for dual, 4 for single) Only values of 0 and 8 bits
   --  are supported.
   type M1_WFMT_SUFFIX_LEN_Field is
     (--  No suffix
      NONE,
      --  8-bit suffix
      Val_8)
     with Size => 2;
   for M1_WFMT_SUFFIX_LEN_Field use
     (NONE => 0,
      Val_8 => 2);

   --  Length of dummy phase between command suffix and data phase, in units of
   --  4 bits. (i.e. 1 cycle for quad width, 2 for dual, 4 for single)
   type M1_WFMT_DUMMY_LEN_Field is
     (--  No dummy phase
      NONE,
      --  4 dummy bits
      Val_4,
      --  8 dummy bits
      Val_8,
      --  12 dummy bits
      Val_12,
      --  16 dummy bits
      Val_16,
      --  20 dummy bits
      Val_20,
      --  24 dummy bits
      Val_24,
      --  28 dummy bits
      Val_28)
     with Size => 3;
   for M1_WFMT_DUMMY_LEN_Field use
     (NONE => 0,
      Val_4 => 1,
      Val_8 => 2,
      Val_12 => 3,
      Val_16 => 4,
      Val_20 => 5,
      Val_24 => 6,
      Val_28 => 7);

   --  Write transfer format configuration for memory address window 1.
   --  Configure the bus width of each transfer phase individually, and
   --  configure the length or presence of the command prefix, command suffix
   --  and dummy/turnaround transfer phases. Only 24-bit addresses are
   --  supported. The reset value of the M1_WFMT register is configured to
   --  support a basic 02h serial write transfer. However, writes to this
   --  window must first be enabled via the XIP_CTRL_WRITABLE_M1 bit, as XIP
   --  memory is read-only by default.
   type M1_WFMT_Register is record
      --  The transfer width used for the command prefix, if any
      PREFIX_WIDTH   : M1_WFMT_PREFIX_WIDTH_Field := RP2350_SVD.QMI.S;
      --  The transfer width used for the address. The address phase always
      --  transfers 24 bits in total.
      ADDR_WIDTH     : M1_WFMT_ADDR_WIDTH_Field := RP2350_SVD.QMI.S;
      --  The width used for the post-address command suffix, if any
      SUFFIX_WIDTH   : M1_WFMT_SUFFIX_WIDTH_Field := RP2350_SVD.QMI.S;
      --  The width used for the dummy phase, if any. If width is single,
      --  SD0/MOSI is held asserted low during the dummy phase, and SD1...SD3
      --  are tristated. If width is dual/quad, all IOs are tristated during
      --  the dummy phase.
      DUMMY_WIDTH    : M1_WFMT_DUMMY_WIDTH_Field := RP2350_SVD.QMI.S;
      --  The width used for the data transfer
      DATA_WIDTH     : M1_WFMT_DATA_WIDTH_Field := RP2350_SVD.QMI.S;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      --  Length of command prefix, in units of 8 bits. (i.e. 2 cycles for quad
      --  width, 4 for dual, 8 for single)
      PREFIX_LEN     : M1_WFMT_PREFIX_LEN_Field := RP2350_SVD.QMI.Val_8;
      --  unspecified
      Reserved_13_13 : HAL.Bit := 16#0#;
      --  Length of post-address command suffix, in units of 4 bits. (i.e. 1
      --  cycle for quad width, 2 for dual, 4 for single) Only values of 0 and
      --  8 bits are supported.
      SUFFIX_LEN     : M1_WFMT_SUFFIX_LEN_Field := RP2350_SVD.QMI.NONE;
      --  Length of dummy phase between command suffix and data phase, in units
      --  of 4 bits. (i.e. 1 cycle for quad width, 2 for dual, 4 for single)
      DUMMY_LEN      : M1_WFMT_DUMMY_LEN_Field := RP2350_SVD.QMI.NONE;
      --  unspecified
      Reserved_19_27 : HAL.UInt9 := 16#0#;
      --  Enable double transfer rate (DTR) for write commands: address, suffix
      --  and write data phases are active on both edges of SCK. SDO data is
      --  launched centre-aligned on each SCK edge, and SDI data is captured on
      --  the SCK edge that follows its launch. DTR is implemented by halving
      --  the clock rate; SCK has a period of 2 x CLK_DIV throughout the
      --  transfer. The prefix and dummy phases are still single transfer rate.
      --  If the suffix is quad-width, it must be 0 or 8 bits in length, to
      --  ensure an even number of SCK edges.
      DTR            : Boolean := False;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for M1_WFMT_Register use record
      PREFIX_WIDTH   at 0 range 0 .. 1;
      ADDR_WIDTH     at 0 range 2 .. 3;
      SUFFIX_WIDTH   at 0 range 4 .. 5;
      DUMMY_WIDTH    at 0 range 6 .. 7;
      DATA_WIDTH     at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      PREFIX_LEN     at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      SUFFIX_LEN     at 0 range 14 .. 15;
      DUMMY_LEN      at 0 range 16 .. 18;
      Reserved_19_27 at 0 range 19 .. 27;
      DTR            at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype M1_WCMD_PREFIX_Field is HAL.UInt8;
   subtype M1_WCMD_SUFFIX_Field is HAL.UInt8;

   --  Command constants used for writes to memory address window 1. The reset
   --  value of the M1_WCMD register is configured to support a basic 02h
   --  serial write transfer with no additional configuration.
   type M1_WCMD_Register is record
      --  The command prefix bits to prepend on each new transfer, if
      --  Mx_WFMT_PREFIX_LEN is nonzero.
      PREFIX         : M1_WCMD_PREFIX_Field := 16#2#;
      --  The command suffix bits following the address, if Mx_WFMT_SUFFIX_LEN
      --  is nonzero.
      SUFFIX         : M1_WCMD_SUFFIX_Field := 16#A0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for M1_WCMD_Register use record
      PREFIX         at 0 range 0 .. 7;
      SUFFIX         at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype ATRANS_BASE_Field is HAL.UInt12;
   subtype ATRANS_SIZE_Field is HAL.UInt11;

   --  Configure address translation for XIP virtual addresses 0x000000 through
   --  0x3fffff (a 4 MiB window starting at +0 MiB). Address translation allows
   --  a program image to be executed in place at multiple physical flash
   --  addresses (for example, a double-buffered flash image for over-the-air
   --  updates), without the overhead of position-independent code. At reset,
   --  the address translation registers are initialised to an identity
   --  mapping, so that they can be ignored if address translation is not
   --  required. Note that the XIP cache is fully virtually addressed, so a
   --  cache flush is required after changing the address translation.
   type ATRANS_Register is record
      --  Physical address base for this virtual address range, in units of 4
      --  kiB (one flash sector). Taking a 24-bit virtual address, firstly bits
      --  23:22 (the two MSBs) are masked to zero, and then BASE is added to
      --  bits 23:12 (the upper 12 bits) to form the physical address.
      --  Translation wraps on a 16 MiB boundary.
      BASE           : ATRANS_BASE_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      --  Translation aperture size for this virtual address range, in units of
      --  4 kiB (one flash sector). Bits 21:12 of the virtual address are
      --  compared to SIZE. Offsets greater than SIZE return a bus error, and
      --  do not cause a QSPI access.
      SIZE           : ATRANS_SIZE_Field := 16#400#;
      --  unspecified
      Reserved_27_31 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ATRANS_Register use record
      BASE           at 0 range 0 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      SIZE           at 0 range 16 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  QSPI Memory Interface. Provides a memory-mapped interface to up to two
   --  SPI/DSPI/QSPI flash or PSRAM devices. Also provides a serial interface
   --  for programming and configuration of the external device.
   type QMI_Peripheral is record
      --  Control and status for direct serial mode Direct serial mode allows
      --  the processor to send and receive raw serial frames, for programming,
      --  configuration and control of the external memory devices. Only SPI
      --  mode 0 (CPOL=0 CPHA=0) is supported.
      DIRECT_CSR : aliased DIRECT_CSR_Register;
      --  Transmit FIFO for direct mode
      DIRECT_TX  : aliased DIRECT_TX_Register;
      --  Receive FIFO for direct mode
      DIRECT_RX  : aliased DIRECT_RX_Register;
      --  Timing configuration register for memory address window 0.
      M0_TIMING  : aliased M0_TIMING_Register;
      --  Read transfer format configuration for memory address window 0.
      --  Configure the bus width of each transfer phase individually, and
      --  configure the length or presence of the command prefix, command
      --  suffix and dummy/turnaround transfer phases. Only 24-bit addresses
      --  are supported. The reset value of the M0_RFMT register is configured
      --  to support a basic 03h serial read transfer with no additional
      --  configuration.
      M0_RFMT    : aliased M0_RFMT_Register;
      --  Command constants used for reads from memory address window 0. The
      --  reset value of the M0_RCMD register is configured to support a basic
      --  03h serial read transfer with no additional configuration.
      M0_RCMD    : aliased M0_RCMD_Register;
      --  Write transfer format configuration for memory address window 0.
      --  Configure the bus width of each transfer phase individually, and
      --  configure the length or presence of the command prefix, command
      --  suffix and dummy/turnaround transfer phases. Only 24-bit addresses
      --  are supported. The reset value of the M0_WFMT register is configured
      --  to support a basic 02h serial write transfer. However, writes to this
      --  window must first be enabled via the XIP_CTRL_WRITABLE_M0 bit, as XIP
      --  memory is read-only by default.
      M0_WFMT    : aliased M0_WFMT_Register;
      --  Command constants used for writes to memory address window 0. The
      --  reset value of the M0_WCMD register is configured to support a basic
      --  02h serial write transfer with no additional configuration.
      M0_WCMD    : aliased M0_WCMD_Register;
      --  Timing configuration register for memory address window 1.
      M1_TIMING  : aliased M1_TIMING_Register;
      --  Read transfer format configuration for memory address window 1.
      --  Configure the bus width of each transfer phase individually, and
      --  configure the length or presence of the command prefix, command
      --  suffix and dummy/turnaround transfer phases. Only 24-bit addresses
      --  are supported. The reset value of the M1_RFMT register is configured
      --  to support a basic 03h serial read transfer with no additional
      --  configuration.
      M1_RFMT    : aliased M1_RFMT_Register;
      --  Command constants used for reads from memory address window 1. The
      --  reset value of the M1_RCMD register is configured to support a basic
      --  03h serial read transfer with no additional configuration.
      M1_RCMD    : aliased M1_RCMD_Register;
      --  Write transfer format configuration for memory address window 1.
      --  Configure the bus width of each transfer phase individually, and
      --  configure the length or presence of the command prefix, command
      --  suffix and dummy/turnaround transfer phases. Only 24-bit addresses
      --  are supported. The reset value of the M1_WFMT register is configured
      --  to support a basic 02h serial write transfer. However, writes to this
      --  window must first be enabled via the XIP_CTRL_WRITABLE_M1 bit, as XIP
      --  memory is read-only by default.
      M1_WFMT    : aliased M1_WFMT_Register;
      --  Command constants used for writes to memory address window 1. The
      --  reset value of the M1_WCMD register is configured to support a basic
      --  02h serial write transfer with no additional configuration.
      M1_WCMD    : aliased M1_WCMD_Register;
      --  Configure address translation for XIP virtual addresses 0x000000
      --  through 0x3fffff (a 4 MiB window starting at +0 MiB). Address
      --  translation allows a program image to be executed in place at
      --  multiple physical flash addresses (for example, a double-buffered
      --  flash image for over-the-air updates), without the overhead of
      --  position-independent code. At reset, the address translation
      --  registers are initialised to an identity mapping, so that they can be
      --  ignored if address translation is not required. Note that the XIP
      --  cache is fully virtually addressed, so a cache flush is required
      --  after changing the address translation.
      ATRANS0    : aliased ATRANS_Register;
      --  Configure address translation for XIP virtual addresses 0x400000
      --  through 0x7fffff (a 4 MiB window starting at +4 MiB). Address
      --  translation allows a program image to be executed in place at
      --  multiple physical flash addresses (for example, a double-buffered
      --  flash image for over-the-air updates), without the overhead of
      --  position-independent code. At reset, the address translation
      --  registers are initialised to an identity mapping, so that they can be
      --  ignored if address translation is not required. Note that the XIP
      --  cache is fully virtually addressed, so a cache flush is required
      --  after changing the address translation.
      ATRANS1    : aliased ATRANS_Register;
      --  Configure address translation for XIP virtual addresses 0x800000
      --  through 0xbfffff (a 4 MiB window starting at +8 MiB). Address
      --  translation allows a program image to be executed in place at
      --  multiple physical flash addresses (for example, a double-buffered
      --  flash image for over-the-air updates), without the overhead of
      --  position-independent code. At reset, the address translation
      --  registers are initialised to an identity mapping, so that they can be
      --  ignored if address translation is not required. Note that the XIP
      --  cache is fully virtually addressed, so a cache flush is required
      --  after changing the address translation.
      ATRANS2    : aliased ATRANS_Register;
      --  Configure address translation for XIP virtual addresses 0xc00000
      --  through 0xffffff (a 4 MiB window starting at +12 MiB). Address
      --  translation allows a program image to be executed in place at
      --  multiple physical flash addresses (for example, a double-buffered
      --  flash image for over-the-air updates), without the overhead of
      --  position-independent code. At reset, the address translation
      --  registers are initialised to an identity mapping, so that they can be
      --  ignored if address translation is not required. Note that the XIP
      --  cache is fully virtually addressed, so a cache flush is required
      --  after changing the address translation.
      ATRANS3    : aliased ATRANS_Register;
      --  Configure address translation for XIP virtual addresses 0x1000000
      --  through 0x13fffff (a 4 MiB window starting at +16 MiB). Address
      --  translation allows a program image to be executed in place at
      --  multiple physical flash addresses (for example, a double-buffered
      --  flash image for over-the-air updates), without the overhead of
      --  position-independent code. At reset, the address translation
      --  registers are initialised to an identity mapping, so that they can be
      --  ignored if address translation is not required. Note that the XIP
      --  cache is fully virtually addressed, so a cache flush is required
      --  after changing the address translation.
      ATRANS4    : aliased ATRANS_Register;
      --  Configure address translation for XIP virtual addresses 0x1400000
      --  through 0x17fffff (a 4 MiB window starting at +20 MiB). Address
      --  translation allows a program image to be executed in place at
      --  multiple physical flash addresses (for example, a double-buffered
      --  flash image for over-the-air updates), without the overhead of
      --  position-independent code. At reset, the address translation
      --  registers are initialised to an identity mapping, so that they can be
      --  ignored if address translation is not required. Note that the XIP
      --  cache is fully virtually addressed, so a cache flush is required
      --  after changing the address translation.
      ATRANS5    : aliased ATRANS_Register;
      --  Configure address translation for XIP virtual addresses 0x1800000
      --  through 0x1bfffff (a 4 MiB window starting at +24 MiB). Address
      --  translation allows a program image to be executed in place at
      --  multiple physical flash addresses (for example, a double-buffered
      --  flash image for over-the-air updates), without the overhead of
      --  position-independent code. At reset, the address translation
      --  registers are initialised to an identity mapping, so that they can be
      --  ignored if address translation is not required. Note that the XIP
      --  cache is fully virtually addressed, so a cache flush is required
      --  after changing the address translation.
      ATRANS6    : aliased ATRANS_Register;
      --  Configure address translation for XIP virtual addresses 0x1c00000
      --  through 0x1ffffff (a 4 MiB window starting at +28 MiB). Address
      --  translation allows a program image to be executed in place at
      --  multiple physical flash addresses (for example, a double-buffered
      --  flash image for over-the-air updates), without the overhead of
      --  position-independent code. At reset, the address translation
      --  registers are initialised to an identity mapping, so that they can be
      --  ignored if address translation is not required. Note that the XIP
      --  cache is fully virtually addressed, so a cache flush is required
      --  after changing the address translation.
      ATRANS7    : aliased ATRANS_Register;
   end record
     with Volatile;

   for QMI_Peripheral use record
      DIRECT_CSR at 16#0# range 0 .. 31;
      DIRECT_TX  at 16#4# range 0 .. 31;
      DIRECT_RX  at 16#8# range 0 .. 31;
      M0_TIMING  at 16#C# range 0 .. 31;
      M0_RFMT    at 16#10# range 0 .. 31;
      M0_RCMD    at 16#14# range 0 .. 31;
      M0_WFMT    at 16#18# range 0 .. 31;
      M0_WCMD    at 16#1C# range 0 .. 31;
      M1_TIMING  at 16#20# range 0 .. 31;
      M1_RFMT    at 16#24# range 0 .. 31;
      M1_RCMD    at 16#28# range 0 .. 31;
      M1_WFMT    at 16#2C# range 0 .. 31;
      M1_WCMD    at 16#30# range 0 .. 31;
      ATRANS0    at 16#34# range 0 .. 31;
      ATRANS1    at 16#38# range 0 .. 31;
      ATRANS2    at 16#3C# range 0 .. 31;
      ATRANS3    at 16#40# range 0 .. 31;
      ATRANS4    at 16#44# range 0 .. 31;
      ATRANS5    at 16#48# range 0 .. 31;
      ATRANS6    at 16#4C# range 0 .. 31;
      ATRANS7    at 16#50# range 0 .. 31;
   end record;

   --  QSPI Memory Interface. Provides a memory-mapped interface to up to two
   --  SPI/DSPI/QSPI flash or PSRAM devices. Also provides a serial interface
   --  for programming and configuration of the external device.
   QMI_Periph : aliased QMI_Peripheral
     with Import, Address => QMI_Base;

end RP2350_SVD.QMI;
