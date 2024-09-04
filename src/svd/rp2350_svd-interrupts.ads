pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

--  Definition of the device's interrupts
package RP2350_SVD.Interrupts
   with Preelaborate
is

   ----------------
   -- Interrupts --
   ----------------

   TIMER0_IRQ_0_Interrupt      : constant := 0;
   TIMER0_IRQ_1_Interrupt      : constant := 1;
   TIMER0_IRQ_2_Interrupt      : constant := 2;
   TIMER0_IRQ_3_Interrupt      : constant := 3;
   TIMER1_IRQ_0_Interrupt      : constant := 4;
   TIMER1_IRQ_1_Interrupt      : constant := 5;
   TIMER1_IRQ_2_Interrupt      : constant := 6;
   TIMER1_IRQ_3_Interrupt      : constant := 7;
   PWM_IRQ_WRAP_0_Interrupt    : constant := 8;
   PWM_IRQ_WRAP_1_Interrupt    : constant := 9;
   DMA_IRQ_0_Interrupt         : constant := 10;
   DMA_IRQ_1_Interrupt         : constant := 11;
   DMA_IRQ_2_Interrupt         : constant := 12;
   DMA_IRQ_3_Interrupt         : constant := 13;
   USBCTRL_Interrupt           : constant := 14;
   PIO0_IRQ_0_Interrupt        : constant := 15;
   PIO0_IRQ_1_Interrupt        : constant := 16;
   PIO1_IRQ_0_Interrupt        : constant := 17;
   PIO1_IRQ_1_Interrupt        : constant := 18;
   PIO2_IRQ_0_Interrupt        : constant := 19;
   PIO2_IRQ_1_Interrupt        : constant := 20;
   IO_IRQ_BANK0_Interrupt      : constant := 21;
   IO_IRQ_BANK0_NS_Interrupt   : constant := 22;
   IO_IRQ_QSPI_Interrupt       : constant := 23;
   IO_IRQ_QSPI_NS_Interrupt    : constant := 24;
   SIO_IRQ_FIFO_Interrupt      : constant := 25;
   SIO_IRQ_BELL_Interrupt      : constant := 26;
   SIO_IRQ_FIFO_NS_Interrupt   : constant := 27;
   SIO_IRQ_BELL_NS_Interrupt   : constant := 28;
   SIO_IRQ_MTIMECMP_Interrupt  : constant := 29;
   CLOCKS_Interrupt            : constant := 30;
   SPI0_Interrupt              : constant := 31;
   SPI1_Interrupt              : constant := 32;
   UART0_Interrupt             : constant := 33;
   UART1_Interrupt             : constant := 34;
   ADC_IRQ_FIFO_Interrupt      : constant := 35;
   I2C0_Interrupt              : constant := 36;
   I2C1_Interrupt              : constant := 37;
   OTP_Interrupt               : constant := 38;
   TRNG_Interrupt              : constant := 39;
   PLL_SYS_Interrupt           : constant := 42;
   PLL_USB_Interrupt           : constant := 43;
   POWMAN_IRQ_POW_Interrupt    : constant := 44;
   POWMAN_IRQ_TIMER_Interrupt  : constant := 45;

end RP2350_SVD.Interrupts;
