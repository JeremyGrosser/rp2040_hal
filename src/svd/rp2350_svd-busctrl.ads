pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

--  Register block for busfabric control signals and performance counters
package RP2350_SVD.BUSCTRL is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Set the priority of each master for bus arbitration.
   type BUS_PRIORITY_Register is record
      --  0 - low priority, 1 - high priority
      PROC0          : Boolean := False;
      --  unspecified
      Reserved_1_3   : HAL.UInt3 := 16#0#;
      --  0 - low priority, 1 - high priority
      PROC1          : Boolean := False;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      --  0 - low priority, 1 - high priority
      DMA_R          : Boolean := False;
      --  unspecified
      Reserved_9_11  : HAL.UInt3 := 16#0#;
      --  0 - low priority, 1 - high priority
      DMA_W          : Boolean := False;
      --  unspecified
      Reserved_13_31 : HAL.UInt19 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BUS_PRIORITY_Register use record
      PROC0          at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      PROC1          at 0 range 4 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      DMA_R          at 0 range 8 .. 8;
      Reserved_9_11  at 0 range 9 .. 11;
      DMA_W          at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   --  Bus priority acknowledge
   type BUS_PRIORITY_ACK_Register is record
      --  Read-only. Goes to 1 once all arbiters have registered the new global
      --  priority levels. Arbiters update their local priority when servicing
      --  a new nonsequential access. In normal circumstances this will happen
      --  almost immediately.
      BUS_PRIORITY_ACK : Boolean;
      --  unspecified
      Reserved_1_31    : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BUS_PRIORITY_ACK_Register use record
      BUS_PRIORITY_ACK at 0 range 0 .. 0;
      Reserved_1_31    at 0 range 1 .. 31;
   end record;

   --  Enable the performance counters. If 0, the performance counters do not
   --  increment. This can be used to precisely start/stop event sampling
   --  around the profiled section of code. The performance counters are
   --  initially disabled, to save energy.
   type PERFCTR_EN_Register is record
      PERFCTR_EN    : Boolean := False;
      --  unspecified
      Reserved_1_31 : HAL.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PERFCTR_EN_Register use record
      PERFCTR_EN    at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype PERFCTR0_PERFCTR0_Field is HAL.UInt24;

   --  Bus fabric performance counter 0
   type PERFCTR0_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Busfabric saturating performance counter 0 Count some
      --  event signal from the busfabric arbiters, if PERFCTR_EN is set. Write
      --  any value to clear. Select an event to count using PERFSEL0
      PERFCTR0       : PERFCTR0_PERFCTR0_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PERFCTR0_Register use record
      PERFCTR0       at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Select an event for PERFCTR0. For each downstream port of the main
   --  crossbar, four events are available: ACCESS, an access took place;
   --  ACCESS_CONTESTED, an access took place that previously stalled due to
   --  contention from other masters; STALL_DOWNSTREAM, count cycles where any
   --  master stalled due to a stall on the downstream bus; STALL_UPSTREAM,
   --  count cycles where any master stalled for any reason, including
   --  contention from other masters.
   type PERFSEL0_PERFSEL0_Field is
     (siob_proc1_stall_upstream,
      siob_proc1_stall_downstream,
      siob_proc1_access_contested,
      siob_proc1_access,
      siob_proc0_stall_upstream,
      siob_proc0_stall_downstream,
      siob_proc0_access_contested,
      siob_proc0_access,
      apb_stall_upstream,
      apb_stall_downstream,
      apb_access_contested,
      apb_access,
      fastperi_stall_upstream,
      fastperi_stall_downstream,
      fastperi_access_contested,
      fastperi_access,
      sram9_stall_upstream,
      sram9_stall_downstream,
      sram9_access_contested,
      sram9_access,
      sram8_stall_upstream,
      sram8_stall_downstream,
      sram8_access_contested,
      sram8_access,
      sram7_stall_upstream,
      sram7_stall_downstream,
      sram7_access_contested,
      sram7_access,
      sram6_stall_upstream,
      sram6_stall_downstream,
      sram6_access_contested,
      sram6_access,
      sram5_stall_upstream,
      sram5_stall_downstream,
      sram5_access_contested,
      sram5_access,
      sram4_stall_upstream,
      sram4_stall_downstream,
      sram4_access_contested,
      sram4_access,
      sram3_stall_upstream,
      sram3_stall_downstream,
      sram3_access_contested,
      sram3_access,
      sram2_stall_upstream,
      sram2_stall_downstream,
      sram2_access_contested,
      sram2_access,
      sram1_stall_upstream,
      sram1_stall_downstream,
      sram1_access_contested,
      sram1_access,
      sram0_stall_upstream,
      sram0_stall_downstream,
      sram0_access_contested,
      sram0_access,
      xip_main1_stall_upstream,
      xip_main1_stall_downstream,
      xip_main1_access_contested,
      xip_main1_access,
      xip_main0_stall_upstream,
      xip_main0_stall_downstream,
      xip_main0_access_contested,
      xip_main0_access,
      rom_stall_upstream,
      rom_stall_downstream,
      rom_access_contested,
      rom_access)
     with Size => 7;
   for PERFSEL0_PERFSEL0_Field use
     (siob_proc1_stall_upstream => 0,
      siob_proc1_stall_downstream => 1,
      siob_proc1_access_contested => 2,
      siob_proc1_access => 3,
      siob_proc0_stall_upstream => 4,
      siob_proc0_stall_downstream => 5,
      siob_proc0_access_contested => 6,
      siob_proc0_access => 7,
      apb_stall_upstream => 8,
      apb_stall_downstream => 9,
      apb_access_contested => 10,
      apb_access => 11,
      fastperi_stall_upstream => 12,
      fastperi_stall_downstream => 13,
      fastperi_access_contested => 14,
      fastperi_access => 15,
      sram9_stall_upstream => 16,
      sram9_stall_downstream => 17,
      sram9_access_contested => 18,
      sram9_access => 19,
      sram8_stall_upstream => 20,
      sram8_stall_downstream => 21,
      sram8_access_contested => 22,
      sram8_access => 23,
      sram7_stall_upstream => 24,
      sram7_stall_downstream => 25,
      sram7_access_contested => 26,
      sram7_access => 27,
      sram6_stall_upstream => 28,
      sram6_stall_downstream => 29,
      sram6_access_contested => 30,
      sram6_access => 31,
      sram5_stall_upstream => 32,
      sram5_stall_downstream => 33,
      sram5_access_contested => 34,
      sram5_access => 35,
      sram4_stall_upstream => 36,
      sram4_stall_downstream => 37,
      sram4_access_contested => 38,
      sram4_access => 39,
      sram3_stall_upstream => 40,
      sram3_stall_downstream => 41,
      sram3_access_contested => 42,
      sram3_access => 43,
      sram2_stall_upstream => 44,
      sram2_stall_downstream => 45,
      sram2_access_contested => 46,
      sram2_access => 47,
      sram1_stall_upstream => 48,
      sram1_stall_downstream => 49,
      sram1_access_contested => 50,
      sram1_access => 51,
      sram0_stall_upstream => 52,
      sram0_stall_downstream => 53,
      sram0_access_contested => 54,
      sram0_access => 55,
      xip_main1_stall_upstream => 56,
      xip_main1_stall_downstream => 57,
      xip_main1_access_contested => 58,
      xip_main1_access => 59,
      xip_main0_stall_upstream => 60,
      xip_main0_stall_downstream => 61,
      xip_main0_access_contested => 62,
      xip_main0_access => 63,
      rom_stall_upstream => 64,
      rom_stall_downstream => 65,
      rom_access_contested => 66,
      rom_access => 67);

   --  Bus fabric performance event select for PERFCTR0
   type PERFSEL0_Register is record
      --  Select an event for PERFCTR0. For each downstream port of the main
      --  crossbar, four events are available: ACCESS, an access took place;
      --  ACCESS_CONTESTED, an access took place that previously stalled due to
      --  contention from other masters; STALL_DOWNSTREAM, count cycles where
      --  any master stalled due to a stall on the downstream bus;
      --  STALL_UPSTREAM, count cycles where any master stalled for any reason,
      --  including contention from other masters.
      PERFSEL0      : PERFSEL0_PERFSEL0_Field :=
                       RP2350_SVD.BUSCTRL.sram6_access;
      --  unspecified
      Reserved_7_31 : HAL.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PERFSEL0_Register use record
      PERFSEL0      at 0 range 0 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype PERFCTR1_PERFCTR1_Field is HAL.UInt24;

   --  Bus fabric performance counter 1
   type PERFCTR1_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Busfabric saturating performance counter 1 Count some
      --  event signal from the busfabric arbiters, if PERFCTR_EN is set. Write
      --  any value to clear. Select an event to count using PERFSEL1
      PERFCTR1       : PERFCTR1_PERFCTR1_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PERFCTR1_Register use record
      PERFCTR1       at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Select an event for PERFCTR1. For each downstream port of the main
   --  crossbar, four events are available: ACCESS, an access took place;
   --  ACCESS_CONTESTED, an access took place that previously stalled due to
   --  contention from other masters; STALL_DOWNSTREAM, count cycles where any
   --  master stalled due to a stall on the downstream bus; STALL_UPSTREAM,
   --  count cycles where any master stalled for any reason, including
   --  contention from other masters.
   type PERFSEL1_PERFSEL1_Field is
     (siob_proc1_stall_upstream,
      siob_proc1_stall_downstream,
      siob_proc1_access_contested,
      siob_proc1_access,
      siob_proc0_stall_upstream,
      siob_proc0_stall_downstream,
      siob_proc0_access_contested,
      siob_proc0_access,
      apb_stall_upstream,
      apb_stall_downstream,
      apb_access_contested,
      apb_access,
      fastperi_stall_upstream,
      fastperi_stall_downstream,
      fastperi_access_contested,
      fastperi_access,
      sram9_stall_upstream,
      sram9_stall_downstream,
      sram9_access_contested,
      sram9_access,
      sram8_stall_upstream,
      sram8_stall_downstream,
      sram8_access_contested,
      sram8_access,
      sram7_stall_upstream,
      sram7_stall_downstream,
      sram7_access_contested,
      sram7_access,
      sram6_stall_upstream,
      sram6_stall_downstream,
      sram6_access_contested,
      sram6_access,
      sram5_stall_upstream,
      sram5_stall_downstream,
      sram5_access_contested,
      sram5_access,
      sram4_stall_upstream,
      sram4_stall_downstream,
      sram4_access_contested,
      sram4_access,
      sram3_stall_upstream,
      sram3_stall_downstream,
      sram3_access_contested,
      sram3_access,
      sram2_stall_upstream,
      sram2_stall_downstream,
      sram2_access_contested,
      sram2_access,
      sram1_stall_upstream,
      sram1_stall_downstream,
      sram1_access_contested,
      sram1_access,
      sram0_stall_upstream,
      sram0_stall_downstream,
      sram0_access_contested,
      sram0_access,
      xip_main1_stall_upstream,
      xip_main1_stall_downstream,
      xip_main1_access_contested,
      xip_main1_access,
      xip_main0_stall_upstream,
      xip_main0_stall_downstream,
      xip_main0_access_contested,
      xip_main0_access,
      rom_stall_upstream,
      rom_stall_downstream,
      rom_access_contested,
      rom_access)
     with Size => 7;
   for PERFSEL1_PERFSEL1_Field use
     (siob_proc1_stall_upstream => 0,
      siob_proc1_stall_downstream => 1,
      siob_proc1_access_contested => 2,
      siob_proc1_access => 3,
      siob_proc0_stall_upstream => 4,
      siob_proc0_stall_downstream => 5,
      siob_proc0_access_contested => 6,
      siob_proc0_access => 7,
      apb_stall_upstream => 8,
      apb_stall_downstream => 9,
      apb_access_contested => 10,
      apb_access => 11,
      fastperi_stall_upstream => 12,
      fastperi_stall_downstream => 13,
      fastperi_access_contested => 14,
      fastperi_access => 15,
      sram9_stall_upstream => 16,
      sram9_stall_downstream => 17,
      sram9_access_contested => 18,
      sram9_access => 19,
      sram8_stall_upstream => 20,
      sram8_stall_downstream => 21,
      sram8_access_contested => 22,
      sram8_access => 23,
      sram7_stall_upstream => 24,
      sram7_stall_downstream => 25,
      sram7_access_contested => 26,
      sram7_access => 27,
      sram6_stall_upstream => 28,
      sram6_stall_downstream => 29,
      sram6_access_contested => 30,
      sram6_access => 31,
      sram5_stall_upstream => 32,
      sram5_stall_downstream => 33,
      sram5_access_contested => 34,
      sram5_access => 35,
      sram4_stall_upstream => 36,
      sram4_stall_downstream => 37,
      sram4_access_contested => 38,
      sram4_access => 39,
      sram3_stall_upstream => 40,
      sram3_stall_downstream => 41,
      sram3_access_contested => 42,
      sram3_access => 43,
      sram2_stall_upstream => 44,
      sram2_stall_downstream => 45,
      sram2_access_contested => 46,
      sram2_access => 47,
      sram1_stall_upstream => 48,
      sram1_stall_downstream => 49,
      sram1_access_contested => 50,
      sram1_access => 51,
      sram0_stall_upstream => 52,
      sram0_stall_downstream => 53,
      sram0_access_contested => 54,
      sram0_access => 55,
      xip_main1_stall_upstream => 56,
      xip_main1_stall_downstream => 57,
      xip_main1_access_contested => 58,
      xip_main1_access => 59,
      xip_main0_stall_upstream => 60,
      xip_main0_stall_downstream => 61,
      xip_main0_access_contested => 62,
      xip_main0_access => 63,
      rom_stall_upstream => 64,
      rom_stall_downstream => 65,
      rom_access_contested => 66,
      rom_access => 67);

   --  Bus fabric performance event select for PERFCTR1
   type PERFSEL1_Register is record
      --  Select an event for PERFCTR1. For each downstream port of the main
      --  crossbar, four events are available: ACCESS, an access took place;
      --  ACCESS_CONTESTED, an access took place that previously stalled due to
      --  contention from other masters; STALL_DOWNSTREAM, count cycles where
      --  any master stalled due to a stall on the downstream bus;
      --  STALL_UPSTREAM, count cycles where any master stalled for any reason,
      --  including contention from other masters.
      PERFSEL1      : PERFSEL1_PERFSEL1_Field :=
                       RP2350_SVD.BUSCTRL.sram6_access;
      --  unspecified
      Reserved_7_31 : HAL.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PERFSEL1_Register use record
      PERFSEL1      at 0 range 0 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype PERFCTR2_PERFCTR2_Field is HAL.UInt24;

   --  Bus fabric performance counter 2
   type PERFCTR2_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Busfabric saturating performance counter 2 Count some
      --  event signal from the busfabric arbiters, if PERFCTR_EN is set. Write
      --  any value to clear. Select an event to count using PERFSEL2
      PERFCTR2       : PERFCTR2_PERFCTR2_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PERFCTR2_Register use record
      PERFCTR2       at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Select an event for PERFCTR2. For each downstream port of the main
   --  crossbar, four events are available: ACCESS, an access took place;
   --  ACCESS_CONTESTED, an access took place that previously stalled due to
   --  contention from other masters; STALL_DOWNSTREAM, count cycles where any
   --  master stalled due to a stall on the downstream bus; STALL_UPSTREAM,
   --  count cycles where any master stalled for any reason, including
   --  contention from other masters.
   type PERFSEL2_PERFSEL2_Field is
     (siob_proc1_stall_upstream,
      siob_proc1_stall_downstream,
      siob_proc1_access_contested,
      siob_proc1_access,
      siob_proc0_stall_upstream,
      siob_proc0_stall_downstream,
      siob_proc0_access_contested,
      siob_proc0_access,
      apb_stall_upstream,
      apb_stall_downstream,
      apb_access_contested,
      apb_access,
      fastperi_stall_upstream,
      fastperi_stall_downstream,
      fastperi_access_contested,
      fastperi_access,
      sram9_stall_upstream,
      sram9_stall_downstream,
      sram9_access_contested,
      sram9_access,
      sram8_stall_upstream,
      sram8_stall_downstream,
      sram8_access_contested,
      sram8_access,
      sram7_stall_upstream,
      sram7_stall_downstream,
      sram7_access_contested,
      sram7_access,
      sram6_stall_upstream,
      sram6_stall_downstream,
      sram6_access_contested,
      sram6_access,
      sram5_stall_upstream,
      sram5_stall_downstream,
      sram5_access_contested,
      sram5_access,
      sram4_stall_upstream,
      sram4_stall_downstream,
      sram4_access_contested,
      sram4_access,
      sram3_stall_upstream,
      sram3_stall_downstream,
      sram3_access_contested,
      sram3_access,
      sram2_stall_upstream,
      sram2_stall_downstream,
      sram2_access_contested,
      sram2_access,
      sram1_stall_upstream,
      sram1_stall_downstream,
      sram1_access_contested,
      sram1_access,
      sram0_stall_upstream,
      sram0_stall_downstream,
      sram0_access_contested,
      sram0_access,
      xip_main1_stall_upstream,
      xip_main1_stall_downstream,
      xip_main1_access_contested,
      xip_main1_access,
      xip_main0_stall_upstream,
      xip_main0_stall_downstream,
      xip_main0_access_contested,
      xip_main0_access,
      rom_stall_upstream,
      rom_stall_downstream,
      rom_access_contested,
      rom_access)
     with Size => 7;
   for PERFSEL2_PERFSEL2_Field use
     (siob_proc1_stall_upstream => 0,
      siob_proc1_stall_downstream => 1,
      siob_proc1_access_contested => 2,
      siob_proc1_access => 3,
      siob_proc0_stall_upstream => 4,
      siob_proc0_stall_downstream => 5,
      siob_proc0_access_contested => 6,
      siob_proc0_access => 7,
      apb_stall_upstream => 8,
      apb_stall_downstream => 9,
      apb_access_contested => 10,
      apb_access => 11,
      fastperi_stall_upstream => 12,
      fastperi_stall_downstream => 13,
      fastperi_access_contested => 14,
      fastperi_access => 15,
      sram9_stall_upstream => 16,
      sram9_stall_downstream => 17,
      sram9_access_contested => 18,
      sram9_access => 19,
      sram8_stall_upstream => 20,
      sram8_stall_downstream => 21,
      sram8_access_contested => 22,
      sram8_access => 23,
      sram7_stall_upstream => 24,
      sram7_stall_downstream => 25,
      sram7_access_contested => 26,
      sram7_access => 27,
      sram6_stall_upstream => 28,
      sram6_stall_downstream => 29,
      sram6_access_contested => 30,
      sram6_access => 31,
      sram5_stall_upstream => 32,
      sram5_stall_downstream => 33,
      sram5_access_contested => 34,
      sram5_access => 35,
      sram4_stall_upstream => 36,
      sram4_stall_downstream => 37,
      sram4_access_contested => 38,
      sram4_access => 39,
      sram3_stall_upstream => 40,
      sram3_stall_downstream => 41,
      sram3_access_contested => 42,
      sram3_access => 43,
      sram2_stall_upstream => 44,
      sram2_stall_downstream => 45,
      sram2_access_contested => 46,
      sram2_access => 47,
      sram1_stall_upstream => 48,
      sram1_stall_downstream => 49,
      sram1_access_contested => 50,
      sram1_access => 51,
      sram0_stall_upstream => 52,
      sram0_stall_downstream => 53,
      sram0_access_contested => 54,
      sram0_access => 55,
      xip_main1_stall_upstream => 56,
      xip_main1_stall_downstream => 57,
      xip_main1_access_contested => 58,
      xip_main1_access => 59,
      xip_main0_stall_upstream => 60,
      xip_main0_stall_downstream => 61,
      xip_main0_access_contested => 62,
      xip_main0_access => 63,
      rom_stall_upstream => 64,
      rom_stall_downstream => 65,
      rom_access_contested => 66,
      rom_access => 67);

   --  Bus fabric performance event select for PERFCTR2
   type PERFSEL2_Register is record
      --  Select an event for PERFCTR2. For each downstream port of the main
      --  crossbar, four events are available: ACCESS, an access took place;
      --  ACCESS_CONTESTED, an access took place that previously stalled due to
      --  contention from other masters; STALL_DOWNSTREAM, count cycles where
      --  any master stalled due to a stall on the downstream bus;
      --  STALL_UPSTREAM, count cycles where any master stalled for any reason,
      --  including contention from other masters.
      PERFSEL2      : PERFSEL2_PERFSEL2_Field :=
                       RP2350_SVD.BUSCTRL.sram6_access;
      --  unspecified
      Reserved_7_31 : HAL.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PERFSEL2_Register use record
      PERFSEL2      at 0 range 0 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype PERFCTR3_PERFCTR3_Field is HAL.UInt24;

   --  Bus fabric performance counter 3
   type PERFCTR3_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Busfabric saturating performance counter 3 Count some
      --  event signal from the busfabric arbiters, if PERFCTR_EN is set. Write
      --  any value to clear. Select an event to count using PERFSEL3
      PERFCTR3       : PERFCTR3_PERFCTR3_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PERFCTR3_Register use record
      PERFCTR3       at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Select an event for PERFCTR3. For each downstream port of the main
   --  crossbar, four events are available: ACCESS, an access took place;
   --  ACCESS_CONTESTED, an access took place that previously stalled due to
   --  contention from other masters; STALL_DOWNSTREAM, count cycles where any
   --  master stalled due to a stall on the downstream bus; STALL_UPSTREAM,
   --  count cycles where any master stalled for any reason, including
   --  contention from other masters.
   type PERFSEL3_PERFSEL3_Field is
     (siob_proc1_stall_upstream,
      siob_proc1_stall_downstream,
      siob_proc1_access_contested,
      siob_proc1_access,
      siob_proc0_stall_upstream,
      siob_proc0_stall_downstream,
      siob_proc0_access_contested,
      siob_proc0_access,
      apb_stall_upstream,
      apb_stall_downstream,
      apb_access_contested,
      apb_access,
      fastperi_stall_upstream,
      fastperi_stall_downstream,
      fastperi_access_contested,
      fastperi_access,
      sram9_stall_upstream,
      sram9_stall_downstream,
      sram9_access_contested,
      sram9_access,
      sram8_stall_upstream,
      sram8_stall_downstream,
      sram8_access_contested,
      sram8_access,
      sram7_stall_upstream,
      sram7_stall_downstream,
      sram7_access_contested,
      sram7_access,
      sram6_stall_upstream,
      sram6_stall_downstream,
      sram6_access_contested,
      sram6_access,
      sram5_stall_upstream,
      sram5_stall_downstream,
      sram5_access_contested,
      sram5_access,
      sram4_stall_upstream,
      sram4_stall_downstream,
      sram4_access_contested,
      sram4_access,
      sram3_stall_upstream,
      sram3_stall_downstream,
      sram3_access_contested,
      sram3_access,
      sram2_stall_upstream,
      sram2_stall_downstream,
      sram2_access_contested,
      sram2_access,
      sram1_stall_upstream,
      sram1_stall_downstream,
      sram1_access_contested,
      sram1_access,
      sram0_stall_upstream,
      sram0_stall_downstream,
      sram0_access_contested,
      sram0_access,
      xip_main1_stall_upstream,
      xip_main1_stall_downstream,
      xip_main1_access_contested,
      xip_main1_access,
      xip_main0_stall_upstream,
      xip_main0_stall_downstream,
      xip_main0_access_contested,
      xip_main0_access,
      rom_stall_upstream,
      rom_stall_downstream,
      rom_access_contested,
      rom_access)
     with Size => 7;
   for PERFSEL3_PERFSEL3_Field use
     (siob_proc1_stall_upstream => 0,
      siob_proc1_stall_downstream => 1,
      siob_proc1_access_contested => 2,
      siob_proc1_access => 3,
      siob_proc0_stall_upstream => 4,
      siob_proc0_stall_downstream => 5,
      siob_proc0_access_contested => 6,
      siob_proc0_access => 7,
      apb_stall_upstream => 8,
      apb_stall_downstream => 9,
      apb_access_contested => 10,
      apb_access => 11,
      fastperi_stall_upstream => 12,
      fastperi_stall_downstream => 13,
      fastperi_access_contested => 14,
      fastperi_access => 15,
      sram9_stall_upstream => 16,
      sram9_stall_downstream => 17,
      sram9_access_contested => 18,
      sram9_access => 19,
      sram8_stall_upstream => 20,
      sram8_stall_downstream => 21,
      sram8_access_contested => 22,
      sram8_access => 23,
      sram7_stall_upstream => 24,
      sram7_stall_downstream => 25,
      sram7_access_contested => 26,
      sram7_access => 27,
      sram6_stall_upstream => 28,
      sram6_stall_downstream => 29,
      sram6_access_contested => 30,
      sram6_access => 31,
      sram5_stall_upstream => 32,
      sram5_stall_downstream => 33,
      sram5_access_contested => 34,
      sram5_access => 35,
      sram4_stall_upstream => 36,
      sram4_stall_downstream => 37,
      sram4_access_contested => 38,
      sram4_access => 39,
      sram3_stall_upstream => 40,
      sram3_stall_downstream => 41,
      sram3_access_contested => 42,
      sram3_access => 43,
      sram2_stall_upstream => 44,
      sram2_stall_downstream => 45,
      sram2_access_contested => 46,
      sram2_access => 47,
      sram1_stall_upstream => 48,
      sram1_stall_downstream => 49,
      sram1_access_contested => 50,
      sram1_access => 51,
      sram0_stall_upstream => 52,
      sram0_stall_downstream => 53,
      sram0_access_contested => 54,
      sram0_access => 55,
      xip_main1_stall_upstream => 56,
      xip_main1_stall_downstream => 57,
      xip_main1_access_contested => 58,
      xip_main1_access => 59,
      xip_main0_stall_upstream => 60,
      xip_main0_stall_downstream => 61,
      xip_main0_access_contested => 62,
      xip_main0_access => 63,
      rom_stall_upstream => 64,
      rom_stall_downstream => 65,
      rom_access_contested => 66,
      rom_access => 67);

   --  Bus fabric performance event select for PERFCTR3
   type PERFSEL3_Register is record
      --  Select an event for PERFCTR3. For each downstream port of the main
      --  crossbar, four events are available: ACCESS, an access took place;
      --  ACCESS_CONTESTED, an access took place that previously stalled due to
      --  contention from other masters; STALL_DOWNSTREAM, count cycles where
      --  any master stalled due to a stall on the downstream bus;
      --  STALL_UPSTREAM, count cycles where any master stalled for any reason,
      --  including contention from other masters.
      PERFSEL3      : PERFSEL3_PERFSEL3_Field :=
                       RP2350_SVD.BUSCTRL.sram6_access;
      --  unspecified
      Reserved_7_31 : HAL.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PERFSEL3_Register use record
      PERFSEL3      at 0 range 0 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Register block for busfabric control signals and performance counters
   type BUSCTRL_Peripheral is record
      --  Set the priority of each master for bus arbitration.
      BUS_PRIORITY     : aliased BUS_PRIORITY_Register;
      --  Bus priority acknowledge
      BUS_PRIORITY_ACK : aliased BUS_PRIORITY_ACK_Register;
      --  Enable the performance counters. If 0, the performance counters do
      --  not increment. This can be used to precisely start/stop event
      --  sampling around the profiled section of code. The performance
      --  counters are initially disabled, to save energy.
      PERFCTR_EN       : aliased PERFCTR_EN_Register;
      --  Bus fabric performance counter 0
      PERFCTR0         : aliased PERFCTR0_Register;
      --  Bus fabric performance event select for PERFCTR0
      PERFSEL0         : aliased PERFSEL0_Register;
      --  Bus fabric performance counter 1
      PERFCTR1         : aliased PERFCTR1_Register;
      --  Bus fabric performance event select for PERFCTR1
      PERFSEL1         : aliased PERFSEL1_Register;
      --  Bus fabric performance counter 2
      PERFCTR2         : aliased PERFCTR2_Register;
      --  Bus fabric performance event select for PERFCTR2
      PERFSEL2         : aliased PERFSEL2_Register;
      --  Bus fabric performance counter 3
      PERFCTR3         : aliased PERFCTR3_Register;
      --  Bus fabric performance event select for PERFCTR3
      PERFSEL3         : aliased PERFSEL3_Register;
   end record
     with Volatile;

   for BUSCTRL_Peripheral use record
      BUS_PRIORITY     at 16#0# range 0 .. 31;
      BUS_PRIORITY_ACK at 16#4# range 0 .. 31;
      PERFCTR_EN       at 16#8# range 0 .. 31;
      PERFCTR0         at 16#C# range 0 .. 31;
      PERFSEL0         at 16#10# range 0 .. 31;
      PERFCTR1         at 16#14# range 0 .. 31;
      PERFSEL1         at 16#18# range 0 .. 31;
      PERFCTR2         at 16#1C# range 0 .. 31;
      PERFSEL2         at 16#20# range 0 .. 31;
      PERFCTR3         at 16#24# range 0 .. 31;
      PERFSEL3         at 16#28# range 0 .. 31;
   end record;

   --  Register block for busfabric control signals and performance counters
   BUSCTRL_Periph : aliased BUSCTRL_Peripheral
     with Import, Address => BUSCTRL_Base;

end RP2350_SVD.BUSCTRL;
