pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package RP2350_SVD.RESETS is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  RESET_I2C array
   type RESET_I2C_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RESET_I2C
   type RESET_I2C_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  I2C as a value
            Val : HAL.UInt2;
         when True =>
            --  I2C as an array
            Arr : RESET_I2C_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RESET_I2C_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  RESET_PIO array
   type RESET_PIO_Field_Array is array (0 .. 2) of Boolean
     with Component_Size => 1, Size => 3;

   --  Type definition for RESET_PIO
   type RESET_PIO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PIO as a value
            Val : HAL.UInt3;
         when True =>
            --  PIO as an array
            Arr : RESET_PIO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for RESET_PIO_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   --  RESET_SPI array
   type RESET_SPI_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RESET_SPI
   type RESET_SPI_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SPI as a value
            Val : HAL.UInt2;
         when True =>
            --  SPI as an array
            Arr : RESET_SPI_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RESET_SPI_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  RESET_TIMER array
   type RESET_TIMER_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RESET_TIMER
   type RESET_TIMER_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TIMER as a value
            Val : HAL.UInt2;
         when True =>
            --  TIMER as an array
            Arr : RESET_TIMER_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RESET_TIMER_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  RESET_UART array
   type RESET_UART_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RESET_UART
   type RESET_UART_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  UART as a value
            Val : HAL.UInt2;
         when True =>
            --  UART as an array
            Arr : RESET_UART_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RESET_UART_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   type RESET_Register is record
      ADC            : Boolean := True;
      BUSCTRL        : Boolean := True;
      DMA            : Boolean := True;
      HSTX           : Boolean := True;
      I2C            : RESET_I2C_Field := (As_Array => False, Val => 16#1#);
      IO_BANK0       : Boolean := True;
      IO_QSPI        : Boolean := True;
      JTAG           : Boolean := True;
      PADS_BANK0     : Boolean := True;
      PADS_QSPI      : Boolean := True;
      PIO            : RESET_PIO_Field := (As_Array => False, Val => 16#1#);
      PLL_SYS        : Boolean := True;
      PLL_USB        : Boolean := True;
      PWM            : Boolean := True;
      SHA256         : Boolean := True;
      SPI            : RESET_SPI_Field := (As_Array => False, Val => 16#1#);
      SYSCFG         : Boolean := True;
      SYSINFO        : Boolean := True;
      TBMAN          : Boolean := True;
      TIMER          : RESET_TIMER_Field := (As_Array => False, Val => 16#1#);
      TRNG           : Boolean := True;
      UART           : RESET_UART_Field := (As_Array => False, Val => 16#1#);
      USBCTRL        : Boolean := True;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RESET_Register use record
      ADC            at 0 range 0 .. 0;
      BUSCTRL        at 0 range 1 .. 1;
      DMA            at 0 range 2 .. 2;
      HSTX           at 0 range 3 .. 3;
      I2C            at 0 range 4 .. 5;
      IO_BANK0       at 0 range 6 .. 6;
      IO_QSPI        at 0 range 7 .. 7;
      JTAG           at 0 range 8 .. 8;
      PADS_BANK0     at 0 range 9 .. 9;
      PADS_QSPI      at 0 range 10 .. 10;
      PIO            at 0 range 11 .. 13;
      PLL_SYS        at 0 range 14 .. 14;
      PLL_USB        at 0 range 15 .. 15;
      PWM            at 0 range 16 .. 16;
      SHA256         at 0 range 17 .. 17;
      SPI            at 0 range 18 .. 19;
      SYSCFG         at 0 range 20 .. 20;
      SYSINFO        at 0 range 21 .. 21;
      TBMAN          at 0 range 22 .. 22;
      TIMER          at 0 range 23 .. 24;
      TRNG           at 0 range 25 .. 25;
      UART           at 0 range 26 .. 27;
      USBCTRL        at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   --  WDSEL_I2C array
   type WDSEL_I2C_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for WDSEL_I2C
   type WDSEL_I2C_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  I2C as a value
            Val : HAL.UInt2;
         when True =>
            --  I2C as an array
            Arr : WDSEL_I2C_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for WDSEL_I2C_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  WDSEL_PIO array
   type WDSEL_PIO_Field_Array is array (0 .. 2) of Boolean
     with Component_Size => 1, Size => 3;

   --  Type definition for WDSEL_PIO
   type WDSEL_PIO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PIO as a value
            Val : HAL.UInt3;
         when True =>
            --  PIO as an array
            Arr : WDSEL_PIO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for WDSEL_PIO_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   --  WDSEL_SPI array
   type WDSEL_SPI_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for WDSEL_SPI
   type WDSEL_SPI_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SPI as a value
            Val : HAL.UInt2;
         when True =>
            --  SPI as an array
            Arr : WDSEL_SPI_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for WDSEL_SPI_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  WDSEL_TIMER array
   type WDSEL_TIMER_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for WDSEL_TIMER
   type WDSEL_TIMER_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TIMER as a value
            Val : HAL.UInt2;
         when True =>
            --  TIMER as an array
            Arr : WDSEL_TIMER_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for WDSEL_TIMER_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  WDSEL_UART array
   type WDSEL_UART_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for WDSEL_UART
   type WDSEL_UART_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  UART as a value
            Val : HAL.UInt2;
         when True =>
            --  UART as an array
            Arr : WDSEL_UART_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for WDSEL_UART_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   type WDSEL_Register is record
      ADC            : Boolean := False;
      BUSCTRL        : Boolean := False;
      DMA            : Boolean := False;
      HSTX           : Boolean := False;
      I2C            : WDSEL_I2C_Field := (As_Array => False, Val => 16#0#);
      IO_BANK0       : Boolean := False;
      IO_QSPI        : Boolean := False;
      JTAG           : Boolean := False;
      PADS_BANK0     : Boolean := False;
      PADS_QSPI      : Boolean := False;
      PIO            : WDSEL_PIO_Field := (As_Array => False, Val => 16#0#);
      PLL_SYS        : Boolean := False;
      PLL_USB        : Boolean := False;
      PWM            : Boolean := False;
      SHA256         : Boolean := False;
      SPI            : WDSEL_SPI_Field := (As_Array => False, Val => 16#0#);
      SYSCFG         : Boolean := False;
      SYSINFO        : Boolean := False;
      TBMAN          : Boolean := False;
      TIMER          : WDSEL_TIMER_Field := (As_Array => False, Val => 16#0#);
      TRNG           : Boolean := False;
      UART           : WDSEL_UART_Field := (As_Array => False, Val => 16#0#);
      USBCTRL        : Boolean := False;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for WDSEL_Register use record
      ADC            at 0 range 0 .. 0;
      BUSCTRL        at 0 range 1 .. 1;
      DMA            at 0 range 2 .. 2;
      HSTX           at 0 range 3 .. 3;
      I2C            at 0 range 4 .. 5;
      IO_BANK0       at 0 range 6 .. 6;
      IO_QSPI        at 0 range 7 .. 7;
      JTAG           at 0 range 8 .. 8;
      PADS_BANK0     at 0 range 9 .. 9;
      PADS_QSPI      at 0 range 10 .. 10;
      PIO            at 0 range 11 .. 13;
      PLL_SYS        at 0 range 14 .. 14;
      PLL_USB        at 0 range 15 .. 15;
      PWM            at 0 range 16 .. 16;
      SHA256         at 0 range 17 .. 17;
      SPI            at 0 range 18 .. 19;
      SYSCFG         at 0 range 20 .. 20;
      SYSINFO        at 0 range 21 .. 21;
      TBMAN          at 0 range 22 .. 22;
      TIMER          at 0 range 23 .. 24;
      TRNG           at 0 range 25 .. 25;
      UART           at 0 range 26 .. 27;
      USBCTRL        at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   --  RESET_DONE_I2C array
   type RESET_DONE_I2C_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RESET_DONE_I2C
   type RESET_DONE_I2C_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  I2C as a value
            Val : HAL.UInt2;
         when True =>
            --  I2C as an array
            Arr : RESET_DONE_I2C_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RESET_DONE_I2C_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  RESET_DONE_PIO array
   type RESET_DONE_PIO_Field_Array is array (0 .. 2) of Boolean
     with Component_Size => 1, Size => 3;

   --  Type definition for RESET_DONE_PIO
   type RESET_DONE_PIO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PIO as a value
            Val : HAL.UInt3;
         when True =>
            --  PIO as an array
            Arr : RESET_DONE_PIO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for RESET_DONE_PIO_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   --  RESET_DONE_SPI array
   type RESET_DONE_SPI_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RESET_DONE_SPI
   type RESET_DONE_SPI_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SPI as a value
            Val : HAL.UInt2;
         when True =>
            --  SPI as an array
            Arr : RESET_DONE_SPI_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RESET_DONE_SPI_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  RESET_DONE_TIMER array
   type RESET_DONE_TIMER_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RESET_DONE_TIMER
   type RESET_DONE_TIMER_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TIMER as a value
            Val : HAL.UInt2;
         when True =>
            --  TIMER as an array
            Arr : RESET_DONE_TIMER_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RESET_DONE_TIMER_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  RESET_DONE_UART array
   type RESET_DONE_UART_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RESET_DONE_UART
   type RESET_DONE_UART_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  UART as a value
            Val : HAL.UInt2;
         when True =>
            --  UART as an array
            Arr : RESET_DONE_UART_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RESET_DONE_UART_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   type RESET_DONE_Register is record
      --  Read-only.
      ADC            : Boolean;
      --  Read-only.
      BUSCTRL        : Boolean;
      --  Read-only.
      DMA            : Boolean;
      --  Read-only.
      HSTX           : Boolean;
      --  Read-only.
      I2C            : RESET_DONE_I2C_Field;
      --  Read-only.
      IO_BANK0       : Boolean;
      --  Read-only.
      IO_QSPI        : Boolean;
      --  Read-only.
      JTAG           : Boolean;
      --  Read-only.
      PADS_BANK0     : Boolean;
      --  Read-only.
      PADS_QSPI      : Boolean;
      --  Read-only.
      PIO            : RESET_DONE_PIO_Field;
      --  Read-only.
      PLL_SYS        : Boolean;
      --  Read-only.
      PLL_USB        : Boolean;
      --  Read-only.
      PWM            : Boolean;
      --  Read-only.
      SHA256         : Boolean;
      --  Read-only.
      SPI            : RESET_DONE_SPI_Field;
      --  Read-only.
      SYSCFG         : Boolean;
      --  Read-only.
      SYSINFO        : Boolean;
      --  Read-only.
      TBMAN          : Boolean;
      --  Read-only.
      TIMER          : RESET_DONE_TIMER_Field;
      --  Read-only.
      TRNG           : Boolean;
      --  Read-only.
      UART           : RESET_DONE_UART_Field;
      --  Read-only.
      USBCTRL        : Boolean;
      --  unspecified
      Reserved_29_31 : HAL.UInt3;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RESET_DONE_Register use record
      ADC            at 0 range 0 .. 0;
      BUSCTRL        at 0 range 1 .. 1;
      DMA            at 0 range 2 .. 2;
      HSTX           at 0 range 3 .. 3;
      I2C            at 0 range 4 .. 5;
      IO_BANK0       at 0 range 6 .. 6;
      IO_QSPI        at 0 range 7 .. 7;
      JTAG           at 0 range 8 .. 8;
      PADS_BANK0     at 0 range 9 .. 9;
      PADS_QSPI      at 0 range 10 .. 10;
      PIO            at 0 range 11 .. 13;
      PLL_SYS        at 0 range 14 .. 14;
      PLL_USB        at 0 range 15 .. 15;
      PWM            at 0 range 16 .. 16;
      SHA256         at 0 range 17 .. 17;
      SPI            at 0 range 18 .. 19;
      SYSCFG         at 0 range 20 .. 20;
      SYSINFO        at 0 range 21 .. 21;
      TBMAN          at 0 range 22 .. 22;
      TIMER          at 0 range 23 .. 24;
      TRNG           at 0 range 25 .. 25;
      UART           at 0 range 26 .. 27;
      USBCTRL        at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type RESETS_Peripheral is record
      RESET      : aliased RESET_Register;
      WDSEL      : aliased WDSEL_Register;
      RESET_DONE : aliased RESET_DONE_Register;
   end record
     with Volatile;

   for RESETS_Peripheral use record
      RESET      at 16#0# range 0 .. 31;
      WDSEL      at 16#4# range 0 .. 31;
      RESET_DONE at 16#8# range 0 .. 31;
   end record;

   RESETS_Periph : aliased RESETS_Peripheral
     with Import, Address => RESETS_Base;

end RP2350_SVD.RESETS;
