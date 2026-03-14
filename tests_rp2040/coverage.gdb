target extended-remote localhost:3333
monitor reset halt
monitor arm semihosting enable
file bin/test_rp2040_hal
load
break main
run
finish
delete break
monitor shutdown 0
