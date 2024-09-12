# 0 "rp2_common/pico_crt0/crt0_riscv.S"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "rp2_common/pico_crt0/crt0_riscv.S"






# 1 "common/pico_base_headers/include/pico.h" 1
# 26 "common/pico_base_headers/include/pico.h"
# 1 "common/pico_base_headers/include/pico/types.h" 1
# 27 "common/pico_base_headers/include/pico.h" 2
# 1 "/home/synack/src/rp2040_hal/scripts/include/pico/version.h" 1
# 28 "common/pico_base_headers/include/pico.h" 2





# 1 "common/pico_base_headers/include/pico/config.h" 1
# 19 "common/pico_base_headers/include/pico/config.h"
# 1 "/home/synack/src/rp2040_hal/scripts/include/pico/config_autogen.h" 1
# 20 "common/pico_base_headers/include/pico/config.h" 2
# 34 "common/pico_base_headers/include/pico.h" 2

# 1 "rp2350/pico_platform/include/pico/platform.h" 1
# 23 "rp2350/pico_platform/include/pico/platform.h"
# 1 "rp2_common/pico_platform_compiler/include/pico/platform/compiler.h" 1
# 18 "rp2_common/pico_platform_compiler/include/pico/platform/compiler.h"
# 1 "rp2350/hardware_regs/include/hardware/platform_defs.h" 1
# 19 "rp2_common/pico_platform_compiler/include/pico/platform/compiler.h" 2
# 24 "rp2350/pico_platform/include/pico/platform.h" 2
# 1 "rp2_common/pico_platform_sections/include/pico/platform/sections.h" 1
# 25 "rp2350/pico_platform/include/pico/platform.h" 2
# 1 "rp2_common/pico_platform_panic/include/pico/platform/panic.h" 1
# 26 "rp2350/pico_platform/include/pico/platform.h" 2
# 1 "rp2350/hardware_regs/include/hardware/regs/addressmap.h" 1
# 27 "rp2350/pico_platform/include/pico/platform.h" 2
# 1 "rp2350/hardware_regs/include/hardware/regs/sio.h" 1
# 28 "rp2350/pico_platform/include/pico/platform.h" 2

# 1 "rp2350/hardware_regs/include/hardware/regs/rvcsr.h" 1
# 30 "rp2350/pico_platform/include/pico/platform.h" 2
# 36 "common/pico_base_headers/include/pico.h" 2
# 1 "common/pico_base_headers/include/pico/error.h" 1
# 37 "common/pico_base_headers/include/pico.h" 2
# 8 "rp2_common/pico_crt0/crt0_riscv.S" 2



# 1 "common/pico_binary_info/include/pico/binary_info/defs.h" 1
# 12 "rp2_common/pico_crt0/crt0_riscv.S" 2
# 1 "common/boot_picobin_headers/include/boot/picobin.h" 1
# 13 "rp2_common/pico_crt0/crt0_riscv.S" 2
# 1 "rp2_common/pico_bootrom/include/pico/bootrom_constants.h" 1







# 1 "rp2_common/boot_bootrom_headers/include/boot/bootrom_constants.h" 1
# 9 "rp2_common/pico_bootrom/include/pico/bootrom_constants.h" 2
# 14 "rp2_common/pico_crt0/crt0_riscv.S" 2
# 39 "rp2_common/pico_crt0/crt0_riscv.S"
.section .data


.p2align 6
.global __vectors, __VECTOR_TABLE
__VECTOR_TABLE:
__vectors:



.option push
.option norvc
.option norelax
j isr_riscv_machine_exception
.word 0
.word 0
j isr_riscv_machine_soft_irq
.word 0
.word 0
.word 0
j isr_riscv_machine_timer
.word 0
.word 0
.word 0

.option pop




.global isr_riscv_machine_external_irq
.weak isr_riscv_machine_external_irq
isr_riscv_machine_external_irq:



    addi sp, sp, -80
    sw ra, 0(sp)
    sw t0, 4(sp)
    sw t1, 8(sp)
    sw t2, 12(sp)
    sw a0, 16(sp)
    sw a1, 20(sp)
    sw a2, 24(sp)
    sw a3, 28(sp)
    sw a4, 32(sp)
    sw a5, 36(sp)
    sw a6, 40(sp)
    sw a7, 44(sp)
    sw t3, 48(sp)
    sw t4, 52(sp)
    sw t5, 56(sp)
    sw t6, 60(sp)
    csrr a0, mepc
    csrr a1, mstatus
    sw a0, 64(sp)
    sw a1, 68(sp)
save_meicontext:



    csrrsi a2, 0x00000be5, 0x00000002
    sw a2, 72(sp)

get_first_irq:



    csrrsi a0, 0x00000be4, 0x00000001

    bltz a0, no_more_irqs
dispatch_irq:

    csrsi mstatus, 0x8


    lui a1, %hi(__soft_vector_table)
    add a1, a1, a0
    lw a1, %lo(__soft_vector_table)(a1)
    jalr ra, a1

    csrci mstatus, 0x8
get_next_irq:


    csrrsi a0, 0x00000be4, 0x00000001

    bgez a0, dispatch_irq

