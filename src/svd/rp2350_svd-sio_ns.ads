pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

--  Single-cycle IO block 
--              Provides core-local and inter-core hardware for the two
--  processors, with single-cycle access.
package RP2350_SVD.SIO_NS is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype GPIO_HI_IN_GPIO_Field is HAL.UInt16;
   subtype GPIO_HI_IN_QSPI_SD_Field is HAL.UInt4;

   --  Input value on GPIO32...47, QSPI IOs and USB pins In the Non-secure SIO,
   --  Secure-only GPIOs (as per ACCESSCTRL) appear as zero.
   type GPIO_HI_IN_Register is record
      --  Read-only. Input value on GPIO32...47
      GPIO           : GPIO_HI_IN_GPIO_Field;
      --  unspecified
      Reserved_16_23 : HAL.UInt8;
      --  Read-only. Input value on USB D+ pin
      USB_DP         : Boolean;
      --  Read-only. Input value on USB D- pin
      USB_DM         : Boolean;
      --  Read-only. Input value on QSPI SCK pin
      QSPI_SCK       : Boolean;
      --  Read-only. Input value on QSPI CSn pin
      QSPI_CSN       : Boolean;
      --  Read-only. Input value on QSPI SD0 (MOSI), SD1 (MISO), SD2 and SD3
      --  pins
      QSPI_SD        : GPIO_HI_IN_QSPI_SD_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO_HI_IN_Register use record
      GPIO           at 0 range 0 .. 15;
      Reserved_16_23 at 0 range 16 .. 23;
      USB_DP         at 0 range 24 .. 24;
      USB_DM         at 0 range 25 .. 25;
      QSPI_SCK       at 0 range 26 .. 26;
      QSPI_CSN       at 0 range 27 .. 27;
      QSPI_SD        at 0 range 28 .. 31;
   end record;

   subtype GPIO_HI_OUT_GPIO_Field is HAL.UInt16;
   subtype GPIO_HI_OUT_QSPI_SD_Field is HAL.UInt4;

   --  Output value for GPIO32...47, QSPI IOs and USB pins. Write to set output
   --  level (1/0 -> high/low). Reading back gives the last value written, NOT
   --  the input value from the pins. If core 0 and core 1 both write to
   --  GPIO_HI_OUT simultaneously (or to a SET/CLR/XOR alias), the result is as
   --  though the write from core 0 took place first, and the write from core 1
   --  was then applied to that intermediate result. In the Non-secure SIO,
   --  Secure-only GPIOs (as per ACCESSCTRL) ignore writes, and their output
   --  status reads back as zero. This is also true for SET/CLR/XOR aliases of
   --  this register.
   type GPIO_HI_OUT_Register is record
      --  Output value for GPIO32...47
      GPIO           : GPIO_HI_OUT_GPIO_Field := 16#0#;
      --  unspecified
      Reserved_16_23 : HAL.UInt8 := 16#0#;
      --  Output value for USB D+ pin
      USB_DP         : Boolean := False;
      --  Output value for USB D- pin
      USB_DM         : Boolean := False;
      --  Output value for QSPI SCK pin
      QSPI_SCK       : Boolean := False;
      --  Output value for QSPI CSn pin
      QSPI_CSN       : Boolean := False;
      --  Output value for QSPI SD0 (MOSI), SD1 (MISO), SD2 and SD3 pins
      QSPI_SD        : GPIO_HI_OUT_QSPI_SD_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO_HI_OUT_Register use record
      GPIO           at 0 range 0 .. 15;
      Reserved_16_23 at 0 range 16 .. 23;
      USB_DP         at 0 range 24 .. 24;
      USB_DM         at 0 range 25 .. 25;
      QSPI_SCK       at 0 range 26 .. 26;
      QSPI_CSN       at 0 range 27 .. 27;
      QSPI_SD        at 0 range 28 .. 31;
   end record;

   subtype GPIO_HI_OUT_SET_GPIO_Field is HAL.UInt16;
   subtype GPIO_HI_OUT_SET_QSPI_SD_Field is HAL.UInt4;

   --  Output value set for GPIO32..47, QSPI IOs and USB pins. Perform an
   --  atomic bit-set on GPIO_HI_OUT, i.e. `GPIO_HI_OUT |= wdata`
   type GPIO_HI_OUT_SET_Register is record
      --  Write-only.
      GPIO           : GPIO_HI_OUT_SET_GPIO_Field := 16#0#;
      --  unspecified
      Reserved_16_23 : HAL.UInt8 := 16#0#;
      --  Write-only.
      USB_DP         : Boolean := False;
      --  Write-only.
      USB_DM         : Boolean := False;
      --  Write-only.
      QSPI_SCK       : Boolean := False;
      --  Write-only.
      QSPI_CSN       : Boolean := False;
      --  Write-only.
      QSPI_SD        : GPIO_HI_OUT_SET_QSPI_SD_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO_HI_OUT_SET_Register use record
      GPIO           at 0 range 0 .. 15;
      Reserved_16_23 at 0 range 16 .. 23;
      USB_DP         at 0 range 24 .. 24;
      USB_DM         at 0 range 25 .. 25;
      QSPI_SCK       at 0 range 26 .. 26;
      QSPI_CSN       at 0 range 27 .. 27;
      QSPI_SD        at 0 range 28 .. 31;
   end record;

   subtype GPIO_HI_OUT_CLR_GPIO_Field is HAL.UInt16;
   subtype GPIO_HI_OUT_CLR_QSPI_SD_Field is HAL.UInt4;

   --  Output value clear for GPIO32..47, QSPI IOs and USB pins. Perform an
   --  atomic bit-clear on GPIO_HI_OUT, i.e. `GPIO_HI_OUT &= ~wdata`
   type GPIO_HI_OUT_CLR_Register is record
      --  Write-only.
      GPIO           : GPIO_HI_OUT_CLR_GPIO_Field := 16#0#;
      --  unspecified
      Reserved_16_23 : HAL.UInt8 := 16#0#;
      --  Write-only.
      USB_DP         : Boolean := False;
      --  Write-only.
      USB_DM         : Boolean := False;
      --  Write-only.
      QSPI_SCK       : Boolean := False;
      --  Write-only.
      QSPI_CSN       : Boolean := False;
      --  Write-only.
      QSPI_SD        : GPIO_HI_OUT_CLR_QSPI_SD_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO_HI_OUT_CLR_Register use record
      GPIO           at 0 range 0 .. 15;
      Reserved_16_23 at 0 range 16 .. 23;
      USB_DP         at 0 range 24 .. 24;
      USB_DM         at 0 range 25 .. 25;
      QSPI_SCK       at 0 range 26 .. 26;
      QSPI_CSN       at 0 range 27 .. 27;
      QSPI_SD        at 0 range 28 .. 31;
   end record;

   subtype GPIO_HI_OUT_XOR_GPIO_Field is HAL.UInt16;
   subtype GPIO_HI_OUT_XOR_QSPI_SD_Field is HAL.UInt4;

   --  Output value XOR for GPIO32..47, QSPI IOs and USB pins. Perform an
   --  atomic bitwise XOR on GPIO_HI_OUT, i.e. `GPIO_HI_OUT ^= wdata`
   type GPIO_HI_OUT_XOR_Register is record
      --  Write-only.
      GPIO           : GPIO_HI_OUT_XOR_GPIO_Field := 16#0#;
      --  unspecified
      Reserved_16_23 : HAL.UInt8 := 16#0#;
      --  Write-only.
      USB_DP         : Boolean := False;
      --  Write-only.
      USB_DM         : Boolean := False;
      --  Write-only.
      QSPI_SCK       : Boolean := False;
      --  Write-only.
      QSPI_CSN       : Boolean := False;
      --  Write-only.
      QSPI_SD        : GPIO_HI_OUT_XOR_QSPI_SD_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO_HI_OUT_XOR_Register use record
      GPIO           at 0 range 0 .. 15;
      Reserved_16_23 at 0 range 16 .. 23;
      USB_DP         at 0 range 24 .. 24;
      USB_DM         at 0 range 25 .. 25;
      QSPI_SCK       at 0 range 26 .. 26;
      QSPI_CSN       at 0 range 27 .. 27;
      QSPI_SD        at 0 range 28 .. 31;
   end record;

   subtype GPIO_HI_OE_GPIO_Field is HAL.UInt16;
   subtype GPIO_HI_OE_QSPI_SD_Field is HAL.UInt4;

   --  Output enable value for GPIO32...47, QSPI IOs and USB pins. Write output
   --  enable (1/0 -> output/input). Reading back gives the last value written.
   --  If core 0 and core 1 both write to GPIO_HI_OE simultaneously (or to a
   --  SET/CLR/XOR alias), the result is as though the write from core 0 took
   --  place first, and the write from core 1 was then applied to that
   --  intermediate result. In the Non-secure SIO, Secure-only GPIOs (as per
   --  ACCESSCTRL) ignore writes, and their output status reads back as zero.
   --  This is also true for SET/CLR/XOR aliases of this register.
   type GPIO_HI_OE_Register is record
      --  Output enable value for GPIO32...47
      GPIO           : GPIO_HI_OE_GPIO_Field := 16#0#;
      --  unspecified
      Reserved_16_23 : HAL.UInt8 := 16#0#;
      --  Output enable value for USB D+ pin
      USB_DP         : Boolean := False;
      --  Output enable value for USB D- pin
      USB_DM         : Boolean := False;
      --  Output enable value for QSPI SCK pin
      QSPI_SCK       : Boolean := False;
      --  Output enable value for QSPI CSn pin
      QSPI_CSN       : Boolean := False;
      --  Output enable value for QSPI SD0 (MOSI), SD1 (MISO), SD2 and SD3 pins
      QSPI_SD        : GPIO_HI_OE_QSPI_SD_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO_HI_OE_Register use record
      GPIO           at 0 range 0 .. 15;
      Reserved_16_23 at 0 range 16 .. 23;
      USB_DP         at 0 range 24 .. 24;
      USB_DM         at 0 range 25 .. 25;
      QSPI_SCK       at 0 range 26 .. 26;
      QSPI_CSN       at 0 range 27 .. 27;
      QSPI_SD        at 0 range 28 .. 31;
   end record;

   subtype GPIO_HI_OE_SET_GPIO_Field is HAL.UInt16;
   subtype GPIO_HI_OE_SET_QSPI_SD_Field is HAL.UInt4;

   --  Output enable set for GPIO32...47, QSPI IOs and USB pins. Perform an
   --  atomic bit-set on GPIO_HI_OE, i.e. `GPIO_HI_OE |= wdata`
   type GPIO_HI_OE_SET_Register is record
      --  Write-only.
      GPIO           : GPIO_HI_OE_SET_GPIO_Field := 16#0#;
      --  unspecified
      Reserved_16_23 : HAL.UInt8 := 16#0#;
      --  Write-only.
      USB_DP         : Boolean := False;
      --  Write-only.
      USB_DM         : Boolean := False;
      --  Write-only.
      QSPI_SCK       : Boolean := False;
      --  Write-only.
      QSPI_CSN       : Boolean := False;
      --  Write-only.
      QSPI_SD        : GPIO_HI_OE_SET_QSPI_SD_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO_HI_OE_SET_Register use record
      GPIO           at 0 range 0 .. 15;
      Reserved_16_23 at 0 range 16 .. 23;
      USB_DP         at 0 range 24 .. 24;
      USB_DM         at 0 range 25 .. 25;
      QSPI_SCK       at 0 range 26 .. 26;
      QSPI_CSN       at 0 range 27 .. 27;
      QSPI_SD        at 0 range 28 .. 31;
   end record;

   subtype GPIO_HI_OE_CLR_GPIO_Field is HAL.UInt16;
   subtype GPIO_HI_OE_CLR_QSPI_SD_Field is HAL.UInt4;

   --  Output enable clear for GPIO32...47, QSPI IOs and USB pins. Perform an
   --  atomic bit-clear on GPIO_HI_OE, i.e. `GPIO_HI_OE &= ~wdata`
   type GPIO_HI_OE_CLR_Register is record
      --  Write-only.
      GPIO           : GPIO_HI_OE_CLR_GPIO_Field := 16#0#;
      --  unspecified
      Reserved_16_23 : HAL.UInt8 := 16#0#;
      --  Write-only.
      USB_DP         : Boolean := False;
      --  Write-only.
      USB_DM         : Boolean := False;
      --  Write-only.
      QSPI_SCK       : Boolean := False;
      --  Write-only.
      QSPI_CSN       : Boolean := False;
      --  Write-only.
      QSPI_SD        : GPIO_HI_OE_CLR_QSPI_SD_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO_HI_OE_CLR_Register use record
      GPIO           at 0 range 0 .. 15;
      Reserved_16_23 at 0 range 16 .. 23;
      USB_DP         at 0 range 24 .. 24;
      USB_DM         at 0 range 25 .. 25;
      QSPI_SCK       at 0 range 26 .. 26;
      QSPI_CSN       at 0 range 27 .. 27;
      QSPI_SD        at 0 range 28 .. 31;
   end record;

   subtype GPIO_HI_OE_XOR_GPIO_Field is HAL.UInt16;
   subtype GPIO_HI_OE_XOR_QSPI_SD_Field is HAL.UInt4;

   --  Output enable XOR for GPIO32...47, QSPI IOs and USB pins. Perform an
   --  atomic bitwise XOR on GPIO_HI_OE, i.e. `GPIO_HI_OE ^= wdata`
   type GPIO_HI_OE_XOR_Register is record
      --  Write-only.
      GPIO           : GPIO_HI_OE_XOR_GPIO_Field := 16#0#;
      --  unspecified
      Reserved_16_23 : HAL.UInt8 := 16#0#;
      --  Write-only.
      USB_DP         : Boolean := False;
      --  Write-only.
      USB_DM         : Boolean := False;
      --  Write-only.
      QSPI_SCK       : Boolean := False;
      --  Write-only.
      QSPI_CSN       : Boolean := False;
      --  Write-only.
      QSPI_SD        : GPIO_HI_OE_XOR_QSPI_SD_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO_HI_OE_XOR_Register use record
      GPIO           at 0 range 0 .. 15;
      Reserved_16_23 at 0 range 16 .. 23;
      USB_DP         at 0 range 24 .. 24;
      USB_DM         at 0 range 25 .. 25;
      QSPI_SCK       at 0 range 26 .. 26;
      QSPI_CSN       at 0 range 27 .. 27;
      QSPI_SD        at 0 range 28 .. 31;
   end record;

   --  Status register for inter-core FIFOs (mailboxes). There is one FIFO in
   --  the core 0 -> core 1 direction, and one core 1 -> core 0. Both are 32
   --  bits wide and 8 words deep. Core 0 can see the read side of the 1->0
   --  FIFO (RX), and the write side of 0->1 FIFO (TX). Core 1 can see the read
   --  side of the 0->1 FIFO (RX), and the write side of 1->0 FIFO (TX). The
   --  SIO IRQ for each core is the logical OR of the VLD, WOF and ROE fields
   --  of its FIFO_ST register.
   type FIFO_ST_Register is record
      --  Read-only. Value is 1 if this core's RX FIFO is not empty (i.e. if
      --  FIFO_RD is valid)
      VLD           : Boolean := False;
      --  Read-only. Value is 1 if this core's TX FIFO is not full (i.e. if
      --  FIFO_WR is ready for more data)
      RDY           : Boolean := True;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Sticky flag indicating the TX FIFO was written when
      --  full. This write was ignored by the FIFO.
      WOF           : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Sticky flag indicating the RX FIFO was read when empty.
      --  This read was ignored by the FIFO.
      ROE           : Boolean := False;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FIFO_ST_Register use record
      VLD           at 0 range 0 .. 0;
      RDY           at 0 range 1 .. 1;
      WOF           at 0 range 2 .. 2;
      ROE           at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype INTERP0_CTRL_LANE0_SHIFT_Field is HAL.UInt5;
   subtype INTERP0_CTRL_LANE0_MASK_LSB_Field is HAL.UInt5;
   subtype INTERP0_CTRL_LANE0_MASK_MSB_Field is HAL.UInt5;
   subtype INTERP0_CTRL_LANE0_FORCE_MSB_Field is HAL.UInt2;

   --  INTERP0_CTRL_LANE0_OVERF array
   type INTERP0_CTRL_LANE0_OVERF_Field_Array is array (0 .. 2) of Boolean
     with Component_Size => 1, Size => 3;

   --  Type definition for INTERP0_CTRL_LANE0_OVERF
   type INTERP0_CTRL_LANE0_OVERF_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OVERF as a value
            Val : HAL.UInt3;
         when True =>
            --  OVERF as an array
            Arr : INTERP0_CTRL_LANE0_OVERF_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for INTERP0_CTRL_LANE0_OVERF_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   --  Control register for lane 0
   type INTERP0_CTRL_LANE0_Register is record
      --  Right-rotate applied to accumulator before masking. By appropriately
      --  configuring the masks, left and right shifts can be synthesised.
      SHIFT          : INTERP0_CTRL_LANE0_SHIFT_Field := 16#0#;
      --  The least-significant bit allowed to pass by the mask (inclusive)
      MASK_LSB       : INTERP0_CTRL_LANE0_MASK_LSB_Field := 16#0#;
      --  The most-significant bit allowed to pass by the mask (inclusive)
      --  Setting MSB < LSB may cause chip to turn inside-out
      MASK_MSB       : INTERP0_CTRL_LANE0_MASK_MSB_Field := 16#0#;
      --  If SIGNED is set, the shifted and masked accumulator value is
      --  sign-extended to 32 bits before adding to BASE0, and LANE0 PEEK/POP
      --  appear extended to 32 bits when read by processor.
      SIGNED         : Boolean := False;
      --  If 1, feed the opposite lane's accumulator into this lane's shift +
      --  mask hardware. Takes effect even if ADD_RAW is set (the CROSS_INPUT
      --  mux is before the shift+mask bypass)
      CROSS_INPUT    : Boolean := False;
      --  If 1, feed the opposite lane's result into this lane's accumulator on
      --  POP.
      CROSS_RESULT   : Boolean := False;
      --  If 1, mask + shift is bypassed for LANE0 result. This does not affect
      --  FULL result.
      ADD_RAW        : Boolean := False;
      --  ORed into bits 29:28 of the lane result presented to the processor on
      --  the bus. No effect on the internal 32-bit datapath. Handy for using a
      --  lane to generate sequence of pointers into flash or SRAM.
      FORCE_MSB      : INTERP0_CTRL_LANE0_FORCE_MSB_Field := 16#0#;
      --  Only present on INTERP0 on each core. If BLEND mode is enabled: -
      --  LANE1 result is a linear interpolation between BASE0 and BASE1,
      --  controlled by the 8 LSBs of lane 1 shift and mask value (a fractional
      --  number between 0 and 255/256ths) - LANE0 result does not have BASE0
      --  added (yields only the 8 LSBs of lane 1 shift+mask value) - FULL
      --  result does not have lane 1 shift+mask value added (BASE2 + lane 0
      --  shift+mask) LANE1 SIGNED flag controls whether the interpolation is
      --  signed or unsigned.
      BLEND          : Boolean := False;
      --  unspecified
      Reserved_22_22 : HAL.Bit := 16#0#;
      --  Read-only. Indicates if any masked-off MSBs in ACCUM0 are set.
      OVERF          : INTERP0_CTRL_LANE0_OVERF_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_26_31 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTERP0_CTRL_LANE0_Register use record
      SHIFT          at 0 range 0 .. 4;
      MASK_LSB       at 0 range 5 .. 9;
      MASK_MSB       at 0 range 10 .. 14;
      SIGNED         at 0 range 15 .. 15;
      CROSS_INPUT    at 0 range 16 .. 16;
      CROSS_RESULT   at 0 range 17 .. 17;
      ADD_RAW        at 0 range 18 .. 18;
      FORCE_MSB      at 0 range 19 .. 20;
      BLEND          at 0 range 21 .. 21;
      Reserved_22_22 at 0 range 22 .. 22;
      OVERF          at 0 range 23 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype INTERP0_CTRL_LANE1_SHIFT_Field is HAL.UInt5;
   subtype INTERP0_CTRL_LANE1_MASK_LSB_Field is HAL.UInt5;
   subtype INTERP0_CTRL_LANE1_MASK_MSB_Field is HAL.UInt5;
   subtype INTERP0_CTRL_LANE1_FORCE_MSB_Field is HAL.UInt2;

   --  Control register for lane 1
   type INTERP0_CTRL_LANE1_Register is record
      --  Right-rotate applied to accumulator before masking. By appropriately
      --  configuring the masks, left and right shifts can be synthesised.
      SHIFT          : INTERP0_CTRL_LANE1_SHIFT_Field := 16#0#;
      --  The least-significant bit allowed to pass by the mask (inclusive)
      MASK_LSB       : INTERP0_CTRL_LANE1_MASK_LSB_Field := 16#0#;
      --  The most-significant bit allowed to pass by the mask (inclusive)
      --  Setting MSB < LSB may cause chip to turn inside-out
      MASK_MSB       : INTERP0_CTRL_LANE1_MASK_MSB_Field := 16#0#;
      --  If SIGNED is set, the shifted and masked accumulator value is
      --  sign-extended to 32 bits before adding to BASE1, and LANE1 PEEK/POP
      --  appear extended to 32 bits when read by processor.
      SIGNED         : Boolean := False;
      --  If 1, feed the opposite lane's accumulator into this lane's shift +
      --  mask hardware. Takes effect even if ADD_RAW is set (the CROSS_INPUT
      --  mux is before the shift+mask bypass)
      CROSS_INPUT    : Boolean := False;
      --  If 1, feed the opposite lane's result into this lane's accumulator on
      --  POP.
      CROSS_RESULT   : Boolean := False;
      --  If 1, mask + shift is bypassed for LANE1 result. This does not affect
      --  FULL result.
      ADD_RAW        : Boolean := False;
      --  ORed into bits 29:28 of the lane result presented to the processor on
      --  the bus. No effect on the internal 32-bit datapath. Handy for using a
      --  lane to generate sequence of pointers into flash or SRAM.
      FORCE_MSB      : INTERP0_CTRL_LANE1_FORCE_MSB_Field := 16#0#;
      --  unspecified
      Reserved_21_31 : HAL.UInt11 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTERP0_CTRL_LANE1_Register use record
      SHIFT          at 0 range 0 .. 4;
      MASK_LSB       at 0 range 5 .. 9;
      MASK_MSB       at 0 range 10 .. 14;
      SIGNED         at 0 range 15 .. 15;
      CROSS_INPUT    at 0 range 16 .. 16;
      CROSS_RESULT   at 0 range 17 .. 17;
      ADD_RAW        at 0 range 18 .. 18;
      FORCE_MSB      at 0 range 19 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   subtype INTERP0_ACCUM0_ADD_INTERP0_ACCUM0_ADD_Field is HAL.UInt24;

   --  Values written here are atomically added to ACCUM0 Reading yields lane
   --  0's raw shift and mask value (BASE0 not added).
   type INTERP0_ACCUM0_ADD_Register is record
      INTERP0_ACCUM0_ADD : INTERP0_ACCUM0_ADD_INTERP0_ACCUM0_ADD_Field :=
                            16#0#;
      --  unspecified
      Reserved_24_31     : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTERP0_ACCUM0_ADD_Register use record
      INTERP0_ACCUM0_ADD at 0 range 0 .. 23;
      Reserved_24_31     at 0 range 24 .. 31;
   end record;

   subtype INTERP0_ACCUM1_ADD_INTERP0_ACCUM1_ADD_Field is HAL.UInt24;

   --  Values written here are atomically added to ACCUM1 Reading yields lane
   --  1's raw shift and mask value (BASE1 not added).
   type INTERP0_ACCUM1_ADD_Register is record
      INTERP0_ACCUM1_ADD : INTERP0_ACCUM1_ADD_INTERP0_ACCUM1_ADD_Field :=
                            16#0#;
      --  unspecified
      Reserved_24_31     : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTERP0_ACCUM1_ADD_Register use record
      INTERP0_ACCUM1_ADD at 0 range 0 .. 23;
      Reserved_24_31     at 0 range 24 .. 31;
   end record;

   subtype INTERP1_CTRL_LANE0_SHIFT_Field is HAL.UInt5;
   subtype INTERP1_CTRL_LANE0_MASK_LSB_Field is HAL.UInt5;
   subtype INTERP1_CTRL_LANE0_MASK_MSB_Field is HAL.UInt5;
   subtype INTERP1_CTRL_LANE0_FORCE_MSB_Field is HAL.UInt2;

   --  INTERP1_CTRL_LANE0_OVERF array
   type INTERP1_CTRL_LANE0_OVERF_Field_Array is array (0 .. 2) of Boolean
     with Component_Size => 1, Size => 3;

   --  Type definition for INTERP1_CTRL_LANE0_OVERF
   type INTERP1_CTRL_LANE0_OVERF_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OVERF as a value
            Val : HAL.UInt3;
         when True =>
            --  OVERF as an array
            Arr : INTERP1_CTRL_LANE0_OVERF_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for INTERP1_CTRL_LANE0_OVERF_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   --  Control register for lane 0
   type INTERP1_CTRL_LANE0_Register is record
      --  Right-rotate applied to accumulator before masking. By appropriately
      --  configuring the masks, left and right shifts can be synthesised.
      SHIFT          : INTERP1_CTRL_LANE0_SHIFT_Field := 16#0#;
      --  The least-significant bit allowed to pass by the mask (inclusive)
      MASK_LSB       : INTERP1_CTRL_LANE0_MASK_LSB_Field := 16#0#;
      --  The most-significant bit allowed to pass by the mask (inclusive)
      --  Setting MSB < LSB may cause chip to turn inside-out
      MASK_MSB       : INTERP1_CTRL_LANE0_MASK_MSB_Field := 16#0#;
      --  If SIGNED is set, the shifted and masked accumulator value is
      --  sign-extended to 32 bits before adding to BASE0, and LANE0 PEEK/POP
      --  appear extended to 32 bits when read by processor.
      SIGNED         : Boolean := False;
      --  If 1, feed the opposite lane's accumulator into this lane's shift +
      --  mask hardware. Takes effect even if ADD_RAW is set (the CROSS_INPUT
      --  mux is before the shift+mask bypass)
      CROSS_INPUT    : Boolean := False;
      --  If 1, feed the opposite lane's result into this lane's accumulator on
      --  POP.
      CROSS_RESULT   : Boolean := False;
      --  If 1, mask + shift is bypassed for LANE0 result. This does not affect
      --  FULL result.
      ADD_RAW        : Boolean := False;
      --  ORed into bits 29:28 of the lane result presented to the processor on
      --  the bus. No effect on the internal 32-bit datapath. Handy for using a
      --  lane to generate sequence of pointers into flash or SRAM.
      FORCE_MSB      : INTERP1_CTRL_LANE0_FORCE_MSB_Field := 16#0#;
      --  unspecified
      Reserved_21_21 : HAL.Bit := 16#0#;
      --  Only present on INTERP1 on each core. If CLAMP mode is enabled: -
      --  LANE0 result is shifted and masked ACCUM0, clamped by a lower bound
      --  of BASE0 and an upper bound of BASE1. - Signedness of these
      --  comparisons is determined by LANE0_CTRL_SIGNED
      CLAMP          : Boolean := False;
      --  Read-only. Indicates if any masked-off MSBs in ACCUM0 are set.
      OVERF          : INTERP1_CTRL_LANE0_OVERF_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_26_31 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTERP1_CTRL_LANE0_Register use record
      SHIFT          at 0 range 0 .. 4;
      MASK_LSB       at 0 range 5 .. 9;
      MASK_MSB       at 0 range 10 .. 14;
      SIGNED         at 0 range 15 .. 15;
      CROSS_INPUT    at 0 range 16 .. 16;
      CROSS_RESULT   at 0 range 17 .. 17;
      ADD_RAW        at 0 range 18 .. 18;
      FORCE_MSB      at 0 range 19 .. 20;
      Reserved_21_21 at 0 range 21 .. 21;
      CLAMP          at 0 range 22 .. 22;
      OVERF          at 0 range 23 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype INTERP1_CTRL_LANE1_SHIFT_Field is HAL.UInt5;
   subtype INTERP1_CTRL_LANE1_MASK_LSB_Field is HAL.UInt5;
   subtype INTERP1_CTRL_LANE1_MASK_MSB_Field is HAL.UInt5;
   subtype INTERP1_CTRL_LANE1_FORCE_MSB_Field is HAL.UInt2;

   --  Control register for lane 1
   type INTERP1_CTRL_LANE1_Register is record
      --  Right-rotate applied to accumulator before masking. By appropriately
      --  configuring the masks, left and right shifts can be synthesised.
      SHIFT          : INTERP1_CTRL_LANE1_SHIFT_Field := 16#0#;
      --  The least-significant bit allowed to pass by the mask (inclusive)
      MASK_LSB       : INTERP1_CTRL_LANE1_MASK_LSB_Field := 16#0#;
      --  The most-significant bit allowed to pass by the mask (inclusive)
      --  Setting MSB < LSB may cause chip to turn inside-out
      MASK_MSB       : INTERP1_CTRL_LANE1_MASK_MSB_Field := 16#0#;
      --  If SIGNED is set, the shifted and masked accumulator value is
      --  sign-extended to 32 bits before adding to BASE1, and LANE1 PEEK/POP
      --  appear extended to 32 bits when read by processor.
      SIGNED         : Boolean := False;
      --  If 1, feed the opposite lane's accumulator into this lane's shift +
      --  mask hardware. Takes effect even if ADD_RAW is set (the CROSS_INPUT
      --  mux is before the shift+mask bypass)
      CROSS_INPUT    : Boolean := False;
      --  If 1, feed the opposite lane's result into this lane's accumulator on
      --  POP.
      CROSS_RESULT   : Boolean := False;
      --  If 1, mask + shift is bypassed for LANE1 result. This does not affect
      --  FULL result.
      ADD_RAW        : Boolean := False;
      --  ORed into bits 29:28 of the lane result presented to the processor on
      --  the bus. No effect on the internal 32-bit datapath. Handy for using a
      --  lane to generate sequence of pointers into flash or SRAM.
      FORCE_MSB      : INTERP1_CTRL_LANE1_FORCE_MSB_Field := 16#0#;
      --  unspecified
      Reserved_21_31 : HAL.UInt11 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTERP1_CTRL_LANE1_Register use record
      SHIFT          at 0 range 0 .. 4;
      MASK_LSB       at 0 range 5 .. 9;
      MASK_MSB       at 0 range 10 .. 14;
      SIGNED         at 0 range 15 .. 15;
      CROSS_INPUT    at 0 range 16 .. 16;
      CROSS_RESULT   at 0 range 17 .. 17;
      ADD_RAW        at 0 range 18 .. 18;
      FORCE_MSB      at 0 range 19 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   subtype INTERP1_ACCUM0_ADD_INTERP1_ACCUM0_ADD_Field is HAL.UInt24;

   --  Values written here are atomically added to ACCUM0 Reading yields lane
   --  0's raw shift and mask value (BASE0 not added).
   type INTERP1_ACCUM0_ADD_Register is record
      INTERP1_ACCUM0_ADD : INTERP1_ACCUM0_ADD_INTERP1_ACCUM0_ADD_Field :=
                            16#0#;
      --  unspecified
      Reserved_24_31     : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTERP1_ACCUM0_ADD_Register use record
      INTERP1_ACCUM0_ADD at 0 range 0 .. 23;
      Reserved_24_31     at 0 range 24 .. 31;
   end record;

   subtype INTERP1_ACCUM1_ADD_INTERP1_ACCUM1_ADD_Field is HAL.UInt24;

   --  Values written here are atomically added to ACCUM1 Reading yields lane
   --  1's raw shift and mask value (BASE1 not added).
   type INTERP1_ACCUM1_ADD_Register is record
      INTERP1_ACCUM1_ADD : INTERP1_ACCUM1_ADD_INTERP1_ACCUM1_ADD_Field :=
                            16#0#;
      --  unspecified
      Reserved_24_31     : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTERP1_ACCUM1_ADD_Register use record
      INTERP1_ACCUM1_ADD at 0 range 0 .. 23;
      Reserved_24_31     at 0 range 24 .. 31;
   end record;

   subtype DOORBELL_OUT_SET_DOORBELL_OUT_SET_Field is HAL.UInt8;

   --  Trigger a doorbell interrupt on the opposite core. Write 1 to a bit to
   --  set the corresponding bit in DOORBELL_IN on the opposite core. This
   --  raises the opposite core's doorbell interrupt. Read to get the status of
   --  the doorbells currently asserted on the opposite core. This is
   --  equivalent to that core reading its own DOORBELL_IN status.
   type DOORBELL_OUT_SET_Register is record
      DOORBELL_OUT_SET : DOORBELL_OUT_SET_DOORBELL_OUT_SET_Field := 16#0#;
      --  unspecified
      Reserved_8_31    : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DOORBELL_OUT_SET_Register use record
      DOORBELL_OUT_SET at 0 range 0 .. 7;
      Reserved_8_31    at 0 range 8 .. 31;
   end record;

   subtype DOORBELL_OUT_CLR_DOORBELL_OUT_CLR_Field is HAL.UInt8;

   --  Clear doorbells which have been posted to the opposite core. This
   --  register is intended for debugging and initialisation purposes. Writing
   --  1 to a bit in DOORBELL_OUT_CLR clears the corresponding bit in
   --  DOORBELL_IN on the opposite core. Clearing all bits will cause that
   --  core's doorbell interrupt to deassert. Since the usual order of events
   --  is for software to send events using DOORBELL_OUT_SET, and acknowledge
   --  incoming events by writing to DOORBELL_IN_CLR, this register should be
   --  used with caution to avoid race conditions. Reading returns the status
   --  of the doorbells currently asserted on the other core, i.e. is
   --  equivalent to that core reading its own DOORBELL_IN status.
   type DOORBELL_OUT_CLR_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      DOORBELL_OUT_CLR : DOORBELL_OUT_CLR_DOORBELL_OUT_CLR_Field := 16#0#;
      --  unspecified
      Reserved_8_31    : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DOORBELL_OUT_CLR_Register use record
      DOORBELL_OUT_CLR at 0 range 0 .. 7;
      Reserved_8_31    at 0 range 8 .. 31;
   end record;

   subtype DOORBELL_IN_SET_DOORBELL_IN_SET_Field is HAL.UInt8;

   --  Write 1s to trigger doorbell interrupts on this core. Read to get status
   --  of doorbells currently asserted on this core.
   type DOORBELL_IN_SET_Register is record
      DOORBELL_IN_SET : DOORBELL_IN_SET_DOORBELL_IN_SET_Field := 16#0#;
      --  unspecified
      Reserved_8_31   : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DOORBELL_IN_SET_Register use record
      DOORBELL_IN_SET at 0 range 0 .. 7;
      Reserved_8_31   at 0 range 8 .. 31;
   end record;

   subtype DOORBELL_IN_CLR_DOORBELL_IN_CLR_Field is HAL.UInt8;

   --  Check and acknowledge doorbells posted to this core. This core's
   --  doorbell interrupt is asserted when any bit in this register is 1. Write
   --  1 to each bit to clear that bit. The doorbell interrupt deasserts once
   --  all bits are cleared. Read to get status of doorbells currently asserted
   --  on this core.
   type DOORBELL_IN_CLR_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      DOORBELL_IN_CLR : DOORBELL_IN_CLR_DOORBELL_IN_CLR_Field := 16#0#;
      --  unspecified
      Reserved_8_31   : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DOORBELL_IN_CLR_Register use record
      DOORBELL_IN_CLR at 0 range 0 .. 7;
      Reserved_8_31   at 0 range 8 .. 31;
   end record;

   --  PERI_NONSEC_INTERP array
   type PERI_NONSEC_INTERP_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for PERI_NONSEC_INTERP
   type PERI_NONSEC_INTERP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  INTERP as a value
            Val : HAL.UInt2;
         when True =>
            --  INTERP as an array
            Arr : PERI_NONSEC_INTERP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for PERI_NONSEC_INTERP_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Detach certain core-local peripherals from Secure SIO, and attach them
   --  to Non-secure SIO, so that Non-secure software can use them. Attempting
   --  to access one of these peripherals from the Secure SIO when it is
   --  attached to the Non-secure SIO, or vice versa, will generate a bus
   --  error. This register is per-core, and is only present on the Secure SIO.
   --  Most SIO hardware is duplicated across the Secure and Non-secure SIO, so
   --  is not listed in this register.
   type PERI_NONSEC_Register is record
      --  If 1, detach interpolator 0 (of this core) from the Secure SIO, and
      --  attach to the Non-secure SIO.
      INTERP        : PERI_NONSEC_INTERP_Field :=
                       (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_4  : HAL.UInt3 := 16#0#;
      --  IF 1, detach TMDS encoder (of this core) from the Secure SIO, and
      --  attach to the Non-secure SIO.
      TMDS          : Boolean := False;
      --  unspecified
      Reserved_6_31 : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PERI_NONSEC_Register use record
      INTERP        at 0 range 0 .. 1;
      Reserved_2_4  at 0 range 2 .. 4;
      TMDS          at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   --  Control the assertion of the standard software interrupt (MIP.MSIP) on
   --  the RISC-V cores. Unlike the RISC-V timer, this interrupt is not routed
   --  to a normal system-level interrupt line, so can not be used by the Arm
   --  cores. It is safe for both cores to write to this register on the same
   --  cycle. The set/clear effect is accumulated across both cores, and then
   --  applied. If a flag is both set and cleared on the same cycle, only the
   --  set takes effect.
   type RISCV_SOFTIRQ_Register is record
      --  Write 1 to atomically set the core 0 software interrupt flag. Read to
      --  get the status of this flag.
      CORE0_SET      : Boolean := False;
      --  Write 1 to atomically set the core 1 software interrupt flag. Read to
      --  get the status of this flag.
      CORE1_SET      : Boolean := False;
      --  unspecified
      Reserved_2_7   : HAL.UInt6 := 16#0#;
      --  Write 1 to atomically clear the core 0 software interrupt flag. Read
      --  to get the status of this flag.
      CORE0_CLR      : Boolean := False;
      --  Write 1 to atomically clear the core 1 software interrupt flag. Read
      --  to get the status of this flag.
      CORE1_CLR      : Boolean := False;
      --  unspecified
      Reserved_10_31 : HAL.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RISCV_SOFTIRQ_Register use record
      CORE0_SET      at 0 range 0 .. 0;
      CORE1_SET      at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      CORE0_CLR      at 0 range 8 .. 8;
      CORE1_CLR      at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   --  MTIME_CTRL_DBGPAUSE_CORE array
   type MTIME_CTRL_DBGPAUSE_CORE_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for MTIME_CTRL_DBGPAUSE_CORE
   type MTIME_CTRL_DBGPAUSE_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  DBGPAUSE_CORE as a value
            Val : HAL.UInt2;
         when True =>
            --  DBGPAUSE_CORE as an array
            Arr : MTIME_CTRL_DBGPAUSE_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for MTIME_CTRL_DBGPAUSE_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Control register for the RISC-V 64-bit Machine-mode timer. This timer is
   --  only present in the Secure SIO, so is only accessible to an Arm core in
   --  Secure mode or a RISC-V core in Machine mode. Note whilst this timer
   --  follows the RISC-V privileged specification, it is equally usable by the
   --  Arm cores. The interrupts are routed to normal system-level interrupt
   --  lines as well as to the MIP.MTIP inputs on the RISC-V cores.
   type MTIME_CTRL_Register is record
      --  Timer enable bit. When 0, the timer will not increment automatically.
      EN            : Boolean := True;
      --  If 1, increment the timer every cycle (i.e. run directly from the
      --  system clock), rather than incrementing on the system-level timer
      --  tick input.
      FULLSPEED     : Boolean := False;
      --  If 1, the timer pauses when core 0 is in the debug halt state.
      DBGPAUSE_CORE : MTIME_CTRL_DBGPAUSE_CORE_Field :=
                       (As_Array => False, Val => 16#1#);
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MTIME_CTRL_Register use record
      EN            at 0 range 0 .. 0;
      FULLSPEED     at 0 range 1 .. 1;
      DBGPAUSE_CORE at 0 range 2 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype TMDS_CTRL_L0_ROT_Field is HAL.UInt4;
   subtype TMDS_CTRL_L1_ROT_Field is HAL.UInt4;
   subtype TMDS_CTRL_L2_ROT_Field is HAL.UInt4;
   subtype TMDS_CTRL_L0_NBITS_Field is HAL.UInt3;
   subtype TMDS_CTRL_L1_NBITS_Field is HAL.UInt3;
   subtype TMDS_CTRL_L2_NBITS_Field is HAL.UInt3;

   --  Shift applied to the colour data register with each read of a POP alias
   --  register. Reading from the POP_SINGLE register, or reading from the
   --  POP_DOUBLE register with PIX2_NOSHIFT set (for pixel doubling), shifts
   --  by the indicated amount. Reading from a POP_DOUBLE register when
   --  PIX2_NOSHIFT is clear will shift by double the indicated amount. (Shift
   --  by 32 means no shift.)
   type TMDS_CTRL_PIX_SHIFT_Field is
     (--  Do not shift the colour data register.
      Val_0,
      --  Shift the colour data register by 1 bit
      Val_1,
      --  Shift the colour data register by 2 bits
      Val_2,
      --  Shift the colour data register by 4 bits
      Val_4,
      --  Shift the colour data register by 8 bits
      Val_8,
      --  Shift the colour data register by 16 bits
      Val_16)
     with Size => 3;
   for TMDS_CTRL_PIX_SHIFT_Field use
     (Val_0 => 0,
      Val_1 => 1,
      Val_2 => 2,
      Val_4 => 3,
      Val_8 => 4,
      Val_16 => 5);

   --  Control register for TMDS encoder.
   type TMDS_CTRL_Register is record
      --  Right-rotate the 16 LSBs of the colour accumulator by 0-15 bits, in
      --  order to get the MSB of the lane 0 (blue) colour data aligned with
      --  the MSB of the 8-bit encoder input. For example, for RGB565 (red most
      --  significant), blue is bits 4:0, so should be right-rotated by 13 to
      --  align with bits 7:3 of the encoder input.
      L0_ROT         : TMDS_CTRL_L0_ROT_Field := 16#0#;
      --  Right-rotate the 16 LSBs of the colour accumulator by 0-15 bits, in
      --  order to get the MSB of the lane 1 (green) colour data aligned with
      --  the MSB of the 8-bit encoder input. For example, for RGB565, green is
      --  bits 10:5, so should be right-rotated by 3 bits to align with bits
      --  7:2 of the encoder input.
      L1_ROT         : TMDS_CTRL_L1_ROT_Field := 16#0#;
      --  Right-rotate the 16 LSBs of the colour accumulator by 0-15 bits, in
      --  order to get the MSB of the lane 2 (red) colour data aligned with the
      --  MSB of the 8-bit encoder input. For example, for RGB565 (red most
      --  significant), red is bits 15:11, so should be right-rotated by 8 bits
      --  to align with bits 7:3 of the encoder input.
      L2_ROT         : TMDS_CTRL_L2_ROT_Field := 16#0#;
      --  Number of valid colour MSBs for lane 0 (1-8 bits, encoded as 0
      --  through 7). Remaining LSBs are masked to 0 after the rotate.
      L0_NBITS       : TMDS_CTRL_L0_NBITS_Field := 16#0#;
      --  Number of valid colour MSBs for lane 1 (1-8 bits, encoded as 0
      --  through 7). Remaining LSBs are masked to 0 after the rotate.
      L1_NBITS       : TMDS_CTRL_L1_NBITS_Field := 16#0#;
      --  Number of valid colour MSBs for lane 2 (1-8 bits, encoded as 0
      --  through 7). Remaining LSBs are masked to 0 after the rotate.
      L2_NBITS       : TMDS_CTRL_L2_NBITS_Field := 16#0#;
      --  unspecified
      Reserved_21_22 : HAL.UInt2 := 16#0#;
      --  Enable lane interleaving for reads of PEEK_SINGLE/POP_SINGLE. When
      --  interleaving is disabled, each of the 3 symbols appears as a
      --  contiguous 10-bit field, with lane 0 being the least-significant and
      --  starting at bit 0 of the register. When interleaving is enabled, the
      --  symbols are packed into 5 chunks of 3 lanes times 2 bits (30 bits
      --  total). Each chunk contains two bits of a TMDS symbol per lane, with
      --  lane 0 being the least significant.
      INTERLEAVE     : Boolean := False;
      --  Shift applied to the colour data register with each read of a POP
      --  alias register. Reading from the POP_SINGLE register, or reading from
      --  the POP_DOUBLE register with PIX2_NOSHIFT set (for pixel doubling),
      --  shifts by the indicated amount. Reading from a POP_DOUBLE register
      --  when PIX2_NOSHIFT is clear will shift by double the indicated amount.
      --  (Shift by 32 means no shift.)
      PIX_SHIFT      : TMDS_CTRL_PIX_SHIFT_Field := RP2350_SVD.SIO_NS.Val_0;
      --  When encoding two pixels's worth of symbols in one cycle (a read of a
      --  PEEK/POP_DOUBLE register), the second encoder sees a shifted version
      --  of the colour data register. This control disables that shift, so
      --  that both encoder layers see the same pixel data. This is used for
      --  pixel doubling.
      PIX2_NOSHIFT   : Boolean := False;
      --  Write-only. Clear the running DC balance state of the TMDS encoders.
      --  This bit should be written once at the beginning of each scanline.
      CLEAR_BALANCE  : Boolean := False;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TMDS_CTRL_Register use record
      L0_ROT         at 0 range 0 .. 3;
      L1_ROT         at 0 range 4 .. 7;
      L2_ROT         at 0 range 8 .. 11;
      L0_NBITS       at 0 range 12 .. 14;
      L1_NBITS       at 0 range 15 .. 17;
      L2_NBITS       at 0 range 18 .. 20;
      Reserved_21_22 at 0 range 21 .. 22;
      INTERLEAVE     at 0 range 23 .. 23;
      PIX_SHIFT      at 0 range 24 .. 26;
      PIX2_NOSHIFT   at 0 range 27 .. 27;
      CLEAR_BALANCE  at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Single-cycle IO block Provides core-local and inter-core hardware for
   --  the two processors, with single-cycle access.
   type SIO_NS_Peripheral is record
      --  Processor core identifier
      CPUID               : aliased HAL.UInt32;
      --  Input value for GPIO0...31. In the Non-secure SIO, Secure-only GPIOs
      --  (as per ACCESSCTRL) appear as zero.
      GPIO_IN             : aliased HAL.UInt32;
      --  Input value on GPIO32...47, QSPI IOs and USB pins In the Non-secure
      --  SIO, Secure-only GPIOs (as per ACCESSCTRL) appear as zero.
      GPIO_HI_IN          : aliased GPIO_HI_IN_Register;
      --  GPIO0...31 output value
      GPIO_OUT            : aliased HAL.UInt32;
      --  Output value for GPIO32...47, QSPI IOs and USB pins. Write to set
      --  output level (1/0 -> high/low). Reading back gives the last value
      --  written, NOT the input value from the pins. If core 0 and core 1 both
      --  write to GPIO_HI_OUT simultaneously (or to a SET/CLR/XOR alias), the
      --  result is as though the write from core 0 took place first, and the
      --  write from core 1 was then applied to that intermediate result. In
      --  the Non-secure SIO, Secure-only GPIOs (as per ACCESSCTRL) ignore
      --  writes, and their output status reads back as zero. This is also true
      --  for SET/CLR/XOR aliases of this register.
      GPIO_HI_OUT         : aliased GPIO_HI_OUT_Register;
      --  GPIO0...31 output value set
      GPIO_OUT_SET        : aliased HAL.UInt32;
      --  Output value set for GPIO32..47, QSPI IOs and USB pins. Perform an
      --  atomic bit-set on GPIO_HI_OUT, i.e. `GPIO_HI_OUT |= wdata`
      GPIO_HI_OUT_SET     : aliased GPIO_HI_OUT_SET_Register;
      --  GPIO0...31 output value clear
      GPIO_OUT_CLR        : aliased HAL.UInt32;
      --  Output value clear for GPIO32..47, QSPI IOs and USB pins. Perform an
      --  atomic bit-clear on GPIO_HI_OUT, i.e. `GPIO_HI_OUT &= ~wdata`
      GPIO_HI_OUT_CLR     : aliased GPIO_HI_OUT_CLR_Register;
      --  GPIO0...31 output value XOR
      GPIO_OUT_XOR        : aliased HAL.UInt32;
      --  Output value XOR for GPIO32..47, QSPI IOs and USB pins. Perform an
      --  atomic bitwise XOR on GPIO_HI_OUT, i.e. `GPIO_HI_OUT ^= wdata`
      GPIO_HI_OUT_XOR     : aliased GPIO_HI_OUT_XOR_Register;
      --  GPIO0...31 output enable
      GPIO_OE             : aliased HAL.UInt32;
      --  Output enable value for GPIO32...47, QSPI IOs and USB pins. Write
      --  output enable (1/0 -> output/input). Reading back gives the last
      --  value written. If core 0 and core 1 both write to GPIO_HI_OE
      --  simultaneously (or to a SET/CLR/XOR alias), the result is as though
      --  the write from core 0 took place first, and the write from core 1 was
      --  then applied to that intermediate result. In the Non-secure SIO,
      --  Secure-only GPIOs (as per ACCESSCTRL) ignore writes, and their output
      --  status reads back as zero. This is also true for SET/CLR/XOR aliases
      --  of this register.
      GPIO_HI_OE          : aliased GPIO_HI_OE_Register;
      --  GPIO0...31 output enable set
      GPIO_OE_SET         : aliased HAL.UInt32;
      --  Output enable set for GPIO32...47, QSPI IOs and USB pins. Perform an
      --  atomic bit-set on GPIO_HI_OE, i.e. `GPIO_HI_OE |= wdata`
      GPIO_HI_OE_SET      : aliased GPIO_HI_OE_SET_Register;
      --  GPIO0...31 output enable clear
      GPIO_OE_CLR         : aliased HAL.UInt32;
      --  Output enable clear for GPIO32...47, QSPI IOs and USB pins. Perform
      --  an atomic bit-clear on GPIO_HI_OE, i.e. `GPIO_HI_OE &= ~wdata`
      GPIO_HI_OE_CLR      : aliased GPIO_HI_OE_CLR_Register;
      --  GPIO0...31 output enable XOR
      GPIO_OE_XOR         : aliased HAL.UInt32;
      --  Output enable XOR for GPIO32...47, QSPI IOs and USB pins. Perform an
      --  atomic bitwise XOR on GPIO_HI_OE, i.e. `GPIO_HI_OE ^= wdata`
      GPIO_HI_OE_XOR      : aliased GPIO_HI_OE_XOR_Register;
      --  Status register for inter-core FIFOs (mailboxes). There is one FIFO
      --  in the core 0 -> core 1 direction, and one core 1 -> core 0. Both are
      --  32 bits wide and 8 words deep. Core 0 can see the read side of the
      --  1->0 FIFO (RX), and the write side of 0->1 FIFO (TX). Core 1 can see
      --  the read side of the 0->1 FIFO (RX), and the write side of 1->0 FIFO
      --  (TX). The SIO IRQ for each core is the logical OR of the VLD, WOF and
      --  ROE fields of its FIFO_ST register.
      FIFO_ST             : aliased FIFO_ST_Register;
      --  Write access to this core's TX FIFO
      FIFO_WR             : aliased HAL.UInt32;
      --  Read access to this core's RX FIFO
      FIFO_RD             : aliased HAL.UInt32;
      --  Spinlock state A bitmap containing the state of all 32 spinlocks
      --  (1=locked). Mainly intended for debugging.
      SPINLOCK_ST         : aliased HAL.UInt32;
      --  Read/write access to accumulator 0
      INTERP0_ACCUM0      : aliased HAL.UInt32;
      --  Read/write access to accumulator 1
      INTERP0_ACCUM1      : aliased HAL.UInt32;
      --  Read/write access to BASE0 register.
      INTERP0_BASE0       : aliased HAL.UInt32;
      --  Read/write access to BASE1 register.
      INTERP0_BASE1       : aliased HAL.UInt32;
      --  Read/write access to BASE2 register.
      INTERP0_BASE2       : aliased HAL.UInt32;
      --  Read LANE0 result, and simultaneously write lane results to both
      --  accumulators (POP).
      INTERP0_POP_LANE0   : aliased HAL.UInt32;
      --  Read LANE1 result, and simultaneously write lane results to both
      --  accumulators (POP).
      INTERP0_POP_LANE1   : aliased HAL.UInt32;
      --  Read FULL result, and simultaneously write lane results to both
      --  accumulators (POP).
      INTERP0_POP_FULL    : aliased HAL.UInt32;
      --  Read LANE0 result, without altering any internal state (PEEK).
      INTERP0_PEEK_LANE0  : aliased HAL.UInt32;
      --  Read LANE1 result, without altering any internal state (PEEK).
      INTERP0_PEEK_LANE1  : aliased HAL.UInt32;
      --  Read FULL result, without altering any internal state (PEEK).
      INTERP0_PEEK_FULL   : aliased HAL.UInt32;
      --  Control register for lane 0
      INTERP0_CTRL_LANE0  : aliased INTERP0_CTRL_LANE0_Register;
      --  Control register for lane 1
      INTERP0_CTRL_LANE1  : aliased INTERP0_CTRL_LANE1_Register;
      --  Values written here are atomically added to ACCUM0 Reading yields
      --  lane 0's raw shift and mask value (BASE0 not added).
      INTERP0_ACCUM0_ADD  : aliased INTERP0_ACCUM0_ADD_Register;
      --  Values written here are atomically added to ACCUM1 Reading yields
      --  lane 1's raw shift and mask value (BASE1 not added).
      INTERP0_ACCUM1_ADD  : aliased INTERP0_ACCUM1_ADD_Register;
      --  On write, the lower 16 bits go to BASE0, upper bits to BASE1
      --  simultaneously. Each half is sign-extended to 32 bits if that lane's
      --  SIGNED flag is set.
      INTERP0_BASE_1AND0  : aliased HAL.UInt32;
      --  Read/write access to accumulator 0
      INTERP1_ACCUM0      : aliased HAL.UInt32;
      --  Read/write access to accumulator 1
      INTERP1_ACCUM1      : aliased HAL.UInt32;
      --  Read/write access to BASE0 register.
      INTERP1_BASE0       : aliased HAL.UInt32;
      --  Read/write access to BASE1 register.
      INTERP1_BASE1       : aliased HAL.UInt32;
      --  Read/write access to BASE2 register.
      INTERP1_BASE2       : aliased HAL.UInt32;
      --  Read LANE0 result, and simultaneously write lane results to both
      --  accumulators (POP).
      INTERP1_POP_LANE0   : aliased HAL.UInt32;
      --  Read LANE1 result, and simultaneously write lane results to both
      --  accumulators (POP).
      INTERP1_POP_LANE1   : aliased HAL.UInt32;
      --  Read FULL result, and simultaneously write lane results to both
      --  accumulators (POP).
      INTERP1_POP_FULL    : aliased HAL.UInt32;
      --  Read LANE0 result, without altering any internal state (PEEK).
      INTERP1_PEEK_LANE0  : aliased HAL.UInt32;
      --  Read LANE1 result, without altering any internal state (PEEK).
      INTERP1_PEEK_LANE1  : aliased HAL.UInt32;
      --  Read FULL result, without altering any internal state (PEEK).
      INTERP1_PEEK_FULL   : aliased HAL.UInt32;
      --  Control register for lane 0
      INTERP1_CTRL_LANE0  : aliased INTERP1_CTRL_LANE0_Register;
      --  Control register for lane 1
      INTERP1_CTRL_LANE1  : aliased INTERP1_CTRL_LANE1_Register;
      --  Values written here are atomically added to ACCUM0 Reading yields
      --  lane 0's raw shift and mask value (BASE0 not added).
      INTERP1_ACCUM0_ADD  : aliased INTERP1_ACCUM0_ADD_Register;
      --  Values written here are atomically added to ACCUM1 Reading yields
      --  lane 1's raw shift and mask value (BASE1 not added).
      INTERP1_ACCUM1_ADD  : aliased INTERP1_ACCUM1_ADD_Register;
      --  On write, the lower 16 bits go to BASE0, upper bits to BASE1
      --  simultaneously. Each half is sign-extended to 32 bits if that lane's
      --  SIGNED flag is set.
      INTERP1_BASE_1AND0  : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK0           : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK1           : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK2           : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK3           : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK4           : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK5           : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK6           : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK7           : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK8           : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK9           : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK10          : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK11          : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK12          : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK13          : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK14          : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK15          : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK16          : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK17          : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK18          : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK19          : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK20          : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK21          : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK22          : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK23          : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK24          : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK25          : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK26          : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK27          : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK28          : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK29          : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK30          : aliased HAL.UInt32;
      --  Reading from a spinlock address will: - Return 0 if lock is already
      --  locked - Otherwise return nonzero, and simultaneously claim the lock
      --  Writing (any value) releases the lock. If core 0 and core 1 attempt
      --  to claim the same lock simultaneously, core 0 wins. The value
      --  returned on success is 0x1 << lock number.
      SPINLOCK31          : aliased HAL.UInt32;
      --  Trigger a doorbell interrupt on the opposite core. Write 1 to a bit
      --  to set the corresponding bit in DOORBELL_IN on the opposite core.
      --  This raises the opposite core's doorbell interrupt. Read to get the
      --  status of the doorbells currently asserted on the opposite core. This
      --  is equivalent to that core reading its own DOORBELL_IN status.
      DOORBELL_OUT_SET    : aliased DOORBELL_OUT_SET_Register;
      --  Clear doorbells which have been posted to the opposite core. This
      --  register is intended for debugging and initialisation purposes.
      --  Writing 1 to a bit in DOORBELL_OUT_CLR clears the corresponding bit
      --  in DOORBELL_IN on the opposite core. Clearing all bits will cause
      --  that core's doorbell interrupt to deassert. Since the usual order of
      --  events is for software to send events using DOORBELL_OUT_SET, and
      --  acknowledge incoming events by writing to DOORBELL_IN_CLR, this
      --  register should be used with caution to avoid race conditions.
      --  Reading returns the status of the doorbells currently asserted on the
      --  other core, i.e. is equivalent to that core reading its own
      --  DOORBELL_IN status.
      DOORBELL_OUT_CLR    : aliased DOORBELL_OUT_CLR_Register;
      --  Write 1s to trigger doorbell interrupts on this core. Read to get
      --  status of doorbells currently asserted on this core.
      DOORBELL_IN_SET     : aliased DOORBELL_IN_SET_Register;
      --  Check and acknowledge doorbells posted to this core. This core's
      --  doorbell interrupt is asserted when any bit in this register is 1.
      --  Write 1 to each bit to clear that bit. The doorbell interrupt
      --  deasserts once all bits are cleared. Read to get status of doorbells
      --  currently asserted on this core.
      DOORBELL_IN_CLR     : aliased DOORBELL_IN_CLR_Register;
      --  Detach certain core-local peripherals from Secure SIO, and attach
      --  them to Non-secure SIO, so that Non-secure software can use them.
      --  Attempting to access one of these peripherals from the Secure SIO
      --  when it is attached to the Non-secure SIO, or vice versa, will
      --  generate a bus error. This register is per-core, and is only present
      --  on the Secure SIO. Most SIO hardware is duplicated across the Secure
      --  and Non-secure SIO, so is not listed in this register.
      PERI_NONSEC         : aliased PERI_NONSEC_Register;
      --  Control the assertion of the standard software interrupt (MIP.MSIP)
      --  on the RISC-V cores. Unlike the RISC-V timer, this interrupt is not
      --  routed to a normal system-level interrupt line, so can not be used by
      --  the Arm cores. It is safe for both cores to write to this register on
      --  the same cycle. The set/clear effect is accumulated across both
      --  cores, and then applied. If a flag is both set and cleared on the
      --  same cycle, only the set takes effect.
      RISCV_SOFTIRQ       : aliased RISCV_SOFTIRQ_Register;
      --  Control register for the RISC-V 64-bit Machine-mode timer. This timer
      --  is only present in the Secure SIO, so is only accessible to an Arm
      --  core in Secure mode or a RISC-V core in Machine mode. Note whilst
      --  this timer follows the RISC-V privileged specification, it is equally
      --  usable by the Arm cores. The interrupts are routed to normal
      --  system-level interrupt lines as well as to the MIP.MTIP inputs on the
      --  RISC-V cores.
      MTIME_CTRL          : aliased MTIME_CTRL_Register;
      --  Read/write access to the high half of RISC-V Machine-mode timer. This
      --  register is shared between both cores. If both cores write on the
      --  same cycle, core 1 takes precedence.
      MTIME               : aliased HAL.UInt32;
      --  Read/write access to the high half of RISC-V Machine-mode timer. This
      --  register is shared between both cores. If both cores write on the
      --  same cycle, core 1 takes precedence.
      MTIMEH              : aliased HAL.UInt32;
      --  Low half of RISC-V Machine-mode timer comparator. This register is
      --  core-local, i.e., each core gets a copy of this register, with the
      --  comparison result routed to its own interrupt line. The timer
      --  interrupt is asserted whenever MTIME is greater than or equal to
      --  MTIMECMP. This comparison is unsigned, and performed on the full
      --  64-bit values.
      MTIMECMP            : aliased HAL.UInt32;
      --  High half of RISC-V Machine-mode timer comparator. This register is
      --  core-local. The timer interrupt is asserted whenever MTIME is greater
      --  than or equal to MTIMECMP. This comparison is unsigned, and performed
      --  on the full 64-bit values.
      MTIMECMPH           : aliased HAL.UInt32;
      --  Control register for TMDS encoder.
      TMDS_CTRL           : aliased TMDS_CTRL_Register;
      --  Write-only access to the TMDS colour data register.
      TMDS_WDATA          : aliased HAL.UInt32;
      --  Get the encoding of one pixel's worth of colour data, packed into a
      --  32-bit value (3x10-bit symbols). The PEEK alias does not shift the
      --  colour register when read, but still advances the running DC balance
      --  state of each encoder. This is useful for pixel doubling.
      TMDS_PEEK_SINGLE    : aliased HAL.UInt32;
      --  Get the encoding of one pixel's worth of colour data, packed into a
      --  32-bit value. The packing is 5 chunks of 3 lanes times 2 bits (30
      --  bits total). Each chunk contains two bits of a TMDS symbol per lane.
      --  This format is intended for shifting out with the HSTX peripheral on
      --  RP2350. The POP alias shifts the colour register when read, as well
      --  as advancing the running DC balance state of each encoder.
      TMDS_POP_SINGLE     : aliased HAL.UInt32;
      --  Get lane 0 of the encoding of two pixels' worth of colour data. Two
      --  10-bit TMDS symbols are packed at the bottom of a 32-bit word. The
      --  PEEK alias does not shift the colour register when read, but still
      --  advances the lane 0 DC balance state. This is useful if all 3 lanes'
      --  worth of encode are to be read at once, rather than processing the
      --  entire scanline for one lane before moving to the next lane.
      TMDS_PEEK_DOUBLE_L0 : aliased HAL.UInt32;
      --  Get lane 0 of the encoding of two pixels' worth of colour data. Two
      --  10-bit TMDS symbols are packed at the bottom of a 32-bit word. The
      --  POP alias shifts the colour register when read, according to the
      --  values of PIX_SHIFT and PIX2_NOSHIFT.
      TMDS_POP_DOUBLE_L0  : aliased HAL.UInt32;
      --  Get lane 1 of the encoding of two pixels' worth of colour data. Two
      --  10-bit TMDS symbols are packed at the bottom of a 32-bit word. The
      --  PEEK alias does not shift the colour register when read, but still
      --  advances the lane 1 DC balance state. This is useful if all 3 lanes'
      --  worth of encode are to be read at once, rather than processing the
      --  entire scanline for one lane before moving to the next lane.
      TMDS_PEEK_DOUBLE_L1 : aliased HAL.UInt32;
      --  Get lane 1 of the encoding of two pixels' worth of colour data. Two
      --  10-bit TMDS symbols are packed at the bottom of a 32-bit word. The
      --  POP alias shifts the colour register when read, according to the
      --  values of PIX_SHIFT and PIX2_NOSHIFT.
      TMDS_POP_DOUBLE_L1  : aliased HAL.UInt32;
      --  Get lane 2 of the encoding of two pixels' worth of colour data. Two
      --  10-bit TMDS symbols are packed at the bottom of a 32-bit word. The
      --  PEEK alias does not shift the colour register when read, but still
      --  advances the lane 2 DC balance state. This is useful if all 3 lanes'
      --  worth of encode are to be read at once, rather than processing the
      --  entire scanline for one lane before moving to the next lane.
      TMDS_PEEK_DOUBLE_L2 : aliased HAL.UInt32;
      --  Get lane 2 of the encoding of two pixels' worth of colour data. Two
      --  10-bit TMDS symbols are packed at the bottom of a 32-bit word. The
      --  POP alias shifts the colour register when read, according to the
      --  values of PIX_SHIFT and PIX2_NOSHIFT.
      TMDS_POP_DOUBLE_L2  : aliased HAL.UInt32;
   end record
     with Volatile;

   for SIO_NS_Peripheral use record
      CPUID               at 16#0# range 0 .. 31;
      GPIO_IN             at 16#4# range 0 .. 31;
      GPIO_HI_IN          at 16#8# range 0 .. 31;
      GPIO_OUT            at 16#10# range 0 .. 31;
      GPIO_HI_OUT         at 16#14# range 0 .. 31;
      GPIO_OUT_SET        at 16#18# range 0 .. 31;
      GPIO_HI_OUT_SET     at 16#1C# range 0 .. 31;
      GPIO_OUT_CLR        at 16#20# range 0 .. 31;
      GPIO_HI_OUT_CLR     at 16#24# range 0 .. 31;
      GPIO_OUT_XOR        at 16#28# range 0 .. 31;
      GPIO_HI_OUT_XOR     at 16#2C# range 0 .. 31;
      GPIO_OE             at 16#30# range 0 .. 31;
      GPIO_HI_OE          at 16#34# range 0 .. 31;
      GPIO_OE_SET         at 16#38# range 0 .. 31;
      GPIO_HI_OE_SET      at 16#3C# range 0 .. 31;
      GPIO_OE_CLR         at 16#40# range 0 .. 31;
      GPIO_HI_OE_CLR      at 16#44# range 0 .. 31;
      GPIO_OE_XOR         at 16#48# range 0 .. 31;
      GPIO_HI_OE_XOR      at 16#4C# range 0 .. 31;
      FIFO_ST             at 16#50# range 0 .. 31;
      FIFO_WR             at 16#54# range 0 .. 31;
      FIFO_RD             at 16#58# range 0 .. 31;
      SPINLOCK_ST         at 16#5C# range 0 .. 31;
      INTERP0_ACCUM0      at 16#80# range 0 .. 31;
      INTERP0_ACCUM1      at 16#84# range 0 .. 31;
      INTERP0_BASE0       at 16#88# range 0 .. 31;
      INTERP0_BASE1       at 16#8C# range 0 .. 31;
      INTERP0_BASE2       at 16#90# range 0 .. 31;
      INTERP0_POP_LANE0   at 16#94# range 0 .. 31;
      INTERP0_POP_LANE1   at 16#98# range 0 .. 31;
      INTERP0_POP_FULL    at 16#9C# range 0 .. 31;
      INTERP0_PEEK_LANE0  at 16#A0# range 0 .. 31;
      INTERP0_PEEK_LANE1  at 16#A4# range 0 .. 31;
      INTERP0_PEEK_FULL   at 16#A8# range 0 .. 31;
      INTERP0_CTRL_LANE0  at 16#AC# range 0 .. 31;
      INTERP0_CTRL_LANE1  at 16#B0# range 0 .. 31;
      INTERP0_ACCUM0_ADD  at 16#B4# range 0 .. 31;
      INTERP0_ACCUM1_ADD  at 16#B8# range 0 .. 31;
      INTERP0_BASE_1AND0  at 16#BC# range 0 .. 31;
      INTERP1_ACCUM0      at 16#C0# range 0 .. 31;
      INTERP1_ACCUM1      at 16#C4# range 0 .. 31;
      INTERP1_BASE0       at 16#C8# range 0 .. 31;
      INTERP1_BASE1       at 16#CC# range 0 .. 31;
      INTERP1_BASE2       at 16#D0# range 0 .. 31;
      INTERP1_POP_LANE0   at 16#D4# range 0 .. 31;
      INTERP1_POP_LANE1   at 16#D8# range 0 .. 31;
      INTERP1_POP_FULL    at 16#DC# range 0 .. 31;
      INTERP1_PEEK_LANE0  at 16#E0# range 0 .. 31;
      INTERP1_PEEK_LANE1  at 16#E4# range 0 .. 31;
      INTERP1_PEEK_FULL   at 16#E8# range 0 .. 31;
      INTERP1_CTRL_LANE0  at 16#EC# range 0 .. 31;
      INTERP1_CTRL_LANE1  at 16#F0# range 0 .. 31;
      INTERP1_ACCUM0_ADD  at 16#F4# range 0 .. 31;
      INTERP1_ACCUM1_ADD  at 16#F8# range 0 .. 31;
      INTERP1_BASE_1AND0  at 16#FC# range 0 .. 31;
      SPINLOCK0           at 16#100# range 0 .. 31;
      SPINLOCK1           at 16#104# range 0 .. 31;
      SPINLOCK2           at 16#108# range 0 .. 31;
      SPINLOCK3           at 16#10C# range 0 .. 31;
      SPINLOCK4           at 16#110# range 0 .. 31;
      SPINLOCK5           at 16#114# range 0 .. 31;
      SPINLOCK6           at 16#118# range 0 .. 31;
      SPINLOCK7           at 16#11C# range 0 .. 31;
      SPINLOCK8           at 16#120# range 0 .. 31;
      SPINLOCK9           at 16#124# range 0 .. 31;
      SPINLOCK10          at 16#128# range 0 .. 31;
      SPINLOCK11          at 16#12C# range 0 .. 31;
      SPINLOCK12          at 16#130# range 0 .. 31;
      SPINLOCK13          at 16#134# range 0 .. 31;
      SPINLOCK14          at 16#138# range 0 .. 31;
      SPINLOCK15          at 16#13C# range 0 .. 31;
      SPINLOCK16          at 16#140# range 0 .. 31;
      SPINLOCK17          at 16#144# range 0 .. 31;
      SPINLOCK18          at 16#148# range 0 .. 31;
      SPINLOCK19          at 16#14C# range 0 .. 31;
      SPINLOCK20          at 16#150# range 0 .. 31;
      SPINLOCK21          at 16#154# range 0 .. 31;
      SPINLOCK22          at 16#158# range 0 .. 31;
      SPINLOCK23          at 16#15C# range 0 .. 31;
      SPINLOCK24          at 16#160# range 0 .. 31;
      SPINLOCK25          at 16#164# range 0 .. 31;
      SPINLOCK26          at 16#168# range 0 .. 31;
      SPINLOCK27          at 16#16C# range 0 .. 31;
      SPINLOCK28          at 16#170# range 0 .. 31;
      SPINLOCK29          at 16#174# range 0 .. 31;
      SPINLOCK30          at 16#178# range 0 .. 31;
      SPINLOCK31          at 16#17C# range 0 .. 31;
      DOORBELL_OUT_SET    at 16#180# range 0 .. 31;
      DOORBELL_OUT_CLR    at 16#184# range 0 .. 31;
      DOORBELL_IN_SET     at 16#188# range 0 .. 31;
      DOORBELL_IN_CLR     at 16#18C# range 0 .. 31;
      PERI_NONSEC         at 16#190# range 0 .. 31;
      RISCV_SOFTIRQ       at 16#1A0# range 0 .. 31;
      MTIME_CTRL          at 16#1A4# range 0 .. 31;
      MTIME               at 16#1B0# range 0 .. 31;
      MTIMEH              at 16#1B4# range 0 .. 31;
      MTIMECMP            at 16#1B8# range 0 .. 31;
      MTIMECMPH           at 16#1BC# range 0 .. 31;
      TMDS_CTRL           at 16#1C0# range 0 .. 31;
      TMDS_WDATA          at 16#1C4# range 0 .. 31;
      TMDS_PEEK_SINGLE    at 16#1C8# range 0 .. 31;
      TMDS_POP_SINGLE     at 16#1CC# range 0 .. 31;
      TMDS_PEEK_DOUBLE_L0 at 16#1D0# range 0 .. 31;
      TMDS_POP_DOUBLE_L0  at 16#1D4# range 0 .. 31;
      TMDS_PEEK_DOUBLE_L1 at 16#1D8# range 0 .. 31;
      TMDS_POP_DOUBLE_L1  at 16#1DC# range 0 .. 31;
      TMDS_PEEK_DOUBLE_L2 at 16#1E0# range 0 .. 31;
      TMDS_POP_DOUBLE_L2  at 16#1E4# range 0 .. 31;
   end record;

   --  Single-cycle IO block Provides core-local and inter-core hardware for
   --  the two processors, with single-cycle access.
   SIO_NS_Periph : aliased SIO_NS_Peripheral
     with Import, Address => SIO_NS_Base;

end RP2350_SVD.SIO_NS;
