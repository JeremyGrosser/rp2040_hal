--
--  Copyright 2021-2025 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with HAL.I2C;
with HAL;

package RP.I2C_Master
   with Preelaborate
is
   --  This driver only supports 7-bit I2C addresses
   --  The HAL.I2C.I2C_Address LSB is the R/W bit, so a 7-bit address is shifted left 1
   --  The R/W bit is ignored by the driver.
   --  Ex. A device with bus address 2#1010_000# should set Addr => 2#1010_0000#

   subtype I2C_Number is Natural range 0 .. 1;

   type I2C_Peripheral is private;
   type Any_I2C_Peripheral is not null access all I2C_Peripheral;

   type I2C_Master_Port
      (Num    : I2C_Number;
       Periph : Any_I2C_Peripheral)
   is new HAL.I2C.I2C_Port with private;

   procedure Configure
      (This     : in out I2C_Master_Port;
       Baudrate : Hertz)
   with Pre => Baudrate in 100_000 | 400_000 | 1_000_000;

   overriding
   procedure Master_Transmit
     (This    : in out I2C_Master_Port;
      Addr    : HAL.I2C.I2C_Address;
      Data    : HAL.I2C.I2C_Data;
      Status  : out HAL.I2C.I2C_Status;
      Timeout : Natural := 1000)
   with Pre => Data'Length > 0;

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
      Mem_Addr      : HAL.UInt16;
      Mem_Addr_Size : HAL.I2C.I2C_Memory_Address_Size;
      Data          : HAL.I2C.I2C_Data;
      Status        : out HAL.I2C.I2C_Status;
      Timeout       : Natural := 1000);

   overriding
   procedure Mem_Read
     (This          : in out I2C_Master_Port;
      Addr          : HAL.I2C.I2C_Address;
      Mem_Addr      : HAL.UInt16;
      Mem_Addr_Size : HAL.I2C.I2C_Memory_Address_Size;
      Data          : out HAL.I2C.I2C_Data;
      Status        : out HAL.I2C.I2C_Status;
      Timeout       : Natural := 1000);

