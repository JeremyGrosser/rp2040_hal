--
--  Copyright (C) 2022 Fabien Chouteau <fabien.chouteau@gmail.com>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP.PIO.WS2812_PIO;

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

      Freq           : constant := 800_000;
      Cycles_Per_Bit : constant := WS2812_PIO.T1 +
        WS2812_PIO.T2 + WS2812_PIO.T3;

      Bit_Per_LED : constant := 24;

   begin
      This.Pin.Configure (Output, Pull_Up, This.PIO.GPIO_Function);

      This.PIO.Load
         (Prog   => WS2812_PIO.Ws2812_Program_Instructions,
          Offset => ASM_Offset);

      This.PIO.Set_Pin_Direction (This.SM, This.Pin.Pin, Output);

      Set_Sideset (Config,
                   Bit_Count => 1,
                   Optional  => False,
                   Pindirs   => False);

      Set_Sideset_Pins (Config, Sideset_Base => This.Pin.Pin);

      Set_Out_Shift (Config,
                     Shift_Right    => False,
                     Autopull       => True,
                     Pull_Threshold => Bit_Per_LED);
      Set_FIFO_Join (Config,
                     Join_TX => True,
                     Join_RX => False);

      Set_Wrap (Config, ASM_Offset + WS2812_PIO.Ws2812_Wrap_Target,
                        ASM_Offset + WS2812_PIO.Ws2812_Wrap);

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
   begin
      Config.Trigger := This.PIO.DMA_TX_Trigger (This.SM);
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
      --  Data is shifted left (most signigicant first) from the FIFO by the PIO
      --  program, see Set_Out_Shift. The MSB of the 24-bit RGB data has to be
      --  bit 31 of the UInt32 that will go in the FIFO, therefore R, G and B
      --  are all shifted an extra 8 bits to the left.
      This.Data (Id) := Shift_Left (UInt32 (G), 16 + 8)
        or Shift_Left (UInt32 (R), 8 + 8)
        or Shift_Left (UInt32 (B), 0 + 8);
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

         case Region is
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
