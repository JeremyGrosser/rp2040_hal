#!/bin/sh

mkdir -p generated
./genboot2asm.sh generic_03 generated/boot2__rp2040_generic_03.S
./genboot2asm.sh generic_qspi generated/boot2__rp2040_generic_qspi.S
./genboot2asm.sh w25q080 generated/boot2__rp2040_w25q080.S
