# 1 "pico-sdk/src/rp2_common/pico_standard_link/crt0.S"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "pico-sdk/src/rp2_common/pico_standard_link/crt0.S"






# 1 "pico-sdk/src/rp2040/hardware_regs/include/hardware/regs/m0plus.h" 1
# 8 "pico-sdk/src/rp2_common/pico_standard_link/crt0.S" 2
# 1 "pico-sdk/src/rp2040/hardware_regs/include/hardware/platform_defs.h" 1
# 12 "pico-sdk/src/rp2040/hardware_regs/include/hardware/platform_defs.h"
# 1 "pico-sdk/src/rp2040/hardware_regs/include/hardware/regs/addressmap.h" 1
# 13 "pico-sdk/src/rp2040/hardware_regs/include/hardware/platform_defs.h" 2
# 9 "pico-sdk/src/rp2_common/pico_standard_link/crt0.S" 2

# 1 "pico-sdk/src/rp2040/hardware_regs/include/hardware/regs/sio.h" 1
# 11 "pico-sdk/src/rp2_common/pico_standard_link/crt0.S" 2
# 1 "pico-sdk/src/common/pico_binary_info/include/pico/binary_info/defs.h" 1
# 12 "pico-sdk/src/rp2_common/pico_standard_link/crt0.S" 2







.syntax unified
.cpu cortex-m0plus
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
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap
.word __gnat_irq_trap


.macro decl_isr_bkpt name
.weak \name
.type \name,%function
.thumb_func
\name:
    bkpt #0
.endm


decl_isr_bkpt isr_invalid
decl_isr_bkpt isr_nmi
decl_isr_bkpt isr_hardfault
decl_isr_bkpt isr_svcall
decl_isr_bkpt isr_pendsv
decl_isr_bkpt isr_systick

.section .binary_info_header, "a"
binary_info_header:
.word 0x7188ebf2
.word __binary_info_start
.word __binary_info_end
.word data_cpy_table
.word 0xe71aa390




.section .reset, "ax"
# 182 "pico-sdk/src/rp2_common/pico_standard_link/crt0.S"
.type _entry_point,%function
.thumb_func
.global _entry_point
_entry_point:
# 194 "pico-sdk/src/rp2_common/pico_standard_link/crt0.S"
    movs r0, #0

    ldr r1, =(0xe0000000 + 0x0000ed08)
    str r0, [r1]
    ldmia r0!, {r1, r2}
    msr msp, r1
    bx r2
# 209 "pico-sdk/src/rp2_common/pico_standard_link/crt0.S"
.type _reset_handler,%function
.thumb_func
_reset_handler:


    ldr r0, =(0xd0000000 + 0x00000000)
    ldr r0, [r0]
    cmp r0, #0
    bne hold_non_core0_in_bootrom

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
    bl __gnat_initialize_bootrom
    bl main
    bl _exit

.weak _exit
.type _exit,%function
.thumb_func
_exit:
1:
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

hold_non_core0_in_bootrom:
    ldr r0, = 'W' | ('V' << 8)
    bl __gnat_rom_func_lookup
    bx r0

.section .stack

.align 5
    .equ StackSize, 0x1000
.space StackSize

.section .heap
.align 2
    .equ HeapSize, 0x1000
.space HeapSize
