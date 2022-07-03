--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
private with RP.I2C;
private with RP.Timer;
with HAL.I2C; use HAL.I2C;
with RP2040_SVD.I2C;
with HAL;

--  This package implements the HAL.I2C interface by using RP.I2C.
--  Applications that do not require the portability of the HAL.I2C interface
--  are encouraged to use RP.I2C directly, as it provides more control and
--  flexibility.
package RP.I2C_Master
   with Preelaborate
is
   subtype I2C_Number is Natural range 0 .. 1;

   type I2C_Master_Port
      (Num    : I2C_Number;
       Periph : not null access RP2040_SVD.I2C.I2C_Peripheral)
   is new HAL.I2C.I2C_Port with private;

   type I2C_Address_Size is (Address_Size_7b, Address_Size_10b);

   procedure Configure
      (This         : in out I2C_Master_Port;
       Baudrate     : Hertz;
       Address_Size : I2C_Address_Size := Address_Size_7b)
   with Pre => Baudrate in 100_000 | 400_000 | 1_000_000;

   overriding
   procedure Master_Transmit
     (This    : in out I2C_Master_Port;
      Addr    : I2C_Address;
      Data    : I2C_Data;
      Status  : out I2C_Status;
      Timeout : Natural := 1000);

   overriding
   procedure Master_Receive
     (This    : in out I2C_Master_Port;
      Addr    : I2C_Address;
      Data    : out I2C_Data;
      Status  : out I2C_Status;
      Timeout : Natural := 1000);

   overriding
   procedure Mem_Write
     (This          : in out I2C_Master_Port;
      Addr          : I2C_Address;
      Mem_Addr      : HAL.UInt16;
      Mem_Addr_Size : I2C_Memory_Address_Size;
      Data          : I2C_Data;
      Status        : out I2C_Status;
      Timeout       : Natural := 1000);

   overriding
   procedure Mem_Read
     (This          : in out I2C_Master_Port;
      Addr          : I2C_Address;
      Mem_Addr      : HAL.UInt16;
      Mem_Addr_Size : I2C_Memory_Address_Size;
      Data          : out I2C_Data;
      Status        : out I2C_Status;
      Timeout       : Natural := 1000);

private

   type I2C_Master_Port
      (Num    : I2C_Number;
       Periph : not null access RP2040_SVD.I2C.I2C_Peripheral)
   is new HAL.I2C.I2C_Port with record
      Port         : RP.I2C.I2C_Port (Num, Periph);
      Address_Size : I2C_Address_Size;
   end record;

   procedure Set_Address
      (This     : in out I2C_Master_Port;
       Addr     : I2C_Address;
       Status   : out I2C_Status;
       Deadline : RP.Timer.Time);

end RP.I2C_Master;
