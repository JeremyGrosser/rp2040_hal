--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Assertions; use AUnit.Assertions;
with RP.Multicore;
with RP.Multicore.FIFO;
with RP2040_SVD.PPB;
with System.Storage_Elements; use System.Storage_Elements;
with System;
with HAL; use HAL;

package body Multicore_Tests is
   VTOR : constant System.Address := To_Address
      (Integer_Address
         (RP2040_SVD.PPB.PPB_Periph.VTOR.TBLOFF));
   Stack_One_Top : HAL.UInt32
      with Import, External_Name => "__StackOneTop";

   procedure Run_Core1 is
      Echo : UInt32;
   begin
      RP.Multicore.FIFO.Push_Blocking (1);
      loop
         Echo := RP.Multicore.FIFO.Pop_Blocking;
         RP.Multicore.FIFO.Push_Blocking (Echo);
      end loop;
   end Run_Core1;

   overriding
   procedure Set_Up
      (T : in out Multicore_Test)
   is
   begin
      RP.Multicore.FIFO.Drain;
      RP.Multicore.Launch_Core1 (VTOR, Stack_One_Top'Address, Run_Core1'Address);
   end Set_Up;

   procedure Test_FIFO
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      Val : UInt32;
   begin
      RP.Multicore.FIFO.Push_Blocking (42);
      RP.Multicore.FIFO.Push_Blocking (43);
      Val := RP.Multicore.FIFO.Pop_Blocking;
      Assert (Val = 1, "Core1 FIFO sent incorrect start value, expected 1:" & Val'Image);
      Val := RP.Multicore.FIFO.Pop_Blocking;
      Assert (Val = 42, "Core1 FIFO sent incorrect echo value, expected 42:" & Val'Image);
      Val := RP.Multicore.FIFO.Pop_Blocking;
      Assert (Val = 43, "Core1 FIFO sent incorrect echo value, expected 43:" & Val'Image);
      Assert (not RP.Multicore.FIFO.RX_Ready, "FIFO not empty after echo");
   end Test_FIFO;

   procedure Test_Reset_Core1
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      Val : UInt32;
   begin
      RP.Multicore.FIFO.Drain;
      RP.Multicore.Reset_Core1;
      Val := RP.Multicore.FIFO.Pop_Blocking;
      Assert (Val = 0, "Expected zero value from FIFO after Core1 reset, got" & Val'Image);
      RP.Multicore.Launch_Core1 (VTOR, Stack_One_Top'Address, Run_Core1'Address);

      Val := RP.Multicore.FIFO.Pop_Blocking;
      Assert (Val = 1, "Core1 FIFO sent incorrect start value after reset, expected 1:" & Val'Image);

      RP.Multicore.FIFO.Push_Blocking (60);
      Val := RP.Multicore.FIFO.Pop_Blocking;
      Assert (Val = 60, "Core1 FIFO sent incorrect echo value after reset, expected 60:" & Val'Image);
   end Test_Reset_Core1;

   overriding
   procedure Register_Tests
      (T : in out Multicore_Test)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_FIFO'Access, "Test_FIFO");
      Register_Routine (T, Test_Reset_Core1'Access, "Reset_Core1");
   end Register_Tests;

   overriding
   function Name
      (T : Multicore_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.Multicore"));

end Multicore_Tests;
