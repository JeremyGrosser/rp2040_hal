--
--  Copyright 2021 (C) Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP2040_SVD.DMA;
with RP2040_SVD;
with System;
with HAL;

package RP.DMA is

   type DMA_Channel_Id is range 0 .. 11
      with Size => 4;

   type Transfer_Width is (Transfer_8, Transfer_16, Transfer_32)
      with Size => 2;
   for Transfer_Width use (0, 1, 2);

   type Ring_Wrap_Select is (Wrap_Read, Wrap_Write)
      with Size => 1;
   for Ring_Wrap_Select use (0, 1);

   type DMA_Request_Trigger is
      (PIO0_TX0, PIO0_TX1, PIO0_TX2, PIO0_TX3, PIO0_RX0, PIO0_RX1, PIO0_RX2, PIO0_RX3,
       PIO1_TX0, PIO1_TX1, PIO1_TX2, PIO1_TX3, PIO1_RX0, PIO1_RX1, PIO1_RX2, PIO1_RX3,
       SPI0_TX, SPI0_RX,
       SPI1_TX, SPI1_RX,
       UART0_TX, UART0_RX,
       UART1_TX, UART1_RX,
       PWM_WRAP0, PWM_WRAP1, PWM_WRAP2, PWM_WRAP3, PWM_WRAP4, PWM_WRAP5, PWM_WRAP6, PWM_WRAP7,
       I2C0_TX, I2C0_RX,
       I2C1_TX, I2C1_RX,
       ADC,
       XIP_STREAM, XIP_SSITX, XIP_SSIRX,
       TIMER0, TIMER1, TIMER2, TIMER3,
       PERMANENT)
       with Size => 6;
   for DMA_Request_Trigger use
      (PIO0_TX0   => 16#00#,
       PIO0_TX1   => 16#01#,
       PIO0_TX2   => 16#02#,
       PIO0_TX3   => 16#03#,
       PIO0_RX0   => 16#04#,
       PIO0_RX1   => 16#05#,
       PIO0_RX2   => 16#06#,
       PIO0_RX3   => 16#07#,
       PIO1_TX0   => 16#08#,
       PIO1_TX1   => 16#09#,
       PIO1_TX2   => 16#0A#,
       PIO1_TX3   => 16#0B#,
       PIO1_RX0   => 16#0C#,
       PIO1_RX1   => 16#0D#,
       PIO1_RX2   => 16#0E#,
       PIO1_RX3   => 16#0F#,
       SPI0_TX    => 16#10#,
       SPI0_RX    => 16#11#,
       SPI1_TX    => 16#12#,
       SPI1_RX    => 16#13#,
       UART0_TX   => 16#14#,
       UART0_RX   => 16#15#,
       UART1_TX   => 16#16#,
       UART1_RX   => 16#17#,
       PWM_WRAP0  => 16#18#,
       PWM_WRAP1  => 16#19#,
       PWM_WRAP2  => 16#1A#,
       PWM_WRAP3  => 16#1B#,
       PWM_WRAP4  => 16#1C#,
       PWM_WRAP5  => 16#1D#,
       PWM_WRAP6  => 16#1E#,
       PWM_WRAP7  => 16#1F#,
       I2C0_TX    => 16#20#,
       I2C0_RX    => 16#21#,
       I2C1_TX    => 16#22#,
       I2C1_RX    => 16#23#,
       ADC        => 16#24#,
       XIP_STREAM => 16#25#,
       XIP_SSITX  => 16#26#,
       XIP_SSIRX  => 16#27#,

       TIMER0     => 16#3B#,
       TIMER1     => 16#3C#,
       TIMER2     => 16#3D#,
       TIMER3     => 16#3E#,
       PERMANENT  => 16#3F#);

   type DMA_Configuration is record
      High_Priority   : Boolean := False;                   --  Schedule this channel before others
      Data_Size       : Transfer_Width := Transfer_8;       --  Bits per transfer (byte, halfword, word)
      Increment_Read  : Boolean := False;                   --  Increment read address after transfer
      Increment_Write : Boolean := False;                   --  Increment write address after transfer
      Ring_Size       : HAL.UInt4 := 0;                     --  Ring buffer size
      Ring_Wrap       : Ring_Wrap_Select := Wrap_Read;      --  Read or write buffer is a ring buffer
      Chain_To        : DMA_Channel_Id := 0;                --  Trigger another channel after transfer.
                                                            --  Set to *this channel* to disable chaining.
      Trigger         : DMA_Request_Trigger := PERMANENT;   --  Trigger a transfer on this signal
      Quiet           : Boolean := False;                   --  Disable interrupts
      Byte_Swap       : Boolean := False;                   --  Reverse byte order
      Sniff           : Boolean := False;                   --  Send data to sniff checksum
   end record;

   type DMA_Status is record
      Enabled             : Boolean := False;
      Busy                : Boolean := False;
      Write_Error         : Boolean := False;
      Read_Error          : Boolean := False;
      AHB_Error           : Boolean := False;
      Transfers_Remaining : Natural := 0;
   end record;

   procedure Enable;

   procedure Configure
      (Channel : DMA_Channel_Id;
       Config  : DMA_Configuration);

   procedure Start
      (Channel  : DMA_Channel_Id;
       From, To : System.Address;
       Count    : HAL.UInt32);

   procedure Disable
      (Channel : DMA_Channel_Id);

   function Busy
      (Channel : DMA_Channel_Id)
      return Boolean;

   function Status
      (Channel : DMA_Channel_Id)
      return DMA_Status;

   type Checksum_Algorithm is
      (CRC_32,  --  CRC-32 (IEEE802.3 polynomial)
       CRC_32R, --  CRC-32 (IEEE802.3 polynomial) with bit reversed data
       CRC_16,  --  CRC-16-CCITT
       CRC_16R, --  CRC-16-CCITT with bit reversed data
       EVEN,    --  XOR reduction over all data. == 1 if total 1 population count is odd
       SUM);    --  Calculate a simple 32-bit checksum (addition with 32 bit accumulator)

   procedure Enable_Checksum
      (Channel   : DMA_Channel_Id;
       Algorithm : Checksum_Algorithm;
       Byte_Swap : Boolean := False;
       Reversed  : Boolean := False;
       Inverted  : Boolean := False);

   procedure Set_Checksum
      (Value : HAL.UInt32);

   function Checksum
      return HAL.UInt32;

   subtype DMA_IRQ_Id is Natural range 0 .. 1;

   procedure Enable_IRQ (Channel : DMA_Channel_Id;
                         IRQ     : DMA_IRQ_Id);

   procedure Disable_IRQ (Channel : DMA_Channel_Id;
                          IRQ     : DMA_IRQ_Id);

   procedure Ack_IRQ (Channel : DMA_Channel_Id;
                      IRQ     : DMA_IRQ_Id);

   function IRQ_Status (Channel : DMA_Channel_Id;
                        IRQ     : DMA_IRQ_Id)
                        return Boolean;
   --  Return True if the IRQ is triggered

private

   type DMA_CTRL_Register is record
      EN            : Boolean := False;
      HIGH_PRIORITY : Boolean := False;
      DATA_SIZE     : Transfer_Width := Transfer_8;
      INCR_READ     : Boolean := False;
      INCR_WRITE    : Boolean := False;
      RING_SIZE     : HAL.UInt4 := 0;
      RING_SEL      : Ring_Wrap_Select := Wrap_Read;
      CHAIN_TO      : DMA_Channel_Id := 0;
      TREQ_SEL      : DMA_Request_Trigger := PERMANENT;
      IRQ_QUIET     : Boolean := False;
      BSWAP         : Boolean := False;
      SNIFF_EN      : Boolean := False;
      BUSY          : Boolean := False;
      WRITE_ERROR   : Boolean := False;
      READ_ERROR    : Boolean := False;
      AHB_ERROR     : Boolean := False;
   end record
      with Volatile_Full_Access,
           Object_Size => 32,
           Bit_Order => System.Low_Order_First;
   for DMA_CTRL_Register use record
      EN            at 0 range 0 .. 0;
      HIGH_PRIORITY at 0 range 1 .. 1;
      DATA_SIZE     at 0 range 2 .. 3;
      INCR_READ     at 0 range 4 .. 4;
      INCR_WRITE    at 0 range 5 .. 5;
      RING_SIZE     at 0 range 6 .. 9;
      RING_SEL      at 0 range 10 .. 10;
      CHAIN_TO      at 0 range 11 .. 14;
      TREQ_SEL      at 0 range 15 .. 20;
      IRQ_QUIET     at 0 range 21 .. 21;
      BSWAP         at 0 range 22 .. 22;
      SNIFF_EN      at 0 range 23 .. 23;
      BUSY          at 0 range 24 .. 24;
      WRITE_ERROR   at 0 range 29 .. 29;
      READ_ERROR    at 0 range 30 .. 30;
      AHB_ERROR     at 0 range 31 .. 31;
   end record;

   --  Enable the DMA peripheral
   type DMA_Channel_Register is record
      READ_ADDR            : System.Address;
      WRITE_ADDR           : System.Address;
      TRANS_COUNT          : HAL.UInt32;
      CTRL_TRIG            : DMA_CTRL_Register;

      AL1_CTRL             : DMA_CTRL_Register;
      AL1_READ_ADDR        : System.Address;
      AL1_WRITE_ADDR       : System.Address;
      AL1_TRANS_COUNT_TRIG : HAL.UInt32;

      AL2_CTRL             : DMA_CTRL_Register;
      AL2_READ_ADDR        : System.Address;
      AL2_WRITE_ADDR_TRIG  : System.Address;
      AL2_TRANS_COUNT      : HAL.UInt32;

      AL3_CTRL             : DMA_CTRL_Register;
      AL3_READ_ADDR_TRIG   : System.Address;
      AL3_WRITE_ADDR       : System.Address;
      AL3_TRANS_COUNT      : HAL.UInt32;
   end record
      with Volatile, Size => 512;
   for DMA_Channel_Register use record
      READ_ADDR            at 16#00# range 0 .. 31;
      WRITE_ADDR           at 16#04# range 0 .. 31;
      TRANS_COUNT          at 16#08# range 0 .. 31;
      CTRL_TRIG            at 16#0C# range 0 .. 31;

      AL1_CTRL             at 16#10# range 0 .. 31;
      AL1_READ_ADDR        at 16#14# range 0 .. 31;
      AL1_WRITE_ADDR       at 16#18# range 0 .. 31;
      AL1_TRANS_COUNT_TRIG at 16#1C# range 0 .. 31;

      AL2_CTRL             at 16#20# range 0 .. 31;
      AL2_TRANS_COUNT      at 16#24# range 0 .. 31;
      AL2_READ_ADDR        at 16#28# range 0 .. 31;
      AL2_WRITE_ADDR_TRIG  at 16#2C# range 0 .. 31;

      AL3_CTRL             at 16#30# range 0 .. 31;
      AL3_WRITE_ADDR       at 16#34# range 0 .. 31;
      AL3_TRANS_COUNT      at 16#38# range 0 .. 31;
      AL3_READ_ADDR_TRIG   at 16#3C# range 0 .. 31;
   end record;

   type DMA_Channel_Debug is record
      CTDREQ : aliased RP2040_SVD.DMA.CH0_DBG_CTDREQ_Register;
      TCR    : HAL.UInt32;
   end record
      with Volatile, Size => 64;
   for DMA_Channel_Debug use record
      CTDREQ at 16#00# range 0 .. 31;
      TCR    at 16#04# range 0 .. 31;
   end record;

   type DMA_IRQ is record
      INTE : aliased RP2040_SVD.DMA.INTE0_Register;
      INTF : aliased RP2040_SVD.DMA.INTF0_Register;
      INTS : aliased RP2040_SVD.DMA.INTS0_Register;
   end record
      with Volatile, Size => 96;
   for DMA_IRQ use record
      INTE at 16#00# range 0 .. 31;
      INTF at 16#04# range 0 .. 31;
      INTS at 16#08# range 0 .. 31;
   end record;

   type DMA_Channels is array (DMA_Channel_Id) of DMA_Channel_Register;

   type DMA_Channels_Debug is array (DMA_Channel_Id) of DMA_Channel_Debug;

   type DMA_IRQs is array (0 .. 1) of aliased DMA_IRQ;

   type DMA_Timers is array (0 .. 3) of RP2040_SVD.DMA.TIMER_Register;

   type DMA_Peripheral is record
      CH                 : DMA_Channels;
      INTR               : aliased RP2040_SVD.DMA.INTR_Register;
      IRQ                : DMA_IRQs;
      TIMER              : DMA_Timers;
      MULTI_CHAN_TRIGGER : aliased RP2040_SVD.DMA.MULTI_CHAN_TRIGGER_Register;
      SNIFF_CTRL         : aliased RP2040_SVD.DMA.SNIFF_CTRL_Register;
      SNIFF_DATA         : aliased HAL.UInt32;
      FIFO_LEVELS        : aliased RP2040_SVD.DMA.FIFO_LEVELS_Register;
      CHAN_ABORT         : aliased RP2040_SVD.DMA.CHAN_ABORT_Register;
      N_CHANNELS         : aliased RP2040_SVD.DMA.N_CHANNELS_Register;
      CH_DBG             : DMA_Channels_Debug;
   end record
      with Volatile;
   for DMA_Peripheral use record
      CH                 at 16#000# range 0 .. 6143;
      INTR               at 16#400# range 0 .. 31;
      IRQ                at 16#404# range 0 .. 191;
      TIMER              at 16#420# range 0 .. 127;
      MULTI_CHAN_TRIGGER at 16#430# range 0 .. 31;
      SNIFF_CTRL         at 16#434# range 0 .. 31;
      SNIFF_DATA         at 16#438# range 0 .. 31;
      FIFO_LEVELS        at 16#440# range 0 .. 31;
      CHAN_ABORT         at 16#444# range 0 .. 31;
      N_CHANNELS         at 16#448# range 0 .. 31;
      CH_DBG             at 16#800# range 0 .. 767;
   end record;

   DMA_Periph : aliased DMA_Peripheral
      with Import, Address => RP2040_SVD.DMA_Base;

end RP.DMA;
