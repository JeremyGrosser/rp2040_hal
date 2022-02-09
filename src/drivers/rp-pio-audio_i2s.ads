--
--  Copyright 2021 (C) Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP.DMA; use RP.DMA;
with RP.GPIO;

with HAL.Audio;
with HAL;

package RP.PIO.Audio_I2S is

   --  There is only one LRCLK signal, so any more than two channels will need
   --  some external multiplexing logic.
   subtype Channel_Count is Positive range 1 .. 2;

   type I2S_Device
      (Data        : not null access RP.GPIO.GPIO_Point;
       BCLK        : not null access RP.GPIO.GPIO_Point;
       LRCLK       : not null access RP.GPIO.GPIO_Point;
       PIO         : not null access RP.PIO.PIO_Device'Class;
       SM          : RP.PIO.PIO_SM;
       Channels    : Channel_Count;
       DMA_Channel : DMA_Channel_Id;
       Buffer_Size : Positive)
   is limited new HAL.Audio.Audio_Stream with private;

   procedure Initialize
      (This      : in out I2S_Device;
       Frequency : HAL.Audio.Audio_Frequency;
       Channels  : Channel_Count := 1);

   overriding
   procedure Set_Frequency
      (This      : in out I2S_Device;
       Frequency : HAL.Audio.Audio_Frequency);

   --  Copies Data into the buffer and starts a DMA transfer. If a DMA transfer
   --  is already in progress, Transmit will wait for it to finish before
   --  modifying the buffer.
   overriding
   procedure Transmit
      (This : in out I2S_Device;
       Data : HAL.Audio.Audio_Buffer)
    with Pre => Data'Length <= This.Buffer_Size;

   --  The PIO program currently does not support I2S receive. This function
   --  will block on RX FIFO forever.
   overriding
   procedure Receive
      (This : in out I2S_Device;
       Data : out HAL.Audio.Audio_Buffer);

private

   --  Init copied from audio_i2s.pio and translated to Ada
   procedure Program_Init
      (This   : in out I2S_Device;
       Offset : PIO_Address);

   type I2S_Device
      (Data        : not null access RP.GPIO.GPIO_Point;
       BCLK        : not null access RP.GPIO.GPIO_Point;
       LRCLK       : not null access RP.GPIO.GPIO_Point;
       PIO         : not null access PIO_Device'Class;
       SM          : PIO_SM;
       Channels    : Channel_Count;
       DMA_Channel : DMA_Channel_Id;
       Buffer_Size : Positive)
   is limited new HAL.Audio.Audio_Stream with record
      Config : PIO_SM_Config;
      Buffer : aliased HAL.Audio.Audio_Buffer (1 .. Buffer_Size);
   end record;

end RP.PIO.Audio_I2S;
