--
--  Copyright 2021 (C) Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--

with Cortex_M.NVIC;

with HAL; use HAL;
with RP.Reset;

with RP2040_SVD.Interrupts;

package body RP.DMA is
   procedure Enable is
      use RP.Reset;
   begin
      Reset_Peripheral (Reset_DMA);
   end Enable;

   procedure Configure
      (Channel : DMA_Channel_Id;
       Config  : DMA_Configuration)
   is
   begin
      DMA_Periph.CH (Channel).AL1_CTRL :=
         (EN            => True,
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
          others        => <>);
   end Configure;

   procedure Disable
      (Channel : DMA_Channel_Id)
   is
   begin
      DMA_Periph.CH (Channel).AL1_CTRL.EN := False;
   end Disable;

   procedure Start
      (Channel  : DMA_Channel_Id;
       From, To : System.Address;
       Count    : HAL.UInt32)
   is
   begin
      DMA_Periph.CH (Channel).READ_ADDR := From;
      DMA_Periph.CH (Channel).WRITE_ADDR := To;
      DMA_Periph.CH (Channel).AL1_TRANS_COUNT_TRIG := Count;
   end Start;

   function Busy
      (Channel : DMA_Channel_Id)
      return Boolean
   is
   begin
      return DMA_Periph.CH (Channel).AL1_CTRL.BUSY;
   end Busy;

   function Status
      (Channel : DMA_Channel_Id)
      return DMA_Status
   is ((Enabled     => DMA_Periph.CH (Channel).AL1_CTRL.EN,
        Busy        => DMA_Periph.CH (Channel).AL1_CTRL.BUSY,
        Write_Error => DMA_Periph.CH (Channel).AL1_CTRL.WRITE_ERROR,
        Read_Error  => DMA_Periph.CH (Channel).AL1_CTRL.READ_ERROR,
        AHB_Error   => DMA_Periph.CH (Channel).AL1_CTRL.AHB_ERROR,
        Transfers_Remaining => Natural (DMA_Periph.CH (Channel).TRANS_COUNT)));

   procedure Enable_Checksum
      (Channel   : DMA_Channel_Id;
       Algorithm : Checksum_Algorithm;
       Byte_Swap : Boolean := False;
       Reversed  : Boolean := False;
       Inverted  : Boolean := False)
   is
   begin
      DMA_Periph.SNIFF_CTRL :=
         (EN      => True,
          DMACH   => RP2040_SVD.DMA.SNIFF_CTRL_DMACH_Field (Channel),
          CALC    => RP2040_SVD.DMA.SNIFF_CTRL_CALC_Field'Val
            (Checksum_Algorithm'Pos (Algorithm)),
          BSWAP   => Byte_Swap,
          OUT_REV => Reversed,
          OUT_INV => Inverted,
          others  => <>);
      DMA_Periph.CH (Channel).AL1_CTRL.SNIFF_EN := True;
   end Enable_Checksum;

   procedure Set_Checksum
      (Value : HAL.UInt32)
   is
   begin
      DMA_Periph.SNIFF_DATA := Value;
   end Set_Checksum;

   function Checksum
      return HAL.UInt32
   is (DMA_Periph.SNIFF_DATA);

   ----------------
   -- Enable_IRQ --
   ----------------

   procedure Enable_IRQ (Channel : DMA_Channel_Id;
                         IRQ     : DMA_IRQ_Id)
   is
      Mask : constant UInt16 := Shift_Left (UInt16 (1), Natural (Channel));

      Line : constant Cortex_M.NVIC.Interrupt_ID :=
        (case IRQ is
            when 0 => RP2040_SVD.Interrupts.DMA_IRQ_0_Interrupt,
            when 1 => RP2040_SVD.Interrupts.DMA_IRQ_1_Interrupt);

   begin
      DMA_Periph.IRQ (IRQ).INTE.INTE0 :=
        DMA_Periph.IRQ (IRQ).INTE.INTE0 or Mask;

      Cortex_M.NVIC.Clear_Pending (Line);
      Cortex_M.NVIC.Enable_Interrupt (Line);
   end Enable_IRQ;

   -----------------
   -- Disable_IRQ --
   -----------------

   procedure Disable_IRQ (Channel : DMA_Channel_Id;
                          IRQ     : DMA_IRQ_Id)
   is
      Mask : constant UInt16 := Shift_Left (UInt16 (1), Natural (Channel));
   begin
      DMA_Periph.IRQ (IRQ).INTE.INTE0 :=
        DMA_Periph.IRQ (IRQ).INTE.INTE0 and (not Mask);
   end Disable_IRQ;

   -------------
   -- Ack_IRQ --
   -------------

   procedure Ack_IRQ (Channel : DMA_Channel_Id;
                      IRQ     : DMA_IRQ_Id)
   is
      Mask : constant UInt16 := Shift_Left (UInt16 (1), Natural (Channel));
   begin
      DMA_Periph.IRQ (IRQ).INTS.INTS0 := Mask;
   end Ack_IRQ;

   ----------------
   -- IRQ_Status --
   ----------------

   function IRQ_Status (Channel : DMA_Channel_Id;
                        IRQ     : DMA_IRQ_Id)
                        return Boolean
   is
      Mask : constant UInt16 := Shift_Left (UInt16 (1), Natural (Channel));
   begin
      return (DMA_Periph.IRQ (IRQ).INTS.INTS0 and Mask) /= 0;
   end IRQ_Status;

end RP.DMA;
