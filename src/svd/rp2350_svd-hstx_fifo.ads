pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

--  FIFO status and write access for HSTX
package RP2350_SVD.HSTX_FIFO is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype STAT_LEVEL_Field is HAL.UInt8;

   --  FIFO status
   type STAT_Register is record
      --  Read-only.
      LEVEL          : STAT_LEVEL_Field := 16#0#;
      --  Read-only.
      FULL           : Boolean := False;
      --  Read-only.
      EMPTY          : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. FIFO was written when full. Write 1 to clear.
      WOF            : Boolean := False;
      --  unspecified
      Reserved_11_31 : HAL.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for STAT_Register use record
      LEVEL          at 0 range 0 .. 7;
      FULL           at 0 range 8 .. 8;
      EMPTY          at 0 range 9 .. 9;
      WOF            at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  FIFO status and write access for HSTX
   type HSTX_FIFO_Peripheral is record
      --  FIFO status
      STAT : aliased STAT_Register;
      --  Write access to FIFO
      FIFO : aliased HAL.UInt32;
   end record
     with Volatile;

   for HSTX_FIFO_Peripheral use record
      STAT at 16#0# range 0 .. 31;
      FIFO at 16#4# range 0 .. 31;
   end record;

   --  FIFO status and write access for HSTX
   HSTX_FIFO_Periph : aliased HSTX_FIFO_Peripheral
     with Import, Address => HSTX_FIFO_Base;

end RP2350_SVD.HSTX_FIFO;
