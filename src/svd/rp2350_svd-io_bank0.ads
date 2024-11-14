pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package RP2350_SVD.IO_BANK0 is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   type GPIO0_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO0_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO0_CTRL_FUNCSEL_Field is
     (jtag_tck,
      spi0_rx,
      uart0_tx,
      i2c0_sda,
      pwm_a_0,
      siob_proc_0,
      pio0_0,
      pio1_0,
      pio2_0,
      xip_ss_n_1,
      usb_muxing_overcurr_detect,
      null_k)
     with Size => 5;
   for GPIO0_CTRL_FUNCSEL_Field use
     (jtag_tck => 0,
      spi0_rx => 1,
      uart0_tx => 2,
      i2c0_sda => 3,
      pwm_a_0 => 4,
      siob_proc_0 => 5,
      pio0_0 => 6,
      pio1_0 => 7,
      pio2_0 => 8,
      xip_ss_n_1 => 9,
      usb_muxing_overcurr_detect => 10,
      null_k => 31);

   type GPIO0_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO0_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO0_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO0_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO0_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO0_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO0_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO0_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO0_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO0_CTRL_FUNCSEL_Field := RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO0_CTRL_OUTOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO0_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO0_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO0_CTRL_IRQOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO0_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO1_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO1_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO1_CTRL_FUNCSEL_Field is
     (jtag_tms,
      spi0_ss_n,
      uart0_rx,
      i2c0_scl,
      pwm_b_0,
      siob_proc_1,
      pio0_1,
      pio1_1,
      pio2_1,
      coresight_traceclk,
      usb_muxing_vbus_detect,
      null_k)
     with Size => 5;
   for GPIO1_CTRL_FUNCSEL_Field use
     (jtag_tms => 0,
      spi0_ss_n => 1,
      uart0_rx => 2,
      i2c0_scl => 3,
      pwm_b_0 => 4,
      siob_proc_1 => 5,
      pio0_1 => 6,
      pio1_1 => 7,
      pio2_1 => 8,
      coresight_traceclk => 9,
      usb_muxing_vbus_detect => 10,
      null_k => 31);

   type GPIO1_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO1_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO1_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO1_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO1_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO1_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO1_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO1_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO1_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO1_CTRL_FUNCSEL_Field := RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO1_CTRL_OUTOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO1_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO1_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO1_CTRL_IRQOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO1_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO2_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO2_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO2_CTRL_FUNCSEL_Field is
     (jtag_tdi,
      spi0_sclk,
      uart0_cts,
      i2c1_sda,
      pwm_a_1,
      siob_proc_2,
      pio0_2,
      pio1_2,
      pio2_2,
      coresight_tracedata_0,
      usb_muxing_vbus_en,
      uart0_tx,
      null_k)
     with Size => 5;
   for GPIO2_CTRL_FUNCSEL_Field use
     (jtag_tdi => 0,
      spi0_sclk => 1,
      uart0_cts => 2,
      i2c1_sda => 3,
      pwm_a_1 => 4,
      siob_proc_2 => 5,
      pio0_2 => 6,
      pio1_2 => 7,
      pio2_2 => 8,
      coresight_tracedata_0 => 9,
      usb_muxing_vbus_en => 10,
      uart0_tx => 11,
      null_k => 31);

   type GPIO2_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO2_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO2_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO2_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO2_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO2_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO2_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO2_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO2_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO2_CTRL_FUNCSEL_Field := RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO2_CTRL_OUTOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO2_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO2_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO2_CTRL_IRQOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO2_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO3_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO3_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO3_CTRL_FUNCSEL_Field is
     (jtag_tdo,
      spi0_tx,
      uart0_rts,
      i2c1_scl,
      pwm_b_1,
      siob_proc_3,
      pio0_3,
      pio1_3,
      pio2_3,
      coresight_tracedata_1,
      usb_muxing_overcurr_detect,
      uart0_rx,
      null_k)
     with Size => 5;
   for GPIO3_CTRL_FUNCSEL_Field use
     (jtag_tdo => 0,
      spi0_tx => 1,
      uart0_rts => 2,
      i2c1_scl => 3,
      pwm_b_1 => 4,
      siob_proc_3 => 5,
      pio0_3 => 6,
      pio1_3 => 7,
      pio2_3 => 8,
      coresight_tracedata_1 => 9,
      usb_muxing_overcurr_detect => 10,
      uart0_rx => 11,
      null_k => 31);

   type GPIO3_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO3_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO3_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO3_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO3_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO3_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO3_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO3_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO3_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO3_CTRL_FUNCSEL_Field := RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO3_CTRL_OUTOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO3_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO3_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO3_CTRL_IRQOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO3_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO4_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO4_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO4_CTRL_FUNCSEL_Field is
     (spi0_rx,
      uart1_tx,
      i2c0_sda,
      pwm_a_2,
      siob_proc_4,
      pio0_4,
      pio1_4,
      pio2_4,
      coresight_tracedata_2,
      usb_muxing_vbus_detect,
      null_k)
     with Size => 5;
   for GPIO4_CTRL_FUNCSEL_Field use
     (spi0_rx => 1,
      uart1_tx => 2,
      i2c0_sda => 3,
      pwm_a_2 => 4,
      siob_proc_4 => 5,
      pio0_4 => 6,
      pio1_4 => 7,
      pio2_4 => 8,
      coresight_tracedata_2 => 9,
      usb_muxing_vbus_detect => 10,
      null_k => 31);

   type GPIO4_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO4_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO4_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO4_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO4_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO4_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO4_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO4_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO4_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO4_CTRL_FUNCSEL_Field := RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO4_CTRL_OUTOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO4_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO4_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO4_CTRL_IRQOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO4_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO5_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO5_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO5_CTRL_FUNCSEL_Field is
     (spi0_ss_n,
      uart1_rx,
      i2c0_scl,
      pwm_b_2,
      siob_proc_5,
      pio0_5,
      pio1_5,
      pio2_5,
      coresight_tracedata_3,
      usb_muxing_vbus_en,
      null_k)
     with Size => 5;
   for GPIO5_CTRL_FUNCSEL_Field use
     (spi0_ss_n => 1,
      uart1_rx => 2,
      i2c0_scl => 3,
      pwm_b_2 => 4,
      siob_proc_5 => 5,
      pio0_5 => 6,
      pio1_5 => 7,
      pio2_5 => 8,
      coresight_tracedata_3 => 9,
      usb_muxing_vbus_en => 10,
      null_k => 31);

   type GPIO5_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO5_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO5_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO5_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO5_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO5_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO5_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO5_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO5_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO5_CTRL_FUNCSEL_Field := RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO5_CTRL_OUTOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO5_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO5_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO5_CTRL_IRQOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO5_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO6_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO6_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO6_CTRL_FUNCSEL_Field is
     (spi0_sclk,
      uart1_cts,
      i2c1_sda,
      pwm_a_3,
      siob_proc_6,
      pio0_6,
      pio1_6,
      pio2_6,
      usb_muxing_overcurr_detect,
      uart1_tx,
      null_k)
     with Size => 5;
   for GPIO6_CTRL_FUNCSEL_Field use
     (spi0_sclk => 1,
      uart1_cts => 2,
      i2c1_sda => 3,
      pwm_a_3 => 4,
      siob_proc_6 => 5,
      pio0_6 => 6,
      pio1_6 => 7,
      pio2_6 => 8,
      usb_muxing_overcurr_detect => 10,
      uart1_tx => 11,
      null_k => 31);

   type GPIO6_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO6_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO6_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO6_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO6_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO6_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO6_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO6_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO6_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO6_CTRL_FUNCSEL_Field := RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO6_CTRL_OUTOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO6_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO6_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO6_CTRL_IRQOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO6_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO7_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO7_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO7_CTRL_FUNCSEL_Field is
     (spi0_tx,
      uart1_rts,
      i2c1_scl,
      pwm_b_3,
      siob_proc_7,
      pio0_7,
      pio1_7,
      pio2_7,
      usb_muxing_vbus_detect,
      uart1_rx,
      null_k)
     with Size => 5;
   for GPIO7_CTRL_FUNCSEL_Field use
     (spi0_tx => 1,
      uart1_rts => 2,
      i2c1_scl => 3,
      pwm_b_3 => 4,
      siob_proc_7 => 5,
      pio0_7 => 6,
      pio1_7 => 7,
      pio2_7 => 8,
      usb_muxing_vbus_detect => 10,
      uart1_rx => 11,
      null_k => 31);

   type GPIO7_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO7_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO7_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO7_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO7_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO7_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO7_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO7_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO7_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO7_CTRL_FUNCSEL_Field := RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO7_CTRL_OUTOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO7_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO7_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO7_CTRL_IRQOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO7_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO8_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO8_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO8_CTRL_FUNCSEL_Field is
     (spi1_rx,
      uart1_tx,
      i2c0_sda,
      pwm_a_4,
      siob_proc_8,
      pio0_8,
      pio1_8,
      pio2_8,
      xip_ss_n_1,
      usb_muxing_vbus_en,
      null_k)
     with Size => 5;
   for GPIO8_CTRL_FUNCSEL_Field use
     (spi1_rx => 1,
      uart1_tx => 2,
      i2c0_sda => 3,
      pwm_a_4 => 4,
      siob_proc_8 => 5,
      pio0_8 => 6,
      pio1_8 => 7,
      pio2_8 => 8,
      xip_ss_n_1 => 9,
      usb_muxing_vbus_en => 10,
      null_k => 31);

   type GPIO8_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO8_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO8_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO8_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO8_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO8_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO8_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO8_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO8_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO8_CTRL_FUNCSEL_Field := RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO8_CTRL_OUTOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO8_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO8_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO8_CTRL_IRQOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO8_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO9_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO9_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO9_CTRL_FUNCSEL_Field is
     (spi1_ss_n,
      uart1_rx,
      i2c0_scl,
      pwm_b_4,
      siob_proc_9,
      pio0_9,
      pio1_9,
      pio2_9,
      usb_muxing_overcurr_detect,
      null_k)
     with Size => 5;
   for GPIO9_CTRL_FUNCSEL_Field use
     (spi1_ss_n => 1,
      uart1_rx => 2,
      i2c0_scl => 3,
      pwm_b_4 => 4,
      siob_proc_9 => 5,
      pio0_9 => 6,
      pio1_9 => 7,
      pio2_9 => 8,
      usb_muxing_overcurr_detect => 10,
      null_k => 31);

   type GPIO9_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO9_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO9_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO9_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO9_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO9_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO9_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO9_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO9_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO9_CTRL_FUNCSEL_Field := RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO9_CTRL_OUTOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO9_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO9_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO9_CTRL_IRQOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO9_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO10_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO10_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO10_CTRL_FUNCSEL_Field is
     (spi1_sclk,
      uart1_cts,
      i2c1_sda,
      pwm_a_5,
      siob_proc_10,
      pio0_10,
      pio1_10,
      pio2_10,
      usb_muxing_vbus_detect,
      uart1_tx,
      null_k)
     with Size => 5;
   for GPIO10_CTRL_FUNCSEL_Field use
     (spi1_sclk => 1,
      uart1_cts => 2,
      i2c1_sda => 3,
      pwm_a_5 => 4,
      siob_proc_10 => 5,
      pio0_10 => 6,
      pio1_10 => 7,
      pio2_10 => 8,
      usb_muxing_vbus_detect => 10,
      uart1_tx => 11,
      null_k => 31);

   type GPIO10_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO10_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO10_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO10_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO10_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO10_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO10_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO10_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO10_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO10_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO10_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO10_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO10_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO10_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO10_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO11_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO11_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO11_CTRL_FUNCSEL_Field is
     (spi1_tx,
      uart1_rts,
      i2c1_scl,
      pwm_b_5,
      siob_proc_11,
      pio0_11,
      pio1_11,
      pio2_11,
      usb_muxing_vbus_en,
      uart1_rx,
      null_k)
     with Size => 5;
   for GPIO11_CTRL_FUNCSEL_Field use
     (spi1_tx => 1,
      uart1_rts => 2,
      i2c1_scl => 3,
      pwm_b_5 => 4,
      siob_proc_11 => 5,
      pio0_11 => 6,
      pio1_11 => 7,
      pio2_11 => 8,
      usb_muxing_vbus_en => 10,
      uart1_rx => 11,
      null_k => 31);

   type GPIO11_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO11_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO11_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO11_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO11_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO11_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO11_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO11_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO11_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO11_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO11_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO11_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO11_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO11_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO11_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO12_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO12_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO12_CTRL_FUNCSEL_Field is
     (hstx_0,
      spi1_rx,
      uart0_tx,
      i2c0_sda,
      pwm_a_6,
      siob_proc_12,
      pio0_12,
      pio1_12,
      pio2_12,
      clocks_gpin_0,
      usb_muxing_overcurr_detect,
      null_k)
     with Size => 5;
   for GPIO12_CTRL_FUNCSEL_Field use
     (hstx_0 => 0,
      spi1_rx => 1,
      uart0_tx => 2,
      i2c0_sda => 3,
      pwm_a_6 => 4,
      siob_proc_12 => 5,
      pio0_12 => 6,
      pio1_12 => 7,
      pio2_12 => 8,
      clocks_gpin_0 => 9,
      usb_muxing_overcurr_detect => 10,
      null_k => 31);

   type GPIO12_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO12_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO12_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO12_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO12_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO12_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO12_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO12_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO12_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO12_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO12_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO12_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO12_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO12_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO12_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO13_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO13_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO13_CTRL_FUNCSEL_Field is
     (hstx_1,
      spi1_ss_n,
      uart0_rx,
      i2c0_scl,
      pwm_b_6,
      siob_proc_13,
      pio0_13,
      pio1_13,
      pio2_13,
      clocks_gpout_0,
      usb_muxing_vbus_detect,
      null_k)
     with Size => 5;
   for GPIO13_CTRL_FUNCSEL_Field use
     (hstx_1 => 0,
      spi1_ss_n => 1,
      uart0_rx => 2,
      i2c0_scl => 3,
      pwm_b_6 => 4,
      siob_proc_13 => 5,
      pio0_13 => 6,
      pio1_13 => 7,
      pio2_13 => 8,
      clocks_gpout_0 => 9,
      usb_muxing_vbus_detect => 10,
      null_k => 31);

   type GPIO13_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO13_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO13_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO13_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO13_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO13_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO13_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO13_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO13_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO13_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO13_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO13_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO13_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO13_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO13_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO14_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO14_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO14_CTRL_FUNCSEL_Field is
     (hstx_2,
      spi1_sclk,
      uart0_cts,
      i2c1_sda,
      pwm_a_7,
      siob_proc_14,
      pio0_14,
      pio1_14,
      pio2_14,
      clocks_gpin_1,
      usb_muxing_vbus_en,
      uart0_tx,
      null_k)
     with Size => 5;
   for GPIO14_CTRL_FUNCSEL_Field use
     (hstx_2 => 0,
      spi1_sclk => 1,
      uart0_cts => 2,
      i2c1_sda => 3,
      pwm_a_7 => 4,
      siob_proc_14 => 5,
      pio0_14 => 6,
      pio1_14 => 7,
      pio2_14 => 8,
      clocks_gpin_1 => 9,
      usb_muxing_vbus_en => 10,
      uart0_tx => 11,
      null_k => 31);

   type GPIO14_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO14_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO14_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO14_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO14_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO14_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO14_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO14_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO14_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO14_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO14_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO14_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO14_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO14_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO14_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO15_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO15_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO15_CTRL_FUNCSEL_Field is
     (hstx_3,
      spi1_tx,
      uart0_rts,
      i2c1_scl,
      pwm_b_7,
      siob_proc_15,
      pio0_15,
      pio1_15,
      pio2_15,
      clocks_gpout_1,
      usb_muxing_overcurr_detect,
      uart0_rx,
      null_k)
     with Size => 5;
   for GPIO15_CTRL_FUNCSEL_Field use
     (hstx_3 => 0,
      spi1_tx => 1,
      uart0_rts => 2,
      i2c1_scl => 3,
      pwm_b_7 => 4,
      siob_proc_15 => 5,
      pio0_15 => 6,
      pio1_15 => 7,
      pio2_15 => 8,
      clocks_gpout_1 => 9,
      usb_muxing_overcurr_detect => 10,
      uart0_rx => 11,
      null_k => 31);

   type GPIO15_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO15_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO15_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO15_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO15_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO15_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO15_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO15_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO15_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO15_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO15_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO15_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO15_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO15_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO15_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO16_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO16_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO16_CTRL_FUNCSEL_Field is
     (hstx_4,
      spi0_rx,
      uart0_tx,
      i2c0_sda,
      pwm_a_0,
      siob_proc_16,
      pio0_16,
      pio1_16,
      pio2_16,
      usb_muxing_vbus_detect,
      null_k)
     with Size => 5;
   for GPIO16_CTRL_FUNCSEL_Field use
     (hstx_4 => 0,
      spi0_rx => 1,
      uart0_tx => 2,
      i2c0_sda => 3,
      pwm_a_0 => 4,
      siob_proc_16 => 5,
      pio0_16 => 6,
      pio1_16 => 7,
      pio2_16 => 8,
      usb_muxing_vbus_detect => 10,
      null_k => 31);

   type GPIO16_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO16_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO16_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO16_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO16_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO16_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO16_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO16_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO16_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO16_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO16_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO16_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO16_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO16_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO16_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO17_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO17_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO17_CTRL_FUNCSEL_Field is
     (hstx_5,
      spi0_ss_n,
      uart0_rx,
      i2c0_scl,
      pwm_b_0,
      siob_proc_17,
      pio0_17,
      pio1_17,
      pio2_17,
      usb_muxing_vbus_en,
      null_k)
     with Size => 5;
   for GPIO17_CTRL_FUNCSEL_Field use
     (hstx_5 => 0,
      spi0_ss_n => 1,
      uart0_rx => 2,
      i2c0_scl => 3,
      pwm_b_0 => 4,
      siob_proc_17 => 5,
      pio0_17 => 6,
      pio1_17 => 7,
      pio2_17 => 8,
      usb_muxing_vbus_en => 10,
      null_k => 31);

   type GPIO17_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO17_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO17_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO17_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO17_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO17_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO17_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO17_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO17_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO17_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO17_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO17_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO17_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO17_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO17_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO18_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO18_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO18_CTRL_FUNCSEL_Field is
     (hstx_6,
      spi0_sclk,
      uart0_cts,
      i2c1_sda,
      pwm_a_1,
      siob_proc_18,
      pio0_18,
      pio1_18,
      pio2_18,
      usb_muxing_overcurr_detect,
      uart0_tx,
      null_k)
     with Size => 5;
   for GPIO18_CTRL_FUNCSEL_Field use
     (hstx_6 => 0,
      spi0_sclk => 1,
      uart0_cts => 2,
      i2c1_sda => 3,
      pwm_a_1 => 4,
      siob_proc_18 => 5,
      pio0_18 => 6,
      pio1_18 => 7,
      pio2_18 => 8,
      usb_muxing_overcurr_detect => 10,
      uart0_tx => 11,
      null_k => 31);

   type GPIO18_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO18_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO18_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO18_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO18_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO18_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO18_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO18_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO18_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO18_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO18_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO18_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO18_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO18_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO18_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO19_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO19_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO19_CTRL_FUNCSEL_Field is
     (hstx_7,
      spi0_tx,
      uart0_rts,
      i2c1_scl,
      pwm_b_1,
      siob_proc_19,
      pio0_19,
      pio1_19,
      pio2_19,
      xip_ss_n_1,
      usb_muxing_vbus_detect,
      uart0_rx,
      null_k)
     with Size => 5;
   for GPIO19_CTRL_FUNCSEL_Field use
     (hstx_7 => 0,
      spi0_tx => 1,
      uart0_rts => 2,
      i2c1_scl => 3,
      pwm_b_1 => 4,
      siob_proc_19 => 5,
      pio0_19 => 6,
      pio1_19 => 7,
      pio2_19 => 8,
      xip_ss_n_1 => 9,
      usb_muxing_vbus_detect => 10,
      uart0_rx => 11,
      null_k => 31);

   type GPIO19_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO19_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO19_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO19_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO19_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO19_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO19_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO19_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO19_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO19_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO19_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO19_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO19_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO19_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO19_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO20_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO20_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO20_CTRL_FUNCSEL_Field is
     (spi0_rx,
      uart1_tx,
      i2c0_sda,
      pwm_a_2,
      siob_proc_20,
      pio0_20,
      pio1_20,
      pio2_20,
      clocks_gpin_0,
      usb_muxing_vbus_en,
      null_k)
     with Size => 5;
   for GPIO20_CTRL_FUNCSEL_Field use
     (spi0_rx => 1,
      uart1_tx => 2,
      i2c0_sda => 3,
      pwm_a_2 => 4,
      siob_proc_20 => 5,
      pio0_20 => 6,
      pio1_20 => 7,
      pio2_20 => 8,
      clocks_gpin_0 => 9,
      usb_muxing_vbus_en => 10,
      null_k => 31);

   type GPIO20_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO20_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO20_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO20_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO20_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO20_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO20_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO20_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO20_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO20_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO20_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO20_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO20_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO20_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO20_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO21_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO21_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO21_CTRL_FUNCSEL_Field is
     (spi0_ss_n,
      uart1_rx,
      i2c0_scl,
      pwm_b_2,
      siob_proc_21,
      pio0_21,
      pio1_21,
      pio2_21,
      clocks_gpout_0,
      usb_muxing_overcurr_detect,
      null_k)
     with Size => 5;
   for GPIO21_CTRL_FUNCSEL_Field use
     (spi0_ss_n => 1,
      uart1_rx => 2,
      i2c0_scl => 3,
      pwm_b_2 => 4,
      siob_proc_21 => 5,
      pio0_21 => 6,
      pio1_21 => 7,
      pio2_21 => 8,
      clocks_gpout_0 => 9,
      usb_muxing_overcurr_detect => 10,
      null_k => 31);

   type GPIO21_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO21_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO21_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO21_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO21_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO21_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO21_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO21_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO21_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO21_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO21_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO21_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO21_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO21_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO21_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO22_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO22_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO22_CTRL_FUNCSEL_Field is
     (spi0_sclk,
      uart1_cts,
      i2c1_sda,
      pwm_a_3,
      siob_proc_22,
      pio0_22,
      pio1_22,
      pio2_22,
      clocks_gpin_1,
      usb_muxing_vbus_detect,
      uart1_tx,
      null_k)
     with Size => 5;
   for GPIO22_CTRL_FUNCSEL_Field use
     (spi0_sclk => 1,
      uart1_cts => 2,
      i2c1_sda => 3,
      pwm_a_3 => 4,
      siob_proc_22 => 5,
      pio0_22 => 6,
      pio1_22 => 7,
      pio2_22 => 8,
      clocks_gpin_1 => 9,
      usb_muxing_vbus_detect => 10,
      uart1_tx => 11,
      null_k => 31);

   type GPIO22_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO22_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO22_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO22_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO22_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO22_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO22_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO22_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO22_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO22_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO22_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO22_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO22_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO22_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO22_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO23_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO23_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO23_CTRL_FUNCSEL_Field is
     (spi0_tx,
      uart1_rts,
      i2c1_scl,
      pwm_b_3,
      siob_proc_23,
      pio0_23,
      pio1_23,
      pio2_23,
      clocks_gpout_1,
      usb_muxing_vbus_en,
      uart1_rx,
      null_k)
     with Size => 5;
   for GPIO23_CTRL_FUNCSEL_Field use
     (spi0_tx => 1,
      uart1_rts => 2,
      i2c1_scl => 3,
      pwm_b_3 => 4,
      siob_proc_23 => 5,
      pio0_23 => 6,
      pio1_23 => 7,
      pio2_23 => 8,
      clocks_gpout_1 => 9,
      usb_muxing_vbus_en => 10,
      uart1_rx => 11,
      null_k => 31);

   type GPIO23_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO23_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO23_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO23_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO23_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO23_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO23_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO23_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO23_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO23_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO23_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO23_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO23_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO23_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO23_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO24_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO24_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO24_CTRL_FUNCSEL_Field is
     (spi1_rx,
      uart1_tx,
      i2c0_sda,
      pwm_a_4,
      siob_proc_24,
      pio0_24,
      pio1_24,
      pio2_24,
      clocks_gpout_2,
      usb_muxing_overcurr_detect,
      null_k)
     with Size => 5;
   for GPIO24_CTRL_FUNCSEL_Field use
     (spi1_rx => 1,
      uart1_tx => 2,
      i2c0_sda => 3,
      pwm_a_4 => 4,
      siob_proc_24 => 5,
      pio0_24 => 6,
      pio1_24 => 7,
      pio2_24 => 8,
      clocks_gpout_2 => 9,
      usb_muxing_overcurr_detect => 10,
      null_k => 31);

   type GPIO24_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO24_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO24_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO24_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO24_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO24_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO24_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO24_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO24_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO24_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO24_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO24_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO24_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO24_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO24_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO25_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO25_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO25_CTRL_FUNCSEL_Field is
     (spi1_ss_n,
      uart1_rx,
      i2c0_scl,
      pwm_b_4,
      siob_proc_25,
      pio0_25,
      pio1_25,
      pio2_25,
      clocks_gpout_3,
      usb_muxing_vbus_detect,
      null_k)
     with Size => 5;
   for GPIO25_CTRL_FUNCSEL_Field use
     (spi1_ss_n => 1,
      uart1_rx => 2,
      i2c0_scl => 3,
      pwm_b_4 => 4,
      siob_proc_25 => 5,
      pio0_25 => 6,
      pio1_25 => 7,
      pio2_25 => 8,
      clocks_gpout_3 => 9,
      usb_muxing_vbus_detect => 10,
      null_k => 31);

   type GPIO25_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO25_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO25_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO25_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO25_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO25_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO25_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO25_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO25_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO25_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO25_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO25_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO25_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO25_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO25_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO26_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO26_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO26_CTRL_FUNCSEL_Field is
     (spi1_sclk,
      uart1_cts,
      i2c1_sda,
      pwm_a_5,
      siob_proc_26,
      pio0_26,
      pio1_26,
      pio2_26,
      usb_muxing_vbus_en,
      uart1_tx,
      null_k)
     with Size => 5;
   for GPIO26_CTRL_FUNCSEL_Field use
     (spi1_sclk => 1,
      uart1_cts => 2,
      i2c1_sda => 3,
      pwm_a_5 => 4,
      siob_proc_26 => 5,
      pio0_26 => 6,
      pio1_26 => 7,
      pio2_26 => 8,
      usb_muxing_vbus_en => 10,
      uart1_tx => 11,
      null_k => 31);

   type GPIO26_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO26_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO26_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO26_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO26_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO26_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO26_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO26_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO26_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO26_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO26_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO26_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO26_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO26_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO26_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO27_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO27_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO27_CTRL_FUNCSEL_Field is
     (spi1_tx,
      uart1_rts,
      i2c1_scl,
      pwm_b_5,
      siob_proc_27,
      pio0_27,
      pio1_27,
      pio2_27,
      usb_muxing_overcurr_detect,
      uart1_rx,
      null_k)
     with Size => 5;
   for GPIO27_CTRL_FUNCSEL_Field use
     (spi1_tx => 1,
      uart1_rts => 2,
      i2c1_scl => 3,
      pwm_b_5 => 4,
      siob_proc_27 => 5,
      pio0_27 => 6,
      pio1_27 => 7,
      pio2_27 => 8,
      usb_muxing_overcurr_detect => 10,
      uart1_rx => 11,
      null_k => 31);

   type GPIO27_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO27_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO27_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO27_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO27_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO27_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO27_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO27_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO27_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO27_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO27_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO27_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO27_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO27_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO27_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO28_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO28_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO28_CTRL_FUNCSEL_Field is
     (spi1_rx,
      uart0_tx,
      i2c0_sda,
      pwm_a_6,
      siob_proc_28,
      pio0_28,
      pio1_28,
      pio2_28,
      usb_muxing_vbus_detect,
      null_k)
     with Size => 5;
   for GPIO28_CTRL_FUNCSEL_Field use
     (spi1_rx => 1,
      uart0_tx => 2,
      i2c0_sda => 3,
      pwm_a_6 => 4,
      siob_proc_28 => 5,
      pio0_28 => 6,
      pio1_28 => 7,
      pio2_28 => 8,
      usb_muxing_vbus_detect => 10,
      null_k => 31);

   type GPIO28_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO28_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO28_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO28_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO28_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO28_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO28_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO28_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO28_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO28_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO28_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO28_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO28_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO28_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO28_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO29_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO29_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO29_CTRL_FUNCSEL_Field is
     (spi1_ss_n,
      uart0_rx,
      i2c0_scl,
      pwm_b_6,
      siob_proc_29,
      pio0_29,
      pio1_29,
      pio2_29,
      usb_muxing_vbus_en,
      null_k)
     with Size => 5;
   for GPIO29_CTRL_FUNCSEL_Field use
     (spi1_ss_n => 1,
      uart0_rx => 2,
      i2c0_scl => 3,
      pwm_b_6 => 4,
      siob_proc_29 => 5,
      pio0_29 => 6,
      pio1_29 => 7,
      pio2_29 => 8,
      usb_muxing_vbus_en => 10,
      null_k => 31);

   type GPIO29_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO29_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO29_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO29_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO29_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO29_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO29_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO29_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO29_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO29_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO29_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO29_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO29_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO29_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO29_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO30_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO30_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO30_CTRL_FUNCSEL_Field is
     (spi1_sclk,
      uart0_cts,
      i2c1_sda,
      pwm_a_7,
      siob_proc_30,
      pio0_30,
      pio1_30,
      pio2_30,
      usb_muxing_overcurr_detect,
      uart0_tx,
      null_k)
     with Size => 5;
   for GPIO30_CTRL_FUNCSEL_Field use
     (spi1_sclk => 1,
      uart0_cts => 2,
      i2c1_sda => 3,
      pwm_a_7 => 4,
      siob_proc_30 => 5,
      pio0_30 => 6,
      pio1_30 => 7,
      pio2_30 => 8,
      usb_muxing_overcurr_detect => 10,
      uart0_tx => 11,
      null_k => 31);

   type GPIO30_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO30_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO30_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO30_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO30_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO30_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO30_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO30_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO30_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO30_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO30_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO30_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO30_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO30_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO30_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO31_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO31_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO31_CTRL_FUNCSEL_Field is
     (spi1_tx,
      uart0_rts,
      i2c1_scl,
      pwm_b_7,
      siob_proc_31,
      pio0_31,
      pio1_31,
      pio2_31,
      usb_muxing_vbus_detect,
      uart0_rx,
      null_k)
     with Size => 5;
   for GPIO31_CTRL_FUNCSEL_Field use
     (spi1_tx => 1,
      uart0_rts => 2,
      i2c1_scl => 3,
      pwm_b_7 => 4,
      siob_proc_31 => 5,
      pio0_31 => 6,
      pio1_31 => 7,
      pio2_31 => 8,
      usb_muxing_vbus_detect => 10,
      uart0_rx => 11,
      null_k => 31);

   type GPIO31_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO31_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO31_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO31_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO31_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO31_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO31_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO31_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO31_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO31_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO31_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO31_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO31_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO31_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO31_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO32_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO32_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO32_CTRL_FUNCSEL_Field is
     (spi0_rx,
      uart0_tx,
      i2c0_sda,
      pwm_a_8,
      siob_proc_32,
      pio0_32,
      pio1_32,
      pio2_32,
      usb_muxing_vbus_en,
      null_k)
     with Size => 5;
   for GPIO32_CTRL_FUNCSEL_Field use
     (spi0_rx => 1,
      uart0_tx => 2,
      i2c0_sda => 3,
      pwm_a_8 => 4,
      siob_proc_32 => 5,
      pio0_32 => 6,
      pio1_32 => 7,
      pio2_32 => 8,
      usb_muxing_vbus_en => 10,
      null_k => 31);

   type GPIO32_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO32_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO32_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO32_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO32_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO32_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO32_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO32_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO32_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO32_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO32_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO32_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO32_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO32_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO32_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO33_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO33_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO33_CTRL_FUNCSEL_Field is
     (spi0_ss_n,
      uart0_rx,
      i2c0_scl,
      pwm_b_8,
      siob_proc_33,
      pio0_33,
      pio1_33,
      pio2_33,
      usb_muxing_overcurr_detect,
      null_k)
     with Size => 5;
   for GPIO33_CTRL_FUNCSEL_Field use
     (spi0_ss_n => 1,
      uart0_rx => 2,
      i2c0_scl => 3,
      pwm_b_8 => 4,
      siob_proc_33 => 5,
      pio0_33 => 6,
      pio1_33 => 7,
      pio2_33 => 8,
      usb_muxing_overcurr_detect => 10,
      null_k => 31);

   type GPIO33_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO33_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO33_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO33_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO33_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO33_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO33_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO33_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO33_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO33_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO33_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO33_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO33_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO33_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO33_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO34_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO34_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO34_CTRL_FUNCSEL_Field is
     (spi0_sclk,
      uart0_cts,
      i2c1_sda,
      pwm_a_9,
      siob_proc_34,
      pio0_34,
      pio1_34,
      pio2_34,
      usb_muxing_vbus_detect,
      uart0_tx,
      null_k)
     with Size => 5;
   for GPIO34_CTRL_FUNCSEL_Field use
     (spi0_sclk => 1,
      uart0_cts => 2,
      i2c1_sda => 3,
      pwm_a_9 => 4,
      siob_proc_34 => 5,
      pio0_34 => 6,
      pio1_34 => 7,
      pio2_34 => 8,
      usb_muxing_vbus_detect => 10,
      uart0_tx => 11,
      null_k => 31);

   type GPIO34_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO34_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO34_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO34_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO34_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO34_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO34_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO34_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO34_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO34_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO34_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO34_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO34_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO34_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO34_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO35_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO35_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO35_CTRL_FUNCSEL_Field is
     (spi0_tx,
      uart0_rts,
      i2c1_scl,
      pwm_b_9,
      siob_proc_35,
      pio0_35,
      pio1_35,
      pio2_35,
      usb_muxing_vbus_en,
      uart0_rx,
      null_k)
     with Size => 5;
   for GPIO35_CTRL_FUNCSEL_Field use
     (spi0_tx => 1,
      uart0_rts => 2,
      i2c1_scl => 3,
      pwm_b_9 => 4,
      siob_proc_35 => 5,
      pio0_35 => 6,
      pio1_35 => 7,
      pio2_35 => 8,
      usb_muxing_vbus_en => 10,
      uart0_rx => 11,
      null_k => 31);

   type GPIO35_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO35_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO35_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO35_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO35_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO35_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO35_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO35_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO35_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO35_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO35_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO35_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO35_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO35_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO35_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO36_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO36_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO36_CTRL_FUNCSEL_Field is
     (spi0_rx,
      uart1_tx,
      i2c0_sda,
      pwm_a_10,
      siob_proc_36,
      pio0_36,
      pio1_36,
      pio2_36,
      usb_muxing_overcurr_detect,
      null_k)
     with Size => 5;
   for GPIO36_CTRL_FUNCSEL_Field use
     (spi0_rx => 1,
      uart1_tx => 2,
      i2c0_sda => 3,
      pwm_a_10 => 4,
      siob_proc_36 => 5,
      pio0_36 => 6,
      pio1_36 => 7,
      pio2_36 => 8,
      usb_muxing_overcurr_detect => 10,
      null_k => 31);

   type GPIO36_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO36_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO36_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO36_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO36_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO36_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO36_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO36_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO36_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO36_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO36_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO36_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO36_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO36_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO36_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO37_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO37_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO37_CTRL_FUNCSEL_Field is
     (spi0_ss_n,
      uart1_rx,
      i2c0_scl,
      pwm_b_10,
      siob_proc_37,
      pio0_37,
      pio1_37,
      pio2_37,
      usb_muxing_vbus_detect,
      null_k)
     with Size => 5;
   for GPIO37_CTRL_FUNCSEL_Field use
     (spi0_ss_n => 1,
      uart1_rx => 2,
      i2c0_scl => 3,
      pwm_b_10 => 4,
      siob_proc_37 => 5,
      pio0_37 => 6,
      pio1_37 => 7,
      pio2_37 => 8,
      usb_muxing_vbus_detect => 10,
      null_k => 31);

   type GPIO37_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO37_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO37_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO37_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO37_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO37_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO37_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO37_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO37_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO37_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO37_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO37_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO37_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO37_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO37_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO38_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO38_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO38_CTRL_FUNCSEL_Field is
     (spi0_sclk,
      uart1_cts,
      i2c1_sda,
      pwm_a_11,
      siob_proc_38,
      pio0_38,
      pio1_38,
      pio2_38,
      usb_muxing_vbus_en,
      uart1_tx,
      null_k)
     with Size => 5;
   for GPIO38_CTRL_FUNCSEL_Field use
     (spi0_sclk => 1,
      uart1_cts => 2,
      i2c1_sda => 3,
      pwm_a_11 => 4,
      siob_proc_38 => 5,
      pio0_38 => 6,
      pio1_38 => 7,
      pio2_38 => 8,
      usb_muxing_vbus_en => 10,
      uart1_tx => 11,
      null_k => 31);

   type GPIO38_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO38_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO38_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO38_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO38_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO38_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO38_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO38_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO38_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO38_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO38_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO38_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO38_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO38_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO38_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO39_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO39_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO39_CTRL_FUNCSEL_Field is
     (spi0_tx,
      uart1_rts,
      i2c1_scl,
      pwm_b_11,
      siob_proc_39,
      pio0_39,
      pio1_39,
      pio2_39,
      usb_muxing_overcurr_detect,
      uart1_rx,
      null_k)
     with Size => 5;
   for GPIO39_CTRL_FUNCSEL_Field use
     (spi0_tx => 1,
      uart1_rts => 2,
      i2c1_scl => 3,
      pwm_b_11 => 4,
      siob_proc_39 => 5,
      pio0_39 => 6,
      pio1_39 => 7,
      pio2_39 => 8,
      usb_muxing_overcurr_detect => 10,
      uart1_rx => 11,
      null_k => 31);

   type GPIO39_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO39_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO39_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO39_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO39_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO39_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO39_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO39_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO39_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO39_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO39_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO39_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO39_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO39_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO39_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO40_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO40_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO40_CTRL_FUNCSEL_Field is
     (spi1_rx,
      uart1_tx,
      i2c0_sda,
      pwm_a_8,
      siob_proc_40,
      pio0_40,
      pio1_40,
      pio2_40,
      usb_muxing_vbus_detect,
      null_k)
     with Size => 5;
   for GPIO40_CTRL_FUNCSEL_Field use
     (spi1_rx => 1,
      uart1_tx => 2,
      i2c0_sda => 3,
      pwm_a_8 => 4,
      siob_proc_40 => 5,
      pio0_40 => 6,
      pio1_40 => 7,
      pio2_40 => 8,
      usb_muxing_vbus_detect => 10,
      null_k => 31);

   type GPIO40_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO40_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO40_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO40_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO40_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO40_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO40_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO40_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO40_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO40_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO40_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO40_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO40_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO40_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO40_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO41_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO41_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO41_CTRL_FUNCSEL_Field is
     (spi1_ss_n,
      uart1_rx,
      i2c0_scl,
      pwm_b_8,
      siob_proc_41,
      pio0_41,
      pio1_41,
      pio2_41,
      usb_muxing_vbus_en,
      null_k)
     with Size => 5;
   for GPIO41_CTRL_FUNCSEL_Field use
     (spi1_ss_n => 1,
      uart1_rx => 2,
      i2c0_scl => 3,
      pwm_b_8 => 4,
      siob_proc_41 => 5,
      pio0_41 => 6,
      pio1_41 => 7,
      pio2_41 => 8,
      usb_muxing_vbus_en => 10,
      null_k => 31);

   type GPIO41_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO41_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO41_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO41_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO41_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO41_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO41_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO41_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO41_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO41_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO41_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO41_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO41_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO41_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO41_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO42_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO42_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO42_CTRL_FUNCSEL_Field is
     (spi1_sclk,
      uart1_cts,
      i2c1_sda,
      pwm_a_9,
      siob_proc_42,
      pio0_42,
      pio1_42,
      pio2_42,
      usb_muxing_overcurr_detect,
      uart1_tx,
      null_k)
     with Size => 5;
   for GPIO42_CTRL_FUNCSEL_Field use
     (spi1_sclk => 1,
      uart1_cts => 2,
      i2c1_sda => 3,
      pwm_a_9 => 4,
      siob_proc_42 => 5,
      pio0_42 => 6,
      pio1_42 => 7,
      pio2_42 => 8,
      usb_muxing_overcurr_detect => 10,
      uart1_tx => 11,
      null_k => 31);

   type GPIO42_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO42_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO42_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO42_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO42_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO42_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO42_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO42_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO42_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO42_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO42_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO42_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO42_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO42_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO42_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO43_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO43_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO43_CTRL_FUNCSEL_Field is
     (spi1_tx,
      uart1_rts,
      i2c1_scl,
      pwm_b_9,
      siob_proc_43,
      pio0_43,
      pio1_43,
      pio2_43,
      usb_muxing_vbus_detect,
      uart1_rx,
      null_k)
     with Size => 5;
   for GPIO43_CTRL_FUNCSEL_Field use
     (spi1_tx => 1,
      uart1_rts => 2,
      i2c1_scl => 3,
      pwm_b_9 => 4,
      siob_proc_43 => 5,
      pio0_43 => 6,
      pio1_43 => 7,
      pio2_43 => 8,
      usb_muxing_vbus_detect => 10,
      uart1_rx => 11,
      null_k => 31);

   type GPIO43_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO43_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO43_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO43_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO43_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO43_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO43_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO43_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO43_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO43_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO43_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO43_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO43_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO43_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO43_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO44_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO44_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO44_CTRL_FUNCSEL_Field is
     (spi1_rx,
      uart0_tx,
      i2c0_sda,
      pwm_a_10,
      siob_proc_44,
      pio0_44,
      pio1_44,
      pio2_44,
      usb_muxing_vbus_en,
      null_k)
     with Size => 5;
   for GPIO44_CTRL_FUNCSEL_Field use
     (spi1_rx => 1,
      uart0_tx => 2,
      i2c0_sda => 3,
      pwm_a_10 => 4,
      siob_proc_44 => 5,
      pio0_44 => 6,
      pio1_44 => 7,
      pio2_44 => 8,
      usb_muxing_vbus_en => 10,
      null_k => 31);

   type GPIO44_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO44_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO44_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO44_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO44_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO44_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO44_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO44_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO44_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO44_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO44_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO44_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO44_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO44_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO44_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO45_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO45_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO45_CTRL_FUNCSEL_Field is
     (spi1_ss_n,
      uart0_rx,
      i2c0_scl,
      pwm_b_10,
      siob_proc_45,
      pio0_45,
      pio1_45,
      pio2_45,
      usb_muxing_overcurr_detect,
      null_k)
     with Size => 5;
   for GPIO45_CTRL_FUNCSEL_Field use
     (spi1_ss_n => 1,
      uart0_rx => 2,
      i2c0_scl => 3,
      pwm_b_10 => 4,
      siob_proc_45 => 5,
      pio0_45 => 6,
      pio1_45 => 7,
      pio2_45 => 8,
      usb_muxing_overcurr_detect => 10,
      null_k => 31);

   type GPIO45_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO45_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO45_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO45_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO45_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO45_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO45_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO45_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO45_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO45_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO45_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO45_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO45_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO45_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO45_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO46_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO46_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO46_CTRL_FUNCSEL_Field is
     (spi1_sclk,
      uart0_cts,
      i2c1_sda,
      pwm_a_11,
      siob_proc_46,
      pio0_46,
      pio1_46,
      pio2_46,
      usb_muxing_vbus_detect,
      uart0_tx,
      null_k)
     with Size => 5;
   for GPIO46_CTRL_FUNCSEL_Field use
     (spi1_sclk => 1,
      uart0_cts => 2,
      i2c1_sda => 3,
      pwm_a_11 => 4,
      siob_proc_46 => 5,
      pio0_46 => 6,
      pio1_46 => 7,
      pio2_46 => 8,
      usb_muxing_vbus_detect => 10,
      uart0_tx => 11,
      null_k => 31);

   type GPIO46_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO46_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO46_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO46_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO46_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO46_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO46_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO46_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO46_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO46_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO46_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO46_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO46_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO46_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO46_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO47_STATUS_Register is record
      --  unspecified
      Reserved_0_8   : HAL.UInt9;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_12 : HAL.UInt3;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before filtering and override are
      --  applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_25 : HAL.UInt8;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO47_STATUS_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_25 at 0 range 18 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table 31 == NULL
   type GPIO47_CTRL_FUNCSEL_Field is
     (spi1_tx,
      uart0_rts,
      i2c1_scl,
      pwm_b_11,
      siob_proc_47,
      pio0_47,
      pio1_47,
      pio2_47,
      xip_ss_n_1,
      usb_muxing_vbus_en,
      uart0_rx,
      null_k)
     with Size => 5;
   for GPIO47_CTRL_FUNCSEL_Field use
     (spi1_tx => 1,
      uart0_rts => 2,
      i2c1_scl => 3,
      pwm_b_11 => 4,
      siob_proc_47 => 5,
      pio0_47 => 6,
      pio1_47 => 7,
      pio2_47 => 8,
      xip_ss_n_1 => 9,
      usb_muxing_vbus_en => 10,
      uart0_rx => 11,
      null_k => 31);

   type GPIO47_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO47_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO47_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO47_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO47_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO47_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO47_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO47_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO47_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO47_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO47_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      OEOVER         : GPIO47_CTRL_OEOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      INOVER         : GPIO47_CTRL_INOVER_Field := RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO47_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO47_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  IRQSUMMARY_PROC0_SECURE0_GPIO array
   type IRQSUMMARY_PROC0_SECURE0_GPIO_Field_Array is array (0 .. 31)
     of Boolean
     with Component_Size => 1, Size => 32;

   type IRQSUMMARY_PROC0_SECURE0_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  GPIO as a value
            Val : HAL.UInt32;
         when True =>
            --  GPIO as an array
            Arr : IRQSUMMARY_PROC0_SECURE0_GPIO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRQSUMMARY_PROC0_SECURE0_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  IRQSUMMARY_PROC0_SECURE1_GPIO array
   type IRQSUMMARY_PROC0_SECURE1_GPIO_Field_Array is array (32 .. 47)
     of Boolean
     with Component_Size => 1, Size => 16;

   --  Type definition for IRQSUMMARY_PROC0_SECURE1_GPIO
   type IRQSUMMARY_PROC0_SECURE1_GPIO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  GPIO as a value
            Val : HAL.UInt16;
         when True =>
            --  GPIO as an array
            Arr : IRQSUMMARY_PROC0_SECURE1_GPIO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for IRQSUMMARY_PROC0_SECURE1_GPIO_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   type IRQSUMMARY_PROC0_SECURE1_Register is record
      --  Read-only.
      GPIO           : IRQSUMMARY_PROC0_SECURE1_GPIO_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRQSUMMARY_PROC0_SECURE1_Register use record
      GPIO           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  IRQSUMMARY_PROC0_NONSECURE0_GPIO array
   type IRQSUMMARY_PROC0_NONSECURE0_GPIO_Field_Array is array (0 .. 31)
     of Boolean
     with Component_Size => 1, Size => 32;

   type IRQSUMMARY_PROC0_NONSECURE0_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  GPIO as a value
            Val : HAL.UInt32;
         when True =>
            --  GPIO as an array
            Arr : IRQSUMMARY_PROC0_NONSECURE0_GPIO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRQSUMMARY_PROC0_NONSECURE0_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  IRQSUMMARY_PROC0_NONSECURE1_GPIO array
   type IRQSUMMARY_PROC0_NONSECURE1_GPIO_Field_Array is array (32 .. 47)
     of Boolean
     with Component_Size => 1, Size => 16;

   --  Type definition for IRQSUMMARY_PROC0_NONSECURE1_GPIO
   type IRQSUMMARY_PROC0_NONSECURE1_GPIO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  GPIO as a value
            Val : HAL.UInt16;
         when True =>
            --  GPIO as an array
            Arr : IRQSUMMARY_PROC0_NONSECURE1_GPIO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for IRQSUMMARY_PROC0_NONSECURE1_GPIO_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   type IRQSUMMARY_PROC0_NONSECURE1_Register is record
      --  Read-only.
      GPIO           : IRQSUMMARY_PROC0_NONSECURE1_GPIO_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRQSUMMARY_PROC0_NONSECURE1_Register use record
      GPIO           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  IRQSUMMARY_PROC1_SECURE0_GPIO array
   type IRQSUMMARY_PROC1_SECURE0_GPIO_Field_Array is array (0 .. 31)
     of Boolean
     with Component_Size => 1, Size => 32;

   type IRQSUMMARY_PROC1_SECURE0_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  GPIO as a value
            Val : HAL.UInt32;
         when True =>
            --  GPIO as an array
            Arr : IRQSUMMARY_PROC1_SECURE0_GPIO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRQSUMMARY_PROC1_SECURE0_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  IRQSUMMARY_PROC1_SECURE1_GPIO array
   type IRQSUMMARY_PROC1_SECURE1_GPIO_Field_Array is array (32 .. 47)
     of Boolean
     with Component_Size => 1, Size => 16;

   --  Type definition for IRQSUMMARY_PROC1_SECURE1_GPIO
   type IRQSUMMARY_PROC1_SECURE1_GPIO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  GPIO as a value
            Val : HAL.UInt16;
         when True =>
            --  GPIO as an array
            Arr : IRQSUMMARY_PROC1_SECURE1_GPIO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for IRQSUMMARY_PROC1_SECURE1_GPIO_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   type IRQSUMMARY_PROC1_SECURE1_Register is record
      --  Read-only.
      GPIO           : IRQSUMMARY_PROC1_SECURE1_GPIO_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRQSUMMARY_PROC1_SECURE1_Register use record
      GPIO           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  IRQSUMMARY_PROC1_NONSECURE0_GPIO array
   type IRQSUMMARY_PROC1_NONSECURE0_GPIO_Field_Array is array (0 .. 31)
     of Boolean
     with Component_Size => 1, Size => 32;

   type IRQSUMMARY_PROC1_NONSECURE0_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  GPIO as a value
            Val : HAL.UInt32;
         when True =>
            --  GPIO as an array
            Arr : IRQSUMMARY_PROC1_NONSECURE0_GPIO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRQSUMMARY_PROC1_NONSECURE0_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  IRQSUMMARY_PROC1_NONSECURE1_GPIO array
   type IRQSUMMARY_PROC1_NONSECURE1_GPIO_Field_Array is array (32 .. 47)
     of Boolean
     with Component_Size => 1, Size => 16;

   --  Type definition for IRQSUMMARY_PROC1_NONSECURE1_GPIO
   type IRQSUMMARY_PROC1_NONSECURE1_GPIO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  GPIO as a value
            Val : HAL.UInt16;
         when True =>
            --  GPIO as an array
            Arr : IRQSUMMARY_PROC1_NONSECURE1_GPIO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for IRQSUMMARY_PROC1_NONSECURE1_GPIO_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   type IRQSUMMARY_PROC1_NONSECURE1_Register is record
      --  Read-only.
      GPIO           : IRQSUMMARY_PROC1_NONSECURE1_GPIO_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRQSUMMARY_PROC1_NONSECURE1_Register use record
      GPIO           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  IRQSUMMARY_DORMANT_WAKE_SECURE0_GPIO array
   type IRQSUMMARY_DORMANT_WAKE_SECURE0_GPIO_Field_Array is array (0 .. 31)
     of Boolean
     with Component_Size => 1, Size => 32;

   type IRQSUMMARY_DORMANT_WAKE_SECURE0_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  GPIO as a value
            Val : HAL.UInt32;
         when True =>
            --  GPIO as an array
            Arr : IRQSUMMARY_DORMANT_WAKE_SECURE0_GPIO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRQSUMMARY_DORMANT_WAKE_SECURE0_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  IRQSUMMARY_DORMANT_WAKE_SECURE1_GPIO array
   type IRQSUMMARY_DORMANT_WAKE_SECURE1_GPIO_Field_Array is array (32 .. 47)
     of Boolean
     with Component_Size => 1, Size => 16;

   --  Type definition for IRQSUMMARY_DORMANT_WAKE_SECURE1_GPIO
   type IRQSUMMARY_DORMANT_WAKE_SECURE1_GPIO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  GPIO as a value
            Val : HAL.UInt16;
         when True =>
            --  GPIO as an array
            Arr : IRQSUMMARY_DORMANT_WAKE_SECURE1_GPIO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for IRQSUMMARY_DORMANT_WAKE_SECURE1_GPIO_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   type IRQSUMMARY_DORMANT_WAKE_SECURE1_Register is record
      --  Read-only.
      GPIO           : IRQSUMMARY_DORMANT_WAKE_SECURE1_GPIO_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRQSUMMARY_DORMANT_WAKE_SECURE1_Register use record
      GPIO           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  IRQSUMMARY_DORMANT_WAKE_NONSECURE0_GPIO array
   type IRQSUMMARY_DORMANT_WAKE_NONSECURE0_GPIO_Field_Array is array (0 .. 31)
     of Boolean
     with Component_Size => 1, Size => 32;

   type IRQSUMMARY_DORMANT_WAKE_NONSECURE0_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  GPIO as a value
            Val : HAL.UInt32;
         when True =>
            --  GPIO as an array
            Arr : IRQSUMMARY_DORMANT_WAKE_NONSECURE0_GPIO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRQSUMMARY_DORMANT_WAKE_NONSECURE0_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  IRQSUMMARY_DORMANT_WAKE_NONSECURE1_GPIO array
   type IRQSUMMARY_DORMANT_WAKE_NONSECURE1_GPIO_Field_Array is array (32 .. 47)
     of Boolean
     with Component_Size => 1, Size => 16;

   --  Type definition for IRQSUMMARY_DORMANT_WAKE_NONSECURE1_GPIO
   type IRQSUMMARY_DORMANT_WAKE_NONSECURE1_GPIO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  GPIO as a value
            Val : HAL.UInt16;
         when True =>
            --  GPIO as an array
            Arr : IRQSUMMARY_DORMANT_WAKE_NONSECURE1_GPIO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for IRQSUMMARY_DORMANT_WAKE_NONSECURE1_GPIO_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   type IRQSUMMARY_DORMANT_WAKE_NONSECURE1_Register is record
      --  Read-only.
      GPIO           : IRQSUMMARY_DORMANT_WAKE_NONSECURE1_GPIO_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRQSUMMARY_DORMANT_WAKE_NONSECURE1_Register use record
      GPIO           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Raw Interrupts
   type INTR0_Register is record
      --  Read-only.
      GPIO0_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO0_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO0_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO0_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO1_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO1_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO1_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO1_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO2_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO2_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO2_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO2_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO3_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO3_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO3_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO3_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO4_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO4_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO4_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO4_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO5_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO5_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO5_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO5_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO6_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO6_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO6_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO6_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO7_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO7_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO7_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO7_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTR0_Register use record
      GPIO0_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO0_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO0_EDGE_LOW   at 0 range 2 .. 2;
      GPIO0_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO1_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO1_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO1_EDGE_LOW   at 0 range 6 .. 6;
      GPIO1_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO2_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO2_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO2_EDGE_LOW   at 0 range 10 .. 10;
      GPIO2_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO3_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO3_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO3_EDGE_LOW   at 0 range 14 .. 14;
      GPIO3_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO4_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO4_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO4_EDGE_LOW   at 0 range 18 .. 18;
      GPIO4_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO5_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO5_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO5_EDGE_LOW   at 0 range 22 .. 22;
      GPIO5_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO6_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO6_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO6_EDGE_LOW   at 0 range 26 .. 26;
      GPIO6_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO7_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO7_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO7_EDGE_LOW   at 0 range 30 .. 30;
      GPIO7_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Raw Interrupts
   type INTR1_Register is record
      --  Read-only.
      GPIO8_LEVEL_LOW   : Boolean := False;
      --  Read-only.
      GPIO8_LEVEL_HIGH  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO8_EDGE_LOW    : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO8_EDGE_HIGH   : Boolean := False;
      --  Read-only.
      GPIO9_LEVEL_LOW   : Boolean := False;
      --  Read-only.
      GPIO9_LEVEL_HIGH  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO9_EDGE_LOW    : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO9_EDGE_HIGH   : Boolean := False;
      --  Read-only.
      GPIO10_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO10_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO10_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO10_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO11_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO11_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO11_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO11_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO12_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO12_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO12_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO12_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO13_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO13_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO13_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO13_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO14_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO14_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO14_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO14_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO15_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO15_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO15_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO15_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTR1_Register use record
      GPIO8_LEVEL_LOW   at 0 range 0 .. 0;
      GPIO8_LEVEL_HIGH  at 0 range 1 .. 1;
      GPIO8_EDGE_LOW    at 0 range 2 .. 2;
      GPIO8_EDGE_HIGH   at 0 range 3 .. 3;
      GPIO9_LEVEL_LOW   at 0 range 4 .. 4;
      GPIO9_LEVEL_HIGH  at 0 range 5 .. 5;
      GPIO9_EDGE_LOW    at 0 range 6 .. 6;
      GPIO9_EDGE_HIGH   at 0 range 7 .. 7;
      GPIO10_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO10_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO10_EDGE_LOW   at 0 range 10 .. 10;
      GPIO10_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO11_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO11_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO11_EDGE_LOW   at 0 range 14 .. 14;
      GPIO11_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO12_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO12_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO12_EDGE_LOW   at 0 range 18 .. 18;
      GPIO12_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO13_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO13_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO13_EDGE_LOW   at 0 range 22 .. 22;
      GPIO13_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO14_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO14_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO14_EDGE_LOW   at 0 range 26 .. 26;
      GPIO14_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO15_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO15_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO15_EDGE_LOW   at 0 range 30 .. 30;
      GPIO15_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Raw Interrupts
   type INTR2_Register is record
      --  Read-only.
      GPIO16_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO16_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO16_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO16_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO17_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO17_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO17_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO17_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO18_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO18_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO18_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO18_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO19_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO19_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO19_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO19_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO20_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO20_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO20_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO20_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO21_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO21_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO21_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO21_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO22_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO22_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO22_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO22_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO23_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO23_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO23_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO23_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTR2_Register use record
      GPIO16_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO16_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO16_EDGE_LOW   at 0 range 2 .. 2;
      GPIO16_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO17_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO17_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO17_EDGE_LOW   at 0 range 6 .. 6;
      GPIO17_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO18_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO18_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO18_EDGE_LOW   at 0 range 10 .. 10;
      GPIO18_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO19_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO19_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO19_EDGE_LOW   at 0 range 14 .. 14;
      GPIO19_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO20_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO20_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO20_EDGE_LOW   at 0 range 18 .. 18;
      GPIO20_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO21_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO21_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO21_EDGE_LOW   at 0 range 22 .. 22;
      GPIO21_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO22_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO22_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO22_EDGE_LOW   at 0 range 26 .. 26;
      GPIO22_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO23_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO23_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO23_EDGE_LOW   at 0 range 30 .. 30;
      GPIO23_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Raw Interrupts
   type INTR3_Register is record
      --  Read-only.
      GPIO24_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO24_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO24_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO24_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO25_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO25_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO25_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO25_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO26_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO26_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO26_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO26_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO27_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO27_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO27_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO27_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO28_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO28_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO28_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO28_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO29_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO29_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO29_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO29_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO30_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO30_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO30_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO30_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO31_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO31_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO31_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO31_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTR3_Register use record
      GPIO24_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO24_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO24_EDGE_LOW   at 0 range 2 .. 2;
      GPIO24_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO25_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO25_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO25_EDGE_LOW   at 0 range 6 .. 6;
      GPIO25_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO26_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO26_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO26_EDGE_LOW   at 0 range 10 .. 10;
      GPIO26_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO27_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO27_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO27_EDGE_LOW   at 0 range 14 .. 14;
      GPIO27_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO28_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO28_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO28_EDGE_LOW   at 0 range 18 .. 18;
      GPIO28_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO29_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO29_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO29_EDGE_LOW   at 0 range 22 .. 22;
      GPIO29_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO30_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO30_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO30_EDGE_LOW   at 0 range 26 .. 26;
      GPIO30_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO31_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO31_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO31_EDGE_LOW   at 0 range 30 .. 30;
      GPIO31_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Raw Interrupts
   type INTR4_Register is record
      --  Read-only.
      GPIO32_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO32_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO32_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO32_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO33_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO33_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO33_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO33_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO34_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO34_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO34_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO34_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO35_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO35_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO35_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO35_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO36_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO36_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO36_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO36_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO37_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO37_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO37_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO37_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO38_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO38_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO38_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO38_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO39_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO39_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO39_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO39_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTR4_Register use record
      GPIO32_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO32_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO32_EDGE_LOW   at 0 range 2 .. 2;
      GPIO32_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO33_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO33_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO33_EDGE_LOW   at 0 range 6 .. 6;
      GPIO33_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO34_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO34_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO34_EDGE_LOW   at 0 range 10 .. 10;
      GPIO34_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO35_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO35_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO35_EDGE_LOW   at 0 range 14 .. 14;
      GPIO35_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO36_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO36_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO36_EDGE_LOW   at 0 range 18 .. 18;
      GPIO36_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO37_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO37_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO37_EDGE_LOW   at 0 range 22 .. 22;
      GPIO37_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO38_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO38_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO38_EDGE_LOW   at 0 range 26 .. 26;
      GPIO38_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO39_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO39_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO39_EDGE_LOW   at 0 range 30 .. 30;
      GPIO39_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Raw Interrupts
   type INTR5_Register is record
      --  Read-only.
      GPIO40_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO40_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO40_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO40_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO41_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO41_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO41_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO41_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO42_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO42_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO42_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO42_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO43_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO43_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO43_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO43_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO44_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO44_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO44_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO44_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO45_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO45_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO45_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO45_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO46_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO46_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO46_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO46_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO47_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO47_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO47_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO47_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTR5_Register use record
      GPIO40_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO40_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO40_EDGE_LOW   at 0 range 2 .. 2;
      GPIO40_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO41_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO41_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO41_EDGE_LOW   at 0 range 6 .. 6;
      GPIO41_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO42_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO42_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO42_EDGE_LOW   at 0 range 10 .. 10;
      GPIO42_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO43_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO43_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO43_EDGE_LOW   at 0 range 14 .. 14;
      GPIO43_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO44_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO44_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO44_EDGE_LOW   at 0 range 18 .. 18;
      GPIO44_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO45_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO45_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO45_EDGE_LOW   at 0 range 22 .. 22;
      GPIO45_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO46_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO46_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO46_EDGE_LOW   at 0 range 26 .. 26;
      GPIO46_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO47_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO47_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO47_EDGE_LOW   at 0 range 30 .. 30;
      GPIO47_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Enable for proc0
   type PROC0_INTE0_Register is record
      GPIO0_LEVEL_LOW  : Boolean := False;
      GPIO0_LEVEL_HIGH : Boolean := False;
      GPIO0_EDGE_LOW   : Boolean := False;
      GPIO0_EDGE_HIGH  : Boolean := False;
      GPIO1_LEVEL_LOW  : Boolean := False;
      GPIO1_LEVEL_HIGH : Boolean := False;
      GPIO1_EDGE_LOW   : Boolean := False;
      GPIO1_EDGE_HIGH  : Boolean := False;
      GPIO2_LEVEL_LOW  : Boolean := False;
      GPIO2_LEVEL_HIGH : Boolean := False;
      GPIO2_EDGE_LOW   : Boolean := False;
      GPIO2_EDGE_HIGH  : Boolean := False;
      GPIO3_LEVEL_LOW  : Boolean := False;
      GPIO3_LEVEL_HIGH : Boolean := False;
      GPIO3_EDGE_LOW   : Boolean := False;
      GPIO3_EDGE_HIGH  : Boolean := False;
      GPIO4_LEVEL_LOW  : Boolean := False;
      GPIO4_LEVEL_HIGH : Boolean := False;
      GPIO4_EDGE_LOW   : Boolean := False;
      GPIO4_EDGE_HIGH  : Boolean := False;
      GPIO5_LEVEL_LOW  : Boolean := False;
      GPIO5_LEVEL_HIGH : Boolean := False;
      GPIO5_EDGE_LOW   : Boolean := False;
      GPIO5_EDGE_HIGH  : Boolean := False;
      GPIO6_LEVEL_LOW  : Boolean := False;
      GPIO6_LEVEL_HIGH : Boolean := False;
      GPIO6_EDGE_LOW   : Boolean := False;
      GPIO6_EDGE_HIGH  : Boolean := False;
      GPIO7_LEVEL_LOW  : Boolean := False;
      GPIO7_LEVEL_HIGH : Boolean := False;
      GPIO7_EDGE_LOW   : Boolean := False;
      GPIO7_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC0_INTE0_Register use record
      GPIO0_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO0_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO0_EDGE_LOW   at 0 range 2 .. 2;
      GPIO0_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO1_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO1_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO1_EDGE_LOW   at 0 range 6 .. 6;
      GPIO1_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO2_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO2_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO2_EDGE_LOW   at 0 range 10 .. 10;
      GPIO2_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO3_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO3_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO3_EDGE_LOW   at 0 range 14 .. 14;
      GPIO3_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO4_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO4_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO4_EDGE_LOW   at 0 range 18 .. 18;
      GPIO4_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO5_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO5_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO5_EDGE_LOW   at 0 range 22 .. 22;
      GPIO5_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO6_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO6_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO6_EDGE_LOW   at 0 range 26 .. 26;
      GPIO6_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO7_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO7_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO7_EDGE_LOW   at 0 range 30 .. 30;
      GPIO7_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Enable for proc0
   type PROC0_INTE1_Register is record
      GPIO8_LEVEL_LOW   : Boolean := False;
      GPIO8_LEVEL_HIGH  : Boolean := False;
      GPIO8_EDGE_LOW    : Boolean := False;
      GPIO8_EDGE_HIGH   : Boolean := False;
      GPIO9_LEVEL_LOW   : Boolean := False;
      GPIO9_LEVEL_HIGH  : Boolean := False;
      GPIO9_EDGE_LOW    : Boolean := False;
      GPIO9_EDGE_HIGH   : Boolean := False;
      GPIO10_LEVEL_LOW  : Boolean := False;
      GPIO10_LEVEL_HIGH : Boolean := False;
      GPIO10_EDGE_LOW   : Boolean := False;
      GPIO10_EDGE_HIGH  : Boolean := False;
      GPIO11_LEVEL_LOW  : Boolean := False;
      GPIO11_LEVEL_HIGH : Boolean := False;
      GPIO11_EDGE_LOW   : Boolean := False;
      GPIO11_EDGE_HIGH  : Boolean := False;
      GPIO12_LEVEL_LOW  : Boolean := False;
      GPIO12_LEVEL_HIGH : Boolean := False;
      GPIO12_EDGE_LOW   : Boolean := False;
      GPIO12_EDGE_HIGH  : Boolean := False;
      GPIO13_LEVEL_LOW  : Boolean := False;
      GPIO13_LEVEL_HIGH : Boolean := False;
      GPIO13_EDGE_LOW   : Boolean := False;
      GPIO13_EDGE_HIGH  : Boolean := False;
      GPIO14_LEVEL_LOW  : Boolean := False;
      GPIO14_LEVEL_HIGH : Boolean := False;
      GPIO14_EDGE_LOW   : Boolean := False;
      GPIO14_EDGE_HIGH  : Boolean := False;
      GPIO15_LEVEL_LOW  : Boolean := False;
      GPIO15_LEVEL_HIGH : Boolean := False;
      GPIO15_EDGE_LOW   : Boolean := False;
      GPIO15_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC0_INTE1_Register use record
      GPIO8_LEVEL_LOW   at 0 range 0 .. 0;
      GPIO8_LEVEL_HIGH  at 0 range 1 .. 1;
      GPIO8_EDGE_LOW    at 0 range 2 .. 2;
      GPIO8_EDGE_HIGH   at 0 range 3 .. 3;
      GPIO9_LEVEL_LOW   at 0 range 4 .. 4;
      GPIO9_LEVEL_HIGH  at 0 range 5 .. 5;
      GPIO9_EDGE_LOW    at 0 range 6 .. 6;
      GPIO9_EDGE_HIGH   at 0 range 7 .. 7;
      GPIO10_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO10_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO10_EDGE_LOW   at 0 range 10 .. 10;
      GPIO10_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO11_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO11_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO11_EDGE_LOW   at 0 range 14 .. 14;
      GPIO11_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO12_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO12_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO12_EDGE_LOW   at 0 range 18 .. 18;
      GPIO12_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO13_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO13_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO13_EDGE_LOW   at 0 range 22 .. 22;
      GPIO13_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO14_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO14_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO14_EDGE_LOW   at 0 range 26 .. 26;
      GPIO14_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO15_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO15_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO15_EDGE_LOW   at 0 range 30 .. 30;
      GPIO15_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Enable for proc0
   type PROC0_INTE2_Register is record
      GPIO16_LEVEL_LOW  : Boolean := False;
      GPIO16_LEVEL_HIGH : Boolean := False;
      GPIO16_EDGE_LOW   : Boolean := False;
      GPIO16_EDGE_HIGH  : Boolean := False;
      GPIO17_LEVEL_LOW  : Boolean := False;
      GPIO17_LEVEL_HIGH : Boolean := False;
      GPIO17_EDGE_LOW   : Boolean := False;
      GPIO17_EDGE_HIGH  : Boolean := False;
      GPIO18_LEVEL_LOW  : Boolean := False;
      GPIO18_LEVEL_HIGH : Boolean := False;
      GPIO18_EDGE_LOW   : Boolean := False;
      GPIO18_EDGE_HIGH  : Boolean := False;
      GPIO19_LEVEL_LOW  : Boolean := False;
      GPIO19_LEVEL_HIGH : Boolean := False;
      GPIO19_EDGE_LOW   : Boolean := False;
      GPIO19_EDGE_HIGH  : Boolean := False;
      GPIO20_LEVEL_LOW  : Boolean := False;
      GPIO20_LEVEL_HIGH : Boolean := False;
      GPIO20_EDGE_LOW   : Boolean := False;
      GPIO20_EDGE_HIGH  : Boolean := False;
      GPIO21_LEVEL_LOW  : Boolean := False;
      GPIO21_LEVEL_HIGH : Boolean := False;
      GPIO21_EDGE_LOW   : Boolean := False;
      GPIO21_EDGE_HIGH  : Boolean := False;
      GPIO22_LEVEL_LOW  : Boolean := False;
      GPIO22_LEVEL_HIGH : Boolean := False;
      GPIO22_EDGE_LOW   : Boolean := False;
      GPIO22_EDGE_HIGH  : Boolean := False;
      GPIO23_LEVEL_LOW  : Boolean := False;
      GPIO23_LEVEL_HIGH : Boolean := False;
      GPIO23_EDGE_LOW   : Boolean := False;
      GPIO23_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC0_INTE2_Register use record
      GPIO16_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO16_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO16_EDGE_LOW   at 0 range 2 .. 2;
      GPIO16_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO17_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO17_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO17_EDGE_LOW   at 0 range 6 .. 6;
      GPIO17_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO18_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO18_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO18_EDGE_LOW   at 0 range 10 .. 10;
      GPIO18_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO19_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO19_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO19_EDGE_LOW   at 0 range 14 .. 14;
      GPIO19_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO20_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO20_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO20_EDGE_LOW   at 0 range 18 .. 18;
      GPIO20_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO21_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO21_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO21_EDGE_LOW   at 0 range 22 .. 22;
      GPIO21_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO22_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO22_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO22_EDGE_LOW   at 0 range 26 .. 26;
      GPIO22_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO23_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO23_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO23_EDGE_LOW   at 0 range 30 .. 30;
      GPIO23_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Enable for proc0
   type PROC0_INTE3_Register is record
      GPIO24_LEVEL_LOW  : Boolean := False;
      GPIO24_LEVEL_HIGH : Boolean := False;
      GPIO24_EDGE_LOW   : Boolean := False;
      GPIO24_EDGE_HIGH  : Boolean := False;
      GPIO25_LEVEL_LOW  : Boolean := False;
      GPIO25_LEVEL_HIGH : Boolean := False;
      GPIO25_EDGE_LOW   : Boolean := False;
      GPIO25_EDGE_HIGH  : Boolean := False;
      GPIO26_LEVEL_LOW  : Boolean := False;
      GPIO26_LEVEL_HIGH : Boolean := False;
      GPIO26_EDGE_LOW   : Boolean := False;
      GPIO26_EDGE_HIGH  : Boolean := False;
      GPIO27_LEVEL_LOW  : Boolean := False;
      GPIO27_LEVEL_HIGH : Boolean := False;
      GPIO27_EDGE_LOW   : Boolean := False;
      GPIO27_EDGE_HIGH  : Boolean := False;
      GPIO28_LEVEL_LOW  : Boolean := False;
      GPIO28_LEVEL_HIGH : Boolean := False;
      GPIO28_EDGE_LOW   : Boolean := False;
      GPIO28_EDGE_HIGH  : Boolean := False;
      GPIO29_LEVEL_LOW  : Boolean := False;
      GPIO29_LEVEL_HIGH : Boolean := False;
      GPIO29_EDGE_LOW   : Boolean := False;
      GPIO29_EDGE_HIGH  : Boolean := False;
      GPIO30_LEVEL_LOW  : Boolean := False;
      GPIO30_LEVEL_HIGH : Boolean := False;
      GPIO30_EDGE_LOW   : Boolean := False;
      GPIO30_EDGE_HIGH  : Boolean := False;
      GPIO31_LEVEL_LOW  : Boolean := False;
      GPIO31_LEVEL_HIGH : Boolean := False;
      GPIO31_EDGE_LOW   : Boolean := False;
      GPIO31_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC0_INTE3_Register use record
      GPIO24_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO24_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO24_EDGE_LOW   at 0 range 2 .. 2;
      GPIO24_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO25_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO25_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO25_EDGE_LOW   at 0 range 6 .. 6;
      GPIO25_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO26_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO26_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO26_EDGE_LOW   at 0 range 10 .. 10;
      GPIO26_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO27_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO27_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO27_EDGE_LOW   at 0 range 14 .. 14;
      GPIO27_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO28_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO28_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO28_EDGE_LOW   at 0 range 18 .. 18;
      GPIO28_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO29_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO29_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO29_EDGE_LOW   at 0 range 22 .. 22;
      GPIO29_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO30_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO30_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO30_EDGE_LOW   at 0 range 26 .. 26;
      GPIO30_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO31_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO31_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO31_EDGE_LOW   at 0 range 30 .. 30;
      GPIO31_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Enable for proc0
   type PROC0_INTE4_Register is record
      GPIO32_LEVEL_LOW  : Boolean := False;
      GPIO32_LEVEL_HIGH : Boolean := False;
      GPIO32_EDGE_LOW   : Boolean := False;
      GPIO32_EDGE_HIGH  : Boolean := False;
      GPIO33_LEVEL_LOW  : Boolean := False;
      GPIO33_LEVEL_HIGH : Boolean := False;
      GPIO33_EDGE_LOW   : Boolean := False;
      GPIO33_EDGE_HIGH  : Boolean := False;
      GPIO34_LEVEL_LOW  : Boolean := False;
      GPIO34_LEVEL_HIGH : Boolean := False;
      GPIO34_EDGE_LOW   : Boolean := False;
      GPIO34_EDGE_HIGH  : Boolean := False;
      GPIO35_LEVEL_LOW  : Boolean := False;
      GPIO35_LEVEL_HIGH : Boolean := False;
      GPIO35_EDGE_LOW   : Boolean := False;
      GPIO35_EDGE_HIGH  : Boolean := False;
      GPIO36_LEVEL_LOW  : Boolean := False;
      GPIO36_LEVEL_HIGH : Boolean := False;
      GPIO36_EDGE_LOW   : Boolean := False;
      GPIO36_EDGE_HIGH  : Boolean := False;
      GPIO37_LEVEL_LOW  : Boolean := False;
      GPIO37_LEVEL_HIGH : Boolean := False;
      GPIO37_EDGE_LOW   : Boolean := False;
      GPIO37_EDGE_HIGH  : Boolean := False;
      GPIO38_LEVEL_LOW  : Boolean := False;
      GPIO38_LEVEL_HIGH : Boolean := False;
      GPIO38_EDGE_LOW   : Boolean := False;
      GPIO38_EDGE_HIGH  : Boolean := False;
      GPIO39_LEVEL_LOW  : Boolean := False;
      GPIO39_LEVEL_HIGH : Boolean := False;
      GPIO39_EDGE_LOW   : Boolean := False;
      GPIO39_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC0_INTE4_Register use record
      GPIO32_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO32_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO32_EDGE_LOW   at 0 range 2 .. 2;
      GPIO32_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO33_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO33_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO33_EDGE_LOW   at 0 range 6 .. 6;
      GPIO33_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO34_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO34_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO34_EDGE_LOW   at 0 range 10 .. 10;
      GPIO34_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO35_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO35_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO35_EDGE_LOW   at 0 range 14 .. 14;
      GPIO35_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO36_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO36_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO36_EDGE_LOW   at 0 range 18 .. 18;
      GPIO36_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO37_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO37_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO37_EDGE_LOW   at 0 range 22 .. 22;
      GPIO37_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO38_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO38_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO38_EDGE_LOW   at 0 range 26 .. 26;
      GPIO38_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO39_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO39_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO39_EDGE_LOW   at 0 range 30 .. 30;
      GPIO39_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Enable for proc0
   type PROC0_INTE5_Register is record
      GPIO40_LEVEL_LOW  : Boolean := False;
      GPIO40_LEVEL_HIGH : Boolean := False;
      GPIO40_EDGE_LOW   : Boolean := False;
      GPIO40_EDGE_HIGH  : Boolean := False;
      GPIO41_LEVEL_LOW  : Boolean := False;
      GPIO41_LEVEL_HIGH : Boolean := False;
      GPIO41_EDGE_LOW   : Boolean := False;
      GPIO41_EDGE_HIGH  : Boolean := False;
      GPIO42_LEVEL_LOW  : Boolean := False;
      GPIO42_LEVEL_HIGH : Boolean := False;
      GPIO42_EDGE_LOW   : Boolean := False;
      GPIO42_EDGE_HIGH  : Boolean := False;
      GPIO43_LEVEL_LOW  : Boolean := False;
      GPIO43_LEVEL_HIGH : Boolean := False;
      GPIO43_EDGE_LOW   : Boolean := False;
      GPIO43_EDGE_HIGH  : Boolean := False;
      GPIO44_LEVEL_LOW  : Boolean := False;
      GPIO44_LEVEL_HIGH : Boolean := False;
      GPIO44_EDGE_LOW   : Boolean := False;
      GPIO44_EDGE_HIGH  : Boolean := False;
      GPIO45_LEVEL_LOW  : Boolean := False;
      GPIO45_LEVEL_HIGH : Boolean := False;
      GPIO45_EDGE_LOW   : Boolean := False;
      GPIO45_EDGE_HIGH  : Boolean := False;
      GPIO46_LEVEL_LOW  : Boolean := False;
      GPIO46_LEVEL_HIGH : Boolean := False;
      GPIO46_EDGE_LOW   : Boolean := False;
      GPIO46_EDGE_HIGH  : Boolean := False;
      GPIO47_LEVEL_LOW  : Boolean := False;
      GPIO47_LEVEL_HIGH : Boolean := False;
      GPIO47_EDGE_LOW   : Boolean := False;
      GPIO47_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC0_INTE5_Register use record
      GPIO40_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO40_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO40_EDGE_LOW   at 0 range 2 .. 2;
      GPIO40_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO41_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO41_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO41_EDGE_LOW   at 0 range 6 .. 6;
      GPIO41_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO42_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO42_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO42_EDGE_LOW   at 0 range 10 .. 10;
      GPIO42_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO43_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO43_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO43_EDGE_LOW   at 0 range 14 .. 14;
      GPIO43_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO44_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO44_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO44_EDGE_LOW   at 0 range 18 .. 18;
      GPIO44_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO45_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO45_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO45_EDGE_LOW   at 0 range 22 .. 22;
      GPIO45_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO46_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO46_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO46_EDGE_LOW   at 0 range 26 .. 26;
      GPIO46_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO47_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO47_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO47_EDGE_LOW   at 0 range 30 .. 30;
      GPIO47_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Force for proc0
   type PROC0_INTF0_Register is record
      GPIO0_LEVEL_LOW  : Boolean := False;
      GPIO0_LEVEL_HIGH : Boolean := False;
      GPIO0_EDGE_LOW   : Boolean := False;
      GPIO0_EDGE_HIGH  : Boolean := False;
      GPIO1_LEVEL_LOW  : Boolean := False;
      GPIO1_LEVEL_HIGH : Boolean := False;
      GPIO1_EDGE_LOW   : Boolean := False;
      GPIO1_EDGE_HIGH  : Boolean := False;
      GPIO2_LEVEL_LOW  : Boolean := False;
      GPIO2_LEVEL_HIGH : Boolean := False;
      GPIO2_EDGE_LOW   : Boolean := False;
      GPIO2_EDGE_HIGH  : Boolean := False;
      GPIO3_LEVEL_LOW  : Boolean := False;
      GPIO3_LEVEL_HIGH : Boolean := False;
      GPIO3_EDGE_LOW   : Boolean := False;
      GPIO3_EDGE_HIGH  : Boolean := False;
      GPIO4_LEVEL_LOW  : Boolean := False;
      GPIO4_LEVEL_HIGH : Boolean := False;
      GPIO4_EDGE_LOW   : Boolean := False;
      GPIO4_EDGE_HIGH  : Boolean := False;
      GPIO5_LEVEL_LOW  : Boolean := False;
      GPIO5_LEVEL_HIGH : Boolean := False;
      GPIO5_EDGE_LOW   : Boolean := False;
      GPIO5_EDGE_HIGH  : Boolean := False;
      GPIO6_LEVEL_LOW  : Boolean := False;
      GPIO6_LEVEL_HIGH : Boolean := False;
      GPIO6_EDGE_LOW   : Boolean := False;
      GPIO6_EDGE_HIGH  : Boolean := False;
      GPIO7_LEVEL_LOW  : Boolean := False;
      GPIO7_LEVEL_HIGH : Boolean := False;
      GPIO7_EDGE_LOW   : Boolean := False;
      GPIO7_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC0_INTF0_Register use record
      GPIO0_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO0_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO0_EDGE_LOW   at 0 range 2 .. 2;
      GPIO0_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO1_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO1_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO1_EDGE_LOW   at 0 range 6 .. 6;
      GPIO1_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO2_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO2_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO2_EDGE_LOW   at 0 range 10 .. 10;
      GPIO2_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO3_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO3_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO3_EDGE_LOW   at 0 range 14 .. 14;
      GPIO3_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO4_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO4_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO4_EDGE_LOW   at 0 range 18 .. 18;
      GPIO4_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO5_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO5_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO5_EDGE_LOW   at 0 range 22 .. 22;
      GPIO5_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO6_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO6_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO6_EDGE_LOW   at 0 range 26 .. 26;
      GPIO6_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO7_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO7_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO7_EDGE_LOW   at 0 range 30 .. 30;
      GPIO7_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Force for proc0
   type PROC0_INTF1_Register is record
      GPIO8_LEVEL_LOW   : Boolean := False;
      GPIO8_LEVEL_HIGH  : Boolean := False;
      GPIO8_EDGE_LOW    : Boolean := False;
      GPIO8_EDGE_HIGH   : Boolean := False;
      GPIO9_LEVEL_LOW   : Boolean := False;
      GPIO9_LEVEL_HIGH  : Boolean := False;
      GPIO9_EDGE_LOW    : Boolean := False;
      GPIO9_EDGE_HIGH   : Boolean := False;
      GPIO10_LEVEL_LOW  : Boolean := False;
      GPIO10_LEVEL_HIGH : Boolean := False;
      GPIO10_EDGE_LOW   : Boolean := False;
      GPIO10_EDGE_HIGH  : Boolean := False;
      GPIO11_LEVEL_LOW  : Boolean := False;
      GPIO11_LEVEL_HIGH : Boolean := False;
      GPIO11_EDGE_LOW   : Boolean := False;
      GPIO11_EDGE_HIGH  : Boolean := False;
      GPIO12_LEVEL_LOW  : Boolean := False;
      GPIO12_LEVEL_HIGH : Boolean := False;
      GPIO12_EDGE_LOW   : Boolean := False;
      GPIO12_EDGE_HIGH  : Boolean := False;
      GPIO13_LEVEL_LOW  : Boolean := False;
      GPIO13_LEVEL_HIGH : Boolean := False;
      GPIO13_EDGE_LOW   : Boolean := False;
      GPIO13_EDGE_HIGH  : Boolean := False;
      GPIO14_LEVEL_LOW  : Boolean := False;
      GPIO14_LEVEL_HIGH : Boolean := False;
      GPIO14_EDGE_LOW   : Boolean := False;
      GPIO14_EDGE_HIGH  : Boolean := False;
      GPIO15_LEVEL_LOW  : Boolean := False;
      GPIO15_LEVEL_HIGH : Boolean := False;
      GPIO15_EDGE_LOW   : Boolean := False;
      GPIO15_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC0_INTF1_Register use record
      GPIO8_LEVEL_LOW   at 0 range 0 .. 0;
      GPIO8_LEVEL_HIGH  at 0 range 1 .. 1;
      GPIO8_EDGE_LOW    at 0 range 2 .. 2;
      GPIO8_EDGE_HIGH   at 0 range 3 .. 3;
      GPIO9_LEVEL_LOW   at 0 range 4 .. 4;
      GPIO9_LEVEL_HIGH  at 0 range 5 .. 5;
      GPIO9_EDGE_LOW    at 0 range 6 .. 6;
      GPIO9_EDGE_HIGH   at 0 range 7 .. 7;
      GPIO10_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO10_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO10_EDGE_LOW   at 0 range 10 .. 10;
      GPIO10_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO11_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO11_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO11_EDGE_LOW   at 0 range 14 .. 14;
      GPIO11_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO12_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO12_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO12_EDGE_LOW   at 0 range 18 .. 18;
      GPIO12_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO13_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO13_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO13_EDGE_LOW   at 0 range 22 .. 22;
      GPIO13_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO14_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO14_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO14_EDGE_LOW   at 0 range 26 .. 26;
      GPIO14_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO15_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO15_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO15_EDGE_LOW   at 0 range 30 .. 30;
      GPIO15_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Force for proc0
   type PROC0_INTF2_Register is record
      GPIO16_LEVEL_LOW  : Boolean := False;
      GPIO16_LEVEL_HIGH : Boolean := False;
      GPIO16_EDGE_LOW   : Boolean := False;
      GPIO16_EDGE_HIGH  : Boolean := False;
      GPIO17_LEVEL_LOW  : Boolean := False;
      GPIO17_LEVEL_HIGH : Boolean := False;
      GPIO17_EDGE_LOW   : Boolean := False;
      GPIO17_EDGE_HIGH  : Boolean := False;
      GPIO18_LEVEL_LOW  : Boolean := False;
      GPIO18_LEVEL_HIGH : Boolean := False;
      GPIO18_EDGE_LOW   : Boolean := False;
      GPIO18_EDGE_HIGH  : Boolean := False;
      GPIO19_LEVEL_LOW  : Boolean := False;
      GPIO19_LEVEL_HIGH : Boolean := False;
      GPIO19_EDGE_LOW   : Boolean := False;
      GPIO19_EDGE_HIGH  : Boolean := False;
      GPIO20_LEVEL_LOW  : Boolean := False;
      GPIO20_LEVEL_HIGH : Boolean := False;
      GPIO20_EDGE_LOW   : Boolean := False;
      GPIO20_EDGE_HIGH  : Boolean := False;
      GPIO21_LEVEL_LOW  : Boolean := False;
      GPIO21_LEVEL_HIGH : Boolean := False;
      GPIO21_EDGE_LOW   : Boolean := False;
      GPIO21_EDGE_HIGH  : Boolean := False;
      GPIO22_LEVEL_LOW  : Boolean := False;
      GPIO22_LEVEL_HIGH : Boolean := False;
      GPIO22_EDGE_LOW   : Boolean := False;
      GPIO22_EDGE_HIGH  : Boolean := False;
      GPIO23_LEVEL_LOW  : Boolean := False;
      GPIO23_LEVEL_HIGH : Boolean := False;
      GPIO23_EDGE_LOW   : Boolean := False;
      GPIO23_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC0_INTF2_Register use record
      GPIO16_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO16_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO16_EDGE_LOW   at 0 range 2 .. 2;
      GPIO16_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO17_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO17_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO17_EDGE_LOW   at 0 range 6 .. 6;
      GPIO17_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO18_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO18_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO18_EDGE_LOW   at 0 range 10 .. 10;
      GPIO18_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO19_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO19_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO19_EDGE_LOW   at 0 range 14 .. 14;
      GPIO19_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO20_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO20_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO20_EDGE_LOW   at 0 range 18 .. 18;
      GPIO20_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO21_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO21_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO21_EDGE_LOW   at 0 range 22 .. 22;
      GPIO21_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO22_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO22_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO22_EDGE_LOW   at 0 range 26 .. 26;
      GPIO22_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO23_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO23_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO23_EDGE_LOW   at 0 range 30 .. 30;
      GPIO23_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Force for proc0
   type PROC0_INTF3_Register is record
      GPIO24_LEVEL_LOW  : Boolean := False;
      GPIO24_LEVEL_HIGH : Boolean := False;
      GPIO24_EDGE_LOW   : Boolean := False;
      GPIO24_EDGE_HIGH  : Boolean := False;
      GPIO25_LEVEL_LOW  : Boolean := False;
      GPIO25_LEVEL_HIGH : Boolean := False;
      GPIO25_EDGE_LOW   : Boolean := False;
      GPIO25_EDGE_HIGH  : Boolean := False;
      GPIO26_LEVEL_LOW  : Boolean := False;
      GPIO26_LEVEL_HIGH : Boolean := False;
      GPIO26_EDGE_LOW   : Boolean := False;
      GPIO26_EDGE_HIGH  : Boolean := False;
      GPIO27_LEVEL_LOW  : Boolean := False;
      GPIO27_LEVEL_HIGH : Boolean := False;
      GPIO27_EDGE_LOW   : Boolean := False;
      GPIO27_EDGE_HIGH  : Boolean := False;
      GPIO28_LEVEL_LOW  : Boolean := False;
      GPIO28_LEVEL_HIGH : Boolean := False;
      GPIO28_EDGE_LOW   : Boolean := False;
      GPIO28_EDGE_HIGH  : Boolean := False;
      GPIO29_LEVEL_LOW  : Boolean := False;
      GPIO29_LEVEL_HIGH : Boolean := False;
      GPIO29_EDGE_LOW   : Boolean := False;
      GPIO29_EDGE_HIGH  : Boolean := False;
      GPIO30_LEVEL_LOW  : Boolean := False;
      GPIO30_LEVEL_HIGH : Boolean := False;
      GPIO30_EDGE_LOW   : Boolean := False;
      GPIO30_EDGE_HIGH  : Boolean := False;
      GPIO31_LEVEL_LOW  : Boolean := False;
      GPIO31_LEVEL_HIGH : Boolean := False;
      GPIO31_EDGE_LOW   : Boolean := False;
      GPIO31_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC0_INTF3_Register use record
      GPIO24_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO24_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO24_EDGE_LOW   at 0 range 2 .. 2;
      GPIO24_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO25_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO25_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO25_EDGE_LOW   at 0 range 6 .. 6;
      GPIO25_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO26_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO26_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO26_EDGE_LOW   at 0 range 10 .. 10;
      GPIO26_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO27_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO27_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO27_EDGE_LOW   at 0 range 14 .. 14;
      GPIO27_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO28_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO28_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO28_EDGE_LOW   at 0 range 18 .. 18;
      GPIO28_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO29_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO29_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO29_EDGE_LOW   at 0 range 22 .. 22;
      GPIO29_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO30_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO30_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO30_EDGE_LOW   at 0 range 26 .. 26;
      GPIO30_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO31_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO31_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO31_EDGE_LOW   at 0 range 30 .. 30;
      GPIO31_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Force for proc0
   type PROC0_INTF4_Register is record
      GPIO32_LEVEL_LOW  : Boolean := False;
      GPIO32_LEVEL_HIGH : Boolean := False;
      GPIO32_EDGE_LOW   : Boolean := False;
      GPIO32_EDGE_HIGH  : Boolean := False;
      GPIO33_LEVEL_LOW  : Boolean := False;
      GPIO33_LEVEL_HIGH : Boolean := False;
      GPIO33_EDGE_LOW   : Boolean := False;
      GPIO33_EDGE_HIGH  : Boolean := False;
      GPIO34_LEVEL_LOW  : Boolean := False;
      GPIO34_LEVEL_HIGH : Boolean := False;
      GPIO34_EDGE_LOW   : Boolean := False;
      GPIO34_EDGE_HIGH  : Boolean := False;
      GPIO35_LEVEL_LOW  : Boolean := False;
      GPIO35_LEVEL_HIGH : Boolean := False;
      GPIO35_EDGE_LOW   : Boolean := False;
      GPIO35_EDGE_HIGH  : Boolean := False;
      GPIO36_LEVEL_LOW  : Boolean := False;
      GPIO36_LEVEL_HIGH : Boolean := False;
      GPIO36_EDGE_LOW   : Boolean := False;
      GPIO36_EDGE_HIGH  : Boolean := False;
      GPIO37_LEVEL_LOW  : Boolean := False;
      GPIO37_LEVEL_HIGH : Boolean := False;
      GPIO37_EDGE_LOW   : Boolean := False;
      GPIO37_EDGE_HIGH  : Boolean := False;
      GPIO38_LEVEL_LOW  : Boolean := False;
      GPIO38_LEVEL_HIGH : Boolean := False;
      GPIO38_EDGE_LOW   : Boolean := False;
      GPIO38_EDGE_HIGH  : Boolean := False;
      GPIO39_LEVEL_LOW  : Boolean := False;
      GPIO39_LEVEL_HIGH : Boolean := False;
      GPIO39_EDGE_LOW   : Boolean := False;
      GPIO39_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC0_INTF4_Register use record
      GPIO32_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO32_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO32_EDGE_LOW   at 0 range 2 .. 2;
      GPIO32_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO33_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO33_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO33_EDGE_LOW   at 0 range 6 .. 6;
      GPIO33_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO34_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO34_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO34_EDGE_LOW   at 0 range 10 .. 10;
      GPIO34_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO35_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO35_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO35_EDGE_LOW   at 0 range 14 .. 14;
      GPIO35_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO36_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO36_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO36_EDGE_LOW   at 0 range 18 .. 18;
      GPIO36_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO37_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO37_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO37_EDGE_LOW   at 0 range 22 .. 22;
      GPIO37_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO38_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO38_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO38_EDGE_LOW   at 0 range 26 .. 26;
      GPIO38_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO39_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO39_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO39_EDGE_LOW   at 0 range 30 .. 30;
      GPIO39_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Force for proc0
   type PROC0_INTF5_Register is record
      GPIO40_LEVEL_LOW  : Boolean := False;
      GPIO40_LEVEL_HIGH : Boolean := False;
      GPIO40_EDGE_LOW   : Boolean := False;
      GPIO40_EDGE_HIGH  : Boolean := False;
      GPIO41_LEVEL_LOW  : Boolean := False;
      GPIO41_LEVEL_HIGH : Boolean := False;
      GPIO41_EDGE_LOW   : Boolean := False;
      GPIO41_EDGE_HIGH  : Boolean := False;
      GPIO42_LEVEL_LOW  : Boolean := False;
      GPIO42_LEVEL_HIGH : Boolean := False;
      GPIO42_EDGE_LOW   : Boolean := False;
      GPIO42_EDGE_HIGH  : Boolean := False;
      GPIO43_LEVEL_LOW  : Boolean := False;
      GPIO43_LEVEL_HIGH : Boolean := False;
      GPIO43_EDGE_LOW   : Boolean := False;
      GPIO43_EDGE_HIGH  : Boolean := False;
      GPIO44_LEVEL_LOW  : Boolean := False;
      GPIO44_LEVEL_HIGH : Boolean := False;
      GPIO44_EDGE_LOW   : Boolean := False;
      GPIO44_EDGE_HIGH  : Boolean := False;
      GPIO45_LEVEL_LOW  : Boolean := False;
      GPIO45_LEVEL_HIGH : Boolean := False;
      GPIO45_EDGE_LOW   : Boolean := False;
      GPIO45_EDGE_HIGH  : Boolean := False;
      GPIO46_LEVEL_LOW  : Boolean := False;
      GPIO46_LEVEL_HIGH : Boolean := False;
      GPIO46_EDGE_LOW   : Boolean := False;
      GPIO46_EDGE_HIGH  : Boolean := False;
      GPIO47_LEVEL_LOW  : Boolean := False;
      GPIO47_LEVEL_HIGH : Boolean := False;
      GPIO47_EDGE_LOW   : Boolean := False;
      GPIO47_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC0_INTF5_Register use record
      GPIO40_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO40_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO40_EDGE_LOW   at 0 range 2 .. 2;
      GPIO40_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO41_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO41_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO41_EDGE_LOW   at 0 range 6 .. 6;
      GPIO41_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO42_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO42_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO42_EDGE_LOW   at 0 range 10 .. 10;
      GPIO42_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO43_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO43_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO43_EDGE_LOW   at 0 range 14 .. 14;
      GPIO43_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO44_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO44_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO44_EDGE_LOW   at 0 range 18 .. 18;
      GPIO44_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO45_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO45_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO45_EDGE_LOW   at 0 range 22 .. 22;
      GPIO45_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO46_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO46_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO46_EDGE_LOW   at 0 range 26 .. 26;
      GPIO46_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO47_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO47_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO47_EDGE_LOW   at 0 range 30 .. 30;
      GPIO47_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt status after masking & forcing for proc0
   type PROC0_INTS0_Register is record
      --  Read-only.
      GPIO0_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO0_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO0_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO0_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO1_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO1_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO1_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO1_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO2_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO2_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO2_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO2_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO3_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO3_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO3_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO3_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO4_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO4_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO4_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO4_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO5_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO5_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO5_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO5_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO6_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO6_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO6_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO6_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO7_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO7_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO7_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO7_EDGE_HIGH  : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC0_INTS0_Register use record
      GPIO0_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO0_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO0_EDGE_LOW   at 0 range 2 .. 2;
      GPIO0_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO1_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO1_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO1_EDGE_LOW   at 0 range 6 .. 6;
      GPIO1_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO2_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO2_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO2_EDGE_LOW   at 0 range 10 .. 10;
      GPIO2_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO3_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO3_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO3_EDGE_LOW   at 0 range 14 .. 14;
      GPIO3_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO4_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO4_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO4_EDGE_LOW   at 0 range 18 .. 18;
      GPIO4_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO5_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO5_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO5_EDGE_LOW   at 0 range 22 .. 22;
      GPIO5_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO6_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO6_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO6_EDGE_LOW   at 0 range 26 .. 26;
      GPIO6_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO7_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO7_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO7_EDGE_LOW   at 0 range 30 .. 30;
      GPIO7_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt status after masking & forcing for proc0
   type PROC0_INTS1_Register is record
      --  Read-only.
      GPIO8_LEVEL_LOW   : Boolean;
      --  Read-only.
      GPIO8_LEVEL_HIGH  : Boolean;
      --  Read-only.
      GPIO8_EDGE_LOW    : Boolean;
      --  Read-only.
      GPIO8_EDGE_HIGH   : Boolean;
      --  Read-only.
      GPIO9_LEVEL_LOW   : Boolean;
      --  Read-only.
      GPIO9_LEVEL_HIGH  : Boolean;
      --  Read-only.
      GPIO9_EDGE_LOW    : Boolean;
      --  Read-only.
      GPIO9_EDGE_HIGH   : Boolean;
      --  Read-only.
      GPIO10_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO10_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO10_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO10_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO11_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO11_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO11_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO11_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO12_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO12_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO12_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO12_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO13_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO13_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO13_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO13_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO14_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO14_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO14_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO14_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO15_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO15_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO15_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO15_EDGE_HIGH  : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC0_INTS1_Register use record
      GPIO8_LEVEL_LOW   at 0 range 0 .. 0;
      GPIO8_LEVEL_HIGH  at 0 range 1 .. 1;
      GPIO8_EDGE_LOW    at 0 range 2 .. 2;
      GPIO8_EDGE_HIGH   at 0 range 3 .. 3;
      GPIO9_LEVEL_LOW   at 0 range 4 .. 4;
      GPIO9_LEVEL_HIGH  at 0 range 5 .. 5;
      GPIO9_EDGE_LOW    at 0 range 6 .. 6;
      GPIO9_EDGE_HIGH   at 0 range 7 .. 7;
      GPIO10_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO10_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO10_EDGE_LOW   at 0 range 10 .. 10;
      GPIO10_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO11_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO11_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO11_EDGE_LOW   at 0 range 14 .. 14;
      GPIO11_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO12_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO12_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO12_EDGE_LOW   at 0 range 18 .. 18;
      GPIO12_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO13_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO13_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO13_EDGE_LOW   at 0 range 22 .. 22;
      GPIO13_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO14_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO14_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO14_EDGE_LOW   at 0 range 26 .. 26;
      GPIO14_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO15_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO15_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO15_EDGE_LOW   at 0 range 30 .. 30;
      GPIO15_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt status after masking & forcing for proc0
   type PROC0_INTS2_Register is record
      --  Read-only.
      GPIO16_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO16_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO16_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO16_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO17_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO17_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO17_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO17_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO18_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO18_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO18_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO18_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO19_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO19_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO19_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO19_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO20_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO20_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO20_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO20_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO21_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO21_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO21_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO21_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO22_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO22_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO22_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO22_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO23_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO23_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO23_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO23_EDGE_HIGH  : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC0_INTS2_Register use record
      GPIO16_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO16_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO16_EDGE_LOW   at 0 range 2 .. 2;
      GPIO16_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO17_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO17_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO17_EDGE_LOW   at 0 range 6 .. 6;
      GPIO17_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO18_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO18_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO18_EDGE_LOW   at 0 range 10 .. 10;
      GPIO18_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO19_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO19_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO19_EDGE_LOW   at 0 range 14 .. 14;
      GPIO19_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO20_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO20_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO20_EDGE_LOW   at 0 range 18 .. 18;
      GPIO20_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO21_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO21_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO21_EDGE_LOW   at 0 range 22 .. 22;
      GPIO21_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO22_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO22_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO22_EDGE_LOW   at 0 range 26 .. 26;
      GPIO22_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO23_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO23_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO23_EDGE_LOW   at 0 range 30 .. 30;
      GPIO23_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt status after masking & forcing for proc0
   type PROC0_INTS3_Register is record
      --  Read-only.
      GPIO24_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO24_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO24_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO24_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO25_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO25_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO25_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO25_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO26_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO26_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO26_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO26_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO27_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO27_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO27_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO27_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO28_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO28_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO28_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO28_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO29_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO29_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO29_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO29_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO30_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO30_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO30_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO30_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO31_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO31_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO31_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO31_EDGE_HIGH  : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC0_INTS3_Register use record
      GPIO24_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO24_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO24_EDGE_LOW   at 0 range 2 .. 2;
      GPIO24_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO25_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO25_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO25_EDGE_LOW   at 0 range 6 .. 6;
      GPIO25_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO26_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO26_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO26_EDGE_LOW   at 0 range 10 .. 10;
      GPIO26_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO27_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO27_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO27_EDGE_LOW   at 0 range 14 .. 14;
      GPIO27_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO28_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO28_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO28_EDGE_LOW   at 0 range 18 .. 18;
      GPIO28_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO29_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO29_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO29_EDGE_LOW   at 0 range 22 .. 22;
      GPIO29_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO30_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO30_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO30_EDGE_LOW   at 0 range 26 .. 26;
      GPIO30_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO31_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO31_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO31_EDGE_LOW   at 0 range 30 .. 30;
      GPIO31_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt status after masking & forcing for proc0
   type PROC0_INTS4_Register is record
      --  Read-only.
      GPIO32_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO32_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO32_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO32_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO33_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO33_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO33_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO33_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO34_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO34_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO34_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO34_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO35_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO35_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO35_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO35_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO36_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO36_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO36_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO36_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO37_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO37_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO37_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO37_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO38_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO38_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO38_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO38_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO39_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO39_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO39_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO39_EDGE_HIGH  : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC0_INTS4_Register use record
      GPIO32_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO32_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO32_EDGE_LOW   at 0 range 2 .. 2;
      GPIO32_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO33_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO33_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO33_EDGE_LOW   at 0 range 6 .. 6;
      GPIO33_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO34_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO34_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO34_EDGE_LOW   at 0 range 10 .. 10;
      GPIO34_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO35_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO35_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO35_EDGE_LOW   at 0 range 14 .. 14;
      GPIO35_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO36_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO36_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO36_EDGE_LOW   at 0 range 18 .. 18;
      GPIO36_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO37_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO37_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO37_EDGE_LOW   at 0 range 22 .. 22;
      GPIO37_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO38_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO38_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO38_EDGE_LOW   at 0 range 26 .. 26;
      GPIO38_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO39_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO39_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO39_EDGE_LOW   at 0 range 30 .. 30;
      GPIO39_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt status after masking & forcing for proc0
   type PROC0_INTS5_Register is record
      --  Read-only.
      GPIO40_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO40_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO40_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO40_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO41_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO41_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO41_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO41_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO42_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO42_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO42_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO42_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO43_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO43_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO43_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO43_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO44_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO44_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO44_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO44_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO45_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO45_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO45_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO45_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO46_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO46_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO46_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO46_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO47_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO47_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO47_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO47_EDGE_HIGH  : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC0_INTS5_Register use record
      GPIO40_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO40_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO40_EDGE_LOW   at 0 range 2 .. 2;
      GPIO40_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO41_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO41_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO41_EDGE_LOW   at 0 range 6 .. 6;
      GPIO41_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO42_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO42_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO42_EDGE_LOW   at 0 range 10 .. 10;
      GPIO42_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO43_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO43_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO43_EDGE_LOW   at 0 range 14 .. 14;
      GPIO43_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO44_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO44_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO44_EDGE_LOW   at 0 range 18 .. 18;
      GPIO44_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO45_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO45_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO45_EDGE_LOW   at 0 range 22 .. 22;
      GPIO45_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO46_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO46_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO46_EDGE_LOW   at 0 range 26 .. 26;
      GPIO46_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO47_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO47_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO47_EDGE_LOW   at 0 range 30 .. 30;
      GPIO47_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Enable for proc1
   type PROC1_INTE0_Register is record
      GPIO0_LEVEL_LOW  : Boolean := False;
      GPIO0_LEVEL_HIGH : Boolean := False;
      GPIO0_EDGE_LOW   : Boolean := False;
      GPIO0_EDGE_HIGH  : Boolean := False;
      GPIO1_LEVEL_LOW  : Boolean := False;
      GPIO1_LEVEL_HIGH : Boolean := False;
      GPIO1_EDGE_LOW   : Boolean := False;
      GPIO1_EDGE_HIGH  : Boolean := False;
      GPIO2_LEVEL_LOW  : Boolean := False;
      GPIO2_LEVEL_HIGH : Boolean := False;
      GPIO2_EDGE_LOW   : Boolean := False;
      GPIO2_EDGE_HIGH  : Boolean := False;
      GPIO3_LEVEL_LOW  : Boolean := False;
      GPIO3_LEVEL_HIGH : Boolean := False;
      GPIO3_EDGE_LOW   : Boolean := False;
      GPIO3_EDGE_HIGH  : Boolean := False;
      GPIO4_LEVEL_LOW  : Boolean := False;
      GPIO4_LEVEL_HIGH : Boolean := False;
      GPIO4_EDGE_LOW   : Boolean := False;
      GPIO4_EDGE_HIGH  : Boolean := False;
      GPIO5_LEVEL_LOW  : Boolean := False;
      GPIO5_LEVEL_HIGH : Boolean := False;
      GPIO5_EDGE_LOW   : Boolean := False;
      GPIO5_EDGE_HIGH  : Boolean := False;
      GPIO6_LEVEL_LOW  : Boolean := False;
      GPIO6_LEVEL_HIGH : Boolean := False;
      GPIO6_EDGE_LOW   : Boolean := False;
      GPIO6_EDGE_HIGH  : Boolean := False;
      GPIO7_LEVEL_LOW  : Boolean := False;
      GPIO7_LEVEL_HIGH : Boolean := False;
      GPIO7_EDGE_LOW   : Boolean := False;
      GPIO7_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC1_INTE0_Register use record
      GPIO0_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO0_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO0_EDGE_LOW   at 0 range 2 .. 2;
      GPIO0_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO1_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO1_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO1_EDGE_LOW   at 0 range 6 .. 6;
      GPIO1_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO2_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO2_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO2_EDGE_LOW   at 0 range 10 .. 10;
      GPIO2_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO3_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO3_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO3_EDGE_LOW   at 0 range 14 .. 14;
      GPIO3_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO4_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO4_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO4_EDGE_LOW   at 0 range 18 .. 18;
      GPIO4_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO5_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO5_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO5_EDGE_LOW   at 0 range 22 .. 22;
      GPIO5_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO6_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO6_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO6_EDGE_LOW   at 0 range 26 .. 26;
      GPIO6_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO7_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO7_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO7_EDGE_LOW   at 0 range 30 .. 30;
      GPIO7_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Enable for proc1
   type PROC1_INTE1_Register is record
      GPIO8_LEVEL_LOW   : Boolean := False;
      GPIO8_LEVEL_HIGH  : Boolean := False;
      GPIO8_EDGE_LOW    : Boolean := False;
      GPIO8_EDGE_HIGH   : Boolean := False;
      GPIO9_LEVEL_LOW   : Boolean := False;
      GPIO9_LEVEL_HIGH  : Boolean := False;
      GPIO9_EDGE_LOW    : Boolean := False;
      GPIO9_EDGE_HIGH   : Boolean := False;
      GPIO10_LEVEL_LOW  : Boolean := False;
      GPIO10_LEVEL_HIGH : Boolean := False;
      GPIO10_EDGE_LOW   : Boolean := False;
      GPIO10_EDGE_HIGH  : Boolean := False;
      GPIO11_LEVEL_LOW  : Boolean := False;
      GPIO11_LEVEL_HIGH : Boolean := False;
      GPIO11_EDGE_LOW   : Boolean := False;
      GPIO11_EDGE_HIGH  : Boolean := False;
      GPIO12_LEVEL_LOW  : Boolean := False;
      GPIO12_LEVEL_HIGH : Boolean := False;
      GPIO12_EDGE_LOW   : Boolean := False;
      GPIO12_EDGE_HIGH  : Boolean := False;
      GPIO13_LEVEL_LOW  : Boolean := False;
      GPIO13_LEVEL_HIGH : Boolean := False;
      GPIO13_EDGE_LOW   : Boolean := False;
      GPIO13_EDGE_HIGH  : Boolean := False;
      GPIO14_LEVEL_LOW  : Boolean := False;
      GPIO14_LEVEL_HIGH : Boolean := False;
      GPIO14_EDGE_LOW   : Boolean := False;
      GPIO14_EDGE_HIGH  : Boolean := False;
      GPIO15_LEVEL_LOW  : Boolean := False;
      GPIO15_LEVEL_HIGH : Boolean := False;
      GPIO15_EDGE_LOW   : Boolean := False;
      GPIO15_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC1_INTE1_Register use record
      GPIO8_LEVEL_LOW   at 0 range 0 .. 0;
      GPIO8_LEVEL_HIGH  at 0 range 1 .. 1;
      GPIO8_EDGE_LOW    at 0 range 2 .. 2;
      GPIO8_EDGE_HIGH   at 0 range 3 .. 3;
      GPIO9_LEVEL_LOW   at 0 range 4 .. 4;
      GPIO9_LEVEL_HIGH  at 0 range 5 .. 5;
      GPIO9_EDGE_LOW    at 0 range 6 .. 6;
      GPIO9_EDGE_HIGH   at 0 range 7 .. 7;
      GPIO10_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO10_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO10_EDGE_LOW   at 0 range 10 .. 10;
      GPIO10_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO11_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO11_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO11_EDGE_LOW   at 0 range 14 .. 14;
      GPIO11_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO12_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO12_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO12_EDGE_LOW   at 0 range 18 .. 18;
      GPIO12_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO13_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO13_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO13_EDGE_LOW   at 0 range 22 .. 22;
      GPIO13_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO14_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO14_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO14_EDGE_LOW   at 0 range 26 .. 26;
      GPIO14_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO15_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO15_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO15_EDGE_LOW   at 0 range 30 .. 30;
      GPIO15_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Enable for proc1
   type PROC1_INTE2_Register is record
      GPIO16_LEVEL_LOW  : Boolean := False;
      GPIO16_LEVEL_HIGH : Boolean := False;
      GPIO16_EDGE_LOW   : Boolean := False;
      GPIO16_EDGE_HIGH  : Boolean := False;
      GPIO17_LEVEL_LOW  : Boolean := False;
      GPIO17_LEVEL_HIGH : Boolean := False;
      GPIO17_EDGE_LOW   : Boolean := False;
      GPIO17_EDGE_HIGH  : Boolean := False;
      GPIO18_LEVEL_LOW  : Boolean := False;
      GPIO18_LEVEL_HIGH : Boolean := False;
      GPIO18_EDGE_LOW   : Boolean := False;
      GPIO18_EDGE_HIGH  : Boolean := False;
      GPIO19_LEVEL_LOW  : Boolean := False;
      GPIO19_LEVEL_HIGH : Boolean := False;
      GPIO19_EDGE_LOW   : Boolean := False;
      GPIO19_EDGE_HIGH  : Boolean := False;
      GPIO20_LEVEL_LOW  : Boolean := False;
      GPIO20_LEVEL_HIGH : Boolean := False;
      GPIO20_EDGE_LOW   : Boolean := False;
      GPIO20_EDGE_HIGH  : Boolean := False;
      GPIO21_LEVEL_LOW  : Boolean := False;
      GPIO21_LEVEL_HIGH : Boolean := False;
      GPIO21_EDGE_LOW   : Boolean := False;
      GPIO21_EDGE_HIGH  : Boolean := False;
      GPIO22_LEVEL_LOW  : Boolean := False;
      GPIO22_LEVEL_HIGH : Boolean := False;
      GPIO22_EDGE_LOW   : Boolean := False;
      GPIO22_EDGE_HIGH  : Boolean := False;
      GPIO23_LEVEL_LOW  : Boolean := False;
      GPIO23_LEVEL_HIGH : Boolean := False;
      GPIO23_EDGE_LOW   : Boolean := False;
      GPIO23_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC1_INTE2_Register use record
      GPIO16_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO16_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO16_EDGE_LOW   at 0 range 2 .. 2;
      GPIO16_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO17_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO17_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO17_EDGE_LOW   at 0 range 6 .. 6;
      GPIO17_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO18_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO18_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO18_EDGE_LOW   at 0 range 10 .. 10;
      GPIO18_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO19_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO19_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO19_EDGE_LOW   at 0 range 14 .. 14;
      GPIO19_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO20_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO20_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO20_EDGE_LOW   at 0 range 18 .. 18;
      GPIO20_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO21_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO21_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO21_EDGE_LOW   at 0 range 22 .. 22;
      GPIO21_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO22_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO22_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO22_EDGE_LOW   at 0 range 26 .. 26;
      GPIO22_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO23_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO23_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO23_EDGE_LOW   at 0 range 30 .. 30;
      GPIO23_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Enable for proc1
   type PROC1_INTE3_Register is record
      GPIO24_LEVEL_LOW  : Boolean := False;
      GPIO24_LEVEL_HIGH : Boolean := False;
      GPIO24_EDGE_LOW   : Boolean := False;
      GPIO24_EDGE_HIGH  : Boolean := False;
      GPIO25_LEVEL_LOW  : Boolean := False;
      GPIO25_LEVEL_HIGH : Boolean := False;
      GPIO25_EDGE_LOW   : Boolean := False;
      GPIO25_EDGE_HIGH  : Boolean := False;
      GPIO26_LEVEL_LOW  : Boolean := False;
      GPIO26_LEVEL_HIGH : Boolean := False;
      GPIO26_EDGE_LOW   : Boolean := False;
      GPIO26_EDGE_HIGH  : Boolean := False;
      GPIO27_LEVEL_LOW  : Boolean := False;
      GPIO27_LEVEL_HIGH : Boolean := False;
      GPIO27_EDGE_LOW   : Boolean := False;
      GPIO27_EDGE_HIGH  : Boolean := False;
      GPIO28_LEVEL_LOW  : Boolean := False;
      GPIO28_LEVEL_HIGH : Boolean := False;
      GPIO28_EDGE_LOW   : Boolean := False;
      GPIO28_EDGE_HIGH  : Boolean := False;
      GPIO29_LEVEL_LOW  : Boolean := False;
      GPIO29_LEVEL_HIGH : Boolean := False;
      GPIO29_EDGE_LOW   : Boolean := False;
      GPIO29_EDGE_HIGH  : Boolean := False;
      GPIO30_LEVEL_LOW  : Boolean := False;
      GPIO30_LEVEL_HIGH : Boolean := False;
      GPIO30_EDGE_LOW   : Boolean := False;
      GPIO30_EDGE_HIGH  : Boolean := False;
      GPIO31_LEVEL_LOW  : Boolean := False;
      GPIO31_LEVEL_HIGH : Boolean := False;
      GPIO31_EDGE_LOW   : Boolean := False;
      GPIO31_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC1_INTE3_Register use record
      GPIO24_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO24_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO24_EDGE_LOW   at 0 range 2 .. 2;
      GPIO24_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO25_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO25_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO25_EDGE_LOW   at 0 range 6 .. 6;
      GPIO25_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO26_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO26_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO26_EDGE_LOW   at 0 range 10 .. 10;
      GPIO26_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO27_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO27_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO27_EDGE_LOW   at 0 range 14 .. 14;
      GPIO27_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO28_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO28_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO28_EDGE_LOW   at 0 range 18 .. 18;
      GPIO28_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO29_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO29_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO29_EDGE_LOW   at 0 range 22 .. 22;
      GPIO29_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO30_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO30_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO30_EDGE_LOW   at 0 range 26 .. 26;
      GPIO30_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO31_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO31_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO31_EDGE_LOW   at 0 range 30 .. 30;
      GPIO31_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Enable for proc1
   type PROC1_INTE4_Register is record
      GPIO32_LEVEL_LOW  : Boolean := False;
      GPIO32_LEVEL_HIGH : Boolean := False;
      GPIO32_EDGE_LOW   : Boolean := False;
      GPIO32_EDGE_HIGH  : Boolean := False;
      GPIO33_LEVEL_LOW  : Boolean := False;
      GPIO33_LEVEL_HIGH : Boolean := False;
      GPIO33_EDGE_LOW   : Boolean := False;
      GPIO33_EDGE_HIGH  : Boolean := False;
      GPIO34_LEVEL_LOW  : Boolean := False;
      GPIO34_LEVEL_HIGH : Boolean := False;
      GPIO34_EDGE_LOW   : Boolean := False;
      GPIO34_EDGE_HIGH  : Boolean := False;
      GPIO35_LEVEL_LOW  : Boolean := False;
      GPIO35_LEVEL_HIGH : Boolean := False;
      GPIO35_EDGE_LOW   : Boolean := False;
      GPIO35_EDGE_HIGH  : Boolean := False;
      GPIO36_LEVEL_LOW  : Boolean := False;
      GPIO36_LEVEL_HIGH : Boolean := False;
      GPIO36_EDGE_LOW   : Boolean := False;
      GPIO36_EDGE_HIGH  : Boolean := False;
      GPIO37_LEVEL_LOW  : Boolean := False;
      GPIO37_LEVEL_HIGH : Boolean := False;
      GPIO37_EDGE_LOW   : Boolean := False;
      GPIO37_EDGE_HIGH  : Boolean := False;
      GPIO38_LEVEL_LOW  : Boolean := False;
      GPIO38_LEVEL_HIGH : Boolean := False;
      GPIO38_EDGE_LOW   : Boolean := False;
      GPIO38_EDGE_HIGH  : Boolean := False;
      GPIO39_LEVEL_LOW  : Boolean := False;
      GPIO39_LEVEL_HIGH : Boolean := False;
      GPIO39_EDGE_LOW   : Boolean := False;
      GPIO39_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC1_INTE4_Register use record
      GPIO32_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO32_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO32_EDGE_LOW   at 0 range 2 .. 2;
      GPIO32_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO33_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO33_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO33_EDGE_LOW   at 0 range 6 .. 6;
      GPIO33_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO34_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO34_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO34_EDGE_LOW   at 0 range 10 .. 10;
      GPIO34_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO35_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO35_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO35_EDGE_LOW   at 0 range 14 .. 14;
      GPIO35_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO36_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO36_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO36_EDGE_LOW   at 0 range 18 .. 18;
      GPIO36_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO37_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO37_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO37_EDGE_LOW   at 0 range 22 .. 22;
      GPIO37_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO38_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO38_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO38_EDGE_LOW   at 0 range 26 .. 26;
      GPIO38_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO39_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO39_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO39_EDGE_LOW   at 0 range 30 .. 30;
      GPIO39_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Enable for proc1
   type PROC1_INTE5_Register is record
      GPIO40_LEVEL_LOW  : Boolean := False;
      GPIO40_LEVEL_HIGH : Boolean := False;
      GPIO40_EDGE_LOW   : Boolean := False;
      GPIO40_EDGE_HIGH  : Boolean := False;
      GPIO41_LEVEL_LOW  : Boolean := False;
      GPIO41_LEVEL_HIGH : Boolean := False;
      GPIO41_EDGE_LOW   : Boolean := False;
      GPIO41_EDGE_HIGH  : Boolean := False;
      GPIO42_LEVEL_LOW  : Boolean := False;
      GPIO42_LEVEL_HIGH : Boolean := False;
      GPIO42_EDGE_LOW   : Boolean := False;
      GPIO42_EDGE_HIGH  : Boolean := False;
      GPIO43_LEVEL_LOW  : Boolean := False;
      GPIO43_LEVEL_HIGH : Boolean := False;
      GPIO43_EDGE_LOW   : Boolean := False;
      GPIO43_EDGE_HIGH  : Boolean := False;
      GPIO44_LEVEL_LOW  : Boolean := False;
      GPIO44_LEVEL_HIGH : Boolean := False;
      GPIO44_EDGE_LOW   : Boolean := False;
      GPIO44_EDGE_HIGH  : Boolean := False;
      GPIO45_LEVEL_LOW  : Boolean := False;
      GPIO45_LEVEL_HIGH : Boolean := False;
      GPIO45_EDGE_LOW   : Boolean := False;
      GPIO45_EDGE_HIGH  : Boolean := False;
      GPIO46_LEVEL_LOW  : Boolean := False;
      GPIO46_LEVEL_HIGH : Boolean := False;
      GPIO46_EDGE_LOW   : Boolean := False;
      GPIO46_EDGE_HIGH  : Boolean := False;
      GPIO47_LEVEL_LOW  : Boolean := False;
      GPIO47_LEVEL_HIGH : Boolean := False;
      GPIO47_EDGE_LOW   : Boolean := False;
      GPIO47_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC1_INTE5_Register use record
      GPIO40_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO40_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO40_EDGE_LOW   at 0 range 2 .. 2;
      GPIO40_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO41_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO41_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO41_EDGE_LOW   at 0 range 6 .. 6;
      GPIO41_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO42_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO42_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO42_EDGE_LOW   at 0 range 10 .. 10;
      GPIO42_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO43_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO43_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO43_EDGE_LOW   at 0 range 14 .. 14;
      GPIO43_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO44_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO44_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO44_EDGE_LOW   at 0 range 18 .. 18;
      GPIO44_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO45_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO45_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO45_EDGE_LOW   at 0 range 22 .. 22;
      GPIO45_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO46_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO46_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO46_EDGE_LOW   at 0 range 26 .. 26;
      GPIO46_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO47_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO47_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO47_EDGE_LOW   at 0 range 30 .. 30;
      GPIO47_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Force for proc1
   type PROC1_INTF0_Register is record
      GPIO0_LEVEL_LOW  : Boolean := False;
      GPIO0_LEVEL_HIGH : Boolean := False;
      GPIO0_EDGE_LOW   : Boolean := False;
      GPIO0_EDGE_HIGH  : Boolean := False;
      GPIO1_LEVEL_LOW  : Boolean := False;
      GPIO1_LEVEL_HIGH : Boolean := False;
      GPIO1_EDGE_LOW   : Boolean := False;
      GPIO1_EDGE_HIGH  : Boolean := False;
      GPIO2_LEVEL_LOW  : Boolean := False;
      GPIO2_LEVEL_HIGH : Boolean := False;
      GPIO2_EDGE_LOW   : Boolean := False;
      GPIO2_EDGE_HIGH  : Boolean := False;
      GPIO3_LEVEL_LOW  : Boolean := False;
      GPIO3_LEVEL_HIGH : Boolean := False;
      GPIO3_EDGE_LOW   : Boolean := False;
      GPIO3_EDGE_HIGH  : Boolean := False;
      GPIO4_LEVEL_LOW  : Boolean := False;
      GPIO4_LEVEL_HIGH : Boolean := False;
      GPIO4_EDGE_LOW   : Boolean := False;
      GPIO4_EDGE_HIGH  : Boolean := False;
      GPIO5_LEVEL_LOW  : Boolean := False;
      GPIO5_LEVEL_HIGH : Boolean := False;
      GPIO5_EDGE_LOW   : Boolean := False;
      GPIO5_EDGE_HIGH  : Boolean := False;
      GPIO6_LEVEL_LOW  : Boolean := False;
      GPIO6_LEVEL_HIGH : Boolean := False;
      GPIO6_EDGE_LOW   : Boolean := False;
      GPIO6_EDGE_HIGH  : Boolean := False;
      GPIO7_LEVEL_LOW  : Boolean := False;
      GPIO7_LEVEL_HIGH : Boolean := False;
      GPIO7_EDGE_LOW   : Boolean := False;
      GPIO7_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC1_INTF0_Register use record
      GPIO0_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO0_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO0_EDGE_LOW   at 0 range 2 .. 2;
      GPIO0_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO1_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO1_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO1_EDGE_LOW   at 0 range 6 .. 6;
      GPIO1_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO2_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO2_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO2_EDGE_LOW   at 0 range 10 .. 10;
      GPIO2_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO3_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO3_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO3_EDGE_LOW   at 0 range 14 .. 14;
      GPIO3_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO4_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO4_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO4_EDGE_LOW   at 0 range 18 .. 18;
      GPIO4_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO5_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO5_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO5_EDGE_LOW   at 0 range 22 .. 22;
      GPIO5_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO6_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO6_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO6_EDGE_LOW   at 0 range 26 .. 26;
      GPIO6_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO7_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO7_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO7_EDGE_LOW   at 0 range 30 .. 30;
      GPIO7_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Force for proc1
   type PROC1_INTF1_Register is record
      GPIO8_LEVEL_LOW   : Boolean := False;
      GPIO8_LEVEL_HIGH  : Boolean := False;
      GPIO8_EDGE_LOW    : Boolean := False;
      GPIO8_EDGE_HIGH   : Boolean := False;
      GPIO9_LEVEL_LOW   : Boolean := False;
      GPIO9_LEVEL_HIGH  : Boolean := False;
      GPIO9_EDGE_LOW    : Boolean := False;
      GPIO9_EDGE_HIGH   : Boolean := False;
      GPIO10_LEVEL_LOW  : Boolean := False;
      GPIO10_LEVEL_HIGH : Boolean := False;
      GPIO10_EDGE_LOW   : Boolean := False;
      GPIO10_EDGE_HIGH  : Boolean := False;
      GPIO11_LEVEL_LOW  : Boolean := False;
      GPIO11_LEVEL_HIGH : Boolean := False;
      GPIO11_EDGE_LOW   : Boolean := False;
      GPIO11_EDGE_HIGH  : Boolean := False;
      GPIO12_LEVEL_LOW  : Boolean := False;
      GPIO12_LEVEL_HIGH : Boolean := False;
      GPIO12_EDGE_LOW   : Boolean := False;
      GPIO12_EDGE_HIGH  : Boolean := False;
      GPIO13_LEVEL_LOW  : Boolean := False;
      GPIO13_LEVEL_HIGH : Boolean := False;
      GPIO13_EDGE_LOW   : Boolean := False;
      GPIO13_EDGE_HIGH  : Boolean := False;
      GPIO14_LEVEL_LOW  : Boolean := False;
      GPIO14_LEVEL_HIGH : Boolean := False;
      GPIO14_EDGE_LOW   : Boolean := False;
      GPIO14_EDGE_HIGH  : Boolean := False;
      GPIO15_LEVEL_LOW  : Boolean := False;
      GPIO15_LEVEL_HIGH : Boolean := False;
      GPIO15_EDGE_LOW   : Boolean := False;
      GPIO15_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC1_INTF1_Register use record
      GPIO8_LEVEL_LOW   at 0 range 0 .. 0;
      GPIO8_LEVEL_HIGH  at 0 range 1 .. 1;
      GPIO8_EDGE_LOW    at 0 range 2 .. 2;
      GPIO8_EDGE_HIGH   at 0 range 3 .. 3;
      GPIO9_LEVEL_LOW   at 0 range 4 .. 4;
      GPIO9_LEVEL_HIGH  at 0 range 5 .. 5;
      GPIO9_EDGE_LOW    at 0 range 6 .. 6;
      GPIO9_EDGE_HIGH   at 0 range 7 .. 7;
      GPIO10_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO10_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO10_EDGE_LOW   at 0 range 10 .. 10;
      GPIO10_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO11_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO11_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO11_EDGE_LOW   at 0 range 14 .. 14;
      GPIO11_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO12_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO12_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO12_EDGE_LOW   at 0 range 18 .. 18;
      GPIO12_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO13_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO13_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO13_EDGE_LOW   at 0 range 22 .. 22;
      GPIO13_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO14_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO14_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO14_EDGE_LOW   at 0 range 26 .. 26;
      GPIO14_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO15_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO15_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO15_EDGE_LOW   at 0 range 30 .. 30;
      GPIO15_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Force for proc1
   type PROC1_INTF2_Register is record
      GPIO16_LEVEL_LOW  : Boolean := False;
      GPIO16_LEVEL_HIGH : Boolean := False;
      GPIO16_EDGE_LOW   : Boolean := False;
      GPIO16_EDGE_HIGH  : Boolean := False;
      GPIO17_LEVEL_LOW  : Boolean := False;
      GPIO17_LEVEL_HIGH : Boolean := False;
      GPIO17_EDGE_LOW   : Boolean := False;
      GPIO17_EDGE_HIGH  : Boolean := False;
      GPIO18_LEVEL_LOW  : Boolean := False;
      GPIO18_LEVEL_HIGH : Boolean := False;
      GPIO18_EDGE_LOW   : Boolean := False;
      GPIO18_EDGE_HIGH  : Boolean := False;
      GPIO19_LEVEL_LOW  : Boolean := False;
      GPIO19_LEVEL_HIGH : Boolean := False;
      GPIO19_EDGE_LOW   : Boolean := False;
      GPIO19_EDGE_HIGH  : Boolean := False;
      GPIO20_LEVEL_LOW  : Boolean := False;
      GPIO20_LEVEL_HIGH : Boolean := False;
      GPIO20_EDGE_LOW   : Boolean := False;
      GPIO20_EDGE_HIGH  : Boolean := False;
      GPIO21_LEVEL_LOW  : Boolean := False;
      GPIO21_LEVEL_HIGH : Boolean := False;
      GPIO21_EDGE_LOW   : Boolean := False;
      GPIO21_EDGE_HIGH  : Boolean := False;
      GPIO22_LEVEL_LOW  : Boolean := False;
      GPIO22_LEVEL_HIGH : Boolean := False;
      GPIO22_EDGE_LOW   : Boolean := False;
      GPIO22_EDGE_HIGH  : Boolean := False;
      GPIO23_LEVEL_LOW  : Boolean := False;
      GPIO23_LEVEL_HIGH : Boolean := False;
      GPIO23_EDGE_LOW   : Boolean := False;
      GPIO23_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC1_INTF2_Register use record
      GPIO16_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO16_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO16_EDGE_LOW   at 0 range 2 .. 2;
      GPIO16_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO17_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO17_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO17_EDGE_LOW   at 0 range 6 .. 6;
      GPIO17_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO18_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO18_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO18_EDGE_LOW   at 0 range 10 .. 10;
      GPIO18_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO19_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO19_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO19_EDGE_LOW   at 0 range 14 .. 14;
      GPIO19_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO20_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO20_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO20_EDGE_LOW   at 0 range 18 .. 18;
      GPIO20_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO21_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO21_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO21_EDGE_LOW   at 0 range 22 .. 22;
      GPIO21_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO22_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO22_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO22_EDGE_LOW   at 0 range 26 .. 26;
      GPIO22_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO23_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO23_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO23_EDGE_LOW   at 0 range 30 .. 30;
      GPIO23_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Force for proc1
   type PROC1_INTF3_Register is record
      GPIO24_LEVEL_LOW  : Boolean := False;
      GPIO24_LEVEL_HIGH : Boolean := False;
      GPIO24_EDGE_LOW   : Boolean := False;
      GPIO24_EDGE_HIGH  : Boolean := False;
      GPIO25_LEVEL_LOW  : Boolean := False;
      GPIO25_LEVEL_HIGH : Boolean := False;
      GPIO25_EDGE_LOW   : Boolean := False;
      GPIO25_EDGE_HIGH  : Boolean := False;
      GPIO26_LEVEL_LOW  : Boolean := False;
      GPIO26_LEVEL_HIGH : Boolean := False;
      GPIO26_EDGE_LOW   : Boolean := False;
      GPIO26_EDGE_HIGH  : Boolean := False;
      GPIO27_LEVEL_LOW  : Boolean := False;
      GPIO27_LEVEL_HIGH : Boolean := False;
      GPIO27_EDGE_LOW   : Boolean := False;
      GPIO27_EDGE_HIGH  : Boolean := False;
      GPIO28_LEVEL_LOW  : Boolean := False;
      GPIO28_LEVEL_HIGH : Boolean := False;
      GPIO28_EDGE_LOW   : Boolean := False;
      GPIO28_EDGE_HIGH  : Boolean := False;
      GPIO29_LEVEL_LOW  : Boolean := False;
      GPIO29_LEVEL_HIGH : Boolean := False;
      GPIO29_EDGE_LOW   : Boolean := False;
      GPIO29_EDGE_HIGH  : Boolean := False;
      GPIO30_LEVEL_LOW  : Boolean := False;
      GPIO30_LEVEL_HIGH : Boolean := False;
      GPIO30_EDGE_LOW   : Boolean := False;
      GPIO30_EDGE_HIGH  : Boolean := False;
      GPIO31_LEVEL_LOW  : Boolean := False;
      GPIO31_LEVEL_HIGH : Boolean := False;
      GPIO31_EDGE_LOW   : Boolean := False;
      GPIO31_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC1_INTF3_Register use record
      GPIO24_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO24_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO24_EDGE_LOW   at 0 range 2 .. 2;
      GPIO24_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO25_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO25_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO25_EDGE_LOW   at 0 range 6 .. 6;
      GPIO25_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO26_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO26_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO26_EDGE_LOW   at 0 range 10 .. 10;
      GPIO26_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO27_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO27_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO27_EDGE_LOW   at 0 range 14 .. 14;
      GPIO27_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO28_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO28_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO28_EDGE_LOW   at 0 range 18 .. 18;
      GPIO28_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO29_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO29_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO29_EDGE_LOW   at 0 range 22 .. 22;
      GPIO29_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO30_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO30_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO30_EDGE_LOW   at 0 range 26 .. 26;
      GPIO30_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO31_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO31_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO31_EDGE_LOW   at 0 range 30 .. 30;
      GPIO31_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Force for proc1
   type PROC1_INTF4_Register is record
      GPIO32_LEVEL_LOW  : Boolean := False;
      GPIO32_LEVEL_HIGH : Boolean := False;
      GPIO32_EDGE_LOW   : Boolean := False;
      GPIO32_EDGE_HIGH  : Boolean := False;
      GPIO33_LEVEL_LOW  : Boolean := False;
      GPIO33_LEVEL_HIGH : Boolean := False;
      GPIO33_EDGE_LOW   : Boolean := False;
      GPIO33_EDGE_HIGH  : Boolean := False;
      GPIO34_LEVEL_LOW  : Boolean := False;
      GPIO34_LEVEL_HIGH : Boolean := False;
      GPIO34_EDGE_LOW   : Boolean := False;
      GPIO34_EDGE_HIGH  : Boolean := False;
      GPIO35_LEVEL_LOW  : Boolean := False;
      GPIO35_LEVEL_HIGH : Boolean := False;
      GPIO35_EDGE_LOW   : Boolean := False;
      GPIO35_EDGE_HIGH  : Boolean := False;
      GPIO36_LEVEL_LOW  : Boolean := False;
      GPIO36_LEVEL_HIGH : Boolean := False;
      GPIO36_EDGE_LOW   : Boolean := False;
      GPIO36_EDGE_HIGH  : Boolean := False;
      GPIO37_LEVEL_LOW  : Boolean := False;
      GPIO37_LEVEL_HIGH : Boolean := False;
      GPIO37_EDGE_LOW   : Boolean := False;
      GPIO37_EDGE_HIGH  : Boolean := False;
      GPIO38_LEVEL_LOW  : Boolean := False;
      GPIO38_LEVEL_HIGH : Boolean := False;
      GPIO38_EDGE_LOW   : Boolean := False;
      GPIO38_EDGE_HIGH  : Boolean := False;
      GPIO39_LEVEL_LOW  : Boolean := False;
      GPIO39_LEVEL_HIGH : Boolean := False;
      GPIO39_EDGE_LOW   : Boolean := False;
      GPIO39_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC1_INTF4_Register use record
      GPIO32_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO32_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO32_EDGE_LOW   at 0 range 2 .. 2;
      GPIO32_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO33_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO33_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO33_EDGE_LOW   at 0 range 6 .. 6;
      GPIO33_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO34_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO34_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO34_EDGE_LOW   at 0 range 10 .. 10;
      GPIO34_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO35_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO35_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO35_EDGE_LOW   at 0 range 14 .. 14;
      GPIO35_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO36_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO36_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO36_EDGE_LOW   at 0 range 18 .. 18;
      GPIO36_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO37_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO37_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO37_EDGE_LOW   at 0 range 22 .. 22;
      GPIO37_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO38_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO38_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO38_EDGE_LOW   at 0 range 26 .. 26;
      GPIO38_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO39_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO39_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO39_EDGE_LOW   at 0 range 30 .. 30;
      GPIO39_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Force for proc1
   type PROC1_INTF5_Register is record
      GPIO40_LEVEL_LOW  : Boolean := False;
      GPIO40_LEVEL_HIGH : Boolean := False;
      GPIO40_EDGE_LOW   : Boolean := False;
      GPIO40_EDGE_HIGH  : Boolean := False;
      GPIO41_LEVEL_LOW  : Boolean := False;
      GPIO41_LEVEL_HIGH : Boolean := False;
      GPIO41_EDGE_LOW   : Boolean := False;
      GPIO41_EDGE_HIGH  : Boolean := False;
      GPIO42_LEVEL_LOW  : Boolean := False;
      GPIO42_LEVEL_HIGH : Boolean := False;
      GPIO42_EDGE_LOW   : Boolean := False;
      GPIO42_EDGE_HIGH  : Boolean := False;
      GPIO43_LEVEL_LOW  : Boolean := False;
      GPIO43_LEVEL_HIGH : Boolean := False;
      GPIO43_EDGE_LOW   : Boolean := False;
      GPIO43_EDGE_HIGH  : Boolean := False;
      GPIO44_LEVEL_LOW  : Boolean := False;
      GPIO44_LEVEL_HIGH : Boolean := False;
      GPIO44_EDGE_LOW   : Boolean := False;
      GPIO44_EDGE_HIGH  : Boolean := False;
      GPIO45_LEVEL_LOW  : Boolean := False;
      GPIO45_LEVEL_HIGH : Boolean := False;
      GPIO45_EDGE_LOW   : Boolean := False;
      GPIO45_EDGE_HIGH  : Boolean := False;
      GPIO46_LEVEL_LOW  : Boolean := False;
      GPIO46_LEVEL_HIGH : Boolean := False;
      GPIO46_EDGE_LOW   : Boolean := False;
      GPIO46_EDGE_HIGH  : Boolean := False;
      GPIO47_LEVEL_LOW  : Boolean := False;
      GPIO47_LEVEL_HIGH : Boolean := False;
      GPIO47_EDGE_LOW   : Boolean := False;
      GPIO47_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC1_INTF5_Register use record
      GPIO40_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO40_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO40_EDGE_LOW   at 0 range 2 .. 2;
      GPIO40_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO41_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO41_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO41_EDGE_LOW   at 0 range 6 .. 6;
      GPIO41_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO42_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO42_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO42_EDGE_LOW   at 0 range 10 .. 10;
      GPIO42_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO43_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO43_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO43_EDGE_LOW   at 0 range 14 .. 14;
      GPIO43_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO44_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO44_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO44_EDGE_LOW   at 0 range 18 .. 18;
      GPIO44_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO45_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO45_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO45_EDGE_LOW   at 0 range 22 .. 22;
      GPIO45_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO46_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO46_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO46_EDGE_LOW   at 0 range 26 .. 26;
      GPIO46_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO47_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO47_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO47_EDGE_LOW   at 0 range 30 .. 30;
      GPIO47_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt status after masking & forcing for proc1
   type PROC1_INTS0_Register is record
      --  Read-only.
      GPIO0_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO0_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO0_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO0_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO1_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO1_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO1_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO1_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO2_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO2_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO2_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO2_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO3_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO3_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO3_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO3_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO4_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO4_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO4_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO4_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO5_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO5_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO5_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO5_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO6_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO6_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO6_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO6_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO7_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO7_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO7_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO7_EDGE_HIGH  : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC1_INTS0_Register use record
      GPIO0_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO0_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO0_EDGE_LOW   at 0 range 2 .. 2;
      GPIO0_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO1_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO1_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO1_EDGE_LOW   at 0 range 6 .. 6;
      GPIO1_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO2_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO2_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO2_EDGE_LOW   at 0 range 10 .. 10;
      GPIO2_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO3_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO3_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO3_EDGE_LOW   at 0 range 14 .. 14;
      GPIO3_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO4_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO4_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO4_EDGE_LOW   at 0 range 18 .. 18;
      GPIO4_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO5_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO5_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO5_EDGE_LOW   at 0 range 22 .. 22;
      GPIO5_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO6_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO6_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO6_EDGE_LOW   at 0 range 26 .. 26;
      GPIO6_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO7_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO7_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO7_EDGE_LOW   at 0 range 30 .. 30;
      GPIO7_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt status after masking & forcing for proc1
   type PROC1_INTS1_Register is record
      --  Read-only.
      GPIO8_LEVEL_LOW   : Boolean;
      --  Read-only.
      GPIO8_LEVEL_HIGH  : Boolean;
      --  Read-only.
      GPIO8_EDGE_LOW    : Boolean;
      --  Read-only.
      GPIO8_EDGE_HIGH   : Boolean;
      --  Read-only.
      GPIO9_LEVEL_LOW   : Boolean;
      --  Read-only.
      GPIO9_LEVEL_HIGH  : Boolean;
      --  Read-only.
      GPIO9_EDGE_LOW    : Boolean;
      --  Read-only.
      GPIO9_EDGE_HIGH   : Boolean;
      --  Read-only.
      GPIO10_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO10_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO10_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO10_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO11_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO11_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO11_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO11_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO12_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO12_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO12_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO12_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO13_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO13_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO13_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO13_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO14_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO14_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO14_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO14_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO15_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO15_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO15_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO15_EDGE_HIGH  : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC1_INTS1_Register use record
      GPIO8_LEVEL_LOW   at 0 range 0 .. 0;
      GPIO8_LEVEL_HIGH  at 0 range 1 .. 1;
      GPIO8_EDGE_LOW    at 0 range 2 .. 2;
      GPIO8_EDGE_HIGH   at 0 range 3 .. 3;
      GPIO9_LEVEL_LOW   at 0 range 4 .. 4;
      GPIO9_LEVEL_HIGH  at 0 range 5 .. 5;
      GPIO9_EDGE_LOW    at 0 range 6 .. 6;
      GPIO9_EDGE_HIGH   at 0 range 7 .. 7;
      GPIO10_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO10_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO10_EDGE_LOW   at 0 range 10 .. 10;
      GPIO10_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO11_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO11_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO11_EDGE_LOW   at 0 range 14 .. 14;
      GPIO11_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO12_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO12_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO12_EDGE_LOW   at 0 range 18 .. 18;
      GPIO12_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO13_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO13_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO13_EDGE_LOW   at 0 range 22 .. 22;
      GPIO13_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO14_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO14_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO14_EDGE_LOW   at 0 range 26 .. 26;
      GPIO14_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO15_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO15_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO15_EDGE_LOW   at 0 range 30 .. 30;
      GPIO15_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt status after masking & forcing for proc1
   type PROC1_INTS2_Register is record
      --  Read-only.
      GPIO16_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO16_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO16_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO16_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO17_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO17_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO17_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO17_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO18_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO18_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO18_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO18_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO19_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO19_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO19_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO19_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO20_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO20_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO20_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO20_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO21_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO21_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO21_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO21_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO22_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO22_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO22_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO22_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO23_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO23_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO23_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO23_EDGE_HIGH  : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC1_INTS2_Register use record
      GPIO16_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO16_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO16_EDGE_LOW   at 0 range 2 .. 2;
      GPIO16_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO17_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO17_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO17_EDGE_LOW   at 0 range 6 .. 6;
      GPIO17_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO18_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO18_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO18_EDGE_LOW   at 0 range 10 .. 10;
      GPIO18_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO19_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO19_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO19_EDGE_LOW   at 0 range 14 .. 14;
      GPIO19_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO20_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO20_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO20_EDGE_LOW   at 0 range 18 .. 18;
      GPIO20_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO21_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO21_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO21_EDGE_LOW   at 0 range 22 .. 22;
      GPIO21_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO22_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO22_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO22_EDGE_LOW   at 0 range 26 .. 26;
      GPIO22_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO23_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO23_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO23_EDGE_LOW   at 0 range 30 .. 30;
      GPIO23_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt status after masking & forcing for proc1
   type PROC1_INTS3_Register is record
      --  Read-only.
      GPIO24_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO24_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO24_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO24_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO25_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO25_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO25_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO25_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO26_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO26_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO26_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO26_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO27_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO27_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO27_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO27_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO28_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO28_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO28_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO28_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO29_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO29_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO29_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO29_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO30_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO30_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO30_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO30_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO31_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO31_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO31_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO31_EDGE_HIGH  : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC1_INTS3_Register use record
      GPIO24_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO24_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO24_EDGE_LOW   at 0 range 2 .. 2;
      GPIO24_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO25_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO25_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO25_EDGE_LOW   at 0 range 6 .. 6;
      GPIO25_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO26_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO26_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO26_EDGE_LOW   at 0 range 10 .. 10;
      GPIO26_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO27_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO27_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO27_EDGE_LOW   at 0 range 14 .. 14;
      GPIO27_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO28_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO28_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO28_EDGE_LOW   at 0 range 18 .. 18;
      GPIO28_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO29_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO29_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO29_EDGE_LOW   at 0 range 22 .. 22;
      GPIO29_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO30_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO30_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO30_EDGE_LOW   at 0 range 26 .. 26;
      GPIO30_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO31_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO31_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO31_EDGE_LOW   at 0 range 30 .. 30;
      GPIO31_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt status after masking & forcing for proc1
   type PROC1_INTS4_Register is record
      --  Read-only.
      GPIO32_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO32_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO32_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO32_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO33_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO33_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO33_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO33_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO34_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO34_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO34_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO34_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO35_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO35_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO35_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO35_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO36_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO36_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO36_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO36_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO37_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO37_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO37_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO37_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO38_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO38_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO38_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO38_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO39_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO39_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO39_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO39_EDGE_HIGH  : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC1_INTS4_Register use record
      GPIO32_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO32_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO32_EDGE_LOW   at 0 range 2 .. 2;
      GPIO32_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO33_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO33_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO33_EDGE_LOW   at 0 range 6 .. 6;
      GPIO33_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO34_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO34_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO34_EDGE_LOW   at 0 range 10 .. 10;
      GPIO34_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO35_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO35_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO35_EDGE_LOW   at 0 range 14 .. 14;
      GPIO35_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO36_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO36_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO36_EDGE_LOW   at 0 range 18 .. 18;
      GPIO36_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO37_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO37_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO37_EDGE_LOW   at 0 range 22 .. 22;
      GPIO37_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO38_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO38_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO38_EDGE_LOW   at 0 range 26 .. 26;
      GPIO38_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO39_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO39_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO39_EDGE_LOW   at 0 range 30 .. 30;
      GPIO39_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt status after masking & forcing for proc1
   type PROC1_INTS5_Register is record
      --  Read-only.
      GPIO40_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO40_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO40_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO40_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO41_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO41_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO41_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO41_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO42_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO42_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO42_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO42_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO43_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO43_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO43_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO43_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO44_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO44_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO44_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO44_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO45_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO45_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO45_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO45_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO46_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO46_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO46_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO46_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO47_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO47_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO47_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO47_EDGE_HIGH  : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC1_INTS5_Register use record
      GPIO40_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO40_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO40_EDGE_LOW   at 0 range 2 .. 2;
      GPIO40_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO41_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO41_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO41_EDGE_LOW   at 0 range 6 .. 6;
      GPIO41_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO42_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO42_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO42_EDGE_LOW   at 0 range 10 .. 10;
      GPIO42_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO43_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO43_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO43_EDGE_LOW   at 0 range 14 .. 14;
      GPIO43_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO44_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO44_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO44_EDGE_LOW   at 0 range 18 .. 18;
      GPIO44_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO45_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO45_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO45_EDGE_LOW   at 0 range 22 .. 22;
      GPIO45_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO46_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO46_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO46_EDGE_LOW   at 0 range 26 .. 26;
      GPIO46_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO47_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO47_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO47_EDGE_LOW   at 0 range 30 .. 30;
      GPIO47_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Enable for dormant_wake
   type DORMANT_WAKE_INTE0_Register is record
      GPIO0_LEVEL_LOW  : Boolean := False;
      GPIO0_LEVEL_HIGH : Boolean := False;
      GPIO0_EDGE_LOW   : Boolean := False;
      GPIO0_EDGE_HIGH  : Boolean := False;
      GPIO1_LEVEL_LOW  : Boolean := False;
      GPIO1_LEVEL_HIGH : Boolean := False;
      GPIO1_EDGE_LOW   : Boolean := False;
      GPIO1_EDGE_HIGH  : Boolean := False;
      GPIO2_LEVEL_LOW  : Boolean := False;
      GPIO2_LEVEL_HIGH : Boolean := False;
      GPIO2_EDGE_LOW   : Boolean := False;
      GPIO2_EDGE_HIGH  : Boolean := False;
      GPIO3_LEVEL_LOW  : Boolean := False;
      GPIO3_LEVEL_HIGH : Boolean := False;
      GPIO3_EDGE_LOW   : Boolean := False;
      GPIO3_EDGE_HIGH  : Boolean := False;
      GPIO4_LEVEL_LOW  : Boolean := False;
      GPIO4_LEVEL_HIGH : Boolean := False;
      GPIO4_EDGE_LOW   : Boolean := False;
      GPIO4_EDGE_HIGH  : Boolean := False;
      GPIO5_LEVEL_LOW  : Boolean := False;
      GPIO5_LEVEL_HIGH : Boolean := False;
      GPIO5_EDGE_LOW   : Boolean := False;
      GPIO5_EDGE_HIGH  : Boolean := False;
      GPIO6_LEVEL_LOW  : Boolean := False;
      GPIO6_LEVEL_HIGH : Boolean := False;
      GPIO6_EDGE_LOW   : Boolean := False;
      GPIO6_EDGE_HIGH  : Boolean := False;
      GPIO7_LEVEL_LOW  : Boolean := False;
      GPIO7_LEVEL_HIGH : Boolean := False;
      GPIO7_EDGE_LOW   : Boolean := False;
      GPIO7_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DORMANT_WAKE_INTE0_Register use record
      GPIO0_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO0_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO0_EDGE_LOW   at 0 range 2 .. 2;
      GPIO0_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO1_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO1_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO1_EDGE_LOW   at 0 range 6 .. 6;
      GPIO1_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO2_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO2_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO2_EDGE_LOW   at 0 range 10 .. 10;
      GPIO2_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO3_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO3_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO3_EDGE_LOW   at 0 range 14 .. 14;
      GPIO3_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO4_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO4_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO4_EDGE_LOW   at 0 range 18 .. 18;
      GPIO4_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO5_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO5_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO5_EDGE_LOW   at 0 range 22 .. 22;
      GPIO5_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO6_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO6_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO6_EDGE_LOW   at 0 range 26 .. 26;
      GPIO6_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO7_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO7_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO7_EDGE_LOW   at 0 range 30 .. 30;
      GPIO7_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Enable for dormant_wake
   type DORMANT_WAKE_INTE1_Register is record
      GPIO8_LEVEL_LOW   : Boolean := False;
      GPIO8_LEVEL_HIGH  : Boolean := False;
      GPIO8_EDGE_LOW    : Boolean := False;
      GPIO8_EDGE_HIGH   : Boolean := False;
      GPIO9_LEVEL_LOW   : Boolean := False;
      GPIO9_LEVEL_HIGH  : Boolean := False;
      GPIO9_EDGE_LOW    : Boolean := False;
      GPIO9_EDGE_HIGH   : Boolean := False;
      GPIO10_LEVEL_LOW  : Boolean := False;
      GPIO10_LEVEL_HIGH : Boolean := False;
      GPIO10_EDGE_LOW   : Boolean := False;
      GPIO10_EDGE_HIGH  : Boolean := False;
      GPIO11_LEVEL_LOW  : Boolean := False;
      GPIO11_LEVEL_HIGH : Boolean := False;
      GPIO11_EDGE_LOW   : Boolean := False;
      GPIO11_EDGE_HIGH  : Boolean := False;
      GPIO12_LEVEL_LOW  : Boolean := False;
      GPIO12_LEVEL_HIGH : Boolean := False;
      GPIO12_EDGE_LOW   : Boolean := False;
      GPIO12_EDGE_HIGH  : Boolean := False;
      GPIO13_LEVEL_LOW  : Boolean := False;
      GPIO13_LEVEL_HIGH : Boolean := False;
      GPIO13_EDGE_LOW   : Boolean := False;
      GPIO13_EDGE_HIGH  : Boolean := False;
      GPIO14_LEVEL_LOW  : Boolean := False;
      GPIO14_LEVEL_HIGH : Boolean := False;
      GPIO14_EDGE_LOW   : Boolean := False;
      GPIO14_EDGE_HIGH  : Boolean := False;
      GPIO15_LEVEL_LOW  : Boolean := False;
      GPIO15_LEVEL_HIGH : Boolean := False;
      GPIO15_EDGE_LOW   : Boolean := False;
      GPIO15_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DORMANT_WAKE_INTE1_Register use record
      GPIO8_LEVEL_LOW   at 0 range 0 .. 0;
      GPIO8_LEVEL_HIGH  at 0 range 1 .. 1;
      GPIO8_EDGE_LOW    at 0 range 2 .. 2;
      GPIO8_EDGE_HIGH   at 0 range 3 .. 3;
      GPIO9_LEVEL_LOW   at 0 range 4 .. 4;
      GPIO9_LEVEL_HIGH  at 0 range 5 .. 5;
      GPIO9_EDGE_LOW    at 0 range 6 .. 6;
      GPIO9_EDGE_HIGH   at 0 range 7 .. 7;
      GPIO10_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO10_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO10_EDGE_LOW   at 0 range 10 .. 10;
      GPIO10_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO11_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO11_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO11_EDGE_LOW   at 0 range 14 .. 14;
      GPIO11_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO12_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO12_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO12_EDGE_LOW   at 0 range 18 .. 18;
      GPIO12_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO13_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO13_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO13_EDGE_LOW   at 0 range 22 .. 22;
      GPIO13_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO14_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO14_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO14_EDGE_LOW   at 0 range 26 .. 26;
      GPIO14_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO15_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO15_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO15_EDGE_LOW   at 0 range 30 .. 30;
      GPIO15_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Enable for dormant_wake
   type DORMANT_WAKE_INTE2_Register is record
      GPIO16_LEVEL_LOW  : Boolean := False;
      GPIO16_LEVEL_HIGH : Boolean := False;
      GPIO16_EDGE_LOW   : Boolean := False;
      GPIO16_EDGE_HIGH  : Boolean := False;
      GPIO17_LEVEL_LOW  : Boolean := False;
      GPIO17_LEVEL_HIGH : Boolean := False;
      GPIO17_EDGE_LOW   : Boolean := False;
      GPIO17_EDGE_HIGH  : Boolean := False;
      GPIO18_LEVEL_LOW  : Boolean := False;
      GPIO18_LEVEL_HIGH : Boolean := False;
      GPIO18_EDGE_LOW   : Boolean := False;
      GPIO18_EDGE_HIGH  : Boolean := False;
      GPIO19_LEVEL_LOW  : Boolean := False;
      GPIO19_LEVEL_HIGH : Boolean := False;
      GPIO19_EDGE_LOW   : Boolean := False;
      GPIO19_EDGE_HIGH  : Boolean := False;
      GPIO20_LEVEL_LOW  : Boolean := False;
      GPIO20_LEVEL_HIGH : Boolean := False;
      GPIO20_EDGE_LOW   : Boolean := False;
      GPIO20_EDGE_HIGH  : Boolean := False;
      GPIO21_LEVEL_LOW  : Boolean := False;
      GPIO21_LEVEL_HIGH : Boolean := False;
      GPIO21_EDGE_LOW   : Boolean := False;
      GPIO21_EDGE_HIGH  : Boolean := False;
      GPIO22_LEVEL_LOW  : Boolean := False;
      GPIO22_LEVEL_HIGH : Boolean := False;
      GPIO22_EDGE_LOW   : Boolean := False;
      GPIO22_EDGE_HIGH  : Boolean := False;
      GPIO23_LEVEL_LOW  : Boolean := False;
      GPIO23_LEVEL_HIGH : Boolean := False;
      GPIO23_EDGE_LOW   : Boolean := False;
      GPIO23_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DORMANT_WAKE_INTE2_Register use record
      GPIO16_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO16_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO16_EDGE_LOW   at 0 range 2 .. 2;
      GPIO16_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO17_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO17_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO17_EDGE_LOW   at 0 range 6 .. 6;
      GPIO17_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO18_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO18_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO18_EDGE_LOW   at 0 range 10 .. 10;
      GPIO18_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO19_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO19_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO19_EDGE_LOW   at 0 range 14 .. 14;
      GPIO19_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO20_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO20_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO20_EDGE_LOW   at 0 range 18 .. 18;
      GPIO20_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO21_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO21_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO21_EDGE_LOW   at 0 range 22 .. 22;
      GPIO21_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO22_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO22_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO22_EDGE_LOW   at 0 range 26 .. 26;
      GPIO22_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO23_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO23_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO23_EDGE_LOW   at 0 range 30 .. 30;
      GPIO23_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Enable for dormant_wake
   type DORMANT_WAKE_INTE3_Register is record
      GPIO24_LEVEL_LOW  : Boolean := False;
      GPIO24_LEVEL_HIGH : Boolean := False;
      GPIO24_EDGE_LOW   : Boolean := False;
      GPIO24_EDGE_HIGH  : Boolean := False;
      GPIO25_LEVEL_LOW  : Boolean := False;
      GPIO25_LEVEL_HIGH : Boolean := False;
      GPIO25_EDGE_LOW   : Boolean := False;
      GPIO25_EDGE_HIGH  : Boolean := False;
      GPIO26_LEVEL_LOW  : Boolean := False;
      GPIO26_LEVEL_HIGH : Boolean := False;
      GPIO26_EDGE_LOW   : Boolean := False;
      GPIO26_EDGE_HIGH  : Boolean := False;
      GPIO27_LEVEL_LOW  : Boolean := False;
      GPIO27_LEVEL_HIGH : Boolean := False;
      GPIO27_EDGE_LOW   : Boolean := False;
      GPIO27_EDGE_HIGH  : Boolean := False;
      GPIO28_LEVEL_LOW  : Boolean := False;
      GPIO28_LEVEL_HIGH : Boolean := False;
      GPIO28_EDGE_LOW   : Boolean := False;
      GPIO28_EDGE_HIGH  : Boolean := False;
      GPIO29_LEVEL_LOW  : Boolean := False;
      GPIO29_LEVEL_HIGH : Boolean := False;
      GPIO29_EDGE_LOW   : Boolean := False;
      GPIO29_EDGE_HIGH  : Boolean := False;
      GPIO30_LEVEL_LOW  : Boolean := False;
      GPIO30_LEVEL_HIGH : Boolean := False;
      GPIO30_EDGE_LOW   : Boolean := False;
      GPIO30_EDGE_HIGH  : Boolean := False;
      GPIO31_LEVEL_LOW  : Boolean := False;
      GPIO31_LEVEL_HIGH : Boolean := False;
      GPIO31_EDGE_LOW   : Boolean := False;
      GPIO31_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DORMANT_WAKE_INTE3_Register use record
      GPIO24_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO24_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO24_EDGE_LOW   at 0 range 2 .. 2;
      GPIO24_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO25_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO25_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO25_EDGE_LOW   at 0 range 6 .. 6;
      GPIO25_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO26_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO26_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO26_EDGE_LOW   at 0 range 10 .. 10;
      GPIO26_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO27_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO27_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO27_EDGE_LOW   at 0 range 14 .. 14;
      GPIO27_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO28_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO28_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO28_EDGE_LOW   at 0 range 18 .. 18;
      GPIO28_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO29_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO29_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO29_EDGE_LOW   at 0 range 22 .. 22;
      GPIO29_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO30_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO30_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO30_EDGE_LOW   at 0 range 26 .. 26;
      GPIO30_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO31_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO31_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO31_EDGE_LOW   at 0 range 30 .. 30;
      GPIO31_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Enable for dormant_wake
   type DORMANT_WAKE_INTE4_Register is record
      GPIO32_LEVEL_LOW  : Boolean := False;
      GPIO32_LEVEL_HIGH : Boolean := False;
      GPIO32_EDGE_LOW   : Boolean := False;
      GPIO32_EDGE_HIGH  : Boolean := False;
      GPIO33_LEVEL_LOW  : Boolean := False;
      GPIO33_LEVEL_HIGH : Boolean := False;
      GPIO33_EDGE_LOW   : Boolean := False;
      GPIO33_EDGE_HIGH  : Boolean := False;
      GPIO34_LEVEL_LOW  : Boolean := False;
      GPIO34_LEVEL_HIGH : Boolean := False;
      GPIO34_EDGE_LOW   : Boolean := False;
      GPIO34_EDGE_HIGH  : Boolean := False;
      GPIO35_LEVEL_LOW  : Boolean := False;
      GPIO35_LEVEL_HIGH : Boolean := False;
      GPIO35_EDGE_LOW   : Boolean := False;
      GPIO35_EDGE_HIGH  : Boolean := False;
      GPIO36_LEVEL_LOW  : Boolean := False;
      GPIO36_LEVEL_HIGH : Boolean := False;
      GPIO36_EDGE_LOW   : Boolean := False;
      GPIO36_EDGE_HIGH  : Boolean := False;
      GPIO37_LEVEL_LOW  : Boolean := False;
      GPIO37_LEVEL_HIGH : Boolean := False;
      GPIO37_EDGE_LOW   : Boolean := False;
      GPIO37_EDGE_HIGH  : Boolean := False;
      GPIO38_LEVEL_LOW  : Boolean := False;
      GPIO38_LEVEL_HIGH : Boolean := False;
      GPIO38_EDGE_LOW   : Boolean := False;
      GPIO38_EDGE_HIGH  : Boolean := False;
      GPIO39_LEVEL_LOW  : Boolean := False;
      GPIO39_LEVEL_HIGH : Boolean := False;
      GPIO39_EDGE_LOW   : Boolean := False;
      GPIO39_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DORMANT_WAKE_INTE4_Register use record
      GPIO32_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO32_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO32_EDGE_LOW   at 0 range 2 .. 2;
      GPIO32_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO33_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO33_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO33_EDGE_LOW   at 0 range 6 .. 6;
      GPIO33_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO34_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO34_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO34_EDGE_LOW   at 0 range 10 .. 10;
      GPIO34_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO35_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO35_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO35_EDGE_LOW   at 0 range 14 .. 14;
      GPIO35_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO36_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO36_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO36_EDGE_LOW   at 0 range 18 .. 18;
      GPIO36_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO37_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO37_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO37_EDGE_LOW   at 0 range 22 .. 22;
      GPIO37_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO38_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO38_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO38_EDGE_LOW   at 0 range 26 .. 26;
      GPIO38_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO39_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO39_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO39_EDGE_LOW   at 0 range 30 .. 30;
      GPIO39_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Enable for dormant_wake
   type DORMANT_WAKE_INTE5_Register is record
      GPIO40_LEVEL_LOW  : Boolean := False;
      GPIO40_LEVEL_HIGH : Boolean := False;
      GPIO40_EDGE_LOW   : Boolean := False;
      GPIO40_EDGE_HIGH  : Boolean := False;
      GPIO41_LEVEL_LOW  : Boolean := False;
      GPIO41_LEVEL_HIGH : Boolean := False;
      GPIO41_EDGE_LOW   : Boolean := False;
      GPIO41_EDGE_HIGH  : Boolean := False;
      GPIO42_LEVEL_LOW  : Boolean := False;
      GPIO42_LEVEL_HIGH : Boolean := False;
      GPIO42_EDGE_LOW   : Boolean := False;
      GPIO42_EDGE_HIGH  : Boolean := False;
      GPIO43_LEVEL_LOW  : Boolean := False;
      GPIO43_LEVEL_HIGH : Boolean := False;
      GPIO43_EDGE_LOW   : Boolean := False;
      GPIO43_EDGE_HIGH  : Boolean := False;
      GPIO44_LEVEL_LOW  : Boolean := False;
      GPIO44_LEVEL_HIGH : Boolean := False;
      GPIO44_EDGE_LOW   : Boolean := False;
      GPIO44_EDGE_HIGH  : Boolean := False;
      GPIO45_LEVEL_LOW  : Boolean := False;
      GPIO45_LEVEL_HIGH : Boolean := False;
      GPIO45_EDGE_LOW   : Boolean := False;
      GPIO45_EDGE_HIGH  : Boolean := False;
      GPIO46_LEVEL_LOW  : Boolean := False;
      GPIO46_LEVEL_HIGH : Boolean := False;
      GPIO46_EDGE_LOW   : Boolean := False;
      GPIO46_EDGE_HIGH  : Boolean := False;
      GPIO47_LEVEL_LOW  : Boolean := False;
      GPIO47_LEVEL_HIGH : Boolean := False;
      GPIO47_EDGE_LOW   : Boolean := False;
      GPIO47_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DORMANT_WAKE_INTE5_Register use record
      GPIO40_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO40_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO40_EDGE_LOW   at 0 range 2 .. 2;
      GPIO40_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO41_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO41_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO41_EDGE_LOW   at 0 range 6 .. 6;
      GPIO41_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO42_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO42_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO42_EDGE_LOW   at 0 range 10 .. 10;
      GPIO42_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO43_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO43_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO43_EDGE_LOW   at 0 range 14 .. 14;
      GPIO43_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO44_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO44_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO44_EDGE_LOW   at 0 range 18 .. 18;
      GPIO44_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO45_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO45_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO45_EDGE_LOW   at 0 range 22 .. 22;
      GPIO45_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO46_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO46_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO46_EDGE_LOW   at 0 range 26 .. 26;
      GPIO46_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO47_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO47_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO47_EDGE_LOW   at 0 range 30 .. 30;
      GPIO47_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Force for dormant_wake
   type DORMANT_WAKE_INTF0_Register is record
      GPIO0_LEVEL_LOW  : Boolean := False;
      GPIO0_LEVEL_HIGH : Boolean := False;
      GPIO0_EDGE_LOW   : Boolean := False;
      GPIO0_EDGE_HIGH  : Boolean := False;
      GPIO1_LEVEL_LOW  : Boolean := False;
      GPIO1_LEVEL_HIGH : Boolean := False;
      GPIO1_EDGE_LOW   : Boolean := False;
      GPIO1_EDGE_HIGH  : Boolean := False;
      GPIO2_LEVEL_LOW  : Boolean := False;
      GPIO2_LEVEL_HIGH : Boolean := False;
      GPIO2_EDGE_LOW   : Boolean := False;
      GPIO2_EDGE_HIGH  : Boolean := False;
      GPIO3_LEVEL_LOW  : Boolean := False;
      GPIO3_LEVEL_HIGH : Boolean := False;
      GPIO3_EDGE_LOW   : Boolean := False;
      GPIO3_EDGE_HIGH  : Boolean := False;
      GPIO4_LEVEL_LOW  : Boolean := False;
      GPIO4_LEVEL_HIGH : Boolean := False;
      GPIO4_EDGE_LOW   : Boolean := False;
      GPIO4_EDGE_HIGH  : Boolean := False;
      GPIO5_LEVEL_LOW  : Boolean := False;
      GPIO5_LEVEL_HIGH : Boolean := False;
      GPIO5_EDGE_LOW   : Boolean := False;
      GPIO5_EDGE_HIGH  : Boolean := False;
      GPIO6_LEVEL_LOW  : Boolean := False;
      GPIO6_LEVEL_HIGH : Boolean := False;
      GPIO6_EDGE_LOW   : Boolean := False;
      GPIO6_EDGE_HIGH  : Boolean := False;
      GPIO7_LEVEL_LOW  : Boolean := False;
      GPIO7_LEVEL_HIGH : Boolean := False;
      GPIO7_EDGE_LOW   : Boolean := False;
      GPIO7_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DORMANT_WAKE_INTF0_Register use record
      GPIO0_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO0_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO0_EDGE_LOW   at 0 range 2 .. 2;
      GPIO0_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO1_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO1_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO1_EDGE_LOW   at 0 range 6 .. 6;
      GPIO1_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO2_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO2_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO2_EDGE_LOW   at 0 range 10 .. 10;
      GPIO2_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO3_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO3_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO3_EDGE_LOW   at 0 range 14 .. 14;
      GPIO3_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO4_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO4_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO4_EDGE_LOW   at 0 range 18 .. 18;
      GPIO4_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO5_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO5_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO5_EDGE_LOW   at 0 range 22 .. 22;
      GPIO5_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO6_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO6_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO6_EDGE_LOW   at 0 range 26 .. 26;
      GPIO6_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO7_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO7_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO7_EDGE_LOW   at 0 range 30 .. 30;
      GPIO7_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Force for dormant_wake
   type DORMANT_WAKE_INTF1_Register is record
      GPIO8_LEVEL_LOW   : Boolean := False;
      GPIO8_LEVEL_HIGH  : Boolean := False;
      GPIO8_EDGE_LOW    : Boolean := False;
      GPIO8_EDGE_HIGH   : Boolean := False;
      GPIO9_LEVEL_LOW   : Boolean := False;
      GPIO9_LEVEL_HIGH  : Boolean := False;
      GPIO9_EDGE_LOW    : Boolean := False;
      GPIO9_EDGE_HIGH   : Boolean := False;
      GPIO10_LEVEL_LOW  : Boolean := False;
      GPIO10_LEVEL_HIGH : Boolean := False;
      GPIO10_EDGE_LOW   : Boolean := False;
      GPIO10_EDGE_HIGH  : Boolean := False;
      GPIO11_LEVEL_LOW  : Boolean := False;
      GPIO11_LEVEL_HIGH : Boolean := False;
      GPIO11_EDGE_LOW   : Boolean := False;
      GPIO11_EDGE_HIGH  : Boolean := False;
      GPIO12_LEVEL_LOW  : Boolean := False;
      GPIO12_LEVEL_HIGH : Boolean := False;
      GPIO12_EDGE_LOW   : Boolean := False;
      GPIO12_EDGE_HIGH  : Boolean := False;
      GPIO13_LEVEL_LOW  : Boolean := False;
      GPIO13_LEVEL_HIGH : Boolean := False;
      GPIO13_EDGE_LOW   : Boolean := False;
      GPIO13_EDGE_HIGH  : Boolean := False;
      GPIO14_LEVEL_LOW  : Boolean := False;
      GPIO14_LEVEL_HIGH : Boolean := False;
      GPIO14_EDGE_LOW   : Boolean := False;
      GPIO14_EDGE_HIGH  : Boolean := False;
      GPIO15_LEVEL_LOW  : Boolean := False;
      GPIO15_LEVEL_HIGH : Boolean := False;
      GPIO15_EDGE_LOW   : Boolean := False;
      GPIO15_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DORMANT_WAKE_INTF1_Register use record
      GPIO8_LEVEL_LOW   at 0 range 0 .. 0;
      GPIO8_LEVEL_HIGH  at 0 range 1 .. 1;
      GPIO8_EDGE_LOW    at 0 range 2 .. 2;
      GPIO8_EDGE_HIGH   at 0 range 3 .. 3;
      GPIO9_LEVEL_LOW   at 0 range 4 .. 4;
      GPIO9_LEVEL_HIGH  at 0 range 5 .. 5;
      GPIO9_EDGE_LOW    at 0 range 6 .. 6;
      GPIO9_EDGE_HIGH   at 0 range 7 .. 7;
      GPIO10_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO10_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO10_EDGE_LOW   at 0 range 10 .. 10;
      GPIO10_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO11_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO11_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO11_EDGE_LOW   at 0 range 14 .. 14;
      GPIO11_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO12_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO12_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO12_EDGE_LOW   at 0 range 18 .. 18;
      GPIO12_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO13_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO13_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO13_EDGE_LOW   at 0 range 22 .. 22;
      GPIO13_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO14_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO14_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO14_EDGE_LOW   at 0 range 26 .. 26;
      GPIO14_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO15_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO15_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO15_EDGE_LOW   at 0 range 30 .. 30;
      GPIO15_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Force for dormant_wake
   type DORMANT_WAKE_INTF2_Register is record
      GPIO16_LEVEL_LOW  : Boolean := False;
      GPIO16_LEVEL_HIGH : Boolean := False;
      GPIO16_EDGE_LOW   : Boolean := False;
      GPIO16_EDGE_HIGH  : Boolean := False;
      GPIO17_LEVEL_LOW  : Boolean := False;
      GPIO17_LEVEL_HIGH : Boolean := False;
      GPIO17_EDGE_LOW   : Boolean := False;
      GPIO17_EDGE_HIGH  : Boolean := False;
      GPIO18_LEVEL_LOW  : Boolean := False;
      GPIO18_LEVEL_HIGH : Boolean := False;
      GPIO18_EDGE_LOW   : Boolean := False;
      GPIO18_EDGE_HIGH  : Boolean := False;
      GPIO19_LEVEL_LOW  : Boolean := False;
      GPIO19_LEVEL_HIGH : Boolean := False;
      GPIO19_EDGE_LOW   : Boolean := False;
      GPIO19_EDGE_HIGH  : Boolean := False;
      GPIO20_LEVEL_LOW  : Boolean := False;
      GPIO20_LEVEL_HIGH : Boolean := False;
      GPIO20_EDGE_LOW   : Boolean := False;
      GPIO20_EDGE_HIGH  : Boolean := False;
      GPIO21_LEVEL_LOW  : Boolean := False;
      GPIO21_LEVEL_HIGH : Boolean := False;
      GPIO21_EDGE_LOW   : Boolean := False;
      GPIO21_EDGE_HIGH  : Boolean := False;
      GPIO22_LEVEL_LOW  : Boolean := False;
      GPIO22_LEVEL_HIGH : Boolean := False;
      GPIO22_EDGE_LOW   : Boolean := False;
      GPIO22_EDGE_HIGH  : Boolean := False;
      GPIO23_LEVEL_LOW  : Boolean := False;
      GPIO23_LEVEL_HIGH : Boolean := False;
      GPIO23_EDGE_LOW   : Boolean := False;
      GPIO23_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DORMANT_WAKE_INTF2_Register use record
      GPIO16_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO16_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO16_EDGE_LOW   at 0 range 2 .. 2;
      GPIO16_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO17_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO17_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO17_EDGE_LOW   at 0 range 6 .. 6;
      GPIO17_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO18_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO18_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO18_EDGE_LOW   at 0 range 10 .. 10;
      GPIO18_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO19_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO19_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO19_EDGE_LOW   at 0 range 14 .. 14;
      GPIO19_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO20_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO20_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO20_EDGE_LOW   at 0 range 18 .. 18;
      GPIO20_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO21_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO21_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO21_EDGE_LOW   at 0 range 22 .. 22;
      GPIO21_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO22_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO22_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO22_EDGE_LOW   at 0 range 26 .. 26;
      GPIO22_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO23_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO23_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO23_EDGE_LOW   at 0 range 30 .. 30;
      GPIO23_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Force for dormant_wake
   type DORMANT_WAKE_INTF3_Register is record
      GPIO24_LEVEL_LOW  : Boolean := False;
      GPIO24_LEVEL_HIGH : Boolean := False;
      GPIO24_EDGE_LOW   : Boolean := False;
      GPIO24_EDGE_HIGH  : Boolean := False;
      GPIO25_LEVEL_LOW  : Boolean := False;
      GPIO25_LEVEL_HIGH : Boolean := False;
      GPIO25_EDGE_LOW   : Boolean := False;
      GPIO25_EDGE_HIGH  : Boolean := False;
      GPIO26_LEVEL_LOW  : Boolean := False;
      GPIO26_LEVEL_HIGH : Boolean := False;
      GPIO26_EDGE_LOW   : Boolean := False;
      GPIO26_EDGE_HIGH  : Boolean := False;
      GPIO27_LEVEL_LOW  : Boolean := False;
      GPIO27_LEVEL_HIGH : Boolean := False;
      GPIO27_EDGE_LOW   : Boolean := False;
      GPIO27_EDGE_HIGH  : Boolean := False;
      GPIO28_LEVEL_LOW  : Boolean := False;
      GPIO28_LEVEL_HIGH : Boolean := False;
      GPIO28_EDGE_LOW   : Boolean := False;
      GPIO28_EDGE_HIGH  : Boolean := False;
      GPIO29_LEVEL_LOW  : Boolean := False;
      GPIO29_LEVEL_HIGH : Boolean := False;
      GPIO29_EDGE_LOW   : Boolean := False;
      GPIO29_EDGE_HIGH  : Boolean := False;
      GPIO30_LEVEL_LOW  : Boolean := False;
      GPIO30_LEVEL_HIGH : Boolean := False;
      GPIO30_EDGE_LOW   : Boolean := False;
      GPIO30_EDGE_HIGH  : Boolean := False;
      GPIO31_LEVEL_LOW  : Boolean := False;
      GPIO31_LEVEL_HIGH : Boolean := False;
      GPIO31_EDGE_LOW   : Boolean := False;
      GPIO31_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DORMANT_WAKE_INTF3_Register use record
      GPIO24_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO24_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO24_EDGE_LOW   at 0 range 2 .. 2;
      GPIO24_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO25_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO25_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO25_EDGE_LOW   at 0 range 6 .. 6;
      GPIO25_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO26_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO26_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO26_EDGE_LOW   at 0 range 10 .. 10;
      GPIO26_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO27_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO27_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO27_EDGE_LOW   at 0 range 14 .. 14;
      GPIO27_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO28_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO28_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO28_EDGE_LOW   at 0 range 18 .. 18;
      GPIO28_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO29_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO29_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO29_EDGE_LOW   at 0 range 22 .. 22;
      GPIO29_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO30_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO30_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO30_EDGE_LOW   at 0 range 26 .. 26;
      GPIO30_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO31_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO31_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO31_EDGE_LOW   at 0 range 30 .. 30;
      GPIO31_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Force for dormant_wake
   type DORMANT_WAKE_INTF4_Register is record
      GPIO32_LEVEL_LOW  : Boolean := False;
      GPIO32_LEVEL_HIGH : Boolean := False;
      GPIO32_EDGE_LOW   : Boolean := False;
      GPIO32_EDGE_HIGH  : Boolean := False;
      GPIO33_LEVEL_LOW  : Boolean := False;
      GPIO33_LEVEL_HIGH : Boolean := False;
      GPIO33_EDGE_LOW   : Boolean := False;
      GPIO33_EDGE_HIGH  : Boolean := False;
      GPIO34_LEVEL_LOW  : Boolean := False;
      GPIO34_LEVEL_HIGH : Boolean := False;
      GPIO34_EDGE_LOW   : Boolean := False;
      GPIO34_EDGE_HIGH  : Boolean := False;
      GPIO35_LEVEL_LOW  : Boolean := False;
      GPIO35_LEVEL_HIGH : Boolean := False;
      GPIO35_EDGE_LOW   : Boolean := False;
      GPIO35_EDGE_HIGH  : Boolean := False;
      GPIO36_LEVEL_LOW  : Boolean := False;
      GPIO36_LEVEL_HIGH : Boolean := False;
      GPIO36_EDGE_LOW   : Boolean := False;
      GPIO36_EDGE_HIGH  : Boolean := False;
      GPIO37_LEVEL_LOW  : Boolean := False;
      GPIO37_LEVEL_HIGH : Boolean := False;
      GPIO37_EDGE_LOW   : Boolean := False;
      GPIO37_EDGE_HIGH  : Boolean := False;
      GPIO38_LEVEL_LOW  : Boolean := False;
      GPIO38_LEVEL_HIGH : Boolean := False;
      GPIO38_EDGE_LOW   : Boolean := False;
      GPIO38_EDGE_HIGH  : Boolean := False;
      GPIO39_LEVEL_LOW  : Boolean := False;
      GPIO39_LEVEL_HIGH : Boolean := False;
      GPIO39_EDGE_LOW   : Boolean := False;
      GPIO39_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DORMANT_WAKE_INTF4_Register use record
      GPIO32_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO32_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO32_EDGE_LOW   at 0 range 2 .. 2;
      GPIO32_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO33_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO33_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO33_EDGE_LOW   at 0 range 6 .. 6;
      GPIO33_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO34_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO34_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO34_EDGE_LOW   at 0 range 10 .. 10;
      GPIO34_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO35_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO35_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO35_EDGE_LOW   at 0 range 14 .. 14;
      GPIO35_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO36_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO36_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO36_EDGE_LOW   at 0 range 18 .. 18;
      GPIO36_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO37_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO37_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO37_EDGE_LOW   at 0 range 22 .. 22;
      GPIO37_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO38_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO38_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO38_EDGE_LOW   at 0 range 26 .. 26;
      GPIO38_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO39_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO39_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO39_EDGE_LOW   at 0 range 30 .. 30;
      GPIO39_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt Force for dormant_wake
   type DORMANT_WAKE_INTF5_Register is record
      GPIO40_LEVEL_LOW  : Boolean := False;
      GPIO40_LEVEL_HIGH : Boolean := False;
      GPIO40_EDGE_LOW   : Boolean := False;
      GPIO40_EDGE_HIGH  : Boolean := False;
      GPIO41_LEVEL_LOW  : Boolean := False;
      GPIO41_LEVEL_HIGH : Boolean := False;
      GPIO41_EDGE_LOW   : Boolean := False;
      GPIO41_EDGE_HIGH  : Boolean := False;
      GPIO42_LEVEL_LOW  : Boolean := False;
      GPIO42_LEVEL_HIGH : Boolean := False;
      GPIO42_EDGE_LOW   : Boolean := False;
      GPIO42_EDGE_HIGH  : Boolean := False;
      GPIO43_LEVEL_LOW  : Boolean := False;
      GPIO43_LEVEL_HIGH : Boolean := False;
      GPIO43_EDGE_LOW   : Boolean := False;
      GPIO43_EDGE_HIGH  : Boolean := False;
      GPIO44_LEVEL_LOW  : Boolean := False;
      GPIO44_LEVEL_HIGH : Boolean := False;
      GPIO44_EDGE_LOW   : Boolean := False;
      GPIO44_EDGE_HIGH  : Boolean := False;
      GPIO45_LEVEL_LOW  : Boolean := False;
      GPIO45_LEVEL_HIGH : Boolean := False;
      GPIO45_EDGE_LOW   : Boolean := False;
      GPIO45_EDGE_HIGH  : Boolean := False;
      GPIO46_LEVEL_LOW  : Boolean := False;
      GPIO46_LEVEL_HIGH : Boolean := False;
      GPIO46_EDGE_LOW   : Boolean := False;
      GPIO46_EDGE_HIGH  : Boolean := False;
      GPIO47_LEVEL_LOW  : Boolean := False;
      GPIO47_LEVEL_HIGH : Boolean := False;
      GPIO47_EDGE_LOW   : Boolean := False;
      GPIO47_EDGE_HIGH  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DORMANT_WAKE_INTF5_Register use record
      GPIO40_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO40_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO40_EDGE_LOW   at 0 range 2 .. 2;
      GPIO40_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO41_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO41_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO41_EDGE_LOW   at 0 range 6 .. 6;
      GPIO41_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO42_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO42_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO42_EDGE_LOW   at 0 range 10 .. 10;
      GPIO42_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO43_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO43_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO43_EDGE_LOW   at 0 range 14 .. 14;
      GPIO43_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO44_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO44_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO44_EDGE_LOW   at 0 range 18 .. 18;
      GPIO44_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO45_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO45_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO45_EDGE_LOW   at 0 range 22 .. 22;
      GPIO45_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO46_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO46_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO46_EDGE_LOW   at 0 range 26 .. 26;
      GPIO46_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO47_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO47_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO47_EDGE_LOW   at 0 range 30 .. 30;
      GPIO47_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt status after masking & forcing for dormant_wake
   type DORMANT_WAKE_INTS0_Register is record
      --  Read-only.
      GPIO0_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO0_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO0_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO0_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO1_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO1_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO1_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO1_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO2_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO2_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO2_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO2_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO3_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO3_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO3_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO3_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO4_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO4_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO4_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO4_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO5_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO5_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO5_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO5_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO6_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO6_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO6_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO6_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO7_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO7_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO7_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO7_EDGE_HIGH  : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DORMANT_WAKE_INTS0_Register use record
      GPIO0_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO0_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO0_EDGE_LOW   at 0 range 2 .. 2;
      GPIO0_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO1_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO1_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO1_EDGE_LOW   at 0 range 6 .. 6;
      GPIO1_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO2_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO2_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO2_EDGE_LOW   at 0 range 10 .. 10;
      GPIO2_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO3_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO3_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO3_EDGE_LOW   at 0 range 14 .. 14;
      GPIO3_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO4_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO4_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO4_EDGE_LOW   at 0 range 18 .. 18;
      GPIO4_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO5_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO5_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO5_EDGE_LOW   at 0 range 22 .. 22;
      GPIO5_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO6_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO6_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO6_EDGE_LOW   at 0 range 26 .. 26;
      GPIO6_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO7_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO7_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO7_EDGE_LOW   at 0 range 30 .. 30;
      GPIO7_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt status after masking & forcing for dormant_wake
   type DORMANT_WAKE_INTS1_Register is record
      --  Read-only.
      GPIO8_LEVEL_LOW   : Boolean;
      --  Read-only.
      GPIO8_LEVEL_HIGH  : Boolean;
      --  Read-only.
      GPIO8_EDGE_LOW    : Boolean;
      --  Read-only.
      GPIO8_EDGE_HIGH   : Boolean;
      --  Read-only.
      GPIO9_LEVEL_LOW   : Boolean;
      --  Read-only.
      GPIO9_LEVEL_HIGH  : Boolean;
      --  Read-only.
      GPIO9_EDGE_LOW    : Boolean;
      --  Read-only.
      GPIO9_EDGE_HIGH   : Boolean;
      --  Read-only.
      GPIO10_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO10_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO10_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO10_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO11_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO11_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO11_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO11_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO12_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO12_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO12_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO12_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO13_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO13_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO13_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO13_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO14_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO14_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO14_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO14_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO15_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO15_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO15_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO15_EDGE_HIGH  : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DORMANT_WAKE_INTS1_Register use record
      GPIO8_LEVEL_LOW   at 0 range 0 .. 0;
      GPIO8_LEVEL_HIGH  at 0 range 1 .. 1;
      GPIO8_EDGE_LOW    at 0 range 2 .. 2;
      GPIO8_EDGE_HIGH   at 0 range 3 .. 3;
      GPIO9_LEVEL_LOW   at 0 range 4 .. 4;
      GPIO9_LEVEL_HIGH  at 0 range 5 .. 5;
      GPIO9_EDGE_LOW    at 0 range 6 .. 6;
      GPIO9_EDGE_HIGH   at 0 range 7 .. 7;
      GPIO10_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO10_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO10_EDGE_LOW   at 0 range 10 .. 10;
      GPIO10_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO11_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO11_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO11_EDGE_LOW   at 0 range 14 .. 14;
      GPIO11_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO12_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO12_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO12_EDGE_LOW   at 0 range 18 .. 18;
      GPIO12_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO13_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO13_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO13_EDGE_LOW   at 0 range 22 .. 22;
      GPIO13_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO14_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO14_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO14_EDGE_LOW   at 0 range 26 .. 26;
      GPIO14_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO15_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO15_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO15_EDGE_LOW   at 0 range 30 .. 30;
      GPIO15_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt status after masking & forcing for dormant_wake
   type DORMANT_WAKE_INTS2_Register is record
      --  Read-only.
      GPIO16_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO16_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO16_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO16_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO17_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO17_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO17_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO17_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO18_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO18_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO18_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO18_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO19_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO19_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO19_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO19_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO20_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO20_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO20_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO20_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO21_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO21_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO21_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO21_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO22_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO22_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO22_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO22_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO23_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO23_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO23_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO23_EDGE_HIGH  : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DORMANT_WAKE_INTS2_Register use record
      GPIO16_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO16_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO16_EDGE_LOW   at 0 range 2 .. 2;
      GPIO16_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO17_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO17_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO17_EDGE_LOW   at 0 range 6 .. 6;
      GPIO17_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO18_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO18_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO18_EDGE_LOW   at 0 range 10 .. 10;
      GPIO18_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO19_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO19_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO19_EDGE_LOW   at 0 range 14 .. 14;
      GPIO19_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO20_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO20_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO20_EDGE_LOW   at 0 range 18 .. 18;
      GPIO20_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO21_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO21_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO21_EDGE_LOW   at 0 range 22 .. 22;
      GPIO21_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO22_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO22_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO22_EDGE_LOW   at 0 range 26 .. 26;
      GPIO22_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO23_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO23_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO23_EDGE_LOW   at 0 range 30 .. 30;
      GPIO23_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt status after masking & forcing for dormant_wake
   type DORMANT_WAKE_INTS3_Register is record
      --  Read-only.
      GPIO24_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO24_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO24_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO24_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO25_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO25_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO25_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO25_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO26_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO26_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO26_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO26_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO27_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO27_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO27_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO27_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO28_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO28_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO28_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO28_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO29_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO29_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO29_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO29_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO30_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO30_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO30_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO30_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO31_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO31_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO31_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO31_EDGE_HIGH  : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DORMANT_WAKE_INTS3_Register use record
      GPIO24_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO24_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO24_EDGE_LOW   at 0 range 2 .. 2;
      GPIO24_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO25_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO25_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO25_EDGE_LOW   at 0 range 6 .. 6;
      GPIO25_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO26_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO26_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO26_EDGE_LOW   at 0 range 10 .. 10;
      GPIO26_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO27_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO27_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO27_EDGE_LOW   at 0 range 14 .. 14;
      GPIO27_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO28_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO28_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO28_EDGE_LOW   at 0 range 18 .. 18;
      GPIO28_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO29_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO29_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO29_EDGE_LOW   at 0 range 22 .. 22;
      GPIO29_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO30_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO30_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO30_EDGE_LOW   at 0 range 26 .. 26;
      GPIO30_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO31_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO31_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO31_EDGE_LOW   at 0 range 30 .. 30;
      GPIO31_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt status after masking & forcing for dormant_wake
   type DORMANT_WAKE_INTS4_Register is record
      --  Read-only.
      GPIO32_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO32_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO32_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO32_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO33_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO33_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO33_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO33_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO34_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO34_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO34_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO34_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO35_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO35_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO35_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO35_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO36_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO36_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO36_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO36_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO37_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO37_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO37_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO37_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO38_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO38_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO38_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO38_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO39_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO39_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO39_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO39_EDGE_HIGH  : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DORMANT_WAKE_INTS4_Register use record
      GPIO32_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO32_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO32_EDGE_LOW   at 0 range 2 .. 2;
      GPIO32_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO33_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO33_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO33_EDGE_LOW   at 0 range 6 .. 6;
      GPIO33_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO34_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO34_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO34_EDGE_LOW   at 0 range 10 .. 10;
      GPIO34_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO35_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO35_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO35_EDGE_LOW   at 0 range 14 .. 14;
      GPIO35_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO36_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO36_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO36_EDGE_LOW   at 0 range 18 .. 18;
      GPIO36_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO37_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO37_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO37_EDGE_LOW   at 0 range 22 .. 22;
      GPIO37_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO38_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO38_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO38_EDGE_LOW   at 0 range 26 .. 26;
      GPIO38_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO39_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO39_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO39_EDGE_LOW   at 0 range 30 .. 30;
      GPIO39_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   --  Interrupt status after masking & forcing for dormant_wake
   type DORMANT_WAKE_INTS5_Register is record
      --  Read-only.
      GPIO40_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO40_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO40_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO40_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO41_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO41_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO41_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO41_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO42_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO42_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO42_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO42_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO43_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO43_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO43_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO43_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO44_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO44_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO44_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO44_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO45_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO45_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO45_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO45_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO46_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO46_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO46_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO46_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO47_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO47_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO47_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO47_EDGE_HIGH  : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DORMANT_WAKE_INTS5_Register use record
      GPIO40_LEVEL_LOW  at 0 range 0 .. 0;
      GPIO40_LEVEL_HIGH at 0 range 1 .. 1;
      GPIO40_EDGE_LOW   at 0 range 2 .. 2;
      GPIO40_EDGE_HIGH  at 0 range 3 .. 3;
      GPIO41_LEVEL_LOW  at 0 range 4 .. 4;
      GPIO41_LEVEL_HIGH at 0 range 5 .. 5;
      GPIO41_EDGE_LOW   at 0 range 6 .. 6;
      GPIO41_EDGE_HIGH  at 0 range 7 .. 7;
      GPIO42_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO42_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO42_EDGE_LOW   at 0 range 10 .. 10;
      GPIO42_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO43_LEVEL_LOW  at 0 range 12 .. 12;
      GPIO43_LEVEL_HIGH at 0 range 13 .. 13;
      GPIO43_EDGE_LOW   at 0 range 14 .. 14;
      GPIO43_EDGE_HIGH  at 0 range 15 .. 15;
      GPIO44_LEVEL_LOW  at 0 range 16 .. 16;
      GPIO44_LEVEL_HIGH at 0 range 17 .. 17;
      GPIO44_EDGE_LOW   at 0 range 18 .. 18;
      GPIO44_EDGE_HIGH  at 0 range 19 .. 19;
      GPIO45_LEVEL_LOW  at 0 range 20 .. 20;
      GPIO45_LEVEL_HIGH at 0 range 21 .. 21;
      GPIO45_EDGE_LOW   at 0 range 22 .. 22;
      GPIO45_EDGE_HIGH  at 0 range 23 .. 23;
      GPIO46_LEVEL_LOW  at 0 range 24 .. 24;
      GPIO46_LEVEL_HIGH at 0 range 25 .. 25;
      GPIO46_EDGE_LOW   at 0 range 26 .. 26;
      GPIO46_EDGE_HIGH  at 0 range 27 .. 27;
      GPIO47_LEVEL_LOW  at 0 range 28 .. 28;
      GPIO47_LEVEL_HIGH at 0 range 29 .. 29;
      GPIO47_EDGE_LOW   at 0 range 30 .. 30;
      GPIO47_EDGE_HIGH  at 0 range 31 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type IO_BANK0_Peripheral is record
      GPIO0_STATUS                       : aliased GPIO0_STATUS_Register;
      GPIO0_CTRL                         : aliased GPIO0_CTRL_Register;
      GPIO1_STATUS                       : aliased GPIO1_STATUS_Register;
      GPIO1_CTRL                         : aliased GPIO1_CTRL_Register;
      GPIO2_STATUS                       : aliased GPIO2_STATUS_Register;
      GPIO2_CTRL                         : aliased GPIO2_CTRL_Register;
      GPIO3_STATUS                       : aliased GPIO3_STATUS_Register;
      GPIO3_CTRL                         : aliased GPIO3_CTRL_Register;
      GPIO4_STATUS                       : aliased GPIO4_STATUS_Register;
      GPIO4_CTRL                         : aliased GPIO4_CTRL_Register;
      GPIO5_STATUS                       : aliased GPIO5_STATUS_Register;
      GPIO5_CTRL                         : aliased GPIO5_CTRL_Register;
      GPIO6_STATUS                       : aliased GPIO6_STATUS_Register;
      GPIO6_CTRL                         : aliased GPIO6_CTRL_Register;
      GPIO7_STATUS                       : aliased GPIO7_STATUS_Register;
      GPIO7_CTRL                         : aliased GPIO7_CTRL_Register;
      GPIO8_STATUS                       : aliased GPIO8_STATUS_Register;
      GPIO8_CTRL                         : aliased GPIO8_CTRL_Register;
      GPIO9_STATUS                       : aliased GPIO9_STATUS_Register;
      GPIO9_CTRL                         : aliased GPIO9_CTRL_Register;
      GPIO10_STATUS                      : aliased GPIO10_STATUS_Register;
      GPIO10_CTRL                        : aliased GPIO10_CTRL_Register;
      GPIO11_STATUS                      : aliased GPIO11_STATUS_Register;
      GPIO11_CTRL                        : aliased GPIO11_CTRL_Register;
      GPIO12_STATUS                      : aliased GPIO12_STATUS_Register;
      GPIO12_CTRL                        : aliased GPIO12_CTRL_Register;
      GPIO13_STATUS                      : aliased GPIO13_STATUS_Register;
      GPIO13_CTRL                        : aliased GPIO13_CTRL_Register;
      GPIO14_STATUS                      : aliased GPIO14_STATUS_Register;
      GPIO14_CTRL                        : aliased GPIO14_CTRL_Register;
      GPIO15_STATUS                      : aliased GPIO15_STATUS_Register;
      GPIO15_CTRL                        : aliased GPIO15_CTRL_Register;
      GPIO16_STATUS                      : aliased GPIO16_STATUS_Register;
      GPIO16_CTRL                        : aliased GPIO16_CTRL_Register;
      GPIO17_STATUS                      : aliased GPIO17_STATUS_Register;
      GPIO17_CTRL                        : aliased GPIO17_CTRL_Register;
      GPIO18_STATUS                      : aliased GPIO18_STATUS_Register;
      GPIO18_CTRL                        : aliased GPIO18_CTRL_Register;
      GPIO19_STATUS                      : aliased GPIO19_STATUS_Register;
      GPIO19_CTRL                        : aliased GPIO19_CTRL_Register;
      GPIO20_STATUS                      : aliased GPIO20_STATUS_Register;
      GPIO20_CTRL                        : aliased GPIO20_CTRL_Register;
      GPIO21_STATUS                      : aliased GPIO21_STATUS_Register;
      GPIO21_CTRL                        : aliased GPIO21_CTRL_Register;
      GPIO22_STATUS                      : aliased GPIO22_STATUS_Register;
      GPIO22_CTRL                        : aliased GPIO22_CTRL_Register;
      GPIO23_STATUS                      : aliased GPIO23_STATUS_Register;
      GPIO23_CTRL                        : aliased GPIO23_CTRL_Register;
      GPIO24_STATUS                      : aliased GPIO24_STATUS_Register;
      GPIO24_CTRL                        : aliased GPIO24_CTRL_Register;
      GPIO25_STATUS                      : aliased GPIO25_STATUS_Register;
      GPIO25_CTRL                        : aliased GPIO25_CTRL_Register;
      GPIO26_STATUS                      : aliased GPIO26_STATUS_Register;
      GPIO26_CTRL                        : aliased GPIO26_CTRL_Register;
      GPIO27_STATUS                      : aliased GPIO27_STATUS_Register;
      GPIO27_CTRL                        : aliased GPIO27_CTRL_Register;
      GPIO28_STATUS                      : aliased GPIO28_STATUS_Register;
      GPIO28_CTRL                        : aliased GPIO28_CTRL_Register;
      GPIO29_STATUS                      : aliased GPIO29_STATUS_Register;
      GPIO29_CTRL                        : aliased GPIO29_CTRL_Register;
      GPIO30_STATUS                      : aliased GPIO30_STATUS_Register;
      GPIO30_CTRL                        : aliased GPIO30_CTRL_Register;
      GPIO31_STATUS                      : aliased GPIO31_STATUS_Register;
      GPIO31_CTRL                        : aliased GPIO31_CTRL_Register;
      GPIO32_STATUS                      : aliased GPIO32_STATUS_Register;
      GPIO32_CTRL                        : aliased GPIO32_CTRL_Register;
      GPIO33_STATUS                      : aliased GPIO33_STATUS_Register;
      GPIO33_CTRL                        : aliased GPIO33_CTRL_Register;
      GPIO34_STATUS                      : aliased GPIO34_STATUS_Register;
      GPIO34_CTRL                        : aliased GPIO34_CTRL_Register;
      GPIO35_STATUS                      : aliased GPIO35_STATUS_Register;
      GPIO35_CTRL                        : aliased GPIO35_CTRL_Register;
      GPIO36_STATUS                      : aliased GPIO36_STATUS_Register;
      GPIO36_CTRL                        : aliased GPIO36_CTRL_Register;
      GPIO37_STATUS                      : aliased GPIO37_STATUS_Register;
      GPIO37_CTRL                        : aliased GPIO37_CTRL_Register;
      GPIO38_STATUS                      : aliased GPIO38_STATUS_Register;
      GPIO38_CTRL                        : aliased GPIO38_CTRL_Register;
      GPIO39_STATUS                      : aliased GPIO39_STATUS_Register;
      GPIO39_CTRL                        : aliased GPIO39_CTRL_Register;
      GPIO40_STATUS                      : aliased GPIO40_STATUS_Register;
      GPIO40_CTRL                        : aliased GPIO40_CTRL_Register;
      GPIO41_STATUS                      : aliased GPIO41_STATUS_Register;
      GPIO41_CTRL                        : aliased GPIO41_CTRL_Register;
      GPIO42_STATUS                      : aliased GPIO42_STATUS_Register;
      GPIO42_CTRL                        : aliased GPIO42_CTRL_Register;
      GPIO43_STATUS                      : aliased GPIO43_STATUS_Register;
      GPIO43_CTRL                        : aliased GPIO43_CTRL_Register;
      GPIO44_STATUS                      : aliased GPIO44_STATUS_Register;
      GPIO44_CTRL                        : aliased GPIO44_CTRL_Register;
      GPIO45_STATUS                      : aliased GPIO45_STATUS_Register;
      GPIO45_CTRL                        : aliased GPIO45_CTRL_Register;
      GPIO46_STATUS                      : aliased GPIO46_STATUS_Register;
      GPIO46_CTRL                        : aliased GPIO46_CTRL_Register;
      GPIO47_STATUS                      : aliased GPIO47_STATUS_Register;
      GPIO47_CTRL                        : aliased GPIO47_CTRL_Register;
      IRQSUMMARY_PROC0_SECURE0           : aliased IRQSUMMARY_PROC0_SECURE0_Register;
      IRQSUMMARY_PROC0_SECURE1           : aliased IRQSUMMARY_PROC0_SECURE1_Register;
      IRQSUMMARY_PROC0_NONSECURE0        : aliased IRQSUMMARY_PROC0_NONSECURE0_Register;
      IRQSUMMARY_PROC0_NONSECURE1        : aliased IRQSUMMARY_PROC0_NONSECURE1_Register;
      IRQSUMMARY_PROC1_SECURE0           : aliased IRQSUMMARY_PROC1_SECURE0_Register;
      IRQSUMMARY_PROC1_SECURE1           : aliased IRQSUMMARY_PROC1_SECURE1_Register;
      IRQSUMMARY_PROC1_NONSECURE0        : aliased IRQSUMMARY_PROC1_NONSECURE0_Register;
      IRQSUMMARY_PROC1_NONSECURE1        : aliased IRQSUMMARY_PROC1_NONSECURE1_Register;
      IRQSUMMARY_DORMANT_WAKE_SECURE0    : aliased IRQSUMMARY_DORMANT_WAKE_SECURE0_Register;
      IRQSUMMARY_DORMANT_WAKE_SECURE1    : aliased IRQSUMMARY_DORMANT_WAKE_SECURE1_Register;
      IRQSUMMARY_DORMANT_WAKE_NONSECURE0 : aliased IRQSUMMARY_DORMANT_WAKE_NONSECURE0_Register;
      IRQSUMMARY_DORMANT_WAKE_NONSECURE1 : aliased IRQSUMMARY_DORMANT_WAKE_NONSECURE1_Register;
      --  Raw Interrupts
      INTR0                              : aliased INTR0_Register;
      --  Raw Interrupts
      INTR1                              : aliased INTR1_Register;
      --  Raw Interrupts
      INTR2                              : aliased INTR2_Register;
      --  Raw Interrupts
      INTR3                              : aliased INTR3_Register;
      --  Raw Interrupts
      INTR4                              : aliased INTR4_Register;
      --  Raw Interrupts
      INTR5                              : aliased INTR5_Register;
      --  Interrupt Enable for proc0
      PROC0_INTE0                        : aliased PROC0_INTE0_Register;
      --  Interrupt Enable for proc0
      PROC0_INTE1                        : aliased PROC0_INTE1_Register;
      --  Interrupt Enable for proc0
      PROC0_INTE2                        : aliased PROC0_INTE2_Register;
      --  Interrupt Enable for proc0
      PROC0_INTE3                        : aliased PROC0_INTE3_Register;
      --  Interrupt Enable for proc0
      PROC0_INTE4                        : aliased PROC0_INTE4_Register;
      --  Interrupt Enable for proc0
      PROC0_INTE5                        : aliased PROC0_INTE5_Register;
      --  Interrupt Force for proc0
      PROC0_INTF0                        : aliased PROC0_INTF0_Register;
      --  Interrupt Force for proc0
      PROC0_INTF1                        : aliased PROC0_INTF1_Register;
      --  Interrupt Force for proc0
      PROC0_INTF2                        : aliased PROC0_INTF2_Register;
      --  Interrupt Force for proc0
      PROC0_INTF3                        : aliased PROC0_INTF3_Register;
      --  Interrupt Force for proc0
      PROC0_INTF4                        : aliased PROC0_INTF4_Register;
      --  Interrupt Force for proc0
      PROC0_INTF5                        : aliased PROC0_INTF5_Register;
      --  Interrupt status after masking & forcing for proc0
      PROC0_INTS0                        : aliased PROC0_INTS0_Register;
      --  Interrupt status after masking & forcing for proc0
      PROC0_INTS1                        : aliased PROC0_INTS1_Register;
      --  Interrupt status after masking & forcing for proc0
      PROC0_INTS2                        : aliased PROC0_INTS2_Register;
      --  Interrupt status after masking & forcing for proc0
      PROC0_INTS3                        : aliased PROC0_INTS3_Register;
      --  Interrupt status after masking & forcing for proc0
      PROC0_INTS4                        : aliased PROC0_INTS4_Register;
      --  Interrupt status after masking & forcing for proc0
      PROC0_INTS5                        : aliased PROC0_INTS5_Register;
      --  Interrupt Enable for proc1
      PROC1_INTE0                        : aliased PROC1_INTE0_Register;
      --  Interrupt Enable for proc1
      PROC1_INTE1                        : aliased PROC1_INTE1_Register;
      --  Interrupt Enable for proc1
      PROC1_INTE2                        : aliased PROC1_INTE2_Register;
      --  Interrupt Enable for proc1
      PROC1_INTE3                        : aliased PROC1_INTE3_Register;
      --  Interrupt Enable for proc1
      PROC1_INTE4                        : aliased PROC1_INTE4_Register;
      --  Interrupt Enable for proc1
      PROC1_INTE5                        : aliased PROC1_INTE5_Register;
      --  Interrupt Force for proc1
      PROC1_INTF0                        : aliased PROC1_INTF0_Register;
      --  Interrupt Force for proc1
      PROC1_INTF1                        : aliased PROC1_INTF1_Register;
      --  Interrupt Force for proc1
      PROC1_INTF2                        : aliased PROC1_INTF2_Register;
      --  Interrupt Force for proc1
      PROC1_INTF3                        : aliased PROC1_INTF3_Register;
      --  Interrupt Force for proc1
      PROC1_INTF4                        : aliased PROC1_INTF4_Register;
      --  Interrupt Force for proc1
      PROC1_INTF5                        : aliased PROC1_INTF5_Register;
      --  Interrupt status after masking & forcing for proc1
      PROC1_INTS0                        : aliased PROC1_INTS0_Register;
      --  Interrupt status after masking & forcing for proc1
      PROC1_INTS1                        : aliased PROC1_INTS1_Register;
      --  Interrupt status after masking & forcing for proc1
      PROC1_INTS2                        : aliased PROC1_INTS2_Register;
      --  Interrupt status after masking & forcing for proc1
      PROC1_INTS3                        : aliased PROC1_INTS3_Register;
      --  Interrupt status after masking & forcing for proc1
      PROC1_INTS4                        : aliased PROC1_INTS4_Register;
      --  Interrupt status after masking & forcing for proc1
      PROC1_INTS5                        : aliased PROC1_INTS5_Register;
      --  Interrupt Enable for dormant_wake
      DORMANT_WAKE_INTE0                 : aliased DORMANT_WAKE_INTE0_Register;
      --  Interrupt Enable for dormant_wake
      DORMANT_WAKE_INTE1                 : aliased DORMANT_WAKE_INTE1_Register;
      --  Interrupt Enable for dormant_wake
      DORMANT_WAKE_INTE2                 : aliased DORMANT_WAKE_INTE2_Register;
      --  Interrupt Enable for dormant_wake
      DORMANT_WAKE_INTE3                 : aliased DORMANT_WAKE_INTE3_Register;
      --  Interrupt Enable for dormant_wake
      DORMANT_WAKE_INTE4                 : aliased DORMANT_WAKE_INTE4_Register;
      --  Interrupt Enable for dormant_wake
      DORMANT_WAKE_INTE5                 : aliased DORMANT_WAKE_INTE5_Register;
      --  Interrupt Force for dormant_wake
      DORMANT_WAKE_INTF0                 : aliased DORMANT_WAKE_INTF0_Register;
      --  Interrupt Force for dormant_wake
      DORMANT_WAKE_INTF1                 : aliased DORMANT_WAKE_INTF1_Register;
      --  Interrupt Force for dormant_wake
      DORMANT_WAKE_INTF2                 : aliased DORMANT_WAKE_INTF2_Register;
      --  Interrupt Force for dormant_wake
      DORMANT_WAKE_INTF3                 : aliased DORMANT_WAKE_INTF3_Register;
      --  Interrupt Force for dormant_wake
      DORMANT_WAKE_INTF4                 : aliased DORMANT_WAKE_INTF4_Register;
      --  Interrupt Force for dormant_wake
      DORMANT_WAKE_INTF5                 : aliased DORMANT_WAKE_INTF5_Register;
      --  Interrupt status after masking & forcing for dormant_wake
      DORMANT_WAKE_INTS0                 : aliased DORMANT_WAKE_INTS0_Register;
      --  Interrupt status after masking & forcing for dormant_wake
      DORMANT_WAKE_INTS1                 : aliased DORMANT_WAKE_INTS1_Register;
      --  Interrupt status after masking & forcing for dormant_wake
      DORMANT_WAKE_INTS2                 : aliased DORMANT_WAKE_INTS2_Register;
      --  Interrupt status after masking & forcing for dormant_wake
      DORMANT_WAKE_INTS3                 : aliased DORMANT_WAKE_INTS3_Register;
      --  Interrupt status after masking & forcing for dormant_wake
      DORMANT_WAKE_INTS4                 : aliased DORMANT_WAKE_INTS4_Register;
      --  Interrupt status after masking & forcing for dormant_wake
      DORMANT_WAKE_INTS5                 : aliased DORMANT_WAKE_INTS5_Register;
   end record
     with Volatile;

   for IO_BANK0_Peripheral use record
      GPIO0_STATUS                       at 16#0# range 0 .. 31;
      GPIO0_CTRL                         at 16#4# range 0 .. 31;
      GPIO1_STATUS                       at 16#8# range 0 .. 31;
      GPIO1_CTRL                         at 16#C# range 0 .. 31;
      GPIO2_STATUS                       at 16#10# range 0 .. 31;
      GPIO2_CTRL                         at 16#14# range 0 .. 31;
      GPIO3_STATUS                       at 16#18# range 0 .. 31;
      GPIO3_CTRL                         at 16#1C# range 0 .. 31;
      GPIO4_STATUS                       at 16#20# range 0 .. 31;
      GPIO4_CTRL                         at 16#24# range 0 .. 31;
      GPIO5_STATUS                       at 16#28# range 0 .. 31;
      GPIO5_CTRL                         at 16#2C# range 0 .. 31;
      GPIO6_STATUS                       at 16#30# range 0 .. 31;
      GPIO6_CTRL                         at 16#34# range 0 .. 31;
      GPIO7_STATUS                       at 16#38# range 0 .. 31;
      GPIO7_CTRL                         at 16#3C# range 0 .. 31;
      GPIO8_STATUS                       at 16#40# range 0 .. 31;
      GPIO8_CTRL                         at 16#44# range 0 .. 31;
      GPIO9_STATUS                       at 16#48# range 0 .. 31;
      GPIO9_CTRL                         at 16#4C# range 0 .. 31;
      GPIO10_STATUS                      at 16#50# range 0 .. 31;
      GPIO10_CTRL                        at 16#54# range 0 .. 31;
      GPIO11_STATUS                      at 16#58# range 0 .. 31;
      GPIO11_CTRL                        at 16#5C# range 0 .. 31;
      GPIO12_STATUS                      at 16#60# range 0 .. 31;
      GPIO12_CTRL                        at 16#64# range 0 .. 31;
      GPIO13_STATUS                      at 16#68# range 0 .. 31;
      GPIO13_CTRL                        at 16#6C# range 0 .. 31;
      GPIO14_STATUS                      at 16#70# range 0 .. 31;
      GPIO14_CTRL                        at 16#74# range 0 .. 31;
      GPIO15_STATUS                      at 16#78# range 0 .. 31;
      GPIO15_CTRL                        at 16#7C# range 0 .. 31;
      GPIO16_STATUS                      at 16#80# range 0 .. 31;
      GPIO16_CTRL                        at 16#84# range 0 .. 31;
      GPIO17_STATUS                      at 16#88# range 0 .. 31;
      GPIO17_CTRL                        at 16#8C# range 0 .. 31;
      GPIO18_STATUS                      at 16#90# range 0 .. 31;
      GPIO18_CTRL                        at 16#94# range 0 .. 31;
      GPIO19_STATUS                      at 16#98# range 0 .. 31;
      GPIO19_CTRL                        at 16#9C# range 0 .. 31;
      GPIO20_STATUS                      at 16#A0# range 0 .. 31;
      GPIO20_CTRL                        at 16#A4# range 0 .. 31;
      GPIO21_STATUS                      at 16#A8# range 0 .. 31;
      GPIO21_CTRL                        at 16#AC# range 0 .. 31;
      GPIO22_STATUS                      at 16#B0# range 0 .. 31;
      GPIO22_CTRL                        at 16#B4# range 0 .. 31;
      GPIO23_STATUS                      at 16#B8# range 0 .. 31;
      GPIO23_CTRL                        at 16#BC# range 0 .. 31;
      GPIO24_STATUS                      at 16#C0# range 0 .. 31;
      GPIO24_CTRL                        at 16#C4# range 0 .. 31;
      GPIO25_STATUS                      at 16#C8# range 0 .. 31;
      GPIO25_CTRL                        at 16#CC# range 0 .. 31;
      GPIO26_STATUS                      at 16#D0# range 0 .. 31;
      GPIO26_CTRL                        at 16#D4# range 0 .. 31;
      GPIO27_STATUS                      at 16#D8# range 0 .. 31;
      GPIO27_CTRL                        at 16#DC# range 0 .. 31;
      GPIO28_STATUS                      at 16#E0# range 0 .. 31;
      GPIO28_CTRL                        at 16#E4# range 0 .. 31;
      GPIO29_STATUS                      at 16#E8# range 0 .. 31;
      GPIO29_CTRL                        at 16#EC# range 0 .. 31;
      GPIO30_STATUS                      at 16#F0# range 0 .. 31;
      GPIO30_CTRL                        at 16#F4# range 0 .. 31;
      GPIO31_STATUS                      at 16#F8# range 0 .. 31;
      GPIO31_CTRL                        at 16#FC# range 0 .. 31;
      GPIO32_STATUS                      at 16#100# range 0 .. 31;
      GPIO32_CTRL                        at 16#104# range 0 .. 31;
      GPIO33_STATUS                      at 16#108# range 0 .. 31;
      GPIO33_CTRL                        at 16#10C# range 0 .. 31;
      GPIO34_STATUS                      at 16#110# range 0 .. 31;
      GPIO34_CTRL                        at 16#114# range 0 .. 31;
      GPIO35_STATUS                      at 16#118# range 0 .. 31;
      GPIO35_CTRL                        at 16#11C# range 0 .. 31;
      GPIO36_STATUS                      at 16#120# range 0 .. 31;
      GPIO36_CTRL                        at 16#124# range 0 .. 31;
      GPIO37_STATUS                      at 16#128# range 0 .. 31;
      GPIO37_CTRL                        at 16#12C# range 0 .. 31;
      GPIO38_STATUS                      at 16#130# range 0 .. 31;
      GPIO38_CTRL                        at 16#134# range 0 .. 31;
      GPIO39_STATUS                      at 16#138# range 0 .. 31;
      GPIO39_CTRL                        at 16#13C# range 0 .. 31;
      GPIO40_STATUS                      at 16#140# range 0 .. 31;
      GPIO40_CTRL                        at 16#144# range 0 .. 31;
      GPIO41_STATUS                      at 16#148# range 0 .. 31;
      GPIO41_CTRL                        at 16#14C# range 0 .. 31;
      GPIO42_STATUS                      at 16#150# range 0 .. 31;
      GPIO42_CTRL                        at 16#154# range 0 .. 31;
      GPIO43_STATUS                      at 16#158# range 0 .. 31;
      GPIO43_CTRL                        at 16#15C# range 0 .. 31;
      GPIO44_STATUS                      at 16#160# range 0 .. 31;
      GPIO44_CTRL                        at 16#164# range 0 .. 31;
      GPIO45_STATUS                      at 16#168# range 0 .. 31;
      GPIO45_CTRL                        at 16#16C# range 0 .. 31;
      GPIO46_STATUS                      at 16#170# range 0 .. 31;
      GPIO46_CTRL                        at 16#174# range 0 .. 31;
      GPIO47_STATUS                      at 16#178# range 0 .. 31;
      GPIO47_CTRL                        at 16#17C# range 0 .. 31;
      IRQSUMMARY_PROC0_SECURE0           at 16#200# range 0 .. 31;
      IRQSUMMARY_PROC0_SECURE1           at 16#204# range 0 .. 31;
      IRQSUMMARY_PROC0_NONSECURE0        at 16#208# range 0 .. 31;
      IRQSUMMARY_PROC0_NONSECURE1        at 16#20C# range 0 .. 31;
      IRQSUMMARY_PROC1_SECURE0           at 16#210# range 0 .. 31;
      IRQSUMMARY_PROC1_SECURE1           at 16#214# range 0 .. 31;
      IRQSUMMARY_PROC1_NONSECURE0        at 16#218# range 0 .. 31;
      IRQSUMMARY_PROC1_NONSECURE1        at 16#21C# range 0 .. 31;
      IRQSUMMARY_DORMANT_WAKE_SECURE0    at 16#220# range 0 .. 31;
      IRQSUMMARY_DORMANT_WAKE_SECURE1    at 16#224# range 0 .. 31;
      IRQSUMMARY_DORMANT_WAKE_NONSECURE0 at 16#228# range 0 .. 31;
      IRQSUMMARY_DORMANT_WAKE_NONSECURE1 at 16#22C# range 0 .. 31;
      INTR0                              at 16#230# range 0 .. 31;
      INTR1                              at 16#234# range 0 .. 31;
      INTR2                              at 16#238# range 0 .. 31;
      INTR3                              at 16#23C# range 0 .. 31;
      INTR4                              at 16#240# range 0 .. 31;
      INTR5                              at 16#244# range 0 .. 31;
      PROC0_INTE0                        at 16#248# range 0 .. 31;
      PROC0_INTE1                        at 16#24C# range 0 .. 31;
      PROC0_INTE2                        at 16#250# range 0 .. 31;
      PROC0_INTE3                        at 16#254# range 0 .. 31;
      PROC0_INTE4                        at 16#258# range 0 .. 31;
      PROC0_INTE5                        at 16#25C# range 0 .. 31;
      PROC0_INTF0                        at 16#260# range 0 .. 31;
      PROC0_INTF1                        at 16#264# range 0 .. 31;
      PROC0_INTF2                        at 16#268# range 0 .. 31;
      PROC0_INTF3                        at 16#26C# range 0 .. 31;
      PROC0_INTF4                        at 16#270# range 0 .. 31;
      PROC0_INTF5                        at 16#274# range 0 .. 31;
      PROC0_INTS0                        at 16#278# range 0 .. 31;
      PROC0_INTS1                        at 16#27C# range 0 .. 31;
      PROC0_INTS2                        at 16#280# range 0 .. 31;
      PROC0_INTS3                        at 16#284# range 0 .. 31;
      PROC0_INTS4                        at 16#288# range 0 .. 31;
      PROC0_INTS5                        at 16#28C# range 0 .. 31;
      PROC1_INTE0                        at 16#290# range 0 .. 31;
      PROC1_INTE1                        at 16#294# range 0 .. 31;
      PROC1_INTE2                        at 16#298# range 0 .. 31;
      PROC1_INTE3                        at 16#29C# range 0 .. 31;
      PROC1_INTE4                        at 16#2A0# range 0 .. 31;
      PROC1_INTE5                        at 16#2A4# range 0 .. 31;
      PROC1_INTF0                        at 16#2A8# range 0 .. 31;
      PROC1_INTF1                        at 16#2AC# range 0 .. 31;
      PROC1_INTF2                        at 16#2B0# range 0 .. 31;
      PROC1_INTF3                        at 16#2B4# range 0 .. 31;
      PROC1_INTF4                        at 16#2B8# range 0 .. 31;
      PROC1_INTF5                        at 16#2BC# range 0 .. 31;
      PROC1_INTS0                        at 16#2C0# range 0 .. 31;
      PROC1_INTS1                        at 16#2C4# range 0 .. 31;
      PROC1_INTS2                        at 16#2C8# range 0 .. 31;
      PROC1_INTS3                        at 16#2CC# range 0 .. 31;
      PROC1_INTS4                        at 16#2D0# range 0 .. 31;
      PROC1_INTS5                        at 16#2D4# range 0 .. 31;
      DORMANT_WAKE_INTE0                 at 16#2D8# range 0 .. 31;
      DORMANT_WAKE_INTE1                 at 16#2DC# range 0 .. 31;
      DORMANT_WAKE_INTE2                 at 16#2E0# range 0 .. 31;
      DORMANT_WAKE_INTE3                 at 16#2E4# range 0 .. 31;
      DORMANT_WAKE_INTE4                 at 16#2E8# range 0 .. 31;
      DORMANT_WAKE_INTE5                 at 16#2EC# range 0 .. 31;
      DORMANT_WAKE_INTF0                 at 16#2F0# range 0 .. 31;
      DORMANT_WAKE_INTF1                 at 16#2F4# range 0 .. 31;
      DORMANT_WAKE_INTF2                 at 16#2F8# range 0 .. 31;
      DORMANT_WAKE_INTF3                 at 16#2FC# range 0 .. 31;
      DORMANT_WAKE_INTF4                 at 16#300# range 0 .. 31;
      DORMANT_WAKE_INTF5                 at 16#304# range 0 .. 31;
      DORMANT_WAKE_INTS0                 at 16#308# range 0 .. 31;
      DORMANT_WAKE_INTS1                 at 16#30C# range 0 .. 31;
      DORMANT_WAKE_INTS2                 at 16#310# range 0 .. 31;
      DORMANT_WAKE_INTS3                 at 16#314# range 0 .. 31;
      DORMANT_WAKE_INTS4                 at 16#318# range 0 .. 31;
      DORMANT_WAKE_INTS5                 at 16#31C# range 0 .. 31;
   end record;

   IO_BANK0_Periph : aliased IO_BANK0_Peripheral
     with Import, Address => IO_BANK0_Base;

end RP2350_SVD.IO_BANK0;
