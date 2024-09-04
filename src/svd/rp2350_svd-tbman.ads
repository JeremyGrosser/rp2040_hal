pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

--  For managing simulation testbenches
package RP2350_SVD.TBMAN is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Indicates the type of platform in use
   type PLATFORM_Register is record
      --  Read-only. Indicates the platform is an ASIC
      ASIC          : Boolean;
      --  Read-only. Indicates the platform is an FPGA
      FPGA          : Boolean;
      --  Read-only. Indicates the platform is a simulation
      HDLSIM        : Boolean;
      --  unspecified
      Reserved_3_31 : HAL.UInt29;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PLATFORM_Register use record
      ASIC          at 0 range 0 .. 0;
      FPGA          at 0 range 1 .. 1;
      HDLSIM        at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  For managing simulation testbenches
   type TBMAN_Peripheral is record
      --  Indicates the type of platform in use
      PLATFORM : aliased PLATFORM_Register;
   end record
     with Volatile;

   for TBMAN_Peripheral use record
      PLATFORM at 0 range 0 .. 31;
   end record;

   --  For managing simulation testbenches
   TBMAN_Periph : aliased TBMAN_Peripheral
     with Import, Address => TBMAN_Base;

end RP2350_SVD.TBMAN;
