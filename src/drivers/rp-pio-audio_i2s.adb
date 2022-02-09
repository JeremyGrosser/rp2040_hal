--
--  Copyright 2021 (C) Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP.PIO.Audio_I2S_PIO;
with Interfaces;

package body RP.PIO.Audio_I2S is

   procedure Program_Init
      (This   : in out I2S_Device;
       Offset : PIO_Address)
   is
   begin
      This.Config := Default_SM_Config;
      Set_Out_Pins (This.Config, This.Data.Pin, 1);
      Set_Sideset_Pins (This.Config, This.BCLK.Pin);
      Set_Sideset (This.Config,
         Bit_Count => 2,
         Optional  => False,
         Pindirs   => False);
      Set_Out_Shift (This.Config,
         Shift_Right    => False,
         Autopull       => True,
         Pull_Threshold => 32);
      Set_Wrap (This.Config,
          Wrap        => Offset + RP.PIO.Audio_I2S_PIO.Audio_I2s_Wrap,
          Wrap_Target => Offset + RP.PIO.Audio_I2S_PIO.Audio_I2s_Wrap_Target);

      SM_Initialize (This.PIO.all, This.SM, Offset, This.Config);

      Set_Pin_Direction (This.PIO.all, This.SM, This.Data.Pin, Output);
      Set_Pin_Direction (This.PIO.all, This.SM, This.BCLK.Pin, Output);
      Set_Pin_Direction (This.PIO.all, This.SM, This.LRCLK.Pin, Output);

      Execute (This.PIO.all, This.SM, PIO_Instruction (Offset + RP.PIO.Audio_I2S_PIO.Offset_entry_point));
   end Program_Init;

   overriding
   procedure Set_Frequency
      (This      : in out I2S_Device;
       Frequency : HAL.Audio.Audio_Frequency)
   is
      Sample_Rate       : constant Hertz :=
         Hertz (HAL.Audio.Audio_Frequency'Enum_Rep (Frequency));
      Sample_Bits       : constant := 16;
      Cycles_Per_Sample : constant := 2;
   begin
      Set_Clock_Frequency (This.Config, Sample_Rate * Sample_Bits * This.Channels * Cycles_Per_Sample);
      Set_Config (This.PIO.all, This.SM, This.Config);
   end Set_Frequency;

   procedure Initialize
      (This      : in out I2S_Device;
       Frequency : HAL.Audio.Audio_Frequency;
       Channels  : Channel_Count := 1)
   is
      use RP.DMA;
      DMA_Config : DMA_Configuration :=
         (Increment_Read => True,
          others         => <>);
      SM_Offset  : constant PIO_Address := 0;
      AF         : constant RP.GPIO.GPIO_Function := RP.PIO.GPIO_Function (This.PIO.all);
   begin
      RP.DMA.Enable;
      This.Data.Configure (Output, Pull_Both, AF);
      This.BCLK.Configure (Output, Pull_Both, AF);
      This.LRCLK.Configure (Output, Pull_Both, AF);

      Enable (This.PIO.all);
      Load (This.PIO.all,
          Prog   => RP.PIO.Audio_I2S_PIO.Audio_I2s_Program_Instructions,
          Offset => SM_Offset);

      Program_Init (This, SM_Offset);
      Set_Frequency (This, Frequency);
      Set_Enabled (This.PIO.all, This.SM, True);

      DMA_Config.Trigger := DMA_Request_Trigger'Val
         (DMA_Request_Trigger'Pos (PIO0_TX0) + (This.PIO.Num * 8) + Natural (This.SM));
      if Channels = 1 then
         DMA_Config.Data_Size := Transfer_16;
      else
         DMA_Config.Data_Size := Transfer_32;
      end if;
      RP.DMA.Configure (This.DMA_Channel, DMA_Config);
   end Initialize;

   overriding
   procedure Transmit
      (This : in out I2S_Device;
       Data : HAL.Audio.Audio_Buffer)
   is
      Count : HAL.UInt32 := Data'Length;
   begin
      --  Wait for previous DMA transfer to finish before modifying the buffer.
      while RP.DMA.Busy (This.DMA_Channel) loop
         null;
      end loop;

      This.Buffer (1 .. Data'Length) := Data;

      if This.Channels > 1 then
         Count := Data'Length / 2;
      end if;

      RP.DMA.Start
         (Channel => This.DMA_Channel,
          From    => This.Buffer'Address,
          To      => TX_FIFO_Address (This.PIO.all, This.SM),
          Count   => Count);
   end Transmit;

   overriding
   procedure Receive
      (This : in out I2S_Device;
       Data : out HAL.Audio.Audio_Buffer)
   is
      D : UInt32;
   begin
      for I in Data'Range loop
         Get (This.PIO.all, This.SM, D);
         Data (I) := Interfaces.Integer_16 (D);
      end loop;
   end Receive;

end RP.PIO.Audio_I2S;
