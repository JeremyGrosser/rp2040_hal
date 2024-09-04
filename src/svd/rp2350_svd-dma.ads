pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

--  DMA with separate read and write masters
package RP2350_SVD.DMA is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CH0_TRANS_COUNT_COUNT_Field is HAL.UInt28;

   --  When MODE is 0x0, the transfer count decrements with each transfer until
   --  0, and then the channel triggers the next channel indicated by
   --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with each
   --  transfer until 0, and then the channel re-triggers itself, in addition
   --  to the trigger indicated by CTRL_CHAIN_TO. This is useful for e.g. an
   --  endless ring-buffer DMA with periodic interrupts. When MODE is 0xf, the
   --  transfer count does not decrement. The DMA channel performs an endless
   --  sequence of transfers, never triggering other channels or raising
   --  interrupts, until an ABORT is raised. All other values are reserved.
   type CH0_TRANS_COUNT_MODE_Field is
     (NORMAL,
      TRIGGER_SELF,
      ENDLESS)
     with Size => 4;
   for CH0_TRANS_COUNT_MODE_Field use
     (NORMAL => 0,
      TRIGGER_SELF => 1,
      ENDLESS => 15);

   --  DMA Channel 0 Transfer Count
   type CH0_TRANS_COUNT_Register is record
      --  28-bit transfer count (256 million transfers maximum). Program the
      --  number of bus transfers a channel will perform before halting. Note
      --  that, if transfers are larger than one byte in size, this is not
      --  equal to the number of bytes transferred (see CTRL_DATA_SIZE). When
      --  the channel is active, reading this register shows the number of
      --  transfers remaining, updating automatically each time a write
      --  transfer completes. Writing this register sets the RELOAD value for
      --  the transfer counter. Each time this channel is triggered, the RELOAD
      --  value is copied into the live transfer counter. The channel can be
      --  started multiple times, and will perform the same number of transfers
      --  each time, as programmed by most recent write. The RELOAD value can
      --  be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the
      --  written value is used immediately as the length of the new transfer
      --  sequence, as well as being written to RELOAD.
      COUNT : CH0_TRANS_COUNT_COUNT_Field := 16#0#;
      --  When MODE is 0x0, the transfer count decrements with each transfer
      --  until 0, and then the channel triggers the next channel indicated by
      --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with
      --  each transfer until 0, and then the channel re-triggers itself, in
      --  addition to the trigger indicated by CTRL_CHAIN_TO. This is useful
      --  for e.g. an endless ring-buffer DMA with periodic interrupts. When
      --  MODE is 0xf, the transfer count does not decrement. The DMA channel
      --  performs an endless sequence of transfers, never triggering other
      --  channels or raising interrupts, until an ABORT is raised. All other
      --  values are reserved.
      MODE  : CH0_TRANS_COUNT_MODE_Field := RP2350_SVD.DMA.NORMAL;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH0_TRANS_COUNT_Register use record
      COUNT at 0 range 0 .. 27;
      MODE  at 0 range 28 .. 31;
   end record;

   --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
   --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
   type CH0_CTRL_TRIG_DATA_SIZE_Field is
     (SIZE_BYTE,
      SIZE_HALFWORD,
      SIZE_WORD)
     with Size => 2;
   for CH0_CTRL_TRIG_DATA_SIZE_Field use
     (SIZE_BYTE => 0,
      SIZE_HALFWORD => 1,
      SIZE_WORD => 2);

   --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
   --  the lower n bits of the address will change. This wraps the address on a
   --  (1 << n) byte boundary, facilitating access to naturally-aligned ring
   --  buffers. Ring sizes between 2 and 32768 bytes are possible. This can
   --  apply to either read or write addresses, based on value of RING_SEL.
   type CH0_CTRL_TRIG_RING_SIZE_Field is
     (RING_NONE)
     with Size => 4;
   for CH0_CTRL_TRIG_RING_SIZE_Field use
     (RING_NONE => 0);

   subtype CH0_CTRL_TRIG_CHAIN_TO_Field is HAL.UInt4;

   --  Select a Transfer Request signal. The channel uses the transfer request
   --  signal to pace its data transfer rate. Sources for TREQ signals are
   --  internal (TIMERS) or external (DREQ, a Data Request from the system).
   --  0x0 to 0x3a -> select DREQ n as TREQ
   type CH0_CTRL_TRIG_TREQ_SEL_Field is
     (--  Select PIO0's TX FIFO 0 as TREQ
      PIO0_TX0,
      --  Select PIO0's TX FIFO 1 as TREQ
      PIO0_TX1,
      --  Select PIO0's TX FIFO 2 as TREQ
      PIO0_TX2,
      --  Select PIO0's TX FIFO 3 as TREQ
      PIO0_TX3,
      --  Select PIO0's RX FIFO 0 as TREQ
      PIO0_RX0,
      --  Select PIO0's RX FIFO 1 as TREQ
      PIO0_RX1,
      --  Select PIO0's RX FIFO 2 as TREQ
      PIO0_RX2,
      --  Select PIO0's RX FIFO 3 as TREQ
      PIO0_RX3,
      --  Select PIO1's TX FIFO 0 as TREQ
      PIO1_TX0,
      --  Select PIO1's TX FIFO 1 as TREQ
      PIO1_TX1,
      --  Select PIO1's TX FIFO 2 as TREQ
      PIO1_TX2,
      --  Select PIO1's TX FIFO 3 as TREQ
      PIO1_TX3,
      --  Select PIO1's RX FIFO 0 as TREQ
      PIO1_RX0,
      --  Select PIO1's RX FIFO 1 as TREQ
      PIO1_RX1,
      --  Select PIO1's RX FIFO 2 as TREQ
      PIO1_RX2,
      --  Select PIO1's RX FIFO 3 as TREQ
      PIO1_RX3,
      --  Select PIO2's TX FIFO 0 as TREQ
      PIO2_TX0,
      --  Select PIO2's TX FIFO 1 as TREQ
      PIO2_TX1,
      --  Select PIO2's TX FIFO 2 as TREQ
      PIO2_TX2,
      --  Select PIO2's TX FIFO 3 as TREQ
      PIO2_TX3,
      --  Select PIO2's RX FIFO 0 as TREQ
      PIO2_RX0,
      --  Select PIO2's RX FIFO 1 as TREQ
      PIO2_RX1,
      --  Select PIO2's RX FIFO 2 as TREQ
      PIO2_RX2,
      --  Select PIO2's RX FIFO 3 as TREQ
      PIO2_RX3,
      --  Select SPI0's TX FIFO as TREQ
      SPI0_TX,
      --  Select SPI0's RX FIFO as TREQ
      SPI0_RX,
      --  Select SPI1's TX FIFO as TREQ
      SPI1_TX,
      --  Select SPI1's RX FIFO as TREQ
      SPI1_RX,
      --  Select UART0's TX FIFO as TREQ
      UART0_TX,
      --  Select UART0's RX FIFO as TREQ
      UART0_RX,
      --  Select UART1's TX FIFO as TREQ
      UART1_TX,
      --  Select UART1's RX FIFO as TREQ
      UART1_RX,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP0,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP1,
      --  Select PWM Counter 2's Wrap Value as TREQ
      PWM_WRAP2,
      --  Select PWM Counter 3's Wrap Value as TREQ
      PWM_WRAP3,
      --  Select PWM Counter 4's Wrap Value as TREQ
      PWM_WRAP4,
      --  Select PWM Counter 5's Wrap Value as TREQ
      PWM_WRAP5,
      --  Select PWM Counter 6's Wrap Value as TREQ
      PWM_WRAP6,
      --  Select PWM Counter 7's Wrap Value as TREQ
      PWM_WRAP7,
      --  Select PWM Counter 8's Wrap Value as TREQ
      PWM_WRAP8,
      --  Select PWM Counter 9's Wrap Value as TREQ
      PWM_WRAP9,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP10,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP11,
      --  Select I2C0's TX FIFO as TREQ
      I2C0_TX,
      --  Select I2C0's RX FIFO as TREQ
      I2C0_RX,
      --  Select I2C1's TX FIFO as TREQ
      I2C1_TX,
      --  Select I2C1's RX FIFO as TREQ
      I2C1_RX,
      --  Select the ADC as TREQ
      ADC,
      --  Select the XIP Streaming FIFO as TREQ
      XIP_STREAM,
      --  Select XIP_QMITX as TREQ
      XIP_QMITX,
      --  Select XIP_QMIRX as TREQ
      XIP_QMIRX,
      --  Select HSTX as TREQ
      HSTX,
      --  Select CORESIGHT as TREQ
      CORESIGHT,
      --  Select SHA256 as TREQ
      SHA256,
      --  Select Timer 0 as TREQ
      TIMER0,
      --  Select Timer 1 as TREQ
      TIMER1,
      --  Select Timer 2 as TREQ (Optional)
      TIMER2,
      --  Select Timer 3 as TREQ (Optional)
      TIMER3,
      --  Permanent request, for unpaced transfers.
      PERMANENT)
     with Size => 6;
   for CH0_CTRL_TRIG_TREQ_SEL_Field use
     (PIO0_TX0 => 0,
      PIO0_TX1 => 1,
      PIO0_TX2 => 2,
      PIO0_TX3 => 3,
      PIO0_RX0 => 4,
      PIO0_RX1 => 5,
      PIO0_RX2 => 6,
      PIO0_RX3 => 7,
      PIO1_TX0 => 8,
      PIO1_TX1 => 9,
      PIO1_TX2 => 10,
      PIO1_TX3 => 11,
      PIO1_RX0 => 12,
      PIO1_RX1 => 13,
      PIO1_RX2 => 14,
      PIO1_RX3 => 15,
      PIO2_TX0 => 16,
      PIO2_TX1 => 17,
      PIO2_TX2 => 18,
      PIO2_TX3 => 19,
      PIO2_RX0 => 20,
      PIO2_RX1 => 21,
      PIO2_RX2 => 22,
      PIO2_RX3 => 23,
      SPI0_TX => 24,
      SPI0_RX => 25,
      SPI1_TX => 26,
      SPI1_RX => 27,
      UART0_TX => 28,
      UART0_RX => 29,
      UART1_TX => 30,
      UART1_RX => 31,
      PWM_WRAP0 => 32,
      PWM_WRAP1 => 33,
      PWM_WRAP2 => 34,
      PWM_WRAP3 => 35,
      PWM_WRAP4 => 36,
      PWM_WRAP5 => 37,
      PWM_WRAP6 => 38,
      PWM_WRAP7 => 39,
      PWM_WRAP8 => 40,
      PWM_WRAP9 => 41,
      PWM_WRAP10 => 42,
      PWM_WRAP11 => 43,
      I2C0_TX => 44,
      I2C0_RX => 45,
      I2C1_TX => 46,
      I2C1_RX => 47,
      ADC => 48,
      XIP_STREAM => 49,
      XIP_QMITX => 50,
      XIP_QMIRX => 51,
      HSTX => 52,
      CORESIGHT => 53,
      SHA256 => 54,
      TIMER0 => 59,
      TIMER1 => 60,
      TIMER2 => 61,
      TIMER3 => 62,
      PERMANENT => 63);

   --  DMA Channel 0 Control and Status
   type CH0_CTRL_TRIG_Register is record
      --  DMA Channel Enable. When 1, the channel will respond to triggering
      --  events, which will cause it to become BUSY and start transferring
      --  data. When 0, the channel will ignore triggers, stop issuing
      --  transfers, and pause the current transfer sequence (i.e. BUSY will
      --  remain high if already high)
      EN             : Boolean := False;
      --  HIGH_PRIORITY gives a channel preferential treatment in issue
      --  scheduling: in each scheduling round, all high priority channels are
      --  considered first, and then only a single low priority channel, before
      --  returning to the high priority channels. This only affects the order
      --  in which the DMA schedules channels. The DMA's bus priority is not
      --  changed. If the DMA is not saturated then a low priority channel will
      --  see no loss of throughput.
      HIGH_PRIORITY  : Boolean := False;
      --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
      --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
      DATA_SIZE      : CH0_CTRL_TRIG_DATA_SIZE_Field :=
                        RP2350_SVD.DMA.SIZE_BYTE;
      --  If 1, the read address increments with each transfer. If 0, each read
      --  is directed to the same, initial address. Generally this should be
      --  disabled for peripheral-to-memory transfers.
      INCR_READ      : Boolean := False;
      --  If 1, and INCR_READ is 1, the read address is decremented rather than
      --  incremented with each transfer. If 1, and INCR_READ is 0, this
      --  otherwise-unused combination causes the read address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_READ_REV  : Boolean := False;
      --  If 1, the write address increments with each transfer. If 0, each
      --  write is directed to the same, initial address. Generally this should
      --  be disabled for memory-to-peripheral transfers.
      INCR_WRITE     : Boolean := False;
      --  If 1, and INCR_WRITE is 1, the write address is decremented rather
      --  than incremented with each transfer. If 1, and INCR_WRITE is 0, this
      --  otherwise-unused combination causes the write address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_WRITE_REV : Boolean := False;
      --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
      --  the lower n bits of the address will change. This wraps the address
      --  on a (1 << n) byte boundary, facilitating access to naturally-aligned
      --  ring buffers. Ring sizes between 2 and 32768 bytes are possible. This
      --  can apply to either read or write addresses, based on value of
      --  RING_SEL.
      RING_SIZE      : CH0_CTRL_TRIG_RING_SIZE_Field :=
                        RP2350_SVD.DMA.RING_NONE;
      --  Select whether RING_SIZE applies to read or write addresses. If 0,
      --  read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1,
      --  write addresses are wrapped.
      RING_SEL       : Boolean := False;
      --  When this channel completes, it will trigger the channel indicated by
      --  CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_. Note this
      --  field resets to 0, so channels 1 and above will chain to channel 0 by
      --  default. Set this field to avoid this behaviour.
      CHAIN_TO       : CH0_CTRL_TRIG_CHAIN_TO_Field := 16#0#;
      --  Select a Transfer Request signal. The channel uses the transfer
      --  request signal to pace its data transfer rate. Sources for TREQ
      --  signals are internal (TIMERS) or external (DREQ, a Data Request from
      --  the system). 0x0 to 0x3a -> select DREQ n as TREQ
      TREQ_SEL       : CH0_CTRL_TRIG_TREQ_SEL_Field :=
                        RP2350_SVD.DMA.PIO0_TX0;
      --  In QUIET mode, the channel does not generate IRQs at the end of every
      --  transfer block. Instead, an IRQ is raised when NULL is written to a
      --  trigger register, indicating the end of a control block chain. This
      --  reduces the number of interrupts to be serviced by the CPU when
      --  transferring a DMA chain of many small control blocks.
      IRQ_QUIET      : Boolean := False;
      --  Apply byte-swap transformation to DMA data. For byte data, this has
      --  no effect. For halfword data, the two bytes of each halfword are
      --  swapped. For word data, the four bytes of each word are swapped to
      --  reverse order.
      BSWAP          : Boolean := False;
      --  If 1, this channel's data transfers are visible to the sniff
      --  hardware, and each transfer will advance the state of the checksum.
      --  This only applies if the sniff hardware is enabled, and has this
      --  channel selected. This allows checksum to be enabled or disabled on a
      --  per-control- block basis.
      SNIFF_EN       : Boolean := False;
      --  Read-only. This flag goes high when the channel starts a new transfer
      --  sequence, and low when the last transfer of that sequence completes.
      --  Clearing EN while BUSY is high pauses the channel, and BUSY will stay
      --  high while paused. To terminate a sequence early (and clear the BUSY
      --  flag), see CHAN_ABORT.
      BUSY           : Boolean := False;
      --  unspecified
      Reserved_27_28 : HAL.UInt2 := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a write bus error. Write one
      --  to clear. WRITE_ADDR shows the approximate address where the bus
      --  error was encountered (will not be earlier, or more than 5 transfers
      --  later)
      WRITE_ERROR    : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a read bus error. Write one
      --  to clear. READ_ADDR shows the approximate address where the bus error
      --  was encountered (will not be earlier, or more than 3 transfers later)
      READ_ERROR     : Boolean := False;
      --  Read-only. Logical OR of the READ_ERROR and WRITE_ERROR flags. The
      --  channel halts when it encounters any bus error, and always raises its
      --  channel IRQ flag.
      AHB_ERROR      : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH0_CTRL_TRIG_Register use record
      EN             at 0 range 0 .. 0;
      HIGH_PRIORITY  at 0 range 1 .. 1;
      DATA_SIZE      at 0 range 2 .. 3;
      INCR_READ      at 0 range 4 .. 4;
      INCR_READ_REV  at 0 range 5 .. 5;
      INCR_WRITE     at 0 range 6 .. 6;
      INCR_WRITE_REV at 0 range 7 .. 7;
      RING_SIZE      at 0 range 8 .. 11;
      RING_SEL       at 0 range 12 .. 12;
      CHAIN_TO       at 0 range 13 .. 16;
      TREQ_SEL       at 0 range 17 .. 22;
      IRQ_QUIET      at 0 range 23 .. 23;
      BSWAP          at 0 range 24 .. 24;
      SNIFF_EN       at 0 range 25 .. 25;
      BUSY           at 0 range 26 .. 26;
      Reserved_27_28 at 0 range 27 .. 28;
      WRITE_ERROR    at 0 range 29 .. 29;
      READ_ERROR     at 0 range 30 .. 30;
      AHB_ERROR      at 0 range 31 .. 31;
   end record;

   subtype CH1_TRANS_COUNT_COUNT_Field is HAL.UInt28;

   --  When MODE is 0x0, the transfer count decrements with each transfer until
   --  0, and then the channel triggers the next channel indicated by
   --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with each
   --  transfer until 0, and then the channel re-triggers itself, in addition
   --  to the trigger indicated by CTRL_CHAIN_TO. This is useful for e.g. an
   --  endless ring-buffer DMA with periodic interrupts. When MODE is 0xf, the
   --  transfer count does not decrement. The DMA channel performs an endless
   --  sequence of transfers, never triggering other channels or raising
   --  interrupts, until an ABORT is raised. All other values are reserved.
   type CH1_TRANS_COUNT_MODE_Field is
     (NORMAL,
      TRIGGER_SELF,
      ENDLESS)
     with Size => 4;
   for CH1_TRANS_COUNT_MODE_Field use
     (NORMAL => 0,
      TRIGGER_SELF => 1,
      ENDLESS => 15);

   --  DMA Channel 1 Transfer Count
   type CH1_TRANS_COUNT_Register is record
      --  28-bit transfer count (256 million transfers maximum). Program the
      --  number of bus transfers a channel will perform before halting. Note
      --  that, if transfers are larger than one byte in size, this is not
      --  equal to the number of bytes transferred (see CTRL_DATA_SIZE). When
      --  the channel is active, reading this register shows the number of
      --  transfers remaining, updating automatically each time a write
      --  transfer completes. Writing this register sets the RELOAD value for
      --  the transfer counter. Each time this channel is triggered, the RELOAD
      --  value is copied into the live transfer counter. The channel can be
      --  started multiple times, and will perform the same number of transfers
      --  each time, as programmed by most recent write. The RELOAD value can
      --  be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the
      --  written value is used immediately as the length of the new transfer
      --  sequence, as well as being written to RELOAD.
      COUNT : CH1_TRANS_COUNT_COUNT_Field := 16#0#;
      --  When MODE is 0x0, the transfer count decrements with each transfer
      --  until 0, and then the channel triggers the next channel indicated by
      --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with
      --  each transfer until 0, and then the channel re-triggers itself, in
      --  addition to the trigger indicated by CTRL_CHAIN_TO. This is useful
      --  for e.g. an endless ring-buffer DMA with periodic interrupts. When
      --  MODE is 0xf, the transfer count does not decrement. The DMA channel
      --  performs an endless sequence of transfers, never triggering other
      --  channels or raising interrupts, until an ABORT is raised. All other
      --  values are reserved.
      MODE  : CH1_TRANS_COUNT_MODE_Field := RP2350_SVD.DMA.NORMAL;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH1_TRANS_COUNT_Register use record
      COUNT at 0 range 0 .. 27;
      MODE  at 0 range 28 .. 31;
   end record;

   --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
   --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
   type CH1_CTRL_TRIG_DATA_SIZE_Field is
     (SIZE_BYTE,
      SIZE_HALFWORD,
      SIZE_WORD)
     with Size => 2;
   for CH1_CTRL_TRIG_DATA_SIZE_Field use
     (SIZE_BYTE => 0,
      SIZE_HALFWORD => 1,
      SIZE_WORD => 2);

   --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
   --  the lower n bits of the address will change. This wraps the address on a
   --  (1 << n) byte boundary, facilitating access to naturally-aligned ring
   --  buffers. Ring sizes between 2 and 32768 bytes are possible. This can
   --  apply to either read or write addresses, based on value of RING_SEL.
   type CH1_CTRL_TRIG_RING_SIZE_Field is
     (RING_NONE)
     with Size => 4;
   for CH1_CTRL_TRIG_RING_SIZE_Field use
     (RING_NONE => 0);

   subtype CH1_CTRL_TRIG_CHAIN_TO_Field is HAL.UInt4;

   --  Select a Transfer Request signal. The channel uses the transfer request
   --  signal to pace its data transfer rate. Sources for TREQ signals are
   --  internal (TIMERS) or external (DREQ, a Data Request from the system).
   --  0x0 to 0x3a -> select DREQ n as TREQ
   type CH1_CTRL_TRIG_TREQ_SEL_Field is
     (--  Select PIO0's TX FIFO 0 as TREQ
      PIO0_TX0,
      --  Select PIO0's TX FIFO 1 as TREQ
      PIO0_TX1,
      --  Select PIO0's TX FIFO 2 as TREQ
      PIO0_TX2,
      --  Select PIO0's TX FIFO 3 as TREQ
      PIO0_TX3,
      --  Select PIO0's RX FIFO 0 as TREQ
      PIO0_RX0,
      --  Select PIO0's RX FIFO 1 as TREQ
      PIO0_RX1,
      --  Select PIO0's RX FIFO 2 as TREQ
      PIO0_RX2,
      --  Select PIO0's RX FIFO 3 as TREQ
      PIO0_RX3,
      --  Select PIO1's TX FIFO 0 as TREQ
      PIO1_TX0,
      --  Select PIO1's TX FIFO 1 as TREQ
      PIO1_TX1,
      --  Select PIO1's TX FIFO 2 as TREQ
      PIO1_TX2,
      --  Select PIO1's TX FIFO 3 as TREQ
      PIO1_TX3,
      --  Select PIO1's RX FIFO 0 as TREQ
      PIO1_RX0,
      --  Select PIO1's RX FIFO 1 as TREQ
      PIO1_RX1,
      --  Select PIO1's RX FIFO 2 as TREQ
      PIO1_RX2,
      --  Select PIO1's RX FIFO 3 as TREQ
      PIO1_RX3,
      --  Select PIO2's TX FIFO 0 as TREQ
      PIO2_TX0,
      --  Select PIO2's TX FIFO 1 as TREQ
      PIO2_TX1,
      --  Select PIO2's TX FIFO 2 as TREQ
      PIO2_TX2,
      --  Select PIO2's TX FIFO 3 as TREQ
      PIO2_TX3,
      --  Select PIO2's RX FIFO 0 as TREQ
      PIO2_RX0,
      --  Select PIO2's RX FIFO 1 as TREQ
      PIO2_RX1,
      --  Select PIO2's RX FIFO 2 as TREQ
      PIO2_RX2,
      --  Select PIO2's RX FIFO 3 as TREQ
      PIO2_RX3,
      --  Select SPI0's TX FIFO as TREQ
      SPI0_TX,
      --  Select SPI0's RX FIFO as TREQ
      SPI0_RX,
      --  Select SPI1's TX FIFO as TREQ
      SPI1_TX,
      --  Select SPI1's RX FIFO as TREQ
      SPI1_RX,
      --  Select UART0's TX FIFO as TREQ
      UART0_TX,
      --  Select UART0's RX FIFO as TREQ
      UART0_RX,
      --  Select UART1's TX FIFO as TREQ
      UART1_TX,
      --  Select UART1's RX FIFO as TREQ
      UART1_RX,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP0,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP1,
      --  Select PWM Counter 2's Wrap Value as TREQ
      PWM_WRAP2,
      --  Select PWM Counter 3's Wrap Value as TREQ
      PWM_WRAP3,
      --  Select PWM Counter 4's Wrap Value as TREQ
      PWM_WRAP4,
      --  Select PWM Counter 5's Wrap Value as TREQ
      PWM_WRAP5,
      --  Select PWM Counter 6's Wrap Value as TREQ
      PWM_WRAP6,
      --  Select PWM Counter 7's Wrap Value as TREQ
      PWM_WRAP7,
      --  Select PWM Counter 8's Wrap Value as TREQ
      PWM_WRAP8,
      --  Select PWM Counter 9's Wrap Value as TREQ
      PWM_WRAP9,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP10,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP11,
      --  Select I2C0's TX FIFO as TREQ
      I2C0_TX,
      --  Select I2C0's RX FIFO as TREQ
      I2C0_RX,
      --  Select I2C1's TX FIFO as TREQ
      I2C1_TX,
      --  Select I2C1's RX FIFO as TREQ
      I2C1_RX,
      --  Select the ADC as TREQ
      ADC,
      --  Select the XIP Streaming FIFO as TREQ
      XIP_STREAM,
      --  Select XIP_QMITX as TREQ
      XIP_QMITX,
      --  Select XIP_QMIRX as TREQ
      XIP_QMIRX,
      --  Select HSTX as TREQ
      HSTX,
      --  Select CORESIGHT as TREQ
      CORESIGHT,
      --  Select SHA256 as TREQ
      SHA256,
      --  Select Timer 0 as TREQ
      TIMER0,
      --  Select Timer 1 as TREQ
      TIMER1,
      --  Select Timer 2 as TREQ (Optional)
      TIMER2,
      --  Select Timer 3 as TREQ (Optional)
      TIMER3,
      --  Permanent request, for unpaced transfers.
      PERMANENT)
     with Size => 6;
   for CH1_CTRL_TRIG_TREQ_SEL_Field use
     (PIO0_TX0 => 0,
      PIO0_TX1 => 1,
      PIO0_TX2 => 2,
      PIO0_TX3 => 3,
      PIO0_RX0 => 4,
      PIO0_RX1 => 5,
      PIO0_RX2 => 6,
      PIO0_RX3 => 7,
      PIO1_TX0 => 8,
      PIO1_TX1 => 9,
      PIO1_TX2 => 10,
      PIO1_TX3 => 11,
      PIO1_RX0 => 12,
      PIO1_RX1 => 13,
      PIO1_RX2 => 14,
      PIO1_RX3 => 15,
      PIO2_TX0 => 16,
      PIO2_TX1 => 17,
      PIO2_TX2 => 18,
      PIO2_TX3 => 19,
      PIO2_RX0 => 20,
      PIO2_RX1 => 21,
      PIO2_RX2 => 22,
      PIO2_RX3 => 23,
      SPI0_TX => 24,
      SPI0_RX => 25,
      SPI1_TX => 26,
      SPI1_RX => 27,
      UART0_TX => 28,
      UART0_RX => 29,
      UART1_TX => 30,
      UART1_RX => 31,
      PWM_WRAP0 => 32,
      PWM_WRAP1 => 33,
      PWM_WRAP2 => 34,
      PWM_WRAP3 => 35,
      PWM_WRAP4 => 36,
      PWM_WRAP5 => 37,
      PWM_WRAP6 => 38,
      PWM_WRAP7 => 39,
      PWM_WRAP8 => 40,
      PWM_WRAP9 => 41,
      PWM_WRAP10 => 42,
      PWM_WRAP11 => 43,
      I2C0_TX => 44,
      I2C0_RX => 45,
      I2C1_TX => 46,
      I2C1_RX => 47,
      ADC => 48,
      XIP_STREAM => 49,
      XIP_QMITX => 50,
      XIP_QMIRX => 51,
      HSTX => 52,
      CORESIGHT => 53,
      SHA256 => 54,
      TIMER0 => 59,
      TIMER1 => 60,
      TIMER2 => 61,
      TIMER3 => 62,
      PERMANENT => 63);

   --  DMA Channel 1 Control and Status
   type CH1_CTRL_TRIG_Register is record
      --  DMA Channel Enable. When 1, the channel will respond to triggering
      --  events, which will cause it to become BUSY and start transferring
      --  data. When 0, the channel will ignore triggers, stop issuing
      --  transfers, and pause the current transfer sequence (i.e. BUSY will
      --  remain high if already high)
      EN             : Boolean := False;
      --  HIGH_PRIORITY gives a channel preferential treatment in issue
      --  scheduling: in each scheduling round, all high priority channels are
      --  considered first, and then only a single low priority channel, before
      --  returning to the high priority channels. This only affects the order
      --  in which the DMA schedules channels. The DMA's bus priority is not
      --  changed. If the DMA is not saturated then a low priority channel will
      --  see no loss of throughput.
      HIGH_PRIORITY  : Boolean := False;
      --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
      --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
      DATA_SIZE      : CH1_CTRL_TRIG_DATA_SIZE_Field :=
                        RP2350_SVD.DMA.SIZE_BYTE;
      --  If 1, the read address increments with each transfer. If 0, each read
      --  is directed to the same, initial address. Generally this should be
      --  disabled for peripheral-to-memory transfers.
      INCR_READ      : Boolean := False;
      --  If 1, and INCR_READ is 1, the read address is decremented rather than
      --  incremented with each transfer. If 1, and INCR_READ is 0, this
      --  otherwise-unused combination causes the read address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_READ_REV  : Boolean := False;
      --  If 1, the write address increments with each transfer. If 0, each
      --  write is directed to the same, initial address. Generally this should
      --  be disabled for memory-to-peripheral transfers.
      INCR_WRITE     : Boolean := False;
      --  If 1, and INCR_WRITE is 1, the write address is decremented rather
      --  than incremented with each transfer. If 1, and INCR_WRITE is 0, this
      --  otherwise-unused combination causes the write address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_WRITE_REV : Boolean := False;
      --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
      --  the lower n bits of the address will change. This wraps the address
      --  on a (1 << n) byte boundary, facilitating access to naturally-aligned
      --  ring buffers. Ring sizes between 2 and 32768 bytes are possible. This
      --  can apply to either read or write addresses, based on value of
      --  RING_SEL.
      RING_SIZE      : CH1_CTRL_TRIG_RING_SIZE_Field :=
                        RP2350_SVD.DMA.RING_NONE;
      --  Select whether RING_SIZE applies to read or write addresses. If 0,
      --  read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1,
      --  write addresses are wrapped.
      RING_SEL       : Boolean := False;
      --  When this channel completes, it will trigger the channel indicated by
      --  CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_. Note this
      --  field resets to 0, so channels 1 and above will chain to channel 0 by
      --  default. Set this field to avoid this behaviour.
      CHAIN_TO       : CH1_CTRL_TRIG_CHAIN_TO_Field := 16#0#;
      --  Select a Transfer Request signal. The channel uses the transfer
      --  request signal to pace its data transfer rate. Sources for TREQ
      --  signals are internal (TIMERS) or external (DREQ, a Data Request from
      --  the system). 0x0 to 0x3a -> select DREQ n as TREQ
      TREQ_SEL       : CH1_CTRL_TRIG_TREQ_SEL_Field :=
                        RP2350_SVD.DMA.PIO0_TX0;
      --  In QUIET mode, the channel does not generate IRQs at the end of every
      --  transfer block. Instead, an IRQ is raised when NULL is written to a
      --  trigger register, indicating the end of a control block chain. This
      --  reduces the number of interrupts to be serviced by the CPU when
      --  transferring a DMA chain of many small control blocks.
      IRQ_QUIET      : Boolean := False;
      --  Apply byte-swap transformation to DMA data. For byte data, this has
      --  no effect. For halfword data, the two bytes of each halfword are
      --  swapped. For word data, the four bytes of each word are swapped to
      --  reverse order.
      BSWAP          : Boolean := False;
      --  If 1, this channel's data transfers are visible to the sniff
      --  hardware, and each transfer will advance the state of the checksum.
      --  This only applies if the sniff hardware is enabled, and has this
      --  channel selected. This allows checksum to be enabled or disabled on a
      --  per-control- block basis.
      SNIFF_EN       : Boolean := False;
      --  Read-only. This flag goes high when the channel starts a new transfer
      --  sequence, and low when the last transfer of that sequence completes.
      --  Clearing EN while BUSY is high pauses the channel, and BUSY will stay
      --  high while paused. To terminate a sequence early (and clear the BUSY
      --  flag), see CHAN_ABORT.
      BUSY           : Boolean := False;
      --  unspecified
      Reserved_27_28 : HAL.UInt2 := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a write bus error. Write one
      --  to clear. WRITE_ADDR shows the approximate address where the bus
      --  error was encountered (will not be earlier, or more than 5 transfers
      --  later)
      WRITE_ERROR    : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a read bus error. Write one
      --  to clear. READ_ADDR shows the approximate address where the bus error
      --  was encountered (will not be earlier, or more than 3 transfers later)
      READ_ERROR     : Boolean := False;
      --  Read-only. Logical OR of the READ_ERROR and WRITE_ERROR flags. The
      --  channel halts when it encounters any bus error, and always raises its
      --  channel IRQ flag.
      AHB_ERROR      : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH1_CTRL_TRIG_Register use record
      EN             at 0 range 0 .. 0;
      HIGH_PRIORITY  at 0 range 1 .. 1;
      DATA_SIZE      at 0 range 2 .. 3;
      INCR_READ      at 0 range 4 .. 4;
      INCR_READ_REV  at 0 range 5 .. 5;
      INCR_WRITE     at 0 range 6 .. 6;
      INCR_WRITE_REV at 0 range 7 .. 7;
      RING_SIZE      at 0 range 8 .. 11;
      RING_SEL       at 0 range 12 .. 12;
      CHAIN_TO       at 0 range 13 .. 16;
      TREQ_SEL       at 0 range 17 .. 22;
      IRQ_QUIET      at 0 range 23 .. 23;
      BSWAP          at 0 range 24 .. 24;
      SNIFF_EN       at 0 range 25 .. 25;
      BUSY           at 0 range 26 .. 26;
      Reserved_27_28 at 0 range 27 .. 28;
      WRITE_ERROR    at 0 range 29 .. 29;
      READ_ERROR     at 0 range 30 .. 30;
      AHB_ERROR      at 0 range 31 .. 31;
   end record;

   subtype CH2_TRANS_COUNT_COUNT_Field is HAL.UInt28;

   --  When MODE is 0x0, the transfer count decrements with each transfer until
   --  0, and then the channel triggers the next channel indicated by
   --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with each
   --  transfer until 0, and then the channel re-triggers itself, in addition
   --  to the trigger indicated by CTRL_CHAIN_TO. This is useful for e.g. an
   --  endless ring-buffer DMA with periodic interrupts. When MODE is 0xf, the
   --  transfer count does not decrement. The DMA channel performs an endless
   --  sequence of transfers, never triggering other channels or raising
   --  interrupts, until an ABORT is raised. All other values are reserved.
   type CH2_TRANS_COUNT_MODE_Field is
     (NORMAL,
      TRIGGER_SELF,
      ENDLESS)
     with Size => 4;
   for CH2_TRANS_COUNT_MODE_Field use
     (NORMAL => 0,
      TRIGGER_SELF => 1,
      ENDLESS => 15);

   --  DMA Channel 2 Transfer Count
   type CH2_TRANS_COUNT_Register is record
      --  28-bit transfer count (256 million transfers maximum). Program the
      --  number of bus transfers a channel will perform before halting. Note
      --  that, if transfers are larger than one byte in size, this is not
      --  equal to the number of bytes transferred (see CTRL_DATA_SIZE). When
      --  the channel is active, reading this register shows the number of
      --  transfers remaining, updating automatically each time a write
      --  transfer completes. Writing this register sets the RELOAD value for
      --  the transfer counter. Each time this channel is triggered, the RELOAD
      --  value is copied into the live transfer counter. The channel can be
      --  started multiple times, and will perform the same number of transfers
      --  each time, as programmed by most recent write. The RELOAD value can
      --  be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the
      --  written value is used immediately as the length of the new transfer
      --  sequence, as well as being written to RELOAD.
      COUNT : CH2_TRANS_COUNT_COUNT_Field := 16#0#;
      --  When MODE is 0x0, the transfer count decrements with each transfer
      --  until 0, and then the channel triggers the next channel indicated by
      --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with
      --  each transfer until 0, and then the channel re-triggers itself, in
      --  addition to the trigger indicated by CTRL_CHAIN_TO. This is useful
      --  for e.g. an endless ring-buffer DMA with periodic interrupts. When
      --  MODE is 0xf, the transfer count does not decrement. The DMA channel
      --  performs an endless sequence of transfers, never triggering other
      --  channels or raising interrupts, until an ABORT is raised. All other
      --  values are reserved.
      MODE  : CH2_TRANS_COUNT_MODE_Field := RP2350_SVD.DMA.NORMAL;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH2_TRANS_COUNT_Register use record
      COUNT at 0 range 0 .. 27;
      MODE  at 0 range 28 .. 31;
   end record;

   --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
   --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
   type CH2_CTRL_TRIG_DATA_SIZE_Field is
     (SIZE_BYTE,
      SIZE_HALFWORD,
      SIZE_WORD)
     with Size => 2;
   for CH2_CTRL_TRIG_DATA_SIZE_Field use
     (SIZE_BYTE => 0,
      SIZE_HALFWORD => 1,
      SIZE_WORD => 2);

   --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
   --  the lower n bits of the address will change. This wraps the address on a
   --  (1 << n) byte boundary, facilitating access to naturally-aligned ring
   --  buffers. Ring sizes between 2 and 32768 bytes are possible. This can
   --  apply to either read or write addresses, based on value of RING_SEL.
   type CH2_CTRL_TRIG_RING_SIZE_Field is
     (RING_NONE)
     with Size => 4;
   for CH2_CTRL_TRIG_RING_SIZE_Field use
     (RING_NONE => 0);

   subtype CH2_CTRL_TRIG_CHAIN_TO_Field is HAL.UInt4;

   --  Select a Transfer Request signal. The channel uses the transfer request
   --  signal to pace its data transfer rate. Sources for TREQ signals are
   --  internal (TIMERS) or external (DREQ, a Data Request from the system).
   --  0x0 to 0x3a -> select DREQ n as TREQ
   type CH2_CTRL_TRIG_TREQ_SEL_Field is
     (--  Select PIO0's TX FIFO 0 as TREQ
      PIO0_TX0,
      --  Select PIO0's TX FIFO 1 as TREQ
      PIO0_TX1,
      --  Select PIO0's TX FIFO 2 as TREQ
      PIO0_TX2,
      --  Select PIO0's TX FIFO 3 as TREQ
      PIO0_TX3,
      --  Select PIO0's RX FIFO 0 as TREQ
      PIO0_RX0,
      --  Select PIO0's RX FIFO 1 as TREQ
      PIO0_RX1,
      --  Select PIO0's RX FIFO 2 as TREQ
      PIO0_RX2,
      --  Select PIO0's RX FIFO 3 as TREQ
      PIO0_RX3,
      --  Select PIO1's TX FIFO 0 as TREQ
      PIO1_TX0,
      --  Select PIO1's TX FIFO 1 as TREQ
      PIO1_TX1,
      --  Select PIO1's TX FIFO 2 as TREQ
      PIO1_TX2,
      --  Select PIO1's TX FIFO 3 as TREQ
      PIO1_TX3,
      --  Select PIO1's RX FIFO 0 as TREQ
      PIO1_RX0,
      --  Select PIO1's RX FIFO 1 as TREQ
      PIO1_RX1,
      --  Select PIO1's RX FIFO 2 as TREQ
      PIO1_RX2,
      --  Select PIO1's RX FIFO 3 as TREQ
      PIO1_RX3,
      --  Select PIO2's TX FIFO 0 as TREQ
      PIO2_TX0,
      --  Select PIO2's TX FIFO 1 as TREQ
      PIO2_TX1,
      --  Select PIO2's TX FIFO 2 as TREQ
      PIO2_TX2,
      --  Select PIO2's TX FIFO 3 as TREQ
      PIO2_TX3,
      --  Select PIO2's RX FIFO 0 as TREQ
      PIO2_RX0,
      --  Select PIO2's RX FIFO 1 as TREQ
      PIO2_RX1,
      --  Select PIO2's RX FIFO 2 as TREQ
      PIO2_RX2,
      --  Select PIO2's RX FIFO 3 as TREQ
      PIO2_RX3,
      --  Select SPI0's TX FIFO as TREQ
      SPI0_TX,
      --  Select SPI0's RX FIFO as TREQ
      SPI0_RX,
      --  Select SPI1's TX FIFO as TREQ
      SPI1_TX,
      --  Select SPI1's RX FIFO as TREQ
      SPI1_RX,
      --  Select UART0's TX FIFO as TREQ
      UART0_TX,
      --  Select UART0's RX FIFO as TREQ
      UART0_RX,
      --  Select UART1's TX FIFO as TREQ
      UART1_TX,
      --  Select UART1's RX FIFO as TREQ
      UART1_RX,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP0,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP1,
      --  Select PWM Counter 2's Wrap Value as TREQ
      PWM_WRAP2,
      --  Select PWM Counter 3's Wrap Value as TREQ
      PWM_WRAP3,
      --  Select PWM Counter 4's Wrap Value as TREQ
      PWM_WRAP4,
      --  Select PWM Counter 5's Wrap Value as TREQ
      PWM_WRAP5,
      --  Select PWM Counter 6's Wrap Value as TREQ
      PWM_WRAP6,
      --  Select PWM Counter 7's Wrap Value as TREQ
      PWM_WRAP7,
      --  Select PWM Counter 8's Wrap Value as TREQ
      PWM_WRAP8,
      --  Select PWM Counter 9's Wrap Value as TREQ
      PWM_WRAP9,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP10,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP11,
      --  Select I2C0's TX FIFO as TREQ
      I2C0_TX,
      --  Select I2C0's RX FIFO as TREQ
      I2C0_RX,
      --  Select I2C1's TX FIFO as TREQ
      I2C1_TX,
      --  Select I2C1's RX FIFO as TREQ
      I2C1_RX,
      --  Select the ADC as TREQ
      ADC,
      --  Select the XIP Streaming FIFO as TREQ
      XIP_STREAM,
      --  Select XIP_QMITX as TREQ
      XIP_QMITX,
      --  Select XIP_QMIRX as TREQ
      XIP_QMIRX,
      --  Select HSTX as TREQ
      HSTX,
      --  Select CORESIGHT as TREQ
      CORESIGHT,
      --  Select SHA256 as TREQ
      SHA256,
      --  Select Timer 0 as TREQ
      TIMER0,
      --  Select Timer 1 as TREQ
      TIMER1,
      --  Select Timer 2 as TREQ (Optional)
      TIMER2,
      --  Select Timer 3 as TREQ (Optional)
      TIMER3,
      --  Permanent request, for unpaced transfers.
      PERMANENT)
     with Size => 6;
   for CH2_CTRL_TRIG_TREQ_SEL_Field use
     (PIO0_TX0 => 0,
      PIO0_TX1 => 1,
      PIO0_TX2 => 2,
      PIO0_TX3 => 3,
      PIO0_RX0 => 4,
      PIO0_RX1 => 5,
      PIO0_RX2 => 6,
      PIO0_RX3 => 7,
      PIO1_TX0 => 8,
      PIO1_TX1 => 9,
      PIO1_TX2 => 10,
      PIO1_TX3 => 11,
      PIO1_RX0 => 12,
      PIO1_RX1 => 13,
      PIO1_RX2 => 14,
      PIO1_RX3 => 15,
      PIO2_TX0 => 16,
      PIO2_TX1 => 17,
      PIO2_TX2 => 18,
      PIO2_TX3 => 19,
      PIO2_RX0 => 20,
      PIO2_RX1 => 21,
      PIO2_RX2 => 22,
      PIO2_RX3 => 23,
      SPI0_TX => 24,
      SPI0_RX => 25,
      SPI1_TX => 26,
      SPI1_RX => 27,
      UART0_TX => 28,
      UART0_RX => 29,
      UART1_TX => 30,
      UART1_RX => 31,
      PWM_WRAP0 => 32,
      PWM_WRAP1 => 33,
      PWM_WRAP2 => 34,
      PWM_WRAP3 => 35,
      PWM_WRAP4 => 36,
      PWM_WRAP5 => 37,
      PWM_WRAP6 => 38,
      PWM_WRAP7 => 39,
      PWM_WRAP8 => 40,
      PWM_WRAP9 => 41,
      PWM_WRAP10 => 42,
      PWM_WRAP11 => 43,
      I2C0_TX => 44,
      I2C0_RX => 45,
      I2C1_TX => 46,
      I2C1_RX => 47,
      ADC => 48,
      XIP_STREAM => 49,
      XIP_QMITX => 50,
      XIP_QMIRX => 51,
      HSTX => 52,
      CORESIGHT => 53,
      SHA256 => 54,
      TIMER0 => 59,
      TIMER1 => 60,
      TIMER2 => 61,
      TIMER3 => 62,
      PERMANENT => 63);

   --  DMA Channel 2 Control and Status
   type CH2_CTRL_TRIG_Register is record
      --  DMA Channel Enable. When 1, the channel will respond to triggering
      --  events, which will cause it to become BUSY and start transferring
      --  data. When 0, the channel will ignore triggers, stop issuing
      --  transfers, and pause the current transfer sequence (i.e. BUSY will
      --  remain high if already high)
      EN             : Boolean := False;
      --  HIGH_PRIORITY gives a channel preferential treatment in issue
      --  scheduling: in each scheduling round, all high priority channels are
      --  considered first, and then only a single low priority channel, before
      --  returning to the high priority channels. This only affects the order
      --  in which the DMA schedules channels. The DMA's bus priority is not
      --  changed. If the DMA is not saturated then a low priority channel will
      --  see no loss of throughput.
      HIGH_PRIORITY  : Boolean := False;
      --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
      --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
      DATA_SIZE      : CH2_CTRL_TRIG_DATA_SIZE_Field :=
                        RP2350_SVD.DMA.SIZE_BYTE;
      --  If 1, the read address increments with each transfer. If 0, each read
      --  is directed to the same, initial address. Generally this should be
      --  disabled for peripheral-to-memory transfers.
      INCR_READ      : Boolean := False;
      --  If 1, and INCR_READ is 1, the read address is decremented rather than
      --  incremented with each transfer. If 1, and INCR_READ is 0, this
      --  otherwise-unused combination causes the read address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_READ_REV  : Boolean := False;
      --  If 1, the write address increments with each transfer. If 0, each
      --  write is directed to the same, initial address. Generally this should
      --  be disabled for memory-to-peripheral transfers.
      INCR_WRITE     : Boolean := False;
      --  If 1, and INCR_WRITE is 1, the write address is decremented rather
      --  than incremented with each transfer. If 1, and INCR_WRITE is 0, this
      --  otherwise-unused combination causes the write address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_WRITE_REV : Boolean := False;
      --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
      --  the lower n bits of the address will change. This wraps the address
      --  on a (1 << n) byte boundary, facilitating access to naturally-aligned
      --  ring buffers. Ring sizes between 2 and 32768 bytes are possible. This
      --  can apply to either read or write addresses, based on value of
      --  RING_SEL.
      RING_SIZE      : CH2_CTRL_TRIG_RING_SIZE_Field :=
                        RP2350_SVD.DMA.RING_NONE;
      --  Select whether RING_SIZE applies to read or write addresses. If 0,
      --  read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1,
      --  write addresses are wrapped.
      RING_SEL       : Boolean := False;
      --  When this channel completes, it will trigger the channel indicated by
      --  CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_. Note this
      --  field resets to 0, so channels 1 and above will chain to channel 0 by
      --  default. Set this field to avoid this behaviour.
      CHAIN_TO       : CH2_CTRL_TRIG_CHAIN_TO_Field := 16#0#;
      --  Select a Transfer Request signal. The channel uses the transfer
      --  request signal to pace its data transfer rate. Sources for TREQ
      --  signals are internal (TIMERS) or external (DREQ, a Data Request from
      --  the system). 0x0 to 0x3a -> select DREQ n as TREQ
      TREQ_SEL       : CH2_CTRL_TRIG_TREQ_SEL_Field :=
                        RP2350_SVD.DMA.PIO0_TX0;
      --  In QUIET mode, the channel does not generate IRQs at the end of every
      --  transfer block. Instead, an IRQ is raised when NULL is written to a
      --  trigger register, indicating the end of a control block chain. This
      --  reduces the number of interrupts to be serviced by the CPU when
      --  transferring a DMA chain of many small control blocks.
      IRQ_QUIET      : Boolean := False;
      --  Apply byte-swap transformation to DMA data. For byte data, this has
      --  no effect. For halfword data, the two bytes of each halfword are
      --  swapped. For word data, the four bytes of each word are swapped to
      --  reverse order.
      BSWAP          : Boolean := False;
      --  If 1, this channel's data transfers are visible to the sniff
      --  hardware, and each transfer will advance the state of the checksum.
      --  This only applies if the sniff hardware is enabled, and has this
      --  channel selected. This allows checksum to be enabled or disabled on a
      --  per-control- block basis.
      SNIFF_EN       : Boolean := False;
      --  Read-only. This flag goes high when the channel starts a new transfer
      --  sequence, and low when the last transfer of that sequence completes.
      --  Clearing EN while BUSY is high pauses the channel, and BUSY will stay
      --  high while paused. To terminate a sequence early (and clear the BUSY
      --  flag), see CHAN_ABORT.
      BUSY           : Boolean := False;
      --  unspecified
      Reserved_27_28 : HAL.UInt2 := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a write bus error. Write one
      --  to clear. WRITE_ADDR shows the approximate address where the bus
      --  error was encountered (will not be earlier, or more than 5 transfers
      --  later)
      WRITE_ERROR    : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a read bus error. Write one
      --  to clear. READ_ADDR shows the approximate address where the bus error
      --  was encountered (will not be earlier, or more than 3 transfers later)
      READ_ERROR     : Boolean := False;
      --  Read-only. Logical OR of the READ_ERROR and WRITE_ERROR flags. The
      --  channel halts when it encounters any bus error, and always raises its
      --  channel IRQ flag.
      AHB_ERROR      : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH2_CTRL_TRIG_Register use record
      EN             at 0 range 0 .. 0;
      HIGH_PRIORITY  at 0 range 1 .. 1;
      DATA_SIZE      at 0 range 2 .. 3;
      INCR_READ      at 0 range 4 .. 4;
      INCR_READ_REV  at 0 range 5 .. 5;
      INCR_WRITE     at 0 range 6 .. 6;
      INCR_WRITE_REV at 0 range 7 .. 7;
      RING_SIZE      at 0 range 8 .. 11;
      RING_SEL       at 0 range 12 .. 12;
      CHAIN_TO       at 0 range 13 .. 16;
      TREQ_SEL       at 0 range 17 .. 22;
      IRQ_QUIET      at 0 range 23 .. 23;
      BSWAP          at 0 range 24 .. 24;
      SNIFF_EN       at 0 range 25 .. 25;
      BUSY           at 0 range 26 .. 26;
      Reserved_27_28 at 0 range 27 .. 28;
      WRITE_ERROR    at 0 range 29 .. 29;
      READ_ERROR     at 0 range 30 .. 30;
      AHB_ERROR      at 0 range 31 .. 31;
   end record;

   subtype CH3_TRANS_COUNT_COUNT_Field is HAL.UInt28;

   --  When MODE is 0x0, the transfer count decrements with each transfer until
   --  0, and then the channel triggers the next channel indicated by
   --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with each
   --  transfer until 0, and then the channel re-triggers itself, in addition
   --  to the trigger indicated by CTRL_CHAIN_TO. This is useful for e.g. an
   --  endless ring-buffer DMA with periodic interrupts. When MODE is 0xf, the
   --  transfer count does not decrement. The DMA channel performs an endless
   --  sequence of transfers, never triggering other channels or raising
   --  interrupts, until an ABORT is raised. All other values are reserved.
   type CH3_TRANS_COUNT_MODE_Field is
     (NORMAL,
      TRIGGER_SELF,
      ENDLESS)
     with Size => 4;
   for CH3_TRANS_COUNT_MODE_Field use
     (NORMAL => 0,
      TRIGGER_SELF => 1,
      ENDLESS => 15);

   --  DMA Channel 3 Transfer Count
   type CH3_TRANS_COUNT_Register is record
      --  28-bit transfer count (256 million transfers maximum). Program the
      --  number of bus transfers a channel will perform before halting. Note
      --  that, if transfers are larger than one byte in size, this is not
      --  equal to the number of bytes transferred (see CTRL_DATA_SIZE). When
      --  the channel is active, reading this register shows the number of
      --  transfers remaining, updating automatically each time a write
      --  transfer completes. Writing this register sets the RELOAD value for
      --  the transfer counter. Each time this channel is triggered, the RELOAD
      --  value is copied into the live transfer counter. The channel can be
      --  started multiple times, and will perform the same number of transfers
      --  each time, as programmed by most recent write. The RELOAD value can
      --  be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the
      --  written value is used immediately as the length of the new transfer
      --  sequence, as well as being written to RELOAD.
      COUNT : CH3_TRANS_COUNT_COUNT_Field := 16#0#;
      --  When MODE is 0x0, the transfer count decrements with each transfer
      --  until 0, and then the channel triggers the next channel indicated by
      --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with
      --  each transfer until 0, and then the channel re-triggers itself, in
      --  addition to the trigger indicated by CTRL_CHAIN_TO. This is useful
      --  for e.g. an endless ring-buffer DMA with periodic interrupts. When
      --  MODE is 0xf, the transfer count does not decrement. The DMA channel
      --  performs an endless sequence of transfers, never triggering other
      --  channels or raising interrupts, until an ABORT is raised. All other
      --  values are reserved.
      MODE  : CH3_TRANS_COUNT_MODE_Field := RP2350_SVD.DMA.NORMAL;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH3_TRANS_COUNT_Register use record
      COUNT at 0 range 0 .. 27;
      MODE  at 0 range 28 .. 31;
   end record;

   --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
   --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
   type CH3_CTRL_TRIG_DATA_SIZE_Field is
     (SIZE_BYTE,
      SIZE_HALFWORD,
      SIZE_WORD)
     with Size => 2;
   for CH3_CTRL_TRIG_DATA_SIZE_Field use
     (SIZE_BYTE => 0,
      SIZE_HALFWORD => 1,
      SIZE_WORD => 2);

   --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
   --  the lower n bits of the address will change. This wraps the address on a
   --  (1 << n) byte boundary, facilitating access to naturally-aligned ring
   --  buffers. Ring sizes between 2 and 32768 bytes are possible. This can
   --  apply to either read or write addresses, based on value of RING_SEL.
   type CH3_CTRL_TRIG_RING_SIZE_Field is
     (RING_NONE)
     with Size => 4;
   for CH3_CTRL_TRIG_RING_SIZE_Field use
     (RING_NONE => 0);

   subtype CH3_CTRL_TRIG_CHAIN_TO_Field is HAL.UInt4;

   --  Select a Transfer Request signal. The channel uses the transfer request
   --  signal to pace its data transfer rate. Sources for TREQ signals are
   --  internal (TIMERS) or external (DREQ, a Data Request from the system).
   --  0x0 to 0x3a -> select DREQ n as TREQ
   type CH3_CTRL_TRIG_TREQ_SEL_Field is
     (--  Select PIO0's TX FIFO 0 as TREQ
      PIO0_TX0,
      --  Select PIO0's TX FIFO 1 as TREQ
      PIO0_TX1,
      --  Select PIO0's TX FIFO 2 as TREQ
      PIO0_TX2,
      --  Select PIO0's TX FIFO 3 as TREQ
      PIO0_TX3,
      --  Select PIO0's RX FIFO 0 as TREQ
      PIO0_RX0,
      --  Select PIO0's RX FIFO 1 as TREQ
      PIO0_RX1,
      --  Select PIO0's RX FIFO 2 as TREQ
      PIO0_RX2,
      --  Select PIO0's RX FIFO 3 as TREQ
      PIO0_RX3,
      --  Select PIO1's TX FIFO 0 as TREQ
      PIO1_TX0,
      --  Select PIO1's TX FIFO 1 as TREQ
      PIO1_TX1,
      --  Select PIO1's TX FIFO 2 as TREQ
      PIO1_TX2,
      --  Select PIO1's TX FIFO 3 as TREQ
      PIO1_TX3,
      --  Select PIO1's RX FIFO 0 as TREQ
      PIO1_RX0,
      --  Select PIO1's RX FIFO 1 as TREQ
      PIO1_RX1,
      --  Select PIO1's RX FIFO 2 as TREQ
      PIO1_RX2,
      --  Select PIO1's RX FIFO 3 as TREQ
      PIO1_RX3,
      --  Select PIO2's TX FIFO 0 as TREQ
      PIO2_TX0,
      --  Select PIO2's TX FIFO 1 as TREQ
      PIO2_TX1,
      --  Select PIO2's TX FIFO 2 as TREQ
      PIO2_TX2,
      --  Select PIO2's TX FIFO 3 as TREQ
      PIO2_TX3,
      --  Select PIO2's RX FIFO 0 as TREQ
      PIO2_RX0,
      --  Select PIO2's RX FIFO 1 as TREQ
      PIO2_RX1,
      --  Select PIO2's RX FIFO 2 as TREQ
      PIO2_RX2,
      --  Select PIO2's RX FIFO 3 as TREQ
      PIO2_RX3,
      --  Select SPI0's TX FIFO as TREQ
      SPI0_TX,
      --  Select SPI0's RX FIFO as TREQ
      SPI0_RX,
      --  Select SPI1's TX FIFO as TREQ
      SPI1_TX,
      --  Select SPI1's RX FIFO as TREQ
      SPI1_RX,
      --  Select UART0's TX FIFO as TREQ
      UART0_TX,
      --  Select UART0's RX FIFO as TREQ
      UART0_RX,
      --  Select UART1's TX FIFO as TREQ
      UART1_TX,
      --  Select UART1's RX FIFO as TREQ
      UART1_RX,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP0,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP1,
      --  Select PWM Counter 2's Wrap Value as TREQ
      PWM_WRAP2,
      --  Select PWM Counter 3's Wrap Value as TREQ
      PWM_WRAP3,
      --  Select PWM Counter 4's Wrap Value as TREQ
      PWM_WRAP4,
      --  Select PWM Counter 5's Wrap Value as TREQ
      PWM_WRAP5,
      --  Select PWM Counter 6's Wrap Value as TREQ
      PWM_WRAP6,
      --  Select PWM Counter 7's Wrap Value as TREQ
      PWM_WRAP7,
      --  Select PWM Counter 8's Wrap Value as TREQ
      PWM_WRAP8,
      --  Select PWM Counter 9's Wrap Value as TREQ
      PWM_WRAP9,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP10,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP11,
      --  Select I2C0's TX FIFO as TREQ
      I2C0_TX,
      --  Select I2C0's RX FIFO as TREQ
      I2C0_RX,
      --  Select I2C1's TX FIFO as TREQ
      I2C1_TX,
      --  Select I2C1's RX FIFO as TREQ
      I2C1_RX,
      --  Select the ADC as TREQ
      ADC,
      --  Select the XIP Streaming FIFO as TREQ
      XIP_STREAM,
      --  Select XIP_QMITX as TREQ
      XIP_QMITX,
      --  Select XIP_QMIRX as TREQ
      XIP_QMIRX,
      --  Select HSTX as TREQ
      HSTX,
      --  Select CORESIGHT as TREQ
      CORESIGHT,
      --  Select SHA256 as TREQ
      SHA256,
      --  Select Timer 0 as TREQ
      TIMER0,
      --  Select Timer 1 as TREQ
      TIMER1,
      --  Select Timer 2 as TREQ (Optional)
      TIMER2,
      --  Select Timer 3 as TREQ (Optional)
      TIMER3,
      --  Permanent request, for unpaced transfers.
      PERMANENT)
     with Size => 6;
   for CH3_CTRL_TRIG_TREQ_SEL_Field use
     (PIO0_TX0 => 0,
      PIO0_TX1 => 1,
      PIO0_TX2 => 2,
      PIO0_TX3 => 3,
      PIO0_RX0 => 4,
      PIO0_RX1 => 5,
      PIO0_RX2 => 6,
      PIO0_RX3 => 7,
      PIO1_TX0 => 8,
      PIO1_TX1 => 9,
      PIO1_TX2 => 10,
      PIO1_TX3 => 11,
      PIO1_RX0 => 12,
      PIO1_RX1 => 13,
      PIO1_RX2 => 14,
      PIO1_RX3 => 15,
      PIO2_TX0 => 16,
      PIO2_TX1 => 17,
      PIO2_TX2 => 18,
      PIO2_TX3 => 19,
      PIO2_RX0 => 20,
      PIO2_RX1 => 21,
      PIO2_RX2 => 22,
      PIO2_RX3 => 23,
      SPI0_TX => 24,
      SPI0_RX => 25,
      SPI1_TX => 26,
      SPI1_RX => 27,
      UART0_TX => 28,
      UART0_RX => 29,
      UART1_TX => 30,
      UART1_RX => 31,
      PWM_WRAP0 => 32,
      PWM_WRAP1 => 33,
      PWM_WRAP2 => 34,
      PWM_WRAP3 => 35,
      PWM_WRAP4 => 36,
      PWM_WRAP5 => 37,
      PWM_WRAP6 => 38,
      PWM_WRAP7 => 39,
      PWM_WRAP8 => 40,
      PWM_WRAP9 => 41,
      PWM_WRAP10 => 42,
      PWM_WRAP11 => 43,
      I2C0_TX => 44,
      I2C0_RX => 45,
      I2C1_TX => 46,
      I2C1_RX => 47,
      ADC => 48,
      XIP_STREAM => 49,
      XIP_QMITX => 50,
      XIP_QMIRX => 51,
      HSTX => 52,
      CORESIGHT => 53,
      SHA256 => 54,
      TIMER0 => 59,
      TIMER1 => 60,
      TIMER2 => 61,
      TIMER3 => 62,
      PERMANENT => 63);

   --  DMA Channel 3 Control and Status
   type CH3_CTRL_TRIG_Register is record
      --  DMA Channel Enable. When 1, the channel will respond to triggering
      --  events, which will cause it to become BUSY and start transferring
      --  data. When 0, the channel will ignore triggers, stop issuing
      --  transfers, and pause the current transfer sequence (i.e. BUSY will
      --  remain high if already high)
      EN             : Boolean := False;
      --  HIGH_PRIORITY gives a channel preferential treatment in issue
      --  scheduling: in each scheduling round, all high priority channels are
      --  considered first, and then only a single low priority channel, before
      --  returning to the high priority channels. This only affects the order
      --  in which the DMA schedules channels. The DMA's bus priority is not
      --  changed. If the DMA is not saturated then a low priority channel will
      --  see no loss of throughput.
      HIGH_PRIORITY  : Boolean := False;
      --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
      --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
      DATA_SIZE      : CH3_CTRL_TRIG_DATA_SIZE_Field :=
                        RP2350_SVD.DMA.SIZE_BYTE;
      --  If 1, the read address increments with each transfer. If 0, each read
      --  is directed to the same, initial address. Generally this should be
      --  disabled for peripheral-to-memory transfers.
      INCR_READ      : Boolean := False;
      --  If 1, and INCR_READ is 1, the read address is decremented rather than
      --  incremented with each transfer. If 1, and INCR_READ is 0, this
      --  otherwise-unused combination causes the read address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_READ_REV  : Boolean := False;
      --  If 1, the write address increments with each transfer. If 0, each
      --  write is directed to the same, initial address. Generally this should
      --  be disabled for memory-to-peripheral transfers.
      INCR_WRITE     : Boolean := False;
      --  If 1, and INCR_WRITE is 1, the write address is decremented rather
      --  than incremented with each transfer. If 1, and INCR_WRITE is 0, this
      --  otherwise-unused combination causes the write address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_WRITE_REV : Boolean := False;
      --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
      --  the lower n bits of the address will change. This wraps the address
      --  on a (1 << n) byte boundary, facilitating access to naturally-aligned
      --  ring buffers. Ring sizes between 2 and 32768 bytes are possible. This
      --  can apply to either read or write addresses, based on value of
      --  RING_SEL.
      RING_SIZE      : CH3_CTRL_TRIG_RING_SIZE_Field :=
                        RP2350_SVD.DMA.RING_NONE;
      --  Select whether RING_SIZE applies to read or write addresses. If 0,
      --  read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1,
      --  write addresses are wrapped.
      RING_SEL       : Boolean := False;
      --  When this channel completes, it will trigger the channel indicated by
      --  CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_. Note this
      --  field resets to 0, so channels 1 and above will chain to channel 0 by
      --  default. Set this field to avoid this behaviour.
      CHAIN_TO       : CH3_CTRL_TRIG_CHAIN_TO_Field := 16#0#;
      --  Select a Transfer Request signal. The channel uses the transfer
      --  request signal to pace its data transfer rate. Sources for TREQ
      --  signals are internal (TIMERS) or external (DREQ, a Data Request from
      --  the system). 0x0 to 0x3a -> select DREQ n as TREQ
      TREQ_SEL       : CH3_CTRL_TRIG_TREQ_SEL_Field :=
                        RP2350_SVD.DMA.PIO0_TX0;
      --  In QUIET mode, the channel does not generate IRQs at the end of every
      --  transfer block. Instead, an IRQ is raised when NULL is written to a
      --  trigger register, indicating the end of a control block chain. This
      --  reduces the number of interrupts to be serviced by the CPU when
      --  transferring a DMA chain of many small control blocks.
      IRQ_QUIET      : Boolean := False;
      --  Apply byte-swap transformation to DMA data. For byte data, this has
      --  no effect. For halfword data, the two bytes of each halfword are
      --  swapped. For word data, the four bytes of each word are swapped to
      --  reverse order.
      BSWAP          : Boolean := False;
      --  If 1, this channel's data transfers are visible to the sniff
      --  hardware, and each transfer will advance the state of the checksum.
      --  This only applies if the sniff hardware is enabled, and has this
      --  channel selected. This allows checksum to be enabled or disabled on a
      --  per-control- block basis.
      SNIFF_EN       : Boolean := False;
      --  Read-only. This flag goes high when the channel starts a new transfer
      --  sequence, and low when the last transfer of that sequence completes.
      --  Clearing EN while BUSY is high pauses the channel, and BUSY will stay
      --  high while paused. To terminate a sequence early (and clear the BUSY
      --  flag), see CHAN_ABORT.
      BUSY           : Boolean := False;
      --  unspecified
      Reserved_27_28 : HAL.UInt2 := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a write bus error. Write one
      --  to clear. WRITE_ADDR shows the approximate address where the bus
      --  error was encountered (will not be earlier, or more than 5 transfers
      --  later)
      WRITE_ERROR    : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a read bus error. Write one
      --  to clear. READ_ADDR shows the approximate address where the bus error
      --  was encountered (will not be earlier, or more than 3 transfers later)
      READ_ERROR     : Boolean := False;
      --  Read-only. Logical OR of the READ_ERROR and WRITE_ERROR flags. The
      --  channel halts when it encounters any bus error, and always raises its
      --  channel IRQ flag.
      AHB_ERROR      : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH3_CTRL_TRIG_Register use record
      EN             at 0 range 0 .. 0;
      HIGH_PRIORITY  at 0 range 1 .. 1;
      DATA_SIZE      at 0 range 2 .. 3;
      INCR_READ      at 0 range 4 .. 4;
      INCR_READ_REV  at 0 range 5 .. 5;
      INCR_WRITE     at 0 range 6 .. 6;
      INCR_WRITE_REV at 0 range 7 .. 7;
      RING_SIZE      at 0 range 8 .. 11;
      RING_SEL       at 0 range 12 .. 12;
      CHAIN_TO       at 0 range 13 .. 16;
      TREQ_SEL       at 0 range 17 .. 22;
      IRQ_QUIET      at 0 range 23 .. 23;
      BSWAP          at 0 range 24 .. 24;
      SNIFF_EN       at 0 range 25 .. 25;
      BUSY           at 0 range 26 .. 26;
      Reserved_27_28 at 0 range 27 .. 28;
      WRITE_ERROR    at 0 range 29 .. 29;
      READ_ERROR     at 0 range 30 .. 30;
      AHB_ERROR      at 0 range 31 .. 31;
   end record;

   subtype CH4_TRANS_COUNT_COUNT_Field is HAL.UInt28;

   --  When MODE is 0x0, the transfer count decrements with each transfer until
   --  0, and then the channel triggers the next channel indicated by
   --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with each
   --  transfer until 0, and then the channel re-triggers itself, in addition
   --  to the trigger indicated by CTRL_CHAIN_TO. This is useful for e.g. an
   --  endless ring-buffer DMA with periodic interrupts. When MODE is 0xf, the
   --  transfer count does not decrement. The DMA channel performs an endless
   --  sequence of transfers, never triggering other channels or raising
   --  interrupts, until an ABORT is raised. All other values are reserved.
   type CH4_TRANS_COUNT_MODE_Field is
     (NORMAL,
      TRIGGER_SELF,
      ENDLESS)
     with Size => 4;
   for CH4_TRANS_COUNT_MODE_Field use
     (NORMAL => 0,
      TRIGGER_SELF => 1,
      ENDLESS => 15);

   --  DMA Channel 4 Transfer Count
   type CH4_TRANS_COUNT_Register is record
      --  28-bit transfer count (256 million transfers maximum). Program the
      --  number of bus transfers a channel will perform before halting. Note
      --  that, if transfers are larger than one byte in size, this is not
      --  equal to the number of bytes transferred (see CTRL_DATA_SIZE). When
      --  the channel is active, reading this register shows the number of
      --  transfers remaining, updating automatically each time a write
      --  transfer completes. Writing this register sets the RELOAD value for
      --  the transfer counter. Each time this channel is triggered, the RELOAD
      --  value is copied into the live transfer counter. The channel can be
      --  started multiple times, and will perform the same number of transfers
      --  each time, as programmed by most recent write. The RELOAD value can
      --  be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the
      --  written value is used immediately as the length of the new transfer
      --  sequence, as well as being written to RELOAD.
      COUNT : CH4_TRANS_COUNT_COUNT_Field := 16#0#;
      --  When MODE is 0x0, the transfer count decrements with each transfer
      --  until 0, and then the channel triggers the next channel indicated by
      --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with
      --  each transfer until 0, and then the channel re-triggers itself, in
      --  addition to the trigger indicated by CTRL_CHAIN_TO. This is useful
      --  for e.g. an endless ring-buffer DMA with periodic interrupts. When
      --  MODE is 0xf, the transfer count does not decrement. The DMA channel
      --  performs an endless sequence of transfers, never triggering other
      --  channels or raising interrupts, until an ABORT is raised. All other
      --  values are reserved.
      MODE  : CH4_TRANS_COUNT_MODE_Field := RP2350_SVD.DMA.NORMAL;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH4_TRANS_COUNT_Register use record
      COUNT at 0 range 0 .. 27;
      MODE  at 0 range 28 .. 31;
   end record;

   --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
   --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
   type CH4_CTRL_TRIG_DATA_SIZE_Field is
     (SIZE_BYTE,
      SIZE_HALFWORD,
      SIZE_WORD)
     with Size => 2;
   for CH4_CTRL_TRIG_DATA_SIZE_Field use
     (SIZE_BYTE => 0,
      SIZE_HALFWORD => 1,
      SIZE_WORD => 2);

   --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
   --  the lower n bits of the address will change. This wraps the address on a
   --  (1 << n) byte boundary, facilitating access to naturally-aligned ring
   --  buffers. Ring sizes between 2 and 32768 bytes are possible. This can
   --  apply to either read or write addresses, based on value of RING_SEL.
   type CH4_CTRL_TRIG_RING_SIZE_Field is
     (RING_NONE)
     with Size => 4;
   for CH4_CTRL_TRIG_RING_SIZE_Field use
     (RING_NONE => 0);

   subtype CH4_CTRL_TRIG_CHAIN_TO_Field is HAL.UInt4;

   --  Select a Transfer Request signal. The channel uses the transfer request
   --  signal to pace its data transfer rate. Sources for TREQ signals are
   --  internal (TIMERS) or external (DREQ, a Data Request from the system).
   --  0x0 to 0x3a -> select DREQ n as TREQ
   type CH4_CTRL_TRIG_TREQ_SEL_Field is
     (--  Select PIO0's TX FIFO 0 as TREQ
      PIO0_TX0,
      --  Select PIO0's TX FIFO 1 as TREQ
      PIO0_TX1,
      --  Select PIO0's TX FIFO 2 as TREQ
      PIO0_TX2,
      --  Select PIO0's TX FIFO 3 as TREQ
      PIO0_TX3,
      --  Select PIO0's RX FIFO 0 as TREQ
      PIO0_RX0,
      --  Select PIO0's RX FIFO 1 as TREQ
      PIO0_RX1,
      --  Select PIO0's RX FIFO 2 as TREQ
      PIO0_RX2,
      --  Select PIO0's RX FIFO 3 as TREQ
      PIO0_RX3,
      --  Select PIO1's TX FIFO 0 as TREQ
      PIO1_TX0,
      --  Select PIO1's TX FIFO 1 as TREQ
      PIO1_TX1,
      --  Select PIO1's TX FIFO 2 as TREQ
      PIO1_TX2,
      --  Select PIO1's TX FIFO 3 as TREQ
      PIO1_TX3,
      --  Select PIO1's RX FIFO 0 as TREQ
      PIO1_RX0,
      --  Select PIO1's RX FIFO 1 as TREQ
      PIO1_RX1,
      --  Select PIO1's RX FIFO 2 as TREQ
      PIO1_RX2,
      --  Select PIO1's RX FIFO 3 as TREQ
      PIO1_RX3,
      --  Select PIO2's TX FIFO 0 as TREQ
      PIO2_TX0,
      --  Select PIO2's TX FIFO 1 as TREQ
      PIO2_TX1,
      --  Select PIO2's TX FIFO 2 as TREQ
      PIO2_TX2,
      --  Select PIO2's TX FIFO 3 as TREQ
      PIO2_TX3,
      --  Select PIO2's RX FIFO 0 as TREQ
      PIO2_RX0,
      --  Select PIO2's RX FIFO 1 as TREQ
      PIO2_RX1,
      --  Select PIO2's RX FIFO 2 as TREQ
      PIO2_RX2,
      --  Select PIO2's RX FIFO 3 as TREQ
      PIO2_RX3,
      --  Select SPI0's TX FIFO as TREQ
      SPI0_TX,
      --  Select SPI0's RX FIFO as TREQ
      SPI0_RX,
      --  Select SPI1's TX FIFO as TREQ
      SPI1_TX,
      --  Select SPI1's RX FIFO as TREQ
      SPI1_RX,
      --  Select UART0's TX FIFO as TREQ
      UART0_TX,
      --  Select UART0's RX FIFO as TREQ
      UART0_RX,
      --  Select UART1's TX FIFO as TREQ
      UART1_TX,
      --  Select UART1's RX FIFO as TREQ
      UART1_RX,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP0,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP1,
      --  Select PWM Counter 2's Wrap Value as TREQ
      PWM_WRAP2,
      --  Select PWM Counter 3's Wrap Value as TREQ
      PWM_WRAP3,
      --  Select PWM Counter 4's Wrap Value as TREQ
      PWM_WRAP4,
      --  Select PWM Counter 5's Wrap Value as TREQ
      PWM_WRAP5,
      --  Select PWM Counter 6's Wrap Value as TREQ
      PWM_WRAP6,
      --  Select PWM Counter 7's Wrap Value as TREQ
      PWM_WRAP7,
      --  Select PWM Counter 8's Wrap Value as TREQ
      PWM_WRAP8,
      --  Select PWM Counter 9's Wrap Value as TREQ
      PWM_WRAP9,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP10,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP11,
      --  Select I2C0's TX FIFO as TREQ
      I2C0_TX,
      --  Select I2C0's RX FIFO as TREQ
      I2C0_RX,
      --  Select I2C1's TX FIFO as TREQ
      I2C1_TX,
      --  Select I2C1's RX FIFO as TREQ
      I2C1_RX,
      --  Select the ADC as TREQ
      ADC,
      --  Select the XIP Streaming FIFO as TREQ
      XIP_STREAM,
      --  Select XIP_QMITX as TREQ
      XIP_QMITX,
      --  Select XIP_QMIRX as TREQ
      XIP_QMIRX,
      --  Select HSTX as TREQ
      HSTX,
      --  Select CORESIGHT as TREQ
      CORESIGHT,
      --  Select SHA256 as TREQ
      SHA256,
      --  Select Timer 0 as TREQ
      TIMER0,
      --  Select Timer 1 as TREQ
      TIMER1,
      --  Select Timer 2 as TREQ (Optional)
      TIMER2,
      --  Select Timer 3 as TREQ (Optional)
      TIMER3,
      --  Permanent request, for unpaced transfers.
      PERMANENT)
     with Size => 6;
   for CH4_CTRL_TRIG_TREQ_SEL_Field use
     (PIO0_TX0 => 0,
      PIO0_TX1 => 1,
      PIO0_TX2 => 2,
      PIO0_TX3 => 3,
      PIO0_RX0 => 4,
      PIO0_RX1 => 5,
      PIO0_RX2 => 6,
      PIO0_RX3 => 7,
      PIO1_TX0 => 8,
      PIO1_TX1 => 9,
      PIO1_TX2 => 10,
      PIO1_TX3 => 11,
      PIO1_RX0 => 12,
      PIO1_RX1 => 13,
      PIO1_RX2 => 14,
      PIO1_RX3 => 15,
      PIO2_TX0 => 16,
      PIO2_TX1 => 17,
      PIO2_TX2 => 18,
      PIO2_TX3 => 19,
      PIO2_RX0 => 20,
      PIO2_RX1 => 21,
      PIO2_RX2 => 22,
      PIO2_RX3 => 23,
      SPI0_TX => 24,
      SPI0_RX => 25,
      SPI1_TX => 26,
      SPI1_RX => 27,
      UART0_TX => 28,
      UART0_RX => 29,
      UART1_TX => 30,
      UART1_RX => 31,
      PWM_WRAP0 => 32,
      PWM_WRAP1 => 33,
      PWM_WRAP2 => 34,
      PWM_WRAP3 => 35,
      PWM_WRAP4 => 36,
      PWM_WRAP5 => 37,
      PWM_WRAP6 => 38,
      PWM_WRAP7 => 39,
      PWM_WRAP8 => 40,
      PWM_WRAP9 => 41,
      PWM_WRAP10 => 42,
      PWM_WRAP11 => 43,
      I2C0_TX => 44,
      I2C0_RX => 45,
      I2C1_TX => 46,
      I2C1_RX => 47,
      ADC => 48,
      XIP_STREAM => 49,
      XIP_QMITX => 50,
      XIP_QMIRX => 51,
      HSTX => 52,
      CORESIGHT => 53,
      SHA256 => 54,
      TIMER0 => 59,
      TIMER1 => 60,
      TIMER2 => 61,
      TIMER3 => 62,
      PERMANENT => 63);

   --  DMA Channel 4 Control and Status
   type CH4_CTRL_TRIG_Register is record
      --  DMA Channel Enable. When 1, the channel will respond to triggering
      --  events, which will cause it to become BUSY and start transferring
      --  data. When 0, the channel will ignore triggers, stop issuing
      --  transfers, and pause the current transfer sequence (i.e. BUSY will
      --  remain high if already high)
      EN             : Boolean := False;
      --  HIGH_PRIORITY gives a channel preferential treatment in issue
      --  scheduling: in each scheduling round, all high priority channels are
      --  considered first, and then only a single low priority channel, before
      --  returning to the high priority channels. This only affects the order
      --  in which the DMA schedules channels. The DMA's bus priority is not
      --  changed. If the DMA is not saturated then a low priority channel will
      --  see no loss of throughput.
      HIGH_PRIORITY  : Boolean := False;
      --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
      --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
      DATA_SIZE      : CH4_CTRL_TRIG_DATA_SIZE_Field :=
                        RP2350_SVD.DMA.SIZE_BYTE;
      --  If 1, the read address increments with each transfer. If 0, each read
      --  is directed to the same, initial address. Generally this should be
      --  disabled for peripheral-to-memory transfers.
      INCR_READ      : Boolean := False;
      --  If 1, and INCR_READ is 1, the read address is decremented rather than
      --  incremented with each transfer. If 1, and INCR_READ is 0, this
      --  otherwise-unused combination causes the read address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_READ_REV  : Boolean := False;
      --  If 1, the write address increments with each transfer. If 0, each
      --  write is directed to the same, initial address. Generally this should
      --  be disabled for memory-to-peripheral transfers.
      INCR_WRITE     : Boolean := False;
      --  If 1, and INCR_WRITE is 1, the write address is decremented rather
      --  than incremented with each transfer. If 1, and INCR_WRITE is 0, this
      --  otherwise-unused combination causes the write address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_WRITE_REV : Boolean := False;
      --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
      --  the lower n bits of the address will change. This wraps the address
      --  on a (1 << n) byte boundary, facilitating access to naturally-aligned
      --  ring buffers. Ring sizes between 2 and 32768 bytes are possible. This
      --  can apply to either read or write addresses, based on value of
      --  RING_SEL.
      RING_SIZE      : CH4_CTRL_TRIG_RING_SIZE_Field :=
                        RP2350_SVD.DMA.RING_NONE;
      --  Select whether RING_SIZE applies to read or write addresses. If 0,
      --  read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1,
      --  write addresses are wrapped.
      RING_SEL       : Boolean := False;
      --  When this channel completes, it will trigger the channel indicated by
      --  CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_. Note this
      --  field resets to 0, so channels 1 and above will chain to channel 0 by
      --  default. Set this field to avoid this behaviour.
      CHAIN_TO       : CH4_CTRL_TRIG_CHAIN_TO_Field := 16#0#;
      --  Select a Transfer Request signal. The channel uses the transfer
      --  request signal to pace its data transfer rate. Sources for TREQ
      --  signals are internal (TIMERS) or external (DREQ, a Data Request from
      --  the system). 0x0 to 0x3a -> select DREQ n as TREQ
      TREQ_SEL       : CH4_CTRL_TRIG_TREQ_SEL_Field :=
                        RP2350_SVD.DMA.PIO0_TX0;
      --  In QUIET mode, the channel does not generate IRQs at the end of every
      --  transfer block. Instead, an IRQ is raised when NULL is written to a
      --  trigger register, indicating the end of a control block chain. This
      --  reduces the number of interrupts to be serviced by the CPU when
      --  transferring a DMA chain of many small control blocks.
      IRQ_QUIET      : Boolean := False;
      --  Apply byte-swap transformation to DMA data. For byte data, this has
      --  no effect. For halfword data, the two bytes of each halfword are
      --  swapped. For word data, the four bytes of each word are swapped to
      --  reverse order.
      BSWAP          : Boolean := False;
      --  If 1, this channel's data transfers are visible to the sniff
      --  hardware, and each transfer will advance the state of the checksum.
      --  This only applies if the sniff hardware is enabled, and has this
      --  channel selected. This allows checksum to be enabled or disabled on a
      --  per-control- block basis.
      SNIFF_EN       : Boolean := False;
      --  Read-only. This flag goes high when the channel starts a new transfer
      --  sequence, and low when the last transfer of that sequence completes.
      --  Clearing EN while BUSY is high pauses the channel, and BUSY will stay
      --  high while paused. To terminate a sequence early (and clear the BUSY
      --  flag), see CHAN_ABORT.
      BUSY           : Boolean := False;
      --  unspecified
      Reserved_27_28 : HAL.UInt2 := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a write bus error. Write one
      --  to clear. WRITE_ADDR shows the approximate address where the bus
      --  error was encountered (will not be earlier, or more than 5 transfers
      --  later)
      WRITE_ERROR    : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a read bus error. Write one
      --  to clear. READ_ADDR shows the approximate address where the bus error
      --  was encountered (will not be earlier, or more than 3 transfers later)
      READ_ERROR     : Boolean := False;
      --  Read-only. Logical OR of the READ_ERROR and WRITE_ERROR flags. The
      --  channel halts when it encounters any bus error, and always raises its
      --  channel IRQ flag.
      AHB_ERROR      : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH4_CTRL_TRIG_Register use record
      EN             at 0 range 0 .. 0;
      HIGH_PRIORITY  at 0 range 1 .. 1;
      DATA_SIZE      at 0 range 2 .. 3;
      INCR_READ      at 0 range 4 .. 4;
      INCR_READ_REV  at 0 range 5 .. 5;
      INCR_WRITE     at 0 range 6 .. 6;
      INCR_WRITE_REV at 0 range 7 .. 7;
      RING_SIZE      at 0 range 8 .. 11;
      RING_SEL       at 0 range 12 .. 12;
      CHAIN_TO       at 0 range 13 .. 16;
      TREQ_SEL       at 0 range 17 .. 22;
      IRQ_QUIET      at 0 range 23 .. 23;
      BSWAP          at 0 range 24 .. 24;
      SNIFF_EN       at 0 range 25 .. 25;
      BUSY           at 0 range 26 .. 26;
      Reserved_27_28 at 0 range 27 .. 28;
      WRITE_ERROR    at 0 range 29 .. 29;
      READ_ERROR     at 0 range 30 .. 30;
      AHB_ERROR      at 0 range 31 .. 31;
   end record;

   subtype CH5_TRANS_COUNT_COUNT_Field is HAL.UInt28;

   --  When MODE is 0x0, the transfer count decrements with each transfer until
   --  0, and then the channel triggers the next channel indicated by
   --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with each
   --  transfer until 0, and then the channel re-triggers itself, in addition
   --  to the trigger indicated by CTRL_CHAIN_TO. This is useful for e.g. an
   --  endless ring-buffer DMA with periodic interrupts. When MODE is 0xf, the
   --  transfer count does not decrement. The DMA channel performs an endless
   --  sequence of transfers, never triggering other channels or raising
   --  interrupts, until an ABORT is raised. All other values are reserved.
   type CH5_TRANS_COUNT_MODE_Field is
     (NORMAL,
      TRIGGER_SELF,
      ENDLESS)
     with Size => 4;
   for CH5_TRANS_COUNT_MODE_Field use
     (NORMAL => 0,
      TRIGGER_SELF => 1,
      ENDLESS => 15);

   --  DMA Channel 5 Transfer Count
   type CH5_TRANS_COUNT_Register is record
      --  28-bit transfer count (256 million transfers maximum). Program the
      --  number of bus transfers a channel will perform before halting. Note
      --  that, if transfers are larger than one byte in size, this is not
      --  equal to the number of bytes transferred (see CTRL_DATA_SIZE). When
      --  the channel is active, reading this register shows the number of
      --  transfers remaining, updating automatically each time a write
      --  transfer completes. Writing this register sets the RELOAD value for
      --  the transfer counter. Each time this channel is triggered, the RELOAD
      --  value is copied into the live transfer counter. The channel can be
      --  started multiple times, and will perform the same number of transfers
      --  each time, as programmed by most recent write. The RELOAD value can
      --  be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the
      --  written value is used immediately as the length of the new transfer
      --  sequence, as well as being written to RELOAD.
      COUNT : CH5_TRANS_COUNT_COUNT_Field := 16#0#;
      --  When MODE is 0x0, the transfer count decrements with each transfer
      --  until 0, and then the channel triggers the next channel indicated by
      --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with
      --  each transfer until 0, and then the channel re-triggers itself, in
      --  addition to the trigger indicated by CTRL_CHAIN_TO. This is useful
      --  for e.g. an endless ring-buffer DMA with periodic interrupts. When
      --  MODE is 0xf, the transfer count does not decrement. The DMA channel
      --  performs an endless sequence of transfers, never triggering other
      --  channels or raising interrupts, until an ABORT is raised. All other
      --  values are reserved.
      MODE  : CH5_TRANS_COUNT_MODE_Field := RP2350_SVD.DMA.NORMAL;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH5_TRANS_COUNT_Register use record
      COUNT at 0 range 0 .. 27;
      MODE  at 0 range 28 .. 31;
   end record;

   --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
   --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
   type CH5_CTRL_TRIG_DATA_SIZE_Field is
     (SIZE_BYTE,
      SIZE_HALFWORD,
      SIZE_WORD)
     with Size => 2;
   for CH5_CTRL_TRIG_DATA_SIZE_Field use
     (SIZE_BYTE => 0,
      SIZE_HALFWORD => 1,
      SIZE_WORD => 2);

   --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
   --  the lower n bits of the address will change. This wraps the address on a
   --  (1 << n) byte boundary, facilitating access to naturally-aligned ring
   --  buffers. Ring sizes between 2 and 32768 bytes are possible. This can
   --  apply to either read or write addresses, based on value of RING_SEL.
   type CH5_CTRL_TRIG_RING_SIZE_Field is
     (RING_NONE)
     with Size => 4;
   for CH5_CTRL_TRIG_RING_SIZE_Field use
     (RING_NONE => 0);

   subtype CH5_CTRL_TRIG_CHAIN_TO_Field is HAL.UInt4;

   --  Select a Transfer Request signal. The channel uses the transfer request
   --  signal to pace its data transfer rate. Sources for TREQ signals are
   --  internal (TIMERS) or external (DREQ, a Data Request from the system).
   --  0x0 to 0x3a -> select DREQ n as TREQ
   type CH5_CTRL_TRIG_TREQ_SEL_Field is
     (--  Select PIO0's TX FIFO 0 as TREQ
      PIO0_TX0,
      --  Select PIO0's TX FIFO 1 as TREQ
      PIO0_TX1,
      --  Select PIO0's TX FIFO 2 as TREQ
      PIO0_TX2,
      --  Select PIO0's TX FIFO 3 as TREQ
      PIO0_TX3,
      --  Select PIO0's RX FIFO 0 as TREQ
      PIO0_RX0,
      --  Select PIO0's RX FIFO 1 as TREQ
      PIO0_RX1,
      --  Select PIO0's RX FIFO 2 as TREQ
      PIO0_RX2,
      --  Select PIO0's RX FIFO 3 as TREQ
      PIO0_RX3,
      --  Select PIO1's TX FIFO 0 as TREQ
      PIO1_TX0,
      --  Select PIO1's TX FIFO 1 as TREQ
      PIO1_TX1,
      --  Select PIO1's TX FIFO 2 as TREQ
      PIO1_TX2,
      --  Select PIO1's TX FIFO 3 as TREQ
      PIO1_TX3,
      --  Select PIO1's RX FIFO 0 as TREQ
      PIO1_RX0,
      --  Select PIO1's RX FIFO 1 as TREQ
      PIO1_RX1,
      --  Select PIO1's RX FIFO 2 as TREQ
      PIO1_RX2,
      --  Select PIO1's RX FIFO 3 as TREQ
      PIO1_RX3,
      --  Select PIO2's TX FIFO 0 as TREQ
      PIO2_TX0,
      --  Select PIO2's TX FIFO 1 as TREQ
      PIO2_TX1,
      --  Select PIO2's TX FIFO 2 as TREQ
      PIO2_TX2,
      --  Select PIO2's TX FIFO 3 as TREQ
      PIO2_TX3,
      --  Select PIO2's RX FIFO 0 as TREQ
      PIO2_RX0,
      --  Select PIO2's RX FIFO 1 as TREQ
      PIO2_RX1,
      --  Select PIO2's RX FIFO 2 as TREQ
      PIO2_RX2,
      --  Select PIO2's RX FIFO 3 as TREQ
      PIO2_RX3,
      --  Select SPI0's TX FIFO as TREQ
      SPI0_TX,
      --  Select SPI0's RX FIFO as TREQ
      SPI0_RX,
      --  Select SPI1's TX FIFO as TREQ
      SPI1_TX,
      --  Select SPI1's RX FIFO as TREQ
      SPI1_RX,
      --  Select UART0's TX FIFO as TREQ
      UART0_TX,
      --  Select UART0's RX FIFO as TREQ
      UART0_RX,
      --  Select UART1's TX FIFO as TREQ
      UART1_TX,
      --  Select UART1's RX FIFO as TREQ
      UART1_RX,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP0,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP1,
      --  Select PWM Counter 2's Wrap Value as TREQ
      PWM_WRAP2,
      --  Select PWM Counter 3's Wrap Value as TREQ
      PWM_WRAP3,
      --  Select PWM Counter 4's Wrap Value as TREQ
      PWM_WRAP4,
      --  Select PWM Counter 5's Wrap Value as TREQ
      PWM_WRAP5,
      --  Select PWM Counter 6's Wrap Value as TREQ
      PWM_WRAP6,
      --  Select PWM Counter 7's Wrap Value as TREQ
      PWM_WRAP7,
      --  Select PWM Counter 8's Wrap Value as TREQ
      PWM_WRAP8,
      --  Select PWM Counter 9's Wrap Value as TREQ
      PWM_WRAP9,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP10,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP11,
      --  Select I2C0's TX FIFO as TREQ
      I2C0_TX,
      --  Select I2C0's RX FIFO as TREQ
      I2C0_RX,
      --  Select I2C1's TX FIFO as TREQ
      I2C1_TX,
      --  Select I2C1's RX FIFO as TREQ
      I2C1_RX,
      --  Select the ADC as TREQ
      ADC,
      --  Select the XIP Streaming FIFO as TREQ
      XIP_STREAM,
      --  Select XIP_QMITX as TREQ
      XIP_QMITX,
      --  Select XIP_QMIRX as TREQ
      XIP_QMIRX,
      --  Select HSTX as TREQ
      HSTX,
      --  Select CORESIGHT as TREQ
      CORESIGHT,
      --  Select SHA256 as TREQ
      SHA256,
      --  Select Timer 0 as TREQ
      TIMER0,
      --  Select Timer 1 as TREQ
      TIMER1,
      --  Select Timer 2 as TREQ (Optional)
      TIMER2,
      --  Select Timer 3 as TREQ (Optional)
      TIMER3,
      --  Permanent request, for unpaced transfers.
      PERMANENT)
     with Size => 6;
   for CH5_CTRL_TRIG_TREQ_SEL_Field use
     (PIO0_TX0 => 0,
      PIO0_TX1 => 1,
      PIO0_TX2 => 2,
      PIO0_TX3 => 3,
      PIO0_RX0 => 4,
      PIO0_RX1 => 5,
      PIO0_RX2 => 6,
      PIO0_RX3 => 7,
      PIO1_TX0 => 8,
      PIO1_TX1 => 9,
      PIO1_TX2 => 10,
      PIO1_TX3 => 11,
      PIO1_RX0 => 12,
      PIO1_RX1 => 13,
      PIO1_RX2 => 14,
      PIO1_RX3 => 15,
      PIO2_TX0 => 16,
      PIO2_TX1 => 17,
      PIO2_TX2 => 18,
      PIO2_TX3 => 19,
      PIO2_RX0 => 20,
      PIO2_RX1 => 21,
      PIO2_RX2 => 22,
      PIO2_RX3 => 23,
      SPI0_TX => 24,
      SPI0_RX => 25,
      SPI1_TX => 26,
      SPI1_RX => 27,
      UART0_TX => 28,
      UART0_RX => 29,
      UART1_TX => 30,
      UART1_RX => 31,
      PWM_WRAP0 => 32,
      PWM_WRAP1 => 33,
      PWM_WRAP2 => 34,
      PWM_WRAP3 => 35,
      PWM_WRAP4 => 36,
      PWM_WRAP5 => 37,
      PWM_WRAP6 => 38,
      PWM_WRAP7 => 39,
      PWM_WRAP8 => 40,
      PWM_WRAP9 => 41,
      PWM_WRAP10 => 42,
      PWM_WRAP11 => 43,
      I2C0_TX => 44,
      I2C0_RX => 45,
      I2C1_TX => 46,
      I2C1_RX => 47,
      ADC => 48,
      XIP_STREAM => 49,
      XIP_QMITX => 50,
      XIP_QMIRX => 51,
      HSTX => 52,
      CORESIGHT => 53,
      SHA256 => 54,
      TIMER0 => 59,
      TIMER1 => 60,
      TIMER2 => 61,
      TIMER3 => 62,
      PERMANENT => 63);

   --  DMA Channel 5 Control and Status
   type CH5_CTRL_TRIG_Register is record
      --  DMA Channel Enable. When 1, the channel will respond to triggering
      --  events, which will cause it to become BUSY and start transferring
      --  data. When 0, the channel will ignore triggers, stop issuing
      --  transfers, and pause the current transfer sequence (i.e. BUSY will
      --  remain high if already high)
      EN             : Boolean := False;
      --  HIGH_PRIORITY gives a channel preferential treatment in issue
      --  scheduling: in each scheduling round, all high priority channels are
      --  considered first, and then only a single low priority channel, before
      --  returning to the high priority channels. This only affects the order
      --  in which the DMA schedules channels. The DMA's bus priority is not
      --  changed. If the DMA is not saturated then a low priority channel will
      --  see no loss of throughput.
      HIGH_PRIORITY  : Boolean := False;
      --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
      --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
      DATA_SIZE      : CH5_CTRL_TRIG_DATA_SIZE_Field :=
                        RP2350_SVD.DMA.SIZE_BYTE;
      --  If 1, the read address increments with each transfer. If 0, each read
      --  is directed to the same, initial address. Generally this should be
      --  disabled for peripheral-to-memory transfers.
      INCR_READ      : Boolean := False;
      --  If 1, and INCR_READ is 1, the read address is decremented rather than
      --  incremented with each transfer. If 1, and INCR_READ is 0, this
      --  otherwise-unused combination causes the read address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_READ_REV  : Boolean := False;
      --  If 1, the write address increments with each transfer. If 0, each
      --  write is directed to the same, initial address. Generally this should
      --  be disabled for memory-to-peripheral transfers.
      INCR_WRITE     : Boolean := False;
      --  If 1, and INCR_WRITE is 1, the write address is decremented rather
      --  than incremented with each transfer. If 1, and INCR_WRITE is 0, this
      --  otherwise-unused combination causes the write address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_WRITE_REV : Boolean := False;
      --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
      --  the lower n bits of the address will change. This wraps the address
      --  on a (1 << n) byte boundary, facilitating access to naturally-aligned
      --  ring buffers. Ring sizes between 2 and 32768 bytes are possible. This
      --  can apply to either read or write addresses, based on value of
      --  RING_SEL.
      RING_SIZE      : CH5_CTRL_TRIG_RING_SIZE_Field :=
                        RP2350_SVD.DMA.RING_NONE;
      --  Select whether RING_SIZE applies to read or write addresses. If 0,
      --  read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1,
      --  write addresses are wrapped.
      RING_SEL       : Boolean := False;
      --  When this channel completes, it will trigger the channel indicated by
      --  CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_. Note this
      --  field resets to 0, so channels 1 and above will chain to channel 0 by
      --  default. Set this field to avoid this behaviour.
      CHAIN_TO       : CH5_CTRL_TRIG_CHAIN_TO_Field := 16#0#;
      --  Select a Transfer Request signal. The channel uses the transfer
      --  request signal to pace its data transfer rate. Sources for TREQ
      --  signals are internal (TIMERS) or external (DREQ, a Data Request from
      --  the system). 0x0 to 0x3a -> select DREQ n as TREQ
      TREQ_SEL       : CH5_CTRL_TRIG_TREQ_SEL_Field :=
                        RP2350_SVD.DMA.PIO0_TX0;
      --  In QUIET mode, the channel does not generate IRQs at the end of every
      --  transfer block. Instead, an IRQ is raised when NULL is written to a
      --  trigger register, indicating the end of a control block chain. This
      --  reduces the number of interrupts to be serviced by the CPU when
      --  transferring a DMA chain of many small control blocks.
      IRQ_QUIET      : Boolean := False;
      --  Apply byte-swap transformation to DMA data. For byte data, this has
      --  no effect. For halfword data, the two bytes of each halfword are
      --  swapped. For word data, the four bytes of each word are swapped to
      --  reverse order.
      BSWAP          : Boolean := False;
      --  If 1, this channel's data transfers are visible to the sniff
      --  hardware, and each transfer will advance the state of the checksum.
      --  This only applies if the sniff hardware is enabled, and has this
      --  channel selected. This allows checksum to be enabled or disabled on a
      --  per-control- block basis.
      SNIFF_EN       : Boolean := False;
      --  Read-only. This flag goes high when the channel starts a new transfer
      --  sequence, and low when the last transfer of that sequence completes.
      --  Clearing EN while BUSY is high pauses the channel, and BUSY will stay
      --  high while paused. To terminate a sequence early (and clear the BUSY
      --  flag), see CHAN_ABORT.
      BUSY           : Boolean := False;
      --  unspecified
      Reserved_27_28 : HAL.UInt2 := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a write bus error. Write one
      --  to clear. WRITE_ADDR shows the approximate address where the bus
      --  error was encountered (will not be earlier, or more than 5 transfers
      --  later)
      WRITE_ERROR    : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a read bus error. Write one
      --  to clear. READ_ADDR shows the approximate address where the bus error
      --  was encountered (will not be earlier, or more than 3 transfers later)
      READ_ERROR     : Boolean := False;
      --  Read-only. Logical OR of the READ_ERROR and WRITE_ERROR flags. The
      --  channel halts when it encounters any bus error, and always raises its
      --  channel IRQ flag.
      AHB_ERROR      : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH5_CTRL_TRIG_Register use record
      EN             at 0 range 0 .. 0;
      HIGH_PRIORITY  at 0 range 1 .. 1;
      DATA_SIZE      at 0 range 2 .. 3;
      INCR_READ      at 0 range 4 .. 4;
      INCR_READ_REV  at 0 range 5 .. 5;
      INCR_WRITE     at 0 range 6 .. 6;
      INCR_WRITE_REV at 0 range 7 .. 7;
      RING_SIZE      at 0 range 8 .. 11;
      RING_SEL       at 0 range 12 .. 12;
      CHAIN_TO       at 0 range 13 .. 16;
      TREQ_SEL       at 0 range 17 .. 22;
      IRQ_QUIET      at 0 range 23 .. 23;
      BSWAP          at 0 range 24 .. 24;
      SNIFF_EN       at 0 range 25 .. 25;
      BUSY           at 0 range 26 .. 26;
      Reserved_27_28 at 0 range 27 .. 28;
      WRITE_ERROR    at 0 range 29 .. 29;
      READ_ERROR     at 0 range 30 .. 30;
      AHB_ERROR      at 0 range 31 .. 31;
   end record;

   subtype CH6_TRANS_COUNT_COUNT_Field is HAL.UInt28;

   --  When MODE is 0x0, the transfer count decrements with each transfer until
   --  0, and then the channel triggers the next channel indicated by
   --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with each
   --  transfer until 0, and then the channel re-triggers itself, in addition
   --  to the trigger indicated by CTRL_CHAIN_TO. This is useful for e.g. an
   --  endless ring-buffer DMA with periodic interrupts. When MODE is 0xf, the
   --  transfer count does not decrement. The DMA channel performs an endless
   --  sequence of transfers, never triggering other channels or raising
   --  interrupts, until an ABORT is raised. All other values are reserved.
   type CH6_TRANS_COUNT_MODE_Field is
     (NORMAL,
      TRIGGER_SELF,
      ENDLESS)
     with Size => 4;
   for CH6_TRANS_COUNT_MODE_Field use
     (NORMAL => 0,
      TRIGGER_SELF => 1,
      ENDLESS => 15);

   --  DMA Channel 6 Transfer Count
   type CH6_TRANS_COUNT_Register is record
      --  28-bit transfer count (256 million transfers maximum). Program the
      --  number of bus transfers a channel will perform before halting. Note
      --  that, if transfers are larger than one byte in size, this is not
      --  equal to the number of bytes transferred (see CTRL_DATA_SIZE). When
      --  the channel is active, reading this register shows the number of
      --  transfers remaining, updating automatically each time a write
      --  transfer completes. Writing this register sets the RELOAD value for
      --  the transfer counter. Each time this channel is triggered, the RELOAD
      --  value is copied into the live transfer counter. The channel can be
      --  started multiple times, and will perform the same number of transfers
      --  each time, as programmed by most recent write. The RELOAD value can
      --  be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the
      --  written value is used immediately as the length of the new transfer
      --  sequence, as well as being written to RELOAD.
      COUNT : CH6_TRANS_COUNT_COUNT_Field := 16#0#;
      --  When MODE is 0x0, the transfer count decrements with each transfer
      --  until 0, and then the channel triggers the next channel indicated by
      --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with
      --  each transfer until 0, and then the channel re-triggers itself, in
      --  addition to the trigger indicated by CTRL_CHAIN_TO. This is useful
      --  for e.g. an endless ring-buffer DMA with periodic interrupts. When
      --  MODE is 0xf, the transfer count does not decrement. The DMA channel
      --  performs an endless sequence of transfers, never triggering other
      --  channels or raising interrupts, until an ABORT is raised. All other
      --  values are reserved.
      MODE  : CH6_TRANS_COUNT_MODE_Field := RP2350_SVD.DMA.NORMAL;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH6_TRANS_COUNT_Register use record
      COUNT at 0 range 0 .. 27;
      MODE  at 0 range 28 .. 31;
   end record;

   --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
   --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
   type CH6_CTRL_TRIG_DATA_SIZE_Field is
     (SIZE_BYTE,
      SIZE_HALFWORD,
      SIZE_WORD)
     with Size => 2;
   for CH6_CTRL_TRIG_DATA_SIZE_Field use
     (SIZE_BYTE => 0,
      SIZE_HALFWORD => 1,
      SIZE_WORD => 2);

   --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
   --  the lower n bits of the address will change. This wraps the address on a
   --  (1 << n) byte boundary, facilitating access to naturally-aligned ring
   --  buffers. Ring sizes between 2 and 32768 bytes are possible. This can
   --  apply to either read or write addresses, based on value of RING_SEL.
   type CH6_CTRL_TRIG_RING_SIZE_Field is
     (RING_NONE)
     with Size => 4;
   for CH6_CTRL_TRIG_RING_SIZE_Field use
     (RING_NONE => 0);

   subtype CH6_CTRL_TRIG_CHAIN_TO_Field is HAL.UInt4;

   --  Select a Transfer Request signal. The channel uses the transfer request
   --  signal to pace its data transfer rate. Sources for TREQ signals are
   --  internal (TIMERS) or external (DREQ, a Data Request from the system).
   --  0x0 to 0x3a -> select DREQ n as TREQ
   type CH6_CTRL_TRIG_TREQ_SEL_Field is
     (--  Select PIO0's TX FIFO 0 as TREQ
      PIO0_TX0,
      --  Select PIO0's TX FIFO 1 as TREQ
      PIO0_TX1,
      --  Select PIO0's TX FIFO 2 as TREQ
      PIO0_TX2,
      --  Select PIO0's TX FIFO 3 as TREQ
      PIO0_TX3,
      --  Select PIO0's RX FIFO 0 as TREQ
      PIO0_RX0,
      --  Select PIO0's RX FIFO 1 as TREQ
      PIO0_RX1,
      --  Select PIO0's RX FIFO 2 as TREQ
      PIO0_RX2,
      --  Select PIO0's RX FIFO 3 as TREQ
      PIO0_RX3,
      --  Select PIO1's TX FIFO 0 as TREQ
      PIO1_TX0,
      --  Select PIO1's TX FIFO 1 as TREQ
      PIO1_TX1,
      --  Select PIO1's TX FIFO 2 as TREQ
      PIO1_TX2,
      --  Select PIO1's TX FIFO 3 as TREQ
      PIO1_TX3,
      --  Select PIO1's RX FIFO 0 as TREQ
      PIO1_RX0,
      --  Select PIO1's RX FIFO 1 as TREQ
      PIO1_RX1,
      --  Select PIO1's RX FIFO 2 as TREQ
      PIO1_RX2,
      --  Select PIO1's RX FIFO 3 as TREQ
      PIO1_RX3,
      --  Select PIO2's TX FIFO 0 as TREQ
      PIO2_TX0,
      --  Select PIO2's TX FIFO 1 as TREQ
      PIO2_TX1,
      --  Select PIO2's TX FIFO 2 as TREQ
      PIO2_TX2,
      --  Select PIO2's TX FIFO 3 as TREQ
      PIO2_TX3,
      --  Select PIO2's RX FIFO 0 as TREQ
      PIO2_RX0,
      --  Select PIO2's RX FIFO 1 as TREQ
      PIO2_RX1,
      --  Select PIO2's RX FIFO 2 as TREQ
      PIO2_RX2,
      --  Select PIO2's RX FIFO 3 as TREQ
      PIO2_RX3,
      --  Select SPI0's TX FIFO as TREQ
      SPI0_TX,
      --  Select SPI0's RX FIFO as TREQ
      SPI0_RX,
      --  Select SPI1's TX FIFO as TREQ
      SPI1_TX,
      --  Select SPI1's RX FIFO as TREQ
      SPI1_RX,
      --  Select UART0's TX FIFO as TREQ
      UART0_TX,
      --  Select UART0's RX FIFO as TREQ
      UART0_RX,
      --  Select UART1's TX FIFO as TREQ
      UART1_TX,
      --  Select UART1's RX FIFO as TREQ
      UART1_RX,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP0,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP1,
      --  Select PWM Counter 2's Wrap Value as TREQ
      PWM_WRAP2,
      --  Select PWM Counter 3's Wrap Value as TREQ
      PWM_WRAP3,
      --  Select PWM Counter 4's Wrap Value as TREQ
      PWM_WRAP4,
      --  Select PWM Counter 5's Wrap Value as TREQ
      PWM_WRAP5,
      --  Select PWM Counter 6's Wrap Value as TREQ
      PWM_WRAP6,
      --  Select PWM Counter 7's Wrap Value as TREQ
      PWM_WRAP7,
      --  Select PWM Counter 8's Wrap Value as TREQ
      PWM_WRAP8,
      --  Select PWM Counter 9's Wrap Value as TREQ
      PWM_WRAP9,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP10,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP11,
      --  Select I2C0's TX FIFO as TREQ
      I2C0_TX,
      --  Select I2C0's RX FIFO as TREQ
      I2C0_RX,
      --  Select I2C1's TX FIFO as TREQ
      I2C1_TX,
      --  Select I2C1's RX FIFO as TREQ
      I2C1_RX,
      --  Select the ADC as TREQ
      ADC,
      --  Select the XIP Streaming FIFO as TREQ
      XIP_STREAM,
      --  Select XIP_QMITX as TREQ
      XIP_QMITX,
      --  Select XIP_QMIRX as TREQ
      XIP_QMIRX,
      --  Select HSTX as TREQ
      HSTX,
      --  Select CORESIGHT as TREQ
      CORESIGHT,
      --  Select SHA256 as TREQ
      SHA256,
      --  Select Timer 0 as TREQ
      TIMER0,
      --  Select Timer 1 as TREQ
      TIMER1,
      --  Select Timer 2 as TREQ (Optional)
      TIMER2,
      --  Select Timer 3 as TREQ (Optional)
      TIMER3,
      --  Permanent request, for unpaced transfers.
      PERMANENT)
     with Size => 6;
   for CH6_CTRL_TRIG_TREQ_SEL_Field use
     (PIO0_TX0 => 0,
      PIO0_TX1 => 1,
      PIO0_TX2 => 2,
      PIO0_TX3 => 3,
      PIO0_RX0 => 4,
      PIO0_RX1 => 5,
      PIO0_RX2 => 6,
      PIO0_RX3 => 7,
      PIO1_TX0 => 8,
      PIO1_TX1 => 9,
      PIO1_TX2 => 10,
      PIO1_TX3 => 11,
      PIO1_RX0 => 12,
      PIO1_RX1 => 13,
      PIO1_RX2 => 14,
      PIO1_RX3 => 15,
      PIO2_TX0 => 16,
      PIO2_TX1 => 17,
      PIO2_TX2 => 18,
      PIO2_TX3 => 19,
      PIO2_RX0 => 20,
      PIO2_RX1 => 21,
      PIO2_RX2 => 22,
      PIO2_RX3 => 23,
      SPI0_TX => 24,
      SPI0_RX => 25,
      SPI1_TX => 26,
      SPI1_RX => 27,
      UART0_TX => 28,
      UART0_RX => 29,
      UART1_TX => 30,
      UART1_RX => 31,
      PWM_WRAP0 => 32,
      PWM_WRAP1 => 33,
      PWM_WRAP2 => 34,
      PWM_WRAP3 => 35,
      PWM_WRAP4 => 36,
      PWM_WRAP5 => 37,
      PWM_WRAP6 => 38,
      PWM_WRAP7 => 39,
      PWM_WRAP8 => 40,
      PWM_WRAP9 => 41,
      PWM_WRAP10 => 42,
      PWM_WRAP11 => 43,
      I2C0_TX => 44,
      I2C0_RX => 45,
      I2C1_TX => 46,
      I2C1_RX => 47,
      ADC => 48,
      XIP_STREAM => 49,
      XIP_QMITX => 50,
      XIP_QMIRX => 51,
      HSTX => 52,
      CORESIGHT => 53,
      SHA256 => 54,
      TIMER0 => 59,
      TIMER1 => 60,
      TIMER2 => 61,
      TIMER3 => 62,
      PERMANENT => 63);

   --  DMA Channel 6 Control and Status
   type CH6_CTRL_TRIG_Register is record
      --  DMA Channel Enable. When 1, the channel will respond to triggering
      --  events, which will cause it to become BUSY and start transferring
      --  data. When 0, the channel will ignore triggers, stop issuing
      --  transfers, and pause the current transfer sequence (i.e. BUSY will
      --  remain high if already high)
      EN             : Boolean := False;
      --  HIGH_PRIORITY gives a channel preferential treatment in issue
      --  scheduling: in each scheduling round, all high priority channels are
      --  considered first, and then only a single low priority channel, before
      --  returning to the high priority channels. This only affects the order
      --  in which the DMA schedules channels. The DMA's bus priority is not
      --  changed. If the DMA is not saturated then a low priority channel will
      --  see no loss of throughput.
      HIGH_PRIORITY  : Boolean := False;
      --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
      --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
      DATA_SIZE      : CH6_CTRL_TRIG_DATA_SIZE_Field :=
                        RP2350_SVD.DMA.SIZE_BYTE;
      --  If 1, the read address increments with each transfer. If 0, each read
      --  is directed to the same, initial address. Generally this should be
      --  disabled for peripheral-to-memory transfers.
      INCR_READ      : Boolean := False;
      --  If 1, and INCR_READ is 1, the read address is decremented rather than
      --  incremented with each transfer. If 1, and INCR_READ is 0, this
      --  otherwise-unused combination causes the read address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_READ_REV  : Boolean := False;
      --  If 1, the write address increments with each transfer. If 0, each
      --  write is directed to the same, initial address. Generally this should
      --  be disabled for memory-to-peripheral transfers.
      INCR_WRITE     : Boolean := False;
      --  If 1, and INCR_WRITE is 1, the write address is decremented rather
      --  than incremented with each transfer. If 1, and INCR_WRITE is 0, this
      --  otherwise-unused combination causes the write address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_WRITE_REV : Boolean := False;
      --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
      --  the lower n bits of the address will change. This wraps the address
      --  on a (1 << n) byte boundary, facilitating access to naturally-aligned
      --  ring buffers. Ring sizes between 2 and 32768 bytes are possible. This
      --  can apply to either read or write addresses, based on value of
      --  RING_SEL.
      RING_SIZE      : CH6_CTRL_TRIG_RING_SIZE_Field :=
                        RP2350_SVD.DMA.RING_NONE;
      --  Select whether RING_SIZE applies to read or write addresses. If 0,
      --  read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1,
      --  write addresses are wrapped.
      RING_SEL       : Boolean := False;
      --  When this channel completes, it will trigger the channel indicated by
      --  CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_. Note this
      --  field resets to 0, so channels 1 and above will chain to channel 0 by
      --  default. Set this field to avoid this behaviour.
      CHAIN_TO       : CH6_CTRL_TRIG_CHAIN_TO_Field := 16#0#;
      --  Select a Transfer Request signal. The channel uses the transfer
      --  request signal to pace its data transfer rate. Sources for TREQ
      --  signals are internal (TIMERS) or external (DREQ, a Data Request from
      --  the system). 0x0 to 0x3a -> select DREQ n as TREQ
      TREQ_SEL       : CH6_CTRL_TRIG_TREQ_SEL_Field :=
                        RP2350_SVD.DMA.PIO0_TX0;
      --  In QUIET mode, the channel does not generate IRQs at the end of every
      --  transfer block. Instead, an IRQ is raised when NULL is written to a
      --  trigger register, indicating the end of a control block chain. This
      --  reduces the number of interrupts to be serviced by the CPU when
      --  transferring a DMA chain of many small control blocks.
      IRQ_QUIET      : Boolean := False;
      --  Apply byte-swap transformation to DMA data. For byte data, this has
      --  no effect. For halfword data, the two bytes of each halfword are
      --  swapped. For word data, the four bytes of each word are swapped to
      --  reverse order.
      BSWAP          : Boolean := False;
      --  If 1, this channel's data transfers are visible to the sniff
      --  hardware, and each transfer will advance the state of the checksum.
      --  This only applies if the sniff hardware is enabled, and has this
      --  channel selected. This allows checksum to be enabled or disabled on a
      --  per-control- block basis.
      SNIFF_EN       : Boolean := False;
      --  Read-only. This flag goes high when the channel starts a new transfer
      --  sequence, and low when the last transfer of that sequence completes.
      --  Clearing EN while BUSY is high pauses the channel, and BUSY will stay
      --  high while paused. To terminate a sequence early (and clear the BUSY
      --  flag), see CHAN_ABORT.
      BUSY           : Boolean := False;
      --  unspecified
      Reserved_27_28 : HAL.UInt2 := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a write bus error. Write one
      --  to clear. WRITE_ADDR shows the approximate address where the bus
      --  error was encountered (will not be earlier, or more than 5 transfers
      --  later)
      WRITE_ERROR    : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a read bus error. Write one
      --  to clear. READ_ADDR shows the approximate address where the bus error
      --  was encountered (will not be earlier, or more than 3 transfers later)
      READ_ERROR     : Boolean := False;
      --  Read-only. Logical OR of the READ_ERROR and WRITE_ERROR flags. The
      --  channel halts when it encounters any bus error, and always raises its
      --  channel IRQ flag.
      AHB_ERROR      : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH6_CTRL_TRIG_Register use record
      EN             at 0 range 0 .. 0;
      HIGH_PRIORITY  at 0 range 1 .. 1;
      DATA_SIZE      at 0 range 2 .. 3;
      INCR_READ      at 0 range 4 .. 4;
      INCR_READ_REV  at 0 range 5 .. 5;
      INCR_WRITE     at 0 range 6 .. 6;
      INCR_WRITE_REV at 0 range 7 .. 7;
      RING_SIZE      at 0 range 8 .. 11;
      RING_SEL       at 0 range 12 .. 12;
      CHAIN_TO       at 0 range 13 .. 16;
      TREQ_SEL       at 0 range 17 .. 22;
      IRQ_QUIET      at 0 range 23 .. 23;
      BSWAP          at 0 range 24 .. 24;
      SNIFF_EN       at 0 range 25 .. 25;
      BUSY           at 0 range 26 .. 26;
      Reserved_27_28 at 0 range 27 .. 28;
      WRITE_ERROR    at 0 range 29 .. 29;
      READ_ERROR     at 0 range 30 .. 30;
      AHB_ERROR      at 0 range 31 .. 31;
   end record;

   subtype CH7_TRANS_COUNT_COUNT_Field is HAL.UInt28;

   --  When MODE is 0x0, the transfer count decrements with each transfer until
   --  0, and then the channel triggers the next channel indicated by
   --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with each
   --  transfer until 0, and then the channel re-triggers itself, in addition
   --  to the trigger indicated by CTRL_CHAIN_TO. This is useful for e.g. an
   --  endless ring-buffer DMA with periodic interrupts. When MODE is 0xf, the
   --  transfer count does not decrement. The DMA channel performs an endless
   --  sequence of transfers, never triggering other channels or raising
   --  interrupts, until an ABORT is raised. All other values are reserved.
   type CH7_TRANS_COUNT_MODE_Field is
     (NORMAL,
      TRIGGER_SELF,
      ENDLESS)
     with Size => 4;
   for CH7_TRANS_COUNT_MODE_Field use
     (NORMAL => 0,
      TRIGGER_SELF => 1,
      ENDLESS => 15);

   --  DMA Channel 7 Transfer Count
   type CH7_TRANS_COUNT_Register is record
      --  28-bit transfer count (256 million transfers maximum). Program the
      --  number of bus transfers a channel will perform before halting. Note
      --  that, if transfers are larger than one byte in size, this is not
      --  equal to the number of bytes transferred (see CTRL_DATA_SIZE). When
      --  the channel is active, reading this register shows the number of
      --  transfers remaining, updating automatically each time a write
      --  transfer completes. Writing this register sets the RELOAD value for
      --  the transfer counter. Each time this channel is triggered, the RELOAD
      --  value is copied into the live transfer counter. The channel can be
      --  started multiple times, and will perform the same number of transfers
      --  each time, as programmed by most recent write. The RELOAD value can
      --  be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the
      --  written value is used immediately as the length of the new transfer
      --  sequence, as well as being written to RELOAD.
      COUNT : CH7_TRANS_COUNT_COUNT_Field := 16#0#;
      --  When MODE is 0x0, the transfer count decrements with each transfer
      --  until 0, and then the channel triggers the next channel indicated by
      --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with
      --  each transfer until 0, and then the channel re-triggers itself, in
      --  addition to the trigger indicated by CTRL_CHAIN_TO. This is useful
      --  for e.g. an endless ring-buffer DMA with periodic interrupts. When
      --  MODE is 0xf, the transfer count does not decrement. The DMA channel
      --  performs an endless sequence of transfers, never triggering other
      --  channels or raising interrupts, until an ABORT is raised. All other
      --  values are reserved.
      MODE  : CH7_TRANS_COUNT_MODE_Field := RP2350_SVD.DMA.NORMAL;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH7_TRANS_COUNT_Register use record
      COUNT at 0 range 0 .. 27;
      MODE  at 0 range 28 .. 31;
   end record;

   --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
   --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
   type CH7_CTRL_TRIG_DATA_SIZE_Field is
     (SIZE_BYTE,
      SIZE_HALFWORD,
      SIZE_WORD)
     with Size => 2;
   for CH7_CTRL_TRIG_DATA_SIZE_Field use
     (SIZE_BYTE => 0,
      SIZE_HALFWORD => 1,
      SIZE_WORD => 2);

   --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
   --  the lower n bits of the address will change. This wraps the address on a
   --  (1 << n) byte boundary, facilitating access to naturally-aligned ring
   --  buffers. Ring sizes between 2 and 32768 bytes are possible. This can
   --  apply to either read or write addresses, based on value of RING_SEL.
   type CH7_CTRL_TRIG_RING_SIZE_Field is
     (RING_NONE)
     with Size => 4;
   for CH7_CTRL_TRIG_RING_SIZE_Field use
     (RING_NONE => 0);

   subtype CH7_CTRL_TRIG_CHAIN_TO_Field is HAL.UInt4;

   --  Select a Transfer Request signal. The channel uses the transfer request
   --  signal to pace its data transfer rate. Sources for TREQ signals are
   --  internal (TIMERS) or external (DREQ, a Data Request from the system).
   --  0x0 to 0x3a -> select DREQ n as TREQ
   type CH7_CTRL_TRIG_TREQ_SEL_Field is
     (--  Select PIO0's TX FIFO 0 as TREQ
      PIO0_TX0,
      --  Select PIO0's TX FIFO 1 as TREQ
      PIO0_TX1,
      --  Select PIO0's TX FIFO 2 as TREQ
      PIO0_TX2,
      --  Select PIO0's TX FIFO 3 as TREQ
      PIO0_TX3,
      --  Select PIO0's RX FIFO 0 as TREQ
      PIO0_RX0,
      --  Select PIO0's RX FIFO 1 as TREQ
      PIO0_RX1,
      --  Select PIO0's RX FIFO 2 as TREQ
      PIO0_RX2,
      --  Select PIO0's RX FIFO 3 as TREQ
      PIO0_RX3,
      --  Select PIO1's TX FIFO 0 as TREQ
      PIO1_TX0,
      --  Select PIO1's TX FIFO 1 as TREQ
      PIO1_TX1,
      --  Select PIO1's TX FIFO 2 as TREQ
      PIO1_TX2,
      --  Select PIO1's TX FIFO 3 as TREQ
      PIO1_TX3,
      --  Select PIO1's RX FIFO 0 as TREQ
      PIO1_RX0,
      --  Select PIO1's RX FIFO 1 as TREQ
      PIO1_RX1,
      --  Select PIO1's RX FIFO 2 as TREQ
      PIO1_RX2,
      --  Select PIO1's RX FIFO 3 as TREQ
      PIO1_RX3,
      --  Select PIO2's TX FIFO 0 as TREQ
      PIO2_TX0,
      --  Select PIO2's TX FIFO 1 as TREQ
      PIO2_TX1,
      --  Select PIO2's TX FIFO 2 as TREQ
      PIO2_TX2,
      --  Select PIO2's TX FIFO 3 as TREQ
      PIO2_TX3,
      --  Select PIO2's RX FIFO 0 as TREQ
      PIO2_RX0,
      --  Select PIO2's RX FIFO 1 as TREQ
      PIO2_RX1,
      --  Select PIO2's RX FIFO 2 as TREQ
      PIO2_RX2,
      --  Select PIO2's RX FIFO 3 as TREQ
      PIO2_RX3,
      --  Select SPI0's TX FIFO as TREQ
      SPI0_TX,
      --  Select SPI0's RX FIFO as TREQ
      SPI0_RX,
      --  Select SPI1's TX FIFO as TREQ
      SPI1_TX,
      --  Select SPI1's RX FIFO as TREQ
      SPI1_RX,
      --  Select UART0's TX FIFO as TREQ
      UART0_TX,
      --  Select UART0's RX FIFO as TREQ
      UART0_RX,
      --  Select UART1's TX FIFO as TREQ
      UART1_TX,
      --  Select UART1's RX FIFO as TREQ
      UART1_RX,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP0,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP1,
      --  Select PWM Counter 2's Wrap Value as TREQ
      PWM_WRAP2,
      --  Select PWM Counter 3's Wrap Value as TREQ
      PWM_WRAP3,
      --  Select PWM Counter 4's Wrap Value as TREQ
      PWM_WRAP4,
      --  Select PWM Counter 5's Wrap Value as TREQ
      PWM_WRAP5,
      --  Select PWM Counter 6's Wrap Value as TREQ
      PWM_WRAP6,
      --  Select PWM Counter 7's Wrap Value as TREQ
      PWM_WRAP7,
      --  Select PWM Counter 8's Wrap Value as TREQ
      PWM_WRAP8,
      --  Select PWM Counter 9's Wrap Value as TREQ
      PWM_WRAP9,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP10,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP11,
      --  Select I2C0's TX FIFO as TREQ
      I2C0_TX,
      --  Select I2C0's RX FIFO as TREQ
      I2C0_RX,
      --  Select I2C1's TX FIFO as TREQ
      I2C1_TX,
      --  Select I2C1's RX FIFO as TREQ
      I2C1_RX,
      --  Select the ADC as TREQ
      ADC,
      --  Select the XIP Streaming FIFO as TREQ
      XIP_STREAM,
      --  Select XIP_QMITX as TREQ
      XIP_QMITX,
      --  Select XIP_QMIRX as TREQ
      XIP_QMIRX,
      --  Select HSTX as TREQ
      HSTX,
      --  Select CORESIGHT as TREQ
      CORESIGHT,
      --  Select SHA256 as TREQ
      SHA256,
      --  Select Timer 0 as TREQ
      TIMER0,
      --  Select Timer 1 as TREQ
      TIMER1,
      --  Select Timer 2 as TREQ (Optional)
      TIMER2,
      --  Select Timer 3 as TREQ (Optional)
      TIMER3,
      --  Permanent request, for unpaced transfers.
      PERMANENT)
     with Size => 6;
   for CH7_CTRL_TRIG_TREQ_SEL_Field use
     (PIO0_TX0 => 0,
      PIO0_TX1 => 1,
      PIO0_TX2 => 2,
      PIO0_TX3 => 3,
      PIO0_RX0 => 4,
      PIO0_RX1 => 5,
      PIO0_RX2 => 6,
      PIO0_RX3 => 7,
      PIO1_TX0 => 8,
      PIO1_TX1 => 9,
      PIO1_TX2 => 10,
      PIO1_TX3 => 11,
      PIO1_RX0 => 12,
      PIO1_RX1 => 13,
      PIO1_RX2 => 14,
      PIO1_RX3 => 15,
      PIO2_TX0 => 16,
      PIO2_TX1 => 17,
      PIO2_TX2 => 18,
      PIO2_TX3 => 19,
      PIO2_RX0 => 20,
      PIO2_RX1 => 21,
      PIO2_RX2 => 22,
      PIO2_RX3 => 23,
      SPI0_TX => 24,
      SPI0_RX => 25,
      SPI1_TX => 26,
      SPI1_RX => 27,
      UART0_TX => 28,
      UART0_RX => 29,
      UART1_TX => 30,
      UART1_RX => 31,
      PWM_WRAP0 => 32,
      PWM_WRAP1 => 33,
      PWM_WRAP2 => 34,
      PWM_WRAP3 => 35,
      PWM_WRAP4 => 36,
      PWM_WRAP5 => 37,
      PWM_WRAP6 => 38,
      PWM_WRAP7 => 39,
      PWM_WRAP8 => 40,
      PWM_WRAP9 => 41,
      PWM_WRAP10 => 42,
      PWM_WRAP11 => 43,
      I2C0_TX => 44,
      I2C0_RX => 45,
      I2C1_TX => 46,
      I2C1_RX => 47,
      ADC => 48,
      XIP_STREAM => 49,
      XIP_QMITX => 50,
      XIP_QMIRX => 51,
      HSTX => 52,
      CORESIGHT => 53,
      SHA256 => 54,
      TIMER0 => 59,
      TIMER1 => 60,
      TIMER2 => 61,
      TIMER3 => 62,
      PERMANENT => 63);

   --  DMA Channel 7 Control and Status
   type CH7_CTRL_TRIG_Register is record
      --  DMA Channel Enable. When 1, the channel will respond to triggering
      --  events, which will cause it to become BUSY and start transferring
      --  data. When 0, the channel will ignore triggers, stop issuing
      --  transfers, and pause the current transfer sequence (i.e. BUSY will
      --  remain high if already high)
      EN             : Boolean := False;
      --  HIGH_PRIORITY gives a channel preferential treatment in issue
      --  scheduling: in each scheduling round, all high priority channels are
      --  considered first, and then only a single low priority channel, before
      --  returning to the high priority channels. This only affects the order
      --  in which the DMA schedules channels. The DMA's bus priority is not
      --  changed. If the DMA is not saturated then a low priority channel will
      --  see no loss of throughput.
      HIGH_PRIORITY  : Boolean := False;
      --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
      --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
      DATA_SIZE      : CH7_CTRL_TRIG_DATA_SIZE_Field :=
                        RP2350_SVD.DMA.SIZE_BYTE;
      --  If 1, the read address increments with each transfer. If 0, each read
      --  is directed to the same, initial address. Generally this should be
      --  disabled for peripheral-to-memory transfers.
      INCR_READ      : Boolean := False;
      --  If 1, and INCR_READ is 1, the read address is decremented rather than
      --  incremented with each transfer. If 1, and INCR_READ is 0, this
      --  otherwise-unused combination causes the read address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_READ_REV  : Boolean := False;
      --  If 1, the write address increments with each transfer. If 0, each
      --  write is directed to the same, initial address. Generally this should
      --  be disabled for memory-to-peripheral transfers.
      INCR_WRITE     : Boolean := False;
      --  If 1, and INCR_WRITE is 1, the write address is decremented rather
      --  than incremented with each transfer. If 1, and INCR_WRITE is 0, this
      --  otherwise-unused combination causes the write address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_WRITE_REV : Boolean := False;
      --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
      --  the lower n bits of the address will change. This wraps the address
      --  on a (1 << n) byte boundary, facilitating access to naturally-aligned
      --  ring buffers. Ring sizes between 2 and 32768 bytes are possible. This
      --  can apply to either read or write addresses, based on value of
      --  RING_SEL.
      RING_SIZE      : CH7_CTRL_TRIG_RING_SIZE_Field :=
                        RP2350_SVD.DMA.RING_NONE;
      --  Select whether RING_SIZE applies to read or write addresses. If 0,
      --  read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1,
      --  write addresses are wrapped.
      RING_SEL       : Boolean := False;
      --  When this channel completes, it will trigger the channel indicated by
      --  CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_. Note this
      --  field resets to 0, so channels 1 and above will chain to channel 0 by
      --  default. Set this field to avoid this behaviour.
      CHAIN_TO       : CH7_CTRL_TRIG_CHAIN_TO_Field := 16#0#;
      --  Select a Transfer Request signal. The channel uses the transfer
      --  request signal to pace its data transfer rate. Sources for TREQ
      --  signals are internal (TIMERS) or external (DREQ, a Data Request from
      --  the system). 0x0 to 0x3a -> select DREQ n as TREQ
      TREQ_SEL       : CH7_CTRL_TRIG_TREQ_SEL_Field :=
                        RP2350_SVD.DMA.PIO0_TX0;
      --  In QUIET mode, the channel does not generate IRQs at the end of every
      --  transfer block. Instead, an IRQ is raised when NULL is written to a
      --  trigger register, indicating the end of a control block chain. This
      --  reduces the number of interrupts to be serviced by the CPU when
      --  transferring a DMA chain of many small control blocks.
      IRQ_QUIET      : Boolean := False;
      --  Apply byte-swap transformation to DMA data. For byte data, this has
      --  no effect. For halfword data, the two bytes of each halfword are
      --  swapped. For word data, the four bytes of each word are swapped to
      --  reverse order.
      BSWAP          : Boolean := False;
      --  If 1, this channel's data transfers are visible to the sniff
      --  hardware, and each transfer will advance the state of the checksum.
      --  This only applies if the sniff hardware is enabled, and has this
      --  channel selected. This allows checksum to be enabled or disabled on a
      --  per-control- block basis.
      SNIFF_EN       : Boolean := False;
      --  Read-only. This flag goes high when the channel starts a new transfer
      --  sequence, and low when the last transfer of that sequence completes.
      --  Clearing EN while BUSY is high pauses the channel, and BUSY will stay
      --  high while paused. To terminate a sequence early (and clear the BUSY
      --  flag), see CHAN_ABORT.
      BUSY           : Boolean := False;
      --  unspecified
      Reserved_27_28 : HAL.UInt2 := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a write bus error. Write one
      --  to clear. WRITE_ADDR shows the approximate address where the bus
      --  error was encountered (will not be earlier, or more than 5 transfers
      --  later)
      WRITE_ERROR    : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a read bus error. Write one
      --  to clear. READ_ADDR shows the approximate address where the bus error
      --  was encountered (will not be earlier, or more than 3 transfers later)
      READ_ERROR     : Boolean := False;
      --  Read-only. Logical OR of the READ_ERROR and WRITE_ERROR flags. The
      --  channel halts when it encounters any bus error, and always raises its
      --  channel IRQ flag.
      AHB_ERROR      : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH7_CTRL_TRIG_Register use record
      EN             at 0 range 0 .. 0;
      HIGH_PRIORITY  at 0 range 1 .. 1;
      DATA_SIZE      at 0 range 2 .. 3;
      INCR_READ      at 0 range 4 .. 4;
      INCR_READ_REV  at 0 range 5 .. 5;
      INCR_WRITE     at 0 range 6 .. 6;
      INCR_WRITE_REV at 0 range 7 .. 7;
      RING_SIZE      at 0 range 8 .. 11;
      RING_SEL       at 0 range 12 .. 12;
      CHAIN_TO       at 0 range 13 .. 16;
      TREQ_SEL       at 0 range 17 .. 22;
      IRQ_QUIET      at 0 range 23 .. 23;
      BSWAP          at 0 range 24 .. 24;
      SNIFF_EN       at 0 range 25 .. 25;
      BUSY           at 0 range 26 .. 26;
      Reserved_27_28 at 0 range 27 .. 28;
      WRITE_ERROR    at 0 range 29 .. 29;
      READ_ERROR     at 0 range 30 .. 30;
      AHB_ERROR      at 0 range 31 .. 31;
   end record;

   subtype CH8_TRANS_COUNT_COUNT_Field is HAL.UInt28;

   --  When MODE is 0x0, the transfer count decrements with each transfer until
   --  0, and then the channel triggers the next channel indicated by
   --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with each
   --  transfer until 0, and then the channel re-triggers itself, in addition
   --  to the trigger indicated by CTRL_CHAIN_TO. This is useful for e.g. an
   --  endless ring-buffer DMA with periodic interrupts. When MODE is 0xf, the
   --  transfer count does not decrement. The DMA channel performs an endless
   --  sequence of transfers, never triggering other channels or raising
   --  interrupts, until an ABORT is raised. All other values are reserved.
   type CH8_TRANS_COUNT_MODE_Field is
     (NORMAL,
      TRIGGER_SELF,
      ENDLESS)
     with Size => 4;
   for CH8_TRANS_COUNT_MODE_Field use
     (NORMAL => 0,
      TRIGGER_SELF => 1,
      ENDLESS => 15);

   --  DMA Channel 8 Transfer Count
   type CH8_TRANS_COUNT_Register is record
      --  28-bit transfer count (256 million transfers maximum). Program the
      --  number of bus transfers a channel will perform before halting. Note
      --  that, if transfers are larger than one byte in size, this is not
      --  equal to the number of bytes transferred (see CTRL_DATA_SIZE). When
      --  the channel is active, reading this register shows the number of
      --  transfers remaining, updating automatically each time a write
      --  transfer completes. Writing this register sets the RELOAD value for
      --  the transfer counter. Each time this channel is triggered, the RELOAD
      --  value is copied into the live transfer counter. The channel can be
      --  started multiple times, and will perform the same number of transfers
      --  each time, as programmed by most recent write. The RELOAD value can
      --  be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the
      --  written value is used immediately as the length of the new transfer
      --  sequence, as well as being written to RELOAD.
      COUNT : CH8_TRANS_COUNT_COUNT_Field := 16#0#;
      --  When MODE is 0x0, the transfer count decrements with each transfer
      --  until 0, and then the channel triggers the next channel indicated by
      --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with
      --  each transfer until 0, and then the channel re-triggers itself, in
      --  addition to the trigger indicated by CTRL_CHAIN_TO. This is useful
      --  for e.g. an endless ring-buffer DMA with periodic interrupts. When
      --  MODE is 0xf, the transfer count does not decrement. The DMA channel
      --  performs an endless sequence of transfers, never triggering other
      --  channels or raising interrupts, until an ABORT is raised. All other
      --  values are reserved.
      MODE  : CH8_TRANS_COUNT_MODE_Field := RP2350_SVD.DMA.NORMAL;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH8_TRANS_COUNT_Register use record
      COUNT at 0 range 0 .. 27;
      MODE  at 0 range 28 .. 31;
   end record;

   --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
   --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
   type CH8_CTRL_TRIG_DATA_SIZE_Field is
     (SIZE_BYTE,
      SIZE_HALFWORD,
      SIZE_WORD)
     with Size => 2;
   for CH8_CTRL_TRIG_DATA_SIZE_Field use
     (SIZE_BYTE => 0,
      SIZE_HALFWORD => 1,
      SIZE_WORD => 2);

   --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
   --  the lower n bits of the address will change. This wraps the address on a
   --  (1 << n) byte boundary, facilitating access to naturally-aligned ring
   --  buffers. Ring sizes between 2 and 32768 bytes are possible. This can
   --  apply to either read or write addresses, based on value of RING_SEL.
   type CH8_CTRL_TRIG_RING_SIZE_Field is
     (RING_NONE)
     with Size => 4;
   for CH8_CTRL_TRIG_RING_SIZE_Field use
     (RING_NONE => 0);

   subtype CH8_CTRL_TRIG_CHAIN_TO_Field is HAL.UInt4;

   --  Select a Transfer Request signal. The channel uses the transfer request
   --  signal to pace its data transfer rate. Sources for TREQ signals are
   --  internal (TIMERS) or external (DREQ, a Data Request from the system).
   --  0x0 to 0x3a -> select DREQ n as TREQ
   type CH8_CTRL_TRIG_TREQ_SEL_Field is
     (--  Select PIO0's TX FIFO 0 as TREQ
      PIO0_TX0,
      --  Select PIO0's TX FIFO 1 as TREQ
      PIO0_TX1,
      --  Select PIO0's TX FIFO 2 as TREQ
      PIO0_TX2,
      --  Select PIO0's TX FIFO 3 as TREQ
      PIO0_TX3,
      --  Select PIO0's RX FIFO 0 as TREQ
      PIO0_RX0,
      --  Select PIO0's RX FIFO 1 as TREQ
      PIO0_RX1,
      --  Select PIO0's RX FIFO 2 as TREQ
      PIO0_RX2,
      --  Select PIO0's RX FIFO 3 as TREQ
      PIO0_RX3,
      --  Select PIO1's TX FIFO 0 as TREQ
      PIO1_TX0,
      --  Select PIO1's TX FIFO 1 as TREQ
      PIO1_TX1,
      --  Select PIO1's TX FIFO 2 as TREQ
      PIO1_TX2,
      --  Select PIO1's TX FIFO 3 as TREQ
      PIO1_TX3,
      --  Select PIO1's RX FIFO 0 as TREQ
      PIO1_RX0,
      --  Select PIO1's RX FIFO 1 as TREQ
      PIO1_RX1,
      --  Select PIO1's RX FIFO 2 as TREQ
      PIO1_RX2,
      --  Select PIO1's RX FIFO 3 as TREQ
      PIO1_RX3,
      --  Select PIO2's TX FIFO 0 as TREQ
      PIO2_TX0,
      --  Select PIO2's TX FIFO 1 as TREQ
      PIO2_TX1,
      --  Select PIO2's TX FIFO 2 as TREQ
      PIO2_TX2,
      --  Select PIO2's TX FIFO 3 as TREQ
      PIO2_TX3,
      --  Select PIO2's RX FIFO 0 as TREQ
      PIO2_RX0,
      --  Select PIO2's RX FIFO 1 as TREQ
      PIO2_RX1,
      --  Select PIO2's RX FIFO 2 as TREQ
      PIO2_RX2,
      --  Select PIO2's RX FIFO 3 as TREQ
      PIO2_RX3,
      --  Select SPI0's TX FIFO as TREQ
      SPI0_TX,
      --  Select SPI0's RX FIFO as TREQ
      SPI0_RX,
      --  Select SPI1's TX FIFO as TREQ
      SPI1_TX,
      --  Select SPI1's RX FIFO as TREQ
      SPI1_RX,
      --  Select UART0's TX FIFO as TREQ
      UART0_TX,
      --  Select UART0's RX FIFO as TREQ
      UART0_RX,
      --  Select UART1's TX FIFO as TREQ
      UART1_TX,
      --  Select UART1's RX FIFO as TREQ
      UART1_RX,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP0,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP1,
      --  Select PWM Counter 2's Wrap Value as TREQ
      PWM_WRAP2,
      --  Select PWM Counter 3's Wrap Value as TREQ
      PWM_WRAP3,
      --  Select PWM Counter 4's Wrap Value as TREQ
      PWM_WRAP4,
      --  Select PWM Counter 5's Wrap Value as TREQ
      PWM_WRAP5,
      --  Select PWM Counter 6's Wrap Value as TREQ
      PWM_WRAP6,
      --  Select PWM Counter 7's Wrap Value as TREQ
      PWM_WRAP7,
      --  Select PWM Counter 8's Wrap Value as TREQ
      PWM_WRAP8,
      --  Select PWM Counter 9's Wrap Value as TREQ
      PWM_WRAP9,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP10,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP11,
      --  Select I2C0's TX FIFO as TREQ
      I2C0_TX,
      --  Select I2C0's RX FIFO as TREQ
      I2C0_RX,
      --  Select I2C1's TX FIFO as TREQ
      I2C1_TX,
      --  Select I2C1's RX FIFO as TREQ
      I2C1_RX,
      --  Select the ADC as TREQ
      ADC,
      --  Select the XIP Streaming FIFO as TREQ
      XIP_STREAM,
      --  Select XIP_QMITX as TREQ
      XIP_QMITX,
      --  Select XIP_QMIRX as TREQ
      XIP_QMIRX,
      --  Select HSTX as TREQ
      HSTX,
      --  Select CORESIGHT as TREQ
      CORESIGHT,
      --  Select SHA256 as TREQ
      SHA256,
      --  Select Timer 0 as TREQ
      TIMER0,
      --  Select Timer 1 as TREQ
      TIMER1,
      --  Select Timer 2 as TREQ (Optional)
      TIMER2,
      --  Select Timer 3 as TREQ (Optional)
      TIMER3,
      --  Permanent request, for unpaced transfers.
      PERMANENT)
     with Size => 6;
   for CH8_CTRL_TRIG_TREQ_SEL_Field use
     (PIO0_TX0 => 0,
      PIO0_TX1 => 1,
      PIO0_TX2 => 2,
      PIO0_TX3 => 3,
      PIO0_RX0 => 4,
      PIO0_RX1 => 5,
      PIO0_RX2 => 6,
      PIO0_RX3 => 7,
      PIO1_TX0 => 8,
      PIO1_TX1 => 9,
      PIO1_TX2 => 10,
      PIO1_TX3 => 11,
      PIO1_RX0 => 12,
      PIO1_RX1 => 13,
      PIO1_RX2 => 14,
      PIO1_RX3 => 15,
      PIO2_TX0 => 16,
      PIO2_TX1 => 17,
      PIO2_TX2 => 18,
      PIO2_TX3 => 19,
      PIO2_RX0 => 20,
      PIO2_RX1 => 21,
      PIO2_RX2 => 22,
      PIO2_RX3 => 23,
      SPI0_TX => 24,
      SPI0_RX => 25,
      SPI1_TX => 26,
      SPI1_RX => 27,
      UART0_TX => 28,
      UART0_RX => 29,
      UART1_TX => 30,
      UART1_RX => 31,
      PWM_WRAP0 => 32,
      PWM_WRAP1 => 33,
      PWM_WRAP2 => 34,
      PWM_WRAP3 => 35,
      PWM_WRAP4 => 36,
      PWM_WRAP5 => 37,
      PWM_WRAP6 => 38,
      PWM_WRAP7 => 39,
      PWM_WRAP8 => 40,
      PWM_WRAP9 => 41,
      PWM_WRAP10 => 42,
      PWM_WRAP11 => 43,
      I2C0_TX => 44,
      I2C0_RX => 45,
      I2C1_TX => 46,
      I2C1_RX => 47,
      ADC => 48,
      XIP_STREAM => 49,
      XIP_QMITX => 50,
      XIP_QMIRX => 51,
      HSTX => 52,
      CORESIGHT => 53,
      SHA256 => 54,
      TIMER0 => 59,
      TIMER1 => 60,
      TIMER2 => 61,
      TIMER3 => 62,
      PERMANENT => 63);

   --  DMA Channel 8 Control and Status
   type CH8_CTRL_TRIG_Register is record
      --  DMA Channel Enable. When 1, the channel will respond to triggering
      --  events, which will cause it to become BUSY and start transferring
      --  data. When 0, the channel will ignore triggers, stop issuing
      --  transfers, and pause the current transfer sequence (i.e. BUSY will
      --  remain high if already high)
      EN             : Boolean := False;
      --  HIGH_PRIORITY gives a channel preferential treatment in issue
      --  scheduling: in each scheduling round, all high priority channels are
      --  considered first, and then only a single low priority channel, before
      --  returning to the high priority channels. This only affects the order
      --  in which the DMA schedules channels. The DMA's bus priority is not
      --  changed. If the DMA is not saturated then a low priority channel will
      --  see no loss of throughput.
      HIGH_PRIORITY  : Boolean := False;
      --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
      --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
      DATA_SIZE      : CH8_CTRL_TRIG_DATA_SIZE_Field :=
                        RP2350_SVD.DMA.SIZE_BYTE;
      --  If 1, the read address increments with each transfer. If 0, each read
      --  is directed to the same, initial address. Generally this should be
      --  disabled for peripheral-to-memory transfers.
      INCR_READ      : Boolean := False;
      --  If 1, and INCR_READ is 1, the read address is decremented rather than
      --  incremented with each transfer. If 1, and INCR_READ is 0, this
      --  otherwise-unused combination causes the read address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_READ_REV  : Boolean := False;
      --  If 1, the write address increments with each transfer. If 0, each
      --  write is directed to the same, initial address. Generally this should
      --  be disabled for memory-to-peripheral transfers.
      INCR_WRITE     : Boolean := False;
      --  If 1, and INCR_WRITE is 1, the write address is decremented rather
      --  than incremented with each transfer. If 1, and INCR_WRITE is 0, this
      --  otherwise-unused combination causes the write address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_WRITE_REV : Boolean := False;
      --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
      --  the lower n bits of the address will change. This wraps the address
      --  on a (1 << n) byte boundary, facilitating access to naturally-aligned
      --  ring buffers. Ring sizes between 2 and 32768 bytes are possible. This
      --  can apply to either read or write addresses, based on value of
      --  RING_SEL.
      RING_SIZE      : CH8_CTRL_TRIG_RING_SIZE_Field :=
                        RP2350_SVD.DMA.RING_NONE;
      --  Select whether RING_SIZE applies to read or write addresses. If 0,
      --  read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1,
      --  write addresses are wrapped.
      RING_SEL       : Boolean := False;
      --  When this channel completes, it will trigger the channel indicated by
      --  CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_. Note this
      --  field resets to 0, so channels 1 and above will chain to channel 0 by
      --  default. Set this field to avoid this behaviour.
      CHAIN_TO       : CH8_CTRL_TRIG_CHAIN_TO_Field := 16#0#;
      --  Select a Transfer Request signal. The channel uses the transfer
      --  request signal to pace its data transfer rate. Sources for TREQ
      --  signals are internal (TIMERS) or external (DREQ, a Data Request from
      --  the system). 0x0 to 0x3a -> select DREQ n as TREQ
      TREQ_SEL       : CH8_CTRL_TRIG_TREQ_SEL_Field :=
                        RP2350_SVD.DMA.PIO0_TX0;
      --  In QUIET mode, the channel does not generate IRQs at the end of every
      --  transfer block. Instead, an IRQ is raised when NULL is written to a
      --  trigger register, indicating the end of a control block chain. This
      --  reduces the number of interrupts to be serviced by the CPU when
      --  transferring a DMA chain of many small control blocks.
      IRQ_QUIET      : Boolean := False;
      --  Apply byte-swap transformation to DMA data. For byte data, this has
      --  no effect. For halfword data, the two bytes of each halfword are
      --  swapped. For word data, the four bytes of each word are swapped to
      --  reverse order.
      BSWAP          : Boolean := False;
      --  If 1, this channel's data transfers are visible to the sniff
      --  hardware, and each transfer will advance the state of the checksum.
      --  This only applies if the sniff hardware is enabled, and has this
      --  channel selected. This allows checksum to be enabled or disabled on a
      --  per-control- block basis.
      SNIFF_EN       : Boolean := False;
      --  Read-only. This flag goes high when the channel starts a new transfer
      --  sequence, and low when the last transfer of that sequence completes.
      --  Clearing EN while BUSY is high pauses the channel, and BUSY will stay
      --  high while paused. To terminate a sequence early (and clear the BUSY
      --  flag), see CHAN_ABORT.
      BUSY           : Boolean := False;
      --  unspecified
      Reserved_27_28 : HAL.UInt2 := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a write bus error. Write one
      --  to clear. WRITE_ADDR shows the approximate address where the bus
      --  error was encountered (will not be earlier, or more than 5 transfers
      --  later)
      WRITE_ERROR    : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a read bus error. Write one
      --  to clear. READ_ADDR shows the approximate address where the bus error
      --  was encountered (will not be earlier, or more than 3 transfers later)
      READ_ERROR     : Boolean := False;
      --  Read-only. Logical OR of the READ_ERROR and WRITE_ERROR flags. The
      --  channel halts when it encounters any bus error, and always raises its
      --  channel IRQ flag.
      AHB_ERROR      : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH8_CTRL_TRIG_Register use record
      EN             at 0 range 0 .. 0;
      HIGH_PRIORITY  at 0 range 1 .. 1;
      DATA_SIZE      at 0 range 2 .. 3;
      INCR_READ      at 0 range 4 .. 4;
      INCR_READ_REV  at 0 range 5 .. 5;
      INCR_WRITE     at 0 range 6 .. 6;
      INCR_WRITE_REV at 0 range 7 .. 7;
      RING_SIZE      at 0 range 8 .. 11;
      RING_SEL       at 0 range 12 .. 12;
      CHAIN_TO       at 0 range 13 .. 16;
      TREQ_SEL       at 0 range 17 .. 22;
      IRQ_QUIET      at 0 range 23 .. 23;
      BSWAP          at 0 range 24 .. 24;
      SNIFF_EN       at 0 range 25 .. 25;
      BUSY           at 0 range 26 .. 26;
      Reserved_27_28 at 0 range 27 .. 28;
      WRITE_ERROR    at 0 range 29 .. 29;
      READ_ERROR     at 0 range 30 .. 30;
      AHB_ERROR      at 0 range 31 .. 31;
   end record;

   subtype CH9_TRANS_COUNT_COUNT_Field is HAL.UInt28;

   --  When MODE is 0x0, the transfer count decrements with each transfer until
   --  0, and then the channel triggers the next channel indicated by
   --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with each
   --  transfer until 0, and then the channel re-triggers itself, in addition
   --  to the trigger indicated by CTRL_CHAIN_TO. This is useful for e.g. an
   --  endless ring-buffer DMA with periodic interrupts. When MODE is 0xf, the
   --  transfer count does not decrement. The DMA channel performs an endless
   --  sequence of transfers, never triggering other channels or raising
   --  interrupts, until an ABORT is raised. All other values are reserved.
   type CH9_TRANS_COUNT_MODE_Field is
     (NORMAL,
      TRIGGER_SELF,
      ENDLESS)
     with Size => 4;
   for CH9_TRANS_COUNT_MODE_Field use
     (NORMAL => 0,
      TRIGGER_SELF => 1,
      ENDLESS => 15);

   --  DMA Channel 9 Transfer Count
   type CH9_TRANS_COUNT_Register is record
      --  28-bit transfer count (256 million transfers maximum). Program the
      --  number of bus transfers a channel will perform before halting. Note
      --  that, if transfers are larger than one byte in size, this is not
      --  equal to the number of bytes transferred (see CTRL_DATA_SIZE). When
      --  the channel is active, reading this register shows the number of
      --  transfers remaining, updating automatically each time a write
      --  transfer completes. Writing this register sets the RELOAD value for
      --  the transfer counter. Each time this channel is triggered, the RELOAD
      --  value is copied into the live transfer counter. The channel can be
      --  started multiple times, and will perform the same number of transfers
      --  each time, as programmed by most recent write. The RELOAD value can
      --  be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the
      --  written value is used immediately as the length of the new transfer
      --  sequence, as well as being written to RELOAD.
      COUNT : CH9_TRANS_COUNT_COUNT_Field := 16#0#;
      --  When MODE is 0x0, the transfer count decrements with each transfer
      --  until 0, and then the channel triggers the next channel indicated by
      --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with
      --  each transfer until 0, and then the channel re-triggers itself, in
      --  addition to the trigger indicated by CTRL_CHAIN_TO. This is useful
      --  for e.g. an endless ring-buffer DMA with periodic interrupts. When
      --  MODE is 0xf, the transfer count does not decrement. The DMA channel
      --  performs an endless sequence of transfers, never triggering other
      --  channels or raising interrupts, until an ABORT is raised. All other
      --  values are reserved.
      MODE  : CH9_TRANS_COUNT_MODE_Field := RP2350_SVD.DMA.NORMAL;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH9_TRANS_COUNT_Register use record
      COUNT at 0 range 0 .. 27;
      MODE  at 0 range 28 .. 31;
   end record;

   --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
   --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
   type CH9_CTRL_TRIG_DATA_SIZE_Field is
     (SIZE_BYTE,
      SIZE_HALFWORD,
      SIZE_WORD)
     with Size => 2;
   for CH9_CTRL_TRIG_DATA_SIZE_Field use
     (SIZE_BYTE => 0,
      SIZE_HALFWORD => 1,
      SIZE_WORD => 2);

   --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
   --  the lower n bits of the address will change. This wraps the address on a
   --  (1 << n) byte boundary, facilitating access to naturally-aligned ring
   --  buffers. Ring sizes between 2 and 32768 bytes are possible. This can
   --  apply to either read or write addresses, based on value of RING_SEL.
   type CH9_CTRL_TRIG_RING_SIZE_Field is
     (RING_NONE)
     with Size => 4;
   for CH9_CTRL_TRIG_RING_SIZE_Field use
     (RING_NONE => 0);

   subtype CH9_CTRL_TRIG_CHAIN_TO_Field is HAL.UInt4;

   --  Select a Transfer Request signal. The channel uses the transfer request
   --  signal to pace its data transfer rate. Sources for TREQ signals are
   --  internal (TIMERS) or external (DREQ, a Data Request from the system).
   --  0x0 to 0x3a -> select DREQ n as TREQ
   type CH9_CTRL_TRIG_TREQ_SEL_Field is
     (--  Select PIO0's TX FIFO 0 as TREQ
      PIO0_TX0,
      --  Select PIO0's TX FIFO 1 as TREQ
      PIO0_TX1,
      --  Select PIO0's TX FIFO 2 as TREQ
      PIO0_TX2,
      --  Select PIO0's TX FIFO 3 as TREQ
      PIO0_TX3,
      --  Select PIO0's RX FIFO 0 as TREQ
      PIO0_RX0,
      --  Select PIO0's RX FIFO 1 as TREQ
      PIO0_RX1,
      --  Select PIO0's RX FIFO 2 as TREQ
      PIO0_RX2,
      --  Select PIO0's RX FIFO 3 as TREQ
      PIO0_RX3,
      --  Select PIO1's TX FIFO 0 as TREQ
      PIO1_TX0,
      --  Select PIO1's TX FIFO 1 as TREQ
      PIO1_TX1,
      --  Select PIO1's TX FIFO 2 as TREQ
      PIO1_TX2,
      --  Select PIO1's TX FIFO 3 as TREQ
      PIO1_TX3,
      --  Select PIO1's RX FIFO 0 as TREQ
      PIO1_RX0,
      --  Select PIO1's RX FIFO 1 as TREQ
      PIO1_RX1,
      --  Select PIO1's RX FIFO 2 as TREQ
      PIO1_RX2,
      --  Select PIO1's RX FIFO 3 as TREQ
      PIO1_RX3,
      --  Select PIO2's TX FIFO 0 as TREQ
      PIO2_TX0,
      --  Select PIO2's TX FIFO 1 as TREQ
      PIO2_TX1,
      --  Select PIO2's TX FIFO 2 as TREQ
      PIO2_TX2,
      --  Select PIO2's TX FIFO 3 as TREQ
      PIO2_TX3,
      --  Select PIO2's RX FIFO 0 as TREQ
      PIO2_RX0,
      --  Select PIO2's RX FIFO 1 as TREQ
      PIO2_RX1,
      --  Select PIO2's RX FIFO 2 as TREQ
      PIO2_RX2,
      --  Select PIO2's RX FIFO 3 as TREQ
      PIO2_RX3,
      --  Select SPI0's TX FIFO as TREQ
      SPI0_TX,
      --  Select SPI0's RX FIFO as TREQ
      SPI0_RX,
      --  Select SPI1's TX FIFO as TREQ
      SPI1_TX,
      --  Select SPI1's RX FIFO as TREQ
      SPI1_RX,
      --  Select UART0's TX FIFO as TREQ
      UART0_TX,
      --  Select UART0's RX FIFO as TREQ
      UART0_RX,
      --  Select UART1's TX FIFO as TREQ
      UART1_TX,
      --  Select UART1's RX FIFO as TREQ
      UART1_RX,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP0,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP1,
      --  Select PWM Counter 2's Wrap Value as TREQ
      PWM_WRAP2,
      --  Select PWM Counter 3's Wrap Value as TREQ
      PWM_WRAP3,
      --  Select PWM Counter 4's Wrap Value as TREQ
      PWM_WRAP4,
      --  Select PWM Counter 5's Wrap Value as TREQ
      PWM_WRAP5,
      --  Select PWM Counter 6's Wrap Value as TREQ
      PWM_WRAP6,
      --  Select PWM Counter 7's Wrap Value as TREQ
      PWM_WRAP7,
      --  Select PWM Counter 8's Wrap Value as TREQ
      PWM_WRAP8,
      --  Select PWM Counter 9's Wrap Value as TREQ
      PWM_WRAP9,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP10,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP11,
      --  Select I2C0's TX FIFO as TREQ
      I2C0_TX,
      --  Select I2C0's RX FIFO as TREQ
      I2C0_RX,
      --  Select I2C1's TX FIFO as TREQ
      I2C1_TX,
      --  Select I2C1's RX FIFO as TREQ
      I2C1_RX,
      --  Select the ADC as TREQ
      ADC,
      --  Select the XIP Streaming FIFO as TREQ
      XIP_STREAM,
      --  Select XIP_QMITX as TREQ
      XIP_QMITX,
      --  Select XIP_QMIRX as TREQ
      XIP_QMIRX,
      --  Select HSTX as TREQ
      HSTX,
      --  Select CORESIGHT as TREQ
      CORESIGHT,
      --  Select SHA256 as TREQ
      SHA256,
      --  Select Timer 0 as TREQ
      TIMER0,
      --  Select Timer 1 as TREQ
      TIMER1,
      --  Select Timer 2 as TREQ (Optional)
      TIMER2,
      --  Select Timer 3 as TREQ (Optional)
      TIMER3,
      --  Permanent request, for unpaced transfers.
      PERMANENT)
     with Size => 6;
   for CH9_CTRL_TRIG_TREQ_SEL_Field use
     (PIO0_TX0 => 0,
      PIO0_TX1 => 1,
      PIO0_TX2 => 2,
      PIO0_TX3 => 3,
      PIO0_RX0 => 4,
      PIO0_RX1 => 5,
      PIO0_RX2 => 6,
      PIO0_RX3 => 7,
      PIO1_TX0 => 8,
      PIO1_TX1 => 9,
      PIO1_TX2 => 10,
      PIO1_TX3 => 11,
      PIO1_RX0 => 12,
      PIO1_RX1 => 13,
      PIO1_RX2 => 14,
      PIO1_RX3 => 15,
      PIO2_TX0 => 16,
      PIO2_TX1 => 17,
      PIO2_TX2 => 18,
      PIO2_TX3 => 19,
      PIO2_RX0 => 20,
      PIO2_RX1 => 21,
      PIO2_RX2 => 22,
      PIO2_RX3 => 23,
      SPI0_TX => 24,
      SPI0_RX => 25,
      SPI1_TX => 26,
      SPI1_RX => 27,
      UART0_TX => 28,
      UART0_RX => 29,
      UART1_TX => 30,
      UART1_RX => 31,
      PWM_WRAP0 => 32,
      PWM_WRAP1 => 33,
      PWM_WRAP2 => 34,
      PWM_WRAP3 => 35,
      PWM_WRAP4 => 36,
      PWM_WRAP5 => 37,
      PWM_WRAP6 => 38,
      PWM_WRAP7 => 39,
      PWM_WRAP8 => 40,
      PWM_WRAP9 => 41,
      PWM_WRAP10 => 42,
      PWM_WRAP11 => 43,
      I2C0_TX => 44,
      I2C0_RX => 45,
      I2C1_TX => 46,
      I2C1_RX => 47,
      ADC => 48,
      XIP_STREAM => 49,
      XIP_QMITX => 50,
      XIP_QMIRX => 51,
      HSTX => 52,
      CORESIGHT => 53,
      SHA256 => 54,
      TIMER0 => 59,
      TIMER1 => 60,
      TIMER2 => 61,
      TIMER3 => 62,
      PERMANENT => 63);

   --  DMA Channel 9 Control and Status
   type CH9_CTRL_TRIG_Register is record
      --  DMA Channel Enable. When 1, the channel will respond to triggering
      --  events, which will cause it to become BUSY and start transferring
      --  data. When 0, the channel will ignore triggers, stop issuing
      --  transfers, and pause the current transfer sequence (i.e. BUSY will
      --  remain high if already high)
      EN             : Boolean := False;
      --  HIGH_PRIORITY gives a channel preferential treatment in issue
      --  scheduling: in each scheduling round, all high priority channels are
      --  considered first, and then only a single low priority channel, before
      --  returning to the high priority channels. This only affects the order
      --  in which the DMA schedules channels. The DMA's bus priority is not
      --  changed. If the DMA is not saturated then a low priority channel will
      --  see no loss of throughput.
      HIGH_PRIORITY  : Boolean := False;
      --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
      --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
      DATA_SIZE      : CH9_CTRL_TRIG_DATA_SIZE_Field :=
                        RP2350_SVD.DMA.SIZE_BYTE;
      --  If 1, the read address increments with each transfer. If 0, each read
      --  is directed to the same, initial address. Generally this should be
      --  disabled for peripheral-to-memory transfers.
      INCR_READ      : Boolean := False;
      --  If 1, and INCR_READ is 1, the read address is decremented rather than
      --  incremented with each transfer. If 1, and INCR_READ is 0, this
      --  otherwise-unused combination causes the read address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_READ_REV  : Boolean := False;
      --  If 1, the write address increments with each transfer. If 0, each
      --  write is directed to the same, initial address. Generally this should
      --  be disabled for memory-to-peripheral transfers.
      INCR_WRITE     : Boolean := False;
      --  If 1, and INCR_WRITE is 1, the write address is decremented rather
      --  than incremented with each transfer. If 1, and INCR_WRITE is 0, this
      --  otherwise-unused combination causes the write address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_WRITE_REV : Boolean := False;
      --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
      --  the lower n bits of the address will change. This wraps the address
      --  on a (1 << n) byte boundary, facilitating access to naturally-aligned
      --  ring buffers. Ring sizes between 2 and 32768 bytes are possible. This
      --  can apply to either read or write addresses, based on value of
      --  RING_SEL.
      RING_SIZE      : CH9_CTRL_TRIG_RING_SIZE_Field :=
                        RP2350_SVD.DMA.RING_NONE;
      --  Select whether RING_SIZE applies to read or write addresses. If 0,
      --  read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1,
      --  write addresses are wrapped.
      RING_SEL       : Boolean := False;
      --  When this channel completes, it will trigger the channel indicated by
      --  CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_. Note this
      --  field resets to 0, so channels 1 and above will chain to channel 0 by
      --  default. Set this field to avoid this behaviour.
      CHAIN_TO       : CH9_CTRL_TRIG_CHAIN_TO_Field := 16#0#;
      --  Select a Transfer Request signal. The channel uses the transfer
      --  request signal to pace its data transfer rate. Sources for TREQ
      --  signals are internal (TIMERS) or external (DREQ, a Data Request from
      --  the system). 0x0 to 0x3a -> select DREQ n as TREQ
      TREQ_SEL       : CH9_CTRL_TRIG_TREQ_SEL_Field :=
                        RP2350_SVD.DMA.PIO0_TX0;
      --  In QUIET mode, the channel does not generate IRQs at the end of every
      --  transfer block. Instead, an IRQ is raised when NULL is written to a
      --  trigger register, indicating the end of a control block chain. This
      --  reduces the number of interrupts to be serviced by the CPU when
      --  transferring a DMA chain of many small control blocks.
      IRQ_QUIET      : Boolean := False;
      --  Apply byte-swap transformation to DMA data. For byte data, this has
      --  no effect. For halfword data, the two bytes of each halfword are
      --  swapped. For word data, the four bytes of each word are swapped to
      --  reverse order.
      BSWAP          : Boolean := False;
      --  If 1, this channel's data transfers are visible to the sniff
      --  hardware, and each transfer will advance the state of the checksum.
      --  This only applies if the sniff hardware is enabled, and has this
      --  channel selected. This allows checksum to be enabled or disabled on a
      --  per-control- block basis.
      SNIFF_EN       : Boolean := False;
      --  Read-only. This flag goes high when the channel starts a new transfer
      --  sequence, and low when the last transfer of that sequence completes.
      --  Clearing EN while BUSY is high pauses the channel, and BUSY will stay
      --  high while paused. To terminate a sequence early (and clear the BUSY
      --  flag), see CHAN_ABORT.
      BUSY           : Boolean := False;
      --  unspecified
      Reserved_27_28 : HAL.UInt2 := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a write bus error. Write one
      --  to clear. WRITE_ADDR shows the approximate address where the bus
      --  error was encountered (will not be earlier, or more than 5 transfers
      --  later)
      WRITE_ERROR    : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a read bus error. Write one
      --  to clear. READ_ADDR shows the approximate address where the bus error
      --  was encountered (will not be earlier, or more than 3 transfers later)
      READ_ERROR     : Boolean := False;
      --  Read-only. Logical OR of the READ_ERROR and WRITE_ERROR flags. The
      --  channel halts when it encounters any bus error, and always raises its
      --  channel IRQ flag.
      AHB_ERROR      : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH9_CTRL_TRIG_Register use record
      EN             at 0 range 0 .. 0;
      HIGH_PRIORITY  at 0 range 1 .. 1;
      DATA_SIZE      at 0 range 2 .. 3;
      INCR_READ      at 0 range 4 .. 4;
      INCR_READ_REV  at 0 range 5 .. 5;
      INCR_WRITE     at 0 range 6 .. 6;
      INCR_WRITE_REV at 0 range 7 .. 7;
      RING_SIZE      at 0 range 8 .. 11;
      RING_SEL       at 0 range 12 .. 12;
      CHAIN_TO       at 0 range 13 .. 16;
      TREQ_SEL       at 0 range 17 .. 22;
      IRQ_QUIET      at 0 range 23 .. 23;
      BSWAP          at 0 range 24 .. 24;
      SNIFF_EN       at 0 range 25 .. 25;
      BUSY           at 0 range 26 .. 26;
      Reserved_27_28 at 0 range 27 .. 28;
      WRITE_ERROR    at 0 range 29 .. 29;
      READ_ERROR     at 0 range 30 .. 30;
      AHB_ERROR      at 0 range 31 .. 31;
   end record;

   subtype CH10_TRANS_COUNT_COUNT_Field is HAL.UInt28;

   --  When MODE is 0x0, the transfer count decrements with each transfer until
   --  0, and then the channel triggers the next channel indicated by
   --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with each
   --  transfer until 0, and then the channel re-triggers itself, in addition
   --  to the trigger indicated by CTRL_CHAIN_TO. This is useful for e.g. an
   --  endless ring-buffer DMA with periodic interrupts. When MODE is 0xf, the
   --  transfer count does not decrement. The DMA channel performs an endless
   --  sequence of transfers, never triggering other channels or raising
   --  interrupts, until an ABORT is raised. All other values are reserved.
   type CH10_TRANS_COUNT_MODE_Field is
     (NORMAL,
      TRIGGER_SELF,
      ENDLESS)
     with Size => 4;
   for CH10_TRANS_COUNT_MODE_Field use
     (NORMAL => 0,
      TRIGGER_SELF => 1,
      ENDLESS => 15);

   --  DMA Channel 10 Transfer Count
   type CH10_TRANS_COUNT_Register is record
      --  28-bit transfer count (256 million transfers maximum). Program the
      --  number of bus transfers a channel will perform before halting. Note
      --  that, if transfers are larger than one byte in size, this is not
      --  equal to the number of bytes transferred (see CTRL_DATA_SIZE). When
      --  the channel is active, reading this register shows the number of
      --  transfers remaining, updating automatically each time a write
      --  transfer completes. Writing this register sets the RELOAD value for
      --  the transfer counter. Each time this channel is triggered, the RELOAD
      --  value is copied into the live transfer counter. The channel can be
      --  started multiple times, and will perform the same number of transfers
      --  each time, as programmed by most recent write. The RELOAD value can
      --  be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the
      --  written value is used immediately as the length of the new transfer
      --  sequence, as well as being written to RELOAD.
      COUNT : CH10_TRANS_COUNT_COUNT_Field := 16#0#;
      --  When MODE is 0x0, the transfer count decrements with each transfer
      --  until 0, and then the channel triggers the next channel indicated by
      --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with
      --  each transfer until 0, and then the channel re-triggers itself, in
      --  addition to the trigger indicated by CTRL_CHAIN_TO. This is useful
      --  for e.g. an endless ring-buffer DMA with periodic interrupts. When
      --  MODE is 0xf, the transfer count does not decrement. The DMA channel
      --  performs an endless sequence of transfers, never triggering other
      --  channels or raising interrupts, until an ABORT is raised. All other
      --  values are reserved.
      MODE  : CH10_TRANS_COUNT_MODE_Field := RP2350_SVD.DMA.NORMAL;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH10_TRANS_COUNT_Register use record
      COUNT at 0 range 0 .. 27;
      MODE  at 0 range 28 .. 31;
   end record;

   --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
   --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
   type CH10_CTRL_TRIG_DATA_SIZE_Field is
     (SIZE_BYTE,
      SIZE_HALFWORD,
      SIZE_WORD)
     with Size => 2;
   for CH10_CTRL_TRIG_DATA_SIZE_Field use
     (SIZE_BYTE => 0,
      SIZE_HALFWORD => 1,
      SIZE_WORD => 2);

   --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
   --  the lower n bits of the address will change. This wraps the address on a
   --  (1 << n) byte boundary, facilitating access to naturally-aligned ring
   --  buffers. Ring sizes between 2 and 32768 bytes are possible. This can
   --  apply to either read or write addresses, based on value of RING_SEL.
   type CH10_CTRL_TRIG_RING_SIZE_Field is
     (RING_NONE)
     with Size => 4;
   for CH10_CTRL_TRIG_RING_SIZE_Field use
     (RING_NONE => 0);

   subtype CH10_CTRL_TRIG_CHAIN_TO_Field is HAL.UInt4;

   --  Select a Transfer Request signal. The channel uses the transfer request
   --  signal to pace its data transfer rate. Sources for TREQ signals are
   --  internal (TIMERS) or external (DREQ, a Data Request from the system).
   --  0x0 to 0x3a -> select DREQ n as TREQ
   type CH10_CTRL_TRIG_TREQ_SEL_Field is
     (--  Select PIO0's TX FIFO 0 as TREQ
      PIO0_TX0,
      --  Select PIO0's TX FIFO 1 as TREQ
      PIO0_TX1,
      --  Select PIO0's TX FIFO 2 as TREQ
      PIO0_TX2,
      --  Select PIO0's TX FIFO 3 as TREQ
      PIO0_TX3,
      --  Select PIO0's RX FIFO 0 as TREQ
      PIO0_RX0,
      --  Select PIO0's RX FIFO 1 as TREQ
      PIO0_RX1,
      --  Select PIO0's RX FIFO 2 as TREQ
      PIO0_RX2,
      --  Select PIO0's RX FIFO 3 as TREQ
      PIO0_RX3,
      --  Select PIO1's TX FIFO 0 as TREQ
      PIO1_TX0,
      --  Select PIO1's TX FIFO 1 as TREQ
      PIO1_TX1,
      --  Select PIO1's TX FIFO 2 as TREQ
      PIO1_TX2,
      --  Select PIO1's TX FIFO 3 as TREQ
      PIO1_TX3,
      --  Select PIO1's RX FIFO 0 as TREQ
      PIO1_RX0,
      --  Select PIO1's RX FIFO 1 as TREQ
      PIO1_RX1,
      --  Select PIO1's RX FIFO 2 as TREQ
      PIO1_RX2,
      --  Select PIO1's RX FIFO 3 as TREQ
      PIO1_RX3,
      --  Select PIO2's TX FIFO 0 as TREQ
      PIO2_TX0,
      --  Select PIO2's TX FIFO 1 as TREQ
      PIO2_TX1,
      --  Select PIO2's TX FIFO 2 as TREQ
      PIO2_TX2,
      --  Select PIO2's TX FIFO 3 as TREQ
      PIO2_TX3,
      --  Select PIO2's RX FIFO 0 as TREQ
      PIO2_RX0,
      --  Select PIO2's RX FIFO 1 as TREQ
      PIO2_RX1,
      --  Select PIO2's RX FIFO 2 as TREQ
      PIO2_RX2,
      --  Select PIO2's RX FIFO 3 as TREQ
      PIO2_RX3,
      --  Select SPI0's TX FIFO as TREQ
      SPI0_TX,
      --  Select SPI0's RX FIFO as TREQ
      SPI0_RX,
      --  Select SPI1's TX FIFO as TREQ
      SPI1_TX,
      --  Select SPI1's RX FIFO as TREQ
      SPI1_RX,
      --  Select UART0's TX FIFO as TREQ
      UART0_TX,
      --  Select UART0's RX FIFO as TREQ
      UART0_RX,
      --  Select UART1's TX FIFO as TREQ
      UART1_TX,
      --  Select UART1's RX FIFO as TREQ
      UART1_RX,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP0,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP1,
      --  Select PWM Counter 2's Wrap Value as TREQ
      PWM_WRAP2,
      --  Select PWM Counter 3's Wrap Value as TREQ
      PWM_WRAP3,
      --  Select PWM Counter 4's Wrap Value as TREQ
      PWM_WRAP4,
      --  Select PWM Counter 5's Wrap Value as TREQ
      PWM_WRAP5,
      --  Select PWM Counter 6's Wrap Value as TREQ
      PWM_WRAP6,
      --  Select PWM Counter 7's Wrap Value as TREQ
      PWM_WRAP7,
      --  Select PWM Counter 8's Wrap Value as TREQ
      PWM_WRAP8,
      --  Select PWM Counter 9's Wrap Value as TREQ
      PWM_WRAP9,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP10,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP11,
      --  Select I2C0's TX FIFO as TREQ
      I2C0_TX,
      --  Select I2C0's RX FIFO as TREQ
      I2C0_RX,
      --  Select I2C1's TX FIFO as TREQ
      I2C1_TX,
      --  Select I2C1's RX FIFO as TREQ
      I2C1_RX,
      --  Select the ADC as TREQ
      ADC,
      --  Select the XIP Streaming FIFO as TREQ
      XIP_STREAM,
      --  Select XIP_QMITX as TREQ
      XIP_QMITX,
      --  Select XIP_QMIRX as TREQ
      XIP_QMIRX,
      --  Select HSTX as TREQ
      HSTX,
      --  Select CORESIGHT as TREQ
      CORESIGHT,
      --  Select SHA256 as TREQ
      SHA256,
      --  Select Timer 0 as TREQ
      TIMER0,
      --  Select Timer 1 as TREQ
      TIMER1,
      --  Select Timer 2 as TREQ (Optional)
      TIMER2,
      --  Select Timer 3 as TREQ (Optional)
      TIMER3,
      --  Permanent request, for unpaced transfers.
      PERMANENT)
     with Size => 6;
   for CH10_CTRL_TRIG_TREQ_SEL_Field use
     (PIO0_TX0 => 0,
      PIO0_TX1 => 1,
      PIO0_TX2 => 2,
      PIO0_TX3 => 3,
      PIO0_RX0 => 4,
      PIO0_RX1 => 5,
      PIO0_RX2 => 6,
      PIO0_RX3 => 7,
      PIO1_TX0 => 8,
      PIO1_TX1 => 9,
      PIO1_TX2 => 10,
      PIO1_TX3 => 11,
      PIO1_RX0 => 12,
      PIO1_RX1 => 13,
      PIO1_RX2 => 14,
      PIO1_RX3 => 15,
      PIO2_TX0 => 16,
      PIO2_TX1 => 17,
      PIO2_TX2 => 18,
      PIO2_TX3 => 19,
      PIO2_RX0 => 20,
      PIO2_RX1 => 21,
      PIO2_RX2 => 22,
      PIO2_RX3 => 23,
      SPI0_TX => 24,
      SPI0_RX => 25,
      SPI1_TX => 26,
      SPI1_RX => 27,
      UART0_TX => 28,
      UART0_RX => 29,
      UART1_TX => 30,
      UART1_RX => 31,
      PWM_WRAP0 => 32,
      PWM_WRAP1 => 33,
      PWM_WRAP2 => 34,
      PWM_WRAP3 => 35,
      PWM_WRAP4 => 36,
      PWM_WRAP5 => 37,
      PWM_WRAP6 => 38,
      PWM_WRAP7 => 39,
      PWM_WRAP8 => 40,
      PWM_WRAP9 => 41,
      PWM_WRAP10 => 42,
      PWM_WRAP11 => 43,
      I2C0_TX => 44,
      I2C0_RX => 45,
      I2C1_TX => 46,
      I2C1_RX => 47,
      ADC => 48,
      XIP_STREAM => 49,
      XIP_QMITX => 50,
      XIP_QMIRX => 51,
      HSTX => 52,
      CORESIGHT => 53,
      SHA256 => 54,
      TIMER0 => 59,
      TIMER1 => 60,
      TIMER2 => 61,
      TIMER3 => 62,
      PERMANENT => 63);

   --  DMA Channel 10 Control and Status
   type CH10_CTRL_TRIG_Register is record
      --  DMA Channel Enable. When 1, the channel will respond to triggering
      --  events, which will cause it to become BUSY and start transferring
      --  data. When 0, the channel will ignore triggers, stop issuing
      --  transfers, and pause the current transfer sequence (i.e. BUSY will
      --  remain high if already high)
      EN             : Boolean := False;
      --  HIGH_PRIORITY gives a channel preferential treatment in issue
      --  scheduling: in each scheduling round, all high priority channels are
      --  considered first, and then only a single low priority channel, before
      --  returning to the high priority channels. This only affects the order
      --  in which the DMA schedules channels. The DMA's bus priority is not
      --  changed. If the DMA is not saturated then a low priority channel will
      --  see no loss of throughput.
      HIGH_PRIORITY  : Boolean := False;
      --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
      --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
      DATA_SIZE      : CH10_CTRL_TRIG_DATA_SIZE_Field :=
                        RP2350_SVD.DMA.SIZE_BYTE;
      --  If 1, the read address increments with each transfer. If 0, each read
      --  is directed to the same, initial address. Generally this should be
      --  disabled for peripheral-to-memory transfers.
      INCR_READ      : Boolean := False;
      --  If 1, and INCR_READ is 1, the read address is decremented rather than
      --  incremented with each transfer. If 1, and INCR_READ is 0, this
      --  otherwise-unused combination causes the read address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_READ_REV  : Boolean := False;
      --  If 1, the write address increments with each transfer. If 0, each
      --  write is directed to the same, initial address. Generally this should
      --  be disabled for memory-to-peripheral transfers.
      INCR_WRITE     : Boolean := False;
      --  If 1, and INCR_WRITE is 1, the write address is decremented rather
      --  than incremented with each transfer. If 1, and INCR_WRITE is 0, this
      --  otherwise-unused combination causes the write address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_WRITE_REV : Boolean := False;
      --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
      --  the lower n bits of the address will change. This wraps the address
      --  on a (1 << n) byte boundary, facilitating access to naturally-aligned
      --  ring buffers. Ring sizes between 2 and 32768 bytes are possible. This
      --  can apply to either read or write addresses, based on value of
      --  RING_SEL.
      RING_SIZE      : CH10_CTRL_TRIG_RING_SIZE_Field :=
                        RP2350_SVD.DMA.RING_NONE;
      --  Select whether RING_SIZE applies to read or write addresses. If 0,
      --  read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1,
      --  write addresses are wrapped.
      RING_SEL       : Boolean := False;
      --  When this channel completes, it will trigger the channel indicated by
      --  CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_. Note this
      --  field resets to 0, so channels 1 and above will chain to channel 0 by
      --  default. Set this field to avoid this behaviour.
      CHAIN_TO       : CH10_CTRL_TRIG_CHAIN_TO_Field := 16#0#;
      --  Select a Transfer Request signal. The channel uses the transfer
      --  request signal to pace its data transfer rate. Sources for TREQ
      --  signals are internal (TIMERS) or external (DREQ, a Data Request from
      --  the system). 0x0 to 0x3a -> select DREQ n as TREQ
      TREQ_SEL       : CH10_CTRL_TRIG_TREQ_SEL_Field :=
                        RP2350_SVD.DMA.PIO0_TX0;
      --  In QUIET mode, the channel does not generate IRQs at the end of every
      --  transfer block. Instead, an IRQ is raised when NULL is written to a
      --  trigger register, indicating the end of a control block chain. This
      --  reduces the number of interrupts to be serviced by the CPU when
      --  transferring a DMA chain of many small control blocks.
      IRQ_QUIET      : Boolean := False;
      --  Apply byte-swap transformation to DMA data. For byte data, this has
      --  no effect. For halfword data, the two bytes of each halfword are
      --  swapped. For word data, the four bytes of each word are swapped to
      --  reverse order.
      BSWAP          : Boolean := False;
      --  If 1, this channel's data transfers are visible to the sniff
      --  hardware, and each transfer will advance the state of the checksum.
      --  This only applies if the sniff hardware is enabled, and has this
      --  channel selected. This allows checksum to be enabled or disabled on a
      --  per-control- block basis.
      SNIFF_EN       : Boolean := False;
      --  Read-only. This flag goes high when the channel starts a new transfer
      --  sequence, and low when the last transfer of that sequence completes.
      --  Clearing EN while BUSY is high pauses the channel, and BUSY will stay
      --  high while paused. To terminate a sequence early (and clear the BUSY
      --  flag), see CHAN_ABORT.
      BUSY           : Boolean := False;
      --  unspecified
      Reserved_27_28 : HAL.UInt2 := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a write bus error. Write one
      --  to clear. WRITE_ADDR shows the approximate address where the bus
      --  error was encountered (will not be earlier, or more than 5 transfers
      --  later)
      WRITE_ERROR    : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a read bus error. Write one
      --  to clear. READ_ADDR shows the approximate address where the bus error
      --  was encountered (will not be earlier, or more than 3 transfers later)
      READ_ERROR     : Boolean := False;
      --  Read-only. Logical OR of the READ_ERROR and WRITE_ERROR flags. The
      --  channel halts when it encounters any bus error, and always raises its
      --  channel IRQ flag.
      AHB_ERROR      : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH10_CTRL_TRIG_Register use record
      EN             at 0 range 0 .. 0;
      HIGH_PRIORITY  at 0 range 1 .. 1;
      DATA_SIZE      at 0 range 2 .. 3;
      INCR_READ      at 0 range 4 .. 4;
      INCR_READ_REV  at 0 range 5 .. 5;
      INCR_WRITE     at 0 range 6 .. 6;
      INCR_WRITE_REV at 0 range 7 .. 7;
      RING_SIZE      at 0 range 8 .. 11;
      RING_SEL       at 0 range 12 .. 12;
      CHAIN_TO       at 0 range 13 .. 16;
      TREQ_SEL       at 0 range 17 .. 22;
      IRQ_QUIET      at 0 range 23 .. 23;
      BSWAP          at 0 range 24 .. 24;
      SNIFF_EN       at 0 range 25 .. 25;
      BUSY           at 0 range 26 .. 26;
      Reserved_27_28 at 0 range 27 .. 28;
      WRITE_ERROR    at 0 range 29 .. 29;
      READ_ERROR     at 0 range 30 .. 30;
      AHB_ERROR      at 0 range 31 .. 31;
   end record;

   subtype CH11_TRANS_COUNT_COUNT_Field is HAL.UInt28;

   --  When MODE is 0x0, the transfer count decrements with each transfer until
   --  0, and then the channel triggers the next channel indicated by
   --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with each
   --  transfer until 0, and then the channel re-triggers itself, in addition
   --  to the trigger indicated by CTRL_CHAIN_TO. This is useful for e.g. an
   --  endless ring-buffer DMA with periodic interrupts. When MODE is 0xf, the
   --  transfer count does not decrement. The DMA channel performs an endless
   --  sequence of transfers, never triggering other channels or raising
   --  interrupts, until an ABORT is raised. All other values are reserved.
   type CH11_TRANS_COUNT_MODE_Field is
     (NORMAL,
      TRIGGER_SELF,
      ENDLESS)
     with Size => 4;
   for CH11_TRANS_COUNT_MODE_Field use
     (NORMAL => 0,
      TRIGGER_SELF => 1,
      ENDLESS => 15);

   --  DMA Channel 11 Transfer Count
   type CH11_TRANS_COUNT_Register is record
      --  28-bit transfer count (256 million transfers maximum). Program the
      --  number of bus transfers a channel will perform before halting. Note
      --  that, if transfers are larger than one byte in size, this is not
      --  equal to the number of bytes transferred (see CTRL_DATA_SIZE). When
      --  the channel is active, reading this register shows the number of
      --  transfers remaining, updating automatically each time a write
      --  transfer completes. Writing this register sets the RELOAD value for
      --  the transfer counter. Each time this channel is triggered, the RELOAD
      --  value is copied into the live transfer counter. The channel can be
      --  started multiple times, and will perform the same number of transfers
      --  each time, as programmed by most recent write. The RELOAD value can
      --  be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the
      --  written value is used immediately as the length of the new transfer
      --  sequence, as well as being written to RELOAD.
      COUNT : CH11_TRANS_COUNT_COUNT_Field := 16#0#;
      --  When MODE is 0x0, the transfer count decrements with each transfer
      --  until 0, and then the channel triggers the next channel indicated by
      --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with
      --  each transfer until 0, and then the channel re-triggers itself, in
      --  addition to the trigger indicated by CTRL_CHAIN_TO. This is useful
      --  for e.g. an endless ring-buffer DMA with periodic interrupts. When
      --  MODE is 0xf, the transfer count does not decrement. The DMA channel
      --  performs an endless sequence of transfers, never triggering other
      --  channels or raising interrupts, until an ABORT is raised. All other
      --  values are reserved.
      MODE  : CH11_TRANS_COUNT_MODE_Field := RP2350_SVD.DMA.NORMAL;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH11_TRANS_COUNT_Register use record
      COUNT at 0 range 0 .. 27;
      MODE  at 0 range 28 .. 31;
   end record;

   --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
   --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
   type CH11_CTRL_TRIG_DATA_SIZE_Field is
     (SIZE_BYTE,
      SIZE_HALFWORD,
      SIZE_WORD)
     with Size => 2;
   for CH11_CTRL_TRIG_DATA_SIZE_Field use
     (SIZE_BYTE => 0,
      SIZE_HALFWORD => 1,
      SIZE_WORD => 2);

   --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
   --  the lower n bits of the address will change. This wraps the address on a
   --  (1 << n) byte boundary, facilitating access to naturally-aligned ring
   --  buffers. Ring sizes between 2 and 32768 bytes are possible. This can
   --  apply to either read or write addresses, based on value of RING_SEL.
   type CH11_CTRL_TRIG_RING_SIZE_Field is
     (RING_NONE)
     with Size => 4;
   for CH11_CTRL_TRIG_RING_SIZE_Field use
     (RING_NONE => 0);

   subtype CH11_CTRL_TRIG_CHAIN_TO_Field is HAL.UInt4;

   --  Select a Transfer Request signal. The channel uses the transfer request
   --  signal to pace its data transfer rate. Sources for TREQ signals are
   --  internal (TIMERS) or external (DREQ, a Data Request from the system).
   --  0x0 to 0x3a -> select DREQ n as TREQ
   type CH11_CTRL_TRIG_TREQ_SEL_Field is
     (--  Select PIO0's TX FIFO 0 as TREQ
      PIO0_TX0,
      --  Select PIO0's TX FIFO 1 as TREQ
      PIO0_TX1,
      --  Select PIO0's TX FIFO 2 as TREQ
      PIO0_TX2,
      --  Select PIO0's TX FIFO 3 as TREQ
      PIO0_TX3,
      --  Select PIO0's RX FIFO 0 as TREQ
      PIO0_RX0,
      --  Select PIO0's RX FIFO 1 as TREQ
      PIO0_RX1,
      --  Select PIO0's RX FIFO 2 as TREQ
      PIO0_RX2,
      --  Select PIO0's RX FIFO 3 as TREQ
      PIO0_RX3,
      --  Select PIO1's TX FIFO 0 as TREQ
      PIO1_TX0,
      --  Select PIO1's TX FIFO 1 as TREQ
      PIO1_TX1,
      --  Select PIO1's TX FIFO 2 as TREQ
      PIO1_TX2,
      --  Select PIO1's TX FIFO 3 as TREQ
      PIO1_TX3,
      --  Select PIO1's RX FIFO 0 as TREQ
      PIO1_RX0,
      --  Select PIO1's RX FIFO 1 as TREQ
      PIO1_RX1,
      --  Select PIO1's RX FIFO 2 as TREQ
      PIO1_RX2,
      --  Select PIO1's RX FIFO 3 as TREQ
      PIO1_RX3,
      --  Select PIO2's TX FIFO 0 as TREQ
      PIO2_TX0,
      --  Select PIO2's TX FIFO 1 as TREQ
      PIO2_TX1,
      --  Select PIO2's TX FIFO 2 as TREQ
      PIO2_TX2,
      --  Select PIO2's TX FIFO 3 as TREQ
      PIO2_TX3,
      --  Select PIO2's RX FIFO 0 as TREQ
      PIO2_RX0,
      --  Select PIO2's RX FIFO 1 as TREQ
      PIO2_RX1,
      --  Select PIO2's RX FIFO 2 as TREQ
      PIO2_RX2,
      --  Select PIO2's RX FIFO 3 as TREQ
      PIO2_RX3,
      --  Select SPI0's TX FIFO as TREQ
      SPI0_TX,
      --  Select SPI0's RX FIFO as TREQ
      SPI0_RX,
      --  Select SPI1's TX FIFO as TREQ
      SPI1_TX,
      --  Select SPI1's RX FIFO as TREQ
      SPI1_RX,
      --  Select UART0's TX FIFO as TREQ
      UART0_TX,
      --  Select UART0's RX FIFO as TREQ
      UART0_RX,
      --  Select UART1's TX FIFO as TREQ
      UART1_TX,
      --  Select UART1's RX FIFO as TREQ
      UART1_RX,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP0,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP1,
      --  Select PWM Counter 2's Wrap Value as TREQ
      PWM_WRAP2,
      --  Select PWM Counter 3's Wrap Value as TREQ
      PWM_WRAP3,
      --  Select PWM Counter 4's Wrap Value as TREQ
      PWM_WRAP4,
      --  Select PWM Counter 5's Wrap Value as TREQ
      PWM_WRAP5,
      --  Select PWM Counter 6's Wrap Value as TREQ
      PWM_WRAP6,
      --  Select PWM Counter 7's Wrap Value as TREQ
      PWM_WRAP7,
      --  Select PWM Counter 8's Wrap Value as TREQ
      PWM_WRAP8,
      --  Select PWM Counter 9's Wrap Value as TREQ
      PWM_WRAP9,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP10,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP11,
      --  Select I2C0's TX FIFO as TREQ
      I2C0_TX,
      --  Select I2C0's RX FIFO as TREQ
      I2C0_RX,
      --  Select I2C1's TX FIFO as TREQ
      I2C1_TX,
      --  Select I2C1's RX FIFO as TREQ
      I2C1_RX,
      --  Select the ADC as TREQ
      ADC,
      --  Select the XIP Streaming FIFO as TREQ
      XIP_STREAM,
      --  Select XIP_QMITX as TREQ
      XIP_QMITX,
      --  Select XIP_QMIRX as TREQ
      XIP_QMIRX,
      --  Select HSTX as TREQ
      HSTX,
      --  Select CORESIGHT as TREQ
      CORESIGHT,
      --  Select SHA256 as TREQ
      SHA256,
      --  Select Timer 0 as TREQ
      TIMER0,
      --  Select Timer 1 as TREQ
      TIMER1,
      --  Select Timer 2 as TREQ (Optional)
      TIMER2,
      --  Select Timer 3 as TREQ (Optional)
      TIMER3,
      --  Permanent request, for unpaced transfers.
      PERMANENT)
     with Size => 6;
   for CH11_CTRL_TRIG_TREQ_SEL_Field use
     (PIO0_TX0 => 0,
      PIO0_TX1 => 1,
      PIO0_TX2 => 2,
      PIO0_TX3 => 3,
      PIO0_RX0 => 4,
      PIO0_RX1 => 5,
      PIO0_RX2 => 6,
      PIO0_RX3 => 7,
      PIO1_TX0 => 8,
      PIO1_TX1 => 9,
      PIO1_TX2 => 10,
      PIO1_TX3 => 11,
      PIO1_RX0 => 12,
      PIO1_RX1 => 13,
      PIO1_RX2 => 14,
      PIO1_RX3 => 15,
      PIO2_TX0 => 16,
      PIO2_TX1 => 17,
      PIO2_TX2 => 18,
      PIO2_TX3 => 19,
      PIO2_RX0 => 20,
      PIO2_RX1 => 21,
      PIO2_RX2 => 22,
      PIO2_RX3 => 23,
      SPI0_TX => 24,
      SPI0_RX => 25,
      SPI1_TX => 26,
      SPI1_RX => 27,
      UART0_TX => 28,
      UART0_RX => 29,
      UART1_TX => 30,
      UART1_RX => 31,
      PWM_WRAP0 => 32,
      PWM_WRAP1 => 33,
      PWM_WRAP2 => 34,
      PWM_WRAP3 => 35,
      PWM_WRAP4 => 36,
      PWM_WRAP5 => 37,
      PWM_WRAP6 => 38,
      PWM_WRAP7 => 39,
      PWM_WRAP8 => 40,
      PWM_WRAP9 => 41,
      PWM_WRAP10 => 42,
      PWM_WRAP11 => 43,
      I2C0_TX => 44,
      I2C0_RX => 45,
      I2C1_TX => 46,
      I2C1_RX => 47,
      ADC => 48,
      XIP_STREAM => 49,
      XIP_QMITX => 50,
      XIP_QMIRX => 51,
      HSTX => 52,
      CORESIGHT => 53,
      SHA256 => 54,
      TIMER0 => 59,
      TIMER1 => 60,
      TIMER2 => 61,
      TIMER3 => 62,
      PERMANENT => 63);

   --  DMA Channel 11 Control and Status
   type CH11_CTRL_TRIG_Register is record
      --  DMA Channel Enable. When 1, the channel will respond to triggering
      --  events, which will cause it to become BUSY and start transferring
      --  data. When 0, the channel will ignore triggers, stop issuing
      --  transfers, and pause the current transfer sequence (i.e. BUSY will
      --  remain high if already high)
      EN             : Boolean := False;
      --  HIGH_PRIORITY gives a channel preferential treatment in issue
      --  scheduling: in each scheduling round, all high priority channels are
      --  considered first, and then only a single low priority channel, before
      --  returning to the high priority channels. This only affects the order
      --  in which the DMA schedules channels. The DMA's bus priority is not
      --  changed. If the DMA is not saturated then a low priority channel will
      --  see no loss of throughput.
      HIGH_PRIORITY  : Boolean := False;
      --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
      --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
      DATA_SIZE      : CH11_CTRL_TRIG_DATA_SIZE_Field :=
                        RP2350_SVD.DMA.SIZE_BYTE;
      --  If 1, the read address increments with each transfer. If 0, each read
      --  is directed to the same, initial address. Generally this should be
      --  disabled for peripheral-to-memory transfers.
      INCR_READ      : Boolean := False;
      --  If 1, and INCR_READ is 1, the read address is decremented rather than
      --  incremented with each transfer. If 1, and INCR_READ is 0, this
      --  otherwise-unused combination causes the read address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_READ_REV  : Boolean := False;
      --  If 1, the write address increments with each transfer. If 0, each
      --  write is directed to the same, initial address. Generally this should
      --  be disabled for memory-to-peripheral transfers.
      INCR_WRITE     : Boolean := False;
      --  If 1, and INCR_WRITE is 1, the write address is decremented rather
      --  than incremented with each transfer. If 1, and INCR_WRITE is 0, this
      --  otherwise-unused combination causes the write address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_WRITE_REV : Boolean := False;
      --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
      --  the lower n bits of the address will change. This wraps the address
      --  on a (1 << n) byte boundary, facilitating access to naturally-aligned
      --  ring buffers. Ring sizes between 2 and 32768 bytes are possible. This
      --  can apply to either read or write addresses, based on value of
      --  RING_SEL.
      RING_SIZE      : CH11_CTRL_TRIG_RING_SIZE_Field :=
                        RP2350_SVD.DMA.RING_NONE;
      --  Select whether RING_SIZE applies to read or write addresses. If 0,
      --  read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1,
      --  write addresses are wrapped.
      RING_SEL       : Boolean := False;
      --  When this channel completes, it will trigger the channel indicated by
      --  CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_. Note this
      --  field resets to 0, so channels 1 and above will chain to channel 0 by
      --  default. Set this field to avoid this behaviour.
      CHAIN_TO       : CH11_CTRL_TRIG_CHAIN_TO_Field := 16#0#;
      --  Select a Transfer Request signal. The channel uses the transfer
      --  request signal to pace its data transfer rate. Sources for TREQ
      --  signals are internal (TIMERS) or external (DREQ, a Data Request from
      --  the system). 0x0 to 0x3a -> select DREQ n as TREQ
      TREQ_SEL       : CH11_CTRL_TRIG_TREQ_SEL_Field :=
                        RP2350_SVD.DMA.PIO0_TX0;
      --  In QUIET mode, the channel does not generate IRQs at the end of every
      --  transfer block. Instead, an IRQ is raised when NULL is written to a
      --  trigger register, indicating the end of a control block chain. This
      --  reduces the number of interrupts to be serviced by the CPU when
      --  transferring a DMA chain of many small control blocks.
      IRQ_QUIET      : Boolean := False;
      --  Apply byte-swap transformation to DMA data. For byte data, this has
      --  no effect. For halfword data, the two bytes of each halfword are
      --  swapped. For word data, the four bytes of each word are swapped to
      --  reverse order.
      BSWAP          : Boolean := False;
      --  If 1, this channel's data transfers are visible to the sniff
      --  hardware, and each transfer will advance the state of the checksum.
      --  This only applies if the sniff hardware is enabled, and has this
      --  channel selected. This allows checksum to be enabled or disabled on a
      --  per-control- block basis.
      SNIFF_EN       : Boolean := False;
      --  Read-only. This flag goes high when the channel starts a new transfer
      --  sequence, and low when the last transfer of that sequence completes.
      --  Clearing EN while BUSY is high pauses the channel, and BUSY will stay
      --  high while paused. To terminate a sequence early (and clear the BUSY
      --  flag), see CHAN_ABORT.
      BUSY           : Boolean := False;
      --  unspecified
      Reserved_27_28 : HAL.UInt2 := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a write bus error. Write one
      --  to clear. WRITE_ADDR shows the approximate address where the bus
      --  error was encountered (will not be earlier, or more than 5 transfers
      --  later)
      WRITE_ERROR    : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a read bus error. Write one
      --  to clear. READ_ADDR shows the approximate address where the bus error
      --  was encountered (will not be earlier, or more than 3 transfers later)
      READ_ERROR     : Boolean := False;
      --  Read-only. Logical OR of the READ_ERROR and WRITE_ERROR flags. The
      --  channel halts when it encounters any bus error, and always raises its
      --  channel IRQ flag.
      AHB_ERROR      : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH11_CTRL_TRIG_Register use record
      EN             at 0 range 0 .. 0;
      HIGH_PRIORITY  at 0 range 1 .. 1;
      DATA_SIZE      at 0 range 2 .. 3;
      INCR_READ      at 0 range 4 .. 4;
      INCR_READ_REV  at 0 range 5 .. 5;
      INCR_WRITE     at 0 range 6 .. 6;
      INCR_WRITE_REV at 0 range 7 .. 7;
      RING_SIZE      at 0 range 8 .. 11;
      RING_SEL       at 0 range 12 .. 12;
      CHAIN_TO       at 0 range 13 .. 16;
      TREQ_SEL       at 0 range 17 .. 22;
      IRQ_QUIET      at 0 range 23 .. 23;
      BSWAP          at 0 range 24 .. 24;
      SNIFF_EN       at 0 range 25 .. 25;
      BUSY           at 0 range 26 .. 26;
      Reserved_27_28 at 0 range 27 .. 28;
      WRITE_ERROR    at 0 range 29 .. 29;
      READ_ERROR     at 0 range 30 .. 30;
      AHB_ERROR      at 0 range 31 .. 31;
   end record;

   subtype CH12_TRANS_COUNT_COUNT_Field is HAL.UInt28;

   --  When MODE is 0x0, the transfer count decrements with each transfer until
   --  0, and then the channel triggers the next channel indicated by
   --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with each
   --  transfer until 0, and then the channel re-triggers itself, in addition
   --  to the trigger indicated by CTRL_CHAIN_TO. This is useful for e.g. an
   --  endless ring-buffer DMA with periodic interrupts. When MODE is 0xf, the
   --  transfer count does not decrement. The DMA channel performs an endless
   --  sequence of transfers, never triggering other channels or raising
   --  interrupts, until an ABORT is raised. All other values are reserved.
   type CH12_TRANS_COUNT_MODE_Field is
     (NORMAL,
      TRIGGER_SELF,
      ENDLESS)
     with Size => 4;
   for CH12_TRANS_COUNT_MODE_Field use
     (NORMAL => 0,
      TRIGGER_SELF => 1,
      ENDLESS => 15);

   --  DMA Channel 12 Transfer Count
   type CH12_TRANS_COUNT_Register is record
      --  28-bit transfer count (256 million transfers maximum). Program the
      --  number of bus transfers a channel will perform before halting. Note
      --  that, if transfers are larger than one byte in size, this is not
      --  equal to the number of bytes transferred (see CTRL_DATA_SIZE). When
      --  the channel is active, reading this register shows the number of
      --  transfers remaining, updating automatically each time a write
      --  transfer completes. Writing this register sets the RELOAD value for
      --  the transfer counter. Each time this channel is triggered, the RELOAD
      --  value is copied into the live transfer counter. The channel can be
      --  started multiple times, and will perform the same number of transfers
      --  each time, as programmed by most recent write. The RELOAD value can
      --  be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the
      --  written value is used immediately as the length of the new transfer
      --  sequence, as well as being written to RELOAD.
      COUNT : CH12_TRANS_COUNT_COUNT_Field := 16#0#;
      --  When MODE is 0x0, the transfer count decrements with each transfer
      --  until 0, and then the channel triggers the next channel indicated by
      --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with
      --  each transfer until 0, and then the channel re-triggers itself, in
      --  addition to the trigger indicated by CTRL_CHAIN_TO. This is useful
      --  for e.g. an endless ring-buffer DMA with periodic interrupts. When
      --  MODE is 0xf, the transfer count does not decrement. The DMA channel
      --  performs an endless sequence of transfers, never triggering other
      --  channels or raising interrupts, until an ABORT is raised. All other
      --  values are reserved.
      MODE  : CH12_TRANS_COUNT_MODE_Field := RP2350_SVD.DMA.NORMAL;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH12_TRANS_COUNT_Register use record
      COUNT at 0 range 0 .. 27;
      MODE  at 0 range 28 .. 31;
   end record;

   --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
   --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
   type CH12_CTRL_TRIG_DATA_SIZE_Field is
     (SIZE_BYTE,
      SIZE_HALFWORD,
      SIZE_WORD)
     with Size => 2;
   for CH12_CTRL_TRIG_DATA_SIZE_Field use
     (SIZE_BYTE => 0,
      SIZE_HALFWORD => 1,
      SIZE_WORD => 2);

   --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
   --  the lower n bits of the address will change. This wraps the address on a
   --  (1 << n) byte boundary, facilitating access to naturally-aligned ring
   --  buffers. Ring sizes between 2 and 32768 bytes are possible. This can
   --  apply to either read or write addresses, based on value of RING_SEL.
   type CH12_CTRL_TRIG_RING_SIZE_Field is
     (RING_NONE)
     with Size => 4;
   for CH12_CTRL_TRIG_RING_SIZE_Field use
     (RING_NONE => 0);

   subtype CH12_CTRL_TRIG_CHAIN_TO_Field is HAL.UInt4;

   --  Select a Transfer Request signal. The channel uses the transfer request
   --  signal to pace its data transfer rate. Sources for TREQ signals are
   --  internal (TIMERS) or external (DREQ, a Data Request from the system).
   --  0x0 to 0x3a -> select DREQ n as TREQ
   type CH12_CTRL_TRIG_TREQ_SEL_Field is
     (--  Select PIO0's TX FIFO 0 as TREQ
      PIO0_TX0,
      --  Select PIO0's TX FIFO 1 as TREQ
      PIO0_TX1,
      --  Select PIO0's TX FIFO 2 as TREQ
      PIO0_TX2,
      --  Select PIO0's TX FIFO 3 as TREQ
      PIO0_TX3,
      --  Select PIO0's RX FIFO 0 as TREQ
      PIO0_RX0,
      --  Select PIO0's RX FIFO 1 as TREQ
      PIO0_RX1,
      --  Select PIO0's RX FIFO 2 as TREQ
      PIO0_RX2,
      --  Select PIO0's RX FIFO 3 as TREQ
      PIO0_RX3,
      --  Select PIO1's TX FIFO 0 as TREQ
      PIO1_TX0,
      --  Select PIO1's TX FIFO 1 as TREQ
      PIO1_TX1,
      --  Select PIO1's TX FIFO 2 as TREQ
      PIO1_TX2,
      --  Select PIO1's TX FIFO 3 as TREQ
      PIO1_TX3,
      --  Select PIO1's RX FIFO 0 as TREQ
      PIO1_RX0,
      --  Select PIO1's RX FIFO 1 as TREQ
      PIO1_RX1,
      --  Select PIO1's RX FIFO 2 as TREQ
      PIO1_RX2,
      --  Select PIO1's RX FIFO 3 as TREQ
      PIO1_RX3,
      --  Select PIO2's TX FIFO 0 as TREQ
      PIO2_TX0,
      --  Select PIO2's TX FIFO 1 as TREQ
      PIO2_TX1,
      --  Select PIO2's TX FIFO 2 as TREQ
      PIO2_TX2,
      --  Select PIO2's TX FIFO 3 as TREQ
      PIO2_TX3,
      --  Select PIO2's RX FIFO 0 as TREQ
      PIO2_RX0,
      --  Select PIO2's RX FIFO 1 as TREQ
      PIO2_RX1,
      --  Select PIO2's RX FIFO 2 as TREQ
      PIO2_RX2,
      --  Select PIO2's RX FIFO 3 as TREQ
      PIO2_RX3,
      --  Select SPI0's TX FIFO as TREQ
      SPI0_TX,
      --  Select SPI0's RX FIFO as TREQ
      SPI0_RX,
      --  Select SPI1's TX FIFO as TREQ
      SPI1_TX,
      --  Select SPI1's RX FIFO as TREQ
      SPI1_RX,
      --  Select UART0's TX FIFO as TREQ
      UART0_TX,
      --  Select UART0's RX FIFO as TREQ
      UART0_RX,
      --  Select UART1's TX FIFO as TREQ
      UART1_TX,
      --  Select UART1's RX FIFO as TREQ
      UART1_RX,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP0,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP1,
      --  Select PWM Counter 2's Wrap Value as TREQ
      PWM_WRAP2,
      --  Select PWM Counter 3's Wrap Value as TREQ
      PWM_WRAP3,
      --  Select PWM Counter 4's Wrap Value as TREQ
      PWM_WRAP4,
      --  Select PWM Counter 5's Wrap Value as TREQ
      PWM_WRAP5,
      --  Select PWM Counter 6's Wrap Value as TREQ
      PWM_WRAP6,
      --  Select PWM Counter 7's Wrap Value as TREQ
      PWM_WRAP7,
      --  Select PWM Counter 8's Wrap Value as TREQ
      PWM_WRAP8,
      --  Select PWM Counter 9's Wrap Value as TREQ
      PWM_WRAP9,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP10,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP11,
      --  Select I2C0's TX FIFO as TREQ
      I2C0_TX,
      --  Select I2C0's RX FIFO as TREQ
      I2C0_RX,
      --  Select I2C1's TX FIFO as TREQ
      I2C1_TX,
      --  Select I2C1's RX FIFO as TREQ
      I2C1_RX,
      --  Select the ADC as TREQ
      ADC,
      --  Select the XIP Streaming FIFO as TREQ
      XIP_STREAM,
      --  Select XIP_QMITX as TREQ
      XIP_QMITX,
      --  Select XIP_QMIRX as TREQ
      XIP_QMIRX,
      --  Select HSTX as TREQ
      HSTX,
      --  Select CORESIGHT as TREQ
      CORESIGHT,
      --  Select SHA256 as TREQ
      SHA256,
      --  Select Timer 0 as TREQ
      TIMER0,
      --  Select Timer 1 as TREQ
      TIMER1,
      --  Select Timer 2 as TREQ (Optional)
      TIMER2,
      --  Select Timer 3 as TREQ (Optional)
      TIMER3,
      --  Permanent request, for unpaced transfers.
      PERMANENT)
     with Size => 6;
   for CH12_CTRL_TRIG_TREQ_SEL_Field use
     (PIO0_TX0 => 0,
      PIO0_TX1 => 1,
      PIO0_TX2 => 2,
      PIO0_TX3 => 3,
      PIO0_RX0 => 4,
      PIO0_RX1 => 5,
      PIO0_RX2 => 6,
      PIO0_RX3 => 7,
      PIO1_TX0 => 8,
      PIO1_TX1 => 9,
      PIO1_TX2 => 10,
      PIO1_TX3 => 11,
      PIO1_RX0 => 12,
      PIO1_RX1 => 13,
      PIO1_RX2 => 14,
      PIO1_RX3 => 15,
      PIO2_TX0 => 16,
      PIO2_TX1 => 17,
      PIO2_TX2 => 18,
      PIO2_TX3 => 19,
      PIO2_RX0 => 20,
      PIO2_RX1 => 21,
      PIO2_RX2 => 22,
      PIO2_RX3 => 23,
      SPI0_TX => 24,
      SPI0_RX => 25,
      SPI1_TX => 26,
      SPI1_RX => 27,
      UART0_TX => 28,
      UART0_RX => 29,
      UART1_TX => 30,
      UART1_RX => 31,
      PWM_WRAP0 => 32,
      PWM_WRAP1 => 33,
      PWM_WRAP2 => 34,
      PWM_WRAP3 => 35,
      PWM_WRAP4 => 36,
      PWM_WRAP5 => 37,
      PWM_WRAP6 => 38,
      PWM_WRAP7 => 39,
      PWM_WRAP8 => 40,
      PWM_WRAP9 => 41,
      PWM_WRAP10 => 42,
      PWM_WRAP11 => 43,
      I2C0_TX => 44,
      I2C0_RX => 45,
      I2C1_TX => 46,
      I2C1_RX => 47,
      ADC => 48,
      XIP_STREAM => 49,
      XIP_QMITX => 50,
      XIP_QMIRX => 51,
      HSTX => 52,
      CORESIGHT => 53,
      SHA256 => 54,
      TIMER0 => 59,
      TIMER1 => 60,
      TIMER2 => 61,
      TIMER3 => 62,
      PERMANENT => 63);

   --  DMA Channel 12 Control and Status
   type CH12_CTRL_TRIG_Register is record
      --  DMA Channel Enable. When 1, the channel will respond to triggering
      --  events, which will cause it to become BUSY and start transferring
      --  data. When 0, the channel will ignore triggers, stop issuing
      --  transfers, and pause the current transfer sequence (i.e. BUSY will
      --  remain high if already high)
      EN             : Boolean := False;
      --  HIGH_PRIORITY gives a channel preferential treatment in issue
      --  scheduling: in each scheduling round, all high priority channels are
      --  considered first, and then only a single low priority channel, before
      --  returning to the high priority channels. This only affects the order
      --  in which the DMA schedules channels. The DMA's bus priority is not
      --  changed. If the DMA is not saturated then a low priority channel will
      --  see no loss of throughput.
      HIGH_PRIORITY  : Boolean := False;
      --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
      --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
      DATA_SIZE      : CH12_CTRL_TRIG_DATA_SIZE_Field :=
                        RP2350_SVD.DMA.SIZE_BYTE;
      --  If 1, the read address increments with each transfer. If 0, each read
      --  is directed to the same, initial address. Generally this should be
      --  disabled for peripheral-to-memory transfers.
      INCR_READ      : Boolean := False;
      --  If 1, and INCR_READ is 1, the read address is decremented rather than
      --  incremented with each transfer. If 1, and INCR_READ is 0, this
      --  otherwise-unused combination causes the read address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_READ_REV  : Boolean := False;
      --  If 1, the write address increments with each transfer. If 0, each
      --  write is directed to the same, initial address. Generally this should
      --  be disabled for memory-to-peripheral transfers.
      INCR_WRITE     : Boolean := False;
      --  If 1, and INCR_WRITE is 1, the write address is decremented rather
      --  than incremented with each transfer. If 1, and INCR_WRITE is 0, this
      --  otherwise-unused combination causes the write address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_WRITE_REV : Boolean := False;
      --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
      --  the lower n bits of the address will change. This wraps the address
      --  on a (1 << n) byte boundary, facilitating access to naturally-aligned
      --  ring buffers. Ring sizes between 2 and 32768 bytes are possible. This
      --  can apply to either read or write addresses, based on value of
      --  RING_SEL.
      RING_SIZE      : CH12_CTRL_TRIG_RING_SIZE_Field :=
                        RP2350_SVD.DMA.RING_NONE;
      --  Select whether RING_SIZE applies to read or write addresses. If 0,
      --  read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1,
      --  write addresses are wrapped.
      RING_SEL       : Boolean := False;
      --  When this channel completes, it will trigger the channel indicated by
      --  CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_. Note this
      --  field resets to 0, so channels 1 and above will chain to channel 0 by
      --  default. Set this field to avoid this behaviour.
      CHAIN_TO       : CH12_CTRL_TRIG_CHAIN_TO_Field := 16#0#;
      --  Select a Transfer Request signal. The channel uses the transfer
      --  request signal to pace its data transfer rate. Sources for TREQ
      --  signals are internal (TIMERS) or external (DREQ, a Data Request from
      --  the system). 0x0 to 0x3a -> select DREQ n as TREQ
      TREQ_SEL       : CH12_CTRL_TRIG_TREQ_SEL_Field :=
                        RP2350_SVD.DMA.PIO0_TX0;
      --  In QUIET mode, the channel does not generate IRQs at the end of every
      --  transfer block. Instead, an IRQ is raised when NULL is written to a
      --  trigger register, indicating the end of a control block chain. This
      --  reduces the number of interrupts to be serviced by the CPU when
      --  transferring a DMA chain of many small control blocks.
      IRQ_QUIET      : Boolean := False;
      --  Apply byte-swap transformation to DMA data. For byte data, this has
      --  no effect. For halfword data, the two bytes of each halfword are
      --  swapped. For word data, the four bytes of each word are swapped to
      --  reverse order.
      BSWAP          : Boolean := False;
      --  If 1, this channel's data transfers are visible to the sniff
      --  hardware, and each transfer will advance the state of the checksum.
      --  This only applies if the sniff hardware is enabled, and has this
      --  channel selected. This allows checksum to be enabled or disabled on a
      --  per-control- block basis.
      SNIFF_EN       : Boolean := False;
      --  Read-only. This flag goes high when the channel starts a new transfer
      --  sequence, and low when the last transfer of that sequence completes.
      --  Clearing EN while BUSY is high pauses the channel, and BUSY will stay
      --  high while paused. To terminate a sequence early (and clear the BUSY
      --  flag), see CHAN_ABORT.
      BUSY           : Boolean := False;
      --  unspecified
      Reserved_27_28 : HAL.UInt2 := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a write bus error. Write one
      --  to clear. WRITE_ADDR shows the approximate address where the bus
      --  error was encountered (will not be earlier, or more than 5 transfers
      --  later)
      WRITE_ERROR    : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a read bus error. Write one
      --  to clear. READ_ADDR shows the approximate address where the bus error
      --  was encountered (will not be earlier, or more than 3 transfers later)
      READ_ERROR     : Boolean := False;
      --  Read-only. Logical OR of the READ_ERROR and WRITE_ERROR flags. The
      --  channel halts when it encounters any bus error, and always raises its
      --  channel IRQ flag.
      AHB_ERROR      : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH12_CTRL_TRIG_Register use record
      EN             at 0 range 0 .. 0;
      HIGH_PRIORITY  at 0 range 1 .. 1;
      DATA_SIZE      at 0 range 2 .. 3;
      INCR_READ      at 0 range 4 .. 4;
      INCR_READ_REV  at 0 range 5 .. 5;
      INCR_WRITE     at 0 range 6 .. 6;
      INCR_WRITE_REV at 0 range 7 .. 7;
      RING_SIZE      at 0 range 8 .. 11;
      RING_SEL       at 0 range 12 .. 12;
      CHAIN_TO       at 0 range 13 .. 16;
      TREQ_SEL       at 0 range 17 .. 22;
      IRQ_QUIET      at 0 range 23 .. 23;
      BSWAP          at 0 range 24 .. 24;
      SNIFF_EN       at 0 range 25 .. 25;
      BUSY           at 0 range 26 .. 26;
      Reserved_27_28 at 0 range 27 .. 28;
      WRITE_ERROR    at 0 range 29 .. 29;
      READ_ERROR     at 0 range 30 .. 30;
      AHB_ERROR      at 0 range 31 .. 31;
   end record;

   subtype CH13_TRANS_COUNT_COUNT_Field is HAL.UInt28;

   --  When MODE is 0x0, the transfer count decrements with each transfer until
   --  0, and then the channel triggers the next channel indicated by
   --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with each
   --  transfer until 0, and then the channel re-triggers itself, in addition
   --  to the trigger indicated by CTRL_CHAIN_TO. This is useful for e.g. an
   --  endless ring-buffer DMA with periodic interrupts. When MODE is 0xf, the
   --  transfer count does not decrement. The DMA channel performs an endless
   --  sequence of transfers, never triggering other channels or raising
   --  interrupts, until an ABORT is raised. All other values are reserved.
   type CH13_TRANS_COUNT_MODE_Field is
     (NORMAL,
      TRIGGER_SELF,
      ENDLESS)
     with Size => 4;
   for CH13_TRANS_COUNT_MODE_Field use
     (NORMAL => 0,
      TRIGGER_SELF => 1,
      ENDLESS => 15);

   --  DMA Channel 13 Transfer Count
   type CH13_TRANS_COUNT_Register is record
      --  28-bit transfer count (256 million transfers maximum). Program the
      --  number of bus transfers a channel will perform before halting. Note
      --  that, if transfers are larger than one byte in size, this is not
      --  equal to the number of bytes transferred (see CTRL_DATA_SIZE). When
      --  the channel is active, reading this register shows the number of
      --  transfers remaining, updating automatically each time a write
      --  transfer completes. Writing this register sets the RELOAD value for
      --  the transfer counter. Each time this channel is triggered, the RELOAD
      --  value is copied into the live transfer counter. The channel can be
      --  started multiple times, and will perform the same number of transfers
      --  each time, as programmed by most recent write. The RELOAD value can
      --  be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the
      --  written value is used immediately as the length of the new transfer
      --  sequence, as well as being written to RELOAD.
      COUNT : CH13_TRANS_COUNT_COUNT_Field := 16#0#;
      --  When MODE is 0x0, the transfer count decrements with each transfer
      --  until 0, and then the channel triggers the next channel indicated by
      --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with
      --  each transfer until 0, and then the channel re-triggers itself, in
      --  addition to the trigger indicated by CTRL_CHAIN_TO. This is useful
      --  for e.g. an endless ring-buffer DMA with periodic interrupts. When
      --  MODE is 0xf, the transfer count does not decrement. The DMA channel
      --  performs an endless sequence of transfers, never triggering other
      --  channels or raising interrupts, until an ABORT is raised. All other
      --  values are reserved.
      MODE  : CH13_TRANS_COUNT_MODE_Field := RP2350_SVD.DMA.NORMAL;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH13_TRANS_COUNT_Register use record
      COUNT at 0 range 0 .. 27;
      MODE  at 0 range 28 .. 31;
   end record;

   --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
   --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
   type CH13_CTRL_TRIG_DATA_SIZE_Field is
     (SIZE_BYTE,
      SIZE_HALFWORD,
      SIZE_WORD)
     with Size => 2;
   for CH13_CTRL_TRIG_DATA_SIZE_Field use
     (SIZE_BYTE => 0,
      SIZE_HALFWORD => 1,
      SIZE_WORD => 2);

   --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
   --  the lower n bits of the address will change. This wraps the address on a
   --  (1 << n) byte boundary, facilitating access to naturally-aligned ring
   --  buffers. Ring sizes between 2 and 32768 bytes are possible. This can
   --  apply to either read or write addresses, based on value of RING_SEL.
   type CH13_CTRL_TRIG_RING_SIZE_Field is
     (RING_NONE)
     with Size => 4;
   for CH13_CTRL_TRIG_RING_SIZE_Field use
     (RING_NONE => 0);

   subtype CH13_CTRL_TRIG_CHAIN_TO_Field is HAL.UInt4;

   --  Select a Transfer Request signal. The channel uses the transfer request
   --  signal to pace its data transfer rate. Sources for TREQ signals are
   --  internal (TIMERS) or external (DREQ, a Data Request from the system).
   --  0x0 to 0x3a -> select DREQ n as TREQ
   type CH13_CTRL_TRIG_TREQ_SEL_Field is
     (--  Select PIO0's TX FIFO 0 as TREQ
      PIO0_TX0,
      --  Select PIO0's TX FIFO 1 as TREQ
      PIO0_TX1,
      --  Select PIO0's TX FIFO 2 as TREQ
      PIO0_TX2,
      --  Select PIO0's TX FIFO 3 as TREQ
      PIO0_TX3,
      --  Select PIO0's RX FIFO 0 as TREQ
      PIO0_RX0,
      --  Select PIO0's RX FIFO 1 as TREQ
      PIO0_RX1,
      --  Select PIO0's RX FIFO 2 as TREQ
      PIO0_RX2,
      --  Select PIO0's RX FIFO 3 as TREQ
      PIO0_RX3,
      --  Select PIO1's TX FIFO 0 as TREQ
      PIO1_TX0,
      --  Select PIO1's TX FIFO 1 as TREQ
      PIO1_TX1,
      --  Select PIO1's TX FIFO 2 as TREQ
      PIO1_TX2,
      --  Select PIO1's TX FIFO 3 as TREQ
      PIO1_TX3,
      --  Select PIO1's RX FIFO 0 as TREQ
      PIO1_RX0,
      --  Select PIO1's RX FIFO 1 as TREQ
      PIO1_RX1,
      --  Select PIO1's RX FIFO 2 as TREQ
      PIO1_RX2,
      --  Select PIO1's RX FIFO 3 as TREQ
      PIO1_RX3,
      --  Select PIO2's TX FIFO 0 as TREQ
      PIO2_TX0,
      --  Select PIO2's TX FIFO 1 as TREQ
      PIO2_TX1,
      --  Select PIO2's TX FIFO 2 as TREQ
      PIO2_TX2,
      --  Select PIO2's TX FIFO 3 as TREQ
      PIO2_TX3,
      --  Select PIO2's RX FIFO 0 as TREQ
      PIO2_RX0,
      --  Select PIO2's RX FIFO 1 as TREQ
      PIO2_RX1,
      --  Select PIO2's RX FIFO 2 as TREQ
      PIO2_RX2,
      --  Select PIO2's RX FIFO 3 as TREQ
      PIO2_RX3,
      --  Select SPI0's TX FIFO as TREQ
      SPI0_TX,
      --  Select SPI0's RX FIFO as TREQ
      SPI0_RX,
      --  Select SPI1's TX FIFO as TREQ
      SPI1_TX,
      --  Select SPI1's RX FIFO as TREQ
      SPI1_RX,
      --  Select UART0's TX FIFO as TREQ
      UART0_TX,
      --  Select UART0's RX FIFO as TREQ
      UART0_RX,
      --  Select UART1's TX FIFO as TREQ
      UART1_TX,
      --  Select UART1's RX FIFO as TREQ
      UART1_RX,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP0,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP1,
      --  Select PWM Counter 2's Wrap Value as TREQ
      PWM_WRAP2,
      --  Select PWM Counter 3's Wrap Value as TREQ
      PWM_WRAP3,
      --  Select PWM Counter 4's Wrap Value as TREQ
      PWM_WRAP4,
      --  Select PWM Counter 5's Wrap Value as TREQ
      PWM_WRAP5,
      --  Select PWM Counter 6's Wrap Value as TREQ
      PWM_WRAP6,
      --  Select PWM Counter 7's Wrap Value as TREQ
      PWM_WRAP7,
      --  Select PWM Counter 8's Wrap Value as TREQ
      PWM_WRAP8,
      --  Select PWM Counter 9's Wrap Value as TREQ
      PWM_WRAP9,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP10,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP11,
      --  Select I2C0's TX FIFO as TREQ
      I2C0_TX,
      --  Select I2C0's RX FIFO as TREQ
      I2C0_RX,
      --  Select I2C1's TX FIFO as TREQ
      I2C1_TX,
      --  Select I2C1's RX FIFO as TREQ
      I2C1_RX,
      --  Select the ADC as TREQ
      ADC,
      --  Select the XIP Streaming FIFO as TREQ
      XIP_STREAM,
      --  Select XIP_QMITX as TREQ
      XIP_QMITX,
      --  Select XIP_QMIRX as TREQ
      XIP_QMIRX,
      --  Select HSTX as TREQ
      HSTX,
      --  Select CORESIGHT as TREQ
      CORESIGHT,
      --  Select SHA256 as TREQ
      SHA256,
      --  Select Timer 0 as TREQ
      TIMER0,
      --  Select Timer 1 as TREQ
      TIMER1,
      --  Select Timer 2 as TREQ (Optional)
      TIMER2,
      --  Select Timer 3 as TREQ (Optional)
      TIMER3,
      --  Permanent request, for unpaced transfers.
      PERMANENT)
     with Size => 6;
   for CH13_CTRL_TRIG_TREQ_SEL_Field use
     (PIO0_TX0 => 0,
      PIO0_TX1 => 1,
      PIO0_TX2 => 2,
      PIO0_TX3 => 3,
      PIO0_RX0 => 4,
      PIO0_RX1 => 5,
      PIO0_RX2 => 6,
      PIO0_RX3 => 7,
      PIO1_TX0 => 8,
      PIO1_TX1 => 9,
      PIO1_TX2 => 10,
      PIO1_TX3 => 11,
      PIO1_RX0 => 12,
      PIO1_RX1 => 13,
      PIO1_RX2 => 14,
      PIO1_RX3 => 15,
      PIO2_TX0 => 16,
      PIO2_TX1 => 17,
      PIO2_TX2 => 18,
      PIO2_TX3 => 19,
      PIO2_RX0 => 20,
      PIO2_RX1 => 21,
      PIO2_RX2 => 22,
      PIO2_RX3 => 23,
      SPI0_TX => 24,
      SPI0_RX => 25,
      SPI1_TX => 26,
      SPI1_RX => 27,
      UART0_TX => 28,
      UART0_RX => 29,
      UART1_TX => 30,
      UART1_RX => 31,
      PWM_WRAP0 => 32,
      PWM_WRAP1 => 33,
      PWM_WRAP2 => 34,
      PWM_WRAP3 => 35,
      PWM_WRAP4 => 36,
      PWM_WRAP5 => 37,
      PWM_WRAP6 => 38,
      PWM_WRAP7 => 39,
      PWM_WRAP8 => 40,
      PWM_WRAP9 => 41,
      PWM_WRAP10 => 42,
      PWM_WRAP11 => 43,
      I2C0_TX => 44,
      I2C0_RX => 45,
      I2C1_TX => 46,
      I2C1_RX => 47,
      ADC => 48,
      XIP_STREAM => 49,
      XIP_QMITX => 50,
      XIP_QMIRX => 51,
      HSTX => 52,
      CORESIGHT => 53,
      SHA256 => 54,
      TIMER0 => 59,
      TIMER1 => 60,
      TIMER2 => 61,
      TIMER3 => 62,
      PERMANENT => 63);

   --  DMA Channel 13 Control and Status
   type CH13_CTRL_TRIG_Register is record
      --  DMA Channel Enable. When 1, the channel will respond to triggering
      --  events, which will cause it to become BUSY and start transferring
      --  data. When 0, the channel will ignore triggers, stop issuing
      --  transfers, and pause the current transfer sequence (i.e. BUSY will
      --  remain high if already high)
      EN             : Boolean := False;
      --  HIGH_PRIORITY gives a channel preferential treatment in issue
      --  scheduling: in each scheduling round, all high priority channels are
      --  considered first, and then only a single low priority channel, before
      --  returning to the high priority channels. This only affects the order
      --  in which the DMA schedules channels. The DMA's bus priority is not
      --  changed. If the DMA is not saturated then a low priority channel will
      --  see no loss of throughput.
      HIGH_PRIORITY  : Boolean := False;
      --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
      --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
      DATA_SIZE      : CH13_CTRL_TRIG_DATA_SIZE_Field :=
                        RP2350_SVD.DMA.SIZE_BYTE;
      --  If 1, the read address increments with each transfer. If 0, each read
      --  is directed to the same, initial address. Generally this should be
      --  disabled for peripheral-to-memory transfers.
      INCR_READ      : Boolean := False;
      --  If 1, and INCR_READ is 1, the read address is decremented rather than
      --  incremented with each transfer. If 1, and INCR_READ is 0, this
      --  otherwise-unused combination causes the read address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_READ_REV  : Boolean := False;
      --  If 1, the write address increments with each transfer. If 0, each
      --  write is directed to the same, initial address. Generally this should
      --  be disabled for memory-to-peripheral transfers.
      INCR_WRITE     : Boolean := False;
      --  If 1, and INCR_WRITE is 1, the write address is decremented rather
      --  than incremented with each transfer. If 1, and INCR_WRITE is 0, this
      --  otherwise-unused combination causes the write address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_WRITE_REV : Boolean := False;
      --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
      --  the lower n bits of the address will change. This wraps the address
      --  on a (1 << n) byte boundary, facilitating access to naturally-aligned
      --  ring buffers. Ring sizes between 2 and 32768 bytes are possible. This
      --  can apply to either read or write addresses, based on value of
      --  RING_SEL.
      RING_SIZE      : CH13_CTRL_TRIG_RING_SIZE_Field :=
                        RP2350_SVD.DMA.RING_NONE;
      --  Select whether RING_SIZE applies to read or write addresses. If 0,
      --  read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1,
      --  write addresses are wrapped.
      RING_SEL       : Boolean := False;
      --  When this channel completes, it will trigger the channel indicated by
      --  CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_. Note this
      --  field resets to 0, so channels 1 and above will chain to channel 0 by
      --  default. Set this field to avoid this behaviour.
      CHAIN_TO       : CH13_CTRL_TRIG_CHAIN_TO_Field := 16#0#;
      --  Select a Transfer Request signal. The channel uses the transfer
      --  request signal to pace its data transfer rate. Sources for TREQ
      --  signals are internal (TIMERS) or external (DREQ, a Data Request from
      --  the system). 0x0 to 0x3a -> select DREQ n as TREQ
      TREQ_SEL       : CH13_CTRL_TRIG_TREQ_SEL_Field :=
                        RP2350_SVD.DMA.PIO0_TX0;
      --  In QUIET mode, the channel does not generate IRQs at the end of every
      --  transfer block. Instead, an IRQ is raised when NULL is written to a
      --  trigger register, indicating the end of a control block chain. This
      --  reduces the number of interrupts to be serviced by the CPU when
      --  transferring a DMA chain of many small control blocks.
      IRQ_QUIET      : Boolean := False;
      --  Apply byte-swap transformation to DMA data. For byte data, this has
      --  no effect. For halfword data, the two bytes of each halfword are
      --  swapped. For word data, the four bytes of each word are swapped to
      --  reverse order.
      BSWAP          : Boolean := False;
      --  If 1, this channel's data transfers are visible to the sniff
      --  hardware, and each transfer will advance the state of the checksum.
      --  This only applies if the sniff hardware is enabled, and has this
      --  channel selected. This allows checksum to be enabled or disabled on a
      --  per-control- block basis.
      SNIFF_EN       : Boolean := False;
      --  Read-only. This flag goes high when the channel starts a new transfer
      --  sequence, and low when the last transfer of that sequence completes.
      --  Clearing EN while BUSY is high pauses the channel, and BUSY will stay
      --  high while paused. To terminate a sequence early (and clear the BUSY
      --  flag), see CHAN_ABORT.
      BUSY           : Boolean := False;
      --  unspecified
      Reserved_27_28 : HAL.UInt2 := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a write bus error. Write one
      --  to clear. WRITE_ADDR shows the approximate address where the bus
      --  error was encountered (will not be earlier, or more than 5 transfers
      --  later)
      WRITE_ERROR    : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a read bus error. Write one
      --  to clear. READ_ADDR shows the approximate address where the bus error
      --  was encountered (will not be earlier, or more than 3 transfers later)
      READ_ERROR     : Boolean := False;
      --  Read-only. Logical OR of the READ_ERROR and WRITE_ERROR flags. The
      --  channel halts when it encounters any bus error, and always raises its
      --  channel IRQ flag.
      AHB_ERROR      : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH13_CTRL_TRIG_Register use record
      EN             at 0 range 0 .. 0;
      HIGH_PRIORITY  at 0 range 1 .. 1;
      DATA_SIZE      at 0 range 2 .. 3;
      INCR_READ      at 0 range 4 .. 4;
      INCR_READ_REV  at 0 range 5 .. 5;
      INCR_WRITE     at 0 range 6 .. 6;
      INCR_WRITE_REV at 0 range 7 .. 7;
      RING_SIZE      at 0 range 8 .. 11;
      RING_SEL       at 0 range 12 .. 12;
      CHAIN_TO       at 0 range 13 .. 16;
      TREQ_SEL       at 0 range 17 .. 22;
      IRQ_QUIET      at 0 range 23 .. 23;
      BSWAP          at 0 range 24 .. 24;
      SNIFF_EN       at 0 range 25 .. 25;
      BUSY           at 0 range 26 .. 26;
      Reserved_27_28 at 0 range 27 .. 28;
      WRITE_ERROR    at 0 range 29 .. 29;
      READ_ERROR     at 0 range 30 .. 30;
      AHB_ERROR      at 0 range 31 .. 31;
   end record;

   subtype CH14_TRANS_COUNT_COUNT_Field is HAL.UInt28;

   --  When MODE is 0x0, the transfer count decrements with each transfer until
   --  0, and then the channel triggers the next channel indicated by
   --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with each
   --  transfer until 0, and then the channel re-triggers itself, in addition
   --  to the trigger indicated by CTRL_CHAIN_TO. This is useful for e.g. an
   --  endless ring-buffer DMA with periodic interrupts. When MODE is 0xf, the
   --  transfer count does not decrement. The DMA channel performs an endless
   --  sequence of transfers, never triggering other channels or raising
   --  interrupts, until an ABORT is raised. All other values are reserved.
   type CH14_TRANS_COUNT_MODE_Field is
     (NORMAL,
      TRIGGER_SELF,
      ENDLESS)
     with Size => 4;
   for CH14_TRANS_COUNT_MODE_Field use
     (NORMAL => 0,
      TRIGGER_SELF => 1,
      ENDLESS => 15);

   --  DMA Channel 14 Transfer Count
   type CH14_TRANS_COUNT_Register is record
      --  28-bit transfer count (256 million transfers maximum). Program the
      --  number of bus transfers a channel will perform before halting. Note
      --  that, if transfers are larger than one byte in size, this is not
      --  equal to the number of bytes transferred (see CTRL_DATA_SIZE). When
      --  the channel is active, reading this register shows the number of
      --  transfers remaining, updating automatically each time a write
      --  transfer completes. Writing this register sets the RELOAD value for
      --  the transfer counter. Each time this channel is triggered, the RELOAD
      --  value is copied into the live transfer counter. The channel can be
      --  started multiple times, and will perform the same number of transfers
      --  each time, as programmed by most recent write. The RELOAD value can
      --  be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the
      --  written value is used immediately as the length of the new transfer
      --  sequence, as well as being written to RELOAD.
      COUNT : CH14_TRANS_COUNT_COUNT_Field := 16#0#;
      --  When MODE is 0x0, the transfer count decrements with each transfer
      --  until 0, and then the channel triggers the next channel indicated by
      --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with
      --  each transfer until 0, and then the channel re-triggers itself, in
      --  addition to the trigger indicated by CTRL_CHAIN_TO. This is useful
      --  for e.g. an endless ring-buffer DMA with periodic interrupts. When
      --  MODE is 0xf, the transfer count does not decrement. The DMA channel
      --  performs an endless sequence of transfers, never triggering other
      --  channels or raising interrupts, until an ABORT is raised. All other
      --  values are reserved.
      MODE  : CH14_TRANS_COUNT_MODE_Field := RP2350_SVD.DMA.NORMAL;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH14_TRANS_COUNT_Register use record
      COUNT at 0 range 0 .. 27;
      MODE  at 0 range 28 .. 31;
   end record;

   --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
   --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
   type CH14_CTRL_TRIG_DATA_SIZE_Field is
     (SIZE_BYTE,
      SIZE_HALFWORD,
      SIZE_WORD)
     with Size => 2;
   for CH14_CTRL_TRIG_DATA_SIZE_Field use
     (SIZE_BYTE => 0,
      SIZE_HALFWORD => 1,
      SIZE_WORD => 2);

   --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
   --  the lower n bits of the address will change. This wraps the address on a
   --  (1 << n) byte boundary, facilitating access to naturally-aligned ring
   --  buffers. Ring sizes between 2 and 32768 bytes are possible. This can
   --  apply to either read or write addresses, based on value of RING_SEL.
   type CH14_CTRL_TRIG_RING_SIZE_Field is
     (RING_NONE)
     with Size => 4;
   for CH14_CTRL_TRIG_RING_SIZE_Field use
     (RING_NONE => 0);

   subtype CH14_CTRL_TRIG_CHAIN_TO_Field is HAL.UInt4;

   --  Select a Transfer Request signal. The channel uses the transfer request
   --  signal to pace its data transfer rate. Sources for TREQ signals are
   --  internal (TIMERS) or external (DREQ, a Data Request from the system).
   --  0x0 to 0x3a -> select DREQ n as TREQ
   type CH14_CTRL_TRIG_TREQ_SEL_Field is
     (--  Select PIO0's TX FIFO 0 as TREQ
      PIO0_TX0,
      --  Select PIO0's TX FIFO 1 as TREQ
      PIO0_TX1,
      --  Select PIO0's TX FIFO 2 as TREQ
      PIO0_TX2,
      --  Select PIO0's TX FIFO 3 as TREQ
      PIO0_TX3,
      --  Select PIO0's RX FIFO 0 as TREQ
      PIO0_RX0,
      --  Select PIO0's RX FIFO 1 as TREQ
      PIO0_RX1,
      --  Select PIO0's RX FIFO 2 as TREQ
      PIO0_RX2,
      --  Select PIO0's RX FIFO 3 as TREQ
      PIO0_RX3,
      --  Select PIO1's TX FIFO 0 as TREQ
      PIO1_TX0,
      --  Select PIO1's TX FIFO 1 as TREQ
      PIO1_TX1,
      --  Select PIO1's TX FIFO 2 as TREQ
      PIO1_TX2,
      --  Select PIO1's TX FIFO 3 as TREQ
      PIO1_TX3,
      --  Select PIO1's RX FIFO 0 as TREQ
      PIO1_RX0,
      --  Select PIO1's RX FIFO 1 as TREQ
      PIO1_RX1,
      --  Select PIO1's RX FIFO 2 as TREQ
      PIO1_RX2,
      --  Select PIO1's RX FIFO 3 as TREQ
      PIO1_RX3,
      --  Select PIO2's TX FIFO 0 as TREQ
      PIO2_TX0,
      --  Select PIO2's TX FIFO 1 as TREQ
      PIO2_TX1,
      --  Select PIO2's TX FIFO 2 as TREQ
      PIO2_TX2,
      --  Select PIO2's TX FIFO 3 as TREQ
      PIO2_TX3,
      --  Select PIO2's RX FIFO 0 as TREQ
      PIO2_RX0,
      --  Select PIO2's RX FIFO 1 as TREQ
      PIO2_RX1,
      --  Select PIO2's RX FIFO 2 as TREQ
      PIO2_RX2,
      --  Select PIO2's RX FIFO 3 as TREQ
      PIO2_RX3,
      --  Select SPI0's TX FIFO as TREQ
      SPI0_TX,
      --  Select SPI0's RX FIFO as TREQ
      SPI0_RX,
      --  Select SPI1's TX FIFO as TREQ
      SPI1_TX,
      --  Select SPI1's RX FIFO as TREQ
      SPI1_RX,
      --  Select UART0's TX FIFO as TREQ
      UART0_TX,
      --  Select UART0's RX FIFO as TREQ
      UART0_RX,
      --  Select UART1's TX FIFO as TREQ
      UART1_TX,
      --  Select UART1's RX FIFO as TREQ
      UART1_RX,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP0,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP1,
      --  Select PWM Counter 2's Wrap Value as TREQ
      PWM_WRAP2,
      --  Select PWM Counter 3's Wrap Value as TREQ
      PWM_WRAP3,
      --  Select PWM Counter 4's Wrap Value as TREQ
      PWM_WRAP4,
      --  Select PWM Counter 5's Wrap Value as TREQ
      PWM_WRAP5,
      --  Select PWM Counter 6's Wrap Value as TREQ
      PWM_WRAP6,
      --  Select PWM Counter 7's Wrap Value as TREQ
      PWM_WRAP7,
      --  Select PWM Counter 8's Wrap Value as TREQ
      PWM_WRAP8,
      --  Select PWM Counter 9's Wrap Value as TREQ
      PWM_WRAP9,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP10,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP11,
      --  Select I2C0's TX FIFO as TREQ
      I2C0_TX,
      --  Select I2C0's RX FIFO as TREQ
      I2C0_RX,
      --  Select I2C1's TX FIFO as TREQ
      I2C1_TX,
      --  Select I2C1's RX FIFO as TREQ
      I2C1_RX,
      --  Select the ADC as TREQ
      ADC,
      --  Select the XIP Streaming FIFO as TREQ
      XIP_STREAM,
      --  Select XIP_QMITX as TREQ
      XIP_QMITX,
      --  Select XIP_QMIRX as TREQ
      XIP_QMIRX,
      --  Select HSTX as TREQ
      HSTX,
      --  Select CORESIGHT as TREQ
      CORESIGHT,
      --  Select SHA256 as TREQ
      SHA256,
      --  Select Timer 0 as TREQ
      TIMER0,
      --  Select Timer 1 as TREQ
      TIMER1,
      --  Select Timer 2 as TREQ (Optional)
      TIMER2,
      --  Select Timer 3 as TREQ (Optional)
      TIMER3,
      --  Permanent request, for unpaced transfers.
      PERMANENT)
     with Size => 6;
   for CH14_CTRL_TRIG_TREQ_SEL_Field use
     (PIO0_TX0 => 0,
      PIO0_TX1 => 1,
      PIO0_TX2 => 2,
      PIO0_TX3 => 3,
      PIO0_RX0 => 4,
      PIO0_RX1 => 5,
      PIO0_RX2 => 6,
      PIO0_RX3 => 7,
      PIO1_TX0 => 8,
      PIO1_TX1 => 9,
      PIO1_TX2 => 10,
      PIO1_TX3 => 11,
      PIO1_RX0 => 12,
      PIO1_RX1 => 13,
      PIO1_RX2 => 14,
      PIO1_RX3 => 15,
      PIO2_TX0 => 16,
      PIO2_TX1 => 17,
      PIO2_TX2 => 18,
      PIO2_TX3 => 19,
      PIO2_RX0 => 20,
      PIO2_RX1 => 21,
      PIO2_RX2 => 22,
      PIO2_RX3 => 23,
      SPI0_TX => 24,
      SPI0_RX => 25,
      SPI1_TX => 26,
      SPI1_RX => 27,
      UART0_TX => 28,
      UART0_RX => 29,
      UART1_TX => 30,
      UART1_RX => 31,
      PWM_WRAP0 => 32,
      PWM_WRAP1 => 33,
      PWM_WRAP2 => 34,
      PWM_WRAP3 => 35,
      PWM_WRAP4 => 36,
      PWM_WRAP5 => 37,
      PWM_WRAP6 => 38,
      PWM_WRAP7 => 39,
      PWM_WRAP8 => 40,
      PWM_WRAP9 => 41,
      PWM_WRAP10 => 42,
      PWM_WRAP11 => 43,
      I2C0_TX => 44,
      I2C0_RX => 45,
      I2C1_TX => 46,
      I2C1_RX => 47,
      ADC => 48,
      XIP_STREAM => 49,
      XIP_QMITX => 50,
      XIP_QMIRX => 51,
      HSTX => 52,
      CORESIGHT => 53,
      SHA256 => 54,
      TIMER0 => 59,
      TIMER1 => 60,
      TIMER2 => 61,
      TIMER3 => 62,
      PERMANENT => 63);

   --  DMA Channel 14 Control and Status
   type CH14_CTRL_TRIG_Register is record
      --  DMA Channel Enable. When 1, the channel will respond to triggering
      --  events, which will cause it to become BUSY and start transferring
      --  data. When 0, the channel will ignore triggers, stop issuing
      --  transfers, and pause the current transfer sequence (i.e. BUSY will
      --  remain high if already high)
      EN             : Boolean := False;
      --  HIGH_PRIORITY gives a channel preferential treatment in issue
      --  scheduling: in each scheduling round, all high priority channels are
      --  considered first, and then only a single low priority channel, before
      --  returning to the high priority channels. This only affects the order
      --  in which the DMA schedules channels. The DMA's bus priority is not
      --  changed. If the DMA is not saturated then a low priority channel will
      --  see no loss of throughput.
      HIGH_PRIORITY  : Boolean := False;
      --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
      --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
      DATA_SIZE      : CH14_CTRL_TRIG_DATA_SIZE_Field :=
                        RP2350_SVD.DMA.SIZE_BYTE;
      --  If 1, the read address increments with each transfer. If 0, each read
      --  is directed to the same, initial address. Generally this should be
      --  disabled for peripheral-to-memory transfers.
      INCR_READ      : Boolean := False;
      --  If 1, and INCR_READ is 1, the read address is decremented rather than
      --  incremented with each transfer. If 1, and INCR_READ is 0, this
      --  otherwise-unused combination causes the read address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_READ_REV  : Boolean := False;
      --  If 1, the write address increments with each transfer. If 0, each
      --  write is directed to the same, initial address. Generally this should
      --  be disabled for memory-to-peripheral transfers.
      INCR_WRITE     : Boolean := False;
      --  If 1, and INCR_WRITE is 1, the write address is decremented rather
      --  than incremented with each transfer. If 1, and INCR_WRITE is 0, this
      --  otherwise-unused combination causes the write address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_WRITE_REV : Boolean := False;
      --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
      --  the lower n bits of the address will change. This wraps the address
      --  on a (1 << n) byte boundary, facilitating access to naturally-aligned
      --  ring buffers. Ring sizes between 2 and 32768 bytes are possible. This
      --  can apply to either read or write addresses, based on value of
      --  RING_SEL.
      RING_SIZE      : CH14_CTRL_TRIG_RING_SIZE_Field :=
                        RP2350_SVD.DMA.RING_NONE;
      --  Select whether RING_SIZE applies to read or write addresses. If 0,
      --  read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1,
      --  write addresses are wrapped.
      RING_SEL       : Boolean := False;
      --  When this channel completes, it will trigger the channel indicated by
      --  CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_. Note this
      --  field resets to 0, so channels 1 and above will chain to channel 0 by
      --  default. Set this field to avoid this behaviour.
      CHAIN_TO       : CH14_CTRL_TRIG_CHAIN_TO_Field := 16#0#;
      --  Select a Transfer Request signal. The channel uses the transfer
      --  request signal to pace its data transfer rate. Sources for TREQ
      --  signals are internal (TIMERS) or external (DREQ, a Data Request from
      --  the system). 0x0 to 0x3a -> select DREQ n as TREQ
      TREQ_SEL       : CH14_CTRL_TRIG_TREQ_SEL_Field :=
                        RP2350_SVD.DMA.PIO0_TX0;
      --  In QUIET mode, the channel does not generate IRQs at the end of every
      --  transfer block. Instead, an IRQ is raised when NULL is written to a
      --  trigger register, indicating the end of a control block chain. This
      --  reduces the number of interrupts to be serviced by the CPU when
      --  transferring a DMA chain of many small control blocks.
      IRQ_QUIET      : Boolean := False;
      --  Apply byte-swap transformation to DMA data. For byte data, this has
      --  no effect. For halfword data, the two bytes of each halfword are
      --  swapped. For word data, the four bytes of each word are swapped to
      --  reverse order.
      BSWAP          : Boolean := False;
      --  If 1, this channel's data transfers are visible to the sniff
      --  hardware, and each transfer will advance the state of the checksum.
      --  This only applies if the sniff hardware is enabled, and has this
      --  channel selected. This allows checksum to be enabled or disabled on a
      --  per-control- block basis.
      SNIFF_EN       : Boolean := False;
      --  Read-only. This flag goes high when the channel starts a new transfer
      --  sequence, and low when the last transfer of that sequence completes.
      --  Clearing EN while BUSY is high pauses the channel, and BUSY will stay
      --  high while paused. To terminate a sequence early (and clear the BUSY
      --  flag), see CHAN_ABORT.
      BUSY           : Boolean := False;
      --  unspecified
      Reserved_27_28 : HAL.UInt2 := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a write bus error. Write one
      --  to clear. WRITE_ADDR shows the approximate address where the bus
      --  error was encountered (will not be earlier, or more than 5 transfers
      --  later)
      WRITE_ERROR    : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a read bus error. Write one
      --  to clear. READ_ADDR shows the approximate address where the bus error
      --  was encountered (will not be earlier, or more than 3 transfers later)
      READ_ERROR     : Boolean := False;
      --  Read-only. Logical OR of the READ_ERROR and WRITE_ERROR flags. The
      --  channel halts when it encounters any bus error, and always raises its
      --  channel IRQ flag.
      AHB_ERROR      : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH14_CTRL_TRIG_Register use record
      EN             at 0 range 0 .. 0;
      HIGH_PRIORITY  at 0 range 1 .. 1;
      DATA_SIZE      at 0 range 2 .. 3;
      INCR_READ      at 0 range 4 .. 4;
      INCR_READ_REV  at 0 range 5 .. 5;
      INCR_WRITE     at 0 range 6 .. 6;
      INCR_WRITE_REV at 0 range 7 .. 7;
      RING_SIZE      at 0 range 8 .. 11;
      RING_SEL       at 0 range 12 .. 12;
      CHAIN_TO       at 0 range 13 .. 16;
      TREQ_SEL       at 0 range 17 .. 22;
      IRQ_QUIET      at 0 range 23 .. 23;
      BSWAP          at 0 range 24 .. 24;
      SNIFF_EN       at 0 range 25 .. 25;
      BUSY           at 0 range 26 .. 26;
      Reserved_27_28 at 0 range 27 .. 28;
      WRITE_ERROR    at 0 range 29 .. 29;
      READ_ERROR     at 0 range 30 .. 30;
      AHB_ERROR      at 0 range 31 .. 31;
   end record;

   subtype CH15_TRANS_COUNT_COUNT_Field is HAL.UInt28;

   --  When MODE is 0x0, the transfer count decrements with each transfer until
   --  0, and then the channel triggers the next channel indicated by
   --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with each
   --  transfer until 0, and then the channel re-triggers itself, in addition
   --  to the trigger indicated by CTRL_CHAIN_TO. This is useful for e.g. an
   --  endless ring-buffer DMA with periodic interrupts. When MODE is 0xf, the
   --  transfer count does not decrement. The DMA channel performs an endless
   --  sequence of transfers, never triggering other channels or raising
   --  interrupts, until an ABORT is raised. All other values are reserved.
   type CH15_TRANS_COUNT_MODE_Field is
     (NORMAL,
      TRIGGER_SELF,
      ENDLESS)
     with Size => 4;
   for CH15_TRANS_COUNT_MODE_Field use
     (NORMAL => 0,
      TRIGGER_SELF => 1,
      ENDLESS => 15);

   --  DMA Channel 15 Transfer Count
   type CH15_TRANS_COUNT_Register is record
      --  28-bit transfer count (256 million transfers maximum). Program the
      --  number of bus transfers a channel will perform before halting. Note
      --  that, if transfers are larger than one byte in size, this is not
      --  equal to the number of bytes transferred (see CTRL_DATA_SIZE). When
      --  the channel is active, reading this register shows the number of
      --  transfers remaining, updating automatically each time a write
      --  transfer completes. Writing this register sets the RELOAD value for
      --  the transfer counter. Each time this channel is triggered, the RELOAD
      --  value is copied into the live transfer counter. The channel can be
      --  started multiple times, and will perform the same number of transfers
      --  each time, as programmed by most recent write. The RELOAD value can
      --  be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the
      --  written value is used immediately as the length of the new transfer
      --  sequence, as well as being written to RELOAD.
      COUNT : CH15_TRANS_COUNT_COUNT_Field := 16#0#;
      --  When MODE is 0x0, the transfer count decrements with each transfer
      --  until 0, and then the channel triggers the next channel indicated by
      --  CTRL_CHAIN_TO. When MODE is 0x1, the transfer count decrements with
      --  each transfer until 0, and then the channel re-triggers itself, in
      --  addition to the trigger indicated by CTRL_CHAIN_TO. This is useful
      --  for e.g. an endless ring-buffer DMA with periodic interrupts. When
      --  MODE is 0xf, the transfer count does not decrement. The DMA channel
      --  performs an endless sequence of transfers, never triggering other
      --  channels or raising interrupts, until an ABORT is raised. All other
      --  values are reserved.
      MODE  : CH15_TRANS_COUNT_MODE_Field := RP2350_SVD.DMA.NORMAL;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH15_TRANS_COUNT_Register use record
      COUNT at 0 range 0 .. 27;
      MODE  at 0 range 28 .. 31;
   end record;

   --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
   --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
   type CH15_CTRL_TRIG_DATA_SIZE_Field is
     (SIZE_BYTE,
      SIZE_HALFWORD,
      SIZE_WORD)
     with Size => 2;
   for CH15_CTRL_TRIG_DATA_SIZE_Field use
     (SIZE_BYTE => 0,
      SIZE_HALFWORD => 1,
      SIZE_WORD => 2);

   --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
   --  the lower n bits of the address will change. This wraps the address on a
   --  (1 << n) byte boundary, facilitating access to naturally-aligned ring
   --  buffers. Ring sizes between 2 and 32768 bytes are possible. This can
   --  apply to either read or write addresses, based on value of RING_SEL.
   type CH15_CTRL_TRIG_RING_SIZE_Field is
     (RING_NONE)
     with Size => 4;
   for CH15_CTRL_TRIG_RING_SIZE_Field use
     (RING_NONE => 0);

   subtype CH15_CTRL_TRIG_CHAIN_TO_Field is HAL.UInt4;

   --  Select a Transfer Request signal. The channel uses the transfer request
   --  signal to pace its data transfer rate. Sources for TREQ signals are
   --  internal (TIMERS) or external (DREQ, a Data Request from the system).
   --  0x0 to 0x3a -> select DREQ n as TREQ
   type CH15_CTRL_TRIG_TREQ_SEL_Field is
     (--  Select PIO0's TX FIFO 0 as TREQ
      PIO0_TX0,
      --  Select PIO0's TX FIFO 1 as TREQ
      PIO0_TX1,
      --  Select PIO0's TX FIFO 2 as TREQ
      PIO0_TX2,
      --  Select PIO0's TX FIFO 3 as TREQ
      PIO0_TX3,
      --  Select PIO0's RX FIFO 0 as TREQ
      PIO0_RX0,
      --  Select PIO0's RX FIFO 1 as TREQ
      PIO0_RX1,
      --  Select PIO0's RX FIFO 2 as TREQ
      PIO0_RX2,
      --  Select PIO0's RX FIFO 3 as TREQ
      PIO0_RX3,
      --  Select PIO1's TX FIFO 0 as TREQ
      PIO1_TX0,
      --  Select PIO1's TX FIFO 1 as TREQ
      PIO1_TX1,
      --  Select PIO1's TX FIFO 2 as TREQ
      PIO1_TX2,
      --  Select PIO1's TX FIFO 3 as TREQ
      PIO1_TX3,
      --  Select PIO1's RX FIFO 0 as TREQ
      PIO1_RX0,
      --  Select PIO1's RX FIFO 1 as TREQ
      PIO1_RX1,
      --  Select PIO1's RX FIFO 2 as TREQ
      PIO1_RX2,
      --  Select PIO1's RX FIFO 3 as TREQ
      PIO1_RX3,
      --  Select PIO2's TX FIFO 0 as TREQ
      PIO2_TX0,
      --  Select PIO2's TX FIFO 1 as TREQ
      PIO2_TX1,
      --  Select PIO2's TX FIFO 2 as TREQ
      PIO2_TX2,
      --  Select PIO2's TX FIFO 3 as TREQ
      PIO2_TX3,
      --  Select PIO2's RX FIFO 0 as TREQ
      PIO2_RX0,
      --  Select PIO2's RX FIFO 1 as TREQ
      PIO2_RX1,
      --  Select PIO2's RX FIFO 2 as TREQ
      PIO2_RX2,
      --  Select PIO2's RX FIFO 3 as TREQ
      PIO2_RX3,
      --  Select SPI0's TX FIFO as TREQ
      SPI0_TX,
      --  Select SPI0's RX FIFO as TREQ
      SPI0_RX,
      --  Select SPI1's TX FIFO as TREQ
      SPI1_TX,
      --  Select SPI1's RX FIFO as TREQ
      SPI1_RX,
      --  Select UART0's TX FIFO as TREQ
      UART0_TX,
      --  Select UART0's RX FIFO as TREQ
      UART0_RX,
      --  Select UART1's TX FIFO as TREQ
      UART1_TX,
      --  Select UART1's RX FIFO as TREQ
      UART1_RX,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP0,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP1,
      --  Select PWM Counter 2's Wrap Value as TREQ
      PWM_WRAP2,
      --  Select PWM Counter 3's Wrap Value as TREQ
      PWM_WRAP3,
      --  Select PWM Counter 4's Wrap Value as TREQ
      PWM_WRAP4,
      --  Select PWM Counter 5's Wrap Value as TREQ
      PWM_WRAP5,
      --  Select PWM Counter 6's Wrap Value as TREQ
      PWM_WRAP6,
      --  Select PWM Counter 7's Wrap Value as TREQ
      PWM_WRAP7,
      --  Select PWM Counter 8's Wrap Value as TREQ
      PWM_WRAP8,
      --  Select PWM Counter 9's Wrap Value as TREQ
      PWM_WRAP9,
      --  Select PWM Counter 0's Wrap Value as TREQ
      PWM_WRAP10,
      --  Select PWM Counter 1's Wrap Value as TREQ
      PWM_WRAP11,
      --  Select I2C0's TX FIFO as TREQ
      I2C0_TX,
      --  Select I2C0's RX FIFO as TREQ
      I2C0_RX,
      --  Select I2C1's TX FIFO as TREQ
      I2C1_TX,
      --  Select I2C1's RX FIFO as TREQ
      I2C1_RX,
      --  Select the ADC as TREQ
      ADC,
      --  Select the XIP Streaming FIFO as TREQ
      XIP_STREAM,
      --  Select XIP_QMITX as TREQ
      XIP_QMITX,
      --  Select XIP_QMIRX as TREQ
      XIP_QMIRX,
      --  Select HSTX as TREQ
      HSTX,
      --  Select CORESIGHT as TREQ
      CORESIGHT,
      --  Select SHA256 as TREQ
      SHA256,
      --  Select Timer 0 as TREQ
      TIMER0,
      --  Select Timer 1 as TREQ
      TIMER1,
      --  Select Timer 2 as TREQ (Optional)
      TIMER2,
      --  Select Timer 3 as TREQ (Optional)
      TIMER3,
      --  Permanent request, for unpaced transfers.
      PERMANENT)
     with Size => 6;
   for CH15_CTRL_TRIG_TREQ_SEL_Field use
     (PIO0_TX0 => 0,
      PIO0_TX1 => 1,
      PIO0_TX2 => 2,
      PIO0_TX3 => 3,
      PIO0_RX0 => 4,
      PIO0_RX1 => 5,
      PIO0_RX2 => 6,
      PIO0_RX3 => 7,
      PIO1_TX0 => 8,
      PIO1_TX1 => 9,
      PIO1_TX2 => 10,
      PIO1_TX3 => 11,
      PIO1_RX0 => 12,
      PIO1_RX1 => 13,
      PIO1_RX2 => 14,
      PIO1_RX3 => 15,
      PIO2_TX0 => 16,
      PIO2_TX1 => 17,
      PIO2_TX2 => 18,
      PIO2_TX3 => 19,
      PIO2_RX0 => 20,
      PIO2_RX1 => 21,
      PIO2_RX2 => 22,
      PIO2_RX3 => 23,
      SPI0_TX => 24,
      SPI0_RX => 25,
      SPI1_TX => 26,
      SPI1_RX => 27,
      UART0_TX => 28,
      UART0_RX => 29,
      UART1_TX => 30,
      UART1_RX => 31,
      PWM_WRAP0 => 32,
      PWM_WRAP1 => 33,
      PWM_WRAP2 => 34,
      PWM_WRAP3 => 35,
      PWM_WRAP4 => 36,
      PWM_WRAP5 => 37,
      PWM_WRAP6 => 38,
      PWM_WRAP7 => 39,
      PWM_WRAP8 => 40,
      PWM_WRAP9 => 41,
      PWM_WRAP10 => 42,
      PWM_WRAP11 => 43,
      I2C0_TX => 44,
      I2C0_RX => 45,
      I2C1_TX => 46,
      I2C1_RX => 47,
      ADC => 48,
      XIP_STREAM => 49,
      XIP_QMITX => 50,
      XIP_QMIRX => 51,
      HSTX => 52,
      CORESIGHT => 53,
      SHA256 => 54,
      TIMER0 => 59,
      TIMER1 => 60,
      TIMER2 => 61,
      TIMER3 => 62,
      PERMANENT => 63);

   --  DMA Channel 15 Control and Status
   type CH15_CTRL_TRIG_Register is record
      --  DMA Channel Enable. When 1, the channel will respond to triggering
      --  events, which will cause it to become BUSY and start transferring
      --  data. When 0, the channel will ignore triggers, stop issuing
      --  transfers, and pause the current transfer sequence (i.e. BUSY will
      --  remain high if already high)
      EN             : Boolean := False;
      --  HIGH_PRIORITY gives a channel preferential treatment in issue
      --  scheduling: in each scheduling round, all high priority channels are
      --  considered first, and then only a single low priority channel, before
      --  returning to the high priority channels. This only affects the order
      --  in which the DMA schedules channels. The DMA's bus priority is not
      --  changed. If the DMA is not saturated then a low priority channel will
      --  see no loss of throughput.
      HIGH_PRIORITY  : Boolean := False;
      --  Set the size of each bus transfer (byte/halfword/word). READ_ADDR and
      --  WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
      DATA_SIZE      : CH15_CTRL_TRIG_DATA_SIZE_Field :=
                        RP2350_SVD.DMA.SIZE_BYTE;
      --  If 1, the read address increments with each transfer. If 0, each read
      --  is directed to the same, initial address. Generally this should be
      --  disabled for peripheral-to-memory transfers.
      INCR_READ      : Boolean := False;
      --  If 1, and INCR_READ is 1, the read address is decremented rather than
      --  incremented with each transfer. If 1, and INCR_READ is 0, this
      --  otherwise-unused combination causes the read address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_READ_REV  : Boolean := False;
      --  If 1, the write address increments with each transfer. If 0, each
      --  write is directed to the same, initial address. Generally this should
      --  be disabled for memory-to-peripheral transfers.
      INCR_WRITE     : Boolean := False;
      --  If 1, and INCR_WRITE is 1, the write address is decremented rather
      --  than incremented with each transfer. If 1, and INCR_WRITE is 0, this
      --  otherwise-unused combination causes the write address to be
      --  incremented by twice the transfer size, i.e. skipping over alternate
      --  addresses.
      INCR_WRITE_REV : Boolean := False;
      --  Size of address wrap region. If 0, don't wrap. For values n > 0, only
      --  the lower n bits of the address will change. This wraps the address
      --  on a (1 << n) byte boundary, facilitating access to naturally-aligned
      --  ring buffers. Ring sizes between 2 and 32768 bytes are possible. This
      --  can apply to either read or write addresses, based on value of
      --  RING_SEL.
      RING_SIZE      : CH15_CTRL_TRIG_RING_SIZE_Field :=
                        RP2350_SVD.DMA.RING_NONE;
      --  Select whether RING_SIZE applies to read or write addresses. If 0,
      --  read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1,
      --  write addresses are wrapped.
      RING_SEL       : Boolean := False;
      --  When this channel completes, it will trigger the channel indicated by
      --  CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_. Note this
      --  field resets to 0, so channels 1 and above will chain to channel 0 by
      --  default. Set this field to avoid this behaviour.
      CHAIN_TO       : CH15_CTRL_TRIG_CHAIN_TO_Field := 16#0#;
      --  Select a Transfer Request signal. The channel uses the transfer
      --  request signal to pace its data transfer rate. Sources for TREQ
      --  signals are internal (TIMERS) or external (DREQ, a Data Request from
      --  the system). 0x0 to 0x3a -> select DREQ n as TREQ
      TREQ_SEL       : CH15_CTRL_TRIG_TREQ_SEL_Field :=
                        RP2350_SVD.DMA.PIO0_TX0;
      --  In QUIET mode, the channel does not generate IRQs at the end of every
      --  transfer block. Instead, an IRQ is raised when NULL is written to a
      --  trigger register, indicating the end of a control block chain. This
      --  reduces the number of interrupts to be serviced by the CPU when
      --  transferring a DMA chain of many small control blocks.
      IRQ_QUIET      : Boolean := False;
      --  Apply byte-swap transformation to DMA data. For byte data, this has
      --  no effect. For halfword data, the two bytes of each halfword are
      --  swapped. For word data, the four bytes of each word are swapped to
      --  reverse order.
      BSWAP          : Boolean := False;
      --  If 1, this channel's data transfers are visible to the sniff
      --  hardware, and each transfer will advance the state of the checksum.
      --  This only applies if the sniff hardware is enabled, and has this
      --  channel selected. This allows checksum to be enabled or disabled on a
      --  per-control- block basis.
      SNIFF_EN       : Boolean := False;
      --  Read-only. This flag goes high when the channel starts a new transfer
      --  sequence, and low when the last transfer of that sequence completes.
      --  Clearing EN while BUSY is high pauses the channel, and BUSY will stay
      --  high while paused. To terminate a sequence early (and clear the BUSY
      --  flag), see CHAN_ABORT.
      BUSY           : Boolean := False;
      --  unspecified
      Reserved_27_28 : HAL.UInt2 := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a write bus error. Write one
      --  to clear. WRITE_ADDR shows the approximate address where the bus
      --  error was encountered (will not be earlier, or more than 5 transfers
      --  later)
      WRITE_ERROR    : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. If 1, the channel received a read bus error. Write one
      --  to clear. READ_ADDR shows the approximate address where the bus error
      --  was encountered (will not be earlier, or more than 3 transfers later)
      READ_ERROR     : Boolean := False;
      --  Read-only. Logical OR of the READ_ERROR and WRITE_ERROR flags. The
      --  channel halts when it encounters any bus error, and always raises its
      --  channel IRQ flag.
      AHB_ERROR      : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH15_CTRL_TRIG_Register use record
      EN             at 0 range 0 .. 0;
      HIGH_PRIORITY  at 0 range 1 .. 1;
      DATA_SIZE      at 0 range 2 .. 3;
      INCR_READ      at 0 range 4 .. 4;
      INCR_READ_REV  at 0 range 5 .. 5;
      INCR_WRITE     at 0 range 6 .. 6;
      INCR_WRITE_REV at 0 range 7 .. 7;
      RING_SIZE      at 0 range 8 .. 11;
      RING_SEL       at 0 range 12 .. 12;
      CHAIN_TO       at 0 range 13 .. 16;
      TREQ_SEL       at 0 range 17 .. 22;
      IRQ_QUIET      at 0 range 23 .. 23;
      BSWAP          at 0 range 24 .. 24;
      SNIFF_EN       at 0 range 25 .. 25;
      BUSY           at 0 range 26 .. 26;
      Reserved_27_28 at 0 range 27 .. 28;
      WRITE_ERROR    at 0 range 29 .. 29;
      READ_ERROR     at 0 range 30 .. 30;
      AHB_ERROR      at 0 range 31 .. 31;
   end record;

   subtype INTR_INTR_Field is HAL.UInt16;

   --  Interrupt Status (raw)
   type INTR_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Raw interrupt status for DMA Channels 0..15. Bit n
      --  corresponds to channel n. Ignores any masking or forcing. Channel
      --  interrupts can be cleared by writing a bit mask to INTR or
      --  INTS0/1/2/3. Channel interrupts can be routed to either of four
      --  system-level IRQs based on INTE0, INTE1, INTE2 and INTE3. The
      --  multiple system-level interrupts might be used to allow NVIC IRQ
      --  preemption for more time-critical channels, to spread IRQ load across
      --  different cores, or to target IRQs to different security domains. It
      --  is also valid to ignore the multiple IRQs, and just use
      --  INTE0/INTS0/IRQ 0. If this register is accessed at a
      --  security/privilege level less than that of a given channel (as
      --  defined by that channel's SECCFG_CHx register), then that channel's
      --  interrupt status will read as 0, ignore writes.
      INTR           : INTR_INTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTR_Register use record
      INTR           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INTE0_INTE0_Field is HAL.UInt16;

   --  Interrupt Enables for IRQ 0
   type INTE0_Register is record
      --  Set bit n to pass interrupts from channel n to DMA IRQ 0. Note this
      --  bit has no effect if the channel security/privilege level, defined by
      --  SECCFG_CHx, is greater than the IRQ security/privilege defined by
      --  SECCFG_IRQ0.
      INTE0          : INTE0_INTE0_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTE0_Register use record
      INTE0          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INTF0_INTF0_Field is HAL.UInt16;

   --  Force Interrupts
   type INTF0_Register is record
      --  Write 1s to force the corresponding bits in INTS0. The interrupt
      --  remains asserted until INTF0 is cleared.
      INTF0          : INTF0_INTF0_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTF0_Register use record
      INTF0          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INTS0_INTS0_Field is HAL.UInt16;

   --  Interrupt Status for IRQ 0
   type INTS0_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Indicates active channel interrupt requests which are
      --  currently causing IRQ 0 to be asserted. Channel interrupts can be
      --  cleared by writing a bit mask here. Channels with a
      --  security/privilege (SECCFG_CHx) greater SECCFG_IRQ0) read as 0 in
      --  this register, and ignore writes.
      INTS0          : INTS0_INTS0_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTS0_Register use record
      INTS0          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INTR1_INTR1_Field is HAL.UInt16;

   --  Interrupt Status (raw)
   type INTR1_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Raw interrupt status for DMA Channels 0..15. Bit n
      --  corresponds to channel n. Ignores any masking or forcing. Channel
      --  interrupts can be cleared by writing a bit mask to INTR or
      --  INTS0/1/2/3. Channel interrupts can be routed to either of four
      --  system-level IRQs based on INTE0, INTE1, INTE2 and INTE3. The
      --  multiple system-level interrupts might be used to allow NVIC IRQ
      --  preemption for more time-critical channels, to spread IRQ load across
      --  different cores, or to target IRQs to different security domains. It
      --  is also valid to ignore the multiple IRQs, and just use
      --  INTE0/INTS0/IRQ 0. If this register is accessed at a
      --  security/privilege level less than that of a given channel (as
      --  defined by that channel's SECCFG_CHx register), then that channel's
      --  interrupt status will read as 0, ignore writes.
      INTR1          : INTR1_INTR1_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTR1_Register use record
      INTR1          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INTE1_INTE1_Field is HAL.UInt16;

   --  Interrupt Enables for IRQ 1
   type INTE1_Register is record
      --  Set bit n to pass interrupts from channel n to DMA IRQ 1. Note this
      --  bit has no effect if the channel security/privilege level, defined by
      --  SECCFG_CHx, is greater than the IRQ security/privilege defined by
      --  SECCFG_IRQ1.
      INTE1          : INTE1_INTE1_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTE1_Register use record
      INTE1          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INTF1_INTF1_Field is HAL.UInt16;

   --  Force Interrupts
   type INTF1_Register is record
      --  Write 1s to force the corresponding bits in INTS1. The interrupt
      --  remains asserted until INTF1 is cleared.
      INTF1          : INTF1_INTF1_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTF1_Register use record
      INTF1          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INTS1_INTS1_Field is HAL.UInt16;

   --  Interrupt Status for IRQ 1
   type INTS1_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Indicates active channel interrupt requests which are
      --  currently causing IRQ 1 to be asserted. Channel interrupts can be
      --  cleared by writing a bit mask here. Channels with a
      --  security/privilege (SECCFG_CHx) greater SECCFG_IRQ1) read as 0 in
      --  this register, and ignore writes.
      INTS1          : INTS1_INTS1_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTS1_Register use record
      INTS1          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INTR2_INTR2_Field is HAL.UInt16;

   --  Interrupt Status (raw)
   type INTR2_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Raw interrupt status for DMA Channels 0..15. Bit n
      --  corresponds to channel n. Ignores any masking or forcing. Channel
      --  interrupts can be cleared by writing a bit mask to INTR or
      --  INTS0/1/2/3. Channel interrupts can be routed to either of four
      --  system-level IRQs based on INTE0, INTE1, INTE2 and INTE3. The
      --  multiple system-level interrupts might be used to allow NVIC IRQ
      --  preemption for more time-critical channels, to spread IRQ load across
      --  different cores, or to target IRQs to different security domains. It
      --  is also valid to ignore the multiple IRQs, and just use
      --  INTE0/INTS0/IRQ 0. If this register is accessed at a
      --  security/privilege level less than that of a given channel (as
      --  defined by that channel's SECCFG_CHx register), then that channel's
      --  interrupt status will read as 0, ignore writes.
      INTR2          : INTR2_INTR2_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTR2_Register use record
      INTR2          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INTE2_INTE2_Field is HAL.UInt16;

   --  Interrupt Enables for IRQ 2
   type INTE2_Register is record
      --  Set bit n to pass interrupts from channel n to DMA IRQ 2. Note this
      --  bit has no effect if the channel security/privilege level, defined by
      --  SECCFG_CHx, is greater than the IRQ security/privilege defined by
      --  SECCFG_IRQ2.
      INTE2          : INTE2_INTE2_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTE2_Register use record
      INTE2          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INTF2_INTF2_Field is HAL.UInt16;

   --  Force Interrupts
   type INTF2_Register is record
      --  Write 1s to force the corresponding bits in INTS2. The interrupt
      --  remains asserted until INTF2 is cleared.
      INTF2          : INTF2_INTF2_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTF2_Register use record
      INTF2          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INTS2_INTS2_Field is HAL.UInt16;

   --  Interrupt Status for IRQ 2
   type INTS2_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Indicates active channel interrupt requests which are
      --  currently causing IRQ 2 to be asserted. Channel interrupts can be
      --  cleared by writing a bit mask here. Channels with a
      --  security/privilege (SECCFG_CHx) greater SECCFG_IRQ2) read as 0 in
      --  this register, and ignore writes.
      INTS2          : INTS2_INTS2_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTS2_Register use record
      INTS2          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INTR3_INTR3_Field is HAL.UInt16;

   --  Interrupt Status (raw)
   type INTR3_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Raw interrupt status for DMA Channels 0..15. Bit n
      --  corresponds to channel n. Ignores any masking or forcing. Channel
      --  interrupts can be cleared by writing a bit mask to INTR or
      --  INTS0/1/2/3. Channel interrupts can be routed to either of four
      --  system-level IRQs based on INTE0, INTE1, INTE2 and INTE3. The
      --  multiple system-level interrupts might be used to allow NVIC IRQ
      --  preemption for more time-critical channels, to spread IRQ load across
      --  different cores, or to target IRQs to different security domains. It
      --  is also valid to ignore the multiple IRQs, and just use
      --  INTE0/INTS0/IRQ 0. If this register is accessed at a
      --  security/privilege level less than that of a given channel (as
      --  defined by that channel's SECCFG_CHx register), then that channel's
      --  interrupt status will read as 0, ignore writes.
      INTR3          : INTR3_INTR3_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTR3_Register use record
      INTR3          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INTE3_INTE3_Field is HAL.UInt16;

   --  Interrupt Enables for IRQ 3
   type INTE3_Register is record
      --  Set bit n to pass interrupts from channel n to DMA IRQ 3. Note this
      --  bit has no effect if the channel security/privilege level, defined by
      --  SECCFG_CHx, is greater than the IRQ security/privilege defined by
      --  SECCFG_IRQ3.
      INTE3          : INTE3_INTE3_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTE3_Register use record
      INTE3          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INTF3_INTF3_Field is HAL.UInt16;

   --  Force Interrupts
   type INTF3_Register is record
      --  Write 1s to force the corresponding bits in INTS3. The interrupt
      --  remains asserted until INTF3 is cleared.
      INTF3          : INTF3_INTF3_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTF3_Register use record
      INTF3          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INTS3_INTS3_Field is HAL.UInt16;

   --  Interrupt Status for IRQ 3
   type INTS3_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Indicates active channel interrupt requests which are
      --  currently causing IRQ 3 to be asserted. Channel interrupts can be
      --  cleared by writing a bit mask here. Channels with a
      --  security/privilege (SECCFG_CHx) greater SECCFG_IRQ3) read as 0 in
      --  this register, and ignore writes.
      INTS3          : INTS3_INTS3_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTS3_Register use record
      INTS3          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype TIMER_Y_Field is HAL.UInt16;
   subtype TIMER_X_Field is HAL.UInt16;

   --  Pacing (X/Y) fractional timer The pacing timer produces TREQ assertions
   --  at a rate set by ((X/Y) * sys_clk). This equation is evaluated every
   --  sys_clk cycles and therefore can only generate TREQs at a rate of 1 per
   --  sys_clk (i.e. permanent TREQ) or less.
   type TIMER_Register is record
      --  Pacing Timer Divisor. Specifies the Y value for the (X/Y) fractional
      --  timer.
      Y : TIMER_Y_Field := 16#0#;
      --  Pacing Timer Dividend. Specifies the X value for the (X/Y) fractional
      --  timer.
      X : TIMER_X_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TIMER_Register use record
      Y at 0 range 0 .. 15;
      X at 0 range 16 .. 31;
   end record;

   subtype MULTI_CHAN_TRIGGER_MULTI_CHAN_TRIGGER_Field is HAL.UInt16;

   --  Trigger one or more channels simultaneously
   type MULTI_CHAN_TRIGGER_Register is record
      --  Write-only. Each bit in this register corresponds to a DMA channel.
      --  Writing a 1 to the relevant bit is the same as writing to that
      --  channel's trigger register; the channel will start if it is currently
      --  enabled and not already busy.
      MULTI_CHAN_TRIGGER : MULTI_CHAN_TRIGGER_MULTI_CHAN_TRIGGER_Field :=
                            16#0#;
      --  unspecified
      Reserved_16_31     : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MULTI_CHAN_TRIGGER_Register use record
      MULTI_CHAN_TRIGGER at 0 range 0 .. 15;
      Reserved_16_31     at 0 range 16 .. 31;
   end record;

   subtype SNIFF_CTRL_DMACH_Field is HAL.UInt4;

   type SNIFF_CTRL_CALC_Field is
     (--  Calculate a CRC-32 (IEEE802.3 polynomial)
      CRC32,
      --  Calculate a CRC-32 (IEEE802.3 polynomial) with bit reversed data
      CRC32R,
      --  Calculate a CRC-16-CCITT
      CRC16,
      --  Calculate a CRC-16-CCITT with bit reversed data
      CRC16R,
      --  XOR reduction over all data. == 1 if the total 1 population count is odd.
      EVEN,
      --  Calculate a simple 32-bit checksum (addition with a 32 bit accumulator)
      SUM)
     with Size => 4;
   for SNIFF_CTRL_CALC_Field use
     (CRC32 => 0,
      CRC32R => 1,
      CRC16 => 2,
      CRC16R => 3,
      EVEN => 14,
      SUM => 15);

   --  Sniffer Control
   type SNIFF_CTRL_Register is record
      --  Enable sniffer
      EN             : Boolean := False;
      --  DMA channel for Sniffer to observe
      DMACH          : SNIFF_CTRL_DMACH_Field := 16#0#;
      CALC           : SNIFF_CTRL_CALC_Field := RP2350_SVD.DMA.CRC32;
      --  Locally perform a byte reverse on the sniffed data, before feeding
      --  into checksum. Note that the sniff hardware is downstream of the DMA
      --  channel byteswap performed in the read master: if channel CTRL_BSWAP
      --  and SNIFF_CTRL_BSWAP are both enabled, their effects cancel from the
      --  sniffer's point of view.
      BSWAP          : Boolean := False;
      --  If set, the result appears bit-reversed when read. This does not
      --  affect the way the checksum is calculated; the result is transformed
      --  on-the-fly between the result register and the bus.
      OUT_REV        : Boolean := False;
      --  If set, the result appears inverted (bitwise complement) when read.
      --  This does not affect the way the checksum is calculated; the result
      --  is transformed on-the-fly between the result register and the bus.
      OUT_INV        : Boolean := False;
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SNIFF_CTRL_Register use record
      EN             at 0 range 0 .. 0;
      DMACH          at 0 range 1 .. 4;
      CALC           at 0 range 5 .. 8;
      BSWAP          at 0 range 9 .. 9;
      OUT_REV        at 0 range 10 .. 10;
      OUT_INV        at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype FIFO_LEVELS_TDF_LVL_Field is HAL.UInt8;
   subtype FIFO_LEVELS_WAF_LVL_Field is HAL.UInt8;
   subtype FIFO_LEVELS_RAF_LVL_Field is HAL.UInt8;

   --  Debug RAF, WAF, TDF levels
   type FIFO_LEVELS_Register is record
      --  Read-only. Current Transfer-Data-FIFO fill level
      TDF_LVL        : FIFO_LEVELS_TDF_LVL_Field;
      --  Read-only. Current Write-Address-FIFO fill level
      WAF_LVL        : FIFO_LEVELS_WAF_LVL_Field;
      --  Read-only. Current Read-Address-FIFO fill level
      RAF_LVL        : FIFO_LEVELS_RAF_LVL_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FIFO_LEVELS_Register use record
      TDF_LVL        at 0 range 0 .. 7;
      WAF_LVL        at 0 range 8 .. 15;
      RAF_LVL        at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CHAN_ABORT_CHAN_ABORT_Field is HAL.UInt16;

   --  Abort an in-progress transfer sequence on one or more channels
   type CHAN_ABORT_Register is record
      --  Write-only. Each bit corresponds to a channel. Writing a 1 aborts
      --  whatever transfer sequence is in progress on that channel. The bit
      --  will remain high until any in-flight transfers have been flushed
      --  through the address and data FIFOs. After writing, this register must
      --  be polled until it returns all-zero. Until this point, it is unsafe
      --  to restart the channel.
      CHAN_ABORT     : CHAN_ABORT_CHAN_ABORT_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CHAN_ABORT_Register use record
      CHAN_ABORT     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype N_CHANNELS_N_CHANNELS_Field is HAL.UInt5;

   --  The number of channels this DMA instance is equipped with. This DMA
   --  supports up to 16 hardware channels, but can be configured with as few
   --  as one, to minimise silicon area.
   type N_CHANNELS_Register is record
      --  Read-only.
      N_CHANNELS    : N_CHANNELS_N_CHANNELS_Field;
      --  unspecified
      Reserved_5_31 : HAL.UInt27;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for N_CHANNELS_Register use record
      N_CHANNELS    at 0 range 0 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   --  Security configuration for channel 0. Control whether this channel
   --  performs Secure/Non-secure and Privileged/Unprivileged bus accesses. If
   --  this channel generates bus accesses of some security level, an access of
   --  at least that level (in the order S+P > S+U > NS+P > NS+U) is required
   --  to program, trigger, abort, check the status of, interrupt on or
   --  acknowledge the interrupt of this channel. This register automatically
   --  locks down (becomes read-only) once software starts to configure the
   --  channel. This register is world-readable, but is writable only from a
   --  Secure, Privileged context.
   type SECCFG_CH_Register is record
      --  Privileged channel. If 1, this channel performs Privileged bus
      --  accesses. If 0, it performs Unprivileged bus accesses. If 1, this
      --  channel is controllable only from a Privileged context of the same
      --  Secure/Non-secure level, or any context of a higher Secure/Non-secure
      --  level.
      P             : Boolean := True;
      --  Secure channel. If 1, this channel performs Secure bus accesses. If
      --  0, it performs Non-secure bus accesses. If 1, this channel is
      --  controllable only from a Secure context.
      S             : Boolean := True;
      --  LOCK is 0 at reset, and is set to 1 automatically upon a successful
      --  write to this channel's control registers. That is, a write to CTRL,
      --  READ_ADDR, WRITE_ADDR, TRANS_COUNT and their aliases. Once its LOCK
      --  bit is set, this register becomes read-only. A failed write, for
      --  example due to the write's privilege being lower than that specified
      --  in the channel's SECCFG register, will not set the LOCK bit.
      LOCK          : Boolean := False;
      --  unspecified
      Reserved_3_31 : HAL.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SECCFG_CH_Register use record
      P             at 0 range 0 .. 0;
      S             at 0 range 1 .. 1;
      LOCK          at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   --  Security configuration for IRQ 0. Control whether the IRQ permits
   --  configuration by Non-secure/Unprivileged contexts, and whether it can
   --  observe Secure/Privileged channel interrupt flags.
   type SECCFG_IRQ_Register is record
      --  Privileged IRQ. If 1, this IRQ's control registers can only be
      --  accessed from a Privileged context. If 0, this IRQ's control
      --  registers can be accessed from an Unprivileged context, but
      --  Privileged channels (as per SECCFG_CHx) are masked from the IRQ
      --  status, and this IRQ's registers can not be used to acknowledge the
      --  channel interrupts of Privileged channels.
      P             : Boolean := True;
      --  Secure IRQ. If 1, this IRQ's control registers can only be accessed
      --  from a Secure context. If 0, this IRQ's control registers can be
      --  accessed from a Non-secure context, but Secure channels (as per
      --  SECCFG_CHx) are masked from the IRQ status, and this IRQ's registers
      --  can not be used to acknowledge the channel interrupts of Secure
      --  channels.
      S             : Boolean := True;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SECCFG_IRQ_Register use record
      P             at 0 range 0 .. 0;
      S             at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   --  Miscellaneous security configuration
   type SECCFG_MISC_Register is record
      --  If 1, the sniffer can see data transfers from Privileged channels,
      --  and can itself only be accessed from a privileged context, or from a
      --  Secure context when SNIFF_S is 0. If 0, the sniffer can be accessed
      --  from either a Privileged or Unprivileged context (with sufficient
      --  security level) but can not see transfers from Privileged channels.
      SNIFF_P        : Boolean := True;
      --  If 1, the sniffer can see data transfers from Secure channels, and
      --  can itself only be accessed from a Secure context. If 0, the sniffer
      --  can be accessed from either a Secure or Non-secure context, but can
      --  not see data transfers of Secure channels.
      SNIFF_S        : Boolean := True;
      --  If 1, the TIMER0 register is only accessible from a Privileged (or
      --  more Secure) context, and timer DREQ 0 is only visible to Privileged
      --  (or more Secure) channels.
      TIMER0_P       : Boolean := True;
      --  If 1, the TIMER0 register is only accessible from a Secure context,
      --  and timer DREQ 0 is only visible to Secure channels.
      TIMER0_S       : Boolean := True;
      --  If 1, the TIMER1 register is only accessible from a Privileged (or
      --  more Secure) context, and timer DREQ 1 is only visible to Privileged
      --  (or more Secure) channels.
      TIMER1_P       : Boolean := True;
      --  If 1, the TIMER1 register is only accessible from a Secure context,
      --  and timer DREQ 1 is only visible to Secure channels.
      TIMER1_S       : Boolean := True;
      --  If 1, the TIMER2 register is only accessible from a Privileged (or
      --  more Secure) context, and timer DREQ 2 is only visible to Privileged
      --  (or more Secure) channels.
      TIMER2_P       : Boolean := True;
      --  If 1, the TIMER2 register is only accessible from a Secure context,
      --  and timer DREQ 2 is only visible to Secure channels.
      TIMER2_S       : Boolean := True;
      --  If 1, the TIMER3 register is only accessible from a Privileged (or
      --  more Secure) context, and timer DREQ 3 is only visible to Privileged
      --  (or more Secure) channels.
      TIMER3_P       : Boolean := True;
      --  If 1, the TIMER3 register is only accessible from a Secure context,
      --  and timer DREQ 3 is only visible to Secure channels.
      TIMER3_S       : Boolean := True;
      --  unspecified
      Reserved_10_31 : HAL.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SECCFG_MISC_Register use record
      SNIFF_P        at 0 range 0 .. 0;
      SNIFF_S        at 0 range 1 .. 1;
      TIMER0_P       at 0 range 2 .. 2;
      TIMER0_S       at 0 range 3 .. 3;
      TIMER1_P       at 0 range 4 .. 4;
      TIMER1_S       at 0 range 5 .. 5;
      TIMER2_P       at 0 range 6 .. 6;
      TIMER2_S       at 0 range 7 .. 7;
      TIMER3_P       at 0 range 8 .. 8;
      TIMER3_S       at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   --  Control register for DMA MPU. Accessible only from a Privileged context.
   type MPU_CTRL_Register is record
      --  unspecified
      Reserved_0_0  : HAL.Bit := 16#0#;
      --  Determine whether an address not covered by an active MPU region is
      --  Privileged (1) or Unprivileged (0)
      P             : Boolean := False;
      --  Determine whether an address not covered by an active MPU region is
      --  Secure (1) or Non-secure (0)
      S             : Boolean := False;
      --  By default, when a region's S bit is clear, Non-secure-Privileged
      --  reads can see the region's base address and limit address. Set this
      --  bit to make the addresses appear as 0 to Non-secure reads, even when
      --  the region is Non-secure, to avoid leaking information about the
      --  processor SAU map.
      NS_HIDE_ADDR  : Boolean := False;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MPU_CTRL_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      P             at 0 range 1 .. 1;
      S             at 0 range 2 .. 2;
      NS_HIDE_ADDR  at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype MPU_BAR_ADDR_Field is HAL.UInt27;

   --  Base address register for MPU region 0. Writable only from a Secure,
   --  Privileged context.
   type MPU_BAR_Register is record
      --  unspecified
      Reserved_0_4 : HAL.UInt5 := 16#0#;
      --  This MPU region matches addresses where addr[31:5] (the 27 most
      --  significant bits) are greater than or equal to BAR_ADDR, and less
      --  than or equal to LAR_ADDR. Readable from any Privileged context, if
      --  and only if this region's S bit is clear, and MPU_CTRL_NS_HIDE_ADDR
      --  is clear. Otherwise readable only from a Secure, Privileged context.
      ADDR         : MPU_BAR_ADDR_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MPU_BAR_Register use record
      Reserved_0_4 at 0 range 0 .. 4;
      ADDR         at 0 range 5 .. 31;
   end record;

   subtype MPU_LAR_ADDR_Field is HAL.UInt27;

   --  Limit address register for MPU region 0. Writable only from a Secure,
   --  Privileged context, with the exception of the P bit.
   type MPU_LAR_Register is record
      --  Region enable. If 1, any address within range specified by the base
      --  address (BAR_ADDR) and limit address (LAR_ADDR) has the attributes
      --  specified by S and P.
      EN           : Boolean := False;
      --  Determines the Privileged/Unprivileged (=1/0) status of addresses
      --  matching this region, if this region is enabled. Writable from any
      --  Privileged context, if and only if the S bit is clear. Otherwise,
      --  writable only from a Secure, Privileged context.
      P            : Boolean := False;
      --  Determines the Secure/Non-secure (=1/0) status of addresses matching
      --  this region, if this region is enabled.
      S            : Boolean := False;
      --  unspecified
      Reserved_3_4 : HAL.UInt2 := 16#0#;
      --  Limit address bits 31:5. Readable from any Privileged context, if and
      --  only if this region's S bit is clear, and MPU_CTRL_NS_HIDE_ADDR is
      --  clear. Otherwise readable only from a Secure, Privileged context.
      ADDR         : MPU_LAR_ADDR_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MPU_LAR_Register use record
      EN           at 0 range 0 .. 0;
      P            at 0 range 1 .. 1;
      S            at 0 range 2 .. 2;
      Reserved_3_4 at 0 range 3 .. 4;
      ADDR         at 0 range 5 .. 31;
   end record;

   subtype CH0_DBG_CTDREQ_CH0_DBG_CTDREQ_Field is HAL.UInt6;

   --  Read: get channel DREQ counter (i.e. how many accesses the DMA expects
   --  it can perform on the peripheral without overflow/underflow. Write any
   --  value: clears the counter, and cause channel to re-initiate DREQ
   --  handshake.
   type CH0_DBG_CTDREQ_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      CH0_DBG_CTDREQ : CH0_DBG_CTDREQ_CH0_DBG_CTDREQ_Field := 16#0#;
      --  unspecified
      Reserved_6_31  : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH0_DBG_CTDREQ_Register use record
      CH0_DBG_CTDREQ at 0 range 0 .. 5;
      Reserved_6_31  at 0 range 6 .. 31;
   end record;

   subtype CH1_DBG_CTDREQ_CH1_DBG_CTDREQ_Field is HAL.UInt6;

   --  Read: get channel DREQ counter (i.e. how many accesses the DMA expects
   --  it can perform on the peripheral without overflow/underflow. Write any
   --  value: clears the counter, and cause channel to re-initiate DREQ
   --  handshake.
   type CH1_DBG_CTDREQ_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      CH1_DBG_CTDREQ : CH1_DBG_CTDREQ_CH1_DBG_CTDREQ_Field := 16#0#;
      --  unspecified
      Reserved_6_31  : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH1_DBG_CTDREQ_Register use record
      CH1_DBG_CTDREQ at 0 range 0 .. 5;
      Reserved_6_31  at 0 range 6 .. 31;
   end record;

   subtype CH2_DBG_CTDREQ_CH2_DBG_CTDREQ_Field is HAL.UInt6;

   --  Read: get channel DREQ counter (i.e. how many accesses the DMA expects
   --  it can perform on the peripheral without overflow/underflow. Write any
   --  value: clears the counter, and cause channel to re-initiate DREQ
   --  handshake.
   type CH2_DBG_CTDREQ_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      CH2_DBG_CTDREQ : CH2_DBG_CTDREQ_CH2_DBG_CTDREQ_Field := 16#0#;
      --  unspecified
      Reserved_6_31  : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH2_DBG_CTDREQ_Register use record
      CH2_DBG_CTDREQ at 0 range 0 .. 5;
      Reserved_6_31  at 0 range 6 .. 31;
   end record;

   subtype CH3_DBG_CTDREQ_CH3_DBG_CTDREQ_Field is HAL.UInt6;

   --  Read: get channel DREQ counter (i.e. how many accesses the DMA expects
   --  it can perform on the peripheral without overflow/underflow. Write any
   --  value: clears the counter, and cause channel to re-initiate DREQ
   --  handshake.
   type CH3_DBG_CTDREQ_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      CH3_DBG_CTDREQ : CH3_DBG_CTDREQ_CH3_DBG_CTDREQ_Field := 16#0#;
      --  unspecified
      Reserved_6_31  : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH3_DBG_CTDREQ_Register use record
      CH3_DBG_CTDREQ at 0 range 0 .. 5;
      Reserved_6_31  at 0 range 6 .. 31;
   end record;

   subtype CH4_DBG_CTDREQ_CH4_DBG_CTDREQ_Field is HAL.UInt6;

   --  Read: get channel DREQ counter (i.e. how many accesses the DMA expects
   --  it can perform on the peripheral without overflow/underflow. Write any
   --  value: clears the counter, and cause channel to re-initiate DREQ
   --  handshake.
   type CH4_DBG_CTDREQ_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      CH4_DBG_CTDREQ : CH4_DBG_CTDREQ_CH4_DBG_CTDREQ_Field := 16#0#;
      --  unspecified
      Reserved_6_31  : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH4_DBG_CTDREQ_Register use record
      CH4_DBG_CTDREQ at 0 range 0 .. 5;
      Reserved_6_31  at 0 range 6 .. 31;
   end record;

   subtype CH5_DBG_CTDREQ_CH5_DBG_CTDREQ_Field is HAL.UInt6;

   --  Read: get channel DREQ counter (i.e. how many accesses the DMA expects
   --  it can perform on the peripheral without overflow/underflow. Write any
   --  value: clears the counter, and cause channel to re-initiate DREQ
   --  handshake.
   type CH5_DBG_CTDREQ_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      CH5_DBG_CTDREQ : CH5_DBG_CTDREQ_CH5_DBG_CTDREQ_Field := 16#0#;
      --  unspecified
      Reserved_6_31  : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH5_DBG_CTDREQ_Register use record
      CH5_DBG_CTDREQ at 0 range 0 .. 5;
      Reserved_6_31  at 0 range 6 .. 31;
   end record;

   subtype CH6_DBG_CTDREQ_CH6_DBG_CTDREQ_Field is HAL.UInt6;

   --  Read: get channel DREQ counter (i.e. how many accesses the DMA expects
   --  it can perform on the peripheral without overflow/underflow. Write any
   --  value: clears the counter, and cause channel to re-initiate DREQ
   --  handshake.
   type CH6_DBG_CTDREQ_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      CH6_DBG_CTDREQ : CH6_DBG_CTDREQ_CH6_DBG_CTDREQ_Field := 16#0#;
      --  unspecified
      Reserved_6_31  : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH6_DBG_CTDREQ_Register use record
      CH6_DBG_CTDREQ at 0 range 0 .. 5;
      Reserved_6_31  at 0 range 6 .. 31;
   end record;

   subtype CH7_DBG_CTDREQ_CH7_DBG_CTDREQ_Field is HAL.UInt6;

   --  Read: get channel DREQ counter (i.e. how many accesses the DMA expects
   --  it can perform on the peripheral without overflow/underflow. Write any
   --  value: clears the counter, and cause channel to re-initiate DREQ
   --  handshake.
   type CH7_DBG_CTDREQ_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      CH7_DBG_CTDREQ : CH7_DBG_CTDREQ_CH7_DBG_CTDREQ_Field := 16#0#;
      --  unspecified
      Reserved_6_31  : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH7_DBG_CTDREQ_Register use record
      CH7_DBG_CTDREQ at 0 range 0 .. 5;
      Reserved_6_31  at 0 range 6 .. 31;
   end record;

   subtype CH8_DBG_CTDREQ_CH8_DBG_CTDREQ_Field is HAL.UInt6;

   --  Read: get channel DREQ counter (i.e. how many accesses the DMA expects
   --  it can perform on the peripheral without overflow/underflow. Write any
   --  value: clears the counter, and cause channel to re-initiate DREQ
   --  handshake.
   type CH8_DBG_CTDREQ_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      CH8_DBG_CTDREQ : CH8_DBG_CTDREQ_CH8_DBG_CTDREQ_Field := 16#0#;
      --  unspecified
      Reserved_6_31  : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH8_DBG_CTDREQ_Register use record
      CH8_DBG_CTDREQ at 0 range 0 .. 5;
      Reserved_6_31  at 0 range 6 .. 31;
   end record;

   subtype CH9_DBG_CTDREQ_CH9_DBG_CTDREQ_Field is HAL.UInt6;

   --  Read: get channel DREQ counter (i.e. how many accesses the DMA expects
   --  it can perform on the peripheral without overflow/underflow. Write any
   --  value: clears the counter, and cause channel to re-initiate DREQ
   --  handshake.
   type CH9_DBG_CTDREQ_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      CH9_DBG_CTDREQ : CH9_DBG_CTDREQ_CH9_DBG_CTDREQ_Field := 16#0#;
      --  unspecified
      Reserved_6_31  : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH9_DBG_CTDREQ_Register use record
      CH9_DBG_CTDREQ at 0 range 0 .. 5;
      Reserved_6_31  at 0 range 6 .. 31;
   end record;

   subtype CH10_DBG_CTDREQ_CH10_DBG_CTDREQ_Field is HAL.UInt6;

   --  Read: get channel DREQ counter (i.e. how many accesses the DMA expects
   --  it can perform on the peripheral without overflow/underflow. Write any
   --  value: clears the counter, and cause channel to re-initiate DREQ
   --  handshake.
   type CH10_DBG_CTDREQ_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      CH10_DBG_CTDREQ : CH10_DBG_CTDREQ_CH10_DBG_CTDREQ_Field := 16#0#;
      --  unspecified
      Reserved_6_31   : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH10_DBG_CTDREQ_Register use record
      CH10_DBG_CTDREQ at 0 range 0 .. 5;
      Reserved_6_31   at 0 range 6 .. 31;
   end record;

   subtype CH11_DBG_CTDREQ_CH11_DBG_CTDREQ_Field is HAL.UInt6;

   --  Read: get channel DREQ counter (i.e. how many accesses the DMA expects
   --  it can perform on the peripheral without overflow/underflow. Write any
   --  value: clears the counter, and cause channel to re-initiate DREQ
   --  handshake.
   type CH11_DBG_CTDREQ_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      CH11_DBG_CTDREQ : CH11_DBG_CTDREQ_CH11_DBG_CTDREQ_Field := 16#0#;
      --  unspecified
      Reserved_6_31   : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH11_DBG_CTDREQ_Register use record
      CH11_DBG_CTDREQ at 0 range 0 .. 5;
      Reserved_6_31   at 0 range 6 .. 31;
   end record;

   subtype CH12_DBG_CTDREQ_CH12_DBG_CTDREQ_Field is HAL.UInt6;

   --  Read: get channel DREQ counter (i.e. how many accesses the DMA expects
   --  it can perform on the peripheral without overflow/underflow. Write any
   --  value: clears the counter, and cause channel to re-initiate DREQ
   --  handshake.
   type CH12_DBG_CTDREQ_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      CH12_DBG_CTDREQ : CH12_DBG_CTDREQ_CH12_DBG_CTDREQ_Field := 16#0#;
      --  unspecified
      Reserved_6_31   : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH12_DBG_CTDREQ_Register use record
      CH12_DBG_CTDREQ at 0 range 0 .. 5;
      Reserved_6_31   at 0 range 6 .. 31;
   end record;

   subtype CH13_DBG_CTDREQ_CH13_DBG_CTDREQ_Field is HAL.UInt6;

   --  Read: get channel DREQ counter (i.e. how many accesses the DMA expects
   --  it can perform on the peripheral without overflow/underflow. Write any
   --  value: clears the counter, and cause channel to re-initiate DREQ
   --  handshake.
   type CH13_DBG_CTDREQ_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      CH13_DBG_CTDREQ : CH13_DBG_CTDREQ_CH13_DBG_CTDREQ_Field := 16#0#;
      --  unspecified
      Reserved_6_31   : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH13_DBG_CTDREQ_Register use record
      CH13_DBG_CTDREQ at 0 range 0 .. 5;
      Reserved_6_31   at 0 range 6 .. 31;
   end record;

   subtype CH14_DBG_CTDREQ_CH14_DBG_CTDREQ_Field is HAL.UInt6;

   --  Read: get channel DREQ counter (i.e. how many accesses the DMA expects
   --  it can perform on the peripheral without overflow/underflow. Write any
   --  value: clears the counter, and cause channel to re-initiate DREQ
   --  handshake.
   type CH14_DBG_CTDREQ_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      CH14_DBG_CTDREQ : CH14_DBG_CTDREQ_CH14_DBG_CTDREQ_Field := 16#0#;
      --  unspecified
      Reserved_6_31   : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH14_DBG_CTDREQ_Register use record
      CH14_DBG_CTDREQ at 0 range 0 .. 5;
      Reserved_6_31   at 0 range 6 .. 31;
   end record;

   subtype CH15_DBG_CTDREQ_CH15_DBG_CTDREQ_Field is HAL.UInt6;

   --  Read: get channel DREQ counter (i.e. how many accesses the DMA expects
   --  it can perform on the peripheral without overflow/underflow. Write any
   --  value: clears the counter, and cause channel to re-initiate DREQ
   --  handshake.
   type CH15_DBG_CTDREQ_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      CH15_DBG_CTDREQ : CH15_DBG_CTDREQ_CH15_DBG_CTDREQ_Field := 16#0#;
      --  unspecified
      Reserved_6_31   : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CH15_DBG_CTDREQ_Register use record
      CH15_DBG_CTDREQ at 0 range 0 .. 5;
      Reserved_6_31   at 0 range 6 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  DMA with separate read and write masters
   type DMA_Peripheral is record
      --  DMA Channel 0 Read Address pointer
      CH0_READ_ADDR             : aliased HAL.UInt32;
      --  DMA Channel 0 Write Address pointer
      CH0_WRITE_ADDR            : aliased HAL.UInt32;
      --  DMA Channel 0 Transfer Count
      CH0_TRANS_COUNT           : aliased CH0_TRANS_COUNT_Register;
      --  DMA Channel 0 Control and Status
      CH0_CTRL_TRIG             : aliased CH0_CTRL_TRIG_Register;
      --  Alias for channel 0 CTRL register
      CH0_AL1_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 0 READ_ADDR register
      CH0_AL1_READ_ADDR         : aliased HAL.UInt32;
      --  Alias for channel 0 WRITE_ADDR register
      CH0_AL1_WRITE_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 0 TRANS_COUNT register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH0_AL1_TRANS_COUNT_TRIG  : aliased HAL.UInt32;
      --  Alias for channel 0 CTRL register
      CH0_AL2_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 0 TRANS_COUNT register
      CH0_AL2_TRANS_COUNT       : aliased HAL.UInt32;
      --  Alias for channel 0 READ_ADDR register
      CH0_AL2_READ_ADDR         : aliased HAL.UInt32;
      --  Alias for channel 0 WRITE_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH0_AL2_WRITE_ADDR_TRIG   : aliased HAL.UInt32;
      --  Alias for channel 0 CTRL register
      CH0_AL3_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 0 WRITE_ADDR register
      CH0_AL3_WRITE_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 0 TRANS_COUNT register
      CH0_AL3_TRANS_COUNT       : aliased HAL.UInt32;
      --  Alias for channel 0 READ_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH0_AL3_READ_ADDR_TRIG    : aliased HAL.UInt32;
      --  DMA Channel 1 Read Address pointer
      CH1_READ_ADDR             : aliased HAL.UInt32;
      --  DMA Channel 1 Write Address pointer
      CH1_WRITE_ADDR            : aliased HAL.UInt32;
      --  DMA Channel 1 Transfer Count
      CH1_TRANS_COUNT           : aliased CH1_TRANS_COUNT_Register;
      --  DMA Channel 1 Control and Status
      CH1_CTRL_TRIG             : aliased CH1_CTRL_TRIG_Register;
      --  Alias for channel 1 CTRL register
      CH1_AL1_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 1 READ_ADDR register
      CH1_AL1_READ_ADDR         : aliased HAL.UInt32;
      --  Alias for channel 1 WRITE_ADDR register
      CH1_AL1_WRITE_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 1 TRANS_COUNT register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH1_AL1_TRANS_COUNT_TRIG  : aliased HAL.UInt32;
      --  Alias for channel 1 CTRL register
      CH1_AL2_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 1 TRANS_COUNT register
      CH1_AL2_TRANS_COUNT       : aliased HAL.UInt32;
      --  Alias for channel 1 READ_ADDR register
      CH1_AL2_READ_ADDR         : aliased HAL.UInt32;
      --  Alias for channel 1 WRITE_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH1_AL2_WRITE_ADDR_TRIG   : aliased HAL.UInt32;
      --  Alias for channel 1 CTRL register
      CH1_AL3_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 1 WRITE_ADDR register
      CH1_AL3_WRITE_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 1 TRANS_COUNT register
      CH1_AL3_TRANS_COUNT       : aliased HAL.UInt32;
      --  Alias for channel 1 READ_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH1_AL3_READ_ADDR_TRIG    : aliased HAL.UInt32;
      --  DMA Channel 2 Read Address pointer
      CH2_READ_ADDR             : aliased HAL.UInt32;
      --  DMA Channel 2 Write Address pointer
      CH2_WRITE_ADDR            : aliased HAL.UInt32;
      --  DMA Channel 2 Transfer Count
      CH2_TRANS_COUNT           : aliased CH2_TRANS_COUNT_Register;
      --  DMA Channel 2 Control and Status
      CH2_CTRL_TRIG             : aliased CH2_CTRL_TRIG_Register;
      --  Alias for channel 2 CTRL register
      CH2_AL1_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 2 READ_ADDR register
      CH2_AL1_READ_ADDR         : aliased HAL.UInt32;
      --  Alias for channel 2 WRITE_ADDR register
      CH2_AL1_WRITE_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 2 TRANS_COUNT register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH2_AL1_TRANS_COUNT_TRIG  : aliased HAL.UInt32;
      --  Alias for channel 2 CTRL register
      CH2_AL2_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 2 TRANS_COUNT register
      CH2_AL2_TRANS_COUNT       : aliased HAL.UInt32;
      --  Alias for channel 2 READ_ADDR register
      CH2_AL2_READ_ADDR         : aliased HAL.UInt32;
      --  Alias for channel 2 WRITE_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH2_AL2_WRITE_ADDR_TRIG   : aliased HAL.UInt32;
      --  Alias for channel 2 CTRL register
      CH2_AL3_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 2 WRITE_ADDR register
      CH2_AL3_WRITE_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 2 TRANS_COUNT register
      CH2_AL3_TRANS_COUNT       : aliased HAL.UInt32;
      --  Alias for channel 2 READ_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH2_AL3_READ_ADDR_TRIG    : aliased HAL.UInt32;
      --  DMA Channel 3 Read Address pointer
      CH3_READ_ADDR             : aliased HAL.UInt32;
      --  DMA Channel 3 Write Address pointer
      CH3_WRITE_ADDR            : aliased HAL.UInt32;
      --  DMA Channel 3 Transfer Count
      CH3_TRANS_COUNT           : aliased CH3_TRANS_COUNT_Register;
      --  DMA Channel 3 Control and Status
      CH3_CTRL_TRIG             : aliased CH3_CTRL_TRIG_Register;
      --  Alias for channel 3 CTRL register
      CH3_AL1_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 3 READ_ADDR register
      CH3_AL1_READ_ADDR         : aliased HAL.UInt32;
      --  Alias for channel 3 WRITE_ADDR register
      CH3_AL1_WRITE_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 3 TRANS_COUNT register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH3_AL1_TRANS_COUNT_TRIG  : aliased HAL.UInt32;
      --  Alias for channel 3 CTRL register
      CH3_AL2_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 3 TRANS_COUNT register
      CH3_AL2_TRANS_COUNT       : aliased HAL.UInt32;
      --  Alias for channel 3 READ_ADDR register
      CH3_AL2_READ_ADDR         : aliased HAL.UInt32;
      --  Alias for channel 3 WRITE_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH3_AL2_WRITE_ADDR_TRIG   : aliased HAL.UInt32;
      --  Alias for channel 3 CTRL register
      CH3_AL3_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 3 WRITE_ADDR register
      CH3_AL3_WRITE_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 3 TRANS_COUNT register
      CH3_AL3_TRANS_COUNT       : aliased HAL.UInt32;
      --  Alias for channel 3 READ_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH3_AL3_READ_ADDR_TRIG    : aliased HAL.UInt32;
      --  DMA Channel 4 Read Address pointer
      CH4_READ_ADDR             : aliased HAL.UInt32;
      --  DMA Channel 4 Write Address pointer
      CH4_WRITE_ADDR            : aliased HAL.UInt32;
      --  DMA Channel 4 Transfer Count
      CH4_TRANS_COUNT           : aliased CH4_TRANS_COUNT_Register;
      --  DMA Channel 4 Control and Status
      CH4_CTRL_TRIG             : aliased CH4_CTRL_TRIG_Register;
      --  Alias for channel 4 CTRL register
      CH4_AL1_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 4 READ_ADDR register
      CH4_AL1_READ_ADDR         : aliased HAL.UInt32;
      --  Alias for channel 4 WRITE_ADDR register
      CH4_AL1_WRITE_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 4 TRANS_COUNT register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH4_AL1_TRANS_COUNT_TRIG  : aliased HAL.UInt32;
      --  Alias for channel 4 CTRL register
      CH4_AL2_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 4 TRANS_COUNT register
      CH4_AL2_TRANS_COUNT       : aliased HAL.UInt32;
      --  Alias for channel 4 READ_ADDR register
      CH4_AL2_READ_ADDR         : aliased HAL.UInt32;
      --  Alias for channel 4 WRITE_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH4_AL2_WRITE_ADDR_TRIG   : aliased HAL.UInt32;
      --  Alias for channel 4 CTRL register
      CH4_AL3_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 4 WRITE_ADDR register
      CH4_AL3_WRITE_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 4 TRANS_COUNT register
      CH4_AL3_TRANS_COUNT       : aliased HAL.UInt32;
      --  Alias for channel 4 READ_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH4_AL3_READ_ADDR_TRIG    : aliased HAL.UInt32;
      --  DMA Channel 5 Read Address pointer
      CH5_READ_ADDR             : aliased HAL.UInt32;
      --  DMA Channel 5 Write Address pointer
      CH5_WRITE_ADDR            : aliased HAL.UInt32;
      --  DMA Channel 5 Transfer Count
      CH5_TRANS_COUNT           : aliased CH5_TRANS_COUNT_Register;
      --  DMA Channel 5 Control and Status
      CH5_CTRL_TRIG             : aliased CH5_CTRL_TRIG_Register;
      --  Alias for channel 5 CTRL register
      CH5_AL1_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 5 READ_ADDR register
      CH5_AL1_READ_ADDR         : aliased HAL.UInt32;
      --  Alias for channel 5 WRITE_ADDR register
      CH5_AL1_WRITE_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 5 TRANS_COUNT register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH5_AL1_TRANS_COUNT_TRIG  : aliased HAL.UInt32;
      --  Alias for channel 5 CTRL register
      CH5_AL2_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 5 TRANS_COUNT register
      CH5_AL2_TRANS_COUNT       : aliased HAL.UInt32;
      --  Alias for channel 5 READ_ADDR register
      CH5_AL2_READ_ADDR         : aliased HAL.UInt32;
      --  Alias for channel 5 WRITE_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH5_AL2_WRITE_ADDR_TRIG   : aliased HAL.UInt32;
      --  Alias for channel 5 CTRL register
      CH5_AL3_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 5 WRITE_ADDR register
      CH5_AL3_WRITE_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 5 TRANS_COUNT register
      CH5_AL3_TRANS_COUNT       : aliased HAL.UInt32;
      --  Alias for channel 5 READ_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH5_AL3_READ_ADDR_TRIG    : aliased HAL.UInt32;
      --  DMA Channel 6 Read Address pointer
      CH6_READ_ADDR             : aliased HAL.UInt32;
      --  DMA Channel 6 Write Address pointer
      CH6_WRITE_ADDR            : aliased HAL.UInt32;
      --  DMA Channel 6 Transfer Count
      CH6_TRANS_COUNT           : aliased CH6_TRANS_COUNT_Register;
      --  DMA Channel 6 Control and Status
      CH6_CTRL_TRIG             : aliased CH6_CTRL_TRIG_Register;
      --  Alias for channel 6 CTRL register
      CH6_AL1_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 6 READ_ADDR register
      CH6_AL1_READ_ADDR         : aliased HAL.UInt32;
      --  Alias for channel 6 WRITE_ADDR register
      CH6_AL1_WRITE_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 6 TRANS_COUNT register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH6_AL1_TRANS_COUNT_TRIG  : aliased HAL.UInt32;
      --  Alias for channel 6 CTRL register
      CH6_AL2_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 6 TRANS_COUNT register
      CH6_AL2_TRANS_COUNT       : aliased HAL.UInt32;
      --  Alias for channel 6 READ_ADDR register
      CH6_AL2_READ_ADDR         : aliased HAL.UInt32;
      --  Alias for channel 6 WRITE_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH6_AL2_WRITE_ADDR_TRIG   : aliased HAL.UInt32;
      --  Alias for channel 6 CTRL register
      CH6_AL3_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 6 WRITE_ADDR register
      CH6_AL3_WRITE_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 6 TRANS_COUNT register
      CH6_AL3_TRANS_COUNT       : aliased HAL.UInt32;
      --  Alias for channel 6 READ_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH6_AL3_READ_ADDR_TRIG    : aliased HAL.UInt32;
      --  DMA Channel 7 Read Address pointer
      CH7_READ_ADDR             : aliased HAL.UInt32;
      --  DMA Channel 7 Write Address pointer
      CH7_WRITE_ADDR            : aliased HAL.UInt32;
      --  DMA Channel 7 Transfer Count
      CH7_TRANS_COUNT           : aliased CH7_TRANS_COUNT_Register;
      --  DMA Channel 7 Control and Status
      CH7_CTRL_TRIG             : aliased CH7_CTRL_TRIG_Register;
      --  Alias for channel 7 CTRL register
      CH7_AL1_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 7 READ_ADDR register
      CH7_AL1_READ_ADDR         : aliased HAL.UInt32;
      --  Alias for channel 7 WRITE_ADDR register
      CH7_AL1_WRITE_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 7 TRANS_COUNT register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH7_AL1_TRANS_COUNT_TRIG  : aliased HAL.UInt32;
      --  Alias for channel 7 CTRL register
      CH7_AL2_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 7 TRANS_COUNT register
      CH7_AL2_TRANS_COUNT       : aliased HAL.UInt32;
      --  Alias for channel 7 READ_ADDR register
      CH7_AL2_READ_ADDR         : aliased HAL.UInt32;
      --  Alias for channel 7 WRITE_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH7_AL2_WRITE_ADDR_TRIG   : aliased HAL.UInt32;
      --  Alias for channel 7 CTRL register
      CH7_AL3_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 7 WRITE_ADDR register
      CH7_AL3_WRITE_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 7 TRANS_COUNT register
      CH7_AL3_TRANS_COUNT       : aliased HAL.UInt32;
      --  Alias for channel 7 READ_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH7_AL3_READ_ADDR_TRIG    : aliased HAL.UInt32;
      --  DMA Channel 8 Read Address pointer
      CH8_READ_ADDR             : aliased HAL.UInt32;
      --  DMA Channel 8 Write Address pointer
      CH8_WRITE_ADDR            : aliased HAL.UInt32;
      --  DMA Channel 8 Transfer Count
      CH8_TRANS_COUNT           : aliased CH8_TRANS_COUNT_Register;
      --  DMA Channel 8 Control and Status
      CH8_CTRL_TRIG             : aliased CH8_CTRL_TRIG_Register;
      --  Alias for channel 8 CTRL register
      CH8_AL1_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 8 READ_ADDR register
      CH8_AL1_READ_ADDR         : aliased HAL.UInt32;
      --  Alias for channel 8 WRITE_ADDR register
      CH8_AL1_WRITE_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 8 TRANS_COUNT register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH8_AL1_TRANS_COUNT_TRIG  : aliased HAL.UInt32;
      --  Alias for channel 8 CTRL register
      CH8_AL2_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 8 TRANS_COUNT register
      CH8_AL2_TRANS_COUNT       : aliased HAL.UInt32;
      --  Alias for channel 8 READ_ADDR register
      CH8_AL2_READ_ADDR         : aliased HAL.UInt32;
      --  Alias for channel 8 WRITE_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH8_AL2_WRITE_ADDR_TRIG   : aliased HAL.UInt32;
      --  Alias for channel 8 CTRL register
      CH8_AL3_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 8 WRITE_ADDR register
      CH8_AL3_WRITE_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 8 TRANS_COUNT register
      CH8_AL3_TRANS_COUNT       : aliased HAL.UInt32;
      --  Alias for channel 8 READ_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH8_AL3_READ_ADDR_TRIG    : aliased HAL.UInt32;
      --  DMA Channel 9 Read Address pointer
      CH9_READ_ADDR             : aliased HAL.UInt32;
      --  DMA Channel 9 Write Address pointer
      CH9_WRITE_ADDR            : aliased HAL.UInt32;
      --  DMA Channel 9 Transfer Count
      CH9_TRANS_COUNT           : aliased CH9_TRANS_COUNT_Register;
      --  DMA Channel 9 Control and Status
      CH9_CTRL_TRIG             : aliased CH9_CTRL_TRIG_Register;
      --  Alias for channel 9 CTRL register
      CH9_AL1_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 9 READ_ADDR register
      CH9_AL1_READ_ADDR         : aliased HAL.UInt32;
      --  Alias for channel 9 WRITE_ADDR register
      CH9_AL1_WRITE_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 9 TRANS_COUNT register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH9_AL1_TRANS_COUNT_TRIG  : aliased HAL.UInt32;
      --  Alias for channel 9 CTRL register
      CH9_AL2_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 9 TRANS_COUNT register
      CH9_AL2_TRANS_COUNT       : aliased HAL.UInt32;
      --  Alias for channel 9 READ_ADDR register
      CH9_AL2_READ_ADDR         : aliased HAL.UInt32;
      --  Alias for channel 9 WRITE_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH9_AL2_WRITE_ADDR_TRIG   : aliased HAL.UInt32;
      --  Alias for channel 9 CTRL register
      CH9_AL3_CTRL              : aliased HAL.UInt32;
      --  Alias for channel 9 WRITE_ADDR register
      CH9_AL3_WRITE_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 9 TRANS_COUNT register
      CH9_AL3_TRANS_COUNT       : aliased HAL.UInt32;
      --  Alias for channel 9 READ_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH9_AL3_READ_ADDR_TRIG    : aliased HAL.UInt32;
      --  DMA Channel 10 Read Address pointer
      CH10_READ_ADDR            : aliased HAL.UInt32;
      --  DMA Channel 10 Write Address pointer
      CH10_WRITE_ADDR           : aliased HAL.UInt32;
      --  DMA Channel 10 Transfer Count
      CH10_TRANS_COUNT          : aliased CH10_TRANS_COUNT_Register;
      --  DMA Channel 10 Control and Status
      CH10_CTRL_TRIG            : aliased CH10_CTRL_TRIG_Register;
      --  Alias for channel 10 CTRL register
      CH10_AL1_CTRL             : aliased HAL.UInt32;
      --  Alias for channel 10 READ_ADDR register
      CH10_AL1_READ_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 10 WRITE_ADDR register
      CH10_AL1_WRITE_ADDR       : aliased HAL.UInt32;
      --  Alias for channel 10 TRANS_COUNT register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH10_AL1_TRANS_COUNT_TRIG : aliased HAL.UInt32;
      --  Alias for channel 10 CTRL register
      CH10_AL2_CTRL             : aliased HAL.UInt32;
      --  Alias for channel 10 TRANS_COUNT register
      CH10_AL2_TRANS_COUNT      : aliased HAL.UInt32;
      --  Alias for channel 10 READ_ADDR register
      CH10_AL2_READ_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 10 WRITE_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH10_AL2_WRITE_ADDR_TRIG  : aliased HAL.UInt32;
      --  Alias for channel 10 CTRL register
      CH10_AL3_CTRL             : aliased HAL.UInt32;
      --  Alias for channel 10 WRITE_ADDR register
      CH10_AL3_WRITE_ADDR       : aliased HAL.UInt32;
      --  Alias for channel 10 TRANS_COUNT register
      CH10_AL3_TRANS_COUNT      : aliased HAL.UInt32;
      --  Alias for channel 10 READ_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH10_AL3_READ_ADDR_TRIG   : aliased HAL.UInt32;
      --  DMA Channel 11 Read Address pointer
      CH11_READ_ADDR            : aliased HAL.UInt32;
      --  DMA Channel 11 Write Address pointer
      CH11_WRITE_ADDR           : aliased HAL.UInt32;
      --  DMA Channel 11 Transfer Count
      CH11_TRANS_COUNT          : aliased CH11_TRANS_COUNT_Register;
      --  DMA Channel 11 Control and Status
      CH11_CTRL_TRIG            : aliased CH11_CTRL_TRIG_Register;
      --  Alias for channel 11 CTRL register
      CH11_AL1_CTRL             : aliased HAL.UInt32;
      --  Alias for channel 11 READ_ADDR register
      CH11_AL1_READ_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 11 WRITE_ADDR register
      CH11_AL1_WRITE_ADDR       : aliased HAL.UInt32;
      --  Alias for channel 11 TRANS_COUNT register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH11_AL1_TRANS_COUNT_TRIG : aliased HAL.UInt32;
      --  Alias for channel 11 CTRL register
      CH11_AL2_CTRL             : aliased HAL.UInt32;
      --  Alias for channel 11 TRANS_COUNT register
      CH11_AL2_TRANS_COUNT      : aliased HAL.UInt32;
      --  Alias for channel 11 READ_ADDR register
      CH11_AL2_READ_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 11 WRITE_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH11_AL2_WRITE_ADDR_TRIG  : aliased HAL.UInt32;
      --  Alias for channel 11 CTRL register
      CH11_AL3_CTRL             : aliased HAL.UInt32;
      --  Alias for channel 11 WRITE_ADDR register
      CH11_AL3_WRITE_ADDR       : aliased HAL.UInt32;
      --  Alias for channel 11 TRANS_COUNT register
      CH11_AL3_TRANS_COUNT      : aliased HAL.UInt32;
      --  Alias for channel 11 READ_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH11_AL3_READ_ADDR_TRIG   : aliased HAL.UInt32;
      --  DMA Channel 12 Read Address pointer
      CH12_READ_ADDR            : aliased HAL.UInt32;
      --  DMA Channel 12 Write Address pointer
      CH12_WRITE_ADDR           : aliased HAL.UInt32;
      --  DMA Channel 12 Transfer Count
      CH12_TRANS_COUNT          : aliased CH12_TRANS_COUNT_Register;
      --  DMA Channel 12 Control and Status
      CH12_CTRL_TRIG            : aliased CH12_CTRL_TRIG_Register;
      --  Alias for channel 12 CTRL register
      CH12_AL1_CTRL             : aliased HAL.UInt32;
      --  Alias for channel 12 READ_ADDR register
      CH12_AL1_READ_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 12 WRITE_ADDR register
      CH12_AL1_WRITE_ADDR       : aliased HAL.UInt32;
      --  Alias for channel 12 TRANS_COUNT register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH12_AL1_TRANS_COUNT_TRIG : aliased HAL.UInt32;
      --  Alias for channel 12 CTRL register
      CH12_AL2_CTRL             : aliased HAL.UInt32;
      --  Alias for channel 12 TRANS_COUNT register
      CH12_AL2_TRANS_COUNT      : aliased HAL.UInt32;
      --  Alias for channel 12 READ_ADDR register
      CH12_AL2_READ_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 12 WRITE_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH12_AL2_WRITE_ADDR_TRIG  : aliased HAL.UInt32;
      --  Alias for channel 12 CTRL register
      CH12_AL3_CTRL             : aliased HAL.UInt32;
      --  Alias for channel 12 WRITE_ADDR register
      CH12_AL3_WRITE_ADDR       : aliased HAL.UInt32;
      --  Alias for channel 12 TRANS_COUNT register
      CH12_AL3_TRANS_COUNT      : aliased HAL.UInt32;
      --  Alias for channel 12 READ_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH12_AL3_READ_ADDR_TRIG   : aliased HAL.UInt32;
      --  DMA Channel 13 Read Address pointer
      CH13_READ_ADDR            : aliased HAL.UInt32;
      --  DMA Channel 13 Write Address pointer
      CH13_WRITE_ADDR           : aliased HAL.UInt32;
      --  DMA Channel 13 Transfer Count
      CH13_TRANS_COUNT          : aliased CH13_TRANS_COUNT_Register;
      --  DMA Channel 13 Control and Status
      CH13_CTRL_TRIG            : aliased CH13_CTRL_TRIG_Register;
      --  Alias for channel 13 CTRL register
      CH13_AL1_CTRL             : aliased HAL.UInt32;
      --  Alias for channel 13 READ_ADDR register
      CH13_AL1_READ_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 13 WRITE_ADDR register
      CH13_AL1_WRITE_ADDR       : aliased HAL.UInt32;
      --  Alias for channel 13 TRANS_COUNT register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH13_AL1_TRANS_COUNT_TRIG : aliased HAL.UInt32;
      --  Alias for channel 13 CTRL register
      CH13_AL2_CTRL             : aliased HAL.UInt32;
      --  Alias for channel 13 TRANS_COUNT register
      CH13_AL2_TRANS_COUNT      : aliased HAL.UInt32;
      --  Alias for channel 13 READ_ADDR register
      CH13_AL2_READ_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 13 WRITE_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH13_AL2_WRITE_ADDR_TRIG  : aliased HAL.UInt32;
      --  Alias for channel 13 CTRL register
      CH13_AL3_CTRL             : aliased HAL.UInt32;
      --  Alias for channel 13 WRITE_ADDR register
      CH13_AL3_WRITE_ADDR       : aliased HAL.UInt32;
      --  Alias for channel 13 TRANS_COUNT register
      CH13_AL3_TRANS_COUNT      : aliased HAL.UInt32;
      --  Alias for channel 13 READ_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH13_AL3_READ_ADDR_TRIG   : aliased HAL.UInt32;
      --  DMA Channel 14 Read Address pointer
      CH14_READ_ADDR            : aliased HAL.UInt32;
      --  DMA Channel 14 Write Address pointer
      CH14_WRITE_ADDR           : aliased HAL.UInt32;
      --  DMA Channel 14 Transfer Count
      CH14_TRANS_COUNT          : aliased CH14_TRANS_COUNT_Register;
      --  DMA Channel 14 Control and Status
      CH14_CTRL_TRIG            : aliased CH14_CTRL_TRIG_Register;
      --  Alias for channel 14 CTRL register
      CH14_AL1_CTRL             : aliased HAL.UInt32;
      --  Alias for channel 14 READ_ADDR register
      CH14_AL1_READ_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 14 WRITE_ADDR register
      CH14_AL1_WRITE_ADDR       : aliased HAL.UInt32;
      --  Alias for channel 14 TRANS_COUNT register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH14_AL1_TRANS_COUNT_TRIG : aliased HAL.UInt32;
      --  Alias for channel 14 CTRL register
      CH14_AL2_CTRL             : aliased HAL.UInt32;
      --  Alias for channel 14 TRANS_COUNT register
      CH14_AL2_TRANS_COUNT      : aliased HAL.UInt32;
      --  Alias for channel 14 READ_ADDR register
      CH14_AL2_READ_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 14 WRITE_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH14_AL2_WRITE_ADDR_TRIG  : aliased HAL.UInt32;
      --  Alias for channel 14 CTRL register
      CH14_AL3_CTRL             : aliased HAL.UInt32;
      --  Alias for channel 14 WRITE_ADDR register
      CH14_AL3_WRITE_ADDR       : aliased HAL.UInt32;
      --  Alias for channel 14 TRANS_COUNT register
      CH14_AL3_TRANS_COUNT      : aliased HAL.UInt32;
      --  Alias for channel 14 READ_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH14_AL3_READ_ADDR_TRIG   : aliased HAL.UInt32;
      --  DMA Channel 15 Read Address pointer
      CH15_READ_ADDR            : aliased HAL.UInt32;
      --  DMA Channel 15 Write Address pointer
      CH15_WRITE_ADDR           : aliased HAL.UInt32;
      --  DMA Channel 15 Transfer Count
      CH15_TRANS_COUNT          : aliased CH15_TRANS_COUNT_Register;
      --  DMA Channel 15 Control and Status
      CH15_CTRL_TRIG            : aliased CH15_CTRL_TRIG_Register;
      --  Alias for channel 15 CTRL register
      CH15_AL1_CTRL             : aliased HAL.UInt32;
      --  Alias for channel 15 READ_ADDR register
      CH15_AL1_READ_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 15 WRITE_ADDR register
      CH15_AL1_WRITE_ADDR       : aliased HAL.UInt32;
      --  Alias for channel 15 TRANS_COUNT register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH15_AL1_TRANS_COUNT_TRIG : aliased HAL.UInt32;
      --  Alias for channel 15 CTRL register
      CH15_AL2_CTRL             : aliased HAL.UInt32;
      --  Alias for channel 15 TRANS_COUNT register
      CH15_AL2_TRANS_COUNT      : aliased HAL.UInt32;
      --  Alias for channel 15 READ_ADDR register
      CH15_AL2_READ_ADDR        : aliased HAL.UInt32;
      --  Alias for channel 15 WRITE_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH15_AL2_WRITE_ADDR_TRIG  : aliased HAL.UInt32;
      --  Alias for channel 15 CTRL register
      CH15_AL3_CTRL             : aliased HAL.UInt32;
      --  Alias for channel 15 WRITE_ADDR register
      CH15_AL3_WRITE_ADDR       : aliased HAL.UInt32;
      --  Alias for channel 15 TRANS_COUNT register
      CH15_AL3_TRANS_COUNT      : aliased HAL.UInt32;
      --  Alias for channel 15 READ_ADDR register This is a trigger register
      --  (0xc). Writing a nonzero value will reload the channel counter and
      --  start the channel.
      CH15_AL3_READ_ADDR_TRIG   : aliased HAL.UInt32;
      --  Interrupt Status (raw)
      INTR                      : aliased INTR_Register;
      --  Interrupt Enables for IRQ 0
      INTE0                     : aliased INTE0_Register;
      --  Force Interrupts
      INTF0                     : aliased INTF0_Register;
      --  Interrupt Status for IRQ 0
      INTS0                     : aliased INTS0_Register;
      --  Interrupt Status (raw)
      INTR1                     : aliased INTR1_Register;
      --  Interrupt Enables for IRQ 1
      INTE1                     : aliased INTE1_Register;
      --  Force Interrupts
      INTF1                     : aliased INTF1_Register;
      --  Interrupt Status for IRQ 1
      INTS1                     : aliased INTS1_Register;
      --  Interrupt Status (raw)
      INTR2                     : aliased INTR2_Register;
      --  Interrupt Enables for IRQ 2
      INTE2                     : aliased INTE2_Register;
      --  Force Interrupts
      INTF2                     : aliased INTF2_Register;
      --  Interrupt Status for IRQ 2
      INTS2                     : aliased INTS2_Register;
      --  Interrupt Status (raw)
      INTR3                     : aliased INTR3_Register;
      --  Interrupt Enables for IRQ 3
      INTE3                     : aliased INTE3_Register;
      --  Force Interrupts
      INTF3                     : aliased INTF3_Register;
      --  Interrupt Status for IRQ 3
      INTS3                     : aliased INTS3_Register;
      --  Pacing (X/Y) fractional timer The pacing timer produces TREQ
      --  assertions at a rate set by ((X/Y) * sys_clk). This equation is
      --  evaluated every sys_clk cycles and therefore can only generate TREQs
      --  at a rate of 1 per sys_clk (i.e. permanent TREQ) or less.
      TIMER0                    : aliased TIMER_Register;
      --  Pacing (X/Y) fractional timer The pacing timer produces TREQ
      --  assertions at a rate set by ((X/Y) * sys_clk). This equation is
      --  evaluated every sys_clk cycles and therefore can only generate TREQs
      --  at a rate of 1 per sys_clk (i.e. permanent TREQ) or less.
      TIMER1                    : aliased TIMER_Register;
      --  Pacing (X/Y) fractional timer The pacing timer produces TREQ
      --  assertions at a rate set by ((X/Y) * sys_clk). This equation is
      --  evaluated every sys_clk cycles and therefore can only generate TREQs
      --  at a rate of 1 per sys_clk (i.e. permanent TREQ) or less.
      TIMER2                    : aliased TIMER_Register;
      --  Pacing (X/Y) fractional timer The pacing timer produces TREQ
      --  assertions at a rate set by ((X/Y) * sys_clk). This equation is
      --  evaluated every sys_clk cycles and therefore can only generate TREQs
      --  at a rate of 1 per sys_clk (i.e. permanent TREQ) or less.
      TIMER3                    : aliased TIMER_Register;
      --  Trigger one or more channels simultaneously
      MULTI_CHAN_TRIGGER        : aliased MULTI_CHAN_TRIGGER_Register;
      --  Sniffer Control
      SNIFF_CTRL                : aliased SNIFF_CTRL_Register;
      --  Data accumulator for sniff hardware
      SNIFF_DATA                : aliased HAL.UInt32;
      --  Debug RAF, WAF, TDF levels
      FIFO_LEVELS               : aliased FIFO_LEVELS_Register;
      --  Abort an in-progress transfer sequence on one or more channels
      CHAN_ABORT                : aliased CHAN_ABORT_Register;
      --  The number of channels this DMA instance is equipped with. This DMA
      --  supports up to 16 hardware channels, but can be configured with as
      --  few as one, to minimise silicon area.
      N_CHANNELS                : aliased N_CHANNELS_Register;
      --  Security configuration for channel 0. Control whether this channel
      --  performs Secure/Non-secure and Privileged/Unprivileged bus accesses.
      --  If this channel generates bus accesses of some security level, an
      --  access of at least that level (in the order S+P > S+U > NS+P > NS+U)
      --  is required to program, trigger, abort, check the status of,
      --  interrupt on or acknowledge the interrupt of this channel. This
      --  register automatically locks down (becomes read-only) once software
      --  starts to configure the channel. This register is world-readable, but
      --  is writable only from a Secure, Privileged context.
      SECCFG_CH0                : aliased SECCFG_CH_Register;
      --  Security configuration for channel 1. Control whether this channel
      --  performs Secure/Non-secure and Privileged/Unprivileged bus accesses.
      --  If this channel generates bus accesses of some security level, an
      --  access of at least that level (in the order S+P > S+U > NS+P > NS+U)
      --  is required to program, trigger, abort, check the status of,
      --  interrupt on or acknowledge the interrupt of this channel. This
      --  register automatically locks down (becomes read-only) once software
      --  starts to configure the channel. This register is world-readable, but
      --  is writable only from a Secure, Privileged context.
      SECCFG_CH1                : aliased SECCFG_CH_Register;
      --  Security configuration for channel 2. Control whether this channel
      --  performs Secure/Non-secure and Privileged/Unprivileged bus accesses.
      --  If this channel generates bus accesses of some security level, an
      --  access of at least that level (in the order S+P > S+U > NS+P > NS+U)
      --  is required to program, trigger, abort, check the status of,
      --  interrupt on or acknowledge the interrupt of this channel. This
      --  register automatically locks down (becomes read-only) once software
      --  starts to configure the channel. This register is world-readable, but
      --  is writable only from a Secure, Privileged context.
      SECCFG_CH2                : aliased SECCFG_CH_Register;
      --  Security configuration for channel 3. Control whether this channel
      --  performs Secure/Non-secure and Privileged/Unprivileged bus accesses.
      --  If this channel generates bus accesses of some security level, an
      --  access of at least that level (in the order S+P > S+U > NS+P > NS+U)
      --  is required to program, trigger, abort, check the status of,
      --  interrupt on or acknowledge the interrupt of this channel. This
      --  register automatically locks down (becomes read-only) once software
      --  starts to configure the channel. This register is world-readable, but
      --  is writable only from a Secure, Privileged context.
      SECCFG_CH3                : aliased SECCFG_CH_Register;
      --  Security configuration for channel 4. Control whether this channel
      --  performs Secure/Non-secure and Privileged/Unprivileged bus accesses.
      --  If this channel generates bus accesses of some security level, an
      --  access of at least that level (in the order S+P > S+U > NS+P > NS+U)
      --  is required to program, trigger, abort, check the status of,
      --  interrupt on or acknowledge the interrupt of this channel. This
      --  register automatically locks down (becomes read-only) once software
      --  starts to configure the channel. This register is world-readable, but
      --  is writable only from a Secure, Privileged context.
      SECCFG_CH4                : aliased SECCFG_CH_Register;
      --  Security configuration for channel 5. Control whether this channel
      --  performs Secure/Non-secure and Privileged/Unprivileged bus accesses.
      --  If this channel generates bus accesses of some security level, an
      --  access of at least that level (in the order S+P > S+U > NS+P > NS+U)
      --  is required to program, trigger, abort, check the status of,
      --  interrupt on or acknowledge the interrupt of this channel. This
      --  register automatically locks down (becomes read-only) once software
      --  starts to configure the channel. This register is world-readable, but
      --  is writable only from a Secure, Privileged context.
      SECCFG_CH5                : aliased SECCFG_CH_Register;
      --  Security configuration for channel 6. Control whether this channel
      --  performs Secure/Non-secure and Privileged/Unprivileged bus accesses.
      --  If this channel generates bus accesses of some security level, an
      --  access of at least that level (in the order S+P > S+U > NS+P > NS+U)
      --  is required to program, trigger, abort, check the status of,
      --  interrupt on or acknowledge the interrupt of this channel. This
      --  register automatically locks down (becomes read-only) once software
      --  starts to configure the channel. This register is world-readable, but
      --  is writable only from a Secure, Privileged context.
      SECCFG_CH6                : aliased SECCFG_CH_Register;
      --  Security configuration for channel 7. Control whether this channel
      --  performs Secure/Non-secure and Privileged/Unprivileged bus accesses.
      --  If this channel generates bus accesses of some security level, an
      --  access of at least that level (in the order S+P > S+U > NS+P > NS+U)
      --  is required to program, trigger, abort, check the status of,
      --  interrupt on or acknowledge the interrupt of this channel. This
      --  register automatically locks down (becomes read-only) once software
      --  starts to configure the channel. This register is world-readable, but
      --  is writable only from a Secure, Privileged context.
      SECCFG_CH7                : aliased SECCFG_CH_Register;
      --  Security configuration for channel 8. Control whether this channel
      --  performs Secure/Non-secure and Privileged/Unprivileged bus accesses.
      --  If this channel generates bus accesses of some security level, an
      --  access of at least that level (in the order S+P > S+U > NS+P > NS+U)
      --  is required to program, trigger, abort, check the status of,
      --  interrupt on or acknowledge the interrupt of this channel. This
      --  register automatically locks down (becomes read-only) once software
      --  starts to configure the channel. This register is world-readable, but
      --  is writable only from a Secure, Privileged context.
      SECCFG_CH8                : aliased SECCFG_CH_Register;
      --  Security configuration for channel 9. Control whether this channel
      --  performs Secure/Non-secure and Privileged/Unprivileged bus accesses.
      --  If this channel generates bus accesses of some security level, an
      --  access of at least that level (in the order S+P > S+U > NS+P > NS+U)
      --  is required to program, trigger, abort, check the status of,
      --  interrupt on or acknowledge the interrupt of this channel. This
      --  register automatically locks down (becomes read-only) once software
      --  starts to configure the channel. This register is world-readable, but
      --  is writable only from a Secure, Privileged context.
      SECCFG_CH9                : aliased SECCFG_CH_Register;
      --  Security configuration for channel 10. Control whether this channel
      --  performs Secure/Non-secure and Privileged/Unprivileged bus accesses.
      --  If this channel generates bus accesses of some security level, an
      --  access of at least that level (in the order S+P > S+U > NS+P > NS+U)
      --  is required to program, trigger, abort, check the status of,
      --  interrupt on or acknowledge the interrupt of this channel. This
      --  register automatically locks down (becomes read-only) once software
      --  starts to configure the channel. This register is world-readable, but
      --  is writable only from a Secure, Privileged context.
      SECCFG_CH10               : aliased SECCFG_CH_Register;
      --  Security configuration for channel 11. Control whether this channel
      --  performs Secure/Non-secure and Privileged/Unprivileged bus accesses.
      --  If this channel generates bus accesses of some security level, an
      --  access of at least that level (in the order S+P > S+U > NS+P > NS+U)
      --  is required to program, trigger, abort, check the status of,
      --  interrupt on or acknowledge the interrupt of this channel. This
      --  register automatically locks down (becomes read-only) once software
      --  starts to configure the channel. This register is world-readable, but
      --  is writable only from a Secure, Privileged context.
      SECCFG_CH11               : aliased SECCFG_CH_Register;
      --  Security configuration for channel 12. Control whether this channel
      --  performs Secure/Non-secure and Privileged/Unprivileged bus accesses.
      --  If this channel generates bus accesses of some security level, an
      --  access of at least that level (in the order S+P > S+U > NS+P > NS+U)
      --  is required to program, trigger, abort, check the status of,
      --  interrupt on or acknowledge the interrupt of this channel. This
      --  register automatically locks down (becomes read-only) once software
      --  starts to configure the channel. This register is world-readable, but
      --  is writable only from a Secure, Privileged context.
      SECCFG_CH12               : aliased SECCFG_CH_Register;
      --  Security configuration for channel 13. Control whether this channel
      --  performs Secure/Non-secure and Privileged/Unprivileged bus accesses.
      --  If this channel generates bus accesses of some security level, an
      --  access of at least that level (in the order S+P > S+U > NS+P > NS+U)
      --  is required to program, trigger, abort, check the status of,
      --  interrupt on or acknowledge the interrupt of this channel. This
      --  register automatically locks down (becomes read-only) once software
      --  starts to configure the channel. This register is world-readable, but
      --  is writable only from a Secure, Privileged context.
      SECCFG_CH13               : aliased SECCFG_CH_Register;
      --  Security configuration for channel 14. Control whether this channel
      --  performs Secure/Non-secure and Privileged/Unprivileged bus accesses.
      --  If this channel generates bus accesses of some security level, an
      --  access of at least that level (in the order S+P > S+U > NS+P > NS+U)
      --  is required to program, trigger, abort, check the status of,
      --  interrupt on or acknowledge the interrupt of this channel. This
      --  register automatically locks down (becomes read-only) once software
      --  starts to configure the channel. This register is world-readable, but
      --  is writable only from a Secure, Privileged context.
      SECCFG_CH14               : aliased SECCFG_CH_Register;
      --  Security configuration for channel 15. Control whether this channel
      --  performs Secure/Non-secure and Privileged/Unprivileged bus accesses.
      --  If this channel generates bus accesses of some security level, an
      --  access of at least that level (in the order S+P > S+U > NS+P > NS+U)
      --  is required to program, trigger, abort, check the status of,
      --  interrupt on or acknowledge the interrupt of this channel. This
      --  register automatically locks down (becomes read-only) once software
      --  starts to configure the channel. This register is world-readable, but
      --  is writable only from a Secure, Privileged context.
      SECCFG_CH15               : aliased SECCFG_CH_Register;
      --  Security configuration for IRQ 0. Control whether the IRQ permits
      --  configuration by Non-secure/Unprivileged contexts, and whether it can
      --  observe Secure/Privileged channel interrupt flags.
      SECCFG_IRQ0               : aliased SECCFG_IRQ_Register;
      --  Security configuration for IRQ 1. Control whether the IRQ permits
      --  configuration by Non-secure/Unprivileged contexts, and whether it can
      --  observe Secure/Privileged channel interrupt flags.
      SECCFG_IRQ1               : aliased SECCFG_IRQ_Register;
      --  Security configuration for IRQ 2. Control whether the IRQ permits
      --  configuration by Non-secure/Unprivileged contexts, and whether it can
      --  observe Secure/Privileged channel interrupt flags.
      SECCFG_IRQ2               : aliased SECCFG_IRQ_Register;
      --  Security configuration for IRQ 3. Control whether the IRQ permits
      --  configuration by Non-secure/Unprivileged contexts, and whether it can
      --  observe Secure/Privileged channel interrupt flags.
      SECCFG_IRQ3               : aliased SECCFG_IRQ_Register;
      --  Miscellaneous security configuration
      SECCFG_MISC               : aliased SECCFG_MISC_Register;
      --  Control register for DMA MPU. Accessible only from a Privileged
      --  context.
      MPU_CTRL                  : aliased MPU_CTRL_Register;
      --  Base address register for MPU region 0. Writable only from a Secure,
      --  Privileged context.
      MPU_BAR0                  : aliased MPU_BAR_Register;
      --  Limit address register for MPU region 0. Writable only from a Secure,
      --  Privileged context, with the exception of the P bit.
      MPU_LAR0                  : aliased MPU_LAR_Register;
      --  Base address register for MPU region 1. Writable only from a Secure,
      --  Privileged context.
      MPU_BAR1                  : aliased MPU_BAR_Register;
      --  Limit address register for MPU region 1. Writable only from a Secure,
      --  Privileged context, with the exception of the P bit.
      MPU_LAR1                  : aliased MPU_LAR_Register;
      --  Base address register for MPU region 2. Writable only from a Secure,
      --  Privileged context.
      MPU_BAR2                  : aliased MPU_BAR_Register;
      --  Limit address register for MPU region 2. Writable only from a Secure,
      --  Privileged context, with the exception of the P bit.
      MPU_LAR2                  : aliased MPU_LAR_Register;
      --  Base address register for MPU region 3. Writable only from a Secure,
      --  Privileged context.
      MPU_BAR3                  : aliased MPU_BAR_Register;
      --  Limit address register for MPU region 3. Writable only from a Secure,
      --  Privileged context, with the exception of the P bit.
      MPU_LAR3                  : aliased MPU_LAR_Register;
      --  Base address register for MPU region 4. Writable only from a Secure,
      --  Privileged context.
      MPU_BAR4                  : aliased MPU_BAR_Register;
      --  Limit address register for MPU region 4. Writable only from a Secure,
      --  Privileged context, with the exception of the P bit.
      MPU_LAR4                  : aliased MPU_LAR_Register;
      --  Base address register for MPU region 5. Writable only from a Secure,
      --  Privileged context.
      MPU_BAR5                  : aliased MPU_BAR_Register;
      --  Limit address register for MPU region 5. Writable only from a Secure,
      --  Privileged context, with the exception of the P bit.
      MPU_LAR5                  : aliased MPU_LAR_Register;
      --  Base address register for MPU region 6. Writable only from a Secure,
      --  Privileged context.
      MPU_BAR6                  : aliased MPU_BAR_Register;
      --  Limit address register for MPU region 6. Writable only from a Secure,
      --  Privileged context, with the exception of the P bit.
      MPU_LAR6                  : aliased MPU_LAR_Register;
      --  Base address register for MPU region 7. Writable only from a Secure,
      --  Privileged context.
      MPU_BAR7                  : aliased MPU_BAR_Register;
      --  Limit address register for MPU region 7. Writable only from a Secure,
      --  Privileged context, with the exception of the P bit.
      MPU_LAR7                  : aliased MPU_LAR_Register;
      --  Read: get channel DREQ counter (i.e. how many accesses the DMA
      --  expects it can perform on the peripheral without overflow/underflow.
      --  Write any value: clears the counter, and cause channel to re-initiate
      --  DREQ handshake.
      CH0_DBG_CTDREQ            : aliased CH0_DBG_CTDREQ_Register;
      --  Read to get channel TRANS_COUNT reload value, i.e. the length of the
      --  next transfer
      CH0_DBG_TCR               : aliased HAL.UInt32;
      --  Read: get channel DREQ counter (i.e. how many accesses the DMA
      --  expects it can perform on the peripheral without overflow/underflow.
      --  Write any value: clears the counter, and cause channel to re-initiate
      --  DREQ handshake.
      CH1_DBG_CTDREQ            : aliased CH1_DBG_CTDREQ_Register;
      --  Read to get channel TRANS_COUNT reload value, i.e. the length of the
      --  next transfer
      CH1_DBG_TCR               : aliased HAL.UInt32;
      --  Read: get channel DREQ counter (i.e. how many accesses the DMA
      --  expects it can perform on the peripheral without overflow/underflow.
      --  Write any value: clears the counter, and cause channel to re-initiate
      --  DREQ handshake.
      CH2_DBG_CTDREQ            : aliased CH2_DBG_CTDREQ_Register;
      --  Read to get channel TRANS_COUNT reload value, i.e. the length of the
      --  next transfer
      CH2_DBG_TCR               : aliased HAL.UInt32;
      --  Read: get channel DREQ counter (i.e. how many accesses the DMA
      --  expects it can perform on the peripheral without overflow/underflow.
      --  Write any value: clears the counter, and cause channel to re-initiate
      --  DREQ handshake.
      CH3_DBG_CTDREQ            : aliased CH3_DBG_CTDREQ_Register;
      --  Read to get channel TRANS_COUNT reload value, i.e. the length of the
      --  next transfer
      CH3_DBG_TCR               : aliased HAL.UInt32;
      --  Read: get channel DREQ counter (i.e. how many accesses the DMA
      --  expects it can perform on the peripheral without overflow/underflow.
      --  Write any value: clears the counter, and cause channel to re-initiate
      --  DREQ handshake.
      CH4_DBG_CTDREQ            : aliased CH4_DBG_CTDREQ_Register;
      --  Read to get channel TRANS_COUNT reload value, i.e. the length of the
      --  next transfer
      CH4_DBG_TCR               : aliased HAL.UInt32;
      --  Read: get channel DREQ counter (i.e. how many accesses the DMA
      --  expects it can perform on the peripheral without overflow/underflow.
      --  Write any value: clears the counter, and cause channel to re-initiate
      --  DREQ handshake.
      CH5_DBG_CTDREQ            : aliased CH5_DBG_CTDREQ_Register;
      --  Read to get channel TRANS_COUNT reload value, i.e. the length of the
      --  next transfer
      CH5_DBG_TCR               : aliased HAL.UInt32;
      --  Read: get channel DREQ counter (i.e. how many accesses the DMA
      --  expects it can perform on the peripheral without overflow/underflow.
      --  Write any value: clears the counter, and cause channel to re-initiate
      --  DREQ handshake.
      CH6_DBG_CTDREQ            : aliased CH6_DBG_CTDREQ_Register;
      --  Read to get channel TRANS_COUNT reload value, i.e. the length of the
      --  next transfer
      CH6_DBG_TCR               : aliased HAL.UInt32;
      --  Read: get channel DREQ counter (i.e. how many accesses the DMA
      --  expects it can perform on the peripheral without overflow/underflow.
      --  Write any value: clears the counter, and cause channel to re-initiate
      --  DREQ handshake.
      CH7_DBG_CTDREQ            : aliased CH7_DBG_CTDREQ_Register;
      --  Read to get channel TRANS_COUNT reload value, i.e. the length of the
      --  next transfer
      CH7_DBG_TCR               : aliased HAL.UInt32;
      --  Read: get channel DREQ counter (i.e. how many accesses the DMA
      --  expects it can perform on the peripheral without overflow/underflow.
      --  Write any value: clears the counter, and cause channel to re-initiate
      --  DREQ handshake.
      CH8_DBG_CTDREQ            : aliased CH8_DBG_CTDREQ_Register;
      --  Read to get channel TRANS_COUNT reload value, i.e. the length of the
      --  next transfer
      CH8_DBG_TCR               : aliased HAL.UInt32;
      --  Read: get channel DREQ counter (i.e. how many accesses the DMA
      --  expects it can perform on the peripheral without overflow/underflow.
      --  Write any value: clears the counter, and cause channel to re-initiate
      --  DREQ handshake.
      CH9_DBG_CTDREQ            : aliased CH9_DBG_CTDREQ_Register;
      --  Read to get channel TRANS_COUNT reload value, i.e. the length of the
      --  next transfer
      CH9_DBG_TCR               : aliased HAL.UInt32;
      --  Read: get channel DREQ counter (i.e. how many accesses the DMA
      --  expects it can perform on the peripheral without overflow/underflow.
      --  Write any value: clears the counter, and cause channel to re-initiate
      --  DREQ handshake.
      CH10_DBG_CTDREQ           : aliased CH10_DBG_CTDREQ_Register;
      --  Read to get channel TRANS_COUNT reload value, i.e. the length of the
      --  next transfer
      CH10_DBG_TCR              : aliased HAL.UInt32;
      --  Read: get channel DREQ counter (i.e. how many accesses the DMA
      --  expects it can perform on the peripheral without overflow/underflow.
      --  Write any value: clears the counter, and cause channel to re-initiate
      --  DREQ handshake.
      CH11_DBG_CTDREQ           : aliased CH11_DBG_CTDREQ_Register;
      --  Read to get channel TRANS_COUNT reload value, i.e. the length of the
      --  next transfer
      CH11_DBG_TCR              : aliased HAL.UInt32;
      --  Read: get channel DREQ counter (i.e. how many accesses the DMA
      --  expects it can perform on the peripheral without overflow/underflow.
      --  Write any value: clears the counter, and cause channel to re-initiate
      --  DREQ handshake.
      CH12_DBG_CTDREQ           : aliased CH12_DBG_CTDREQ_Register;
      --  Read to get channel TRANS_COUNT reload value, i.e. the length of the
      --  next transfer
      CH12_DBG_TCR              : aliased HAL.UInt32;
      --  Read: get channel DREQ counter (i.e. how many accesses the DMA
      --  expects it can perform on the peripheral without overflow/underflow.
      --  Write any value: clears the counter, and cause channel to re-initiate
      --  DREQ handshake.
      CH13_DBG_CTDREQ           : aliased CH13_DBG_CTDREQ_Register;
      --  Read to get channel TRANS_COUNT reload value, i.e. the length of the
      --  next transfer
      CH13_DBG_TCR              : aliased HAL.UInt32;
      --  Read: get channel DREQ counter (i.e. how many accesses the DMA
      --  expects it can perform on the peripheral without overflow/underflow.
      --  Write any value: clears the counter, and cause channel to re-initiate
      --  DREQ handshake.
      CH14_DBG_CTDREQ           : aliased CH14_DBG_CTDREQ_Register;
      --  Read to get channel TRANS_COUNT reload value, i.e. the length of the
      --  next transfer
      CH14_DBG_TCR              : aliased HAL.UInt32;
      --  Read: get channel DREQ counter (i.e. how many accesses the DMA
      --  expects it can perform on the peripheral without overflow/underflow.
      --  Write any value: clears the counter, and cause channel to re-initiate
      --  DREQ handshake.
      CH15_DBG_CTDREQ           : aliased CH15_DBG_CTDREQ_Register;
      --  Read to get channel TRANS_COUNT reload value, i.e. the length of the
      --  next transfer
      CH15_DBG_TCR              : aliased HAL.UInt32;
   end record
     with Volatile;

   for DMA_Peripheral use record
      CH0_READ_ADDR             at 16#0# range 0 .. 31;
      CH0_WRITE_ADDR            at 16#4# range 0 .. 31;
      CH0_TRANS_COUNT           at 16#8# range 0 .. 31;
      CH0_CTRL_TRIG             at 16#C# range 0 .. 31;
      CH0_AL1_CTRL              at 16#10# range 0 .. 31;
      CH0_AL1_READ_ADDR         at 16#14# range 0 .. 31;
      CH0_AL1_WRITE_ADDR        at 16#18# range 0 .. 31;
      CH0_AL1_TRANS_COUNT_TRIG  at 16#1C# range 0 .. 31;
      CH0_AL2_CTRL              at 16#20# range 0 .. 31;
      CH0_AL2_TRANS_COUNT       at 16#24# range 0 .. 31;
      CH0_AL2_READ_ADDR         at 16#28# range 0 .. 31;
      CH0_AL2_WRITE_ADDR_TRIG   at 16#2C# range 0 .. 31;
      CH0_AL3_CTRL              at 16#30# range 0 .. 31;
      CH0_AL3_WRITE_ADDR        at 16#34# range 0 .. 31;
      CH0_AL3_TRANS_COUNT       at 16#38# range 0 .. 31;
      CH0_AL3_READ_ADDR_TRIG    at 16#3C# range 0 .. 31;
      CH1_READ_ADDR             at 16#40# range 0 .. 31;
      CH1_WRITE_ADDR            at 16#44# range 0 .. 31;
      CH1_TRANS_COUNT           at 16#48# range 0 .. 31;
      CH1_CTRL_TRIG             at 16#4C# range 0 .. 31;
      CH1_AL1_CTRL              at 16#50# range 0 .. 31;
      CH1_AL1_READ_ADDR         at 16#54# range 0 .. 31;
      CH1_AL1_WRITE_ADDR        at 16#58# range 0 .. 31;
      CH1_AL1_TRANS_COUNT_TRIG  at 16#5C# range 0 .. 31;
      CH1_AL2_CTRL              at 16#60# range 0 .. 31;
      CH1_AL2_TRANS_COUNT       at 16#64# range 0 .. 31;
      CH1_AL2_READ_ADDR         at 16#68# range 0 .. 31;
      CH1_AL2_WRITE_ADDR_TRIG   at 16#6C# range 0 .. 31;
      CH1_AL3_CTRL              at 16#70# range 0 .. 31;
      CH1_AL3_WRITE_ADDR        at 16#74# range 0 .. 31;
      CH1_AL3_TRANS_COUNT       at 16#78# range 0 .. 31;
      CH1_AL3_READ_ADDR_TRIG    at 16#7C# range 0 .. 31;
      CH2_READ_ADDR             at 16#80# range 0 .. 31;
      CH2_WRITE_ADDR            at 16#84# range 0 .. 31;
      CH2_TRANS_COUNT           at 16#88# range 0 .. 31;
      CH2_CTRL_TRIG             at 16#8C# range 0 .. 31;
      CH2_AL1_CTRL              at 16#90# range 0 .. 31;
      CH2_AL1_READ_ADDR         at 16#94# range 0 .. 31;
      CH2_AL1_WRITE_ADDR        at 16#98# range 0 .. 31;
      CH2_AL1_TRANS_COUNT_TRIG  at 16#9C# range 0 .. 31;
      CH2_AL2_CTRL              at 16#A0# range 0 .. 31;
      CH2_AL2_TRANS_COUNT       at 16#A4# range 0 .. 31;
      CH2_AL2_READ_ADDR         at 16#A8# range 0 .. 31;
      CH2_AL2_WRITE_ADDR_TRIG   at 16#AC# range 0 .. 31;
      CH2_AL3_CTRL              at 16#B0# range 0 .. 31;
      CH2_AL3_WRITE_ADDR        at 16#B4# range 0 .. 31;
      CH2_AL3_TRANS_COUNT       at 16#B8# range 0 .. 31;
      CH2_AL3_READ_ADDR_TRIG    at 16#BC# range 0 .. 31;
      CH3_READ_ADDR             at 16#C0# range 0 .. 31;
      CH3_WRITE_ADDR            at 16#C4# range 0 .. 31;
      CH3_TRANS_COUNT           at 16#C8# range 0 .. 31;
      CH3_CTRL_TRIG             at 16#CC# range 0 .. 31;
      CH3_AL1_CTRL              at 16#D0# range 0 .. 31;
      CH3_AL1_READ_ADDR         at 16#D4# range 0 .. 31;
      CH3_AL1_WRITE_ADDR        at 16#D8# range 0 .. 31;
      CH3_AL1_TRANS_COUNT_TRIG  at 16#DC# range 0 .. 31;
      CH3_AL2_CTRL              at 16#E0# range 0 .. 31;
      CH3_AL2_TRANS_COUNT       at 16#E4# range 0 .. 31;
      CH3_AL2_READ_ADDR         at 16#E8# range 0 .. 31;
      CH3_AL2_WRITE_ADDR_TRIG   at 16#EC# range 0 .. 31;
      CH3_AL3_CTRL              at 16#F0# range 0 .. 31;
      CH3_AL3_WRITE_ADDR        at 16#F4# range 0 .. 31;
      CH3_AL3_TRANS_COUNT       at 16#F8# range 0 .. 31;
      CH3_AL3_READ_ADDR_TRIG    at 16#FC# range 0 .. 31;
      CH4_READ_ADDR             at 16#100# range 0 .. 31;
      CH4_WRITE_ADDR            at 16#104# range 0 .. 31;
      CH4_TRANS_COUNT           at 16#108# range 0 .. 31;
      CH4_CTRL_TRIG             at 16#10C# range 0 .. 31;
      CH4_AL1_CTRL              at 16#110# range 0 .. 31;
      CH4_AL1_READ_ADDR         at 16#114# range 0 .. 31;
      CH4_AL1_WRITE_ADDR        at 16#118# range 0 .. 31;
      CH4_AL1_TRANS_COUNT_TRIG  at 16#11C# range 0 .. 31;
      CH4_AL2_CTRL              at 16#120# range 0 .. 31;
      CH4_AL2_TRANS_COUNT       at 16#124# range 0 .. 31;
      CH4_AL2_READ_ADDR         at 16#128# range 0 .. 31;
      CH4_AL2_WRITE_ADDR_TRIG   at 16#12C# range 0 .. 31;
      CH4_AL3_CTRL              at 16#130# range 0 .. 31;
      CH4_AL3_WRITE_ADDR        at 16#134# range 0 .. 31;
      CH4_AL3_TRANS_COUNT       at 16#138# range 0 .. 31;
      CH4_AL3_READ_ADDR_TRIG    at 16#13C# range 0 .. 31;
      CH5_READ_ADDR             at 16#140# range 0 .. 31;
      CH5_WRITE_ADDR            at 16#144# range 0 .. 31;
      CH5_TRANS_COUNT           at 16#148# range 0 .. 31;
      CH5_CTRL_TRIG             at 16#14C# range 0 .. 31;
      CH5_AL1_CTRL              at 16#150# range 0 .. 31;
      CH5_AL1_READ_ADDR         at 16#154# range 0 .. 31;
      CH5_AL1_WRITE_ADDR        at 16#158# range 0 .. 31;
      CH5_AL1_TRANS_COUNT_TRIG  at 16#15C# range 0 .. 31;
      CH5_AL2_CTRL              at 16#160# range 0 .. 31;
      CH5_AL2_TRANS_COUNT       at 16#164# range 0 .. 31;
      CH5_AL2_READ_ADDR         at 16#168# range 0 .. 31;
      CH5_AL2_WRITE_ADDR_TRIG   at 16#16C# range 0 .. 31;
      CH5_AL3_CTRL              at 16#170# range 0 .. 31;
      CH5_AL3_WRITE_ADDR        at 16#174# range 0 .. 31;
      CH5_AL3_TRANS_COUNT       at 16#178# range 0 .. 31;
      CH5_AL3_READ_ADDR_TRIG    at 16#17C# range 0 .. 31;
      CH6_READ_ADDR             at 16#180# range 0 .. 31;
      CH6_WRITE_ADDR            at 16#184# range 0 .. 31;
      CH6_TRANS_COUNT           at 16#188# range 0 .. 31;
      CH6_CTRL_TRIG             at 16#18C# range 0 .. 31;
      CH6_AL1_CTRL              at 16#190# range 0 .. 31;
      CH6_AL1_READ_ADDR         at 16#194# range 0 .. 31;
      CH6_AL1_WRITE_ADDR        at 16#198# range 0 .. 31;
      CH6_AL1_TRANS_COUNT_TRIG  at 16#19C# range 0 .. 31;
      CH6_AL2_CTRL              at 16#1A0# range 0 .. 31;
      CH6_AL2_TRANS_COUNT       at 16#1A4# range 0 .. 31;
      CH6_AL2_READ_ADDR         at 16#1A8# range 0 .. 31;
      CH6_AL2_WRITE_ADDR_TRIG   at 16#1AC# range 0 .. 31;
      CH6_AL3_CTRL              at 16#1B0# range 0 .. 31;
      CH6_AL3_WRITE_ADDR        at 16#1B4# range 0 .. 31;
      CH6_AL3_TRANS_COUNT       at 16#1B8# range 0 .. 31;
      CH6_AL3_READ_ADDR_TRIG    at 16#1BC# range 0 .. 31;
      CH7_READ_ADDR             at 16#1C0# range 0 .. 31;
      CH7_WRITE_ADDR            at 16#1C4# range 0 .. 31;
      CH7_TRANS_COUNT           at 16#1C8# range 0 .. 31;
      CH7_CTRL_TRIG             at 16#1CC# range 0 .. 31;
      CH7_AL1_CTRL              at 16#1D0# range 0 .. 31;
      CH7_AL1_READ_ADDR         at 16#1D4# range 0 .. 31;
      CH7_AL1_WRITE_ADDR        at 16#1D8# range 0 .. 31;
      CH7_AL1_TRANS_COUNT_TRIG  at 16#1DC# range 0 .. 31;
      CH7_AL2_CTRL              at 16#1E0# range 0 .. 31;
      CH7_AL2_TRANS_COUNT       at 16#1E4# range 0 .. 31;
      CH7_AL2_READ_ADDR         at 16#1E8# range 0 .. 31;
      CH7_AL2_WRITE_ADDR_TRIG   at 16#1EC# range 0 .. 31;
      CH7_AL3_CTRL              at 16#1F0# range 0 .. 31;
      CH7_AL3_WRITE_ADDR        at 16#1F4# range 0 .. 31;
      CH7_AL3_TRANS_COUNT       at 16#1F8# range 0 .. 31;
      CH7_AL3_READ_ADDR_TRIG    at 16#1FC# range 0 .. 31;
      CH8_READ_ADDR             at 16#200# range 0 .. 31;
      CH8_WRITE_ADDR            at 16#204# range 0 .. 31;
      CH8_TRANS_COUNT           at 16#208# range 0 .. 31;
      CH8_CTRL_TRIG             at 16#20C# range 0 .. 31;
      CH8_AL1_CTRL              at 16#210# range 0 .. 31;
      CH8_AL1_READ_ADDR         at 16#214# range 0 .. 31;
      CH8_AL1_WRITE_ADDR        at 16#218# range 0 .. 31;
      CH8_AL1_TRANS_COUNT_TRIG  at 16#21C# range 0 .. 31;
      CH8_AL2_CTRL              at 16#220# range 0 .. 31;
      CH8_AL2_TRANS_COUNT       at 16#224# range 0 .. 31;
      CH8_AL2_READ_ADDR         at 16#228# range 0 .. 31;
      CH8_AL2_WRITE_ADDR_TRIG   at 16#22C# range 0 .. 31;
      CH8_AL3_CTRL              at 16#230# range 0 .. 31;
      CH8_AL3_WRITE_ADDR        at 16#234# range 0 .. 31;
      CH8_AL3_TRANS_COUNT       at 16#238# range 0 .. 31;
      CH8_AL3_READ_ADDR_TRIG    at 16#23C# range 0 .. 31;
      CH9_READ_ADDR             at 16#240# range 0 .. 31;
      CH9_WRITE_ADDR            at 16#244# range 0 .. 31;
      CH9_TRANS_COUNT           at 16#248# range 0 .. 31;
      CH9_CTRL_TRIG             at 16#24C# range 0 .. 31;
      CH9_AL1_CTRL              at 16#250# range 0 .. 31;
      CH9_AL1_READ_ADDR         at 16#254# range 0 .. 31;
      CH9_AL1_WRITE_ADDR        at 16#258# range 0 .. 31;
      CH9_AL1_TRANS_COUNT_TRIG  at 16#25C# range 0 .. 31;
      CH9_AL2_CTRL              at 16#260# range 0 .. 31;
      CH9_AL2_TRANS_COUNT       at 16#264# range 0 .. 31;
      CH9_AL2_READ_ADDR         at 16#268# range 0 .. 31;
      CH9_AL2_WRITE_ADDR_TRIG   at 16#26C# range 0 .. 31;
      CH9_AL3_CTRL              at 16#270# range 0 .. 31;
      CH9_AL3_WRITE_ADDR        at 16#274# range 0 .. 31;
      CH9_AL3_TRANS_COUNT       at 16#278# range 0 .. 31;
      CH9_AL3_READ_ADDR_TRIG    at 16#27C# range 0 .. 31;
      CH10_READ_ADDR            at 16#280# range 0 .. 31;
      CH10_WRITE_ADDR           at 16#284# range 0 .. 31;
      CH10_TRANS_COUNT          at 16#288# range 0 .. 31;
      CH10_CTRL_TRIG            at 16#28C# range 0 .. 31;
      CH10_AL1_CTRL             at 16#290# range 0 .. 31;
      CH10_AL1_READ_ADDR        at 16#294# range 0 .. 31;
      CH10_AL1_WRITE_ADDR       at 16#298# range 0 .. 31;
      CH10_AL1_TRANS_COUNT_TRIG at 16#29C# range 0 .. 31;
      CH10_AL2_CTRL             at 16#2A0# range 0 .. 31;
      CH10_AL2_TRANS_COUNT      at 16#2A4# range 0 .. 31;
      CH10_AL2_READ_ADDR        at 16#2A8# range 0 .. 31;
      CH10_AL2_WRITE_ADDR_TRIG  at 16#2AC# range 0 .. 31;
      CH10_AL3_CTRL             at 16#2B0# range 0 .. 31;
      CH10_AL3_WRITE_ADDR       at 16#2B4# range 0 .. 31;
      CH10_AL3_TRANS_COUNT      at 16#2B8# range 0 .. 31;
      CH10_AL3_READ_ADDR_TRIG   at 16#2BC# range 0 .. 31;
      CH11_READ_ADDR            at 16#2C0# range 0 .. 31;
      CH11_WRITE_ADDR           at 16#2C4# range 0 .. 31;
      CH11_TRANS_COUNT          at 16#2C8# range 0 .. 31;
      CH11_CTRL_TRIG            at 16#2CC# range 0 .. 31;
      CH11_AL1_CTRL             at 16#2D0# range 0 .. 31;
      CH11_AL1_READ_ADDR        at 16#2D4# range 0 .. 31;
      CH11_AL1_WRITE_ADDR       at 16#2D8# range 0 .. 31;
      CH11_AL1_TRANS_COUNT_TRIG at 16#2DC# range 0 .. 31;
      CH11_AL2_CTRL             at 16#2E0# range 0 .. 31;
      CH11_AL2_TRANS_COUNT      at 16#2E4# range 0 .. 31;
      CH11_AL2_READ_ADDR        at 16#2E8# range 0 .. 31;
      CH11_AL2_WRITE_ADDR_TRIG  at 16#2EC# range 0 .. 31;
      CH11_AL3_CTRL             at 16#2F0# range 0 .. 31;
      CH11_AL3_WRITE_ADDR       at 16#2F4# range 0 .. 31;
      CH11_AL3_TRANS_COUNT      at 16#2F8# range 0 .. 31;
      CH11_AL3_READ_ADDR_TRIG   at 16#2FC# range 0 .. 31;
      CH12_READ_ADDR            at 16#300# range 0 .. 31;
      CH12_WRITE_ADDR           at 16#304# range 0 .. 31;
      CH12_TRANS_COUNT          at 16#308# range 0 .. 31;
      CH12_CTRL_TRIG            at 16#30C# range 0 .. 31;
      CH12_AL1_CTRL             at 16#310# range 0 .. 31;
      CH12_AL1_READ_ADDR        at 16#314# range 0 .. 31;
      CH12_AL1_WRITE_ADDR       at 16#318# range 0 .. 31;
      CH12_AL1_TRANS_COUNT_TRIG at 16#31C# range 0 .. 31;
      CH12_AL2_CTRL             at 16#320# range 0 .. 31;
      CH12_AL2_TRANS_COUNT      at 16#324# range 0 .. 31;
      CH12_AL2_READ_ADDR        at 16#328# range 0 .. 31;
      CH12_AL2_WRITE_ADDR_TRIG  at 16#32C# range 0 .. 31;
      CH12_AL3_CTRL             at 16#330# range 0 .. 31;
      CH12_AL3_WRITE_ADDR       at 16#334# range 0 .. 31;
      CH12_AL3_TRANS_COUNT      at 16#338# range 0 .. 31;
      CH12_AL3_READ_ADDR_TRIG   at 16#33C# range 0 .. 31;
      CH13_READ_ADDR            at 16#340# range 0 .. 31;
      CH13_WRITE_ADDR           at 16#344# range 0 .. 31;
      CH13_TRANS_COUNT          at 16#348# range 0 .. 31;
      CH13_CTRL_TRIG            at 16#34C# range 0 .. 31;
      CH13_AL1_CTRL             at 16#350# range 0 .. 31;
      CH13_AL1_READ_ADDR        at 16#354# range 0 .. 31;
      CH13_AL1_WRITE_ADDR       at 16#358# range 0 .. 31;
      CH13_AL1_TRANS_COUNT_TRIG at 16#35C# range 0 .. 31;
      CH13_AL2_CTRL             at 16#360# range 0 .. 31;
      CH13_AL2_TRANS_COUNT      at 16#364# range 0 .. 31;
      CH13_AL2_READ_ADDR        at 16#368# range 0 .. 31;
      CH13_AL2_WRITE_ADDR_TRIG  at 16#36C# range 0 .. 31;
      CH13_AL3_CTRL             at 16#370# range 0 .. 31;
      CH13_AL3_WRITE_ADDR       at 16#374# range 0 .. 31;
      CH13_AL3_TRANS_COUNT      at 16#378# range 0 .. 31;
      CH13_AL3_READ_ADDR_TRIG   at 16#37C# range 0 .. 31;
      CH14_READ_ADDR            at 16#380# range 0 .. 31;
      CH14_WRITE_ADDR           at 16#384# range 0 .. 31;
      CH14_TRANS_COUNT          at 16#388# range 0 .. 31;
      CH14_CTRL_TRIG            at 16#38C# range 0 .. 31;
      CH14_AL1_CTRL             at 16#390# range 0 .. 31;
      CH14_AL1_READ_ADDR        at 16#394# range 0 .. 31;
      CH14_AL1_WRITE_ADDR       at 16#398# range 0 .. 31;
      CH14_AL1_TRANS_COUNT_TRIG at 16#39C# range 0 .. 31;
      CH14_AL2_CTRL             at 16#3A0# range 0 .. 31;
      CH14_AL2_TRANS_COUNT      at 16#3A4# range 0 .. 31;
      CH14_AL2_READ_ADDR        at 16#3A8# range 0 .. 31;
      CH14_AL2_WRITE_ADDR_TRIG  at 16#3AC# range 0 .. 31;
      CH14_AL3_CTRL             at 16#3B0# range 0 .. 31;
      CH14_AL3_WRITE_ADDR       at 16#3B4# range 0 .. 31;
      CH14_AL3_TRANS_COUNT      at 16#3B8# range 0 .. 31;
      CH14_AL3_READ_ADDR_TRIG   at 16#3BC# range 0 .. 31;
      CH15_READ_ADDR            at 16#3C0# range 0 .. 31;
      CH15_WRITE_ADDR           at 16#3C4# range 0 .. 31;
      CH15_TRANS_COUNT          at 16#3C8# range 0 .. 31;
      CH15_CTRL_TRIG            at 16#3CC# range 0 .. 31;
      CH15_AL1_CTRL             at 16#3D0# range 0 .. 31;
      CH15_AL1_READ_ADDR        at 16#3D4# range 0 .. 31;
      CH15_AL1_WRITE_ADDR       at 16#3D8# range 0 .. 31;
      CH15_AL1_TRANS_COUNT_TRIG at 16#3DC# range 0 .. 31;
      CH15_AL2_CTRL             at 16#3E0# range 0 .. 31;
      CH15_AL2_TRANS_COUNT      at 16#3E4# range 0 .. 31;
      CH15_AL2_READ_ADDR        at 16#3E8# range 0 .. 31;
      CH15_AL2_WRITE_ADDR_TRIG  at 16#3EC# range 0 .. 31;
      CH15_AL3_CTRL             at 16#3F0# range 0 .. 31;
      CH15_AL3_WRITE_ADDR       at 16#3F4# range 0 .. 31;
      CH15_AL3_TRANS_COUNT      at 16#3F8# range 0 .. 31;
      CH15_AL3_READ_ADDR_TRIG   at 16#3FC# range 0 .. 31;
      INTR                      at 16#400# range 0 .. 31;
      INTE0                     at 16#404# range 0 .. 31;
      INTF0                     at 16#408# range 0 .. 31;
      INTS0                     at 16#40C# range 0 .. 31;
      INTR1                     at 16#410# range 0 .. 31;
      INTE1                     at 16#414# range 0 .. 31;
      INTF1                     at 16#418# range 0 .. 31;
      INTS1                     at 16#41C# range 0 .. 31;
      INTR2                     at 16#420# range 0 .. 31;
      INTE2                     at 16#424# range 0 .. 31;
      INTF2                     at 16#428# range 0 .. 31;
      INTS2                     at 16#42C# range 0 .. 31;
      INTR3                     at 16#430# range 0 .. 31;
      INTE3                     at 16#434# range 0 .. 31;
      INTF3                     at 16#438# range 0 .. 31;
      INTS3                     at 16#43C# range 0 .. 31;
      TIMER0                    at 16#440# range 0 .. 31;
      TIMER1                    at 16#444# range 0 .. 31;
      TIMER2                    at 16#448# range 0 .. 31;
      TIMER3                    at 16#44C# range 0 .. 31;
      MULTI_CHAN_TRIGGER        at 16#450# range 0 .. 31;
      SNIFF_CTRL                at 16#454# range 0 .. 31;
      SNIFF_DATA                at 16#458# range 0 .. 31;
      FIFO_LEVELS               at 16#460# range 0 .. 31;
      CHAN_ABORT                at 16#464# range 0 .. 31;
      N_CHANNELS                at 16#468# range 0 .. 31;
      SECCFG_CH0                at 16#480# range 0 .. 31;
      SECCFG_CH1                at 16#484# range 0 .. 31;
      SECCFG_CH2                at 16#488# range 0 .. 31;
      SECCFG_CH3                at 16#48C# range 0 .. 31;
      SECCFG_CH4                at 16#490# range 0 .. 31;
      SECCFG_CH5                at 16#494# range 0 .. 31;
      SECCFG_CH6                at 16#498# range 0 .. 31;
      SECCFG_CH7                at 16#49C# range 0 .. 31;
      SECCFG_CH8                at 16#4A0# range 0 .. 31;
      SECCFG_CH9                at 16#4A4# range 0 .. 31;
      SECCFG_CH10               at 16#4A8# range 0 .. 31;
      SECCFG_CH11               at 16#4AC# range 0 .. 31;
      SECCFG_CH12               at 16#4B0# range 0 .. 31;
      SECCFG_CH13               at 16#4B4# range 0 .. 31;
      SECCFG_CH14               at 16#4B8# range 0 .. 31;
      SECCFG_CH15               at 16#4BC# range 0 .. 31;
      SECCFG_IRQ0               at 16#4C0# range 0 .. 31;
      SECCFG_IRQ1               at 16#4C4# range 0 .. 31;
      SECCFG_IRQ2               at 16#4C8# range 0 .. 31;
      SECCFG_IRQ3               at 16#4CC# range 0 .. 31;
      SECCFG_MISC               at 16#4D0# range 0 .. 31;
      MPU_CTRL                  at 16#500# range 0 .. 31;
      MPU_BAR0                  at 16#504# range 0 .. 31;
      MPU_LAR0                  at 16#508# range 0 .. 31;
      MPU_BAR1                  at 16#50C# range 0 .. 31;
      MPU_LAR1                  at 16#510# range 0 .. 31;
      MPU_BAR2                  at 16#514# range 0 .. 31;
      MPU_LAR2                  at 16#518# range 0 .. 31;
      MPU_BAR3                  at 16#51C# range 0 .. 31;
      MPU_LAR3                  at 16#520# range 0 .. 31;
      MPU_BAR4                  at 16#524# range 0 .. 31;
      MPU_LAR4                  at 16#528# range 0 .. 31;
      MPU_BAR5                  at 16#52C# range 0 .. 31;
      MPU_LAR5                  at 16#530# range 0 .. 31;
      MPU_BAR6                  at 16#534# range 0 .. 31;
      MPU_LAR6                  at 16#538# range 0 .. 31;
      MPU_BAR7                  at 16#53C# range 0 .. 31;
      MPU_LAR7                  at 16#540# range 0 .. 31;
      CH0_DBG_CTDREQ            at 16#800# range 0 .. 31;
      CH0_DBG_TCR               at 16#804# range 0 .. 31;
      CH1_DBG_CTDREQ            at 16#840# range 0 .. 31;
      CH1_DBG_TCR               at 16#844# range 0 .. 31;
      CH2_DBG_CTDREQ            at 16#880# range 0 .. 31;
      CH2_DBG_TCR               at 16#884# range 0 .. 31;
      CH3_DBG_CTDREQ            at 16#8C0# range 0 .. 31;
      CH3_DBG_TCR               at 16#8C4# range 0 .. 31;
      CH4_DBG_CTDREQ            at 16#900# range 0 .. 31;
      CH4_DBG_TCR               at 16#904# range 0 .. 31;
      CH5_DBG_CTDREQ            at 16#940# range 0 .. 31;
      CH5_DBG_TCR               at 16#944# range 0 .. 31;
      CH6_DBG_CTDREQ            at 16#980# range 0 .. 31;
      CH6_DBG_TCR               at 16#984# range 0 .. 31;
      CH7_DBG_CTDREQ            at 16#9C0# range 0 .. 31;
      CH7_DBG_TCR               at 16#9C4# range 0 .. 31;
      CH8_DBG_CTDREQ            at 16#A00# range 0 .. 31;
      CH8_DBG_TCR               at 16#A04# range 0 .. 31;
      CH9_DBG_CTDREQ            at 16#A40# range 0 .. 31;
      CH9_DBG_TCR               at 16#A44# range 0 .. 31;
      CH10_DBG_CTDREQ           at 16#A80# range 0 .. 31;
      CH10_DBG_TCR              at 16#A84# range 0 .. 31;
      CH11_DBG_CTDREQ           at 16#AC0# range 0 .. 31;
      CH11_DBG_TCR              at 16#AC4# range 0 .. 31;
      CH12_DBG_CTDREQ           at 16#B00# range 0 .. 31;
      CH12_DBG_TCR              at 16#B04# range 0 .. 31;
      CH13_DBG_CTDREQ           at 16#B40# range 0 .. 31;
      CH13_DBG_TCR              at 16#B44# range 0 .. 31;
      CH14_DBG_CTDREQ           at 16#B80# range 0 .. 31;
      CH14_DBG_TCR              at 16#B84# range 0 .. 31;
      CH15_DBG_CTDREQ           at 16#BC0# range 0 .. 31;
      CH15_DBG_TCR              at 16#BC4# range 0 .. 31;
   end record;

   --  DMA with separate read and write masters
   DMA_Periph : aliased DMA_Peripheral
     with Import, Address => DMA_Base;

end RP2350_SVD.DMA;
