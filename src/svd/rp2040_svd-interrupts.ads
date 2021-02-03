pragma Style_Checks (Off);

--  Copyright (c) 2020 Raspberry Pi (Trading) Ltd.
--
--  SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2040.svd

--  Definition of the device's interrupts
package RP2040_SVD.Interrupts is

   ----------------
   -- Interrupts --
   ----------------

   TIMER_IRQ_0_Interrupt    : constant := 0;
   TIMER_IRQ_1_Interrupt    : constant := 1;
   TIMER_IRQ_2_Interrupt    : constant := 2;
   TIMER_IRQ_3_Interrupt    : constant := 3;
   PWM_IRQ_WRAP_Interrupt   : constant := 4;
   USBCTRL_Interrupt        : constant := 5;
   XIP_Interrupt            : constant := 6;
   PIO0_IRQ_0_Interrupt     : constant := 7;
   PIO0_IRQ_1_Interrupt     : constant := 8;
   PIO1_IRQ_0_Interrupt     : constant := 9;
   PIO1_IRQ_1_Interrupt     : constant := 10;
   DMA_IRQ_0_Interrupt      : constant := 11;
   DMA_IRQ_1_Interrupt      : constant := 12;
   IO_IRQ_BANK0_Interrupt   : constant := 13;
   IO_IRQ_QSPI_Interrupt    : constant := 14;
   SIO_IRQ_PROC0_Interrupt  : constant := 15;
   SIO_IRQ_PROC1_Interrupt  : constant := 16;
   CLOCKS_Interrupt         : constant := 17;
   SPI0_Interrupt           : constant := 18;
   SPI1_Interrupt           : constant := 19;
   UART0_Interrupt          : constant := 20;
   UART1_Interrupt          : constant := 21;
   ADC_IRQ_FIFO_Interrupt   : constant := 22;
   I2C0_Interrupt           : constant := 23;
   I2C1_Interrupt           : constant := 24;
   RTC_Interrupt            : constant := 25;

end RP2040_SVD.Interrupts;
