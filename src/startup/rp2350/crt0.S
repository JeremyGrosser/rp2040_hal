.syntax unified
.cpu cortex-m33
.fpu fpv5-sp-d16
.thumb

.section .vectors, "ax"
.align 2

.global __vectors
__vectors:
.word __StackTop
.word _reset_handler
.word isr_nmi
.word isr_hardfault
.word isr_invalid
.word isr_invalid
.word isr_invalid
.word isr_invalid
.word isr_invalid
.word isr_invalid
.word isr_invalid
.word isr_svcall
.word isr_invalid
.word isr_invalid
.word isr_pendsv
.word isr_systick

.word isr_irq0
.word isr_irq1
.word isr_irq2
.word isr_irq3
.word isr_irq4
.word isr_irq5
.word isr_irq6
.word isr_irq7
.word isr_irq8
.word isr_irq9
.word isr_irq10
.word isr_irq11
.word isr_irq12
.word isr_irq13
.word isr_irq14
.word isr_irq15
.word isr_irq16
.word isr_irq17
.word isr_irq18
.word isr_irq19
.word isr_irq20
.word isr_irq21
.word isr_irq22
.word isr_irq23
.word isr_irq24
.word isr_irq25
.word isr_irq26
.word isr_irq27
.word isr_irq28
.word isr_irq29
.word isr_irq30
.word isr_irq31
.word isr_irq32
.word isr_irq33
.word isr_irq34
.word isr_irq35
.word isr_irq36
.word isr_irq37
.word isr_irq38
.word isr_irq39
.word isr_irq40
.word isr_irq41
.word isr_irq42
.word isr_irq43
.word isr_irq44
.word isr_irq45
.word isr_irq46
.word isr_irq47
.word isr_irq48
.word isr_irq49
.word isr_irq50
.word isr_irq51
.word isr_irq52
.word isr_irq53
.word isr_irq54
.word isr_irq55
.word isr_irq56
.word isr_irq57
.word isr_irq58
.word isr_irq59
.word isr_irq60
.word isr_irq61
.word isr_irq62
.word isr_irq63
.word isr_irq64
.word isr_irq65
.word isr_irq66
.word isr_irq67
.word isr_irq68
.word isr_irq69
.word isr_irq70
.word isr_irq71
.word isr_irq72
.word isr_irq73
.word isr_irq74
.word isr_irq75
.word isr_irq76
.word isr_irq77
.word isr_irq78
.word isr_irq79

.macro decl_isr_bkpt name
.weak \name
.type \name,%function
.thumb_func
\name:
    bkpt #0
.endm

.macro decl_isr name
.weak \name
.thumb_set \name,__gnat_irq_trap
.endm

decl_isr_bkpt isr_invalid
decl_isr_bkpt isr_nmi
decl_isr_bkpt isr_hardfault
decl_isr_bkpt isr_svcall
decl_isr_bkpt isr_pendsv
decl_isr_bkpt isr_systick

decl_isr isr_irq0
decl_isr isr_irq1
decl_isr isr_irq2
decl_isr isr_irq3
decl_isr isr_irq4
decl_isr isr_irq5
decl_isr isr_irq6
decl_isr isr_irq7
decl_isr isr_irq8
decl_isr isr_irq9
decl_isr isr_irq10
decl_isr isr_irq11
decl_isr isr_irq12
decl_isr isr_irq13
decl_isr isr_irq14
decl_isr isr_irq15
decl_isr isr_irq16
decl_isr isr_irq17
decl_isr isr_irq18
decl_isr isr_irq19
decl_isr isr_irq20
decl_isr isr_irq21
decl_isr isr_irq22
decl_isr isr_irq23
decl_isr isr_irq24
decl_isr isr_irq25
decl_isr isr_irq26
decl_isr isr_irq27
decl_isr isr_irq28
decl_isr isr_irq29
decl_isr isr_irq30
decl_isr isr_irq31
decl_isr isr_irq32
decl_isr isr_irq33
decl_isr isr_irq34
decl_isr isr_irq35
decl_isr isr_irq36
decl_isr isr_irq37
decl_isr isr_irq38
decl_isr isr_irq39
decl_isr isr_irq40
decl_isr isr_irq41
decl_isr isr_irq42
decl_isr isr_irq43
decl_isr isr_irq44
decl_isr isr_irq45
decl_isr isr_irq46
decl_isr isr_irq47
decl_isr isr_irq48
decl_isr isr_irq49
decl_isr isr_irq50
decl_isr isr_irq51
decl_isr isr_irq52
decl_isr isr_irq53
decl_isr isr_irq54
decl_isr isr_irq55
decl_isr isr_irq56
decl_isr isr_irq57
decl_isr isr_irq58
decl_isr isr_irq59
decl_isr isr_irq60
decl_isr isr_irq61
decl_isr isr_irq62
decl_isr isr_irq63
decl_isr isr_irq64
decl_isr isr_irq65
decl_isr isr_irq66
decl_isr isr_irq67
decl_isr isr_irq68
decl_isr isr_irq69
decl_isr isr_irq70
decl_isr isr_irq71
decl_isr isr_irq72
decl_isr isr_irq73
decl_isr isr_irq74
decl_isr isr_irq75
decl_isr isr_irq76
decl_isr isr_irq77
decl_isr isr_irq78
decl_isr isr_irq79

