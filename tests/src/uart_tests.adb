with AUnit.Assertions;
with HAL.UART;
with RP.GPIO;
with RP.UART;
with RP.Device;
with RP.Clock;
with RP.Timer;

package body UART_Tests is

   UART_TX : RP.GPIO.GPIO_Point := (Pin => 0);
   UART_RX : RP.GPIO.GPIO_Point := (Pin => 1);

   procedure Test_Data
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use AUnit.Assertions;
      use HAL.UART;
      use RP.UART;
      use RP.GPIO;

      Port   : RP.UART.UART_Port renames RP.Device.UART_0;
      Config : constant UART_Configuration :=
         (Loopback => True,
          others   => <>);
   begin
      UART_TX.Configure (Output, Floating, RP.GPIO.UART);
      UART_RX.Configure (Output, Floating, RP.GPIO.UART);

      RP.Clock.Enable (RP.Clock.PERI);
      Port.Configure (Config);

      declare
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
      end;
   end Test_Data;

   overriding
   procedure Register_Tests
      (T : in out UART_Test)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Data'Access, "Data");
   end Register_Tests;

   overriding
   function Name
      (T : UART_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.UART"));

end UART_Tests;
