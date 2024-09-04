pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package RP2350_SVD.IO_QSPI is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   type USBPHY_DP_STATUS_Register is record
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

   for USBPHY_DP_STATUS_Register use record
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
   type USBPHY_DP_CTRL_FUNCSEL_Field is
     (uart1_tx,
      i2c0_sda,
      siob_proc_56,
      null_k)
     with Size => 5;
   for USBPHY_DP_CTRL_FUNCSEL_Field use
     (uart1_tx => 2,
      i2c0_sda => 3,
      siob_proc_56 => 5,
      null_k => 31);

   type USBPHY_DP_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for USBPHY_DP_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type USBPHY_DP_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for USBPHY_DP_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type USBPHY_DP_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for USBPHY_DP_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type USBPHY_DP_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for USBPHY_DP_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type USBPHY_DP_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : USBPHY_DP_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_QSPI.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : USBPHY_DP_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      OEOVER         : USBPHY_DP_CTRL_OEOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      INOVER         : USBPHY_DP_CTRL_INOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : USBPHY_DP_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for USBPHY_DP_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type USBPHY_DM_STATUS_Register is record
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

   for USBPHY_DM_STATUS_Register use record
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
   type USBPHY_DM_CTRL_FUNCSEL_Field is
     (uart1_rx,
      i2c0_scl,
      siob_proc_57,
      null_k)
     with Size => 5;
   for USBPHY_DM_CTRL_FUNCSEL_Field use
     (uart1_rx => 2,
      i2c0_scl => 3,
      siob_proc_57 => 5,
      null_k => 31);

   type USBPHY_DM_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for USBPHY_DM_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type USBPHY_DM_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for USBPHY_DM_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type USBPHY_DM_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for USBPHY_DM_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type USBPHY_DM_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for USBPHY_DM_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type USBPHY_DM_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : USBPHY_DM_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_QSPI.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : USBPHY_DM_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      OEOVER         : USBPHY_DM_CTRL_OEOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      INOVER         : USBPHY_DM_CTRL_INOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : USBPHY_DM_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for USBPHY_DM_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO_QSPI_SCLK_STATUS_Register is record
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

   for GPIO_QSPI_SCLK_STATUS_Register use record
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
   type GPIO_QSPI_SCLK_CTRL_FUNCSEL_Field is
     (xip_sclk,
      uart1_cts,
      i2c1_sda,
      siob_proc_58,
      uart1_tx,
      null_k)
     with Size => 5;
   for GPIO_QSPI_SCLK_CTRL_FUNCSEL_Field use
     (xip_sclk => 0,
      uart1_cts => 2,
      i2c1_sda => 3,
      siob_proc_58 => 5,
      uart1_tx => 11,
      null_k => 31);

   type GPIO_QSPI_SCLK_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO_QSPI_SCLK_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO_QSPI_SCLK_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO_QSPI_SCLK_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO_QSPI_SCLK_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO_QSPI_SCLK_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO_QSPI_SCLK_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO_QSPI_SCLK_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO_QSPI_SCLK_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO_QSPI_SCLK_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_QSPI.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO_QSPI_SCLK_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      OEOVER         : GPIO_QSPI_SCLK_CTRL_OEOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      INOVER         : GPIO_QSPI_SCLK_CTRL_INOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO_QSPI_SCLK_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO_QSPI_SCLK_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO_QSPI_SS_STATUS_Register is record
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

   for GPIO_QSPI_SS_STATUS_Register use record
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
   type GPIO_QSPI_SS_CTRL_FUNCSEL_Field is
     (xip_ss_n_0,
      uart1_rts,
      i2c1_scl,
      siob_proc_59,
      uart1_rx,
      null_k)
     with Size => 5;
   for GPIO_QSPI_SS_CTRL_FUNCSEL_Field use
     (xip_ss_n_0 => 0,
      uart1_rts => 2,
      i2c1_scl => 3,
      siob_proc_59 => 5,
      uart1_rx => 11,
      null_k => 31);

   type GPIO_QSPI_SS_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO_QSPI_SS_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO_QSPI_SS_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO_QSPI_SS_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO_QSPI_SS_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO_QSPI_SS_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO_QSPI_SS_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO_QSPI_SS_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO_QSPI_SS_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO_QSPI_SS_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_QSPI.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO_QSPI_SS_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      OEOVER         : GPIO_QSPI_SS_CTRL_OEOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      INOVER         : GPIO_QSPI_SS_CTRL_INOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO_QSPI_SS_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO_QSPI_SS_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO_QSPI_SD0_STATUS_Register is record
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

   for GPIO_QSPI_SD0_STATUS_Register use record
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
   type GPIO_QSPI_SD0_CTRL_FUNCSEL_Field is
     (xip_sd0,
      uart0_tx,
      i2c0_sda,
      siob_proc_60,
      null_k)
     with Size => 5;
   for GPIO_QSPI_SD0_CTRL_FUNCSEL_Field use
     (xip_sd0 => 0,
      uart0_tx => 2,
      i2c0_sda => 3,
      siob_proc_60 => 5,
      null_k => 31);

   type GPIO_QSPI_SD0_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO_QSPI_SD0_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO_QSPI_SD0_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO_QSPI_SD0_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO_QSPI_SD0_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO_QSPI_SD0_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO_QSPI_SD0_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO_QSPI_SD0_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO_QSPI_SD0_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO_QSPI_SD0_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_QSPI.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO_QSPI_SD0_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      OEOVER         : GPIO_QSPI_SD0_CTRL_OEOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      INOVER         : GPIO_QSPI_SD0_CTRL_INOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO_QSPI_SD0_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO_QSPI_SD0_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO_QSPI_SD1_STATUS_Register is record
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

   for GPIO_QSPI_SD1_STATUS_Register use record
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
   type GPIO_QSPI_SD1_CTRL_FUNCSEL_Field is
     (xip_sd1,
      uart0_rx,
      i2c0_scl,
      siob_proc_61,
      null_k)
     with Size => 5;
   for GPIO_QSPI_SD1_CTRL_FUNCSEL_Field use
     (xip_sd1 => 0,
      uart0_rx => 2,
      i2c0_scl => 3,
      siob_proc_61 => 5,
      null_k => 31);

   type GPIO_QSPI_SD1_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO_QSPI_SD1_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO_QSPI_SD1_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO_QSPI_SD1_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO_QSPI_SD1_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO_QSPI_SD1_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO_QSPI_SD1_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO_QSPI_SD1_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO_QSPI_SD1_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO_QSPI_SD1_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_QSPI.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO_QSPI_SD1_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      OEOVER         : GPIO_QSPI_SD1_CTRL_OEOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      INOVER         : GPIO_QSPI_SD1_CTRL_INOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO_QSPI_SD1_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO_QSPI_SD1_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO_QSPI_SD2_STATUS_Register is record
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

   for GPIO_QSPI_SD2_STATUS_Register use record
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
   type GPIO_QSPI_SD2_CTRL_FUNCSEL_Field is
     (xip_sd2,
      uart0_cts,
      i2c1_sda,
      siob_proc_62,
      uart0_tx,
      null_k)
     with Size => 5;
   for GPIO_QSPI_SD2_CTRL_FUNCSEL_Field use
     (xip_sd2 => 0,
      uart0_cts => 2,
      i2c1_sda => 3,
      siob_proc_62 => 5,
      uart0_tx => 11,
      null_k => 31);

   type GPIO_QSPI_SD2_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO_QSPI_SD2_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO_QSPI_SD2_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO_QSPI_SD2_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO_QSPI_SD2_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO_QSPI_SD2_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO_QSPI_SD2_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO_QSPI_SD2_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO_QSPI_SD2_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO_QSPI_SD2_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_QSPI.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO_QSPI_SD2_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      OEOVER         : GPIO_QSPI_SD2_CTRL_OEOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      INOVER         : GPIO_QSPI_SD2_CTRL_INOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO_QSPI_SD2_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO_QSPI_SD2_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   type GPIO_QSPI_SD3_STATUS_Register is record
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

   for GPIO_QSPI_SD3_STATUS_Register use record
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
   type GPIO_QSPI_SD3_CTRL_FUNCSEL_Field is
     (xip_sd3,
      uart0_rts,
      i2c1_scl,
      siob_proc_63,
      uart0_rx,
      null_k)
     with Size => 5;
   for GPIO_QSPI_SD3_CTRL_FUNCSEL_Field use
     (xip_sd3 => 0,
      uart0_rts => 2,
      i2c1_scl => 3,
      siob_proc_63 => 5,
      uart0_rx => 11,
      null_k => 31);

   type GPIO_QSPI_SD3_CTRL_OUTOVER_Field is
     (--  drive output from peripheral signal selected by funcsel
      NORMAL,
      --  drive output from inverse of peripheral signal selected by funcsel
      INVERT,
      --  drive output low
      LOW,
      --  drive output high
      HIGH)
     with Size => 2;
   for GPIO_QSPI_SD3_CTRL_OUTOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO_QSPI_SD3_CTRL_OEOVER_Field is
     (--  drive output enable from peripheral signal selected by funcsel
      NORMAL,
      --  drive output enable from inverse of peripheral signal selected by funcsel
      INVERT,
      --  disable output
      DISABLE,
      --  enable output
      ENABLE)
     with Size => 2;
   for GPIO_QSPI_SD3_CTRL_OEOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      DISABLE => 2,
      ENABLE => 3);

   type GPIO_QSPI_SD3_CTRL_INOVER_Field is
     (--  don't invert the peri input
      NORMAL,
      --  invert the peri input
      INVERT,
      --  drive peri input low
      LOW,
      --  drive peri input high
      HIGH)
     with Size => 2;
   for GPIO_QSPI_SD3_CTRL_INOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO_QSPI_SD3_CTRL_IRQOVER_Field is
     (--  don't invert the interrupt
      NORMAL,
      --  invert the interrupt
      INVERT,
      --  drive interrupt low
      LOW,
      --  drive interrupt high
      HIGH)
     with Size => 2;
   for GPIO_QSPI_SD3_CTRL_IRQOVER_Field use
     (NORMAL => 0,
      INVERT => 1,
      LOW => 2,
      HIGH => 3);

   type GPIO_QSPI_SD3_CTRL_Register is record
      --  0-31 -> selects pin function according to the gpio table 31 == NULL
      FUNCSEL        : GPIO_QSPI_SD3_CTRL_FUNCSEL_Field :=
                        RP2350_SVD.IO_QSPI.null_k;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      OUTOVER        : GPIO_QSPI_SD3_CTRL_OUTOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      OEOVER         : GPIO_QSPI_SD3_CTRL_OEOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      INOVER         : GPIO_QSPI_SD3_CTRL_INOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      --  unspecified
      Reserved_18_27 : HAL.UInt10 := 16#0#;
      IRQOVER        : GPIO_QSPI_SD3_CTRL_IRQOVER_Field :=
                        RP2350_SVD.IO_QSPI.NORMAL;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO_QSPI_SD3_CTRL_Register use record
      FUNCSEL        at 0 range 0 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      OUTOVER        at 0 range 12 .. 13;
      OEOVER         at 0 range 14 .. 15;
      INOVER         at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      IRQOVER        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  IRQSUMMARY_PROC0_SECURE_GPIO_QSPI_SD array
   type IRQSUMMARY_PROC0_SECURE_GPIO_QSPI_SD_Field_Array is array (0 .. 3)
     of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for IRQSUMMARY_PROC0_SECURE_GPIO_QSPI_SD
   type IRQSUMMARY_PROC0_SECURE_GPIO_QSPI_SD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  GPIO_QSPI_SD as a value
            Val : HAL.UInt4;
         when True =>
            --  GPIO_QSPI_SD as an array
            Arr : IRQSUMMARY_PROC0_SECURE_GPIO_QSPI_SD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IRQSUMMARY_PROC0_SECURE_GPIO_QSPI_SD_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   type IRQSUMMARY_PROC0_SECURE_Register is record
      --  Read-only.
      USBPHY_DP      : Boolean;
      --  Read-only.
      USBPHY_DM      : Boolean;
      --  Read-only.
      GPIO_QSPI_SCLK : Boolean;
      --  Read-only.
      GPIO_QSPI_SS   : Boolean;
      --  Read-only.
      GPIO_QSPI_SD   : IRQSUMMARY_PROC0_SECURE_GPIO_QSPI_SD_Field;
      --  unspecified
      Reserved_8_31  : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRQSUMMARY_PROC0_SECURE_Register use record
      USBPHY_DP      at 0 range 0 .. 0;
      USBPHY_DM      at 0 range 1 .. 1;
      GPIO_QSPI_SCLK at 0 range 2 .. 2;
      GPIO_QSPI_SS   at 0 range 3 .. 3;
      GPIO_QSPI_SD   at 0 range 4 .. 7;
      Reserved_8_31  at 0 range 8 .. 31;
   end record;

   --  IRQSUMMARY_PROC0_NONSECURE_GPIO_QSPI_SD array
   type IRQSUMMARY_PROC0_NONSECURE_GPIO_QSPI_SD_Field_Array is array (0 .. 3)
     of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for IRQSUMMARY_PROC0_NONSECURE_GPIO_QSPI_SD
   type IRQSUMMARY_PROC0_NONSECURE_GPIO_QSPI_SD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  GPIO_QSPI_SD as a value
            Val : HAL.UInt4;
         when True =>
            --  GPIO_QSPI_SD as an array
            Arr : IRQSUMMARY_PROC0_NONSECURE_GPIO_QSPI_SD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IRQSUMMARY_PROC0_NONSECURE_GPIO_QSPI_SD_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   type IRQSUMMARY_PROC0_NONSECURE_Register is record
      --  Read-only.
      USBPHY_DP      : Boolean;
      --  Read-only.
      USBPHY_DM      : Boolean;
      --  Read-only.
      GPIO_QSPI_SCLK : Boolean;
      --  Read-only.
      GPIO_QSPI_SS   : Boolean;
      --  Read-only.
      GPIO_QSPI_SD   : IRQSUMMARY_PROC0_NONSECURE_GPIO_QSPI_SD_Field;
      --  unspecified
      Reserved_8_31  : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRQSUMMARY_PROC0_NONSECURE_Register use record
      USBPHY_DP      at 0 range 0 .. 0;
      USBPHY_DM      at 0 range 1 .. 1;
      GPIO_QSPI_SCLK at 0 range 2 .. 2;
      GPIO_QSPI_SS   at 0 range 3 .. 3;
      GPIO_QSPI_SD   at 0 range 4 .. 7;
      Reserved_8_31  at 0 range 8 .. 31;
   end record;

   --  IRQSUMMARY_PROC1_SECURE_GPIO_QSPI_SD array
   type IRQSUMMARY_PROC1_SECURE_GPIO_QSPI_SD_Field_Array is array (0 .. 3)
     of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for IRQSUMMARY_PROC1_SECURE_GPIO_QSPI_SD
   type IRQSUMMARY_PROC1_SECURE_GPIO_QSPI_SD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  GPIO_QSPI_SD as a value
            Val : HAL.UInt4;
         when True =>
            --  GPIO_QSPI_SD as an array
            Arr : IRQSUMMARY_PROC1_SECURE_GPIO_QSPI_SD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IRQSUMMARY_PROC1_SECURE_GPIO_QSPI_SD_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   type IRQSUMMARY_PROC1_SECURE_Register is record
      --  Read-only.
      USBPHY_DP      : Boolean;
      --  Read-only.
      USBPHY_DM      : Boolean;
      --  Read-only.
      GPIO_QSPI_SCLK : Boolean;
      --  Read-only.
      GPIO_QSPI_SS   : Boolean;
      --  Read-only.
      GPIO_QSPI_SD   : IRQSUMMARY_PROC1_SECURE_GPIO_QSPI_SD_Field;
      --  unspecified
      Reserved_8_31  : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRQSUMMARY_PROC1_SECURE_Register use record
      USBPHY_DP      at 0 range 0 .. 0;
      USBPHY_DM      at 0 range 1 .. 1;
      GPIO_QSPI_SCLK at 0 range 2 .. 2;
      GPIO_QSPI_SS   at 0 range 3 .. 3;
      GPIO_QSPI_SD   at 0 range 4 .. 7;
      Reserved_8_31  at 0 range 8 .. 31;
   end record;

   --  IRQSUMMARY_PROC1_NONSECURE_GPIO_QSPI_SD array
   type IRQSUMMARY_PROC1_NONSECURE_GPIO_QSPI_SD_Field_Array is array (0 .. 3)
     of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for IRQSUMMARY_PROC1_NONSECURE_GPIO_QSPI_SD
   type IRQSUMMARY_PROC1_NONSECURE_GPIO_QSPI_SD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  GPIO_QSPI_SD as a value
            Val : HAL.UInt4;
         when True =>
            --  GPIO_QSPI_SD as an array
            Arr : IRQSUMMARY_PROC1_NONSECURE_GPIO_QSPI_SD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IRQSUMMARY_PROC1_NONSECURE_GPIO_QSPI_SD_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   type IRQSUMMARY_PROC1_NONSECURE_Register is record
      --  Read-only.
      USBPHY_DP      : Boolean;
      --  Read-only.
      USBPHY_DM      : Boolean;
      --  Read-only.
      GPIO_QSPI_SCLK : Boolean;
      --  Read-only.
      GPIO_QSPI_SS   : Boolean;
      --  Read-only.
      GPIO_QSPI_SD   : IRQSUMMARY_PROC1_NONSECURE_GPIO_QSPI_SD_Field;
      --  unspecified
      Reserved_8_31  : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRQSUMMARY_PROC1_NONSECURE_Register use record
      USBPHY_DP      at 0 range 0 .. 0;
      USBPHY_DM      at 0 range 1 .. 1;
      GPIO_QSPI_SCLK at 0 range 2 .. 2;
      GPIO_QSPI_SS   at 0 range 3 .. 3;
      GPIO_QSPI_SD   at 0 range 4 .. 7;
      Reserved_8_31  at 0 range 8 .. 31;
   end record;

   --  IRQSUMMARY_DORMANT_WAKE_SECURE_GPIO_QSPI_SD array
   type IRQSUMMARY_DORMANT_WAKE_SECURE_GPIO_QSPI_SD_Field_Array is array (0 .. 3)
     of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for IRQSUMMARY_DORMANT_WAKE_SECURE_GPIO_QSPI_SD
   type IRQSUMMARY_DORMANT_WAKE_SECURE_GPIO_QSPI_SD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  GPIO_QSPI_SD as a value
            Val : HAL.UInt4;
         when True =>
            --  GPIO_QSPI_SD as an array
            Arr : IRQSUMMARY_DORMANT_WAKE_SECURE_GPIO_QSPI_SD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IRQSUMMARY_DORMANT_WAKE_SECURE_GPIO_QSPI_SD_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   type IRQSUMMARY_DORMANT_WAKE_SECURE_Register is record
      --  Read-only.
      USBPHY_DP      : Boolean;
      --  Read-only.
      USBPHY_DM      : Boolean;
      --  Read-only.
      GPIO_QSPI_SCLK : Boolean;
      --  Read-only.
      GPIO_QSPI_SS   : Boolean;
      --  Read-only.
      GPIO_QSPI_SD   : IRQSUMMARY_DORMANT_WAKE_SECURE_GPIO_QSPI_SD_Field;
      --  unspecified
      Reserved_8_31  : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRQSUMMARY_DORMANT_WAKE_SECURE_Register use record
      USBPHY_DP      at 0 range 0 .. 0;
      USBPHY_DM      at 0 range 1 .. 1;
      GPIO_QSPI_SCLK at 0 range 2 .. 2;
      GPIO_QSPI_SS   at 0 range 3 .. 3;
      GPIO_QSPI_SD   at 0 range 4 .. 7;
      Reserved_8_31  at 0 range 8 .. 31;
   end record;

   --  IRQSUMMARY_DORMANT_WAKE_NONSECURE_GPIO_QSPI_SD array
   type IRQSUMMARY_DORMANT_WAKE_NONSECURE_GPIO_QSPI_SD_Field_Array is array (0 .. 3)
     of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for IRQSUMMARY_DORMANT_WAKE_NONSECURE_GPIO_QSPI_SD
   type IRQSUMMARY_DORMANT_WAKE_NONSECURE_GPIO_QSPI_SD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  GPIO_QSPI_SD as a value
            Val : HAL.UInt4;
         when True =>
            --  GPIO_QSPI_SD as an array
            Arr : IRQSUMMARY_DORMANT_WAKE_NONSECURE_GPIO_QSPI_SD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IRQSUMMARY_DORMANT_WAKE_NONSECURE_GPIO_QSPI_SD_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   type IRQSUMMARY_DORMANT_WAKE_NONSECURE_Register is record
      --  Read-only.
      USBPHY_DP      : Boolean;
      --  Read-only.
      USBPHY_DM      : Boolean;
      --  Read-only.
      GPIO_QSPI_SCLK : Boolean;
      --  Read-only.
      GPIO_QSPI_SS   : Boolean;
      --  Read-only.
      GPIO_QSPI_SD   : IRQSUMMARY_DORMANT_WAKE_NONSECURE_GPIO_QSPI_SD_Field;
      --  unspecified
      Reserved_8_31  : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRQSUMMARY_DORMANT_WAKE_NONSECURE_Register use record
      USBPHY_DP      at 0 range 0 .. 0;
      USBPHY_DM      at 0 range 1 .. 1;
      GPIO_QSPI_SCLK at 0 range 2 .. 2;
      GPIO_QSPI_SS   at 0 range 3 .. 3;
      GPIO_QSPI_SD   at 0 range 4 .. 7;
      Reserved_8_31  at 0 range 8 .. 31;
   end record;

   --  Raw Interrupts
   type INTR_Register is record
      --  Read-only.
      USBPHY_DP_LEVEL_LOW       : Boolean := False;
      --  Read-only.
      USBPHY_DP_LEVEL_HIGH      : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      USBPHY_DP_EDGE_LOW        : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      USBPHY_DP_EDGE_HIGH       : Boolean := False;
      --  Read-only.
      USBPHY_DM_LEVEL_LOW       : Boolean := False;
      --  Read-only.
      USBPHY_DM_LEVEL_HIGH      : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      USBPHY_DM_EDGE_LOW        : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      USBPHY_DM_EDGE_HIGH       : Boolean := False;
      --  Read-only.
      GPIO_QSPI_SCLK_LEVEL_LOW  : Boolean := False;
      --  Read-only.
      GPIO_QSPI_SCLK_LEVEL_HIGH : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO_QSPI_SCLK_EDGE_LOW   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO_QSPI_SCLK_EDGE_HIGH  : Boolean := False;
      --  Read-only.
      GPIO_QSPI_SS_LEVEL_LOW    : Boolean := False;
      --  Read-only.
      GPIO_QSPI_SS_LEVEL_HIGH   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO_QSPI_SS_EDGE_LOW     : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO_QSPI_SS_EDGE_HIGH    : Boolean := False;
      --  Read-only.
      GPIO_QSPI_SD0_LEVEL_LOW   : Boolean := False;
      --  Read-only.
      GPIO_QSPI_SD0_LEVEL_HIGH  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO_QSPI_SD0_EDGE_LOW    : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO_QSPI_SD0_EDGE_HIGH   : Boolean := False;
      --  Read-only.
      GPIO_QSPI_SD1_LEVEL_LOW   : Boolean := False;
      --  Read-only.
      GPIO_QSPI_SD1_LEVEL_HIGH  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO_QSPI_SD1_EDGE_LOW    : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO_QSPI_SD1_EDGE_HIGH   : Boolean := False;
      --  Read-only.
      GPIO_QSPI_SD2_LEVEL_LOW   : Boolean := False;
      --  Read-only.
      GPIO_QSPI_SD2_LEVEL_HIGH  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO_QSPI_SD2_EDGE_LOW    : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO_QSPI_SD2_EDGE_HIGH   : Boolean := False;
      --  Read-only.
      GPIO_QSPI_SD3_LEVEL_LOW   : Boolean := False;
      --  Read-only.
      GPIO_QSPI_SD3_LEVEL_HIGH  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO_QSPI_SD3_EDGE_LOW    : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      GPIO_QSPI_SD3_EDGE_HIGH   : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTR_Register use record
      USBPHY_DP_LEVEL_LOW       at 0 range 0 .. 0;
      USBPHY_DP_LEVEL_HIGH      at 0 range 1 .. 1;
      USBPHY_DP_EDGE_LOW        at 0 range 2 .. 2;
      USBPHY_DP_EDGE_HIGH       at 0 range 3 .. 3;
      USBPHY_DM_LEVEL_LOW       at 0 range 4 .. 4;
      USBPHY_DM_LEVEL_HIGH      at 0 range 5 .. 5;
      USBPHY_DM_EDGE_LOW        at 0 range 6 .. 6;
      USBPHY_DM_EDGE_HIGH       at 0 range 7 .. 7;
      GPIO_QSPI_SCLK_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO_QSPI_SCLK_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO_QSPI_SCLK_EDGE_LOW   at 0 range 10 .. 10;
      GPIO_QSPI_SCLK_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO_QSPI_SS_LEVEL_LOW    at 0 range 12 .. 12;
      GPIO_QSPI_SS_LEVEL_HIGH   at 0 range 13 .. 13;
      GPIO_QSPI_SS_EDGE_LOW     at 0 range 14 .. 14;
      GPIO_QSPI_SS_EDGE_HIGH    at 0 range 15 .. 15;
      GPIO_QSPI_SD0_LEVEL_LOW   at 0 range 16 .. 16;
      GPIO_QSPI_SD0_LEVEL_HIGH  at 0 range 17 .. 17;
      GPIO_QSPI_SD0_EDGE_LOW    at 0 range 18 .. 18;
      GPIO_QSPI_SD0_EDGE_HIGH   at 0 range 19 .. 19;
      GPIO_QSPI_SD1_LEVEL_LOW   at 0 range 20 .. 20;
      GPIO_QSPI_SD1_LEVEL_HIGH  at 0 range 21 .. 21;
      GPIO_QSPI_SD1_EDGE_LOW    at 0 range 22 .. 22;
      GPIO_QSPI_SD1_EDGE_HIGH   at 0 range 23 .. 23;
      GPIO_QSPI_SD2_LEVEL_LOW   at 0 range 24 .. 24;
      GPIO_QSPI_SD2_LEVEL_HIGH  at 0 range 25 .. 25;
      GPIO_QSPI_SD2_EDGE_LOW    at 0 range 26 .. 26;
      GPIO_QSPI_SD2_EDGE_HIGH   at 0 range 27 .. 27;
      GPIO_QSPI_SD3_LEVEL_LOW   at 0 range 28 .. 28;
      GPIO_QSPI_SD3_LEVEL_HIGH  at 0 range 29 .. 29;
      GPIO_QSPI_SD3_EDGE_LOW    at 0 range 30 .. 30;
      GPIO_QSPI_SD3_EDGE_HIGH   at 0 range 31 .. 31;
   end record;

   --  Interrupt Enable for proc0
   type PROC0_INTE_Register is record
      USBPHY_DP_LEVEL_LOW       : Boolean := False;
      USBPHY_DP_LEVEL_HIGH      : Boolean := False;
      USBPHY_DP_EDGE_LOW        : Boolean := False;
      USBPHY_DP_EDGE_HIGH       : Boolean := False;
      USBPHY_DM_LEVEL_LOW       : Boolean := False;
      USBPHY_DM_LEVEL_HIGH      : Boolean := False;
      USBPHY_DM_EDGE_LOW        : Boolean := False;
      USBPHY_DM_EDGE_HIGH       : Boolean := False;
      GPIO_QSPI_SCLK_LEVEL_LOW  : Boolean := False;
      GPIO_QSPI_SCLK_LEVEL_HIGH : Boolean := False;
      GPIO_QSPI_SCLK_EDGE_LOW   : Boolean := False;
      GPIO_QSPI_SCLK_EDGE_HIGH  : Boolean := False;
      GPIO_QSPI_SS_LEVEL_LOW    : Boolean := False;
      GPIO_QSPI_SS_LEVEL_HIGH   : Boolean := False;
      GPIO_QSPI_SS_EDGE_LOW     : Boolean := False;
      GPIO_QSPI_SS_EDGE_HIGH    : Boolean := False;
      GPIO_QSPI_SD0_LEVEL_LOW   : Boolean := False;
      GPIO_QSPI_SD0_LEVEL_HIGH  : Boolean := False;
      GPIO_QSPI_SD0_EDGE_LOW    : Boolean := False;
      GPIO_QSPI_SD0_EDGE_HIGH   : Boolean := False;
      GPIO_QSPI_SD1_LEVEL_LOW   : Boolean := False;
      GPIO_QSPI_SD1_LEVEL_HIGH  : Boolean := False;
      GPIO_QSPI_SD1_EDGE_LOW    : Boolean := False;
      GPIO_QSPI_SD1_EDGE_HIGH   : Boolean := False;
      GPIO_QSPI_SD2_LEVEL_LOW   : Boolean := False;
      GPIO_QSPI_SD2_LEVEL_HIGH  : Boolean := False;
      GPIO_QSPI_SD2_EDGE_LOW    : Boolean := False;
      GPIO_QSPI_SD2_EDGE_HIGH   : Boolean := False;
      GPIO_QSPI_SD3_LEVEL_LOW   : Boolean := False;
      GPIO_QSPI_SD3_LEVEL_HIGH  : Boolean := False;
      GPIO_QSPI_SD3_EDGE_LOW    : Boolean := False;
      GPIO_QSPI_SD3_EDGE_HIGH   : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC0_INTE_Register use record
      USBPHY_DP_LEVEL_LOW       at 0 range 0 .. 0;
      USBPHY_DP_LEVEL_HIGH      at 0 range 1 .. 1;
      USBPHY_DP_EDGE_LOW        at 0 range 2 .. 2;
      USBPHY_DP_EDGE_HIGH       at 0 range 3 .. 3;
      USBPHY_DM_LEVEL_LOW       at 0 range 4 .. 4;
      USBPHY_DM_LEVEL_HIGH      at 0 range 5 .. 5;
      USBPHY_DM_EDGE_LOW        at 0 range 6 .. 6;
      USBPHY_DM_EDGE_HIGH       at 0 range 7 .. 7;
      GPIO_QSPI_SCLK_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO_QSPI_SCLK_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO_QSPI_SCLK_EDGE_LOW   at 0 range 10 .. 10;
      GPIO_QSPI_SCLK_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO_QSPI_SS_LEVEL_LOW    at 0 range 12 .. 12;
      GPIO_QSPI_SS_LEVEL_HIGH   at 0 range 13 .. 13;
      GPIO_QSPI_SS_EDGE_LOW     at 0 range 14 .. 14;
      GPIO_QSPI_SS_EDGE_HIGH    at 0 range 15 .. 15;
      GPIO_QSPI_SD0_LEVEL_LOW   at 0 range 16 .. 16;
      GPIO_QSPI_SD0_LEVEL_HIGH  at 0 range 17 .. 17;
      GPIO_QSPI_SD0_EDGE_LOW    at 0 range 18 .. 18;
      GPIO_QSPI_SD0_EDGE_HIGH   at 0 range 19 .. 19;
      GPIO_QSPI_SD1_LEVEL_LOW   at 0 range 20 .. 20;
      GPIO_QSPI_SD1_LEVEL_HIGH  at 0 range 21 .. 21;
      GPIO_QSPI_SD1_EDGE_LOW    at 0 range 22 .. 22;
      GPIO_QSPI_SD1_EDGE_HIGH   at 0 range 23 .. 23;
      GPIO_QSPI_SD2_LEVEL_LOW   at 0 range 24 .. 24;
      GPIO_QSPI_SD2_LEVEL_HIGH  at 0 range 25 .. 25;
      GPIO_QSPI_SD2_EDGE_LOW    at 0 range 26 .. 26;
      GPIO_QSPI_SD2_EDGE_HIGH   at 0 range 27 .. 27;
      GPIO_QSPI_SD3_LEVEL_LOW   at 0 range 28 .. 28;
      GPIO_QSPI_SD3_LEVEL_HIGH  at 0 range 29 .. 29;
      GPIO_QSPI_SD3_EDGE_LOW    at 0 range 30 .. 30;
      GPIO_QSPI_SD3_EDGE_HIGH   at 0 range 31 .. 31;
   end record;

   --  Interrupt Force for proc0
   type PROC0_INTF_Register is record
      USBPHY_DP_LEVEL_LOW       : Boolean := False;
      USBPHY_DP_LEVEL_HIGH      : Boolean := False;
      USBPHY_DP_EDGE_LOW        : Boolean := False;
      USBPHY_DP_EDGE_HIGH       : Boolean := False;
      USBPHY_DM_LEVEL_LOW       : Boolean := False;
      USBPHY_DM_LEVEL_HIGH      : Boolean := False;
      USBPHY_DM_EDGE_LOW        : Boolean := False;
      USBPHY_DM_EDGE_HIGH       : Boolean := False;
      GPIO_QSPI_SCLK_LEVEL_LOW  : Boolean := False;
      GPIO_QSPI_SCLK_LEVEL_HIGH : Boolean := False;
      GPIO_QSPI_SCLK_EDGE_LOW   : Boolean := False;
      GPIO_QSPI_SCLK_EDGE_HIGH  : Boolean := False;
      GPIO_QSPI_SS_LEVEL_LOW    : Boolean := False;
      GPIO_QSPI_SS_LEVEL_HIGH   : Boolean := False;
      GPIO_QSPI_SS_EDGE_LOW     : Boolean := False;
      GPIO_QSPI_SS_EDGE_HIGH    : Boolean := False;
      GPIO_QSPI_SD0_LEVEL_LOW   : Boolean := False;
      GPIO_QSPI_SD0_LEVEL_HIGH  : Boolean := False;
      GPIO_QSPI_SD0_EDGE_LOW    : Boolean := False;
      GPIO_QSPI_SD0_EDGE_HIGH   : Boolean := False;
      GPIO_QSPI_SD1_LEVEL_LOW   : Boolean := False;
      GPIO_QSPI_SD1_LEVEL_HIGH  : Boolean := False;
      GPIO_QSPI_SD1_EDGE_LOW    : Boolean := False;
      GPIO_QSPI_SD1_EDGE_HIGH   : Boolean := False;
      GPIO_QSPI_SD2_LEVEL_LOW   : Boolean := False;
      GPIO_QSPI_SD2_LEVEL_HIGH  : Boolean := False;
      GPIO_QSPI_SD2_EDGE_LOW    : Boolean := False;
      GPIO_QSPI_SD2_EDGE_HIGH   : Boolean := False;
      GPIO_QSPI_SD3_LEVEL_LOW   : Boolean := False;
      GPIO_QSPI_SD3_LEVEL_HIGH  : Boolean := False;
      GPIO_QSPI_SD3_EDGE_LOW    : Boolean := False;
      GPIO_QSPI_SD3_EDGE_HIGH   : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC0_INTF_Register use record
      USBPHY_DP_LEVEL_LOW       at 0 range 0 .. 0;
      USBPHY_DP_LEVEL_HIGH      at 0 range 1 .. 1;
      USBPHY_DP_EDGE_LOW        at 0 range 2 .. 2;
      USBPHY_DP_EDGE_HIGH       at 0 range 3 .. 3;
      USBPHY_DM_LEVEL_LOW       at 0 range 4 .. 4;
      USBPHY_DM_LEVEL_HIGH      at 0 range 5 .. 5;
      USBPHY_DM_EDGE_LOW        at 0 range 6 .. 6;
      USBPHY_DM_EDGE_HIGH       at 0 range 7 .. 7;
      GPIO_QSPI_SCLK_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO_QSPI_SCLK_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO_QSPI_SCLK_EDGE_LOW   at 0 range 10 .. 10;
      GPIO_QSPI_SCLK_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO_QSPI_SS_LEVEL_LOW    at 0 range 12 .. 12;
      GPIO_QSPI_SS_LEVEL_HIGH   at 0 range 13 .. 13;
      GPIO_QSPI_SS_EDGE_LOW     at 0 range 14 .. 14;
      GPIO_QSPI_SS_EDGE_HIGH    at 0 range 15 .. 15;
      GPIO_QSPI_SD0_LEVEL_LOW   at 0 range 16 .. 16;
      GPIO_QSPI_SD0_LEVEL_HIGH  at 0 range 17 .. 17;
      GPIO_QSPI_SD0_EDGE_LOW    at 0 range 18 .. 18;
      GPIO_QSPI_SD0_EDGE_HIGH   at 0 range 19 .. 19;
      GPIO_QSPI_SD1_LEVEL_LOW   at 0 range 20 .. 20;
      GPIO_QSPI_SD1_LEVEL_HIGH  at 0 range 21 .. 21;
      GPIO_QSPI_SD1_EDGE_LOW    at 0 range 22 .. 22;
      GPIO_QSPI_SD1_EDGE_HIGH   at 0 range 23 .. 23;
      GPIO_QSPI_SD2_LEVEL_LOW   at 0 range 24 .. 24;
      GPIO_QSPI_SD2_LEVEL_HIGH  at 0 range 25 .. 25;
      GPIO_QSPI_SD2_EDGE_LOW    at 0 range 26 .. 26;
      GPIO_QSPI_SD2_EDGE_HIGH   at 0 range 27 .. 27;
      GPIO_QSPI_SD3_LEVEL_LOW   at 0 range 28 .. 28;
      GPIO_QSPI_SD3_LEVEL_HIGH  at 0 range 29 .. 29;
      GPIO_QSPI_SD3_EDGE_LOW    at 0 range 30 .. 30;
      GPIO_QSPI_SD3_EDGE_HIGH   at 0 range 31 .. 31;
   end record;

   --  Interrupt status after masking & forcing for proc0
   type PROC0_INTS_Register is record
      --  Read-only.
      USBPHY_DP_LEVEL_LOW       : Boolean;
      --  Read-only.
      USBPHY_DP_LEVEL_HIGH      : Boolean;
      --  Read-only.
      USBPHY_DP_EDGE_LOW        : Boolean;
      --  Read-only.
      USBPHY_DP_EDGE_HIGH       : Boolean;
      --  Read-only.
      USBPHY_DM_LEVEL_LOW       : Boolean;
      --  Read-only.
      USBPHY_DM_LEVEL_HIGH      : Boolean;
      --  Read-only.
      USBPHY_DM_EDGE_LOW        : Boolean;
      --  Read-only.
      USBPHY_DM_EDGE_HIGH       : Boolean;
      --  Read-only.
      GPIO_QSPI_SCLK_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO_QSPI_SCLK_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO_QSPI_SCLK_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO_QSPI_SCLK_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO_QSPI_SS_LEVEL_LOW    : Boolean;
      --  Read-only.
      GPIO_QSPI_SS_LEVEL_HIGH   : Boolean;
      --  Read-only.
      GPIO_QSPI_SS_EDGE_LOW     : Boolean;
      --  Read-only.
      GPIO_QSPI_SS_EDGE_HIGH    : Boolean;
      --  Read-only.
      GPIO_QSPI_SD0_LEVEL_LOW   : Boolean;
      --  Read-only.
      GPIO_QSPI_SD0_LEVEL_HIGH  : Boolean;
      --  Read-only.
      GPIO_QSPI_SD0_EDGE_LOW    : Boolean;
      --  Read-only.
      GPIO_QSPI_SD0_EDGE_HIGH   : Boolean;
      --  Read-only.
      GPIO_QSPI_SD1_LEVEL_LOW   : Boolean;
      --  Read-only.
      GPIO_QSPI_SD1_LEVEL_HIGH  : Boolean;
      --  Read-only.
      GPIO_QSPI_SD1_EDGE_LOW    : Boolean;
      --  Read-only.
      GPIO_QSPI_SD1_EDGE_HIGH   : Boolean;
      --  Read-only.
      GPIO_QSPI_SD2_LEVEL_LOW   : Boolean;
      --  Read-only.
      GPIO_QSPI_SD2_LEVEL_HIGH  : Boolean;
      --  Read-only.
      GPIO_QSPI_SD2_EDGE_LOW    : Boolean;
      --  Read-only.
      GPIO_QSPI_SD2_EDGE_HIGH   : Boolean;
      --  Read-only.
      GPIO_QSPI_SD3_LEVEL_LOW   : Boolean;
      --  Read-only.
      GPIO_QSPI_SD3_LEVEL_HIGH  : Boolean;
      --  Read-only.
      GPIO_QSPI_SD3_EDGE_LOW    : Boolean;
      --  Read-only.
      GPIO_QSPI_SD3_EDGE_HIGH   : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC0_INTS_Register use record
      USBPHY_DP_LEVEL_LOW       at 0 range 0 .. 0;
      USBPHY_DP_LEVEL_HIGH      at 0 range 1 .. 1;
      USBPHY_DP_EDGE_LOW        at 0 range 2 .. 2;
      USBPHY_DP_EDGE_HIGH       at 0 range 3 .. 3;
      USBPHY_DM_LEVEL_LOW       at 0 range 4 .. 4;
      USBPHY_DM_LEVEL_HIGH      at 0 range 5 .. 5;
      USBPHY_DM_EDGE_LOW        at 0 range 6 .. 6;
      USBPHY_DM_EDGE_HIGH       at 0 range 7 .. 7;
      GPIO_QSPI_SCLK_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO_QSPI_SCLK_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO_QSPI_SCLK_EDGE_LOW   at 0 range 10 .. 10;
      GPIO_QSPI_SCLK_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO_QSPI_SS_LEVEL_LOW    at 0 range 12 .. 12;
      GPIO_QSPI_SS_LEVEL_HIGH   at 0 range 13 .. 13;
      GPIO_QSPI_SS_EDGE_LOW     at 0 range 14 .. 14;
      GPIO_QSPI_SS_EDGE_HIGH    at 0 range 15 .. 15;
      GPIO_QSPI_SD0_LEVEL_LOW   at 0 range 16 .. 16;
      GPIO_QSPI_SD0_LEVEL_HIGH  at 0 range 17 .. 17;
      GPIO_QSPI_SD0_EDGE_LOW    at 0 range 18 .. 18;
      GPIO_QSPI_SD0_EDGE_HIGH   at 0 range 19 .. 19;
      GPIO_QSPI_SD1_LEVEL_LOW   at 0 range 20 .. 20;
      GPIO_QSPI_SD1_LEVEL_HIGH  at 0 range 21 .. 21;
      GPIO_QSPI_SD1_EDGE_LOW    at 0 range 22 .. 22;
      GPIO_QSPI_SD1_EDGE_HIGH   at 0 range 23 .. 23;
      GPIO_QSPI_SD2_LEVEL_LOW   at 0 range 24 .. 24;
      GPIO_QSPI_SD2_LEVEL_HIGH  at 0 range 25 .. 25;
      GPIO_QSPI_SD2_EDGE_LOW    at 0 range 26 .. 26;
      GPIO_QSPI_SD2_EDGE_HIGH   at 0 range 27 .. 27;
      GPIO_QSPI_SD3_LEVEL_LOW   at 0 range 28 .. 28;
      GPIO_QSPI_SD3_LEVEL_HIGH  at 0 range 29 .. 29;
      GPIO_QSPI_SD3_EDGE_LOW    at 0 range 30 .. 30;
      GPIO_QSPI_SD3_EDGE_HIGH   at 0 range 31 .. 31;
   end record;

   --  Interrupt Enable for proc1
   type PROC1_INTE_Register is record
      USBPHY_DP_LEVEL_LOW       : Boolean := False;
      USBPHY_DP_LEVEL_HIGH      : Boolean := False;
      USBPHY_DP_EDGE_LOW        : Boolean := False;
      USBPHY_DP_EDGE_HIGH       : Boolean := False;
      USBPHY_DM_LEVEL_LOW       : Boolean := False;
      USBPHY_DM_LEVEL_HIGH      : Boolean := False;
      USBPHY_DM_EDGE_LOW        : Boolean := False;
      USBPHY_DM_EDGE_HIGH       : Boolean := False;
      GPIO_QSPI_SCLK_LEVEL_LOW  : Boolean := False;
      GPIO_QSPI_SCLK_LEVEL_HIGH : Boolean := False;
      GPIO_QSPI_SCLK_EDGE_LOW   : Boolean := False;
      GPIO_QSPI_SCLK_EDGE_HIGH  : Boolean := False;
      GPIO_QSPI_SS_LEVEL_LOW    : Boolean := False;
      GPIO_QSPI_SS_LEVEL_HIGH   : Boolean := False;
      GPIO_QSPI_SS_EDGE_LOW     : Boolean := False;
      GPIO_QSPI_SS_EDGE_HIGH    : Boolean := False;
      GPIO_QSPI_SD0_LEVEL_LOW   : Boolean := False;
      GPIO_QSPI_SD0_LEVEL_HIGH  : Boolean := False;
      GPIO_QSPI_SD0_EDGE_LOW    : Boolean := False;
      GPIO_QSPI_SD0_EDGE_HIGH   : Boolean := False;
      GPIO_QSPI_SD1_LEVEL_LOW   : Boolean := False;
      GPIO_QSPI_SD1_LEVEL_HIGH  : Boolean := False;
      GPIO_QSPI_SD1_EDGE_LOW    : Boolean := False;
      GPIO_QSPI_SD1_EDGE_HIGH   : Boolean := False;
      GPIO_QSPI_SD2_LEVEL_LOW   : Boolean := False;
      GPIO_QSPI_SD2_LEVEL_HIGH  : Boolean := False;
      GPIO_QSPI_SD2_EDGE_LOW    : Boolean := False;
      GPIO_QSPI_SD2_EDGE_HIGH   : Boolean := False;
      GPIO_QSPI_SD3_LEVEL_LOW   : Boolean := False;
      GPIO_QSPI_SD3_LEVEL_HIGH  : Boolean := False;
      GPIO_QSPI_SD3_EDGE_LOW    : Boolean := False;
      GPIO_QSPI_SD3_EDGE_HIGH   : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC1_INTE_Register use record
      USBPHY_DP_LEVEL_LOW       at 0 range 0 .. 0;
      USBPHY_DP_LEVEL_HIGH      at 0 range 1 .. 1;
      USBPHY_DP_EDGE_LOW        at 0 range 2 .. 2;
      USBPHY_DP_EDGE_HIGH       at 0 range 3 .. 3;
      USBPHY_DM_LEVEL_LOW       at 0 range 4 .. 4;
      USBPHY_DM_LEVEL_HIGH      at 0 range 5 .. 5;
      USBPHY_DM_EDGE_LOW        at 0 range 6 .. 6;
      USBPHY_DM_EDGE_HIGH       at 0 range 7 .. 7;
      GPIO_QSPI_SCLK_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO_QSPI_SCLK_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO_QSPI_SCLK_EDGE_LOW   at 0 range 10 .. 10;
      GPIO_QSPI_SCLK_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO_QSPI_SS_LEVEL_LOW    at 0 range 12 .. 12;
      GPIO_QSPI_SS_LEVEL_HIGH   at 0 range 13 .. 13;
      GPIO_QSPI_SS_EDGE_LOW     at 0 range 14 .. 14;
      GPIO_QSPI_SS_EDGE_HIGH    at 0 range 15 .. 15;
      GPIO_QSPI_SD0_LEVEL_LOW   at 0 range 16 .. 16;
      GPIO_QSPI_SD0_LEVEL_HIGH  at 0 range 17 .. 17;
      GPIO_QSPI_SD0_EDGE_LOW    at 0 range 18 .. 18;
      GPIO_QSPI_SD0_EDGE_HIGH   at 0 range 19 .. 19;
      GPIO_QSPI_SD1_LEVEL_LOW   at 0 range 20 .. 20;
      GPIO_QSPI_SD1_LEVEL_HIGH  at 0 range 21 .. 21;
      GPIO_QSPI_SD1_EDGE_LOW    at 0 range 22 .. 22;
      GPIO_QSPI_SD1_EDGE_HIGH   at 0 range 23 .. 23;
      GPIO_QSPI_SD2_LEVEL_LOW   at 0 range 24 .. 24;
      GPIO_QSPI_SD2_LEVEL_HIGH  at 0 range 25 .. 25;
      GPIO_QSPI_SD2_EDGE_LOW    at 0 range 26 .. 26;
      GPIO_QSPI_SD2_EDGE_HIGH   at 0 range 27 .. 27;
      GPIO_QSPI_SD3_LEVEL_LOW   at 0 range 28 .. 28;
      GPIO_QSPI_SD3_LEVEL_HIGH  at 0 range 29 .. 29;
      GPIO_QSPI_SD3_EDGE_LOW    at 0 range 30 .. 30;
      GPIO_QSPI_SD3_EDGE_HIGH   at 0 range 31 .. 31;
   end record;

   --  Interrupt Force for proc1
   type PROC1_INTF_Register is record
      USBPHY_DP_LEVEL_LOW       : Boolean := False;
      USBPHY_DP_LEVEL_HIGH      : Boolean := False;
      USBPHY_DP_EDGE_LOW        : Boolean := False;
      USBPHY_DP_EDGE_HIGH       : Boolean := False;
      USBPHY_DM_LEVEL_LOW       : Boolean := False;
      USBPHY_DM_LEVEL_HIGH      : Boolean := False;
      USBPHY_DM_EDGE_LOW        : Boolean := False;
      USBPHY_DM_EDGE_HIGH       : Boolean := False;
      GPIO_QSPI_SCLK_LEVEL_LOW  : Boolean := False;
      GPIO_QSPI_SCLK_LEVEL_HIGH : Boolean := False;
      GPIO_QSPI_SCLK_EDGE_LOW   : Boolean := False;
      GPIO_QSPI_SCLK_EDGE_HIGH  : Boolean := False;
      GPIO_QSPI_SS_LEVEL_LOW    : Boolean := False;
      GPIO_QSPI_SS_LEVEL_HIGH   : Boolean := False;
      GPIO_QSPI_SS_EDGE_LOW     : Boolean := False;
      GPIO_QSPI_SS_EDGE_HIGH    : Boolean := False;
      GPIO_QSPI_SD0_LEVEL_LOW   : Boolean := False;
      GPIO_QSPI_SD0_LEVEL_HIGH  : Boolean := False;
      GPIO_QSPI_SD0_EDGE_LOW    : Boolean := False;
      GPIO_QSPI_SD0_EDGE_HIGH   : Boolean := False;
      GPIO_QSPI_SD1_LEVEL_LOW   : Boolean := False;
      GPIO_QSPI_SD1_LEVEL_HIGH  : Boolean := False;
      GPIO_QSPI_SD1_EDGE_LOW    : Boolean := False;
      GPIO_QSPI_SD1_EDGE_HIGH   : Boolean := False;
      GPIO_QSPI_SD2_LEVEL_LOW   : Boolean := False;
      GPIO_QSPI_SD2_LEVEL_HIGH  : Boolean := False;
      GPIO_QSPI_SD2_EDGE_LOW    : Boolean := False;
      GPIO_QSPI_SD2_EDGE_HIGH   : Boolean := False;
      GPIO_QSPI_SD3_LEVEL_LOW   : Boolean := False;
      GPIO_QSPI_SD3_LEVEL_HIGH  : Boolean := False;
      GPIO_QSPI_SD3_EDGE_LOW    : Boolean := False;
      GPIO_QSPI_SD3_EDGE_HIGH   : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC1_INTF_Register use record
      USBPHY_DP_LEVEL_LOW       at 0 range 0 .. 0;
      USBPHY_DP_LEVEL_HIGH      at 0 range 1 .. 1;
      USBPHY_DP_EDGE_LOW        at 0 range 2 .. 2;
      USBPHY_DP_EDGE_HIGH       at 0 range 3 .. 3;
      USBPHY_DM_LEVEL_LOW       at 0 range 4 .. 4;
      USBPHY_DM_LEVEL_HIGH      at 0 range 5 .. 5;
      USBPHY_DM_EDGE_LOW        at 0 range 6 .. 6;
      USBPHY_DM_EDGE_HIGH       at 0 range 7 .. 7;
      GPIO_QSPI_SCLK_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO_QSPI_SCLK_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO_QSPI_SCLK_EDGE_LOW   at 0 range 10 .. 10;
      GPIO_QSPI_SCLK_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO_QSPI_SS_LEVEL_LOW    at 0 range 12 .. 12;
      GPIO_QSPI_SS_LEVEL_HIGH   at 0 range 13 .. 13;
      GPIO_QSPI_SS_EDGE_LOW     at 0 range 14 .. 14;
      GPIO_QSPI_SS_EDGE_HIGH    at 0 range 15 .. 15;
      GPIO_QSPI_SD0_LEVEL_LOW   at 0 range 16 .. 16;
      GPIO_QSPI_SD0_LEVEL_HIGH  at 0 range 17 .. 17;
      GPIO_QSPI_SD0_EDGE_LOW    at 0 range 18 .. 18;
      GPIO_QSPI_SD0_EDGE_HIGH   at 0 range 19 .. 19;
      GPIO_QSPI_SD1_LEVEL_LOW   at 0 range 20 .. 20;
      GPIO_QSPI_SD1_LEVEL_HIGH  at 0 range 21 .. 21;
      GPIO_QSPI_SD1_EDGE_LOW    at 0 range 22 .. 22;
      GPIO_QSPI_SD1_EDGE_HIGH   at 0 range 23 .. 23;
      GPIO_QSPI_SD2_LEVEL_LOW   at 0 range 24 .. 24;
      GPIO_QSPI_SD2_LEVEL_HIGH  at 0 range 25 .. 25;
      GPIO_QSPI_SD2_EDGE_LOW    at 0 range 26 .. 26;
      GPIO_QSPI_SD2_EDGE_HIGH   at 0 range 27 .. 27;
      GPIO_QSPI_SD3_LEVEL_LOW   at 0 range 28 .. 28;
      GPIO_QSPI_SD3_LEVEL_HIGH  at 0 range 29 .. 29;
      GPIO_QSPI_SD3_EDGE_LOW    at 0 range 30 .. 30;
      GPIO_QSPI_SD3_EDGE_HIGH   at 0 range 31 .. 31;
   end record;

   --  Interrupt status after masking & forcing for proc1
   type PROC1_INTS_Register is record
      --  Read-only.
      USBPHY_DP_LEVEL_LOW       : Boolean;
      --  Read-only.
      USBPHY_DP_LEVEL_HIGH      : Boolean;
      --  Read-only.
      USBPHY_DP_EDGE_LOW        : Boolean;
      --  Read-only.
      USBPHY_DP_EDGE_HIGH       : Boolean;
      --  Read-only.
      USBPHY_DM_LEVEL_LOW       : Boolean;
      --  Read-only.
      USBPHY_DM_LEVEL_HIGH      : Boolean;
      --  Read-only.
      USBPHY_DM_EDGE_LOW        : Boolean;
      --  Read-only.
      USBPHY_DM_EDGE_HIGH       : Boolean;
      --  Read-only.
      GPIO_QSPI_SCLK_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO_QSPI_SCLK_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO_QSPI_SCLK_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO_QSPI_SCLK_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO_QSPI_SS_LEVEL_LOW    : Boolean;
      --  Read-only.
      GPIO_QSPI_SS_LEVEL_HIGH   : Boolean;
      --  Read-only.
      GPIO_QSPI_SS_EDGE_LOW     : Boolean;
      --  Read-only.
      GPIO_QSPI_SS_EDGE_HIGH    : Boolean;
      --  Read-only.
      GPIO_QSPI_SD0_LEVEL_LOW   : Boolean;
      --  Read-only.
      GPIO_QSPI_SD0_LEVEL_HIGH  : Boolean;
      --  Read-only.
      GPIO_QSPI_SD0_EDGE_LOW    : Boolean;
      --  Read-only.
      GPIO_QSPI_SD0_EDGE_HIGH   : Boolean;
      --  Read-only.
      GPIO_QSPI_SD1_LEVEL_LOW   : Boolean;
      --  Read-only.
      GPIO_QSPI_SD1_LEVEL_HIGH  : Boolean;
      --  Read-only.
      GPIO_QSPI_SD1_EDGE_LOW    : Boolean;
      --  Read-only.
      GPIO_QSPI_SD1_EDGE_HIGH   : Boolean;
      --  Read-only.
      GPIO_QSPI_SD2_LEVEL_LOW   : Boolean;
      --  Read-only.
      GPIO_QSPI_SD2_LEVEL_HIGH  : Boolean;
      --  Read-only.
      GPIO_QSPI_SD2_EDGE_LOW    : Boolean;
      --  Read-only.
      GPIO_QSPI_SD2_EDGE_HIGH   : Boolean;
      --  Read-only.
      GPIO_QSPI_SD3_LEVEL_LOW   : Boolean;
      --  Read-only.
      GPIO_QSPI_SD3_LEVEL_HIGH  : Boolean;
      --  Read-only.
      GPIO_QSPI_SD3_EDGE_LOW    : Boolean;
      --  Read-only.
      GPIO_QSPI_SD3_EDGE_HIGH   : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC1_INTS_Register use record
      USBPHY_DP_LEVEL_LOW       at 0 range 0 .. 0;
      USBPHY_DP_LEVEL_HIGH      at 0 range 1 .. 1;
      USBPHY_DP_EDGE_LOW        at 0 range 2 .. 2;
      USBPHY_DP_EDGE_HIGH       at 0 range 3 .. 3;
      USBPHY_DM_LEVEL_LOW       at 0 range 4 .. 4;
      USBPHY_DM_LEVEL_HIGH      at 0 range 5 .. 5;
      USBPHY_DM_EDGE_LOW        at 0 range 6 .. 6;
      USBPHY_DM_EDGE_HIGH       at 0 range 7 .. 7;
      GPIO_QSPI_SCLK_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO_QSPI_SCLK_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO_QSPI_SCLK_EDGE_LOW   at 0 range 10 .. 10;
      GPIO_QSPI_SCLK_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO_QSPI_SS_LEVEL_LOW    at 0 range 12 .. 12;
      GPIO_QSPI_SS_LEVEL_HIGH   at 0 range 13 .. 13;
      GPIO_QSPI_SS_EDGE_LOW     at 0 range 14 .. 14;
      GPIO_QSPI_SS_EDGE_HIGH    at 0 range 15 .. 15;
      GPIO_QSPI_SD0_LEVEL_LOW   at 0 range 16 .. 16;
      GPIO_QSPI_SD0_LEVEL_HIGH  at 0 range 17 .. 17;
      GPIO_QSPI_SD0_EDGE_LOW    at 0 range 18 .. 18;
      GPIO_QSPI_SD0_EDGE_HIGH   at 0 range 19 .. 19;
      GPIO_QSPI_SD1_LEVEL_LOW   at 0 range 20 .. 20;
      GPIO_QSPI_SD1_LEVEL_HIGH  at 0 range 21 .. 21;
      GPIO_QSPI_SD1_EDGE_LOW    at 0 range 22 .. 22;
      GPIO_QSPI_SD1_EDGE_HIGH   at 0 range 23 .. 23;
      GPIO_QSPI_SD2_LEVEL_LOW   at 0 range 24 .. 24;
      GPIO_QSPI_SD2_LEVEL_HIGH  at 0 range 25 .. 25;
      GPIO_QSPI_SD2_EDGE_LOW    at 0 range 26 .. 26;
      GPIO_QSPI_SD2_EDGE_HIGH   at 0 range 27 .. 27;
      GPIO_QSPI_SD3_LEVEL_LOW   at 0 range 28 .. 28;
      GPIO_QSPI_SD3_LEVEL_HIGH  at 0 range 29 .. 29;
      GPIO_QSPI_SD3_EDGE_LOW    at 0 range 30 .. 30;
      GPIO_QSPI_SD3_EDGE_HIGH   at 0 range 31 .. 31;
   end record;

   --  Interrupt Enable for dormant_wake
   type DORMANT_WAKE_INTE_Register is record
      USBPHY_DP_LEVEL_LOW       : Boolean := False;
      USBPHY_DP_LEVEL_HIGH      : Boolean := False;
      USBPHY_DP_EDGE_LOW        : Boolean := False;
      USBPHY_DP_EDGE_HIGH       : Boolean := False;
      USBPHY_DM_LEVEL_LOW       : Boolean := False;
      USBPHY_DM_LEVEL_HIGH      : Boolean := False;
      USBPHY_DM_EDGE_LOW        : Boolean := False;
      USBPHY_DM_EDGE_HIGH       : Boolean := False;
      GPIO_QSPI_SCLK_LEVEL_LOW  : Boolean := False;
      GPIO_QSPI_SCLK_LEVEL_HIGH : Boolean := False;
      GPIO_QSPI_SCLK_EDGE_LOW   : Boolean := False;
      GPIO_QSPI_SCLK_EDGE_HIGH  : Boolean := False;
      GPIO_QSPI_SS_LEVEL_LOW    : Boolean := False;
      GPIO_QSPI_SS_LEVEL_HIGH   : Boolean := False;
      GPIO_QSPI_SS_EDGE_LOW     : Boolean := False;
      GPIO_QSPI_SS_EDGE_HIGH    : Boolean := False;
      GPIO_QSPI_SD0_LEVEL_LOW   : Boolean := False;
      GPIO_QSPI_SD0_LEVEL_HIGH  : Boolean := False;
      GPIO_QSPI_SD0_EDGE_LOW    : Boolean := False;
      GPIO_QSPI_SD0_EDGE_HIGH   : Boolean := False;
      GPIO_QSPI_SD1_LEVEL_LOW   : Boolean := False;
      GPIO_QSPI_SD1_LEVEL_HIGH  : Boolean := False;
      GPIO_QSPI_SD1_EDGE_LOW    : Boolean := False;
      GPIO_QSPI_SD1_EDGE_HIGH   : Boolean := False;
      GPIO_QSPI_SD2_LEVEL_LOW   : Boolean := False;
      GPIO_QSPI_SD2_LEVEL_HIGH  : Boolean := False;
      GPIO_QSPI_SD2_EDGE_LOW    : Boolean := False;
      GPIO_QSPI_SD2_EDGE_HIGH   : Boolean := False;
      GPIO_QSPI_SD3_LEVEL_LOW   : Boolean := False;
      GPIO_QSPI_SD3_LEVEL_HIGH  : Boolean := False;
      GPIO_QSPI_SD3_EDGE_LOW    : Boolean := False;
      GPIO_QSPI_SD3_EDGE_HIGH   : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DORMANT_WAKE_INTE_Register use record
      USBPHY_DP_LEVEL_LOW       at 0 range 0 .. 0;
      USBPHY_DP_LEVEL_HIGH      at 0 range 1 .. 1;
      USBPHY_DP_EDGE_LOW        at 0 range 2 .. 2;
      USBPHY_DP_EDGE_HIGH       at 0 range 3 .. 3;
      USBPHY_DM_LEVEL_LOW       at 0 range 4 .. 4;
      USBPHY_DM_LEVEL_HIGH      at 0 range 5 .. 5;
      USBPHY_DM_EDGE_LOW        at 0 range 6 .. 6;
      USBPHY_DM_EDGE_HIGH       at 0 range 7 .. 7;
      GPIO_QSPI_SCLK_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO_QSPI_SCLK_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO_QSPI_SCLK_EDGE_LOW   at 0 range 10 .. 10;
      GPIO_QSPI_SCLK_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO_QSPI_SS_LEVEL_LOW    at 0 range 12 .. 12;
      GPIO_QSPI_SS_LEVEL_HIGH   at 0 range 13 .. 13;
      GPIO_QSPI_SS_EDGE_LOW     at 0 range 14 .. 14;
      GPIO_QSPI_SS_EDGE_HIGH    at 0 range 15 .. 15;
      GPIO_QSPI_SD0_LEVEL_LOW   at 0 range 16 .. 16;
      GPIO_QSPI_SD0_LEVEL_HIGH  at 0 range 17 .. 17;
      GPIO_QSPI_SD0_EDGE_LOW    at 0 range 18 .. 18;
      GPIO_QSPI_SD0_EDGE_HIGH   at 0 range 19 .. 19;
      GPIO_QSPI_SD1_LEVEL_LOW   at 0 range 20 .. 20;
      GPIO_QSPI_SD1_LEVEL_HIGH  at 0 range 21 .. 21;
      GPIO_QSPI_SD1_EDGE_LOW    at 0 range 22 .. 22;
      GPIO_QSPI_SD1_EDGE_HIGH   at 0 range 23 .. 23;
      GPIO_QSPI_SD2_LEVEL_LOW   at 0 range 24 .. 24;
      GPIO_QSPI_SD2_LEVEL_HIGH  at 0 range 25 .. 25;
      GPIO_QSPI_SD2_EDGE_LOW    at 0 range 26 .. 26;
      GPIO_QSPI_SD2_EDGE_HIGH   at 0 range 27 .. 27;
      GPIO_QSPI_SD3_LEVEL_LOW   at 0 range 28 .. 28;
      GPIO_QSPI_SD3_LEVEL_HIGH  at 0 range 29 .. 29;
      GPIO_QSPI_SD3_EDGE_LOW    at 0 range 30 .. 30;
      GPIO_QSPI_SD3_EDGE_HIGH   at 0 range 31 .. 31;
   end record;

   --  Interrupt Force for dormant_wake
   type DORMANT_WAKE_INTF_Register is record
      USBPHY_DP_LEVEL_LOW       : Boolean := False;
      USBPHY_DP_LEVEL_HIGH      : Boolean := False;
      USBPHY_DP_EDGE_LOW        : Boolean := False;
      USBPHY_DP_EDGE_HIGH       : Boolean := False;
      USBPHY_DM_LEVEL_LOW       : Boolean := False;
      USBPHY_DM_LEVEL_HIGH      : Boolean := False;
      USBPHY_DM_EDGE_LOW        : Boolean := False;
      USBPHY_DM_EDGE_HIGH       : Boolean := False;
      GPIO_QSPI_SCLK_LEVEL_LOW  : Boolean := False;
      GPIO_QSPI_SCLK_LEVEL_HIGH : Boolean := False;
      GPIO_QSPI_SCLK_EDGE_LOW   : Boolean := False;
      GPIO_QSPI_SCLK_EDGE_HIGH  : Boolean := False;
      GPIO_QSPI_SS_LEVEL_LOW    : Boolean := False;
      GPIO_QSPI_SS_LEVEL_HIGH   : Boolean := False;
      GPIO_QSPI_SS_EDGE_LOW     : Boolean := False;
      GPIO_QSPI_SS_EDGE_HIGH    : Boolean := False;
      GPIO_QSPI_SD0_LEVEL_LOW   : Boolean := False;
      GPIO_QSPI_SD0_LEVEL_HIGH  : Boolean := False;
      GPIO_QSPI_SD0_EDGE_LOW    : Boolean := False;
      GPIO_QSPI_SD0_EDGE_HIGH   : Boolean := False;
      GPIO_QSPI_SD1_LEVEL_LOW   : Boolean := False;
      GPIO_QSPI_SD1_LEVEL_HIGH  : Boolean := False;
      GPIO_QSPI_SD1_EDGE_LOW    : Boolean := False;
      GPIO_QSPI_SD1_EDGE_HIGH   : Boolean := False;
      GPIO_QSPI_SD2_LEVEL_LOW   : Boolean := False;
      GPIO_QSPI_SD2_LEVEL_HIGH  : Boolean := False;
      GPIO_QSPI_SD2_EDGE_LOW    : Boolean := False;
      GPIO_QSPI_SD2_EDGE_HIGH   : Boolean := False;
      GPIO_QSPI_SD3_LEVEL_LOW   : Boolean := False;
      GPIO_QSPI_SD3_LEVEL_HIGH  : Boolean := False;
      GPIO_QSPI_SD3_EDGE_LOW    : Boolean := False;
      GPIO_QSPI_SD3_EDGE_HIGH   : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DORMANT_WAKE_INTF_Register use record
      USBPHY_DP_LEVEL_LOW       at 0 range 0 .. 0;
      USBPHY_DP_LEVEL_HIGH      at 0 range 1 .. 1;
      USBPHY_DP_EDGE_LOW        at 0 range 2 .. 2;
      USBPHY_DP_EDGE_HIGH       at 0 range 3 .. 3;
      USBPHY_DM_LEVEL_LOW       at 0 range 4 .. 4;
      USBPHY_DM_LEVEL_HIGH      at 0 range 5 .. 5;
      USBPHY_DM_EDGE_LOW        at 0 range 6 .. 6;
      USBPHY_DM_EDGE_HIGH       at 0 range 7 .. 7;
      GPIO_QSPI_SCLK_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO_QSPI_SCLK_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO_QSPI_SCLK_EDGE_LOW   at 0 range 10 .. 10;
      GPIO_QSPI_SCLK_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO_QSPI_SS_LEVEL_LOW    at 0 range 12 .. 12;
      GPIO_QSPI_SS_LEVEL_HIGH   at 0 range 13 .. 13;
      GPIO_QSPI_SS_EDGE_LOW     at 0 range 14 .. 14;
      GPIO_QSPI_SS_EDGE_HIGH    at 0 range 15 .. 15;
      GPIO_QSPI_SD0_LEVEL_LOW   at 0 range 16 .. 16;
      GPIO_QSPI_SD0_LEVEL_HIGH  at 0 range 17 .. 17;
      GPIO_QSPI_SD0_EDGE_LOW    at 0 range 18 .. 18;
      GPIO_QSPI_SD0_EDGE_HIGH   at 0 range 19 .. 19;
      GPIO_QSPI_SD1_LEVEL_LOW   at 0 range 20 .. 20;
      GPIO_QSPI_SD1_LEVEL_HIGH  at 0 range 21 .. 21;
      GPIO_QSPI_SD1_EDGE_LOW    at 0 range 22 .. 22;
      GPIO_QSPI_SD1_EDGE_HIGH   at 0 range 23 .. 23;
      GPIO_QSPI_SD2_LEVEL_LOW   at 0 range 24 .. 24;
      GPIO_QSPI_SD2_LEVEL_HIGH  at 0 range 25 .. 25;
      GPIO_QSPI_SD2_EDGE_LOW    at 0 range 26 .. 26;
      GPIO_QSPI_SD2_EDGE_HIGH   at 0 range 27 .. 27;
      GPIO_QSPI_SD3_LEVEL_LOW   at 0 range 28 .. 28;
      GPIO_QSPI_SD3_LEVEL_HIGH  at 0 range 29 .. 29;
      GPIO_QSPI_SD3_EDGE_LOW    at 0 range 30 .. 30;
      GPIO_QSPI_SD3_EDGE_HIGH   at 0 range 31 .. 31;
   end record;

   --  Interrupt status after masking & forcing for dormant_wake
   type DORMANT_WAKE_INTS_Register is record
      --  Read-only.
      USBPHY_DP_LEVEL_LOW       : Boolean;
      --  Read-only.
      USBPHY_DP_LEVEL_HIGH      : Boolean;
      --  Read-only.
      USBPHY_DP_EDGE_LOW        : Boolean;
      --  Read-only.
      USBPHY_DP_EDGE_HIGH       : Boolean;
      --  Read-only.
      USBPHY_DM_LEVEL_LOW       : Boolean;
      --  Read-only.
      USBPHY_DM_LEVEL_HIGH      : Boolean;
      --  Read-only.
      USBPHY_DM_EDGE_LOW        : Boolean;
      --  Read-only.
      USBPHY_DM_EDGE_HIGH       : Boolean;
      --  Read-only.
      GPIO_QSPI_SCLK_LEVEL_LOW  : Boolean;
      --  Read-only.
      GPIO_QSPI_SCLK_LEVEL_HIGH : Boolean;
      --  Read-only.
      GPIO_QSPI_SCLK_EDGE_LOW   : Boolean;
      --  Read-only.
      GPIO_QSPI_SCLK_EDGE_HIGH  : Boolean;
      --  Read-only.
      GPIO_QSPI_SS_LEVEL_LOW    : Boolean;
      --  Read-only.
      GPIO_QSPI_SS_LEVEL_HIGH   : Boolean;
      --  Read-only.
      GPIO_QSPI_SS_EDGE_LOW     : Boolean;
      --  Read-only.
      GPIO_QSPI_SS_EDGE_HIGH    : Boolean;
      --  Read-only.
      GPIO_QSPI_SD0_LEVEL_LOW   : Boolean;
      --  Read-only.
      GPIO_QSPI_SD0_LEVEL_HIGH  : Boolean;
      --  Read-only.
      GPIO_QSPI_SD0_EDGE_LOW    : Boolean;
      --  Read-only.
      GPIO_QSPI_SD0_EDGE_HIGH   : Boolean;
      --  Read-only.
      GPIO_QSPI_SD1_LEVEL_LOW   : Boolean;
      --  Read-only.
      GPIO_QSPI_SD1_LEVEL_HIGH  : Boolean;
      --  Read-only.
      GPIO_QSPI_SD1_EDGE_LOW    : Boolean;
      --  Read-only.
      GPIO_QSPI_SD1_EDGE_HIGH   : Boolean;
      --  Read-only.
      GPIO_QSPI_SD2_LEVEL_LOW   : Boolean;
      --  Read-only.
      GPIO_QSPI_SD2_LEVEL_HIGH  : Boolean;
      --  Read-only.
      GPIO_QSPI_SD2_EDGE_LOW    : Boolean;
      --  Read-only.
      GPIO_QSPI_SD2_EDGE_HIGH   : Boolean;
      --  Read-only.
      GPIO_QSPI_SD3_LEVEL_LOW   : Boolean;
      --  Read-only.
      GPIO_QSPI_SD3_LEVEL_HIGH  : Boolean;
      --  Read-only.
      GPIO_QSPI_SD3_EDGE_LOW    : Boolean;
      --  Read-only.
      GPIO_QSPI_SD3_EDGE_HIGH   : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DORMANT_WAKE_INTS_Register use record
      USBPHY_DP_LEVEL_LOW       at 0 range 0 .. 0;
      USBPHY_DP_LEVEL_HIGH      at 0 range 1 .. 1;
      USBPHY_DP_EDGE_LOW        at 0 range 2 .. 2;
      USBPHY_DP_EDGE_HIGH       at 0 range 3 .. 3;
      USBPHY_DM_LEVEL_LOW       at 0 range 4 .. 4;
      USBPHY_DM_LEVEL_HIGH      at 0 range 5 .. 5;
      USBPHY_DM_EDGE_LOW        at 0 range 6 .. 6;
      USBPHY_DM_EDGE_HIGH       at 0 range 7 .. 7;
      GPIO_QSPI_SCLK_LEVEL_LOW  at 0 range 8 .. 8;
      GPIO_QSPI_SCLK_LEVEL_HIGH at 0 range 9 .. 9;
      GPIO_QSPI_SCLK_EDGE_LOW   at 0 range 10 .. 10;
      GPIO_QSPI_SCLK_EDGE_HIGH  at 0 range 11 .. 11;
      GPIO_QSPI_SS_LEVEL_LOW    at 0 range 12 .. 12;
      GPIO_QSPI_SS_LEVEL_HIGH   at 0 range 13 .. 13;
      GPIO_QSPI_SS_EDGE_LOW     at 0 range 14 .. 14;
      GPIO_QSPI_SS_EDGE_HIGH    at 0 range 15 .. 15;
      GPIO_QSPI_SD0_LEVEL_LOW   at 0 range 16 .. 16;
      GPIO_QSPI_SD0_LEVEL_HIGH  at 0 range 17 .. 17;
      GPIO_QSPI_SD0_EDGE_LOW    at 0 range 18 .. 18;
      GPIO_QSPI_SD0_EDGE_HIGH   at 0 range 19 .. 19;
      GPIO_QSPI_SD1_LEVEL_LOW   at 0 range 20 .. 20;
      GPIO_QSPI_SD1_LEVEL_HIGH  at 0 range 21 .. 21;
      GPIO_QSPI_SD1_EDGE_LOW    at 0 range 22 .. 22;
      GPIO_QSPI_SD1_EDGE_HIGH   at 0 range 23 .. 23;
      GPIO_QSPI_SD2_LEVEL_LOW   at 0 range 24 .. 24;
      GPIO_QSPI_SD2_LEVEL_HIGH  at 0 range 25 .. 25;
      GPIO_QSPI_SD2_EDGE_LOW    at 0 range 26 .. 26;
      GPIO_QSPI_SD2_EDGE_HIGH   at 0 range 27 .. 27;
      GPIO_QSPI_SD3_LEVEL_LOW   at 0 range 28 .. 28;
      GPIO_QSPI_SD3_LEVEL_HIGH  at 0 range 29 .. 29;
      GPIO_QSPI_SD3_EDGE_LOW    at 0 range 30 .. 30;
      GPIO_QSPI_SD3_EDGE_HIGH   at 0 range 31 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type IO_QSPI_Peripheral is record
      USBPHY_DP_STATUS                  : aliased USBPHY_DP_STATUS_Register;
      USBPHY_DP_CTRL                    : aliased USBPHY_DP_CTRL_Register;
      USBPHY_DM_STATUS                  : aliased USBPHY_DM_STATUS_Register;
      USBPHY_DM_CTRL                    : aliased USBPHY_DM_CTRL_Register;
      GPIO_QSPI_SCLK_STATUS             : aliased GPIO_QSPI_SCLK_STATUS_Register;
      GPIO_QSPI_SCLK_CTRL               : aliased GPIO_QSPI_SCLK_CTRL_Register;
      GPIO_QSPI_SS_STATUS               : aliased GPIO_QSPI_SS_STATUS_Register;
      GPIO_QSPI_SS_CTRL                 : aliased GPIO_QSPI_SS_CTRL_Register;
      GPIO_QSPI_SD0_STATUS              : aliased GPIO_QSPI_SD0_STATUS_Register;
      GPIO_QSPI_SD0_CTRL                : aliased GPIO_QSPI_SD0_CTRL_Register;
      GPIO_QSPI_SD1_STATUS              : aliased GPIO_QSPI_SD1_STATUS_Register;
      GPIO_QSPI_SD1_CTRL                : aliased GPIO_QSPI_SD1_CTRL_Register;
      GPIO_QSPI_SD2_STATUS              : aliased GPIO_QSPI_SD2_STATUS_Register;
      GPIO_QSPI_SD2_CTRL                : aliased GPIO_QSPI_SD2_CTRL_Register;
      GPIO_QSPI_SD3_STATUS              : aliased GPIO_QSPI_SD3_STATUS_Register;
      GPIO_QSPI_SD3_CTRL                : aliased GPIO_QSPI_SD3_CTRL_Register;
      IRQSUMMARY_PROC0_SECURE           : aliased IRQSUMMARY_PROC0_SECURE_Register;
      IRQSUMMARY_PROC0_NONSECURE        : aliased IRQSUMMARY_PROC0_NONSECURE_Register;
      IRQSUMMARY_PROC1_SECURE           : aliased IRQSUMMARY_PROC1_SECURE_Register;
      IRQSUMMARY_PROC1_NONSECURE        : aliased IRQSUMMARY_PROC1_NONSECURE_Register;
      IRQSUMMARY_DORMANT_WAKE_SECURE    : aliased IRQSUMMARY_DORMANT_WAKE_SECURE_Register;
      IRQSUMMARY_DORMANT_WAKE_NONSECURE : aliased IRQSUMMARY_DORMANT_WAKE_NONSECURE_Register;
      --  Raw Interrupts
      INTR                              : aliased INTR_Register;
      --  Interrupt Enable for proc0
      PROC0_INTE                        : aliased PROC0_INTE_Register;
      --  Interrupt Force for proc0
      PROC0_INTF                        : aliased PROC0_INTF_Register;
      --  Interrupt status after masking & forcing for proc0
      PROC0_INTS                        : aliased PROC0_INTS_Register;
      --  Interrupt Enable for proc1
      PROC1_INTE                        : aliased PROC1_INTE_Register;
      --  Interrupt Force for proc1
      PROC1_INTF                        : aliased PROC1_INTF_Register;
      --  Interrupt status after masking & forcing for proc1
      PROC1_INTS                        : aliased PROC1_INTS_Register;
      --  Interrupt Enable for dormant_wake
      DORMANT_WAKE_INTE                 : aliased DORMANT_WAKE_INTE_Register;
      --  Interrupt Force for dormant_wake
      DORMANT_WAKE_INTF                 : aliased DORMANT_WAKE_INTF_Register;
      --  Interrupt status after masking & forcing for dormant_wake
      DORMANT_WAKE_INTS                 : aliased DORMANT_WAKE_INTS_Register;
   end record
     with Volatile;

   for IO_QSPI_Peripheral use record
      USBPHY_DP_STATUS                  at 16#0# range 0 .. 31;
      USBPHY_DP_CTRL                    at 16#4# range 0 .. 31;
      USBPHY_DM_STATUS                  at 16#8# range 0 .. 31;
      USBPHY_DM_CTRL                    at 16#C# range 0 .. 31;
      GPIO_QSPI_SCLK_STATUS             at 16#10# range 0 .. 31;
      GPIO_QSPI_SCLK_CTRL               at 16#14# range 0 .. 31;
      GPIO_QSPI_SS_STATUS               at 16#18# range 0 .. 31;
      GPIO_QSPI_SS_CTRL                 at 16#1C# range 0 .. 31;
      GPIO_QSPI_SD0_STATUS              at 16#20# range 0 .. 31;
      GPIO_QSPI_SD0_CTRL                at 16#24# range 0 .. 31;
      GPIO_QSPI_SD1_STATUS              at 16#28# range 0 .. 31;
      GPIO_QSPI_SD1_CTRL                at 16#2C# range 0 .. 31;
      GPIO_QSPI_SD2_STATUS              at 16#30# range 0 .. 31;
      GPIO_QSPI_SD2_CTRL                at 16#34# range 0 .. 31;
      GPIO_QSPI_SD3_STATUS              at 16#38# range 0 .. 31;
      GPIO_QSPI_SD3_CTRL                at 16#3C# range 0 .. 31;
      IRQSUMMARY_PROC0_SECURE           at 16#200# range 0 .. 31;
      IRQSUMMARY_PROC0_NONSECURE        at 16#204# range 0 .. 31;
      IRQSUMMARY_PROC1_SECURE           at 16#208# range 0 .. 31;
      IRQSUMMARY_PROC1_NONSECURE        at 16#20C# range 0 .. 31;
      IRQSUMMARY_DORMANT_WAKE_SECURE    at 16#210# range 0 .. 31;
      IRQSUMMARY_DORMANT_WAKE_NONSECURE at 16#214# range 0 .. 31;
      INTR                              at 16#218# range 0 .. 31;
      PROC0_INTE                        at 16#21C# range 0 .. 31;
      PROC0_INTF                        at 16#220# range 0 .. 31;
      PROC0_INTS                        at 16#224# range 0 .. 31;
      PROC1_INTE                        at 16#228# range 0 .. 31;
      PROC1_INTF                        at 16#22C# range 0 .. 31;
      PROC1_INTS                        at 16#230# range 0 .. 31;
      DORMANT_WAKE_INTE                 at 16#234# range 0 .. 31;
      DORMANT_WAKE_INTF                 at 16#238# range 0 .. 31;
      DORMANT_WAKE_INTS                 at 16#23C# range 0 .. 31;
   end record;

   IO_QSPI_Periph : aliased IO_QSPI_Peripheral
     with Import, Address => IO_QSPI_Base;

end RP2350_SVD.IO_QSPI;
