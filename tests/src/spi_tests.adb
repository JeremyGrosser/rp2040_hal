
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Assertions; use AUnit.Assertions;
with HAL.SPI; use HAL.SPI;
with HAL;     use HAL;
with RP.Device;
with RP.SPI;

package body SPI_Tests is
   Port : RP.SPI.SPI_Port renames RP.Device.SPI_0;

   procedure Test_Configure
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use RP.SPI;
      Config : SPI_Configuration := Default_SPI_Configuration;
   begin
      Port.Configure (Config);

      Config.Data_Size := Data_Size_8b;
      Port.Configure (Config);
      Assert (Port.Data_Size = Data_Size_8b, "Data_Size_8b");

      Config.Data_Size := Data_Size_16b;
      Port.Configure (Config);
      Assert (Port.Data_Size = Data_Size_16b, "Data_Size_16b");
   end Test_Configure;

   procedure Test_Transfer
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      Config : RP.SPI.SPI_Configuration :=
         (Loopback => True,
          others   => <>);
      Status : SPI_Status;
   begin
      declare
         Data : SPI_Data_8b (1 .. 1) := (1 => 42);
      begin
         Port.Configure (Config);
         Port.Transmit (Data, Status);
         Assert (Status = Ok, "Transmit failed");
         Data (1) := 24;
         Port.Receive (Data, Status);
         Assert (Status = Ok, "Receive failed");
         Assert (Data (1) = 42, "Data mismatch");
      end;

      declare
         Data : SPI_Data_16b (1 .. 1) := (1 => 4242);
      begin
         Config.Data_Size := Data_Size_16b;
         Port.Configure (Config);
         Port.Transmit (Data, Status);
         Assert (Status = Ok, "Transmit failed");
         Data (1) := 2424;
         Port.Receive (Data, Status);
         Assert (Status = Ok, "Receive failed");
         Assert (Data (1) = 4242, "Data mismatch");
      end;
   end Test_Transfer;

   overriding
   procedure Register_Tests
      (T : in out SPI_Test)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Configure'Access, "Configure");
      Register_Routine (T, Test_Transfer'Access, "Transfer");
   end Register_Tests;

   overriding
   function Name
      (T : SPI_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.SPI"));

end SPI_Tests;
