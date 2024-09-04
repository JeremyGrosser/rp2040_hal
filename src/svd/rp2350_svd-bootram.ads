pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

--  Additional registers mapped adjacent to the bootram, for use by the
--  bootrom.
package RP2350_SVD.BOOTRAM is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype BOOTLOCK_STAT_BOOTLOCK_STAT_Field is HAL.UInt8;

   --  Bootlock status register. 1=unclaimed, 0=claimed. These locks function
   --  identically to the SIO spinlocks, but are reserved for bootrom use.
   type BOOTLOCK_STAT_Register is record
      BOOTLOCK_STAT : BOOTLOCK_STAT_BOOTLOCK_STAT_Field := 16#FF#;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTLOCK_STAT_Register use record
      BOOTLOCK_STAT at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Additional registers mapped adjacent to the bootram, for use by the
   --  bootrom.
   type BOOTRAM_Peripheral is record
      --  This registers always ORs writes into its current contents. Once a
      --  bit is set, it can only be cleared by a reset.
      WRITE_ONCE0   : aliased HAL.UInt32;
      --  This registers always ORs writes into its current contents. Once a
      --  bit is set, it can only be cleared by a reset.
      WRITE_ONCE1   : aliased HAL.UInt32;
      --  Bootlock status register. 1=unclaimed, 0=claimed. These locks
      --  function identically to the SIO spinlocks, but are reserved for
      --  bootrom use.
      BOOTLOCK_STAT : aliased BOOTLOCK_STAT_Register;
      --  Read to claim and check. Write to unclaim. The value returned on
      --  successful claim is 1 << n, and on failed claim is zero.
      BOOTLOCK0     : aliased HAL.UInt32;
      --  Read to claim and check. Write to unclaim. The value returned on
      --  successful claim is 1 << n, and on failed claim is zero.
      BOOTLOCK1     : aliased HAL.UInt32;
      --  Read to claim and check. Write to unclaim. The value returned on
      --  successful claim is 1 << n, and on failed claim is zero.
      BOOTLOCK2     : aliased HAL.UInt32;
      --  Read to claim and check. Write to unclaim. The value returned on
      --  successful claim is 1 << n, and on failed claim is zero.
      BOOTLOCK3     : aliased HAL.UInt32;
      --  Read to claim and check. Write to unclaim. The value returned on
      --  successful claim is 1 << n, and on failed claim is zero.
      BOOTLOCK4     : aliased HAL.UInt32;
      --  Read to claim and check. Write to unclaim. The value returned on
      --  successful claim is 1 << n, and on failed claim is zero.
      BOOTLOCK5     : aliased HAL.UInt32;
      --  Read to claim and check. Write to unclaim. The value returned on
      --  successful claim is 1 << n, and on failed claim is zero.
      BOOTLOCK6     : aliased HAL.UInt32;
      --  Read to claim and check. Write to unclaim. The value returned on
      --  successful claim is 1 << n, and on failed claim is zero.
      BOOTLOCK7     : aliased HAL.UInt32;
   end record
     with Volatile;

   for BOOTRAM_Peripheral use record
      WRITE_ONCE0   at 16#800# range 0 .. 31;
      WRITE_ONCE1   at 16#804# range 0 .. 31;
      BOOTLOCK_STAT at 16#808# range 0 .. 31;
      BOOTLOCK0     at 16#80C# range 0 .. 31;
      BOOTLOCK1     at 16#810# range 0 .. 31;
      BOOTLOCK2     at 16#814# range 0 .. 31;
      BOOTLOCK3     at 16#818# range 0 .. 31;
      BOOTLOCK4     at 16#81C# range 0 .. 31;
      BOOTLOCK5     at 16#820# range 0 .. 31;
      BOOTLOCK6     at 16#824# range 0 .. 31;
      BOOTLOCK7     at 16#828# range 0 .. 31;
   end record;

   --  Additional registers mapped adjacent to the bootram, for use by the
   --  bootrom.
   BOOTRAM_Periph : aliased BOOTRAM_Peripheral
     with Import, Address => BOOTRAM_Base;

end RP2350_SVD.BOOTRAM;
