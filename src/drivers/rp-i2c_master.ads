--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with HAL.I2C; use HAL.I2C;
with RP2040_SVD.I2C;
with RP.Clock;
with HAL;

package RP.I2C_Master
   with Elaborate_Body
is

   subtype I2C_Number is Natural range 0 .. 1;

   type I2C_Master_Port
      (Num    : I2C_Number;
       Periph : not null access RP2040_SVD.I2C.I2C_Peripheral)
   is new HAL.I2C.I2C_Port with private;

   procedure Enable (This     : in out I2C_Master_Port;
                     Baudrate :        Hertz)
     with Pre => Baudrate < RP.Clock.Frequency (RP.Clock.PERI);

   Clock_Speed_Error : exception;

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
      Do_Stop_Sequence : Boolean := True;
   end record;

end RP.I2C_Master;
