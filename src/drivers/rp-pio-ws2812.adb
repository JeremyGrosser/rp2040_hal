--
--  Copyright (C) 2022 Fabien Chouteau <fabien.chouteau@gmail.com>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP.PIO.WS2812_PIO_ASM;

package body RP.PIO.WS2812 is

   -----------------
   -- Initialized --
   -----------------

   function Initialized (This : Strip) return Boolean
   is (This.Initialized);

   -----------------
   -- DMA_Enabled --
   -----------------

   function DMA_Enabled (This : Strip) return Boolean
   is (This.DMA_Ready);

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize  (This       : in out Strip;
                          ASM_Offset :        PIO_Address := 0)
   is
      Config         : PIO_SM_Config := Default_SM_Config;

      Freq           : constant := 80_0000;
      Cycles_Per_Bit : constant := WS2812_PIO_ASM.T1 +
        WS2812_PIO_ASM.T2 + WS2812_PIO_ASM.T3;

      Bit_Per_LED : constant := 24;

   begin
      This.Pin.Configure (Output, Pull_Up, This.PIO.GPIO_Function);
      This.PIO.Enable;

      This.PIO.Load
         (Prog   => WS2812_PIO_ASM.Ws2812_Program_Instructions,
          Offset => ASM_Offset);

      This.PIO.Set_Pin_Direction (This.SM, This.Pin.Pin, Output);

      Set_Sideset (Config,
                   Bit_Count => 1,
                   Optional  => False,
                   Pindirs   => False);

      Set_Sideset_Pins (Config, Sideset_Base => This.Pin.Pin);

      Set_Out_Shift (Config,
                     Shift_Right    => True,
                     Autopull       => True,
                     Pull_Threshold => Bit_Per_LED);
      Set_FIFO_Join (Config,
                     Join_TX => True,
                     Join_RX => False);

      Set_Wrap (Config, ASM_Offset + WS2812_PIO_ASM.Ws2812_Wrap_Target,
                        ASM_Offset + WS2812_PIO_ASM.Ws2812_Wrap);

      Set_Clock_Frequency (Config, Freq * Cycles_Per_Bit);

      This.PIO.SM_Initialize (This.SM, ASM_Offset, Config);
      This.PIO.Set_Enabled (This.SM, True);

      This.Initialized := True;
   end Initialize;

   ----------------
   -- Enable_DMA --
   ----------------

   procedure Enable_DMA (This : in out Strip;
                         Chan : RP.DMA.DMA_Channel_Id)
   is
      use RP.DMA;
      Config : DMA_Configuration;

      Trigger : constant RP.DMA.DMA_Request_Trigger :=
        (case This.PIO.Num is
            when 0 => (case This.SM is
                          when 0 => RP.DMA.PIO0_TX0,
                          when 1 => RP.DMA.PIO0_TX1,
                          when 2 => RP.DMA.PIO0_TX2,
                          when 3 => RP.DMA.PIO0_TX3),
            when 1 => (case This.SM is
                          when 0 => RP.DMA.PIO1_TX0,
                          when 1 => RP.DMA.PIO1_TX1,
                          when 2 => RP.DMA.PIO1_TX2,
                          when 3 => RP.DMA.PIO1_TX3));
   begin

      Config.Trigger := Trigger;
      Config.Data_Size := Transfer_32;
      Config.Increment_Read := True;
      Config.Increment_Write := False;

      RP.DMA.Configure (Chan, Config);

      This.DMA_Chan := Chan;
      This.DMA_Ready := True;
   end Enable_DMA;

   -----------------
   -- Disable_DMA --
   -----------------

   procedure Disable_DMA (This : in out Strip)
   is
   begin
      This.DMA_Ready := False;
   end Disable_DMA;

   -----------
   -- Clear --
   -----------

   procedure Clear (This : in out Strip) is
   begin
      This.Data := (others => 0);
   end Clear;

   -------------
   -- Set_RGB --
   -------------

   procedure Set_RGB (This : in out Strip; Id : Positive; R, G, B : HAL.UInt8)
   is
   begin
      This.Data (Id) := Shift_Left (UInt32 (B), 16)
        or Shift_Left (UInt32 (R), 8)
        or Shift_Left (UInt32 (G), 0);
   end Set_RGB;

   -------------
   -- Set_HSV --
   -------------

   procedure Set_HSV (This : in out Strip; Id : Positive; H, S, V : HAL.UInt8)
   is
      R, G, B : UInt8;

      Region, Remainder : UInt32;
      P, Q, T : UInt8;
   begin
      if S = 0 then
         R := V;
         G := V;
         B := V;
      else

         Region := UInt32 (H / 43);
         Remainder := (UInt32 (H) - (Region * 43)) * 6;

         P := UInt8 (Shift_Right (UInt32 (V) * (255 - UInt32 (S)), 8));

         Q := UInt8 (Shift_Right (UInt32 (V) *
                     (255 - Shift_Right (UInt32 (S) * Remainder, 8)), 8));

         T := UInt8 (Shift_Right (UInt32 (V) *
                     (255 - Shift_Right (UInt32 (S) *
                        (255 - Remainder), 8)), 8));

         case (Region) is
            when      0 => R := V; G := T; B := P;
            when      1 => R := Q; G := V; B := P;
            when      2 => R := P; G := V; B := T;
            when      3 => R := P; G := Q; B := V;
            when      4 => R := T; G := P; B := V;
            when others => R := V; G := P; B := Q;
         end case;
      end if;

      Set_RGB (This, Id, R, G, B);
   end Set_HSV;

   ------------
   -- Update --
   ------------

   procedure Update (This     : aliased Strip;
                     Blocking :         Boolean := False)
   is
   begin
      if This.DMA_Ready then

         if RP.DMA.Busy (This.DMA_Chan) then
            --  Previous DMA transfer still in progress
            if Blocking then
               while RP.DMA.Busy (This.DMA_Chan) loop
                  null;
               end loop;
            else
               return;
            end if;
         end if;

         RP.DMA.Start (Channel => This.DMA_Chan,
                       From    => This.Data'Address,
                       To      => This.PIO.TX_FIFO_Address (This.SM),
                       Count   => This.Data'Length);
      else
         This.PIO.Put (This.SM, This.Data);
      end if;
   end Update;

end RP.PIO.WS2812;
