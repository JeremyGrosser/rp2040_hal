# 0 "rp2350/boot_stage2/boot2_w25q080.S"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "rp2350/boot_stage2/boot2_w25q080.S"
# 29 "rp2350/boot_stage2/boot2_w25q080.S"
# 1 "rp2350/pico_platform/include/pico/asm_helper.S" 1






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
# 8 "rp2350/pico_platform/include/pico/asm_helper.S" 2
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
# 30 "rp2350/boot_stage2/boot2_w25q080.S" 2

# 1 "rp2350/hardware_regs/include/hardware/regs/pads_qspi.h" 1
# 32 "rp2350/boot_stage2/boot2_w25q080.S" 2
# 1 "rp2350/hardware_regs/include/hardware/regs/qmi.h" 1
# 33 "rp2350/boot_stage2/boot2_w25q080.S" 2
# 143 "rp2350/boot_stage2/boot2_w25q080.S"
pico_default_asm_setup
.section .text
# 238 "rp2350/boot_stage2/boot2_w25q080.S"
regular_func _stage2_boot
    push {lr}
_pad_config:
    ldr r3, =0x40040000
    movs r0, ( 2 << 4 | 0x00000001 | 0)
    str r0, [r3, #0x00000004]

    adds r3, #(0x3 << 12)
    movs r0, #0x00000002
    str r0, [r3, #0x00000008]
    str r0, [r3, #0x0000000c]
    str r0, [r3, #0x00000010]
    str r0, [r3, #0x00000014]

    adds r3, (0x400d0000 - (0x40040000 + (0x3 << 12)))




program_sregs:




    ldr r1, =( 30 << 22 | 0x00000001 | 0x00000040 | 0)
    str r1, [r3, #0x00000000]



1:
    ldr r0, [r3, #0x00000000]
    tst r0, #0x00000002
    bne 1b


    movs r0, #0x35
    bl read_flash_sreg
    cmp r0, #0x02
    beq _skip_sreg_programming


    movs r0, #0x06
    str r0, [r3, #0x00000004]
    bl wait_qmi_ready
    ldr r0, [r3, #0x00000008]


    movs r0, #0x01
    str r0, [r3, #0x00000004]
    movs r0, #0
    str r0, [r3, #0x00000004]
    movs r0, #0x02
    str r0, [r3, #0x00000004]
    bl wait_qmi_ready
    ldr r0, [r3, #0x00000008]
    ldr r0, [r3, #0x00000008]
    ldr r0, [r3, #0x00000008]


1:
    movs r0, #0x05
    bl read_flash_sreg
    lsrs r0, #1
    bcs 1b

_skip_sreg_programming:

    bics r1, #0x00000001
    str r1, [r3, #0x00000000]



_qmi_config:
    ldr r0, =( 1 << 30 | 2 << 8 | 2 << 0 |0)
    str r0, [r3, #0x0000000c]
    ldr r0, =( 0xeb << 0 | 0xa0 << 8 |0)
    str r0, [r3, #0x00000014]
    ldr r0, =( 0x0 << 0 | 0x2 << 2 | 0x2 << 4 | 0x2 << 6 | 0x2 << 8 | 0x1 << 12 | 0x2 << 14 | 4 << 16 |0)
    str r0, [r3, #0x00000010]


    mov r1, #0x14000000
    ldrb r1, [r1]


    bic r0, #0x00001000
    str r0, [r3, #0x00000010]






# 1 "rp2350/boot_stage2/asminclude/boot2_helpers/exit_from_boot2.S" 1
# 17 "rp2350/boot_stage2/asminclude/boot2_helpers/exit_from_boot2.S"
    pop {pc}
# 332 "rp2350/boot_stage2/boot2_w25q080.S" 2


# 1 "rp2350/boot_stage2/asminclude/boot2_helpers/wait_qmi_ready.S" 1
# 24 "rp2350/boot_stage2/asminclude/boot2_helpers/wait_qmi_ready.S"
wait_qmi_ready:
1:
    ldr r0, [r3, #0x00000000]
    lsrs r0, r0, #1 + 1
    bcs 1b

    bx lr
# 335 "rp2350/boot_stage2/boot2_w25q080.S" 2

# 1 "rp2350/boot_stage2/asminclude/boot2_helpers/read_flash_sreg.S" 1
# 15 "rp2350/boot_stage2/asminclude/boot2_helpers/read_flash_sreg.S"
.global read_flash_sreg
.type read_flash_sreg,%function
# 33 "rp2350/boot_stage2/asminclude/boot2_helpers/read_flash_sreg.S"
.thumb_func
read_flash_sreg:
    push {lr}
    str r0, [r3, #0x00000004]

    str r0, [r3, #0x00000004]

    bl wait_qmi_ready

    ldr r0, [r3, #0x00000008]
    ldr r0, [r3, #0x00000008]

    pop {pc}
# 337 "rp2350/boot_stage2/boot2_w25q080.S" 2



.global literals
literals:
.ltorg
