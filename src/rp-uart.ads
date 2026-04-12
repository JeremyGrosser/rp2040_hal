--
--  Copyright 2021-2026 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with HAL.UART; use HAL.UART;
with HAL; use HAL;
with System;

package RP.UART is
   subtype UART_Word_Size is Integer range 5 .. 8;
   subtype UART_Stop_Bits is Integer range 1 .. 2;
   type UART_Parity_Type is (Even, Odd);

   type UART_FIFO_Status is (Empty, Not_Full, Full, Busy, Invalid);

   --  Default configuration is 115200 8n1
   --  https://en.wikipedia.org/wiki/8-N-1
   type UART_Configuration is record
      Baud         : Hertz := 115_200;
      Word_Size    : UART_Word_Size := 8;
      Parity       : Boolean := False;
      Stop_Bits    : UART_Stop_Bits := 1;
      Parity_Type  : UART_Parity_Type := Even; --  has no effect when Parity = False
      Frame_Length : Positive := 1; --  Words per frame. Used to calculate break timing.
      Loopback     : Boolean := False;
      Enable_FIFOs : Boolean := True; -- Enable TX and RX FIFOs
   end record;

   Default_UART_Configuration : constant UART_Configuration := (others => <>);

   subtype UART_Number is Natural range 0 .. 1;
   type UART_Peripheral is private;
   type Any_UART_Peripheral is access all UART_Peripheral;
   type UART_Port
      (Num    : UART_Number;
       Periph : not null Any_UART_Peripheral)
   is new HAL.UART.UART_Port with record
      Config : UART_Configuration;
   end record;

   procedure Configure
      (This   : in out UART_Port;
       Config : UART_Configuration := Default_UART_Configuration);

   --  If parity is enabled, the parity bit may be forced high using this
   --  procedure. Stick parity is used in some protocols to indicate the
   --  beginning of a new message.
   procedure Set_Stick_Parity
      (This    : in out UART_Port;
       Enabled : Boolean);

   --  Just so we're clear on the magnitude of these timings
   subtype Microseconds is Integer;

   --  Duration of a single mark or space symbol for the current configuration
   function Symbol_Time
      (This : UART_Port)
      return Microseconds;

   --  Duration of a single frame transmission for the current configuration
   function Frame_Time
      (This : UART_Port)
      return Microseconds;

   --  Send a break by holding TX active. The Delays implementation must
   --  support Delay_Microseconds. It's okay if delays are longer, but they
   --  cannot be shorter. If Start = True, an additional delay of one bit
   --  period will be added before the break.
   procedure Send_Break
      (This   : in out UART_Port;
       Length : Microseconds;
       Start  : Boolean := True);

   function Transmit_Status
      (This : UART_Port)
      return UART_FIFO_Status;

   function Receive_Status
      (This : UART_Port)
      return UART_FIFO_Status;

   function FIFO_Address
      (This : UART_Port)
      return System.Address;

   overriding
   function Data_Size
      (Port : UART_Port)
      return UART_Data_Size;

   overriding
   procedure Transmit
     (This    : in out UART_Port;
      Data    : UART_Data_8b;
      Status  : out UART_Status;
      Timeout : Natural := 1000);

   overriding
   procedure Transmit
     (This    : in out UART_Port;
      Data    : UART_Data_9b;
      Status  : out UART_Status;
      Timeout : Natural := 1000);

   overriding
   procedure Receive
     (This    : in out UART_Port;
      Data    : out UART_Data_8b;
      Status  : out UART_Status;
      Timeout : Natural := 1000);

   overriding
   procedure Receive
     (This    : in out UART_Port;
      Data    : out UART_Data_9b;
      Status  : out UART_Status;
      Timeout : Natural := 1000);

   type FIFO_IRQ_Level is (Lvl_Eighth,
                           Lvl_Quarter,
                           Lvl_Half,
                           Lvl_Three_Quarter,
                           Lvl_Seven_Eighth);

   procedure Set_FIFO_IRQ_Level
      (This : UART_Port;
       RX   : FIFO_IRQ_Level;
       TX   : FIFO_IRQ_Level);
   --  Set the trigger point for receive and transmit FIFO interrupt. For
   --  the receive FIFO, the interrupt is triggered when the FIFO level is
   --  above or equal to the set level. For the transmit FIFO, the
   --  interrupt is triggered when the FIFO level is below or equal to the
   --  set level.

   type UART_IRQ_Flag is
     (Modem_RI, Modem_CTS, Modem_DCD, Modem_DSR,
      Receive,
      Transmit,
      Receive_Timeout,
      Framing_Error,
      Parity_Error,
      Break_Error,
      Overrun_Error);

   procedure Enable_IRQ
      (This : UART_Port;
       IRQ  : UART_IRQ_Flag);

   procedure Disable_IRQ
      (This : UART_Port;
       IRQ  : UART_IRQ_Flag);

   procedure Clear_IRQ
      (This : UART_Port;
       IRQ  : UART_IRQ_Flag);

   function Masked_IRQ_Status
      (This : UART_Port;
       IRQ  : UART_IRQ_Flag)
       return Boolean;

   function Raw_IRQ_Status
      (This : UART_Port;
       IRQ  : UART_IRQ_Flag)
       return Boolean;

