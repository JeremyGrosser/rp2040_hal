--
--  Copyright (C) 2022-2026 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Assertions; use AUnit.Assertions;
with RP.DMA;
with RP.PIO;

package body PIO_Tests is

   procedure Test_DMA_Trigger_Lookup
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use RP.DMA;
      use RP.PIO;
   begin
      Assert (DMA_TX_Trigger (0, 0) = PIO0_TX0, "PIO0_TX0");
      Assert (DMA_RX_Trigger (0, 0) = PIO0_RX0, "PIO0_RX0");
      Assert (DMA_TX_Trigger (1, 0) = PIO1_TX0, "PIO1_TX0");
      Assert (DMA_RX_Trigger (1, 0) = PIO1_RX0, "PIO1_RX0");
      Assert (DMA_RX_Trigger (1, 3) = PIO1_RX3, "PIO1_RX3");
      Assert (DMA_TX_Trigger (2, 0) = PIO2_TX0, "PIO2_TX0");
      Assert (DMA_RX_Trigger (2, 0) = PIO2_RX0, "PIO2_RX0");
      Assert (DMA_RX_Trigger (2, 3) = PIO2_RX3, "PIO2_RX3");
   end Test_DMA_Trigger_Lookup;

   overriding
   procedure Register_Tests
      (T : in out PIO_Test)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_DMA_Trigger_Lookup'Access, "DMA Trigger Lookup");
   end Register_Tests;

   overriding
   function Name
      (T : PIO_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.PIO"));

end PIO_Tests;
