--
--  Copyright (C) 2022 Fabien Chouteau <fabien.chouteau@gmail.com>
--
--  SPDX-License-Identifier: BSD-3-Clause
--

with RP2040_SVD.SIO; use RP2040_SVD.SIO;

with System.Machine_Code; use System.Machine_Code;

package body RP.Multicore.FIFO is

   --------------
   -- RX_Ready --
   --------------

   function RX_Ready return Boolean is
   begin
      return SIO_Periph.FIFO_ST.VLD;
   end RX_Ready;

   --------------
   -- TX_Ready --
   --------------

   function TX_Ready return Boolean is
   begin
      return SIO_Periph.FIFO_ST.RDY;
   end TX_Ready;

   -------------------
   -- Push_Blocking --
   -------------------

   procedure Push_Blocking (V : HAL.UInt32) is
   begin
      loop
         exit when TX_Ready;
      end loop;
      SIO_Periph.FIFO_WR := V;

      System.Machine_Code.Asm ("sev", Volatile => True);
   end Push_Blocking;

   ------------------
   -- Pop_Blocking --
   ------------------

   function Pop_Blocking return HAL.UInt32 is
   begin
      while not RX_Ready loop

         System.Machine_Code.Asm ("wfe", Volatile => True);

      end loop;
      return SIO_Periph.FIFO_RD;
   end Pop_Blocking;

   --------------
   -- Try_Push --
   --------------

   function Try_Push (V : HAL.UInt32) return Boolean is
   begin
      if TX_Ready then
         SIO_Periph.FIFO_WR := V;

         System.Machine_Code.Asm ("sev", Volatile => True);

         return True;
      else
         return False;
      end if;
   end Try_Push;

   -------------
   -- Try_Pop --
   -------------

   function Try_Pop (V : out HAL.UInt32) return Boolean is
   begin
      if RX_Ready then
         V := SIO_Periph.FIFO_RD;
         return True;
      else
         return False;
      end if;
   end Try_Pop;

   -----------
   -- Drain --
   -----------

   procedure Drain is
      Discard : HAL.UInt32;
   begin
      while RX_Ready loop
         Discard := SIO_Periph.FIFO_RD;
      end loop;
   end Drain;

end RP.Multicore.FIFO;
