# 0 "rp2350/boot_stage2/boot2_generic_03h.S"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "rp2350/boot_stage2/boot2_generic_03h.S"
# 19 "rp2350/boot_stage2/boot2_generic_03h.S"
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
# 20 "rp2350/boot_stage2/boot2_generic_03h.S" 2

# 1 "rp2350/hardware_regs/include/hardware/regs/qmi.h" 1
# 22 "rp2350/boot_stage2/boot2_generic_03h.S" 2
# 88 "rp2350/boot_stage2/boot2_generic_03h.S"
pico_default_asm_setup

.section .text


regular_func _stage2_boot
# 104 "rp2350/boot_stage2/boot2_generic_03h.S"
    push {lr}
    ldr r3, =0x400d0000
    ldr r0, =( 1 << 30 | 1 << 8 | 4 << 0 |0)
    str r0, [r3, #0x0000000c]
    ldr r0, =( 0x03 << 0 |0)
    str r0, [r3, #0x00000014]
    ldr r0, =( 0x0 << 0 | 0x0 << 2 | 0x0 << 4 | 0x0 << 6 | 0x0 << 8 | 0x1 << 12 |0)
    str r0, [r3, #0x00000010]



# 1 "rp2350/boot_stage2/asminclude/boot2_helpers/exit_from_boot2.S" 1
# 17 "rp2350/boot_stage2/asminclude/boot2_helpers/exit_from_boot2.S"
    pop {pc}
# 116 "rp2350/boot_stage2/boot2_generic_03h.S" 2


.global literals
literals:
.ltorg
