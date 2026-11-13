--
--  Copyright 2021 (C) Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--

with Cortex_M.NVIC;

with HAL; use HAL;
with RP.Reset;

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
          INCR_READ     => Config.Read_Address = Increment,
          INCR_WRITE    => Config.Write_Address = Increment,
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

   procedure Setup
      (Channel  : DMA_Channel_Id;
       From, To : System.Address;
       Count    : DMA_Transfer_Count)
   is
   begin
      DMA_Periph.CH (Channel).READ_ADDR := From;
      DMA_Periph.CH (Channel).WRITE_ADDR := To;
      DMA_Periph.CH (Channel).TRANS_COUNT := Count;
   end Setup;

   procedure Start
      (Channel : DMA_Channel_Id)
   is
   begin
      DMA_Periph.CH (Channel).CTRL_TRIG.EN := True;
   end Start;

   procedure Start
      (Channel  : DMA_Channel_Id;
       From, To : System.Address;
       Count    : DMA_Transfer_Count)
   is
   begin
      Setup (Channel, From, To, Count);
      Start (Channel);
   end Start;

   function Busy
      (Channel : DMA_Channel_Id)
      return Boolean
   is
      DP : aliased DMA_Peripheral
         with Import, Address => System'To_Address (16#5000_0000#);
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
      CALC : constant array (Checksum_Algorithm) of UInt4 :=
         (CRC_32  => 0,
          CRC_32R => 1,
          CRC_16  => 2,
          CRC_16R => 3,
          EVEN    => 14,
          SUM     => 15);
   begin
      DMA_Periph.SNIFF_CTRL :=
         (EN      => True,
          DMACH   => UInt4 (Channel),
          CALC    => CALC (Algorithm),
          BSWAP   => Byte_Swap,
          OUT_REV => Reversed,
          OUT_INV => Inverted);
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
      Mask : constant UInt32 := Shift_Left (UInt32 (1), Natural (Channel));

      Line : constant Cortex_M.NVIC.Interrupt_ID :=
        (case IRQ is
            when 0 => 11,   --  DMA_IRQ_0
            when 1 => 12);  --  DMA_IRQ_1

   begin
      case IRQ is
         when 0 =>
            DMA_Periph.IRQ0.INTE :=
              DMA_Periph.IRQ0.INTE or Mask;
         when 1 =>
            DMA_Periph.IRQ1.INTE :=
              DMA_Periph.IRQ1.INTE or Mask;
      end case;

      Cortex_M.NVIC.Clear_Pending (Line);
      Cortex_M.NVIC.Enable_Interrupt (Line);
   end Enable_IRQ;

   -----------------
   -- Disable_IRQ --
   -----------------

   procedure Disable_IRQ (Channel : DMA_Channel_Id;
                          IRQ     : DMA_IRQ_Id)
   is
      Mask : constant UInt32 := Shift_Left (UInt32 (1), Natural (Channel));
   begin
      case IRQ is
         when 0 =>
            DMA_Periph.IRQ0.INTE :=
              DMA_Periph.IRQ0.INTE and (not Mask);
         when 1 =>
            DMA_Periph.IRQ1.INTE :=
              DMA_Periph.IRQ1.INTE and (not Mask);
      end case;
   end Disable_IRQ;

   -------------
   -- Ack_IRQ --
   -------------

   procedure Ack_IRQ (Channel : DMA_Channel_Id;
                      IRQ     : DMA_IRQ_Id)
   is
      Mask : constant UInt32 := Shift_Left (UInt32 (1), Natural (Channel));
   begin
      case IRQ is
         when 0 =>
            DMA_Periph.IRQ0.INTS := Mask;
         when 1 =>
            DMA_Periph.IRQ1.INTS := Mask;
      end case;
   end Ack_IRQ;

   ----------------
   -- IRQ_Status --
   ----------------

   function IRQ_Status (Channel : DMA_Channel_Id;
                        IRQ     : DMA_IRQ_Id)
                        return Boolean
   is
      Mask : constant UInt32 := Shift_Left (UInt32 (1), Natural (Channel));
   begin
      case IRQ is
         when 0 =>
            return (DMA_Periph.IRQ0.INTS and Mask) /= 0;
         when 1 =>
            return (DMA_Periph.IRQ1.INTS and Mask) /= 0;
      end case;
   end IRQ_Status;

   procedure Set_Pacing_Timer
      (Timer : DMA_Timer_Id;
       X, Y  : HAL.UInt16)
   is
   begin
      DMA_Periph.TIMER (Timer) :=
         (Y => Y,
          X => X);
   end Set_Pacing_Timer;

end RP.DMA;
