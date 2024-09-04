pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

--  Register block for various chip control signals
package RP2350_SVD.SYSCFG is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Configuration for processors
   type PROC_CONFIG_Register is record
      --  Read-only. Indication that proc0 has halted
      PROC0_HALTED  : Boolean;
      --  Read-only. Indication that proc1 has halted
      PROC1_HALTED  : Boolean;
      --  unspecified
      Reserved_2_31 : HAL.UInt30;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC_CONFIG_Register use record
      PROC0_HALTED  at 0 range 0 .. 0;
      PROC1_HALTED  at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype PROC_IN_SYNC_BYPASS_HI_GPIO_Field is HAL.UInt16;
   subtype PROC_IN_SYNC_BYPASS_HI_QSPI_SD_Field is HAL.UInt4;

   --  For each bit, if 1, bypass the input synchronizer between that GPIO and
   --  the GPIO input register in the SIO. The input synchronizers should
   --  generally be unbypassed, to avoid injecting metastabilities into
   --  processors. If you're feeling brave, you can bypass to save two cycles
   --  of input latency. This register applies to GPIO 32...47. USB GPIO 56..57
   --  QSPI GPIO 58..63
   type PROC_IN_SYNC_BYPASS_HI_Register is record
      GPIO           : PROC_IN_SYNC_BYPASS_HI_GPIO_Field := 16#0#;
      --  unspecified
      Reserved_16_23 : HAL.UInt8 := 16#0#;
      USB_DP         : Boolean := False;
      USB_DM         : Boolean := False;
      QSPI_SCK       : Boolean := False;
      QSPI_CSN       : Boolean := False;
      QSPI_SD        : PROC_IN_SYNC_BYPASS_HI_QSPI_SD_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC_IN_SYNC_BYPASS_HI_Register use record
      GPIO           at 0 range 0 .. 15;
      Reserved_16_23 at 0 range 16 .. 23;
      USB_DP         at 0 range 24 .. 24;
      USB_DM         at 0 range 25 .. 25;
      QSPI_SCK       at 0 range 26 .. 26;
      QSPI_CSN       at 0 range 27 .. 27;
      QSPI_SD        at 0 range 28 .. 31;
   end record;

   --  Directly control the chip SWD debug port
   type DBGFORCE_Register is record
      --  Read-only. Observe the value of SWDIO output.
      SWDO          : Boolean := False;
      --  Directly drive SWDIO input, if ATTACH is set
      SWDI          : Boolean := True;
      --  Directly drive SWCLK, if ATTACH is set
      SWCLK         : Boolean := True;
      --  Attach chip debug port to syscfg controls, and disconnect it from
      --  external SWD pads.
      ATTACH        : Boolean := False;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DBGFORCE_Register use record
      SWDO          at 0 range 0 .. 0;
      SWDI          at 0 range 1 .. 1;
      SWCLK         at 0 range 2 .. 2;
      ATTACH        at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  MEMPOWERDOWN_SRAM array
   type MEMPOWERDOWN_SRAM_Field_Array is array (0 .. 9) of Boolean
     with Component_Size => 1, Size => 10;

   --  Type definition for MEMPOWERDOWN_SRAM
   type MEMPOWERDOWN_SRAM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SRAM as a value
            Val : HAL.UInt10;
         when True =>
            --  SRAM as an array
            Arr : MEMPOWERDOWN_SRAM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 10;

   for MEMPOWERDOWN_SRAM_Field use record
      Val at 0 range 0 .. 9;
      Arr at 0 range 0 .. 9;
   end record;

   --  Control PD pins to memories. Set high to put memories to a low power
   --  state. In this state the memories will retain contents but not be
   --  accessible Use with caution
   type MEMPOWERDOWN_Register is record
      SRAM           : MEMPOWERDOWN_SRAM_Field :=
                        (As_Array => False, Val => 16#0#);
      USB            : Boolean := False;
      ROM            : Boolean := False;
      BOOTRAM        : Boolean := False;
      --  unspecified
      Reserved_13_31 : HAL.UInt19 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MEMPOWERDOWN_Register use record
      SRAM           at 0 range 0 .. 9;
      USB            at 0 range 10 .. 10;
      ROM            at 0 range 11 .. 11;
      BOOTRAM        at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   subtype AUXCTRL_AUXCTRL_Field is HAL.UInt8;

   --  Auxiliary system control register
   type AUXCTRL_Register is record
      --  * Bits 7:2: Reserved * Bit 1: When clear, the LPOSC output is XORed
      --  into the TRNG ROSC output as an additional, uncorrelated entropy
      --  source. When set, this behaviour is disabled. * Bit 0: Force POWMAN
      --  clock to switch to LPOSC, by asserting its WDRESET input. This must
      --  be set before initiating a watchdog reset of the RSM from a stage
      --  that includes CLOCKS, if POWMAN is running from clk_ref at the point
      --  that the watchdog reset takes place. Otherwise, the short pulse
      --  generated on clk_ref by the reset of the CLOCKS block may affect
      --  POWMAN register state.
      AUXCTRL       : AUXCTRL_AUXCTRL_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AUXCTRL_Register use record
      AUXCTRL       at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Register block for various chip control signals
   type SYSCFG_Peripheral is record
      --  Configuration for processors
      PROC_CONFIG            : aliased PROC_CONFIG_Register;
      --  For each bit, if 1, bypass the input synchronizer between that GPIO
      --  and the GPIO input register in the SIO. The input synchronizers
      --  should generally be unbypassed, to avoid injecting metastabilities
      --  into processors. If you're feeling brave, you can bypass to save two
      --  cycles of input latency. This register applies to GPIO 0...31.
      PROC_IN_SYNC_BYPASS    : aliased HAL.UInt32;
      --  For each bit, if 1, bypass the input synchronizer between that GPIO
      --  and the GPIO input register in the SIO. The input synchronizers
      --  should generally be unbypassed, to avoid injecting metastabilities
      --  into processors. If you're feeling brave, you can bypass to save two
      --  cycles of input latency. This register applies to GPIO 32...47. USB
      --  GPIO 56..57 QSPI GPIO 58..63
      PROC_IN_SYNC_BYPASS_HI : aliased PROC_IN_SYNC_BYPASS_HI_Register;
      --  Directly control the chip SWD debug port
      DBGFORCE               : aliased DBGFORCE_Register;
      --  Control PD pins to memories. Set high to put memories to a low power
      --  state. In this state the memories will retain contents but not be
      --  accessible Use with caution
      MEMPOWERDOWN           : aliased MEMPOWERDOWN_Register;
      --  Auxiliary system control register
      AUXCTRL                : aliased AUXCTRL_Register;
   end record
     with Volatile;

   for SYSCFG_Peripheral use record
      PROC_CONFIG            at 16#0# range 0 .. 31;
      PROC_IN_SYNC_BYPASS    at 16#4# range 0 .. 31;
      PROC_IN_SYNC_BYPASS_HI at 16#8# range 0 .. 31;
      DBGFORCE               at 16#C# range 0 .. 31;
      MEMPOWERDOWN           at 16#10# range 0 .. 31;
      AUXCTRL                at 16#14# range 0 .. 31;
   end record;

   --  Register block for various chip control signals
   SYSCFG_Periph : aliased SYSCFG_Peripheral
     with Import, Address => SYSCFG_Base;

end RP2350_SVD.SYSCFG;
