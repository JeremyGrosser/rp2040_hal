--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Assertions; use AUnit.Assertions;

with RP2040_SVD.Interrupts;
with RP_Interrupts;
with System;

with RP.Device;
with RP.Clock;
with RP.Timer;
with RP.DMA;
with HAL;

package body DMA_Tests is
   Interrupt_Count : Natural := 0 with Volatile;

   overriding
   procedure Set_Up
      (T : in out DMA_Test)
   is
   begin
      RP.DMA.Enable;
   end Set_Up;

   procedure Test_Transfer
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use RP.DMA;

      type Test_Array is array (1 .. 4) of Integer
         with Component_Size => 32,
              Alignment      => 32;
      From   : Test_Array := (4, 3, 2, 1);
      To     : Test_Array := (0, 0, 0, 0);
      Ch     : constant DMA_Channel_Id := 0;
      Config : constant DMA_Configuration :=
         (Data_Size       => Transfer_32,
          Increment_Read  => True,
          Increment_Write => True,
          Trigger         => PERMANENT,
          others          => <>);
   begin
      RP.DMA.Configure (Ch, Config);
      RP.DMA.Start
         (Channel => Ch,
          From    => From'Address,
          To      => To'Address,
          Count   => HAL.UInt32 (Test_Array'Length));

      while RP.DMA.Busy (Ch) loop
         null;
      end loop;

      Assert (RP.DMA.Status (Ch).Transfers_Remaining = 0, "Transfers_Remaining did not count correctly");

      Assert (To = From, "transfer copied incorrect data");

      RP.DMA.Disable (Ch);
      Assert (RP.DMA.Status (Ch).Enabled = False, "Disable failed");
   end Test_Transfer;

   procedure Test_Checksum
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use RP.DMA;
      use HAL;

      From   : constant String := "1234";
      To     : HAL.UInt8;
      Ch     : constant DMA_Channel_Id := 0;
      Config : constant DMA_Configuration :=
         (Data_Size       => Transfer_8,
          Increment_Read  => True,
          Increment_Write => False,
          Trigger         => PERMANENT,
          others          => <>);
   begin
      RP.DMA.Configure (Ch, Config);
      RP.DMA.Enable_Checksum (Ch, CRC_32);
      RP.DMA.Set_Checksum (16#FFFFFFFF#);
      RP.DMA.Start
         (Channel => Ch,
          From    => From'Address,
          To      => To'Address,
          Count   => From'Length);

      while RP.DMA.Busy (Ch) loop
         null;
      end loop;

      --  Verified by https://crccalc.com/?crc=1234&method=crc32&datatype=ascii&outtype=hex
      Assert (RP.DMA.Checksum = 16#A695C4AA#, "incorrect CRC32 checksum");
      RP.DMA.Disable (Ch);
   end Test_Checksum;

   procedure Test_Timer
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use RP.DMA;
      use HAL;
      From   : UInt32 := 0 with Volatile;
      To     : UInt32 := 0 with Volatile;
      Ch     : constant DMA_Channel_Id := 0;
      Config : constant DMA_Configuration :=
         (Data_Size       => Transfer_32,
          Increment_Read  => False,
          Increment_Write => False,
          Trigger         => TIMER0,
          others          => <>);
   begin
      --  Trigger TIMER0 every 100 microseconds (10 KHz)
      RP.DMA.Set_Pacing_Timer (TIMER0,
         X => UInt16 (RP.Clock.Frequency (RP.Clock.SYS) / 10_000),
         Y => 1);
      RP.DMA.Configure (Ch, Config);
      RP.DMA.Start
         (Channel => Ch,
          From    => From'Address,
          To      => To'Address,
          Count   => UInt32'Last);

      for I in 1 .. 10 loop
         From := UInt32 (I);
         RP.Device.Timer.Delay_Microseconds (100);
         Assert (To = From, "Paced transfer did not happen on schedule.");
      end loop;

      RP.DMA.Disable (Ch);
   end Test_Timer;

   procedure Test_IRQ
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use RP.DMA;
      use HAL;
      Ch     : constant DMA_Channel_Id := 0;
      Config : constant DMA_Configuration :=
         (Data_Size       => Transfer_32,
          Increment_Read  => False,
          Increment_Write => False,
          Quiet           => False,
          others          => <>);
      From   : UInt32 := UInt32'Last with Volatile;
      To     : UInt32 := 0 with Volatile;
   begin
      RP_Interrupts.Attach_Handler
         (Handler => Interrupt_Handler'Access,
          Id      => RP2040_SVD.Interrupts.DMA_IRQ_0_Interrupt,
          Prio    => System.Interrupt_Priority'Last);

      Configure (Ch, Config);
      Setup (Ch, From'Address, To'Address, 1);

      Interrupt_Count := 0;
      Enable_IRQ (Ch, 0);
      Assert (IRQ_Status (Ch, 0) = False, "DMA IRQ triggered before Start");
      Assert (Interrupt_Count = 0, "Interrupted before Start");

      Start (Ch);
      while Interrupt_Count = 0 loop
         null;
      end loop;
      Assert (IRQ_Status (Ch, 0) = False, "Ack_IRQ didn't");
      Assert (Interrupt_Count = 1, "Incorrect interrupt count");

      Disable_IRQ (Ch, 0);
      Start (Ch);
      while Busy (Ch) loop
         null;
      end loop;
      Assert (Interrupt_Count = 1, "Interrupt count incremented while disabled");
      Assert (IRQ_Status (Ch, 0) = False, "DMA IRQ triggered while disabled");
   end Test_IRQ;

   overriding
   procedure Register_Tests
      (T : in out DMA_Test)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Transfer'Access, "Transfer");
      Register_Routine (T, Test_Checksum'Access, "Checksum");
      Register_Routine (T, Test_Timer'Access, "Timer");
      Register_Routine (T, Test_IRQ'Access, "IRQ");
   end Register_Tests;

   overriding
   function Name
      (T : DMA_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.DMA"));

   procedure Interrupt_Handler is
   begin
      RP.DMA.Ack_IRQ (0, 0);
      Interrupt_Count := Interrupt_Count + 1;
   end Interrupt_Handler;

end DMA_Tests;
