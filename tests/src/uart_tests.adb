with AUnit.Assertions; use AUnit.Assertions;
with HAL.UART; use HAL.UART;
with HAL;      use HAL;
with RP.GPIO;  use RP.GPIO;
with RP.UART;  use RP.UART;
with RP.Device;
with RP.Clock;
with RP.Timer;

package body UART_Tests is
   Port    : RP.UART.UART_Port renames RP.Device.UART_0;

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
      Assert (Data (1) = 16#FF# and Status = Ok, "Failed to recover from break without start");
   end Test_Break;

   overriding
   procedure Register_Tests
      (T : in out UART_Test)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Data'Access, "Data");
      Register_Routine (T, Test_Break'Access, "Break");
   end Register_Tests;

   overriding
   function Name
      (T : UART_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.UART"));

end UART_Tests;
