# 0 "rp2_common/pico_crt0/crt0.S"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "rp2_common/pico_crt0/crt0.S"






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
# 36 "common/pico_base_headers/include/pico.h" 2
# 1 "common/pico_base_headers/include/pico/error.h" 1
# 37 "common/pico_base_headers/include/pico.h" 2
# 8 "rp2_common/pico_crt0/crt0.S" 2
# 1 "rp2350/pico_platform/include/pico/asm_helper.S" 1
# 20 "rp2350/pico_platform/include/pico/asm_helper.S"
.macro pico_default_asm_setup

.syntax unified
.cpu cortex-m33
.fpu fpv5-sp-d16
.thumb

.endm


.macro regular_func x
.global \x
.type \x,%function

.thumb_func

\x:
.endm

.macro weak_func x
.weak \x
.type \x,%function

.thumb_func

\x:
.endm

.macro regular_func_with_section x
.section .text.\x
regular_func \x
.endm


.macro wrapper_func x
regular_func __wrap_\x
.endm

.macro weak_wrapper_func x
weak_func __wrap_\x
.endm

.macro __pre_init_with_offset func, offset, priority_string1
.section .preinit_array.\priority_string1
.p2align 2
.word \func + \offset
.endm


.macro __pre_init func, priority_string1
__pre_init_with_offset func, 0, priority_string1
.endm
# 9 "rp2_common/pico_crt0/crt0.S" 2

# 1 "rp2350/pico_platform/include/pico/platform/cpu_regs.h" 1
# 21 "rp2350/pico_platform/include/pico/platform/cpu_regs.h"
# 1 "rp2350/hardware_regs/include/hardware/regs/m33.h" 1
# 22 "rp2350/pico_platform/include/pico/platform/cpu_regs.h" 2
# 11 "rp2_common/pico_crt0/crt0.S" 2



# 1 "common/pico_binary_info/include/pico/binary_info/defs.h" 1
# 15 "rp2_common/pico_crt0/crt0.S" 2
# 1 "common/boot_picobin_headers/include/boot/picobin.h" 1
# 16 "rp2_common/pico_crt0/crt0.S" 2
# 1 "rp2_common/pico_bootrom/include/pico/bootrom.h" 1
# 11 "rp2_common/pico_bootrom/include/pico/bootrom.h"
# 1 "rp2_common/pico_bootrom/include/pico/bootrom_constants.h" 1







# 1 "rp2_common/boot_bootrom_headers/include/boot/bootrom_constants.h" 1
# 9 "rp2_common/pico_bootrom/include/pico/bootrom_constants.h" 2
# 12 "rp2_common/pico_bootrom/include/pico/bootrom.h" 2
# 17 "rp2_common/pico_crt0/crt0.S" 2







pico_default_asm_setup

.section .vectors, "ax"
.align 2

.global __vectors, __VECTOR_TABLE
__VECTOR_TABLE:
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







.macro if_irq_word num func
.if \num < 52
.word \func
.endif
.endm





if_irq_word 0 isr_irq0
if_irq_word 1 isr_irq1
if_irq_word 2 isr_irq2
if_irq_word 3 isr_irq3
if_irq_word 4 isr_irq4
if_irq_word 5 isr_irq5
if_irq_word 6 isr_irq6
if_irq_word 7 isr_irq7
if_irq_word 8 isr_irq8
if_irq_word 9 isr_irq9
if_irq_word 10 isr_irq10
if_irq_word 11 isr_irq11
if_irq_word 12 isr_irq12
if_irq_word 13 isr_irq13
if_irq_word 14 isr_irq14
if_irq_word 15 isr_irq15
if_irq_word 16 isr_irq16
if_irq_word 17 isr_irq17
if_irq_word 18 isr_irq18
if_irq_word 19 isr_irq19
if_irq_word 20 isr_irq20
if_irq_word 21 isr_irq21
if_irq_word 22 isr_irq22
if_irq_word 23 isr_irq23
if_irq_word 24 isr_irq24
if_irq_word 25 isr_irq25
if_irq_word 26 isr_irq26
if_irq_word 27 isr_irq27
if_irq_word 28 isr_irq28
if_irq_word 29 isr_irq29
if_irq_word 30 isr_irq30
if_irq_word 31 isr_irq31
if_irq_word 32 isr_irq32
if_irq_word 33 isr_irq33
if_irq_word 34 isr_irq34
if_irq_word 35 isr_irq35
if_irq_word 36 isr_irq36
if_irq_word 37 isr_irq37
if_irq_word 38 isr_irq38
if_irq_word 39 isr_irq39
if_irq_word 40 isr_irq40
if_irq_word 41 isr_irq41
if_irq_word 42 isr_irq42
if_irq_word 43 isr_irq43
if_irq_word 44 isr_irq44
if_irq_word 45 isr_irq45
if_irq_word 46 isr_irq46
if_irq_word 47 isr_irq47
if_irq_word 48 isr_irq48
if_irq_word 49 isr_irq49
if_irq_word 50 isr_irq50
if_irq_word 51 isr_irq51
if_irq_word 52 isr_irq52
if_irq_word 53 isr_irq53
if_irq_word 54 isr_irq54
if_irq_word 55 isr_irq55
if_irq_word 56 isr_irq56
if_irq_word 57 isr_irq57
if_irq_word 58 isr_irq58
if_irq_word 59 isr_irq59
if_irq_word 60 isr_irq60
if_irq_word 61 isr_irq61
if_irq_word 62 isr_irq62
if_irq_word 63 isr_irq63
if_irq_word 64 isr_irq64
if_irq_word 65 isr_irq65
if_irq_word 66 isr_irq66
if_irq_word 67 isr_irq67
if_irq_word 68 isr_irq68
if_irq_word 69 isr_irq69
if_irq_word 70 isr_irq70
if_irq_word 71 isr_irq71
if_irq_word 72 isr_irq72
if_irq_word 73 isr_irq73
if_irq_word 74 isr_irq74
if_irq_word 75 isr_irq75
if_irq_word 76 isr_irq76
if_irq_word 77 isr_irq77
if_irq_word 78 isr_irq78
if_irq_word 79 isr_irq79







