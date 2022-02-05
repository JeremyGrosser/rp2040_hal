/*
 *  Copyright (C) 2021 Daniel King <damaki.gh@gmail.com>
 *
 *  SPDX-License-Identifier: BSD-3-Clause
 */

.syntax unified
.cpu cortex-m0
.thumb

/* This is the entry point to the stage 2 bootloader.
 * This is a wrapper around the Ada code to correctly
 * handle the LR register and vectoring into the
 * flash vector table. */
.section .text
.global _boot2_entry
_boot2_entry:

    /* Preserve LR during call to the Ada code for comparison later */
    push {lr}
    bl _ada_boot2
    pop {r1}

    /* LR is 0 if boot2 is being called by the bootrom.
     * Otherwise, it is a regular function call. */
    cmp r1, #0
    bne return

    /* Load the vector table address into the Cortex-M0+ VTOR register */
    ldr r0, =0x10000100 /* vector table is located after boot2 in XIP */
    ldr r1, =0xe000ed08 /* M0PLUS_VTOR register */
    str r0, [r1]

    /* Load the stack pointer and reset vector from the vector table */
    ldmia r0, {r0, r1}
    msr msp, r0

return:
    bx r1
