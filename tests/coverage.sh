#!/bin/bash
GPR_EXTERNAL=" \
    -XTEST_RP2040_HAL_BUILD_MODE=debug \
    -XTEST_RP2040_HAL_COMPILE_CHECKS=disabled \
    -XRP2040_HAL_BUILD_MODE=debug \
    -XRP2040_HAL_COMPILE_CHECKS=disabled \
    "
alr clean
rm -rf ../obj obj
alr build ${GPR_EXTERNAL}
eval $(alr printenv)
gnatcov instrument -P test_rp2040_hal.gpr \
    ${GPR_EXTERNAL} \
    --projects=RP2040_HAL \
    --level=stmt \
    --dump-trigger=main-end \
    --dump-channel=base64-stdout

alr clean
export GPR_PROJECT_PATH="${GPR_PROJECT_PATH}:${PWD}/gnatcov_rts"
gprbuild -P test_rp2040_hal.gpr \
    ${GPR_EXTERNAL} \
    --src-subdirs=gnatcov-instr \
    --implicit-with=gnatcov_rts.gpr \
    -j0 \
    -f

sudo openocd -f interface/picoprobe.cfg -f target/rp2040.cfg &>coverage.log &
arm-eabi-gdb --batch --command=coverage.gdb

gnatcov extract-base64-trace coverage.log coverage.trace
COVERAGE_FLAGS=" \
    -P test_rp2040_hal.gpr \
    ${GPR_EXTERNAL} \
    --projects=RP2040_HAL \
    --no-subprojects \
    --level=stmt \
    coverage.trace \
    "
gnatcov coverage --annotate=html ${COVERAGE_FLAGS}