.section .binary_info_header, "a"
binary_info_header:
.word 0x7188ebf2
.word __binary_info_start
.word __binary_info_end
.word data_cpy_table
.word 0xe71aa390

# See RM: 5.1.5.1 Blocks
.section .embedded_block, "a"
.p2align 2
embedded_block:
.word 0xffffded3
.byte 0x42
.byte 0x1
# 51 "rp2_common/pico_crt0/embedded_start_block.inc.S"
.hword (0x1 << 0) | (0x2 << 4) | (0 << 8) | (1 << 12) | 0
# 97 "rp2_common/pico_crt0/embedded_start_block.inc.S"
.byte (0x80 | 0x7f)
.hword (embedded_block_end - embedded_block - 16 ) / 4
.byte 0
.word embedded_end_block - embedded_block
.word 0xab123579
embedded_block_end:

.section .reset, "ax"
# 328 "rp2_common/pico_crt0/crt0.S"
.type _entry_point,%function
.thumb_func
.global _entry_point
_entry_point:
# 362 "rp2_common/pico_crt0/crt0.S"
    ldr r0, =0x00


_enter_vtable_in_r0:
    ldr r1, =(0xe0000000 + 0x0000ed08)
    str r0, [r1]
    ldmia r0!, {r1, r2}
    msr msp, r1
    bx r2
# 379 "rp2_common/pico_crt0/crt0.S"
.type _reset_handler,%function
.thumb_func
_reset_handler:



    ldr r0, =(0xd0000000 + 0x00000000)
    ldr r0, [r0]




    cbz r0, 1f

hold_non_core0_in_bootrom:

    ldr r0, =0x00
    b _enter_vtable_in_r0
1:
# 420 "rp2_common/pico_crt0/crt0.S"
    adr r4, data_cpy_table


1:
    ldmia r4!, {r1-r3}
    cmp r1, #0
    beq 2f
    bl data_cpy
    b 1b
2:



    ldr r1, =__bss_start__
    ldr r2, =__bss_end__
    movs r0, #0
    b bss_fill_test
bss_fill_loop:
    stm r1!, {r0}
bss_fill_test:
    cmp r1, r2
    bne bss_fill_loop

platform_entry:

    // Enable coprocessors
    ldr r0, =0xE000ED88 // CPACR
    movs r1, #0x00F0    // CP10 | CP11 (FPU)
    lsls r1, r1, #8
    orrs r1, #0xCC      // CP5 | CP7 (DCP, RCP)
    lsls r1, r1, #8
    orrs r1, #0x03      // CP0 (GPIOC)
    str r1, [r0]

    // only initialize canary seeds if they haven't been (as to do so twice is a fault)
    mrc p7, #1, apsr_nzcv, c0, c0, #0
    bmi 1f
    // i dont think it much matters what we initialized to, as to have gotten here we must have not
    // gone thru the bootrom (which a secure boot would have)
    mcrr p7, #8, r0, r0, c0
    mcrr p7, #8, r0, r0, c1
    sev
1:
    ldr r0, =__vectors
    // Vector through our own table (SP, VTOR will not have been set up at
    // this point). Same path for debugger entry and bootloader entry.

    movs r0, #0
    msr msplim, r0

    ldr r1, =adainit
    blx r1
    ldr r1, =main
    blx r1

exit:
    bkpt #0
    b 1b



data_cpy_loop:
    ldm r1!, {r0}
    stm r2!, {r0}
data_cpy:
    cmp r2, r3
    blo data_cpy_loop
    bx lr





.align 2
data_cpy_table:
# 490 "rp2_common/pico_crt0/crt0.S"
.word __etext
.word __data_start__
.word __data_end__

.word __scratch_x_source__
.word __scratch_x_start__
.word __scratch_x_end__

.word __scratch_y_source__
.word __scratch_y_start__
.word __scratch_y_end__

.word 0





# 525 "rp2_common/pico_crt0/crt0.S"
.macro spacer_section name



.section \name

.endm

spacer_section .stack

.p2align 5
    .equ StackSize, 0x800
.space StackSize

spacer_section .heap
.p2align 2
    .equ HeapSize, 0x800
.space HeapSize

# 1 "rp2_common/pico_crt0/embedded_end_block.inc.S" 1

.section .embedded_end_block, "a"
embedded_end_block:
.word 0xffffded3

.byte (0x80 | 0x7e)
.byte 0x1
.hword 0

.byte (0x80 | 0x7f)
.hword (embedded_end_block_end - embedded_end_block - 16 ) / 4
.byte 0

.word embedded_block - embedded_end_block
.word 0xab123579
embedded_end_block_end:
# 545 "rp2_common/pico_crt0/crt0.S" 2
