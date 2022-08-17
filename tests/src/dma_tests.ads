--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
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

   procedure Interrupt_Handler;

end DMA_Tests;
