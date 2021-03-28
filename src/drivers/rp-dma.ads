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

   type DMA_Configuration is record
      High_Priority   : Boolean := False;
      Data_Size       : Transfer_Width := Transfer_8;
      Increment_Read  : Boolean := False;
      Increment_Write : Boolean := False;
      Ring_Size       : HAL.UInt4 := 0;
      Ring_Wrap       : Ring_Wrap_Select := Wrap_Read;
      Chain_To        : DMA_Channel_Id := 0;
      Trigger         : DMA_Request_Trigger := PERMANENT;
      Quiet           : Boolean := False;
      Byte_Swap       : Boolean := False;
      Sniff           : Boolean := False;
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
      (Channel  : DMA_Channel_Id;
       Config   : DMA_Configuration;
       From, To : System.Address;
       Count    : HAL.UInt32);

   procedure Start
      (Channel : DMA_Channel_Id);

   procedure Stop
      (Channel : DMA_Channel_Id);

   function Status
      (Channel : DMA_Channel_Id)
      return DMA_Status;

   function Complete
      (Channel : DMA_Channel_Id)
      return Boolean;

private

   type DMA_CTRL_TRIG_Register is record
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
           Size => 32;
   for DMA_CTRL_TRIG_Register use record
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
      READ_ADDR   : aliased System.Address;
      WRITE_ADDR  : aliased System.Address;
      TRANS_COUNT : aliased HAL.UInt32;
      CTRL_TRIG   : aliased DMA_CTRL_TRIG_Register;
   end record
      with Size => 32 * 4;

   for DMA_Channel_Register use record
      READ_ADDR   at 16#00# range 0 .. 31;
      WRITE_ADDR  at 16#04# range 0 .. 31;
      TRANS_COUNT at 16#08# range 0 .. 31;
      CTRL_TRIG   at 16#0C# range 0 .. 31;
   end record;

   type DMA_Channel_Debug is record
      CTDREQ : aliased RP2040_SVD.DMA.CH0_DBG_CTDREQ_Register;
      TCR    : aliased HAL.UInt32;
   end record
      with Size => 32 * 2;

   type DMA_IRQ is record
      INTE : aliased RP2040_SVD.DMA.INTE0_Register;
      INTF : aliased RP2040_SVD.DMA.INTF0_Register;
      INTS : aliased RP2040_SVD.DMA.INTS0_Register;
   end record
      with Size => 3 * 32;

   for DMA_IRQ use record
      INTE at 16#00# range 0 .. 31;
      INTF at 16#04# range 0 .. 31;
      INTS at 16#08# range 0 .. 31;
   end record;

   type DMA_Channels is array (DMA_Channel_Id) of DMA_Channel_Register
      with Pack, Size => 12 * 32 * 4;

   type DMA_Channels_Debug is array (DMA_Channel_Id) of DMA_Channel_Debug
      with Pack, Size => 12 * 64;

   type DMA_IRQs is array (0 .. 1) of DMA_IRQ
      with Pack, Size => 2 * 3 * 32;

   type DMA_Timers is array (0 .. 1) of RP2040_SVD.DMA.TIMER_Register;

   type DMA_Peripheral is record
      CH                 : DMA_Channels;
      INTR               : aliased RP2040_SVD.DMA.INTR_Register;
      IRQ                : DMA_IRQs;
      TIMER0             : aliased RP2040_SVD.DMA.TIMER_Register;
      TIMER1             : aliased RP2040_SVD.DMA.TIMER_Register;
      MULTI_CHAN_TRIGGER : aliased RP2040_SVD.DMA.MULTI_CHAN_TRIGGER_Register;
      SNIFF_CTRL         : aliased RP2040_SVD.DMA.SNIFF_CTRL_Register;
      SNIFF_DATA         : aliased HAL.UInt32;
      FIFO_LEVELS        : aliased RP2040_SVD.DMA.FIFO_LEVELS_Register;
      CHAN_ABORT         : aliased RP2040_SVD.DMA.CHAN_ABORT_Register;
      N_CHANNELS         : aliased RP2040_SVD.DMA.N_CHANNELS_Register;
      CH_DBG             : DMA_Channels_Debug;
   end record;

   DMA_Periph : aliased DMA_Peripheral
      with Import, Address => RP2040_SVD.DMA_Base;

end RP.DMA;
