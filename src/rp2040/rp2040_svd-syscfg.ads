pragma Style_Checks (Off);

--  Copyright (c) 2020 Raspberry Pi (Trading) Ltd.
--
--  SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2040.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

--  Register block for various chip control signals
package RP2040_SVD.SYSCFG is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype PROC_CONFIG_PROC0_DAP_INSTID_Field is HAL.UInt4;
   subtype PROC_CONFIG_PROC1_DAP_INSTID_Field is HAL.UInt4;

   --  Configuration for processors
   type PROC_CONFIG_Register is record
      --  Read-only. Indication that proc0 has halted
      PROC0_HALTED     : Boolean := False;
      --  Read-only. Indication that proc1 has halted
      PROC1_HALTED     : Boolean := False;
      --  unspecified
      Reserved_2_23    : HAL.UInt22 := 16#0#;
      --  Configure proc0 DAP instance ID.\n Recommend that this is NOT changed
      --  until you require debug access in multi-chip environment\n WARNING:
      --  do not set to 15 as this is reserved for RescueDP
      PROC0_DAP_INSTID : PROC_CONFIG_PROC0_DAP_INSTID_Field := 16#0#;
      --  Configure proc1 DAP instance ID.\n Recommend that this is NOT changed
      --  until you require debug access in multi-chip environment\n WARNING:
      --  do not set to 15 as this is reserved for RescueDP
      PROC1_DAP_INSTID : PROC_CONFIG_PROC1_DAP_INSTID_Field := 16#1#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC_CONFIG_Register use record
      PROC0_HALTED     at 0 range 0 .. 0;
      PROC1_HALTED     at 0 range 1 .. 1;
      Reserved_2_23    at 0 range 2 .. 23;
      PROC0_DAP_INSTID at 0 range 24 .. 27;
      PROC1_DAP_INSTID at 0 range 28 .. 31;
   end record;

   subtype PROC_IN_SYNC_BYPASS_PROC_IN_SYNC_BYPASS_Field is HAL.UInt30;

   --  For each bit, if 1, bypass the input synchronizer between that GPIO\n
   --  and the GPIO input register in the SIO. The input synchronizers should\n
   --  generally be unbypassed, to avoid injecting metastabilities into
   --  processors.\n If you're feeling brave, you can bypass to save two cycles
   --  of input\n latency. This register applies to GPIO 0...29.
   type PROC_IN_SYNC_BYPASS_Register is record
      PROC_IN_SYNC_BYPASS : PROC_IN_SYNC_BYPASS_PROC_IN_SYNC_BYPASS_Field :=
                             16#0#;
      --  unspecified
      Reserved_30_31      : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC_IN_SYNC_BYPASS_Register use record
      PROC_IN_SYNC_BYPASS at 0 range 0 .. 29;
      Reserved_30_31      at 0 range 30 .. 31;
   end record;

   subtype PROC_IN_SYNC_BYPASS_HI_PROC_IN_SYNC_BYPASS_HI_Field is HAL.UInt6;

   --  For each bit, if 1, bypass the input synchronizer between that GPIO\n
   --  and the GPIO input register in the SIO. The input synchronizers should\n
   --  generally be unbypassed, to avoid injecting metastabilities into
   --  processors.\n If you're feeling brave, you can bypass to save two cycles
   --  of input\n latency. This register applies to GPIO 30...35 (the QSPI
   --  IOs).
   type PROC_IN_SYNC_BYPASS_HI_Register is record
      PROC_IN_SYNC_BYPASS_HI : PROC_IN_SYNC_BYPASS_HI_PROC_IN_SYNC_BYPASS_HI_Field :=
                                16#0#;
      --  unspecified
      Reserved_6_31          : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROC_IN_SYNC_BYPASS_HI_Register use record
      PROC_IN_SYNC_BYPASS_HI at 0 range 0 .. 5;
      Reserved_6_31          at 0 range 6 .. 31;
   end record;

   --  Directly control the SWD debug port of either processor
   type DBGFORCE_Register is record
      --  Read-only. Observe the value of processor 0 SWDIO output.
      PROC0_SWDO    : Boolean := False;
      --  Directly drive processor 0 SWDIO input, if PROC0_ATTACH is set
      PROC0_SWDI    : Boolean := True;
      --  Directly drive processor 0 SWCLK, if PROC0_ATTACH is set
      PROC0_SWCLK   : Boolean := True;
      --  Attach processor 0 debug port to syscfg controls, and disconnect it
      --  from external SWD pads.
      PROC0_ATTACH  : Boolean := False;
      --  Read-only. Observe the value of processor 1 SWDIO output.
      PROC1_SWDO    : Boolean := False;
      --  Directly drive processor 1 SWDIO input, if PROC1_ATTACH is set
      PROC1_SWDI    : Boolean := True;
      --  Directly drive processor 1 SWCLK, if PROC1_ATTACH is set
      PROC1_SWCLK   : Boolean := True;
      --  Attach processor 1 debug port to syscfg controls, and disconnect it
      --  from external SWD pads.
      PROC1_ATTACH  : Boolean := False;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DBGFORCE_Register use record
      PROC0_SWDO    at 0 range 0 .. 0;
      PROC0_SWDI    at 0 range 1 .. 1;
      PROC0_SWCLK   at 0 range 2 .. 2;
      PROC0_ATTACH  at 0 range 3 .. 3;
      PROC1_SWDO    at 0 range 4 .. 4;
      PROC1_SWDI    at 0 range 5 .. 5;
      PROC1_SWCLK   at 0 range 6 .. 6;
      PROC1_ATTACH  at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  MEMPOWERDOWN_SRAM array
   type MEMPOWERDOWN_SRAM_Field_Array is array (0 .. 5) of Boolean
     with Component_Size => 1, Size => 6;

   --  Type definition for MEMPOWERDOWN_SRAM
   type MEMPOWERDOWN_SRAM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SRAM as a value
            Val : HAL.UInt6;
         when True =>
            --  SRAM as an array
            Arr : MEMPOWERDOWN_SRAM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for MEMPOWERDOWN_SRAM_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  Control power downs to memories. Set high to power down memories.\n Use
   --  with extreme caution
   type MEMPOWERDOWN_Register is record
      SRAM          : MEMPOWERDOWN_SRAM_Field :=
                       (As_Array => False, Val => 16#0#);
      USB           : Boolean := False;
      ROM           : Boolean := False;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MEMPOWERDOWN_Register use record
      SRAM          at 0 range 0 .. 5;
      USB           at 0 range 6 .. 6;
      ROM           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Register block for various chip control signals
   type SYSCFG_Peripheral is record
      --  Processor core 0 NMI source mask\n Set a bit high to enable NMI from
      --  that IRQ
      PROC0_NMI_MASK         : aliased HAL.UInt32;
      --  Processor core 1 NMI source mask\n Set a bit high to enable NMI from
      --  that IRQ
      PROC1_NMI_MASK         : aliased HAL.UInt32;
      --  Configuration for processors
      PROC_CONFIG            : aliased PROC_CONFIG_Register;
      --  For each bit, if 1, bypass the input synchronizer between that GPIO\n
      --  and the GPIO input register in the SIO. The input synchronizers
      --  should\n generally be unbypassed, to avoid injecting metastabilities
      --  into processors.\n If you're feeling brave, you can bypass to save
      --  two cycles of input\n latency. This register applies to GPIO 0...29.
      PROC_IN_SYNC_BYPASS    : aliased PROC_IN_SYNC_BYPASS_Register;
      --  For each bit, if 1, bypass the input synchronizer between that GPIO\n
      --  and the GPIO input register in the SIO. The input synchronizers
      --  should\n generally be unbypassed, to avoid injecting metastabilities
      --  into processors.\n If you're feeling brave, you can bypass to save
      --  two cycles of input\n latency. This register applies to GPIO 30...35
      --  (the QSPI IOs).
      PROC_IN_SYNC_BYPASS_HI : aliased PROC_IN_SYNC_BYPASS_HI_Register;
      --  Directly control the SWD debug port of either processor
      DBGFORCE               : aliased DBGFORCE_Register;
      --  Control power downs to memories. Set high to power down memories.\n
      --  Use with extreme caution
      MEMPOWERDOWN           : aliased MEMPOWERDOWN_Register;
   end record
     with Volatile;

   for SYSCFG_Peripheral use record
      PROC0_NMI_MASK         at 16#0# range 0 .. 31;
      PROC1_NMI_MASK         at 16#4# range 0 .. 31;
      PROC_CONFIG            at 16#8# range 0 .. 31;
      PROC_IN_SYNC_BYPASS    at 16#C# range 0 .. 31;
      PROC_IN_SYNC_BYPASS_HI at 16#10# range 0 .. 31;
      DBGFORCE               at 16#14# range 0 .. 31;
      MEMPOWERDOWN           at 16#18# range 0 .. 31;
   end record;

   --  Register block for various chip control signals
   SYSCFG_Periph : aliased SYSCFG_Peripheral
     with Import, Address => SYSCFG_Base;

end RP2040_SVD.SYSCFG;