no_more_irqs:

    lw a0, 64(sp)
    lw a1, 68(sp)
    lw a2, 72(sp)
    csrw mepc, a0
    csrw mstatus, a1
    csrw 0x00000be5, a2
    lw ra, 0(sp)
    lw t0, 4(sp)
    lw t1, 8(sp)
    lw t2, 12(sp)

    lw a1, 20(sp)
    lw a2, 24(sp)
    lw a3, 28(sp)
    lw a4, 32(sp)
    lw a5, 36(sp)
    lw a6, 40(sp)
    lw a7, 44(sp)
    lw t3, 48(sp)
    lw t4, 52(sp)
    lw t5, 56(sp)
    lw t6, 60(sp)




check_irq_before_exit:
    csrr a0, 0x00000be4
    bgez a0, save_meicontext
    lw a0, 16(sp)
    addi sp, sp, 80
    mret




.p2align 4
.global __soft_vector_table
__soft_vector_table:
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



.global __default_isrs_start
__default_isrs_start:





.macro decl_isr name
.weak \name
\name:
.endm

.macro decl_isr_bkpt name
.weak \name
\name:
    ebreak
.endm






decl_isr isr_riscv_machine_exception




decl_isr_bkpt isr_riscv_machine_timer
decl_isr_bkpt isr_riscv_machine_soft_irq

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






.global __unhandled_user_irq
__unhandled_user_irq:
.global unhandled_user_irq_num_in_a0
unhandled_user_irq_num_in_a0:


    srli a0, a0, 2
    ebreak

.global __default_isrs_end
__default_isrs_end:



.section .binary_info_header, "a"







binary_info_header:
.word 0x7188ebf2
.word __binary_info_start
.word __binary_info_end
.word data_cpy_table
.word 0xe71aa390


# 1 "rp2_common/pico_crt0/embedded_start_block.inc.S" 1
# 27 "rp2_common/pico_crt0/embedded_start_block.inc.S"
.section .embedded_block, "a"
.p2align 2
embedded_block:
.word 0xffffded3




.byte 0x42
.byte 0x1



.hword (0x1 << 0) | (1 << 8) | (1 << 12) | 0
# 79 "rp2_common/pico_crt0/embedded_start_block.inc.S"
.byte 0x44
.byte 0x3
.byte 0
.byte 0
.word _reset_handler
.word 0x20082000
# 97 "rp2_common/pico_crt0/embedded_start_block.inc.S"
.byte (0x80 | 0x7f)
.hword (embedded_block_end - embedded_block - 16 ) / 4
.byte 0

.word embedded_end_block - embedded_block





.word 0xab123579
embedded_block_end:
# 344 "rp2_common/pico_crt0/crt0_riscv.S" 2



.section .reset, "ax"
# 362 "rp2_common/pico_crt0/crt0_riscv.S"
.global _entry_point
_entry_point:
# 372 "rp2_common/pico_crt0/crt0_riscv.S"
    j reenter_bootrom
# 382 "rp2_common/pico_crt0/crt0_riscv.S"
_reset_handler:
.option push
.option norelax
    la gp, __global_pointer$
.option pop
    la sp, __StackTop


    la a0, __vectors + 1
    csrw mtvec, a0



    csrr a0, mhartid
    bnez a0, reenter_bootrom
# 421 "rp2_common/pico_crt0/crt0_riscv.S"
    la a4, data_cpy_table


1:
    lw a1, 0(a4)
    beqz a1, 2f
    lw a2, 4(a4)
    lw a3, 8(a4)
    addi a4, a4, 12
    jal data_cpy
    j 1b
2:



    la a1, __bss_start__
    la a2, __bss_end__
    j bss_fill_test
bss_fill_loop:
    sw zero, (a1)
    addi a1, a1, 4
bss_fill_test:
    bne a1, a2, bss_fill_loop

platform_entry:




    call runtime_init
    call main
    call exit


1:
    ebreak
    j 1b

data_cpy_loop:
    lw a0, (a1)
    sw a0, (a2)
    addi a1, a1, 4
    addi a2, a2, 4
data_cpy:
    bltu a2, a3, data_cpy_loop
    ret

.align 2
data_cpy_table:
# 480 "rp2_common/pico_crt0/crt0_riscv.S"
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





.weak runtime_init
runtime_init:
    ret
# 510 "rp2_common/pico_crt0/crt0_riscv.S"
reenter_bootrom:
# 524 "rp2_common/pico_crt0/crt0_riscv.S"
    li a0, 0x7dfc
    jr a0
# 538 "rp2_common/pico_crt0/crt0_riscv.S"
.section .text
.global runtime_init_per_core_h3_irq_registers
runtime_init_per_core_h3_irq_registers:




    li a0, 3
1:
    csrw 0x00000be2, a0
    addi a0, a0, -1
    bgez a0, 1b


    li a0, 0x00000800
    csrw mie, a0


    csrsi mstatus, 0x00000008


    csrw mscratch, zero
    ret
# 573 "rp2_common/pico_crt0/crt0_riscv.S"
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
# 593 "rp2_common/pico_crt0/crt0_riscv.S" 2
