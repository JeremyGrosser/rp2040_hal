--
--  Copyright 2021-2026 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with HAL.SPI; use HAL.SPI;
with HAL; use HAL;
with RP.Clock;
with System;

package RP.SPI is
   type SPI_Number is range 0 .. 1;
   type SPI_Peripheral is private;
   type Any_SPI_Peripheral is access all SPI_Peripheral;
   type SPI_Port
      (Num : SPI_Number;
       Periph : not null Any_SPI_Peripheral)
   is new HAL.SPI.SPI_Port with record
      Blocking : Boolean := False;
   end record;

   type SPI_Role is (Master, Slave);
   type SPI_Polarity is (Active_Low, Active_High);
   type SPI_Phase is (Rising_Edge, Falling_Edge);
   type SPI_FIFO_Status is (Empty, Not_Full, Busy, Full, Invalid);

   type SPI_Configuration is record
      Role      : SPI_Role := Master;
      Baud      : Hertz := 1_000_000;
      Data_Size : SPI_Data_Size := Data_Size_8b;
      Polarity  : SPI_Polarity := Active_Low;
      Phase     : SPI_Phase := Rising_Edge;
      Blocking  : Boolean := True; --  Wait for Transmit FIFO to be empty before returning
      Loopback  : Boolean := False;
   end record;

   Default_SPI_Configuration : constant SPI_Configuration := (others => <>);

   Clock_Speed_Error : exception;

   procedure Configure
      (This   : in out SPI_Port;
       Config : SPI_Configuration := Default_SPI_Configuration);

   procedure Set_Speed
      (This : SPI_Port;
       Baud : Hertz)
   with Pre => Baud <= RP.Clock.Frequency (RP.Clock.PERI);

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

   procedure Transfer
      (This : SPI_Port;
       Data : in out UInt8)
   with Pre => Data_Size (This) = Data_Size_8b;

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

   type SPI_IRQ_Flag is
      (Receive_Overrun,           --  bit 0 RORIM
       Receive_Timeout,           --  bit 1 RTIM
       Receive_FIFO_Not_Empty,    --  bit 2 RXIM
       Transmit_FIFO_Half_Empty); --  bit 3 TXIM

   procedure Enable_IRQ
      (This : SPI_Port;
       IRQ  : SPI_IRQ_Flag);
   --  Enable the given IRQ flag

   procedure Disable_IRQ
      (This : SPI_Port;
       IRQ  : SPI_IRQ_Flag);
   --  Disable the given IRQ flag

   procedure Clear_IRQ
      (This : SPI_Port;
       IRQ  : SPI_IRQ_Flag);
   --  Clear the given IRQ flag

   function Masked_IRQ_Status
      (This : SPI_Port;
       IRQ  : SPI_IRQ_Flag)
       return Boolean;
   --  Return true if the given IRQ flag is signaled and enabled

   function Raw_IRQ_Status
      (This : SPI_Port;
       IRQ  : SPI_IRQ_Flag)
       return Boolean;
   --  Return true if the given IRQ flag is signaled even if the flag is not
   --  enabled.

private

   type CR0_Register is record
      SCR : UInt8 := 0;
      SPH : Boolean := False;
      SPO : Boolean := False;
      FRF : UInt2 := 0;
      DSS : UInt4 := 0;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Object_Size => 32;
   for CR0_Register use record
      SCR at 0 range 8 .. 15;
      SPH at 0 range 7 .. 7;
      SPO at 0 range 6 .. 6;
      FRF at 0 range 4 .. 5;
      DSS at 0 range 0 .. 3;
   end record;

   type CR1_Register is record
      SOD : Boolean := False;
      MS  : Boolean := False;
      SSE : Boolean := False;
      LBM : Boolean := False;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Object_Size => 32;
   for CR1_Register use record
      SOD at 0 range 3 .. 3;
      MS  at 0 range 2 .. 2;
      SSE at 0 range 1 .. 1;
      LBM at 0 range 0 .. 0;
   end record;

   type SR_Register is record
      BSY : Boolean := False;
      RFF : Boolean := False;
      RNE : Boolean := False;
      TNF : Boolean := True;
      TFE : Boolean := True;
   end record
      with Volatile_Full_Access,
           Async_Writers,
           Object_Size => 32;
   for SR_Register use record
      BSY at 0 range 4 .. 4;
      RFF at 0 range 3 .. 3;
      RNE at 0 range 2 .. 2;
      TNF at 0 range 1 .. 1;
      TFE at 0 range 0 .. 0;
   end record;

   type IRQ_Flag_Array is array (SPI_IRQ_Flag) of Boolean
      with Component_Size => 1, Size => 4;

   type IRQ_Register is record
      Flag : IRQ_Flag_Array;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Writers,
           Async_Readers,
           Object_Size => 32;
   for IRQ_Register use record
      Flag at 0 range 0 .. 3;
   end record;

   type SPI_Peripheral is record
      CR0   : CR0_Register;
      CR1   : CR1_Register;
      DR    : UInt32;
      SR    : SR_Register;
      CPSR  : UInt32;
      IMSC  : IRQ_Register;
      RIS   : IRQ_Register;
      MIS   : IRQ_Register;
      ICR   : IRQ_Register;
      DMACR : UInt32;
   end record
      with Volatile;
   for SPI_Peripheral use record
      CR0   at 16#00# range 0 .. 31;
      CR1   at 16#04# range 0 .. 31;
      DR    at 16#08# range 0 .. 31;
      SR    at 16#0C# range 0 .. 31;
      CPSR  at 16#10# range 0 .. 31;
      IMSC  at 16#14# range 0 .. 31;
      RIS   at 16#18# range 0 .. 31;
      MIS   at 16#1C# range 0 .. 31;
      ICR   at 16#20# range 0 .. 31;
      DMACR at 16#24# range 0 .. 31;
   end record;

end RP.SPI;
