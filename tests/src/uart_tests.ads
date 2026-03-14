--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
private with Ada.Interrupts.Names;
with AUnit.Test_Cases;
with AUnit;

package UART_Tests is

   type UART_Test is new AUnit.Test_Cases.Test_Case with null record;

   overriding
   procedure Register_Tests
      (T : in out UART_Test);

   overriding
   function Name
      (T : UART_Test)
      return AUnit.Message_String;

   overriding
   procedure Set_Up
      (T : in out UART_Test);

   procedure Test_Data
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Break
      (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Test_Interrupt
      (T : in out AUnit.Test_Cases.Test_Case'Class);

private

   protected Interrupts is
      procedure UART_Interrupt
         with Attach_Handler => Ada.Interrupts.Names.UART0_Interrupt_CPU_1;

      procedure Reset_Count;

      function Interrupt_Count
         return Natural;
   private
      Count : Natural := 0;
   end Interrupts;

end UART_Tests;
