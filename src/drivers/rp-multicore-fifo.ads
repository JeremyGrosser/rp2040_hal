--
--  Copyright (C) 2022 Fabien Chouteau <fabien.chouteau@gmail.com>
--
--  SPDX-License-Identifier: BSD-3-Clause
--

with HAL;

package RP.Multicore.FIFO
   with Preelaborate
is

   function RX_Ready return Boolean;
   function TX_Ready return Boolean;

   procedure Push_Blocking (V : HAL.UInt32);
   function Pop_Blocking return HAL.UInt32;

   function Try_Push (V : HAL.UInt32) return Boolean;
   function Try_Pop (V : out HAL.UInt32) return Boolean;

   procedure Drain;

   --  The FIFO subprograms are likely to be used in core synchronization code,
   --  for instance to prevent one core to access the XIP flash when the or is
   --  writing to it. This kind of code will be located in RAM, therefore we
   --  mark the subprograms Inline_Always so that they are located in the same
   --  section as the code calling them.
   pragma Inline_Always (RX_Ready);
   pragma Inline_Always (TX_Ready);
   pragma Inline_Always (Push_Blocking);
   pragma Inline_Always (Pop_Blocking);
   pragma Inline_Always (Try_Push);
   pragma Inline_Always (Try_Pop);
   pragma Inline_Always (Drain);

end RP.Multicore.FIFO;
