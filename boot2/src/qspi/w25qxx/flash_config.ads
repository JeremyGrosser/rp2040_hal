--
--  Copyright (C) 2021 Daniel King <damaki.gh@gmail.com>
--
--  SPDX-License-Identifier: BSD-3-Clause
--

with Interfaces; use Interfaces;

--  This configuration is compatible with Winbond devices only:
--  W25Q80DV
--  W25Q16JV
--  W25Q32JV
--  W25Q64JV
--  W25Q128JV
package Flash_Config with
  No_Elaboration_Code_All
is

   --  Older Winbond devices have the QE bit in Status Register 2, but don't
   --  support the "write status register 2" (31h) instruction.
   --  So be compatible with these parts we write to SR2 via a continuous write
   --  to SR1.
   --
   --  Note that newer Winbond parts (e.g. the W25Q16JV) support this legacy
   --  feature, whereas other non-Winbond devices (e.g. the AT25S128A) do not
   --  support this way of writing to SR2.
   Use_Winbond_QE_Write_Procedure : constant Boolean := True;

   --  Clock divider to use. This must not cause the clock speed to exceed
   --  the max. SCLK frequency supported by the flash chip. For the W25QxxDV,
   --  this is 80 MHz (at max. temperature). With a /2 divider, the max. speed
   --  is 133 MHz /2 = 66 MHz.
   SSI_Clock_Divider : constant Unsigned_32 := 2;

   --  Number of dummy cycles for the Fast Read Quad I/O instruction.
   Fast_Read_Quad_IO_Dummy_Cycles : constant := 4;

   --  Value for the M[7:0] bits in the "Fast Read Quad I/O" command
   --  to put the device into "continuous read" mode
   Mode_Continuous_Read : constant Unsigned_32 := 16#A0#;

end Flash_Config;
