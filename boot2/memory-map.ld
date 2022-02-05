/*
 * Copyright (C) 2021 Daniel King <damaki.gh@gmail.com>
 *
 * SPDX-License-Identifier: BSD-3-Clause
*/
 
/* The stage 2 bootloader must fit in 256 bytes. 
 * The last 4 bytes are reserved for the CRC32
 */
 MEMORY {
    SRAM(rx) : ORIGIN = 0x20041f00, LENGTH = 252
}

ENTRY(_boot2_entry)

SECTIONS {
    . = ORIGIN(SRAM);
    .text : {
        *(.entry)
        *(.text)
    } >SRAM
}
