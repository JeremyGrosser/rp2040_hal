pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package RP2350_SVD.PSM is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  FRCE_ON_SRAM array
   type FRCE_ON_SRAM_Field_Array is array (0 .. 9) of Boolean
     with Component_Size => 1, Size => 10;

   --  Type definition for FRCE_ON_SRAM
   type FRCE_ON_SRAM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SRAM as a value
            Val : HAL.UInt10;
         when True =>
            --  SRAM as an array
            Arr : FRCE_ON_SRAM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 10;

   for FRCE_ON_SRAM_Field use record
      Val at 0 range 0 .. 9;
      Arr at 0 range 0 .. 9;
   end record;

   --  FRCE_ON_PROC array
   type FRCE_ON_PROC_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for FRCE_ON_PROC
   type FRCE_ON_PROC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PROC as a value
            Val : HAL.UInt2;
         when True =>
            --  PROC as an array
            Arr : FRCE_ON_PROC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for FRCE_ON_PROC_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Force block out of reset (i.e. power it on)
   type FRCE_ON_Register is record
      PROC_COLD      : Boolean := False;
      OTP            : Boolean := False;
      ROSC           : Boolean := False;
      XOSC           : Boolean := False;
      RESETS         : Boolean := False;
      CLOCKS         : Boolean := False;
      PSM_READY      : Boolean := False;
      BUSFABRIC      : Boolean := False;
      ROM            : Boolean := False;
      BOOTRAM        : Boolean := False;
      SRAM           : FRCE_ON_SRAM_Field :=
                        (As_Array => False, Val => 16#0#);
      XIP            : Boolean := False;
      SIO            : Boolean := False;
      ACCESSCTRL     : Boolean := False;
      PROC           : FRCE_ON_PROC_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FRCE_ON_Register use record
      PROC_COLD      at 0 range 0 .. 0;
      OTP            at 0 range 1 .. 1;
      ROSC           at 0 range 2 .. 2;
      XOSC           at 0 range 3 .. 3;
      RESETS         at 0 range 4 .. 4;
      CLOCKS         at 0 range 5 .. 5;
      PSM_READY      at 0 range 6 .. 6;
      BUSFABRIC      at 0 range 7 .. 7;
      ROM            at 0 range 8 .. 8;
      BOOTRAM        at 0 range 9 .. 9;
      SRAM           at 0 range 10 .. 19;
      XIP            at 0 range 20 .. 20;
      SIO            at 0 range 21 .. 21;
      ACCESSCTRL     at 0 range 22 .. 22;
      PROC           at 0 range 23 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   --  FRCE_OFF_SRAM array
   type FRCE_OFF_SRAM_Field_Array is array (0 .. 9) of Boolean
     with Component_Size => 1, Size => 10;

   --  Type definition for FRCE_OFF_SRAM
   type FRCE_OFF_SRAM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SRAM as a value
            Val : HAL.UInt10;
         when True =>
            --  SRAM as an array
            Arr : FRCE_OFF_SRAM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 10;

   for FRCE_OFF_SRAM_Field use record
      Val at 0 range 0 .. 9;
      Arr at 0 range 0 .. 9;
   end record;

   --  FRCE_OFF_PROC array
   type FRCE_OFF_PROC_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for FRCE_OFF_PROC
   type FRCE_OFF_PROC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PROC as a value
            Val : HAL.UInt2;
         when True =>
            --  PROC as an array
            Arr : FRCE_OFF_PROC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for FRCE_OFF_PROC_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Force into reset (i.e. power it off)
   type FRCE_OFF_Register is record
      PROC_COLD      : Boolean := False;
      OTP            : Boolean := False;
      ROSC           : Boolean := False;
      XOSC           : Boolean := False;
      RESETS         : Boolean := False;
      CLOCKS         : Boolean := False;
      PSM_READY      : Boolean := False;
      BUSFABRIC      : Boolean := False;
      ROM            : Boolean := False;
      BOOTRAM        : Boolean := False;
      SRAM           : FRCE_OFF_SRAM_Field :=
                        (As_Array => False, Val => 16#0#);
      XIP            : Boolean := False;
      SIO            : Boolean := False;
      ACCESSCTRL     : Boolean := False;
      PROC           : FRCE_OFF_PROC_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FRCE_OFF_Register use record
      PROC_COLD      at 0 range 0 .. 0;
      OTP            at 0 range 1 .. 1;
      ROSC           at 0 range 2 .. 2;
      XOSC           at 0 range 3 .. 3;
      RESETS         at 0 range 4 .. 4;
      CLOCKS         at 0 range 5 .. 5;
      PSM_READY      at 0 range 6 .. 6;
      BUSFABRIC      at 0 range 7 .. 7;
      ROM            at 0 range 8 .. 8;
      BOOTRAM        at 0 range 9 .. 9;
      SRAM           at 0 range 10 .. 19;
      XIP            at 0 range 20 .. 20;
      SIO            at 0 range 21 .. 21;
      ACCESSCTRL     at 0 range 22 .. 22;
      PROC           at 0 range 23 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   --  WDSEL_SRAM array
   type WDSEL_SRAM_Field_Array is array (0 .. 9) of Boolean
     with Component_Size => 1, Size => 10;

   --  Type definition for WDSEL_SRAM
   type WDSEL_SRAM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SRAM as a value
            Val : HAL.UInt10;
         when True =>
            --  SRAM as an array
            Arr : WDSEL_SRAM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 10;

   for WDSEL_SRAM_Field use record
      Val at 0 range 0 .. 9;
      Arr at 0 range 0 .. 9;
   end record;

   --  WDSEL_PROC array
   type WDSEL_PROC_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for WDSEL_PROC
   type WDSEL_PROC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PROC as a value
            Val : HAL.UInt2;
         when True =>
            --  PROC as an array
            Arr : WDSEL_PROC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for WDSEL_PROC_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Set to 1 if the watchdog should reset this
   type WDSEL_Register is record
      PROC_COLD      : Boolean := False;
      OTP            : Boolean := False;
      ROSC           : Boolean := False;
      XOSC           : Boolean := False;
      RESETS         : Boolean := False;
      CLOCKS         : Boolean := False;
      PSM_READY      : Boolean := False;
      BUSFABRIC      : Boolean := False;
      ROM            : Boolean := False;
      BOOTRAM        : Boolean := False;
      SRAM           : WDSEL_SRAM_Field := (As_Array => False, Val => 16#0#);
      XIP            : Boolean := False;
      SIO            : Boolean := False;
      ACCESSCTRL     : Boolean := False;
      PROC           : WDSEL_PROC_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for WDSEL_Register use record
      PROC_COLD      at 0 range 0 .. 0;
      OTP            at 0 range 1 .. 1;
      ROSC           at 0 range 2 .. 2;
      XOSC           at 0 range 3 .. 3;
      RESETS         at 0 range 4 .. 4;
      CLOCKS         at 0 range 5 .. 5;
      PSM_READY      at 0 range 6 .. 6;
      BUSFABRIC      at 0 range 7 .. 7;
      ROM            at 0 range 8 .. 8;
      BOOTRAM        at 0 range 9 .. 9;
      SRAM           at 0 range 10 .. 19;
      XIP            at 0 range 20 .. 20;
      SIO            at 0 range 21 .. 21;
      ACCESSCTRL     at 0 range 22 .. 22;
      PROC           at 0 range 23 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   --  DONE_SRAM array
   type DONE_SRAM_Field_Array is array (0 .. 9) of Boolean
     with Component_Size => 1, Size => 10;

   --  Type definition for DONE_SRAM
   type DONE_SRAM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SRAM as a value
            Val : HAL.UInt10;
         when True =>
            --  SRAM as an array
            Arr : DONE_SRAM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 10;

   for DONE_SRAM_Field use record
      Val at 0 range 0 .. 9;
      Arr at 0 range 0 .. 9;
   end record;

   --  DONE_PROC array
   type DONE_PROC_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for DONE_PROC
   type DONE_PROC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PROC as a value
            Val : HAL.UInt2;
         when True =>
            --  PROC as an array
            Arr : DONE_PROC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for DONE_PROC_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Is the subsystem ready?
   type DONE_Register is record
      --  Read-only.
      PROC_COLD      : Boolean;
      --  Read-only.
      OTP            : Boolean;
      --  Read-only.
      ROSC           : Boolean;
      --  Read-only.
      XOSC           : Boolean;
      --  Read-only.
      RESETS         : Boolean;
      --  Read-only.
      CLOCKS         : Boolean;
      --  Read-only.
      PSM_READY      : Boolean;
      --  Read-only.
      BUSFABRIC      : Boolean;
      --  Read-only.
      ROM            : Boolean;
      --  Read-only.
      BOOTRAM        : Boolean;
      --  Read-only.
      SRAM           : DONE_SRAM_Field;
      --  Read-only.
      XIP            : Boolean;
      --  Read-only.
      SIO            : Boolean;
      --  Read-only.
      ACCESSCTRL     : Boolean;
      --  Read-only.
      PROC           : DONE_PROC_Field;
      --  unspecified
      Reserved_25_31 : HAL.UInt7;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DONE_Register use record
      PROC_COLD      at 0 range 0 .. 0;
      OTP            at 0 range 1 .. 1;
      ROSC           at 0 range 2 .. 2;
      XOSC           at 0 range 3 .. 3;
      RESETS         at 0 range 4 .. 4;
      CLOCKS         at 0 range 5 .. 5;
      PSM_READY      at 0 range 6 .. 6;
      BUSFABRIC      at 0 range 7 .. 7;
      ROM            at 0 range 8 .. 8;
      BOOTRAM        at 0 range 9 .. 9;
      SRAM           at 0 range 10 .. 19;
      XIP            at 0 range 20 .. 20;
      SIO            at 0 range 21 .. 21;
      ACCESSCTRL     at 0 range 22 .. 22;
      PROC           at 0 range 23 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type PSM_Peripheral is record
      --  Force block out of reset (i.e. power it on)
      FRCE_ON  : aliased FRCE_ON_Register;
      --  Force into reset (i.e. power it off)
      FRCE_OFF : aliased FRCE_OFF_Register;
      --  Set to 1 if the watchdog should reset this
      WDSEL    : aliased WDSEL_Register;
      --  Is the subsystem ready?
      DONE     : aliased DONE_Register;
   end record
     with Volatile;

   for PSM_Peripheral use record
      FRCE_ON  at 16#0# range 0 .. 31;
      FRCE_OFF at 16#4# range 0 .. 31;
      WDSEL    at 16#8# range 0 .. 31;
      DONE     at 16#C# range 0 .. 31;
   end record;

   PSM_Periph : aliased PSM_Peripheral
     with Import, Address => PSM_Base;

end RP2350_SVD.PSM;
