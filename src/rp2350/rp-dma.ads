--
--  Copyright 2021 (C) Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
private with RP2350_SVD.DMA;
private with RP2350_SVD;
with HAL; use HAL;
with System;

package RP.DMA
   with Preelaborate
is

   type DMA_Channel_Id is range 0 .. 15
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
       PIO2_TX0, PIO2_TX1, PIO2_TX2, PIO2_TX3, PIO2_RX0, PIO2_RX1, PIO2_RX2, PIO2_RX3,
       SPI0_TX, SPI0_RX,
       SPI1_TX, SPI1_RX,
       UART0_TX, UART0_RX,
       UART1_TX, UART1_RX,
       PWM_WRAP0, PWM_WRAP1, PWM_WRAP2, PWM_WRAP3, PWM_WRAP4, PWM_WRAP5,
       PWM_WRAP6, PWM_WRAP7, PWM_WRAP8, PWM_WRAP9, PWM_WRAP10, PWM_WRAP11,
       I2C0_TX, I2C0_RX,
       I2C1_TX, I2C1_RX,
       ADC,
       XIP_STREAM, XIP_QMITX, XIP_QMIRX,
       HSTX,
       CORESIGHT,
       SHA256,
       TIMER0, TIMER1, TIMER2, TIMER3,
       PERMANENT)
       with Size => 6;
   for DMA_Request_Trigger use
      (PIO0_TX0   => 0,
       PIO0_TX1   => 1,
       PIO0_TX2   => 2,
       PIO0_TX3   => 3,
       PIO0_RX0   => 4,
       PIO0_RX1   => 5,
       PIO0_RX2   => 6,
       PIO0_RX3   => 7,
       PIO1_TX0   => 8,
       PIO1_TX1   => 9,
       PIO1_TX2   => 10,
       PIO1_TX3   => 11,
       PIO1_RX0   => 12,
       PIO1_RX1   => 13,
       PIO1_RX2   => 14,
       PIO1_RX3   => 15,
       PIO2_TX0   => 16,
       PIO2_TX1   => 17,
       PIO2_TX2   => 18,
       PIO2_TX3   => 19,
       PIO2_RX0   => 20,
       PIO2_RX1   => 21,
       PIO2_RX2   => 22,
       PIO2_RX3   => 23,
       SPI0_TX    => 24,
       SPI0_RX    => 25,
       SPI1_TX    => 26,
       SPI1_RX    => 27,
       UART0_TX   => 28,
       UART0_RX   => 29,
       UART1_TX   => 30,
       UART1_RX   => 31,
       PWM_WRAP0  => 32,
       PWM_WRAP1  => 33,
       PWM_WRAP2  => 34,
       PWM_WRAP3  => 35,
       PWM_WRAP4  => 36,
       PWM_WRAP5  => 37,
       PWM_WRAP6  => 38,
       PWM_WRAP7  => 39,
       PWM_WRAP8  => 40,
       PWM_WRAP9  => 41,
       PWM_WRAP10 => 42,
       PWM_WRAP11 => 43,
       I2C0_TX    => 44,
       I2C0_RX    => 45,
       I2C1_TX    => 46,
       I2C1_RX    => 47,
       ADC        => 48,
       XIP_STREAM => 49,
       XIP_QMITX  => 50,
       XIP_QMIRX  => 51,
       HSTX       => 52,
       CORESIGHT  => 53,
       SHA256     => 54,

       TIMER0     => 16#3B#,
       TIMER1     => 16#3C#,
       TIMER2     => 16#3D#,
       TIMER3     => 16#3E#,
       PERMANENT  => 16#3F#);

   type Address_Update is (Static, Increment, Decrement);

   type DMA_Configuration is record
      High_Priority   : Boolean := False;                   --  Schedule this channel before others
      Data_Size       : Transfer_Width := Transfer_8;       --  Bits per transfer (byte, halfword, word)
      Read_Address    : Address_Update := Static;           --  Increment read address after transfer
      Write_Address   : Address_Update := Static;           --  Increment write address after transfer
      Ring_Size       : UInt4 := 0;                         --  Ring buffer size
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

   type DMA_Transfer_Count is range 0 .. 2 ** 28 - 1
      with Size => 28;

   procedure Enable;

   procedure Configure
      (Channel : DMA_Channel_Id;
       Config  : DMA_Configuration);

   procedure Setup
      (Channel  : DMA_Channel_Id;
       From, To : System.Address;
       Count    : DMA_Transfer_Count);

   procedure Start
      (Channel : DMA_Channel_Id);
   --  Setup must be called before Start. If you call Start more than once and
   --  Increment_Read or Increment_Write are True, these pointers are *not*
   --  reset to their initial Setup values, unless you've configured the
   --  channel with Ring_Wrap and Ring_Size.

   procedure Start
      (Channel  : DMA_Channel_Id;
       From, To : System.Address;
       Count    : DMA_Transfer_Count);
   --  This version of Start performs the Setup for you.

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
      (Value : UInt32);

   function Checksum
      return UInt32;

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

   subtype DMA_Timer_Id is DMA_Request_Trigger range TIMER0 .. TIMER3;

   procedure Set_Pacing_Timer
      (Timer : DMA_Timer_Id;
       X, Y  : UInt16);
   --  The pacing timer produces TREQ assertions at a rate set by ((X/Y) *
   --  sys_clk). This equation is evaluated every sys_clk cycles and therefore
   --  can only generate TREQs at a rate of 1 per sys_clk (i.e. permanent TREQ)
   --  or less.

private

   type DMA_CTRL_Register is record
      EN             : Boolean := False;
      HIGH_PRIORITY  : Boolean := False;
      DATA_SIZE      : Transfer_Width := Transfer_8;
      INCR_READ      : Boolean := False;
      INCR_READ_REV  : Boolean := False;
      INCR_WRITE     : Boolean := False;
      INCR_WRITE_REV : Boolean := False;
      RING_SIZE      : UInt4 := 0;
      RING_SEL       : Ring_Wrap_Select := Wrap_Read;
      CHAIN_TO       : DMA_Channel_Id := 0;
      TREQ_SEL       : DMA_Request_Trigger := PERMANENT;
      IRQ_QUIET      : Boolean := False;
      BSWAP          : Boolean := False;
      SNIFF_EN       : Boolean := False;
      BUSY           : Boolean := False;
      WRITE_ERROR    : Boolean := False;
      READ_ERROR     : Boolean := False;
      AHB_ERROR      : Boolean := False;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Writers,
           Async_Readers,
           Object_Size => 32;
   for DMA_CTRL_Register use record
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
      WRITE_ERROR    at 0 range 29 .. 29;
      READ_ERROR     at 0 range 30 .. 30;
      AHB_ERROR      at 0 range 31 .. 31;
   end record;

   type DMA_TRANS_COUNT_Register is record
      MODE  : UInt4 := 0;
      COUNT : DMA_Transfer_Count := 0;
   end record
      with Volatile_Full_Access,
           Async_Readers,
           Async_Writers,
           Effective_Writes,
           Object_Size => 32;
   for DMA_TRANS_COUNT_Register use record
      MODE  at 0 range 28 .. 31;
      COUNT at 0 range 0 .. 27;
   end record;

   --  Enable the DMA peripheral
   type DMA_Channel_Register is record
      READ_ADDR            : System.Address;
      WRITE_ADDR           : System.Address;
      TRANS_COUNT          : DMA_TRANS_COUNT_Register;
      CTRL_TRIG            : DMA_CTRL_Register;

      AL1_CTRL             : DMA_CTRL_Register;
      AL1_READ_ADDR        : System.Address;
      AL1_WRITE_ADDR       : System.Address;
      AL1_TRANS_COUNT_TRIG : DMA_TRANS_COUNT_Register;

      AL2_CTRL             : DMA_CTRL_Register;
      AL2_READ_ADDR        : System.Address;
      AL2_WRITE_ADDR_TRIG  : System.Address;
      AL2_TRANS_COUNT      : DMA_TRANS_COUNT_Register;

      AL3_CTRL             : DMA_CTRL_Register;
      AL3_READ_ADDR_TRIG   : System.Address;
      AL3_WRITE_ADDR       : System.Address;
      AL3_TRANS_COUNT      : DMA_TRANS_COUNT_Register;
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
      CTDREQ : aliased RP2350_SVD.DMA.CH0_DBG_CTDREQ_Register;
      TCR    : UInt32;
   end record
      with Volatile, Size => 64;
   for DMA_Channel_Debug use record
      CTDREQ at 16#00# range 0 .. 31;
      TCR    at 16#04# range 0 .. 31;
   end record;

   type DMA_IRQ is record
      INTE : aliased RP2350_SVD.DMA.INTE0_Register;
      INTF : aliased RP2350_SVD.DMA.INTF0_Register;
      INTS : aliased RP2350_SVD.DMA.INTS0_Register;
   end record
      with Volatile, Size => 96;
   for DMA_IRQ use record
      INTE at 16#00# range 0 .. 31;
      INTF at 16#04# range 0 .. 31;
      INTS at 16#08# range 0 .. 31;
   end record;

   type DMA_Channels is array (DMA_Channel_Id) of DMA_Channel_Register
      with Volatile, Component_Size => 512;

   type DMA_Channels_Debug is array (DMA_Channel_Id) of DMA_Channel_Debug
      with Volatile, Component_Size => 64;

   type DMA_Timers is array (DMA_Timer_Id) of RP2350_SVD.DMA.TIMER_Register
      with Volatile, Component_Size => 32;

   type DMA_Peripheral is record
      CH                 : DMA_Channels;
      INTR               : aliased RP2350_SVD.DMA.INTR_Register;
      IRQ0               : DMA_IRQ;
      IRQ1               : DMA_IRQ;
      IRQ2               : DMA_IRQ;
      IRQ3               : DMA_IRQ;
      TIMER              : DMA_Timers;
      MULTI_CHAN_TRIGGER : aliased RP2350_SVD.DMA.MULTI_CHAN_TRIGGER_Register;
      SNIFF_CTRL         : aliased RP2350_SVD.DMA.SNIFF_CTRL_Register;
      SNIFF_DATA         : aliased UInt32;
      FIFO_LEVELS        : aliased RP2350_SVD.DMA.FIFO_LEVELS_Register;
      CHAN_ABORT         : aliased RP2350_SVD.DMA.CHAN_ABORT_Register;
      N_CHANNELS         : aliased RP2350_SVD.DMA.N_CHANNELS_Register;
      CH_DBG             : DMA_Channels_Debug;
   end record
      with Volatile;
   for DMA_Peripheral use record
      CH                 at 16#000# range 0 .. 8191;
      INTR               at 16#400# range 0 .. 31;
      IRQ0               at 16#404# range 0 .. 95;
      IRQ1               at 16#414# range 0 .. 95;
      IRQ2               at 16#424# range 0 .. 95;
      IRQ3               at 16#434# range 0 .. 95;
      TIMER              at 16#440# range 0 .. 127;
      MULTI_CHAN_TRIGGER at 16#450# range 0 .. 31;
      SNIFF_CTRL         at 16#454# range 0 .. 31;
      SNIFF_DATA         at 16#458# range 0 .. 31;
      FIFO_LEVELS        at 16#460# range 0 .. 31;
      CHAN_ABORT         at 16#464# range 0 .. 31;
      N_CHANNELS         at 16#468# range 0 .. 31;
      CH_DBG             at 16#800# range 0 .. 1023;
   end record;

   DMA_Periph : aliased DMA_Peripheral
      with Import, Address => RP2350_SVD.DMA_Base;

end RP.DMA;
