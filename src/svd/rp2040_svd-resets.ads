pragma Style_Checks (Off);

--  Copyright (c) 2020 Raspberry Pi (Trading) Ltd.
--
--  SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2040.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package RP2040_SVD.RESETS is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  RESET_i2c array
   type RESET_i2c_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RESET_i2c
   type RESET_i2c_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  i2c as a value
            Val : HAL.UInt2;
         when True =>
            --  i2c as an array
            Arr : RESET_i2c_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RESET_i2c_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  RESET_pio array
   type RESET_pio_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RESET_pio
   type RESET_pio_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  pio as a value
            Val : HAL.UInt2;
         when True =>
            --  pio as an array
            Arr : RESET_pio_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RESET_pio_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  RESET_spi array
   type RESET_spi_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RESET_spi
   type RESET_spi_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  spi as a value
            Val : HAL.UInt2;
         when True =>
            --  spi as an array
            Arr : RESET_spi_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RESET_spi_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  RESET_uart array
   type RESET_uart_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RESET_uart
   type RESET_uart_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  uart as a value
            Val : HAL.UInt2;
         when True =>
            --  uart as an array
            Arr : RESET_uart_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RESET_uart_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Reset control. If a bit is set it means the peripheral is in reset. 0
   --  means the peripheral's reset is deasserted.
   type RESET_Register is record
      adc            : Boolean := True;
      busctrl        : Boolean := True;
      dma            : Boolean := True;
      i2c            : RESET_i2c_Field := (As_Array => False, Val => 16#1#);
      io_bank0       : Boolean := True;
      io_qspi        : Boolean := True;
      jtag           : Boolean := True;
      pads_bank0     : Boolean := True;
      pads_qspi      : Boolean := True;
      pio            : RESET_pio_Field := (As_Array => False, Val => 16#1#);
      pll_sys        : Boolean := True;
      pll_usb        : Boolean := True;
      pwm            : Boolean := True;
      rtc            : Boolean := True;
      spi            : RESET_spi_Field := (As_Array => False, Val => 16#1#);
      syscfg         : Boolean := True;
      sysinfo        : Boolean := True;
      tbman          : Boolean := True;
      timer          : Boolean := True;
      uart           : RESET_uart_Field := (As_Array => False, Val => 16#1#);
      usbctrl        : Boolean := True;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RESET_Register use record
      adc            at 0 range 0 .. 0;
      busctrl        at 0 range 1 .. 1;
      dma            at 0 range 2 .. 2;
      i2c            at 0 range 3 .. 4;
      io_bank0       at 0 range 5 .. 5;
      io_qspi        at 0 range 6 .. 6;
      jtag           at 0 range 7 .. 7;
      pads_bank0     at 0 range 8 .. 8;
      pads_qspi      at 0 range 9 .. 9;
      pio            at 0 range 10 .. 11;
      pll_sys        at 0 range 12 .. 12;
      pll_usb        at 0 range 13 .. 13;
      pwm            at 0 range 14 .. 14;
      rtc            at 0 range 15 .. 15;
      spi            at 0 range 16 .. 17;
      syscfg         at 0 range 18 .. 18;
      sysinfo        at 0 range 19 .. 19;
      tbman          at 0 range 20 .. 20;
      timer          at 0 range 21 .. 21;
      uart           at 0 range 22 .. 23;
      usbctrl        at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   --  WDSEL_i2c array
   type WDSEL_i2c_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for WDSEL_i2c
   type WDSEL_i2c_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  i2c as a value
            Val : HAL.UInt2;
         when True =>
            --  i2c as an array
            Arr : WDSEL_i2c_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for WDSEL_i2c_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  WDSEL_pio array
   type WDSEL_pio_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for WDSEL_pio
   type WDSEL_pio_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  pio as a value
            Val : HAL.UInt2;
         when True =>
            --  pio as an array
            Arr : WDSEL_pio_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for WDSEL_pio_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  WDSEL_spi array
   type WDSEL_spi_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for WDSEL_spi
   type WDSEL_spi_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  spi as a value
            Val : HAL.UInt2;
         when True =>
            --  spi as an array
            Arr : WDSEL_spi_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for WDSEL_spi_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  WDSEL_uart array
   type WDSEL_uart_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for WDSEL_uart
   type WDSEL_uart_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  uart as a value
            Val : HAL.UInt2;
         when True =>
            --  uart as an array
            Arr : WDSEL_uart_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for WDSEL_uart_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Watchdog select. If a bit is set then the watchdog will reset this
   --  peripheral when the watchdog fires.
   type WDSEL_Register is record
      adc            : Boolean := False;
      busctrl        : Boolean := False;
      dma            : Boolean := False;
      i2c            : WDSEL_i2c_Field := (As_Array => False, Val => 16#0#);
      io_bank0       : Boolean := False;
      io_qspi        : Boolean := False;
      jtag           : Boolean := False;
      pads_bank0     : Boolean := False;
      pads_qspi      : Boolean := False;
      pio            : WDSEL_pio_Field := (As_Array => False, Val => 16#0#);
      pll_sys        : Boolean := False;
      pll_usb        : Boolean := False;
      pwm            : Boolean := False;
      rtc            : Boolean := False;
      spi            : WDSEL_spi_Field := (As_Array => False, Val => 16#0#);
      syscfg         : Boolean := False;
      sysinfo        : Boolean := False;
      tbman          : Boolean := False;
      timer          : Boolean := False;
      uart           : WDSEL_uart_Field := (As_Array => False, Val => 16#0#);
      usbctrl        : Boolean := False;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for WDSEL_Register use record
      adc            at 0 range 0 .. 0;
      busctrl        at 0 range 1 .. 1;
      dma            at 0 range 2 .. 2;
      i2c            at 0 range 3 .. 4;
      io_bank0       at 0 range 5 .. 5;
      io_qspi        at 0 range 6 .. 6;
      jtag           at 0 range 7 .. 7;
      pads_bank0     at 0 range 8 .. 8;
      pads_qspi      at 0 range 9 .. 9;
      pio            at 0 range 10 .. 11;
      pll_sys        at 0 range 12 .. 12;
      pll_usb        at 0 range 13 .. 13;
      pwm            at 0 range 14 .. 14;
      rtc            at 0 range 15 .. 15;
      spi            at 0 range 16 .. 17;
      syscfg         at 0 range 18 .. 18;
      sysinfo        at 0 range 19 .. 19;
      tbman          at 0 range 20 .. 20;
      timer          at 0 range 21 .. 21;
      uart           at 0 range 22 .. 23;
      usbctrl        at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   --  RESET_DONE_i2c array
   type RESET_DONE_i2c_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RESET_DONE_i2c
   type RESET_DONE_i2c_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  i2c as a value
            Val : HAL.UInt2;
         when True =>
            --  i2c as an array
            Arr : RESET_DONE_i2c_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RESET_DONE_i2c_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  RESET_DONE_pio array
   type RESET_DONE_pio_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RESET_DONE_pio
   type RESET_DONE_pio_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  pio as a value
            Val : HAL.UInt2;
         when True =>
            --  pio as an array
            Arr : RESET_DONE_pio_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RESET_DONE_pio_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  RESET_DONE_spi array
   type RESET_DONE_spi_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RESET_DONE_spi
   type RESET_DONE_spi_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  spi as a value
            Val : HAL.UInt2;
         when True =>
            --  spi as an array
            Arr : RESET_DONE_spi_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RESET_DONE_spi_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  RESET_DONE_uart array
   type RESET_DONE_uart_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RESET_DONE_uart
   type RESET_DONE_uart_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  uart as a value
            Val : HAL.UInt2;
         when True =>
            --  uart as an array
            Arr : RESET_DONE_uart_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RESET_DONE_uart_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Reset done. If a bit is set then a reset done signal has been returned
   --  by the peripheral. This indicates that the peripheral's registers are
   --  ready to be accessed.
   type RESET_DONE_Register is record
      --  Read-only.
      adc            : Boolean;
      --  Read-only.
      busctrl        : Boolean;
      --  Read-only.
      dma            : Boolean;
      --  Read-only.
      i2c            : RESET_DONE_i2c_Field;
      --  Read-only.
      io_bank0       : Boolean;
      --  Read-only.
      io_qspi        : Boolean;
      --  Read-only.
      jtag           : Boolean;
      --  Read-only.
      pads_bank0     : Boolean;
      --  Read-only.
      pads_qspi      : Boolean;
      --  Read-only.
      pio            : RESET_DONE_pio_Field;
      --  Read-only.
      pll_sys        : Boolean;
      --  Read-only.
      pll_usb        : Boolean;
      --  Read-only.
      pwm            : Boolean;
      --  Read-only.
      rtc            : Boolean;
      --  Read-only.
      spi            : RESET_DONE_spi_Field;
      --  Read-only.
      syscfg         : Boolean;
      --  Read-only.
      sysinfo        : Boolean;
      --  Read-only.
      tbman          : Boolean;
      --  Read-only.
      timer          : Boolean;
      --  Read-only.
      uart           : RESET_DONE_uart_Field;
      --  Read-only.
      usbctrl        : Boolean;
      --  unspecified
      Reserved_25_31 : HAL.UInt7;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RESET_DONE_Register use record
      adc            at 0 range 0 .. 0;
      busctrl        at 0 range 1 .. 1;
      dma            at 0 range 2 .. 2;
      i2c            at 0 range 3 .. 4;
      io_bank0       at 0 range 5 .. 5;
      io_qspi        at 0 range 6 .. 6;
      jtag           at 0 range 7 .. 7;
      pads_bank0     at 0 range 8 .. 8;
      pads_qspi      at 0 range 9 .. 9;
      pio            at 0 range 10 .. 11;
      pll_sys        at 0 range 12 .. 12;
      pll_usb        at 0 range 13 .. 13;
      pwm            at 0 range 14 .. 14;
      rtc            at 0 range 15 .. 15;
      spi            at 0 range 16 .. 17;
      syscfg         at 0 range 18 .. 18;
      sysinfo        at 0 range 19 .. 19;
      tbman          at 0 range 20 .. 20;
      timer          at 0 range 21 .. 21;
      uart           at 0 range 22 .. 23;
      usbctrl        at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type RESETS_Peripheral is record
      --  Reset control. If a bit is set it means the peripheral is in reset. 0
      --  means the peripheral's reset is deasserted.
      RESET      : aliased RESET_Register;
      --  Watchdog select. If a bit is set then the watchdog will reset this
      --  peripheral when the watchdog fires.
      WDSEL      : aliased WDSEL_Register;
      --  Reset done. If a bit is set then a reset done signal has been
      --  returned by the peripheral. This indicates that the peripheral's
      --  registers are ready to be accessed.
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

end RP2040_SVD.RESETS;