private
   use HAL;

   type CON_Register is record
      STOP_DET_IF_MASTER_ACTIVE  : Boolean := False;
      RX_FIFO_FULL_HLD_CTRL      : Boolean := False;
      TX_EMPTY_CTRL              : Boolean := False;
      STOP_DET_IFADDRESSED       : Boolean := False;
      IC_SLAVE_DISABLE           : Boolean := True;
      IC_RESTART_EN              : Boolean := True;
      IC_10BITADDR_MASTER        : Boolean := False;
      IC_10BITADDR_SLAVE         : Boolean := False;
      SPEED                      : UInt2 := 2;
      MASTER_MODE                : Boolean := True;
   end record
      with Size => 32,
           Effective_Writes,
           Async_Readers,
           Async_Writers,
           Volatile_Full_Access;
   for CON_Register use record
      STOP_DET_IF_MASTER_ACTIVE  at 0 range 10 .. 10;
      RX_FIFO_FULL_HLD_CTRL      at 0 range 9 .. 9;
      TX_EMPTY_CTRL              at 0 range 8 .. 8;
      STOP_DET_IFADDRESSED       at 0 range 7 .. 7;
      IC_SLAVE_DISABLE           at 0 range 6 .. 6;
      IC_RESTART_EN              at 0 range 5 .. 5;
      IC_10BITADDR_MASTER        at 0 range 4 .. 4;
      IC_10BITADDR_SLAVE         at 0 range 3 .. 3;
      SPEED                      at 0 range 1 .. 2;
      MASTER_MODE                at 0 range 0 .. 0;
   end record;

   type DATA_CMD_Register is record
      FIRST_DATA_BYTE   : Boolean := False;
      RESTART           : Boolean := False;
      STOP              : Boolean := False;
      CMD               : Boolean := False;
      DAT               : UInt8 := 0;
   end record
      with Size => 32,
           Effective_Writes,
           Effective_Reads,
           Async_Readers,
           Async_Writers,
           Volatile_Full_Access;
   for DATA_CMD_Register use record
      FIRST_DATA_BYTE   at 0 range 11 .. 11;
      RESTART           at 0 range 10 .. 10;
      STOP              at 0 range 9 .. 9;
      CMD               at 0 range 8 .. 8;
      DAT               at 0 range 0 .. 7;
   end record;

   type INTR_Register is record
      RESTART_DET : Boolean := False;
      GEN_CALL    : Boolean := False;
      START_DET   : Boolean := False;
      STOP_DET    : Boolean := False;
      ACTIVITY    : Boolean := False;
      RX_DONE     : Boolean := False;
      TX_ABRT     : Boolean := False;
      RD_REQ      : Boolean := False;
      TX_EMPTY    : Boolean := False;
      TX_OVER     : Boolean := False;
      RX_FULL     : Boolean := False;
      RX_OVER     : Boolean := False;
      RX_UNDER    : Boolean := False;
   end record
      with Size => 32,
           Async_Writers,
           Volatile_Full_Access;
   for INTR_Register use record
      RESTART_DET at 0 range 12 .. 12;
      GEN_CALL    at 0 range 11 .. 11;
      START_DET   at 0 range 10 .. 10;
      STOP_DET    at 0 range 9 .. 9;
      ACTIVITY    at 0 range 8 .. 8;
      RX_DONE     at 0 range 7 .. 7;
      TX_ABRT     at 0 range 6 .. 6;
      RD_REQ      at 0 range 5 .. 5;
      TX_EMPTY    at 0 range 4 .. 4;
      TX_OVER     at 0 range 3 .. 3;
      RX_FULL     at 0 range 2 .. 2;
      RX_OVER     at 0 range 1 .. 1;
      RX_UNDER    at 0 range 0 .. 0;
   end record;

   type SDA_HOLD_Register is record
      SDA_RX_HOLD : UInt8 := 0;
      SDA_TX_HOLD : UInt16 := 1;
   end record
      with Size => 32,
           Effective_Writes,
           Async_Readers,
           Async_Writers,
           Volatile_Full_Access;
   for SDA_HOLD_Register use record
      SDA_RX_HOLD at 0 range 16 .. 23;
      SDA_TX_HOLD at 0 range 0 .. 15;
   end record;

   type DMA_CR_Register is record
      TDMAE, RDMAE : Boolean := False;
   end record
      with Size => 32,
           Effective_Writes,
           Async_Readers,
           Async_Writers,
           Volatile_Full_Access;
   for DMA_CR_Register use record
      TDMAE at 0 range 1 .. 1;
      RDMAE at 0 range 0 .. 0;
   end record;

   type I2C_Peripheral is record
      CON            : CON_Register;
      TAR            : UInt32 := 16#55#;
      DATA_CMD       : DATA_CMD_Register;
      FS_SCL_HCNT    : UInt32 := 16#06#;
      FS_SCL_LCNT    : UInt32 := 16#0D#;
      RAW_INTR_STAT  : INTR_Register;
      RX_TL          : UInt32;
      TX_TL          : UInt32;
      CLR_TX_ABRT    : UInt32;
      CLR_STOP_DET   : UInt32;
      ENABLE         : UInt32;
      TXFLR          : UInt32;
      RXFLR          : UInt32;
      SDA_HOLD       : SDA_HOLD_Register;
      TX_ABRT_SOURCE : UInt32;
      DMA_CR         : DMA_CR_Register;
      FS_SPKLEN      : UInt32 := 16#0007#;
   end record
      with Volatile;

   for I2C_Peripheral use record
      CON            at 16#00# range 0 .. 31;
      TAR            at 16#04# range 0 .. 31;
      DATA_CMD       at 16#10# range 0 .. 31;
      FS_SCL_HCNT    at 16#1C# range 0 .. 31;
      FS_SCL_LCNT    at 16#20# range 0 .. 31;
      RAW_INTR_STAT  at 16#34# range 0 .. 31;
      RX_TL          at 16#38# range 0 .. 31;
      TX_TL          at 16#3C# range 0 .. 31;
      CLR_TX_ABRT    at 16#54# range 0 .. 31;
      CLR_STOP_DET   at 16#60# range 0 .. 31;
      ENABLE         at 16#6C# range 0 .. 31;
      TXFLR          at 16#74# range 0 .. 31;
      RXFLR          at 16#78# range 0 .. 31;
      SDA_HOLD       at 16#7C# range 0 .. 31;
      TX_ABRT_SOURCE at 16#80# range 0 .. 31;
      DMA_CR         at 16#88# range 0 .. 31;
      FS_SPKLEN      at 16#A0# range 0 .. 31;
   end record;

   type I2C_Master_Port
      (Num    : I2C_Number;
       Periph : Any_I2C_Peripheral)
   is new HAL.I2C.I2C_Port with record
      Restart_On_Next : Boolean;
      No_Stop : Boolean;
   end record;

end RP.I2C_Master;
