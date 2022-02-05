--
--  Copyright (C) 2021 Daniel King <damaki.gh@gmail.com>
--
--  SPDX-License-Identifier: BSD-3-Clause
--

with Interfaces; use Interfaces;

package Boot2_Generic_03 with
  No_Elaboration_Code_All
is

   --  Be conservative with the divider to ensure that the max. SCLK
   --  frequency does not exceed the limit for the 03h read command.
   --  For example, the W25Q080 has a max. speed of 50 MHz.
   --  SCKDIV[15:0] = 4 (/4 clock divider)
   XIP_SSI_BAUDR_Value : constant Unsigned_32 := 16#0000_0004#;

   --  DFS[20:16]     = 31 (32-bit data frame size)
   --  SPI_FRF[22:21] = 0  (standard 1-bit SPI frame format)
   --  TMOD[9:8]      = 3  (EEPROM read mode)
   XIP_SSI_CTRLR0_Value : constant Unsigned_32 := 16#001F_0300#;

   --  TRANS_TYPE[1:0]    = 0 (1C1A mode)
   --  ADDR_L[5:2]        = 6 (address bits divided by 4)
   --  INST_L[9:8]        = 2 (8-bit instruction)
   --  WAIT_CYCLES[15:11] = 0
   --  XIP_CMD[31:24]     = 16#03# (SPI read command)
   XIP_SSI_SPI_CTRLR0_Value : constant Unsigned_32 := 16#0300_0218#;

end Boot2_Generic_03;
