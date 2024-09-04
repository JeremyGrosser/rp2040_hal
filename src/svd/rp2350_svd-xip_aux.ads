pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

--  Auxiliary DMA access to XIP FIFOs, via fast AHB bus access
package RP2350_SVD.XIP_AUX is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype QMI_DIRECT_TX_DATA_Field is HAL.UInt16;

   --  Configure whether this FIFO record is transferred with single/dual/quad
   --  interface width (0/1/2). Different widths can be mixed freely.
   type QMI_DIRECT_TX_IWIDTH_Field is
     (--  Single width
      S,
      --  Dual width
      D,
      --  Quad width
      Q)
     with Size => 2;
   for QMI_DIRECT_TX_IWIDTH_Field use
     (S => 0,
      D => 1,
      Q => 2);

   --  Write to the QMI direct-mode TX FIFO (fast bus access to QMI_DIRECT_TX)
   type QMI_DIRECT_TX_Register is record
      --  Write-only. Data pushed here will be clocked out falling edges of SCK
      --  (or before the very first rising edge of SCK, if this is the first
      --  pulse). For each byte clocked out, the interface will simultaneously
      --  sample one byte, on rising edges of SCK, and push this to the
      --  DIRECT_RX FIFO. For 16-bit data, the least-significant byte is
      --  transmitted first.
      DATA           : QMI_DIRECT_TX_DATA_Field := 16#0#;
      --  Write-only. Configure whether this FIFO record is transferred with
      --  single/dual/quad interface width (0/1/2). Different widths can be
      --  mixed freely.
      IWIDTH         : QMI_DIRECT_TX_IWIDTH_Field := RP2350_SVD.XIP_AUX.S;
      --  Write-only. Data width. If 0, hardware will transmit the 8 LSBs of
      --  the DIRECT_TX DATA field, and return an 8-bit value in the 8 LSBs of
      --  DIRECT_RX. If 1, the full 16-bit width is used. 8-bit and 16-bit
      --  transfers can be mixed freely.
      DWIDTH         : Boolean := False;
      --  Write-only. Output enable (active-high). For single width (SPI), this
      --  field is ignored, and SD0 is always set to output, with SD1 always
      --  set to input. For dual and quad width (DSPI/QSPI), this sets whether
      --  the relevant SDx pads are set to output whilst transferring this FIFO
      --  record. In this case the command/address should have OE set, and the
      --  data transfer should have OE set or clear depending on the direction
      --  of the transfer.
      OE             : Boolean := False;
      --  Write-only. Inhibit the RX FIFO push that would correspond to this TX
      --  FIFO entry. Useful to avoid garbage appearing in the RX FIFO when
      --  pushing the command at the beginning of a SPI transfer.
      NOPUSH         : Boolean := False;
      --  unspecified
      Reserved_21_31 : HAL.UInt11 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for QMI_DIRECT_TX_Register use record
      DATA           at 0 range 0 .. 15;
      IWIDTH         at 0 range 16 .. 17;
      DWIDTH         at 0 range 18 .. 18;
      OE             at 0 range 19 .. 19;
      NOPUSH         at 0 range 20 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   subtype QMI_DIRECT_RX_QMI_DIRECT_RX_Field is HAL.UInt16;

   --  Read from the QMI direct-mode RX FIFO (fast bus access to QMI_DIRECT_RX)
   type QMI_DIRECT_RX_Register is record
      --  Read-only. *** This field is modified following a read operation ***.
      --  With each byte clocked out on the serial interface, one byte will
      --  simultaneously be clocked in, and will appear in this FIFO. The
      --  serial interface will stall when this FIFO is full, to avoid dropping
      --  data. When 16-bit data is pushed into the TX FIFO, the corresponding
      --  RX FIFO push will also contain 16 bits of data. The least-significant
      --  byte is the first one received.
      QMI_DIRECT_RX  : QMI_DIRECT_RX_QMI_DIRECT_RX_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for QMI_DIRECT_RX_Register use record
      QMI_DIRECT_RX  at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Auxiliary DMA access to XIP FIFOs, via fast AHB bus access
   type XIP_AUX_Peripheral is record
      --  Read the XIP stream FIFO (fast bus access to XIP_CTRL_STREAM_FIFO)
      STREAM        : aliased HAL.UInt32;
      --  Write to the QMI direct-mode TX FIFO (fast bus access to
      --  QMI_DIRECT_TX)
      QMI_DIRECT_TX : aliased QMI_DIRECT_TX_Register;
      --  Read from the QMI direct-mode RX FIFO (fast bus access to
      --  QMI_DIRECT_RX)
      QMI_DIRECT_RX : aliased QMI_DIRECT_RX_Register;
   end record
     with Volatile;

   for XIP_AUX_Peripheral use record
      STREAM        at 16#0# range 0 .. 31;
      QMI_DIRECT_TX at 16#4# range 0 .. 31;
      QMI_DIRECT_RX at 16#8# range 0 .. 31;
   end record;

   --  Auxiliary DMA access to XIP FIFOs, via fast AHB bus access
   XIP_AUX_Periph : aliased XIP_AUX_Peripheral
     with Import, Address => XIP_AUX_Base;

end RP2350_SVD.XIP_AUX;
