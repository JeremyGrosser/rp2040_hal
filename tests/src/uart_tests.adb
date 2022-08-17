--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Assertions; use AUnit.Assertions;
with HAL.UART; use HAL.UART;
with HAL;      use HAL;
with RP2040_SVD.Interrupts;
with RP_Interrupts;
with Cortex_M.NVIC;
with RP.UART;  use RP.UART;
with RP.Timer;
with RP.Device;
with RP.Clock;

package body UART_Tests is
   Port : RP.UART.UART_Port renames RP.Device.UART_0;
   RX_Count, TX_Count : Natural := 0;

   overriding
   procedure Set_Up
      (T : in out UART_Test)
   is
      Config : constant UART_Configuration :=
         (Loopback => True,
          others   => <>);
   begin
      RP.Clock.Enable (RP.Clock.PERI);
      Port.Configure (Config);
   end Set_Up;

   procedure Test_Data
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      TX_Data : constant UART_Data_8b := (0, 1, 16#80#, 16#7F#, 16#FF#, 16#55#);
      RX_Data : UART_Data_8b (TX_Data'Range);
      Status  : UART_Status;
   begin
      Port.Transmit (TX_Data, Status);
      Assert (Status = Ok, "Transmit failed");
      Port.Receive (RX_Data, Status);
      Assert (Status = Ok, "Receive failed");
      Assert (RX_Data = TX_Data, "Data mismatch");

      Assert (Port.Transmit_Status = Empty, "Transmit FIFO was not empty");
      Assert (Port.Receive_Status = Empty, "Receive FIFO was not empty");

      Port.Receive (RX_Data, Status, Timeout => 1);
      Assert (Status = Err_Timeout, "Expected receive timeout");
   end Test_Data;

   procedure Test_Break
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      Data   : UART_Data_8b (1 .. 1);
      Status : UART_Status;
   begin
      Port.Send_Break
         (Delays   => RP.Device.Timer'Access,
          Duration => Port.Frame_Time,
          Start    => True);
      Port.Receive (Data, Status);
      Assert (Status = Busy, "Expected busy status after break");

      Port.Receive (Data, Status);
      Assert (Status = Err_Timeout, "Expected timeout after recovery from break");

      Data (1) := 16#55#;
      Port.Transmit (Data, Status);
      Assert (Status = Ok, "Expected Transmit Ok after recovery from break");

      Port.Receive (Data, Status);
      Assert (Status = Ok, "Expected Receive Ok after recovery from break");
      Assert (Data (1) = 16#55#, "Received data did not match");
      Assert (Port.Transmit_Status = Empty, "Transmit FIFO is not Empty");
      Assert (Port.Receive_Status = Empty, "Receive FIFO is not Empty");

      Port.Send_Break
         (Delays   => RP.Device.Timer'Access,
          Duration => Port.Frame_Time,
          Start    => False);
      Port.Receive (Data, Status);
      Assert (Status = Busy, "Expected busy status after break without start");

      Data (1) := 16#FF#;
      Port.Transmit (Data, Status);
      Assert (Status = Ok, "Failed to transmit after break without start");
      Port.Receive (Data, Status);
      Assert (Data (1) = 16#FF# and then Status = Ok, "Failed to recover from break without start");
   end Test_Break;

   procedure UART0_IRQ_Handler is
   begin
      if Port.Masked_IRQ_Status (Receive) then
         Port.Clear_IRQ (Receive);
         RX_Count := RX_Count + 1;
      end if;

      if Port.Masked_IRQ_Status (Transmit) then
         Port.Clear_IRQ (Transmit);
         TX_Count := TX_Count + 1;
      end if;
   end UART0_IRQ_Handler;

   procedure Test_Interrupt
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      Config : constant UART_Configuration :=
         (Loopback     => True,
          Enable_FIFOs => False,
          others       => <>);
      Delays : RP.Timer.Delays;
      Status : UART_Status;
      Data   : UART_Data_8b (1 .. 1) := (others => 16#55#);
   begin
      RP_Interrupts.Attach_Handler
         (Handler  => UART0_IRQ_Handler'Access,
          Id       => RP2040_SVD.Interrupts.UART0_Interrupt,
          Prio     => RP_Interrupts.Interrupt_Priority'First);
      Port.Configure (Config);
      Port.Enable_IRQ (Transmit);
      Port.Enable_IRQ (Receive);
      Port.Clear_IRQ (Transmit);
      Port.Clear_IRQ (Receive);
      Cortex_M.NVIC.Clear_Pending (RP2040_SVD.Interrupts.UART0_Interrupt);
      Cortex_M.NVIC.Enable_Interrupt (RP2040_SVD.Interrupts.UART0_Interrupt);

      Port.Transmit (Data, Status);
      Assert (Status = Ok, "UART transmit with interrupt failed");

      Port.Receive (Data, Status);
      Assert (Status = Ok, "UART receive with interrupt failed");

      Delays.Delay_Microseconds (100);
      Assert (TX_Count = 1, "UART transmit interrupt did not fire");
      Assert (RX_Count = 1, "UART receive interrupt did not fire");

      Cortex_M.NVIC.Disable_Interrupt (RP2040_SVD.Interrupts.UART0_Interrupt);
   end Test_Interrupt;

   overriding
   procedure Register_Tests
      (T : in out UART_Test)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Data'Access, "Data");
      Register_Routine (T, Test_Break'Access, "Break");
      Register_Routine (T, Test_Interrupt'Access, "Interrupt");
   end Register_Tests;

   overriding
   function Name
      (T : UART_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.UART"));

end UART_Tests;
