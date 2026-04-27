pragma Style_Checks (Off);

--  Copyright (c) 2020 Raspberry Pi (Trading) Ltd.
--
--  SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2040.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package RP2040_SVD.IO_BANK0 is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  GPIO status
   type GPIO0_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO0_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO0_CTRL_FUNCSEL_Field is
     (jtag_tck,
      spi0_rx,
      uart0_tx,
      i2c0_sda,
      pwm_a_0,
      sio_0,
      pio0_0,
      pio1_0,
      usb_muxing_overcurr_detect,
      null_k)
     with Size => 5;
   for GPIO0_CTRL_FUNCSEL_Field use
     (jtag_tck => 0,
      spi0_rx => 1,
      uart0_tx => 2,
      i2c0_sda => 3,
      pwm_a_0 => 4,
      sio_0 => 5,
      pio0_0 => 6,
      pio1_0 => 7,
      usb_muxing_overcurr_detect => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO0_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO0_CTRL_FUNCSEL_Field := RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO0_CTRL_OUTOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO0_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO0_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO0_CTRL_IRQOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO0_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO1_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO1_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO1_CTRL_FUNCSEL_Field is
     (jtag_tms,
      spi0_ss_n,
      uart0_rx,
      i2c0_scl,
      pwm_b_0,
      sio_1,
      pio0_1,
      pio1_1,
      usb_muxing_vbus_detect,
      null_k)
     with Size => 5;
   for GPIO1_CTRL_FUNCSEL_Field use
     (jtag_tms => 0,
      spi0_ss_n => 1,
      uart0_rx => 2,
      i2c0_scl => 3,
      pwm_b_0 => 4,
      sio_1 => 5,
      pio0_1 => 6,
      pio1_1 => 7,
      usb_muxing_vbus_detect => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO1_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO1_CTRL_FUNCSEL_Field := RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO1_CTRL_OUTOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO1_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO1_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO1_CTRL_IRQOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO1_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO2_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO2_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO2_CTRL_FUNCSEL_Field is
     (jtag_tdi,
      spi0_sclk,
      uart0_cts,
      i2c1_sda,
      pwm_a_1,
      sio_2,
      pio0_2,
      pio1_2,
      usb_muxing_vbus_en,
      null_k)
     with Size => 5;
   for GPIO2_CTRL_FUNCSEL_Field use
     (jtag_tdi => 0,
      spi0_sclk => 1,
      uart0_cts => 2,
      i2c1_sda => 3,
      pwm_a_1 => 4,
      sio_2 => 5,
      pio0_2 => 6,
      pio1_2 => 7,
      usb_muxing_vbus_en => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO2_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO2_CTRL_FUNCSEL_Field := RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO2_CTRL_OUTOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO2_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO2_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO2_CTRL_IRQOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO2_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO3_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO3_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO3_CTRL_FUNCSEL_Field is
     (jtag_tdo,
      spi0_tx,
      uart0_rts,
      i2c1_scl,
      pwm_b_1,
      sio_3,
      pio0_3,
      pio1_3,
      usb_muxing_overcurr_detect,
      null_k)
     with Size => 5;
   for GPIO3_CTRL_FUNCSEL_Field use
     (jtag_tdo => 0,
      spi0_tx => 1,
      uart0_rts => 2,
      i2c1_scl => 3,
      pwm_b_1 => 4,
      sio_3 => 5,
      pio0_3 => 6,
      pio1_3 => 7,
      usb_muxing_overcurr_detect => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO3_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO3_CTRL_FUNCSEL_Field := RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO3_CTRL_OUTOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO3_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO3_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO3_CTRL_IRQOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO3_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO4_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO4_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO4_CTRL_FUNCSEL_Field is
     (spi0_rx,
      uart1_tx,
      i2c0_sda,
      pwm_a_2,
      sio_4,
      pio0_4,
      pio1_4,
      usb_muxing_vbus_detect,
      null_k)
     with Size => 5;
   for GPIO4_CTRL_FUNCSEL_Field use
     (spi0_rx => 1,
      uart1_tx => 2,
      i2c0_sda => 3,
      pwm_a_2 => 4,
      sio_4 => 5,
      pio0_4 => 6,
      pio1_4 => 7,
      usb_muxing_vbus_detect => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO4_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO4_CTRL_FUNCSEL_Field := RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO4_CTRL_OUTOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO4_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO4_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO4_CTRL_IRQOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO4_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO5_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO5_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO5_CTRL_FUNCSEL_Field is
     (spi0_ss_n,
      uart1_rx,
      i2c0_scl,
      pwm_b_2,
      sio_5,
      pio0_5,
      pio1_5,
      usb_muxing_vbus_en,
      null_k)
     with Size => 5;
   for GPIO5_CTRL_FUNCSEL_Field use
     (spi0_ss_n => 1,
      uart1_rx => 2,
      i2c0_scl => 3,
      pwm_b_2 => 4,
      sio_5 => 5,
      pio0_5 => 6,
      pio1_5 => 7,
      usb_muxing_vbus_en => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO5_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO5_CTRL_FUNCSEL_Field := RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO5_CTRL_OUTOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO5_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO5_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO5_CTRL_IRQOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO5_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO6_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO6_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO6_CTRL_FUNCSEL_Field is
     (spi0_sclk,
      uart1_cts,
      i2c1_sda,
      pwm_a_3,
      sio_6,
      pio0_6,
      pio1_6,
      usb_muxing_extphy_softcon,
      usb_muxing_overcurr_detect,
      null_k)
     with Size => 5;
   for GPIO6_CTRL_FUNCSEL_Field use
     (spi0_sclk => 1,
      uart1_cts => 2,
      i2c1_sda => 3,
      pwm_a_3 => 4,
      sio_6 => 5,
      pio0_6 => 6,
      pio1_6 => 7,
      usb_muxing_extphy_softcon => 8,
      usb_muxing_overcurr_detect => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO6_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO6_CTRL_FUNCSEL_Field := RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO6_CTRL_OUTOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO6_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO6_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO6_CTRL_IRQOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO6_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO7_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO7_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO7_CTRL_FUNCSEL_Field is
     (spi0_tx,
      uart1_rts,
      i2c1_scl,
      pwm_b_3,
      sio_7,
      pio0_7,
      pio1_7,
      usb_muxing_extphy_oe_n,
      usb_muxing_vbus_detect,
      null_k)
     with Size => 5;
   for GPIO7_CTRL_FUNCSEL_Field use
     (spi0_tx => 1,
      uart1_rts => 2,
      i2c1_scl => 3,
      pwm_b_3 => 4,
      sio_7 => 5,
      pio0_7 => 6,
      pio1_7 => 7,
      usb_muxing_extphy_oe_n => 8,
      usb_muxing_vbus_detect => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO7_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO7_CTRL_FUNCSEL_Field := RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO7_CTRL_OUTOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO7_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO7_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO7_CTRL_IRQOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO7_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO8_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO8_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO8_CTRL_FUNCSEL_Field is
     (spi1_rx,
      uart1_tx,
      i2c0_sda,
      pwm_a_4,
      sio_8,
      pio0_8,
      pio1_8,
      usb_muxing_extphy_rcv,
      usb_muxing_vbus_en,
      null_k)
     with Size => 5;
   for GPIO8_CTRL_FUNCSEL_Field use
     (spi1_rx => 1,
      uart1_tx => 2,
      i2c0_sda => 3,
      pwm_a_4 => 4,
      sio_8 => 5,
      pio0_8 => 6,
      pio1_8 => 7,
      usb_muxing_extphy_rcv => 8,
      usb_muxing_vbus_en => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO8_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO8_CTRL_FUNCSEL_Field := RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO8_CTRL_OUTOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO8_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO8_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO8_CTRL_IRQOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO8_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO9_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO9_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO9_CTRL_FUNCSEL_Field is
     (spi1_ss_n,
      uart1_rx,
      i2c0_scl,
      pwm_b_4,
      sio_9,
      pio0_9,
      pio1_9,
      usb_muxing_extphy_vp,
      usb_muxing_overcurr_detect,
      null_k)
     with Size => 5;
   for GPIO9_CTRL_FUNCSEL_Field use
     (spi1_ss_n => 1,
      uart1_rx => 2,
      i2c0_scl => 3,
      pwm_b_4 => 4,
      sio_9 => 5,
      pio0_9 => 6,
      pio1_9 => 7,
      usb_muxing_extphy_vp => 8,
      usb_muxing_overcurr_detect => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO9_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO9_CTRL_FUNCSEL_Field := RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO9_CTRL_OUTOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO9_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO9_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO9_CTRL_IRQOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO9_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO10_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO10_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO10_CTRL_FUNCSEL_Field is
     (spi1_sclk,
      uart1_cts,
      i2c1_sda,
      pwm_a_5,
      sio_10,
      pio0_10,
      pio1_10,
      usb_muxing_extphy_vm,
      usb_muxing_vbus_detect,
      null_k)
     with Size => 5;
   for GPIO10_CTRL_FUNCSEL_Field use
     (spi1_sclk => 1,
      uart1_cts => 2,
      i2c1_sda => 3,
      pwm_a_5 => 4,
      sio_10 => 5,
      pio0_10 => 6,
      pio1_10 => 7,
      usb_muxing_extphy_vm => 8,
      usb_muxing_vbus_detect => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO10_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO10_CTRL_FUNCSEL_Field :=
                        RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO10_CTRL_OUTOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO10_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO10_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO10_CTRL_IRQOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO10_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO11_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO11_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO11_CTRL_FUNCSEL_Field is
     (spi1_tx,
      uart1_rts,
      i2c1_scl,
      pwm_b_5,
      sio_11,
      pio0_11,
      pio1_11,
      usb_muxing_extphy_suspnd,
      usb_muxing_vbus_en,
      null_k)
     with Size => 5;
   for GPIO11_CTRL_FUNCSEL_Field use
     (spi1_tx => 1,
      uart1_rts => 2,
      i2c1_scl => 3,
      pwm_b_5 => 4,
      sio_11 => 5,
      pio0_11 => 6,
      pio1_11 => 7,
      usb_muxing_extphy_suspnd => 8,
      usb_muxing_vbus_en => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO11_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO11_CTRL_FUNCSEL_Field :=
                        RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO11_CTRL_OUTOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO11_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO11_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO11_CTRL_IRQOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO11_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO12_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO12_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO12_CTRL_FUNCSEL_Field is
     (spi1_rx,
      uart0_tx,
      i2c0_sda,
      pwm_a_6,
      sio_12,
      pio0_12,
      pio1_12,
      usb_muxing_extphy_speed,
      usb_muxing_overcurr_detect,
      null_k)
     with Size => 5;
   for GPIO12_CTRL_FUNCSEL_Field use
     (spi1_rx => 1,
      uart0_tx => 2,
      i2c0_sda => 3,
      pwm_a_6 => 4,
      sio_12 => 5,
      pio0_12 => 6,
      pio1_12 => 7,
      usb_muxing_extphy_speed => 8,
      usb_muxing_overcurr_detect => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO12_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO12_CTRL_FUNCSEL_Field :=
                        RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO12_CTRL_OUTOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO12_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO12_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO12_CTRL_IRQOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO12_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO13_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO13_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO13_CTRL_FUNCSEL_Field is
     (spi1_ss_n,
      uart0_rx,
      i2c0_scl,
      pwm_b_6,
      sio_13,
      pio0_13,
      pio1_13,
      usb_muxing_extphy_vpo,
      usb_muxing_vbus_detect,
      null_k)
     with Size => 5;
   for GPIO13_CTRL_FUNCSEL_Field use
     (spi1_ss_n => 1,
      uart0_rx => 2,
      i2c0_scl => 3,
      pwm_b_6 => 4,
      sio_13 => 5,
      pio0_13 => 6,
      pio1_13 => 7,
      usb_muxing_extphy_vpo => 8,
      usb_muxing_vbus_detect => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO13_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO13_CTRL_FUNCSEL_Field :=
                        RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO13_CTRL_OUTOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO13_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO13_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO13_CTRL_IRQOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO13_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO14_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO14_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO14_CTRL_FUNCSEL_Field is
     (spi1_sclk,
      uart0_cts,
      i2c1_sda,
      pwm_a_7,
      sio_14,
      pio0_14,
      pio1_14,
      usb_muxing_extphy_vmo,
      usb_muxing_vbus_en,
      null_k)
     with Size => 5;
   for GPIO14_CTRL_FUNCSEL_Field use
     (spi1_sclk => 1,
      uart0_cts => 2,
      i2c1_sda => 3,
      pwm_a_7 => 4,
      sio_14 => 5,
      pio0_14 => 6,
      pio1_14 => 7,
      usb_muxing_extphy_vmo => 8,
      usb_muxing_vbus_en => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO14_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO14_CTRL_FUNCSEL_Field :=
                        RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO14_CTRL_OUTOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO14_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO14_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO14_CTRL_IRQOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO14_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO15_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO15_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO15_CTRL_FUNCSEL_Field is
     (spi1_tx,
      uart0_rts,
      i2c1_scl,
      pwm_b_7,
      sio_15,
      pio0_15,
      pio1_15,
      usb_muxing_digital_dp,
      usb_muxing_overcurr_detect,
      null_k)
     with Size => 5;
   for GPIO15_CTRL_FUNCSEL_Field use
     (spi1_tx => 1,
      uart0_rts => 2,
      i2c1_scl => 3,
      pwm_b_7 => 4,
      sio_15 => 5,
      pio0_15 => 6,
      pio1_15 => 7,
      usb_muxing_digital_dp => 8,
      usb_muxing_overcurr_detect => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO15_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO15_CTRL_FUNCSEL_Field :=
                        RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO15_CTRL_OUTOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO15_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO15_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO15_CTRL_IRQOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO15_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO16_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO16_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO16_CTRL_FUNCSEL_Field is
     (spi0_rx,
      uart0_tx,
      i2c0_sda,
      pwm_a_0,
      sio_16,
      pio0_16,
      pio1_16,
      usb_muxing_digital_dm,
      usb_muxing_vbus_detect,
      null_k)
     with Size => 5;
   for GPIO16_CTRL_FUNCSEL_Field use
     (spi0_rx => 1,
      uart0_tx => 2,
      i2c0_sda => 3,
      pwm_a_0 => 4,
      sio_16 => 5,
      pio0_16 => 6,
      pio1_16 => 7,
      usb_muxing_digital_dm => 8,
      usb_muxing_vbus_detect => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO16_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO16_CTRL_FUNCSEL_Field :=
                        RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO16_CTRL_OUTOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO16_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO16_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO16_CTRL_IRQOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO16_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO17_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO17_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO17_CTRL_FUNCSEL_Field is
     (spi0_ss_n,
      uart0_rx,
      i2c0_scl,
      pwm_b_0,
      sio_17,
      pio0_17,
      pio1_17,
      usb_muxing_vbus_en,
      null_k)
     with Size => 5;
   for GPIO17_CTRL_FUNCSEL_Field use
     (spi0_ss_n => 1,
      uart0_rx => 2,
      i2c0_scl => 3,
      pwm_b_0 => 4,
      sio_17 => 5,
      pio0_17 => 6,
      pio1_17 => 7,
      usb_muxing_vbus_en => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO17_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO17_CTRL_FUNCSEL_Field :=
                        RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO17_CTRL_OUTOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO17_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO17_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO17_CTRL_IRQOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO17_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO18_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO18_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO18_CTRL_FUNCSEL_Field is
     (spi0_sclk,
      uart0_cts,
      i2c1_sda,
      pwm_a_1,
      sio_18,
      pio0_18,
      pio1_18,
      usb_muxing_overcurr_detect,
      null_k)
     with Size => 5;
   for GPIO18_CTRL_FUNCSEL_Field use
     (spi0_sclk => 1,
      uart0_cts => 2,
      i2c1_sda => 3,
      pwm_a_1 => 4,
      sio_18 => 5,
      pio0_18 => 6,
      pio1_18 => 7,
      usb_muxing_overcurr_detect => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO18_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO18_CTRL_FUNCSEL_Field :=
                        RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO18_CTRL_OUTOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO18_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO18_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO18_CTRL_IRQOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO18_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO19_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO19_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO19_CTRL_FUNCSEL_Field is
     (spi0_tx,
      uart0_rts,
      i2c1_scl,
      pwm_b_1,
      sio_19,
      pio0_19,
      pio1_19,
      usb_muxing_vbus_detect,
      null_k)
     with Size => 5;
   for GPIO19_CTRL_FUNCSEL_Field use
     (spi0_tx => 1,
      uart0_rts => 2,
      i2c1_scl => 3,
      pwm_b_1 => 4,
      sio_19 => 5,
      pio0_19 => 6,
      pio1_19 => 7,
      usb_muxing_vbus_detect => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO19_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO19_CTRL_FUNCSEL_Field :=
                        RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO19_CTRL_OUTOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO19_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO19_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO19_CTRL_IRQOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO19_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO20_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO20_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO20_CTRL_FUNCSEL_Field is
     (spi0_rx,
      uart1_tx,
      i2c0_sda,
      pwm_a_2,
      sio_20,
      pio0_20,
      pio1_20,
      clocks_gpin_0,
      usb_muxing_vbus_en,
      null_k)
     with Size => 5;
   for GPIO20_CTRL_FUNCSEL_Field use
     (spi0_rx => 1,
      uart1_tx => 2,
      i2c0_sda => 3,
      pwm_a_2 => 4,
      sio_20 => 5,
      pio0_20 => 6,
      pio1_20 => 7,
      clocks_gpin_0 => 8,
      usb_muxing_vbus_en => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO20_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO20_CTRL_FUNCSEL_Field :=
                        RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO20_CTRL_OUTOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO20_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO20_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO20_CTRL_IRQOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO20_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO21_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO21_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO21_CTRL_FUNCSEL_Field is
     (spi0_ss_n,
      uart1_rx,
      i2c0_scl,
      pwm_b_2,
      sio_21,
      pio0_21,
      pio1_21,
      clocks_gpout_0,
      usb_muxing_overcurr_detect,
      null_k)
     with Size => 5;
   for GPIO21_CTRL_FUNCSEL_Field use
     (spi0_ss_n => 1,
      uart1_rx => 2,
      i2c0_scl => 3,
      pwm_b_2 => 4,
      sio_21 => 5,
      pio0_21 => 6,
      pio1_21 => 7,
      clocks_gpout_0 => 8,
      usb_muxing_overcurr_detect => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO21_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO21_CTRL_FUNCSEL_Field :=
                        RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO21_CTRL_OUTOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO21_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO21_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO21_CTRL_IRQOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO21_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO22_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO22_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO22_CTRL_FUNCSEL_Field is
     (spi0_sclk,
      uart1_cts,
      i2c1_sda,
      pwm_a_3,
      sio_22,
      pio0_22,
      pio1_22,
      clocks_gpin_1,
      usb_muxing_vbus_detect,
      null_k)
     with Size => 5;
   for GPIO22_CTRL_FUNCSEL_Field use
     (spi0_sclk => 1,
      uart1_cts => 2,
      i2c1_sda => 3,
      pwm_a_3 => 4,
      sio_22 => 5,
      pio0_22 => 6,
      pio1_22 => 7,
      clocks_gpin_1 => 8,
      usb_muxing_vbus_detect => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO22_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO22_CTRL_FUNCSEL_Field :=
                        RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO22_CTRL_OUTOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO22_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO22_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO22_CTRL_IRQOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO22_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO23_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO23_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO23_CTRL_FUNCSEL_Field is
     (spi0_tx,
      uart1_rts,
      i2c1_scl,
      pwm_b_3,
      sio_23,
      pio0_23,
      pio1_23,
      clocks_gpout_1,
      usb_muxing_vbus_en,
      null_k)
     with Size => 5;
   for GPIO23_CTRL_FUNCSEL_Field use
     (spi0_tx => 1,
      uart1_rts => 2,
      i2c1_scl => 3,
      pwm_b_3 => 4,
      sio_23 => 5,
      pio0_23 => 6,
      pio1_23 => 7,
      clocks_gpout_1 => 8,
      usb_muxing_vbus_en => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO23_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO23_CTRL_FUNCSEL_Field :=
                        RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO23_CTRL_OUTOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO23_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO23_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO23_CTRL_IRQOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO23_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO24_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO24_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO24_CTRL_FUNCSEL_Field is
     (spi1_rx,
      uart1_tx,
      i2c0_sda,
      pwm_a_4,
      sio_24,
      pio0_24,
      pio1_24,
      clocks_gpout_2,
      usb_muxing_overcurr_detect,
      null_k)
     with Size => 5;
   for GPIO24_CTRL_FUNCSEL_Field use
     (spi1_rx => 1,
      uart1_tx => 2,
      i2c0_sda => 3,
      pwm_a_4 => 4,
      sio_24 => 5,
      pio0_24 => 6,
      pio1_24 => 7,
      clocks_gpout_2 => 8,
      usb_muxing_overcurr_detect => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO24_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO24_CTRL_FUNCSEL_Field :=
                        RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO24_CTRL_OUTOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO24_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO24_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO24_CTRL_IRQOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO24_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO25_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO25_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO25_CTRL_FUNCSEL_Field is
     (spi1_ss_n,
      uart1_rx,
      i2c0_scl,
      pwm_b_4,
      sio_25,
      pio0_25,
      pio1_25,
      clocks_gpout_3,
      usb_muxing_vbus_detect,
      null_k)
     with Size => 5;
   for GPIO25_CTRL_FUNCSEL_Field use
     (spi1_ss_n => 1,
      uart1_rx => 2,
      i2c0_scl => 3,
      pwm_b_4 => 4,
      sio_25 => 5,
      pio0_25 => 6,
      pio1_25 => 7,
      clocks_gpout_3 => 8,
      usb_muxing_vbus_detect => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO25_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO25_CTRL_FUNCSEL_Field :=
                        RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO25_CTRL_OUTOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO25_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO25_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO25_CTRL_IRQOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO25_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO26_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO26_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO26_CTRL_FUNCSEL_Field is
     (spi1_sclk,
      uart1_cts,
      i2c1_sda,
      pwm_a_5,
      sio_26,
      pio0_26,
      pio1_26,
      usb_muxing_vbus_en,
      null_k)
     with Size => 5;
   for GPIO26_CTRL_FUNCSEL_Field use
     (spi1_sclk => 1,
      uart1_cts => 2,
      i2c1_sda => 3,
      pwm_a_5 => 4,
      sio_26 => 5,
      pio0_26 => 6,
      pio1_26 => 7,
      usb_muxing_vbus_en => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO26_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO26_CTRL_FUNCSEL_Field :=
                        RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO26_CTRL_OUTOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO26_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO26_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO26_CTRL_IRQOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO26_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO27_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO27_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO27_CTRL_FUNCSEL_Field is
     (spi1_tx,
      uart1_rts,
      i2c1_scl,
      pwm_b_5,
      sio_27,
      pio0_27,
      pio1_27,
      usb_muxing_overcurr_detect,
      null_k)
     with Size => 5;
   for GPIO27_CTRL_FUNCSEL_Field use
     (spi1_tx => 1,
      uart1_rts => 2,
      i2c1_scl => 3,
      pwm_b_5 => 4,
      sio_27 => 5,
      pio0_27 => 6,
      pio1_27 => 7,
      usb_muxing_overcurr_detect => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO27_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO27_CTRL_FUNCSEL_Field :=
                        RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO27_CTRL_OUTOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO27_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO27_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO27_CTRL_IRQOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO27_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO28_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO28_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO28_CTRL_FUNCSEL_Field is
     (spi1_rx,
      uart0_tx,
      i2c0_sda,
      pwm_a_6,
      sio_28,
      pio0_28,
      pio1_28,
      usb_muxing_vbus_detect,
      null_k)
     with Size => 5;
   for GPIO28_CTRL_FUNCSEL_Field use
     (spi1_rx => 1,
      uart0_tx => 2,
      i2c0_sda => 3,
      pwm_a_6 => 4,
      sio_28 => 5,
      pio0_28 => 6,
      pio1_28 => 7,
      usb_muxing_vbus_detect => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO28_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO28_CTRL_FUNCSEL_Field :=
                        RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO28_CTRL_OUTOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO28_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO28_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO28_CTRL_IRQOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO28_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  GPIO status
   type GPIO29_STATUS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8;
      --  Read-only. output signal from selected peripheral, before register
      --  override is applied
      OUTFROMPERI    : Boolean;
      --  Read-only. output signal to pad after register override is applied
      OUTTOPAD       : Boolean;
      --  unspecified
      Reserved_10_11 : HAL.UInt2;
      --  Read-only. output enable from selected peripheral, before register
      --  override is applied
      OEFROMPERI     : Boolean;
      --  Read-only. output enable to pad after register override is applied
      OETOPAD        : Boolean;
      --  unspecified
      Reserved_14_16 : HAL.UInt3;
      --  Read-only. input signal from pad, before override is applied
      INFROMPAD      : Boolean;
      --  unspecified
      Reserved_18_18 : HAL.Bit;
      --  Read-only. input signal to peripheral, after override is applied
      INTOPERI       : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. interrupt from pad before override is applied
      IRQFROMPAD     : Boolean;
      --  unspecified
      Reserved_25_25 : HAL.Bit;
      --  Read-only. interrupt to processors, after override is applied
      IRQTOPROC      : Boolean;
      --  unspecified
      Reserved_27_31 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO29_STATUS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      OUTFROMPERI    at 0 range 8 .. 8;
      OUTTOPAD       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEFROMPERI     at 0 range 12 .. 12;
      OETOPAD        at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      INFROMPAD      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      INTOPERI       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      IRQFROMPAD     at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IRQTOPROC      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
   type GPIO29_CTRL_FUNCSEL_Field is
     (spi1_ss_n,
      uart0_rx,
      i2c0_scl,
      pwm_b_6,
      sio_29,
      pio0_29,
      pio1_29,
      usb_muxing_vbus_en,
      null_k)
     with Size => 5;
   for GPIO29_CTRL_FUNCSEL_Field use
     (spi1_ss_n => 1,
      uart0_rx => 2,
      i2c0_scl => 3,
      pwm_b_6 => 4,
      sio_29 => 5,
      pio0_29 => 6,
      pio1_29 => 7,
      usb_muxing_vbus_en => 9,
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

   --  GPIO control including function select and overrides.
   type GPIO29_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table\n 31 == NULL
      FUNCSEL        : GPIO29_CTRL_FUNCSEL_Field :=
                        RP2040_SVD.IO_BANK0.null_k;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      OUTOVER        : GPIO29_CTRL_OUTOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      OEOVER         : GPIO29_CTRL_OEOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      INOVER         : GPIO29_CTRL_INOVER_Field := RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO29_CTRL_IRQOVER_Field :=
                        RP2040_SVD.IO_BANK0.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO29_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OUTOVER        at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      OEOVER         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
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
      --  unspecified
      Reserved_24_31    : HAL.UInt8 := 16#0#;
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
      Reserved_24_31    at 0 range 24 .. 31;
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
      --  unspecified
      Reserved_24_31    : HAL.UInt8 := 16#0#;
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
      Reserved_24_31    at 0 range 24 .. 31;
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
      --  unspecified
      Reserved_24_31    : HAL.UInt8 := 16#0#;
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
      Reserved_24_31    at 0 range 24 .. 31;
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
      --  unspecified
      Reserved_24_31    : HAL.UInt8;
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
      Reserved_24_31    at 0 range 24 .. 31;
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
      --  unspecified
      Reserved_24_31    : HAL.UInt8 := 16#0#;
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
      Reserved_24_31    at 0 range 24 .. 31;
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
      --  unspecified
      Reserved_24_31    : HAL.UInt8 := 16#0#;
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
      Reserved_24_31    at 0 range 24 .. 31;
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
      --  unspecified
      Reserved_24_31    : HAL.UInt8;
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
      Reserved_24_31    at 0 range 24 .. 31;
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
      --  unspecified
      Reserved_24_31    : HAL.UInt8 := 16#0#;
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
      Reserved_24_31    at 0 range 24 .. 31;
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
      --  unspecified
      Reserved_24_31    : HAL.UInt8 := 16#0#;
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
      Reserved_24_31    at 0 range 24 .. 31;
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
      --  unspecified
      Reserved_24_31    : HAL.UInt8;
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
      Reserved_24_31    at 0 range 24 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type IO_BANK0_Peripheral is record
      --  GPIO status
      GPIO0_STATUS       : aliased GPIO0_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO0_CTRL         : aliased GPIO0_CTRL_Register;
      --  GPIO status
      GPIO1_STATUS       : aliased GPIO1_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO1_CTRL         : aliased GPIO1_CTRL_Register;
      --  GPIO status
      GPIO2_STATUS       : aliased GPIO2_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO2_CTRL         : aliased GPIO2_CTRL_Register;
      --  GPIO status
      GPIO3_STATUS       : aliased GPIO3_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO3_CTRL         : aliased GPIO3_CTRL_Register;
      --  GPIO status
      GPIO4_STATUS       : aliased GPIO4_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO4_CTRL         : aliased GPIO4_CTRL_Register;
      --  GPIO status
      GPIO5_STATUS       : aliased GPIO5_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO5_CTRL         : aliased GPIO5_CTRL_Register;
      --  GPIO status
      GPIO6_STATUS       : aliased GPIO6_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO6_CTRL         : aliased GPIO6_CTRL_Register;
      --  GPIO status
      GPIO7_STATUS       : aliased GPIO7_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO7_CTRL         : aliased GPIO7_CTRL_Register;
      --  GPIO status
      GPIO8_STATUS       : aliased GPIO8_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO8_CTRL         : aliased GPIO8_CTRL_Register;
      --  GPIO status
      GPIO9_STATUS       : aliased GPIO9_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO9_CTRL         : aliased GPIO9_CTRL_Register;
      --  GPIO status
      GPIO10_STATUS      : aliased GPIO10_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO10_CTRL        : aliased GPIO10_CTRL_Register;
      --  GPIO status
      GPIO11_STATUS      : aliased GPIO11_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO11_CTRL        : aliased GPIO11_CTRL_Register;
      --  GPIO status
      GPIO12_STATUS      : aliased GPIO12_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO12_CTRL        : aliased GPIO12_CTRL_Register;
      --  GPIO status
      GPIO13_STATUS      : aliased GPIO13_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO13_CTRL        : aliased GPIO13_CTRL_Register;
      --  GPIO status
      GPIO14_STATUS      : aliased GPIO14_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO14_CTRL        : aliased GPIO14_CTRL_Register;
      --  GPIO status
      GPIO15_STATUS      : aliased GPIO15_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO15_CTRL        : aliased GPIO15_CTRL_Register;
      --  GPIO status
      GPIO16_STATUS      : aliased GPIO16_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO16_CTRL        : aliased GPIO16_CTRL_Register;
      --  GPIO status
      GPIO17_STATUS      : aliased GPIO17_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO17_CTRL        : aliased GPIO17_CTRL_Register;
      --  GPIO status
      GPIO18_STATUS      : aliased GPIO18_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO18_CTRL        : aliased GPIO18_CTRL_Register;
      --  GPIO status
      GPIO19_STATUS      : aliased GPIO19_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO19_CTRL        : aliased GPIO19_CTRL_Register;
      --  GPIO status
      GPIO20_STATUS      : aliased GPIO20_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO20_CTRL        : aliased GPIO20_CTRL_Register;
      --  GPIO status
      GPIO21_STATUS      : aliased GPIO21_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO21_CTRL        : aliased GPIO21_CTRL_Register;
      --  GPIO status
      GPIO22_STATUS      : aliased GPIO22_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO22_CTRL        : aliased GPIO22_CTRL_Register;
      --  GPIO status
      GPIO23_STATUS      : aliased GPIO23_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO23_CTRL        : aliased GPIO23_CTRL_Register;
      --  GPIO status
      GPIO24_STATUS      : aliased GPIO24_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO24_CTRL        : aliased GPIO24_CTRL_Register;
      --  GPIO status
      GPIO25_STATUS      : aliased GPIO25_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO25_CTRL        : aliased GPIO25_CTRL_Register;
      --  GPIO status
      GPIO26_STATUS      : aliased GPIO26_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO26_CTRL        : aliased GPIO26_CTRL_Register;
      --  GPIO status
      GPIO27_STATUS      : aliased GPIO27_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO27_CTRL        : aliased GPIO27_CTRL_Register;
      --  GPIO status
      GPIO28_STATUS      : aliased GPIO28_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO28_CTRL        : aliased GPIO28_CTRL_Register;
      --  GPIO status
      GPIO29_STATUS      : aliased GPIO29_STATUS_Register;
      --  GPIO control including function select and overrides.
      GPIO29_CTRL        : aliased GPIO29_CTRL_Register;
      --  Raw Interrupts
      INTR0              : aliased INTR0_Register;
      --  Raw Interrupts
      INTR1              : aliased INTR1_Register;
      --  Raw Interrupts
      INTR2              : aliased INTR2_Register;
      --  Raw Interrupts
      INTR3              : aliased INTR3_Register;
      --  Interrupt Enable for proc0
      PROC0_INTE0        : aliased PROC0_INTE0_Register;
      --  Interrupt Enable for proc0
      PROC0_INTE1        : aliased PROC0_INTE1_Register;
      --  Interrupt Enable for proc0
      PROC0_INTE2        : aliased PROC0_INTE2_Register;
      --  Interrupt Enable for proc0
      PROC0_INTE3        : aliased PROC0_INTE3_Register;
      --  Interrupt Force for proc0
      PROC0_INTF0        : aliased PROC0_INTF0_Register;
      --  Interrupt Force for proc0
      PROC0_INTF1        : aliased PROC0_INTF1_Register;
      --  Interrupt Force for proc0
      PROC0_INTF2        : aliased PROC0_INTF2_Register;
      --  Interrupt Force for proc0
      PROC0_INTF3        : aliased PROC0_INTF3_Register;
      --  Interrupt status after masking & forcing for proc0
      PROC0_INTS0        : aliased PROC0_INTS0_Register;
      --  Interrupt status after masking & forcing for proc0
      PROC0_INTS1        : aliased PROC0_INTS1_Register;
      --  Interrupt status after masking & forcing for proc0
      PROC0_INTS2        : aliased PROC0_INTS2_Register;
      --  Interrupt status after masking & forcing for proc0
      PROC0_INTS3        : aliased PROC0_INTS3_Register;
      --  Interrupt Enable for proc1
      PROC1_INTE0        : aliased PROC1_INTE0_Register;
      --  Interrupt Enable for proc1
      PROC1_INTE1        : aliased PROC1_INTE1_Register;
      --  Interrupt Enable for proc1
      PROC1_INTE2        : aliased PROC1_INTE2_Register;
      --  Interrupt Enable for proc1
      PROC1_INTE3        : aliased PROC1_INTE3_Register;
      --  Interrupt Force for proc1
      PROC1_INTF0        : aliased PROC1_INTF0_Register;
      --  Interrupt Force for proc1
      PROC1_INTF1        : aliased PROC1_INTF1_Register;
      --  Interrupt Force for proc1
      PROC1_INTF2        : aliased PROC1_INTF2_Register;
      --  Interrupt Force for proc1
      PROC1_INTF3        : aliased PROC1_INTF3_Register;
      --  Interrupt status after masking & forcing for proc1
      PROC1_INTS0        : aliased PROC1_INTS0_Register;
      --  Interrupt status after masking & forcing for proc1
      PROC1_INTS1        : aliased PROC1_INTS1_Register;
      --  Interrupt status after masking & forcing for proc1
      PROC1_INTS2        : aliased PROC1_INTS2_Register;
      --  Interrupt status after masking & forcing for proc1
      PROC1_INTS3        : aliased PROC1_INTS3_Register;
      --  Interrupt Enable for dormant_wake
      DORMANT_WAKE_INTE0 : aliased DORMANT_WAKE_INTE0_Register;
      --  Interrupt Enable for dormant_wake
      DORMANT_WAKE_INTE1 : aliased DORMANT_WAKE_INTE1_Register;
      --  Interrupt Enable for dormant_wake
      DORMANT_WAKE_INTE2 : aliased DORMANT_WAKE_INTE2_Register;
      --  Interrupt Enable for dormant_wake
      DORMANT_WAKE_INTE3 : aliased DORMANT_WAKE_INTE3_Register;
      --  Interrupt Force for dormant_wake
      DORMANT_WAKE_INTF0 : aliased DORMANT_WAKE_INTF0_Register;
      --  Interrupt Force for dormant_wake
      DORMANT_WAKE_INTF1 : aliased DORMANT_WAKE_INTF1_Register;
      --  Interrupt Force for dormant_wake
      DORMANT_WAKE_INTF2 : aliased DORMANT_WAKE_INTF2_Register;
      --  Interrupt Force for dormant_wake
      DORMANT_WAKE_INTF3 : aliased DORMANT_WAKE_INTF3_Register;
      --  Interrupt status after masking & forcing for dormant_wake
      DORMANT_WAKE_INTS0 : aliased DORMANT_WAKE_INTS0_Register;
      --  Interrupt status after masking & forcing for dormant_wake
      DORMANT_WAKE_INTS1 : aliased DORMANT_WAKE_INTS1_Register;
      --  Interrupt status after masking & forcing for dormant_wake
      DORMANT_WAKE_INTS2 : aliased DORMANT_WAKE_INTS2_Register;
      --  Interrupt status after masking & forcing for dormant_wake
      DORMANT_WAKE_INTS3 : aliased DORMANT_WAKE_INTS3_Register;
   end record
     with Volatile;

   for IO_BANK0_Peripheral use record
      GPIO0_STATUS       at 16#0# range 0 .. 31;
      GPIO0_CTRL         at 16#4# range 0 .. 31;
      GPIO1_STATUS       at 16#8# range 0 .. 31;
      GPIO1_CTRL         at 16#C# range 0 .. 31;
      GPIO2_STATUS       at 16#10# range 0 .. 31;
      GPIO2_CTRL         at 16#14# range 0 .. 31;
      GPIO3_STATUS       at 16#18# range 0 .. 31;
      GPIO3_CTRL         at 16#1C# range 0 .. 31;
      GPIO4_STATUS       at 16#20# range 0 .. 31;
      GPIO4_CTRL         at 16#24# range 0 .. 31;
      GPIO5_STATUS       at 16#28# range 0 .. 31;
      GPIO5_CTRL         at 16#2C# range 0 .. 31;
      GPIO6_STATUS       at 16#30# range 0 .. 31;
      GPIO6_CTRL         at 16#34# range 0 .. 31;
      GPIO7_STATUS       at 16#38# range 0 .. 31;
      GPIO7_CTRL         at 16#3C# range 0 .. 31;
      GPIO8_STATUS       at 16#40# range 0 .. 31;
      GPIO8_CTRL         at 16#44# range 0 .. 31;
      GPIO9_STATUS       at 16#48# range 0 .. 31;
      GPIO9_CTRL         at 16#4C# range 0 .. 31;
      GPIO10_STATUS      at 16#50# range 0 .. 31;
      GPIO10_CTRL        at 16#54# range 0 .. 31;
      GPIO11_STATUS      at 16#58# range 0 .. 31;
      GPIO11_CTRL        at 16#5C# range 0 .. 31;
      GPIO12_STATUS      at 16#60# range 0 .. 31;
      GPIO12_CTRL        at 16#64# range 0 .. 31;
      GPIO13_STATUS      at 16#68# range 0 .. 31;
      GPIO13_CTRL        at 16#6C# range 0 .. 31;
      GPIO14_STATUS      at 16#70# range 0 .. 31;
      GPIO14_CTRL        at 16#74# range 0 .. 31;
      GPIO15_STATUS      at 16#78# range 0 .. 31;
      GPIO15_CTRL        at 16#7C# range 0 .. 31;
      GPIO16_STATUS      at 16#80# range 0 .. 31;
      GPIO16_CTRL        at 16#84# range 0 .. 31;
      GPIO17_STATUS      at 16#88# range 0 .. 31;
      GPIO17_CTRL        at 16#8C# range 0 .. 31;
      GPIO18_STATUS      at 16#90# range 0 .. 31;
      GPIO18_CTRL        at 16#94# range 0 .. 31;
      GPIO19_STATUS      at 16#98# range 0 .. 31;
      GPIO19_CTRL        at 16#9C# range 0 .. 31;
      GPIO20_STATUS      at 16#A0# range 0 .. 31;
      GPIO20_CTRL        at 16#A4# range 0 .. 31;
      GPIO21_STATUS      at 16#A8# range 0 .. 31;
      GPIO21_CTRL        at 16#AC# range 0 .. 31;
      GPIO22_STATUS      at 16#B0# range 0 .. 31;
      GPIO22_CTRL        at 16#B4# range 0 .. 31;
      GPIO23_STATUS      at 16#B8# range 0 .. 31;
      GPIO23_CTRL        at 16#BC# range 0 .. 31;
      GPIO24_STATUS      at 16#C0# range 0 .. 31;
      GPIO24_CTRL        at 16#C4# range 0 .. 31;
      GPIO25_STATUS      at 16#C8# range 0 .. 31;
      GPIO25_CTRL        at 16#CC# range 0 .. 31;
      GPIO26_STATUS      at 16#D0# range 0 .. 31;
      GPIO26_CTRL        at 16#D4# range 0 .. 31;
      GPIO27_STATUS      at 16#D8# range 0 .. 31;
      GPIO27_CTRL        at 16#DC# range 0 .. 31;
      GPIO28_STATUS      at 16#E0# range 0 .. 31;
      GPIO28_CTRL        at 16#E4# range 0 .. 31;
      GPIO29_STATUS      at 16#E8# range 0 .. 31;
      GPIO29_CTRL        at 16#EC# range 0 .. 31;
      INTR0              at 16#F0# range 0 .. 31;
      INTR1              at 16#F4# range 0 .. 31;
      INTR2              at 16#F8# range 0 .. 31;
      INTR3              at 16#FC# range 0 .. 31;
      PROC0_INTE0        at 16#100# range 0 .. 31;
      PROC0_INTE1        at 16#104# range 0 .. 31;
      PROC0_INTE2        at 16#108# range 0 .. 31;
      PROC0_INTE3        at 16#10C# range 0 .. 31;
      PROC0_INTF0        at 16#110# range 0 .. 31;
      PROC0_INTF1        at 16#114# range 0 .. 31;
      PROC0_INTF2        at 16#118# range 0 .. 31;
      PROC0_INTF3        at 16#11C# range 0 .. 31;
      PROC0_INTS0        at 16#120# range 0 .. 31;
      PROC0_INTS1        at 16#124# range 0 .. 31;
      PROC0_INTS2        at 16#128# range 0 .. 31;
      PROC0_INTS3        at 16#12C# range 0 .. 31;
      PROC1_INTE0        at 16#130# range 0 .. 31;
      PROC1_INTE1        at 16#134# range 0 .. 31;
      PROC1_INTE2        at 16#138# range 0 .. 31;
      PROC1_INTE3        at 16#13C# range 0 .. 31;
      PROC1_INTF0        at 16#140# range 0 .. 31;
      PROC1_INTF1        at 16#144# range 0 .. 31;
      PROC1_INTF2        at 16#148# range 0 .. 31;
      PROC1_INTF3        at 16#14C# range 0 .. 31;
      PROC1_INTS0        at 16#150# range 0 .. 31;
      PROC1_INTS1        at 16#154# range 0 .. 31;
      PROC1_INTS2        at 16#158# range 0 .. 31;
      PROC1_INTS3        at 16#15C# range 0 .. 31;
      DORMANT_WAKE_INTE0 at 16#160# range 0 .. 31;
      DORMANT_WAKE_INTE1 at 16#164# range 0 .. 31;
      DORMANT_WAKE_INTE2 at 16#168# range 0 .. 31;
      DORMANT_WAKE_INTE3 at 16#16C# range 0 .. 31;
      DORMANT_WAKE_INTF0 at 16#170# range 0 .. 31;
      DORMANT_WAKE_INTF1 at 16#174# range 0 .. 31;
      DORMANT_WAKE_INTF2 at 16#178# range 0 .. 31;
      DORMANT_WAKE_INTF3 at 16#17C# range 0 .. 31;
      DORMANT_WAKE_INTS0 at 16#180# range 0 .. 31;
      DORMANT_WAKE_INTS1 at 16#184# range 0 .. 31;
      DORMANT_WAKE_INTS2 at 16#188# range 0 .. 31;
      DORMANT_WAKE_INTS3 at 16#18C# range 0 .. 31;
   end record;

   IO_BANK0_Periph : aliased IO_BANK0_Peripheral
     with Import, Address => IO_BANK0_Base;

end RP2040_SVD.IO_BANK0;
