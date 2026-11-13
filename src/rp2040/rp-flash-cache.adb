--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with HAL; use HAL;

package body RP.Flash.Cache is

   type CTRL_Register is record
      POWER_DOWN     : Boolean := False;
      ERR_BADWRITE   : Boolean := True;
      EN             : Boolean := True;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Object_Size => 32;
   for CTRL_Register use record
      POWER_DOWN     at 0 range 3 .. 3;
      ERR_BADWRITE   at 0 range 1 .. 1;
      EN             at 0 range 0 .. 0;
   end record;

   type STAT_Register is record
      FIFO_FULL   : Boolean := False;
      FIFO_EMPTY  : Boolean := True;
      FLUSH_READY : Boolean := False;
   end record
      with Volatile_Full_Access,
           Async_Writers,
           Object_Size => 32;
   for STAT_Register use record
      FIFO_FULL   at 0 range 2 .. 2;
      FIFO_EMPTY  at 0 range 1 .. 1;
      FLUSH_READY at 0 range 0 .. 0;
   end record;

   type XIP_CTRL_Peripheral is record
      CTRL     : CTRL_Register;
      FLUSH    : UInt32;
      STAT     : STAT_Register;
      CTR_HIT  : UInt32;
      CTR_ACC  : UInt32;
   end record
      with Volatile;
   for XIP_CTRL_Peripheral use record
      CTRL     at 16#00# range 0 .. 31;
      FLUSH    at 16#04# range 0 .. 31;
      STAT     at 16#08# range 0 .. 31;
      CTR_HIT  at 16#0C# range 0 .. 31;
      CTR_ACC  at 16#10# range 0 .. 31;
   end record;

   XIP_CTRL : XIP_CTRL_Peripheral
      with Import, Address => System'To_Address (16#1400_0000#);

   procedure Enable is
   begin
      XIP_CTRL.CTRL.POWER_DOWN := False;
      XIP_CTRL.CTRL.EN := True;
   end Enable;

   procedure Disable is
   begin
      XIP_CTRL.CTRL.EN := False;
   end Disable;

   procedure Power_Down is
   begin
      XIP_CTRL.CTRL.POWER_DOWN := True;
   end Power_Down;

   function Is_Enabled
      return Boolean
   is (XIP_CTRL.CTRL.EN);

   procedure Flush
      (Wait : Boolean := True)
   is
   begin
      XIP_CTRL.FLUSH := 1;
      while Wait and not XIP_CTRL.STAT.FLUSH_READY loop
         null;
      end loop;
   end Flush;

   function Hit_Count
      return HAL.UInt32
   is (XIP_CTRL.CTR_HIT);

   function Access_Count
      return HAL.UInt32
   is (XIP_CTRL.CTR_ACC);

   procedure Reset_Counters is
   begin
      XIP_CTRL.CTR_HIT := 1;
      XIP_CTRL.CTR_ACC := 1;
   end Reset_Counters;
end RP.Flash.Cache;
