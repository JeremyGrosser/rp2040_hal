pragma Style_Checks (Off);

--  Copyright (c) 2020 Raspberry Pi (Trading) Ltd.
--
--  SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2040.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

--  Register block for busfabric control signals and performance counters
package RP2040_SVD.BUSCTRL is
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
      --  priority levels.\n Arbiters update their local priority when
      --  servicing a new nonsequential access.\n In normal circumstances this
      --  will happen almost immediately.
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

   subtype PERFCTR0_PERFCTR0_Field is HAL.UInt24;

   --  Bus fabric performance counter 0
   type PERFCTR0_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Busfabric saturating performance counter 0\n Count some
      --  event signal from the busfabric arbiters.\n Write any value to clear.
      --  Select an event to count using PERFSEL0
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

   subtype PERFSEL0_PERFSEL0_Field is HAL.UInt5;

   --  Bus fabric performance event select for PERFCTR0
   type PERFSEL0_Register is record
      --  Select a performance event for PERFCTR0
      PERFSEL0      : PERFSEL0_PERFSEL0_Field := 16#1F#;
      --  unspecified
      Reserved_5_31 : HAL.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PERFSEL0_Register use record
      PERFSEL0      at 0 range 0 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype PERFCTR1_PERFCTR1_Field is HAL.UInt24;

   --  Bus fabric performance counter 1
   type PERFCTR1_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Busfabric saturating performance counter 1\n Count some
      --  event signal from the busfabric arbiters.\n Write any value to clear.
      --  Select an event to count using PERFSEL1
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

   subtype PERFSEL1_PERFSEL1_Field is HAL.UInt5;

   --  Bus fabric performance event select for PERFCTR1
   type PERFSEL1_Register is record
      --  Select a performance event for PERFCTR1
      PERFSEL1      : PERFSEL1_PERFSEL1_Field := 16#1F#;
      --  unspecified
      Reserved_5_31 : HAL.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PERFSEL1_Register use record
      PERFSEL1      at 0 range 0 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype PERFCTR2_PERFCTR2_Field is HAL.UInt24;

   --  Bus fabric performance counter 2
   type PERFCTR2_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Busfabric saturating performance counter 2\n Count some
      --  event signal from the busfabric arbiters.\n Write any value to clear.
      --  Select an event to count using PERFSEL2
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

   subtype PERFSEL2_PERFSEL2_Field is HAL.UInt5;

   --  Bus fabric performance event select for PERFCTR2
   type PERFSEL2_Register is record
      --  Select a performance event for PERFCTR2
      PERFSEL2      : PERFSEL2_PERFSEL2_Field := 16#1F#;
      --  unspecified
      Reserved_5_31 : HAL.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PERFSEL2_Register use record
      PERFSEL2      at 0 range 0 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype PERFCTR3_PERFCTR3_Field is HAL.UInt24;

   --  Bus fabric performance counter 3
   type PERFCTR3_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Busfabric saturating performance counter 3\n Count some
      --  event signal from the busfabric arbiters.\n Write any value to clear.
      --  Select an event to count using PERFSEL3
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

   subtype PERFSEL3_PERFSEL3_Field is HAL.UInt5;

   --  Bus fabric performance event select for PERFCTR3
   type PERFSEL3_Register is record
      --  Select a performance event for PERFCTR3
      PERFSEL3      : PERFSEL3_PERFSEL3_Field := 16#1F#;
      --  unspecified
      Reserved_5_31 : HAL.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PERFSEL3_Register use record
      PERFSEL3      at 0 range 0 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
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
      PERFCTR0         at 16#8# range 0 .. 31;
      PERFSEL0         at 16#C# range 0 .. 31;
      PERFCTR1         at 16#10# range 0 .. 31;
      PERFSEL1         at 16#14# range 0 .. 31;
      PERFCTR2         at 16#18# range 0 .. 31;
      PERFSEL2         at 16#1C# range 0 .. 31;
      PERFCTR3         at 16#20# range 0 .. 31;
      PERFSEL3         at 16#24# range 0 .. 31;
   end record;

   --  Register block for busfabric control signals and performance counters
   BUSCTRL_Periph : aliased BUSCTRL_Peripheral
     with Import, Address => BUSCTRL_Base;

end RP2040_SVD.BUSCTRL;
