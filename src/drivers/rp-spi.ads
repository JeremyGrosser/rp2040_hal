--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with HAL.SPI; use HAL.SPI;
with RP2040_SVD.SPI;
with RP.Clock;
with System;

package RP.SPI
   with Elaborate_Body
is
   subtype SPI_Number is Natural range 0 .. 1;
   type SPI_Port
      (Num    : SPI_Number;
       Periph : not null access RP2040_SVD.SPI.SPI_Peripheral) is
      new HAL.SPI.SPI_Port with private;

   type SPI_Role is (Master, Slave);
   type SPI_Polarity is (Active_Low, Active_High);
   type SPI_Phase is (Rising_Edge, Falling_Edge);
   type SPI_FIFO_Status is (Empty, Not_Full, Full, Invalid);

   type SPI_Configuration is record
      Role      : SPI_Role := Master;
      Baud      : Hertz := 1_000_000;
      Data_Size : SPI_Data_Size := Data_Size_8b;
      Polarity  : SPI_Polarity := Active_Low;
      Phase     : SPI_Phase := Rising_Edge;
      Blocking  : Boolean := True; --  Wait for Transmit FIFO to be empty before returning
   end record;

   procedure Configure
      (This   : in out SPI_Port;
       Config : SPI_Configuration);

   procedure Set_Speed
      (This : in out SPI_Port;
       Baud : Hertz)
   with Pre => Baud <= RP.Clock.Frequency (RP.Clock.PERI);
   Clock_Speed_Error : exception;

   overriding
   function Data_Size
      (This : SPI_Port)
      return SPI_Data_Size;

   function Transmit_Status
      (This : SPI_Port)
      return SPI_FIFO_Status;

   function Receive_Status
      (This : SPI_Port)
      return SPI_FIFO_Status;

   function FIFO_Address
      (This : SPI_Port)
      return System.Address;

   overriding
   procedure Transmit
      (This    : in out SPI_Port;
       Data    : SPI_Data_8b;
       Status  : out SPI_Status;
       Timeout : Natural := 1000);

   overriding
   procedure Transmit
      (This    : in out SPI_Port;
       Data    : SPI_Data_16b;
       Status  : out SPI_Status;
       Timeout : Natural := 1000);

   overriding
   procedure Receive
      (This    : in out SPI_Port;
       Data    : out SPI_Data_8b;
       Status  : out SPI_Status;
       Timeout : Natural := 1000);

   overriding
   procedure Receive
      (This    : in out SPI_Port;
       Data    : out SPI_Data_16b;
       Status  : out SPI_Status;
       Timeout : Natural := 1000);

private

   type SPI_Port
      (Num    : SPI_Number;
       Periph : not null access RP2040_SVD.SPI.SPI_Peripheral)
   is new HAL.SPI.SPI_Port with record
      Blocking : Boolean := True;
   end record;

end RP.SPI;
