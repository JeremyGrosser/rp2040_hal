pragma Style_Checks (Off);

--  Copyright (c) 2020 Raspberry Pi (Trading) Ltd.
--
--  SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2040.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

--  control and status for on-chip voltage regulator and chip level reset
--  subsystem
package RP2040_SVD.VREG_AND_CHIP_RESET is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype VREG_VSEL_Field is HAL.UInt4;

   --  Voltage regulator control and status
   type VREG_Register is record
      --  enable\n 0=not enabled, 1=enabled
      EN             : Boolean := True;
      --  high impedance mode select\n 0=not in high impedance mode, 1=in high
      --  impedance mode
      HIZ            : Boolean := False;
      --  unspecified
      Reserved_2_3   : HAL.UInt2 := 16#0#;
      --  output voltage select\n 0000 to 0101 - 0.80V\n 0110 - 0.85V\n 0111 -
      --  0.90V\n 1000 - 0.95V\n 1001 - 1.00V\n 1010 - 1.05V\n 1011 - 1.10V
      --  (default)\n 1100 - 1.15V\n 1101 - 1.20V\n 1110 - 1.25V\n 1111 - 1.30V
      VSEL           : VREG_VSEL_Field := 16#B#;
      --  unspecified
      Reserved_8_11  : HAL.UInt4 := 16#0#;
      --  Read-only. regulation status\n 0=not in regulation, 1=in regulation
      ROK            : Boolean := False;
      --  unspecified
      Reserved_13_31 : HAL.UInt19 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for VREG_Register use record
      EN             at 0 range 0 .. 0;
      HIZ            at 0 range 1 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      VSEL           at 0 range 4 .. 7;
      Reserved_8_11  at 0 range 8 .. 11;
      ROK            at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   subtype BOD_VSEL_Field is HAL.UInt4;

   --  brown-out detection control
   type BOD_Register is record
      --  enable\n 0=not enabled, 1=enabled
      EN            : Boolean := True;
      --  unspecified
      Reserved_1_3  : HAL.UInt3 := 16#0#;
      --  threshold select\n 0000 - 0.473V\n 0001 - 0.516V\n 0010 - 0.559V\n
      --  0011 - 0.602V\n 0100 - 0.645V\n 0101 - 0.688V\n 0110 - 0.731V\n 0111
      --  - 0.774V\n 1000 - 0.817V\n 1001 - 0.860V (default)\n 1010 - 0.903V\n
      --  1011 - 0.946V\n 1100 - 0.989V\n 1101 - 1.032V\n 1110 - 1.075V\n 1111
      --  - 1.118V
      VSEL          : BOD_VSEL_Field := 16#9#;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOD_Register use record
      EN            at 0 range 0 .. 0;
      Reserved_1_3  at 0 range 1 .. 3;
      VSEL          at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  Chip reset control and status
   type CHIP_RESET_Register is record
      --  unspecified
      Reserved_0_7     : HAL.UInt8 := 16#0#;
      --  Read-only. Last reset was from the power-on reset or brown-out
      --  detection blocks
      HAD_POR          : Boolean := False;
      --  unspecified
      Reserved_9_15    : HAL.UInt7 := 16#0#;
      --  Read-only. Last reset was from the RUN pin
      HAD_RUN          : Boolean := False;
      --  unspecified
      Reserved_17_19   : HAL.UInt3 := 16#0#;
      --  Read-only. Last reset was from the debug port
      HAD_PSM_RESTART  : Boolean := False;
      --  unspecified
      Reserved_21_23   : HAL.UInt3 := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. This is set by psm_restart from the debugger.\n Its
      --  purpose is to branch bootcode to a safe mode when the debugger has
      --  issued a psm_restart in order to recover from a boot lock-up.\n In
      --  the safe mode the debugger can repair the boot code, clear this flag
      --  then reboot the processor.
      PSM_RESTART_FLAG : Boolean := False;
      --  unspecified
      Reserved_25_31   : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CHIP_RESET_Register use record
      Reserved_0_7     at 0 range 0 .. 7;
      HAD_POR          at 0 range 8 .. 8;
      Reserved_9_15    at 0 range 9 .. 15;
      HAD_RUN          at 0 range 16 .. 16;
      Reserved_17_19   at 0 range 17 .. 19;
      HAD_PSM_RESTART  at 0 range 20 .. 20;
      Reserved_21_23   at 0 range 21 .. 23;
      PSM_RESTART_FLAG at 0 range 24 .. 24;
      Reserved_25_31   at 0 range 25 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  control and status for on-chip voltage regulator and chip level reset
   --  subsystem
   type VREG_AND_CHIP_RESET_Peripheral is record
      --  Voltage regulator control and status
      VREG       : aliased VREG_Register;
      --  brown-out detection control
      BOD        : aliased BOD_Register;
      --  Chip reset control and status
      CHIP_RESET : aliased CHIP_RESET_Register;
   end record
     with Volatile;

   for VREG_AND_CHIP_RESET_Peripheral use record
      VREG       at 16#0# range 0 .. 31;
      BOD        at 16#4# range 0 .. 31;
      CHIP_RESET at 16#8# range 0 .. 31;
   end record;

   --  control and status for on-chip voltage regulator and chip level reset
   --  subsystem
   VREG_AND_CHIP_RESET_Periph : aliased VREG_AND_CHIP_RESET_Peripheral
     with Import, Address => VREG_AND_CHIP_RESET_Base;

end RP2040_SVD.VREG_AND_CHIP_RESET;
