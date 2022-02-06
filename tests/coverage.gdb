target extended-remote localhost:3333
monitor reset halt
monitor arm semihosting enable
file bin/test_rp2040_hal
load
break Dump_Buffers
run
next
delete break
monitor shutdown
