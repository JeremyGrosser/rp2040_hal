--
--  Copyright (C) 2026 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with System.Storage_Elements;
with HAL; use HAL;

package body RP.Flash.Cache is

   type CTRL_Register is record
      WRITABLE_M1             : Boolean := False;
      WRITABLE_M0             : Boolean := False;
      SPLIT_WAYS              : Boolean := False;
      MAINT_NONSEC            : Boolean := False;
      NO_UNTRANSLATED_NONSEC  : Boolean := True;
      NO_UNTRANSLATED_SEC     : Boolean := False;
      NO_UNCACHED_NONSEC      : Boolean := False;
      NO_UNCACHED_SEC         : Boolean := False;
      POWER_DOWN              : Boolean := False;
      EN_NONSECURE            : Boolean := True;
      EN_SECURE               : Boolean := True;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Object_Size => 32;
   for CTRL_Register use record
      WRITABLE_M1             at 0 range 11 .. 11;
      WRITABLE_M0             at 0 range 10 .. 10;
      SPLIT_WAYS              at 0 range 9 .. 9;
      MAINT_NONSEC            at 0 range 8 .. 8;
      NO_UNTRANSLATED_NONSEC  at 0 range 7 .. 7;
      NO_UNTRANSLATED_SEC     at 0 range 6 .. 6;
      NO_UNCACHED_NONSEC      at 0 range 5 .. 5;
      NO_UNCACHED_SEC         at 0 range 4 .. 4;
      POWER_DOWN              at 0 range 3 .. 3;
      EN_NONSECURE            at 0 range 1 .. 1;
      EN_SECURE               at 0 range 0 .. 0;
   end record;

   type XIP_CTRL_Peripheral is record
      CTRL     : CTRL_Register;
      CTR_HIT  : UInt32;
      CTR_ACC  : UInt32;
   end record
      with Volatile;
   for XIP_CTRL_Peripheral use record
      CTRL     at 16#00# range 0 .. 31;
      CTR_HIT  at 16#0C# range 0 .. 31;
      CTR_ACC  at 16#10# range 0 .. 31;
   end record;

   XIP_CTRL : XIP_CTRL_Peripheral
      with Import, Address => System'To_Address (16#400C_8000#);

   --  Cache maintenance (4.4.1.1). Writes to this mirror of the XIP address
   --  space operate on one 8 byte cache line, selected by address bits 13:3.
   --  The low three bits of the address select the operation, data is ignored.
   XIP_MAINTENANCE_BASE : constant := 16#1800_0000#;
   Cache_Lines          : constant := 2048;
   Line_Size            : constant := 8;
   Invalidate_By_Set    : constant := 0;

   procedure Enable is
   begin
      XIP_CTRL.CTRL.POWER_DOWN := False;
      XIP_CTRL.CTRL.EN_SECURE := True;
   end Enable;

   procedure Disable is
   begin
      XIP_CTRL.CTRL.EN_SECURE := False;
   end Disable;

   procedure Power_Down is
   begin
      XIP_CTRL.CTRL.POWER_DOWN := True;
   end Power_Down;

   function Is_Enabled
      return Boolean
   is (XIP_CTRL.CTRL.EN_SECURE);

   procedure Flush
      (Wait : Boolean := True)
   is
      pragma Unreferenced (Wait);
      --  There is no asynchronous flush on RP2350, every line is invalidated
      --  before returning.
      use System.Storage_Elements;
   begin
      for Line in 0 .. Cache_Lines - 1 loop
         declare
            Maintenance : UInt8
               with Import, Volatile,
                    Address => To_Address
                       (XIP_MAINTENANCE_BASE + Integer_Address (Line) * Line_Size + Invalidate_By_Set);
         begin
            Maintenance := 0;
         end;
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
