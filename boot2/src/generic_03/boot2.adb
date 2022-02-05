--
--  Copyright (C) 2021 Daniel King <damaki.gh@gmail.com>
--
--  SPDX-License-Identifier: BSD-3-Clause
--

--  The SSI cannot be configured while enabled, so the boot ROM copies the
--  first 256 bytes of flash (referred to by the linker as .boot2) to SRAM and
--  executes it. This procedure should disable SSI, configure it for the flash
--  chip in use, re-enable SSI, then jump to the reset vector in XIP memory.
--
--  This is the generic version for all SPI flash chips that respond to the
--  0x03 read command.
with Boot2_Generic_03; use Boot2_Generic_03;
with Registers;        use Registers;

procedure Boot2 is
begin
   --  Disable SSI
   XIP_SSI.Periph.SSIENR := 0;

   --  Configure SSI
   XIP_SSI.Periph.BAUDR      := XIP_SSI_BAUDR_Value;
   XIP_SSI.Periph.CTRLR0     := XIP_SSI_CTRLR0_Value;
   XIP_SSI.Periph.SPI_CTRLR0 := XIP_SSI_SPI_CTRLR0_Value;
   XIP_SSI.Periph.CTRLR1     := 0;

   --  Enable SSI
   XIP_SSI.Periph.SSIENR := 1;
end Boot2;
