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
