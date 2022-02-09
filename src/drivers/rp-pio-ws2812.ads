--
--  Copyright (C) 2022 Fabien Chouteau <fabien.chouteau@gmail.com>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP.GPIO;
with RP.DMA;

package RP.PIO.WS2812 is

   type Strip (Number_Of_LEDs : Positive) is record
      Data        : HAL.UInt32_Array (1 .. Number_Of_LEDs);
      Initialized : Boolean := False;
      PIO         : PIO_Number;
      SM          : PIO_SM;
      DMA_Ready   : Boolean;
      DMA_Chan    : RP.DMA.DMA_Channel_Id;
   end record;

   function Initialized (This : Strip) return Boolean;
   function DMA_Enabled (This : Strip) return Boolean;

   procedure Initialize (This       : in out Strip;
                         Pin        : in out GPIO.GPIO_Point;
                         PIO        : in out PIO_Device;
                         SM         :        PIO_SM;
                         ASM_Offset :        PIO_Address := 0)
     with Post => Initialized (This);

   procedure Enable_DMA (This : in out Strip;
                         Chan : RP.DMA.DMA_Channel_Id)
     with Pre => Initialized (This),
         Post => Initialized (This) and then DMA_Enabled (This);

   procedure Disable_DMA (This : in out Strip)
     with Pre => Initialized (This) and then DMA_Enabled (This),
         Post => Initialized (This) and then not DMA_Enabled (This);

   procedure Clear (This : in out Strip);
   --  Turn off all LEDs

   procedure Set_RGB (This    : in out Strip;
                      Id      :        Positive;
                      R, G, B :        HAL.UInt8)
     with Pre => Id <= This.Number_Of_LEDs;

   procedure Set_HSV (This    : in out Strip;
                      Id      :        Positive;
                      H, S, V :        HAL.UInt8)
     with Pre => Id <= This.Number_Of_LEDs;

   procedure Update (This     : aliased Strip;
                     Blocking :         Boolean := False)
     with Pre => Initialized (This);

end RP.PIO.WS2812;
