--
--  Copyright 2021 (C) Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
package RP.Reset
   with Preelaborate
is

   type Reset_Id is
      (Reset_ADC,
       Reset_BUSCTRL,
       Reset_DMA,
       Reset_HSTX,
       Reset_I2C0,
       Reset_I2C1,
       Reset_IO_BANK0,
       Reset_QSPI,
       Reset_JTAG,
       Reset_PADS_BANK0,
       Reset_PADS_QSPI,
       Reset_PIO0,
       Reset_PIO1,
       Reset_PIO2,
       Reset_PLL_SYS,
       Reset_PLL_USB,
       Reset_PWM,
       Reset_SHA256,
       Reset_SPI0,
       Reset_SPI1,
       Reset_SYSCFG,
       Reset_SYSINFO,
       Reset_TBMAN,
       Reset_TIMER0,
       Reset_TIMER1,
       Reset_TRNG,
       Reset_UART0,
       Reset_UART1,
       Reset_USBCTRL);

   type Reset_Status is
      (Reset_Ok,
       Reset_Timeout);

   --  This will hang if the reset fails. Most drivers use this version.
   procedure Reset_Peripheral
      (Peripheral : Reset_Id);

   --  Timeout is specified in Milliseconds. No peripheral should take more
   --  than a few cycles to reset.
   procedure Reset_Peripheral
      (Peripheral : Reset_Id;
       Status     : out Reset_Status;
       Timeout    : Natural := 100)
   with Pre => Peripheral /= Reset_TIMER0;

end RP.Reset;
