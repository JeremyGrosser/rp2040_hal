--
--  Copyright 2021-2024 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP.Timer;
with HAL; use HAL;
with HAL.I2C;

package RP.I2C_Master
   with Preelaborate
is
   subtype I2C_Number is Natural range 0 .. 1;

   type I2C_Master_Port
      (Num : I2C_Number)
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
      Addr    : HAL.I2C.I2C_Address;
      Data    : HAL.I2C.I2C_Data;
      Status  : out HAL.I2C.I2C_Status;
      Timeout : Natural := 1000);

   overriding
   procedure Master_Receive
     (This    : in out I2C_Master_Port;
      Addr    : HAL.I2C.I2C_Address;
      Data    : out HAL.I2C.I2C_Data;
      Status  : out HAL.I2C.I2C_Status;
      Timeout : Natural := 1000);

   overriding
   procedure Mem_Write
     (This          : in out I2C_Master_Port;
      Addr          : HAL.I2C.I2C_Address;
      Mem_Addr      : UInt16;
      Mem_Addr_Size : HAL.I2C.I2C_Memory_Address_Size;
      Data          : HAL.I2C.I2C_Data;
      Status        : out HAL.I2C.I2C_Status;
      Timeout       : Natural := 1000);

   overriding
   procedure Mem_Read
     (This          : in out I2C_Master_Port;
      Addr          : HAL.I2C.I2C_Address;
      Mem_Addr      : UInt16;
      Mem_Addr_Size : HAL.I2C.I2C_Memory_Address_Size;
      Data          : out HAL.I2C.I2C_Data;
      Status        : out HAL.I2C.I2C_Status;
      Timeout       : Natural := 1000);

   procedure Set_Deadline
      (This     : in out I2C_Master_Port;
       Deadline : RP.Timer.Time);

   procedure Write
      (This  : in out I2C_Master_Port;
       Addr  : UInt10;
       Data  : UInt8_Array;
       Error : out Boolean;
       Stop  : Boolean := True);

   procedure Read
      (This  : in out I2C_Master_Port;
       Addr  : UInt10;
       Data  : out UInt8_Array;
       Error : out Boolean;
       Stop  : Boolean := True);
private

   type I2C_Master_Port
      (Num : I2C_Number)
   is new HAL.I2C.I2C_Port with record
      Address_Size    : I2C_Address_Size;
      Restart_On_Next : Boolean := False;
      Deadline        : RP.Timer.Time;
   end record;

end RP.I2C_Master;
