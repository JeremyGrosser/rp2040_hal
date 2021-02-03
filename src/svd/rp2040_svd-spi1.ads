pragma Style_Checks (Off);

--  Copyright (c) 2020 Raspberry Pi (Trading) Ltd.
--
--  SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2040.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package RP2040_SVD.SPI1 is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype SSPCR0_DSS_Field is HAL.UInt4;
   subtype SSPCR0_FRF_Field is HAL.UInt2;
   subtype SSPCR0_SCR_Field is HAL.UInt8;

   --  Control register 0, SSPCR0 on page 3-4
   type SSPCR0_Register is record
      --  Data Size Select: 0000 Reserved, undefined operation. 0001 Reserved,
      --  undefined operation. 0010 Reserved, undefined operation. 0011 4-bit
      --  data. 0100 5-bit data. 0101 6-bit data. 0110 7-bit data. 0111 8-bit
      --  data. 1000 9-bit data. 1001 10-bit data. 1010 11-bit data. 1011
      --  12-bit data. 1100 13-bit data. 1101 14-bit data. 1110 15-bit data.
      --  1111 16-bit data.
      DSS            : SSPCR0_DSS_Field := 16#0#;
      --  Frame format: 00 Motorola SPI frame format. 01 TI synchronous serial
      --  frame format. 10 National Microwire frame format. 11 Reserved,
      --  undefined operation.
      FRF            : SSPCR0_FRF_Field := 16#0#;
      --  SSPCLKOUT polarity, applicable to Motorola SPI frame format only. See
      --  Motorola SPI frame format on page 2-10.
      SPO            : Boolean := False;
      --  SSPCLKOUT phase, applicable to Motorola SPI frame format only. See
      --  Motorola SPI frame format on page 2-10.
      SPH            : Boolean := False;
      --  Serial clock rate. The value SCR is used to generate the transmit and
      --  receive bit rate of the PrimeCell SSP. The bit rate is: F SSPCLK
      --  CPSDVSR x (1+SCR) where CPSDVSR is an even value from 2-254,
      --  programmed through the SSPCPSR register and SCR is a value from
      --  0-255.
      SCR            : SSPCR0_SCR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SSPCR0_Register use record
      DSS            at 0 range 0 .. 3;
      FRF            at 0 range 4 .. 5;
      SPO            at 0 range 6 .. 6;
      SPH            at 0 range 7 .. 7;
      SCR            at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Control register 1, SSPCR1 on page 3-5
   type SSPCR1_Register is record
      --  Loop back mode: 0 Normal serial port operation enabled. 1 Output of
      --  transmit serial shifter is connected to input of receive serial
      --  shifter internally.
      LBM           : Boolean := False;
      --  Synchronous serial port enable: 0 SSP operation disabled. 1 SSP
      --  operation enabled.
      SSE           : Boolean := False;
      --  Master or slave mode select. This bit can be modified only when the
      --  PrimeCell SSP is disabled, SSE=0: 0 Device configured as master,
      --  default. 1 Device configured as slave.
      MS            : Boolean := False;
      --  Slave-mode output disable. This bit is relevant only in the slave
      --  mode, MS=1. In multiple-slave systems, it is possible for an
      --  PrimeCell SSP master to broadcast a message to all slaves in the
      --  system while ensuring that only one slave drives data onto its serial
      --  output line. In such systems the RXD lines from multiple slaves could
      --  be tied together. To operate in such systems, the SOD bit can be set
      --  if the PrimeCell SSP slave is not supposed to drive the SSPTXD line:
      --  0 SSP can drive the SSPTXD output in slave mode. 1 SSP must not drive
      --  the SSPTXD output in slave mode.
      SOD           : Boolean := False;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SSPCR1_Register use record
      LBM           at 0 range 0 .. 0;
      SSE           at 0 range 1 .. 1;
      MS            at 0 range 2 .. 2;
      SOD           at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype SSPDR_DATA_Field is HAL.UInt16;

   --  Data register, SSPDR on page 3-6
   type SSPDR_Register is record
      --  Transmit/Receive FIFO: Read Receive FIFO. Write Transmit FIFO. You
      --  must right-justify data when the PrimeCell SSP is programmed for a
      --  data size that is less than 16 bits. Unused bits at the top are
      --  ignored by transmit logic. The receive logic automatically
      --  right-justifies.
      DATA           : SSPDR_DATA_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SSPDR_Register use record
      DATA           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Status register, SSPSR on page 3-7
   type SSPSR_Register is record
      --  Read-only. Transmit FIFO empty, RO: 0 Transmit FIFO is not empty. 1
      --  Transmit FIFO is empty.
      TFE           : Boolean;
      --  Read-only. Transmit FIFO not full, RO: 0 Transmit FIFO is full. 1
      --  Transmit FIFO is not full.
      TNF           : Boolean;
      --  Read-only. Receive FIFO not empty, RO: 0 Receive FIFO is empty. 1
      --  Receive FIFO is not empty.
      RNE           : Boolean;
      --  Read-only. Receive FIFO full, RO: 0 Receive FIFO is not full. 1
      --  Receive FIFO is full.
      RFF           : Boolean;
      --  Read-only. PrimeCell SSP busy flag, RO: 0 SSP is idle. 1 SSP is
      --  currently transmitting and/or receiving a frame or the transmit FIFO
      --  is not empty.
      BSY           : Boolean;
      --  unspecified
      Reserved_5_31 : HAL.UInt27;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SSPSR_Register use record
      TFE           at 0 range 0 .. 0;
      TNF           at 0 range 1 .. 1;
      RNE           at 0 range 2 .. 2;
      RFF           at 0 range 3 .. 3;
      BSY           at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype SSPCPSR_CPSDVSR_Field is HAL.UInt8;

   --  Clock prescale register, SSPCPSR on page 3-8
   type SSPCPSR_Register is record
      --  Clock prescale divisor. Must be an even number from 2-254, depending
      --  on the frequency of SSPCLK. The least significant bit always returns
      --  zero on reads.
      CPSDVSR       : SSPCPSR_CPSDVSR_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SSPCPSR_Register use record
      CPSDVSR       at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  Interrupt mask set or clear register, SSPIMSC on page 3-9
   type SSPIMSC_Register is record
      --  Receive overrun interrupt mask: 0 Receive FIFO written to while full
      --  condition interrupt is masked. 1 Receive FIFO written to while full
      --  condition interrupt is not masked.
      RORIM         : Boolean := False;
      --  Receive timeout interrupt mask: 0 Receive FIFO not empty and no read
      --  prior to timeout period interrupt is masked. 1 Receive FIFO not empty
      --  and no read prior to timeout period interrupt is not masked.
      RTIM          : Boolean := False;
      --  Receive FIFO interrupt mask: 0 Receive FIFO half full or less
      --  condition interrupt is masked. 1 Receive FIFO half full or less
      --  condition interrupt is not masked.
      RXIM          : Boolean := False;
      --  Transmit FIFO interrupt mask: 0 Transmit FIFO half empty or less
      --  condition interrupt is masked. 1 Transmit FIFO half empty or less
      --  condition interrupt is not masked.
      TXIM          : Boolean := False;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SSPIMSC_Register use record
      RORIM         at 0 range 0 .. 0;
      RTIM          at 0 range 1 .. 1;
      RXIM          at 0 range 2 .. 2;
      TXIM          at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  Raw interrupt status register, SSPRIS on page 3-10
   type SSPRIS_Register is record
      --  Read-only. Gives the raw interrupt state, prior to masking, of the
      --  SSPRORINTR interrupt
      RORRIS        : Boolean;
      --  Read-only. Gives the raw interrupt state, prior to masking, of the
      --  SSPRTINTR interrupt
      RTRIS         : Boolean;
      --  Read-only. Gives the raw interrupt state, prior to masking, of the
      --  SSPRXINTR interrupt
      RXRIS         : Boolean;
      --  Read-only. Gives the raw interrupt state, prior to masking, of the
      --  SSPTXINTR interrupt
      TXRIS         : Boolean;
      --  unspecified
      Reserved_4_31 : HAL.UInt28;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SSPRIS_Register use record
      RORRIS        at 0 range 0 .. 0;
      RTRIS         at 0 range 1 .. 1;
      RXRIS         at 0 range 2 .. 2;
      TXRIS         at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  Masked interrupt status register, SSPMIS on page 3-11
   type SSPMIS_Register is record
      --  Read-only. Gives the receive over run masked interrupt status, after
      --  masking, of the SSPRORINTR interrupt
      RORMIS        : Boolean;
      --  Read-only. Gives the receive timeout masked interrupt state, after
      --  masking, of the SSPRTINTR interrupt
      RTMIS         : Boolean;
      --  Read-only. Gives the receive FIFO masked interrupt state, after
      --  masking, of the SSPRXINTR interrupt
      RXMIS         : Boolean;
      --  Read-only. Gives the transmit FIFO masked interrupt state, after
      --  masking, of the SSPTXINTR interrupt
      TXMIS         : Boolean;
      --  unspecified
      Reserved_4_31 : HAL.UInt28;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SSPMIS_Register use record
      RORMIS        at 0 range 0 .. 0;
      RTMIS         at 0 range 1 .. 1;
      RXMIS         at 0 range 2 .. 2;
      TXMIS         at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  Interrupt clear register, SSPICR on page 3-11
   type SSPICR_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Clears the SSPRORINTR interrupt
      RORIC         : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Clears the SSPRTINTR interrupt
      RTIC          : Boolean := False;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SSPICR_Register use record
      RORIC         at 0 range 0 .. 0;
      RTIC          at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   --  DMA control register, SSPDMACR on page 3-12
   type SSPDMACR_Register is record
      --  Receive DMA Enable. If this bit is set to 1, DMA for the receive FIFO
      --  is enabled.
      RXDMAE        : Boolean := False;
      --  Transmit DMA Enable. If this bit is set to 1, DMA for the transmit
      --  FIFO is enabled.
      TXDMAE        : Boolean := False;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SSPDMACR_Register use record
      RXDMAE        at 0 range 0 .. 0;
      TXDMAE        at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype SSPPERIPHID0_PARTNUMBER0_Field is HAL.UInt8;

   --  Peripheral identification registers, SSPPeriphID0-3 on page 3-13
   type SSPPERIPHID0_Register is record
      --  Read-only. These bits read back as 0x22
      PARTNUMBER0   : SSPPERIPHID0_PARTNUMBER0_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SSPPERIPHID0_Register use record
      PARTNUMBER0   at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype SSPPERIPHID1_PARTNUMBER1_Field is HAL.UInt4;
   subtype SSPPERIPHID1_DESIGNER0_Field is HAL.UInt4;

   --  Peripheral identification registers, SSPPeriphID0-3 on page 3-13
   type SSPPERIPHID1_Register is record
      --  Read-only. These bits read back as 0x0
      PARTNUMBER1   : SSPPERIPHID1_PARTNUMBER1_Field;
      --  Read-only. These bits read back as 0x1
      DESIGNER0     : SSPPERIPHID1_DESIGNER0_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SSPPERIPHID1_Register use record
      PARTNUMBER1   at 0 range 0 .. 3;
      DESIGNER0     at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype SSPPERIPHID2_DESIGNER1_Field is HAL.UInt4;
   subtype SSPPERIPHID2_REVISION_Field is HAL.UInt4;

   --  Peripheral identification registers, SSPPeriphID0-3 on page 3-13
   type SSPPERIPHID2_Register is record
      --  Read-only. These bits read back as 0x4
      DESIGNER1     : SSPPERIPHID2_DESIGNER1_Field;
      --  Read-only. These bits return the peripheral revision
      REVISION      : SSPPERIPHID2_REVISION_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SSPPERIPHID2_Register use record
      DESIGNER1     at 0 range 0 .. 3;
      REVISION      at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype SSPPERIPHID3_CONFIGURATION_Field is HAL.UInt8;

   --  Peripheral identification registers, SSPPeriphID0-3 on page 3-13
   type SSPPERIPHID3_Register is record
      --  Read-only. These bits read back as 0x00
      CONFIGURATION : SSPPERIPHID3_CONFIGURATION_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SSPPERIPHID3_Register use record
      CONFIGURATION at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype SSPPCELLID0_SSPPCELLID0_Field is HAL.UInt8;

   --  PrimeCell identification registers, SSPPCellID0-3 on page 3-16
   type SSPPCELLID0_Register is record
      --  Read-only. These bits read back as 0x0D
      SSPPCELLID0   : SSPPCELLID0_SSPPCELLID0_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SSPPCELLID0_Register use record
      SSPPCELLID0   at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype SSPPCELLID1_SSPPCELLID1_Field is HAL.UInt8;

   --  PrimeCell identification registers, SSPPCellID0-3 on page 3-16
   type SSPPCELLID1_Register is record
      --  Read-only. These bits read back as 0xF0
      SSPPCELLID1   : SSPPCELLID1_SSPPCELLID1_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SSPPCELLID1_Register use record
      SSPPCELLID1   at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype SSPPCELLID2_SSPPCELLID2_Field is HAL.UInt8;

   --  PrimeCell identification registers, SSPPCellID0-3 on page 3-16
   type SSPPCELLID2_Register is record
      --  Read-only. These bits read back as 0x05
      SSPPCELLID2   : SSPPCELLID2_SSPPCELLID2_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SSPPCELLID2_Register use record
      SSPPCELLID2   at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype SSPPCELLID3_SSPPCELLID3_Field is HAL.UInt8;

   --  PrimeCell identification registers, SSPPCellID0-3 on page 3-16
   type SSPPCELLID3_Register is record
      --  Read-only. These bits read back as 0xB1
      SSPPCELLID3   : SSPPCELLID3_SSPPCELLID3_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SSPPCELLID3_Register use record
      SSPPCELLID3   at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type SPI1_Peripheral is record
      --  Control register 0, SSPCR0 on page 3-4
      SSPCR0       : aliased SSPCR0_Register;
      --  Control register 1, SSPCR1 on page 3-5
      SSPCR1       : aliased SSPCR1_Register;
      --  Data register, SSPDR on page 3-6
      SSPDR        : aliased SSPDR_Register;
      --  Status register, SSPSR on page 3-7
      SSPSR        : aliased SSPSR_Register;
      --  Clock prescale register, SSPCPSR on page 3-8
      SSPCPSR      : aliased SSPCPSR_Register;
      --  Interrupt mask set or clear register, SSPIMSC on page 3-9
      SSPIMSC      : aliased SSPIMSC_Register;
      --  Raw interrupt status register, SSPRIS on page 3-10
      SSPRIS       : aliased SSPRIS_Register;
      --  Masked interrupt status register, SSPMIS on page 3-11
      SSPMIS       : aliased SSPMIS_Register;
      --  Interrupt clear register, SSPICR on page 3-11
      SSPICR       : aliased SSPICR_Register;
      --  DMA control register, SSPDMACR on page 3-12
      SSPDMACR     : aliased SSPDMACR_Register;
      --  Peripheral identification registers, SSPPeriphID0-3 on page 3-13
      SSPPERIPHID0 : aliased SSPPERIPHID0_Register;
      --  Peripheral identification registers, SSPPeriphID0-3 on page 3-13
      SSPPERIPHID1 : aliased SSPPERIPHID1_Register;
      --  Peripheral identification registers, SSPPeriphID0-3 on page 3-13
      SSPPERIPHID2 : aliased SSPPERIPHID2_Register;
      --  Peripheral identification registers, SSPPeriphID0-3 on page 3-13
      SSPPERIPHID3 : aliased SSPPERIPHID3_Register;
      --  PrimeCell identification registers, SSPPCellID0-3 on page 3-16
      SSPPCELLID0  : aliased SSPPCELLID0_Register;
      --  PrimeCell identification registers, SSPPCellID0-3 on page 3-16
      SSPPCELLID1  : aliased SSPPCELLID1_Register;
      --  PrimeCell identification registers, SSPPCellID0-3 on page 3-16
      SSPPCELLID2  : aliased SSPPCELLID2_Register;
      --  PrimeCell identification registers, SSPPCellID0-3 on page 3-16
      SSPPCELLID3  : aliased SSPPCELLID3_Register;
   end record
     with Volatile;

   for SPI1_Peripheral use record
      SSPCR0       at 16#0# range 0 .. 31;
      SSPCR1       at 16#4# range 0 .. 31;
      SSPDR        at 16#8# range 0 .. 31;
      SSPSR        at 16#C# range 0 .. 31;
      SSPCPSR      at 16#10# range 0 .. 31;
      SSPIMSC      at 16#14# range 0 .. 31;
      SSPRIS       at 16#18# range 0 .. 31;
      SSPMIS       at 16#1C# range 0 .. 31;
      SSPICR       at 16#20# range 0 .. 31;
      SSPDMACR     at 16#24# range 0 .. 31;
      SSPPERIPHID0 at 16#FE0# range 0 .. 31;
      SSPPERIPHID1 at 16#FE4# range 0 .. 31;
      SSPPERIPHID2 at 16#FE8# range 0 .. 31;
      SSPPERIPHID3 at 16#FEC# range 0 .. 31;
      SSPPCELLID0  at 16#FF0# range 0 .. 31;
      SSPPCELLID1  at 16#FF4# range 0 .. 31;
      SSPPCELLID2  at 16#FF8# range 0 .. 31;
      SSPPCELLID3  at 16#FFC# range 0 .. 31;
   end record;

   SPI1_Periph : aliased SPI1_Peripheral
     with Import, Address => SPI1_Base;

end RP2040_SVD.SPI1;
