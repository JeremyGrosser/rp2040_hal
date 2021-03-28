with RP2040_SVD.RESETS;

package body RP.DMA is
   use HAL;

   procedure Enable is
      use RP2040_SVD.RESETS;
   begin
      RESETS_Periph.RESET.dma := False;
      while not RESETS_Periph.RESET_DONE.dma loop
         null;
      end loop;
   end Enable;

   procedure Configure
      (Channel  : DMA_Channel_Id;
       Config   : DMA_Configuration;
       From, To : System.Address;
       Count    : UInt32)
   is
   begin
      DMA_Periph.CH (Channel) :=
         (READ_ADDR   => From,
          WRITE_ADDR  => To,
          CTRL_TRIG   => (
             EN            => False,
             HIGH_PRIORITY => Config.High_Priority,
             DATA_SIZE     => Config.Data_Size,
             INCR_READ     => Config.Increment_Read,
             INCR_WRITE    => Config.Increment_Write,
             RING_SIZE     => Config.Ring_Size,
             RING_SEL      => Config.Ring_Wrap,
             CHAIN_TO      => Config.Chain_To,
             TREQ_SEL      => Config.Trigger,
             IRQ_QUIET     => Config.Quiet,
             BSWAP         => Config.Byte_Swap,
             SNIFF_EN      => Config.Sniff,
             others        => <>),
          others => <>);
      DMA_Periph.CH (Channel).TRANS_COUNT := Count;
   end Configure;

   procedure Start
      (Channel : DMA_Channel_Id)
   is
   begin
      DMA_Periph.CH (Channel).CTRL_TRIG.EN := True;
   end Start;

   procedure Stop
      (Channel : DMA_Channel_Id)
   is
   begin
      DMA_Periph.CH (Channel).CTRL_TRIG.EN := False;
   end Stop;

   function Status
      (Channel : DMA_Channel_Id)
      return DMA_Status
   is
      ((Enabled             => DMA_Periph.CH (Channel).CTRL_TRIG.EN,
        Busy                => DMA_Periph.CH (Channel).CTRL_TRIG.BUSY,
        Write_Error         => DMA_Periph.CH (Channel).CTRL_TRIG.WRITE_ERROR,
        Read_Error          => DMA_Periph.CH (Channel).CTRL_TRIG.READ_ERROR,
        AHB_Error           => DMA_Periph.CH (Channel).CTRL_TRIG.AHB_ERROR,
        Transfers_Remaining => Natural (DMA_Periph.CH (Channel).TRANS_COUNT)));

   function Complete
      (Channel : DMA_Channel_Id)
      return Boolean
   is (DMA_Periph.CH (Channel).TRANS_COUNT = 0);

end RP.DMA;
