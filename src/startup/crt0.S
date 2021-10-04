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

.macro decl_isr name
.weak \name
.type \name,%function
.thumb_func
\name:
.endm

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


.global __unhandled_user_irq
.thumb_func
__unhandled_user_irq:
    bl __get_current_exception
    subs r0, #16
.global unhandled_user_irq_num_in_r0
unhandled_user_irq_num_in_r0:
    bkpt #0



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


    ldr r1, =runtime_init
    blx r1
    ldr r1, =main
    blx r1
    ldr r1, =exit
    blx r1


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





.weak runtime_init
.type runtime_init,%function
.thumb_func
runtime_init:
    bx lr


# rom_func_lookup is defined in RP.ROM. This weak symbol causes rom_func_lookup
# to hang in case RP.ROM is not linked.
.weak rom_func_lookup
.type rom_func_lookup,%function
.thumb_func
rom_func_lookup:
1:
    wfe
    b 1b

hold_non_core0_in_bootrom:
    ldr r0, = 'W' | ('V' << 8)
    bl rom_func_lookup
    bx r0


.global __get_current_exception
.thumb_func
__get_current_exception:
    mrs r0, ipsr
    uxtb r0, r0
    bx lr




.section .stack

.align 5
    .equ StackSize, 0x1000
.space StackSize

.section .heap
.align 2
    .equ HeapSize, 0x1000
.space HeapSize
