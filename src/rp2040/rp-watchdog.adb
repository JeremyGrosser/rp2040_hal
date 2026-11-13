--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with System;
with HAL; use HAL;

package body RP.Watchdog is

   type CTRL_Register is record
      TRIGGER     : Boolean := False;
      ENABLE      : Boolean := False;
      PAUSE_DBG   : UInt2 := 2#11#;
      PAUSE_JTAG  : Boolean := True;
      TIME        : UInt24 := 0;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Async_Writers,
           Object_Size => 32;
   for CTRL_Register use record
      TRIGGER     at 0 range 31 .. 31;
      ENABLE      at 0 range 30 .. 30;
      PAUSE_DBG   at 0 range 25 .. 26;
      PAUSE_JTAG  at 0 range 24 .. 24;
      TIME        at 0 range 0 .. 23;
   end record;

   type WATCHDOG_Peripheral is record
      CTRL : CTRL_Register;
      LOAD : UInt32;
   end record
      with Volatile;
   for WATCHDOG_Peripheral use record
      CTRL at 16#00# range 0 .. 31;
      LOAD at 16#04# range 0 .. 31;
   end record;

   WATCHDOG : WATCHDOG_Peripheral
      with Import, Address => System'To_Address (16#4005_8000#);

   --  PSM.WDSEL selects which power-on state machine stages are reset when
   --  the watchdog fires.
   PSM_WDSEL : UInt32
      with Import, Volatile, Address => System'To_Address (16#4001_0008#);
   WDSEL_PROC : constant UInt32 := 16#0001_8000#; --  proc0 and proc1

   --  RP2040-E1: the counter is decremented twice per tick
   Counts_Per_Millisecond : constant := 1_000 * 2;

   Reload_Value : UInt32 := 16#FF_FFFF#;

   procedure Configure
      (Timeout       : Milliseconds;
       Debug_Pause   : Boolean := True)
   is
   begin
      Disable;
      PSM_WDSEL := PSM_WDSEL or WDSEL_PROC;
      --  Reset both processors when the watchdog is triggered

      Reload_Value := UInt32 (Timeout) * Counts_Per_Millisecond;
      WATCHDOG.CTRL.PAUSE_DBG := (if Debug_Pause then 2#11# else 0);
      Enable;
   end Configure;

   procedure Enable is
   begin
      Reload;
      WATCHDOG.CTRL.ENABLE := True;
   end Enable;

   procedure Disable is
   begin
      WATCHDOG.CTRL.ENABLE := False;
   end Disable;

   function Enabled
      return Boolean
   is (WATCHDOG.CTRL.ENABLE);

   procedure Reload is
   begin
      WATCHDOG.LOAD := Reload_Value;
   end Reload;

   function Remaining
      return Natural
   is (Natural (WATCHDOG.CTRL.TIME) / Counts_Per_Millisecond);

   procedure Trigger is
   begin
      WATCHDOG.CTRL.TRIGGER := True;
   end Trigger;

end RP.Watchdog;
