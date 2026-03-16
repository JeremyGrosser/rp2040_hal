--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
private with Ada.Interrupts.Names;
with System;
with AUnit.Test_Cases;
with AUnit;

package DMA_Tests is

   type DMA_Test is new AUnit.Test_Cases.Test_Case with null record;

   overriding
   procedure Register_Tests
      (T : in out DMA_Test);

   overriding
   function Name
      (T : DMA_Test)
      return AUnit.Message_String;

   overriding
   procedure Set_Up
      (T : in out DMA_Test);

   procedure Test_Transfer
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Checksum
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Timer
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_IRQ
      (T : in out AUnit.Test_Cases.Test_Case'Class);

private

   protected Interrupts
      with Interrupt_Priority => System.Interrupt_Priority'First
   is
      procedure DMA_Interrupt
         with Attach_Handler => Ada.Interrupts.Names.DMA_IRQ_0_Interrupt_CPU_1;

      procedure Reset_Count;

      function Interrupt_Count
         return Natural;
   private
      Count : Natural := 0;
   end Interrupts;

end DMA_Tests;