private

   type DR_Register is record
      BE    : Boolean := False;
      PE    : Boolean := False;
      FE    : Boolean := False;
      DATA  : UInt8 := 0;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Effective_Reads,
           Async_Writers,
           Async_Readers,
           Object_Size => 32;
   for DR_Register use record
      BE    at 0 range 10 .. 10;
      PE    at 0 range 9 .. 9;
      FE    at 0 range 8 .. 8;
      DATA  at 0 range 0 .. 7;
   end record;

   type FR_Register is record
      RI    : Boolean := False;
      TXFE  : Boolean := True;
      RXFF  : Boolean := False;
      TXFF  : Boolean := False;
      RXFE  : Boolean := True;
      BUSY  : Boolean := False;
      DCD   : Boolean := False;
      DSR   : Boolean := False;
      CTS   : Boolean := False;
   end record
      with Volatile_Full_Access,
           Async_Writers,
           Object_Size => 32;
   for FR_Register use record
      RI    at 0 range 8 .. 8;
      TXFE  at 0 range 7 .. 7;
      RXFF  at 0 range 6 .. 6;
      TXFF  at 0 range 5 .. 5;
      RXFE  at 0 range 4 .. 4;
      BUSY  at 0 range 3 .. 3;
      DCD   at 0 range 2 .. 2;
      DSR   at 0 range 1 .. 1;
      CTS   at 0 range 0 .. 0;
   end record;

   type LCR_H_Register is record
      SPS   : Boolean := False;
      WLEN  : UInt2 := 0;
      FEN   : Boolean := False;
      STP2  : Boolean := False;
      EPS   : Boolean := False;
      PEN   : Boolean := False;
      BRK   : Boolean := False;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Object_Size => 32;
   for LCR_H_Register use record
      SPS   at 0 range 7 .. 7;
      WLEN  at 0 range 5 .. 6;
      FEN   at 0 range 4 .. 4;
      STP2  at 0 range 3 .. 3;
      EPS   at 0 range 2 .. 2;
      PEN   at 0 range 1 .. 1;
      BRK   at 0 range 0 .. 0;
   end record;

   type CR_Register is record
      CTSEN    : Boolean := False;
      RTSEN    : Boolean := False;
      OUT2     : Boolean := False;
      OUT1     : Boolean := False;
      RTS      : Boolean := False;
      DTR      : Boolean := False;
      RXE      : Boolean := False;
      TXE      : Boolean := False;
      LBE      : Boolean := False;
      SIRLP    : Boolean := False;
      SIREN    : Boolean := False;
      UARTEN   : Boolean := False;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Object_Size => 32;
   for CR_Register use record
      CTSEN    at 0 range 15 .. 15;
      RTSEN    at 0 range 14 .. 14;
      OUT2     at 0 range 13 .. 13;
      OUT1     at 0 range 12 .. 12;
      RTS      at 0 range 11 .. 11;
      DTR      at 0 range 10 .. 10;
      RXE      at 0 range 9 .. 9;
      TXE      at 0 range 8 .. 8;
      LBE      at 0 range 7 .. 7;
      SIRLP    at 0 range 2 .. 2;
      SIREN    at 0 range 1 .. 1;
      UARTEN   at 0 range 0 .. 0;
   end record;

   type IFLS_Register is record
      RXIFLSEL : FIFO_IRQ_Level;
      TXIFLSEL : FIFO_IRQ_Level;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Object_Size => 32;
   for IFLS_Register use record
      RXIFLSEL at 0 range 3 .. 5;
      TXIFLSEL at 0 range 0 .. 2;
   end record;

   type INT_Array is array (UART_IRQ_Flag) of Boolean
      with Volatile, Component_Size => 1;

   type INT_Register is record
      Flags : INT_Array;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Async_Writers,
           Object_Size => 32;
   for INT_Register use record
      Flags at 0 range 0 .. 11;
   end record;

   pragma Warnings (Off, "16 bits of ""*"" unused");
   type UART_Peripheral is record
      DR    : DR_Register;
      FR    : FR_Register;
      IBRD  : UInt32;
      FBRD  : UInt32;
      LCR_H : LCR_H_Register;
      CR    : CR_Register;
      IFLS  : IFLS_Register;
      IMSC  : INT_Register;
      RIS   : INT_Register;
      MIS   : INT_Register;
      ICR   : INT_Register;
      DMACR : UInt32;
   end record
      with Volatile;
   for UART_Peripheral use record
      DR    at 16#00# range 0 .. 31;
      FR    at 16#18# range 0 .. 31;
      IBRD  at 16#24# range 0 .. 31;
      FBRD  at 16#28# range 0 .. 31;
      LCR_H at 16#2C# range 0 .. 31;
      CR    at 16#30# range 0 .. 31;
      IFLS  at 16#34# range 0 .. 31;
      IMSC  at 16#38# range 0 .. 31;
      RIS   at 16#3C# range 0 .. 31;
      MIS   at 16#40# range 0 .. 31;
      ICR   at 16#44# range 0 .. 31;
      DMACR at 16#48# range 0 .. 31;
   end record;
   pragma Warnings (On, "16 bits of ""*"" unused");

   for FIFO_IRQ_Level use
     (Lvl_Eighth        => 2#000#,
      Lvl_Quarter       => 2#001#,
      Lvl_Half          => 2#010#,
      Lvl_Three_Quarter => 2#011#,
      Lvl_Seven_Eighth  => 2#100#);

end RP.UART;
