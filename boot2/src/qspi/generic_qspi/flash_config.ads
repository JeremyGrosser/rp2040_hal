--
--  Copyright (C) 2021 Daniel King <damaki.gh@gmail.com>
--
--  SPDX-License-Identifier: BSD-3-Clause
--

with Interfaces; use Interfaces;

--  This configuration is compatible with most flash devices, except for
--  legacy Winbond devices (e.g. W25Q80DV). The following devices are
--  supported:
--    AT25SF128A
--    GD25Q64C
--    IS25LP128F
--    W25Q16JV
--    W25Q32JV
--    W25Q64JV
--    W25Q128JV
package Flash_Config with
  No_Elaboration_Code_All
is

   --  Use the generic procedure to check and set the QE bit.
   Use_Winbond_QE_Write_Procedure : constant Boolean := False;

   --  Configure max. SCLK speed of 62.5 MHz (133 MHz / 2).
   SSI_Clock_Divider : constant Unsigned_32 := 2;

   --  Number of dummy cycles for the Fast Read Quad I/O instruction.
   Fast_Read_Quad_IO_Dummy_Cycles : constant := 4;

   --  Value for the M[7:0] bits in the "Fast Read Quad I/O" command
   --  to put the device into "continuous read" mode
   Mode_Continuous_Read : constant Unsigned_32 := 16#A0#;

end Flash_Config;