.global __default_isrs_start
__default_isrs_start:





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

.global __default_isrs_end
__default_isrs_end:

.altmacro
.macro decl_isr name


.weak \name



.type \name,%function
.thumb_func
\name:
.endm

.macro if_irq_decl num func
.if \num < 52
decl_isr \func
.endif
.endm

if_irq_decl 0 isr_irq0
if_irq_decl 1 isr_irq1
if_irq_decl 2 isr_irq2
if_irq_decl 3 isr_irq3
if_irq_decl 4 isr_irq4
if_irq_decl 5 isr_irq5
if_irq_decl 6 isr_irq6
if_irq_decl 7 isr_irq7
if_irq_decl 8 isr_irq8
if_irq_decl 9 isr_irq9
if_irq_decl 10 isr_irq10
if_irq_decl 11 isr_irq11
if_irq_decl 12 isr_irq12
if_irq_decl 13 isr_irq13
if_irq_decl 14 isr_irq14
if_irq_decl 15 isr_irq15
if_irq_decl 16 isr_irq16
if_irq_decl 17 isr_irq17
if_irq_decl 18 isr_irq18
if_irq_decl 19 isr_irq19
if_irq_decl 20 isr_irq20
if_irq_decl 21 isr_irq21
if_irq_decl 22 isr_irq22
if_irq_decl 23 isr_irq23
if_irq_decl 24 isr_irq24
if_irq_decl 25 isr_irq25
if_irq_decl 26 isr_irq26
if_irq_decl 27 isr_irq27
if_irq_decl 28 isr_irq28
if_irq_decl 29 isr_irq29
if_irq_decl 30 isr_irq30
if_irq_decl 31 isr_irq31
if_irq_decl 32 isr_irq32
if_irq_decl 33 isr_irq33
if_irq_decl 34 isr_irq34
if_irq_decl 35 isr_irq35
if_irq_decl 36 isr_irq36
if_irq_decl 37 isr_irq37
if_irq_decl 38 isr_irq38
if_irq_decl 39 isr_irq39
if_irq_decl 40 isr_irq40
if_irq_decl 41 isr_irq41
if_irq_decl 42 isr_irq42
if_irq_decl 43 isr_irq43
if_irq_decl 44 isr_irq44
if_irq_decl 45 isr_irq45
if_irq_decl 46 isr_irq46
if_irq_decl 47 isr_irq47
if_irq_decl 48 isr_irq48
if_irq_decl 49 isr_irq49
if_irq_decl 50 isr_irq50
if_irq_decl 51 isr_irq51
if_irq_decl 52 isr_irq52
if_irq_decl 53 isr_irq53
if_irq_decl 54 isr_irq54
if_irq_decl 55 isr_irq55
if_irq_decl 56 isr_irq56
if_irq_decl 57 isr_irq57
if_irq_decl 58 isr_irq58
if_irq_decl 59 isr_irq59
if_irq_decl 60 isr_irq60
if_irq_decl 61 isr_irq61
if_irq_decl 62 isr_irq62
if_irq_decl 63 isr_irq63
if_irq_decl 64 isr_irq64
if_irq_decl 65 isr_irq65
if_irq_decl 66 isr_irq66
if_irq_decl 67 isr_irq67
if_irq_decl 68 isr_irq68
if_irq_decl 69 isr_irq69
if_irq_decl 70 isr_irq70
if_irq_decl 71 isr_irq71
if_irq_decl 72 isr_irq72
if_irq_decl 73 isr_irq73
if_irq_decl 74 isr_irq74
if_irq_decl 75 isr_irq75
if_irq_decl 76 isr_irq76
if_irq_decl 77 isr_irq77
if_irq_decl 78 isr_irq78
if_irq_decl 79 isr_irq79





.global __unhandled_user_irq
.thumb_func
__unhandled_user_irq:
    mrs r0, ipsr
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


# 1 "rp2_common/pico_crt0/embedded_start_block.inc.S" 1
# 27 "rp2_common/pico_crt0/embedded_start_block.inc.S"
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
# 310 "rp2_common/pico_crt0/crt0.S" 2



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
