--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
private with Ada.Interrupts.Names;
with AUnit.Test_Cases;
with AUnit;

package GPIO_Tests is

   type GPIO_Test is new AUnit.Test_Cases.Test_Case with null record;

   overriding
   procedure Register_Tests
      (T : in out GPIO_Test);

   overriding
   function Name
      (T : GPIO_Test)
      return AUnit.Message_String;

   procedure Test_Configure
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_HAL
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Interrupts
      (T : in out AUnit.Test_Cases.Test_Case'Class);

private

   protected Interrupts is
      procedure GPIO_Interrupt
         with Attach_Handler => Ada.Interrupts.Names.IO_IRQ_BANK0_Interrupt_CPU_1;

      procedure Reset_Count;

      function Interrupt_Count
         return Natural;
   private
      Count : Natural := 0;
   end Interrupts;

end GPIO_Tests;
