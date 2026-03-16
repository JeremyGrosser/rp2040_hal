--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Assertions; use AUnit.Assertions;
with Ada.Interrupts;
with Ada.Real_Time;
with RP.Clock;
with RP.DMA;
with HAL;

package body DMA_Tests is

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
         (Data_Size        => Transfer_32,
          Read_Address     => Increment,
          Write_Address    => Increment,
          Trigger          => PERMANENT,
          others           => <>);
   begin
      RP.DMA.Configure (Ch, Config);
      RP.DMA.Start
         (Channel => Ch,
          From    => From'Address,
          To      => To'Address,
          Count   => HAL.UInt28 (Test_Array'Length));

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
          Read_Address    => Increment,
          Write_Address   => Static,
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
          Count   => UInt28 (From'Length));

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
          Read_Address    => Static,
          Write_Address   => Static,
          Trigger         => TIMER0,
          others          => <>);

      use Ada.Real_Time;
      Next : Time;
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
          Count   => UInt28'Last);
      Next := Clock + Microseconds (100);

      for I in 1 .. 10 loop
         From := UInt32 (I);
         delay until Next;
         Next := Next + Microseconds (100);
         Assert (To = From, "Paced transfer did not happen on schedule: " & To'Image & " /= " & From'Image);
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
          Read_Address    => Static,
          Write_Address   => Static,
          Quiet           => False,
          others          => <>);
      From   : UInt32 := UInt32'Last with Volatile;
      To     : UInt32 := 0 with Volatile;
   begin
      Configure (Ch, Config);
      Setup (Ch, From'Address, To'Address, 1);

      Interrupts.Reset_Count;
      Enable_IRQ (Ch, 0);
      Assert (IRQ_Status (Ch, 0) = False, "DMA IRQ triggered before Start");
      Assert (Interrupts.Interrupt_Count = 0, "Interrupted before Start");

      Start (Ch);
      while Interrupts.Interrupt_Count = 0 loop
         null;
      end loop;
      Assert (IRQ_Status (Ch, 0) = False, "Ack_IRQ didn't");
      Assert (Interrupts.Interrupt_Count = 1, "Incorrect interrupt count");

      Disable_IRQ (Ch, 0);
      Start (Ch);
      while Busy (Ch) loop
         null;
      end loop;
      Assert (Interrupts.Interrupt_Count = 1, "Interrupt count incremented while disabled");
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
      --  Register_Routine (T, Test_IRQ'Access, "IRQ");
   end Register_Tests;

   overriding
   function Name
      (T : DMA_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.DMA"));

   protected body Interrupts is
      procedure DMA_Interrupt is
      begin
         RP.DMA.Ack_IRQ (0, 0);
         Count := Count + 1;
      end DMA_Interrupt;

      procedure Reset_Count is
      begin
         Count := 0;
      end Reset_Count;

      function Interrupt_Count
         return Natural
      is (Count);
   end Interrupts;

end DMA_Tests;
