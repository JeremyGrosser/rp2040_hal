# rp2040_hal UNRELEASED

## Breaking changes

## Bugs fixed

### 16-bit RP.SPI.Transmit did not respect the Blocking configuration option

[Issue #3](https://github.com/JeremyGrosser/rp2040_hal/issues/3)

If Blocking was set in the SPI_Configuration and the 16-bit version of the Transmit procedure was used, Transmit would return before all data was clocked out. Thanks to [@hgrodriguez](https://github.com/hgrodriguez) for discovering this 

### RP.PWM did not check that Initialize was called first

If RP.PWM.Initialize was not called before configuring PWM slices, the configuration would succeed but would generate no output. An `Initialized` variable has been added to RP.PWM along with a precondition on all procedures that modify PWM slices to ensure that `Initialized` is True. If you forget to call RP.PWM.Initialize, your program will crash on the first run.

# rp2040_hal 0.5.0

## New features

### UART enhancements
[RP.UART](src/drivers/rp-uart.ads) now allows configuration of baud, word size, parity, and stop bits via the UART_Configuration record. The default values for the UART_Configuration record represent the typical `115200 8n1` setup.

The UART now has a `Send_Break` procedure, which holds TX in an active state (usually low) for at least two frame periods. Some protocols use the [UART break condition](https://en.wikipedia.org/wiki/Universal_asynchronous_receiver-transmitter#Break_condition) to indicate the start of a new packet.

`RP.UART.Receive` now sets `Status = Busy` and returns immediately if a break condition is detected.

UART Transmit and Receive procedures now return as soon as all words have been delivered to the FIFO. FIFO status is exposed by the Transmit_Status and Receive_Status functions. This interface is the same as the I2C and SPI drivers.

The [uart_echo](https://github.com/JeremyGrosser/pico_examples/blob/master/uart_echo/src/main.adb) example has been updated to demonstrate these new features.

### RTC driver
The real time clock is now exposed by the [RP.RTC](src/drivers/rp-rtc.ads) package. It implements the [HAL.Real_Time_Clock](https://github.com/Fabien-Chouteau/hal/blob/master/src/hal-real_time_clock.ads) interface for getting and setting the date and time. An [example project](https://github.com/JeremyGrosser/pico_examples/blob/master/rtc/src/main.adb) demonstrates use of the RTC. RTC alarm interrupts are not yet implemented.

### Interpolator driver
The RP2040 has two interpolators per core embedded in the SIO peripheral. The [RP.Interpolator](src/drivers/rp-interpolator.ads) package make their registers available. Some of the registers in this block support single-cycle operation, so it would be counter productive to wrap them up in procedures that may not be inlined by the compiler. There are examples in the datasheet for working with the interpolators, but I'm still trying to wrap my head around it, so there is no example here yet.

## Breaking changes

### UART.Enable is replaced with UART.Configure
To match the nomenclature of the other serial drivers (SPI, I2C), [RP.UART](src/drivers/rp-uart.ads) now has a Configure procedure instead of Enable.

### I2C addresses should include the R/W bit
The RP.I2C driver was expecting 7-bit I2C addresses to not include the R/W bit in the LSB. This was inconsistent with the other HAL.I2C implementations and would result in incorrect I2C addressing. Now, 7-bit I2C addresses should be represented as a UInt8 with the LSB set to 0. If this breaks your code, shift your I2C address left by one bit.

## Bugs fixed

### Improper use of the Pack clause
The `Pack` clause was used to enforce the memory layout of some records.

> It is important to realize that pragma Pack must not be used to specify the exact representation of a data type, but to help the compiler to improve the efficiency of the generated code. [Source](https://en.wikibooks.org/wiki/Ada_Programming/Pragmas/Pack#Exact_data_representation)

The Pack clause has been replaced with `Component_Size` and `Size` clauses where necessary. Thanks to [@onox](https://github.com/onox) for pointing this out!

### Use of access PIO_Device as a type discriminant
Projects depending on pico_bsp failed gnatprove in SPARK mode as the `Pico.Audio_I2S` package was using `not null access PIO_Device` as a discriminant. PIO_Device is now `tagged` and `Pico.Audio_I2S` uses `not null access PIO_Device'Class`, which is valid under SPARK. gnatprove still throws many warnings about side effects in the `rp2040_hal` drivers, but no fatal errors.

### RP.ADC.Read_Microvolts was rounding incorrectly
`Read_Microvolts` was using Integer arithmetic to calculate `VREF / Analog_Value'Last`, which does not divide evenly for common VREF values. When that value was multiplied by an ADC reading, Read_Microvolts would return lower than expected results. Read_Microvolts now uses floating point to multiply ADC counts before converting the return value to Integer.

### UART Transmit and Receive did not respect Timeout
The UART driver has been modified to use RP.Timer to implement timeouts and monitor FIFO status, similar to RP.SPI and RP.I2C.

### SPI Transmit was nonblocking
The SPI Transmit procedure would return immediately after the last byte was written to the FIFO, but before the FIFO became empty. This behavior breaks some drivers that depend on all bytes being clocked out before proceeding. A configuration flag for Blocking behavior has been added and defaults to True.



# rp2040_hal 0.4.0

## New features

### DMA driver
The RP.DMA package allows out of band copies between a source and target System.Address and may be triggered by a variety of events. The PIO and SPI drivers have been tested with DMA and have new functions that return their FIFO addresses.

### I/O Schmitt triggers
The RP.GPIO.Configure procedure now takes optional [Schmitt](https://en.wikipedia.org/wiki/Schmitt_trigger) and [Slew_Fast](https://en.wikipedia.org/wiki/Slew_rate) boolean parameters that control the behavior of I/O pads. The RP2040 documentation recommends enabling the Schmitt trigger for I2C operation.

### RP.ROM.Floating_Point
The ROM floating point library is now exposed in the RP.ROM.Floating_Point package. GNAT will use gcc's soft float implementation by default, but you may call the optimized versions in the ROM directly. The Ravenscar runtimes will replace the gcc functions with these ROM calls automatically.

### I2C and SPI Timeouts
Previously, the I2C and SPI drivers did not use the Timeout argument. They now use RP.Timer to implement a timeout for all blocking operations and set Status to Err_Timeout if it expires before the blocking operation completes. The I2C peripheral may require a reset after a timeout as the bus may be in an unknown state.

### SPI FIFO status is exposed with Transmit_Status and Receive_Status
You can use these functions to determine if the Transmit or Receive procedures would block. See the new spi_loopback example.

## Breaking changes

### PWM Set_Duty_Cycle and Set_Invert no longer use PWM_Point
These procedures have changed to take a PWM_Slice as the first argument to make them more consistent with the rest of the driver. These procedures now set both channels of a slice nearly simultaneously.

### PWM Initialize must be called before any other PWM configuration
This procedure was added to fix the corruption bug discussed below.

### SPI.Enable is replaced with SPI.Configure
The Configure procedure takes a SPI_Configuration record as an argument for easy static configuration.

## Bugs fixed

### PWM configuration is corrupted after power cycle
RP.PWM.Enable is called after configuring a PWM slice to enable it. This procedure was incorrectly resetting the PWM peripheral before enabling the slice. RP.PWM.Initialize now performs the reset and all peripheral resets have been moved to RP.Reset to avoid this mistake in the future.

### PWM dividers can have a value of zero
The documentation is unclear on what this means, but my testing shows that it acts like a divider of 1, which outputs the clk_sys frequency.

### Fast I2C writes would result in dropped bytes
The RP.I2C_Master driver has been modified to wait for the TX FIFO to be empty before writing a byte. This effectively reduces the FIFO depth to 1 byte. This is the same behavior as the upstream SDK.

## Known issues

### I2C clock is slower than expected
In 400 KHz (fast mode) operation, the I2C master generates SCL at approximately 380 KHz. I believe this is due to clock stretching caused by the new TX FIFO blocking behavior. The upstream SDK has the same behavior. According to the I2C specification, a fast mode clock may be *up to* 400 KHz, but specifies no minimum frequency. It may be possible to workaround this by using DMA to write to the I2C FIFO, but this is untested.
