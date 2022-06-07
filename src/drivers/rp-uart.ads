--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP2040_SVD.UART; use RP2040_SVD.UART;
with HAL.UART; use HAL.UART;
with HAL.Time;
with RP.Clock;
with System;

package RP.UART
   with Preelaborate
is
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

   type UART_Port
      (Num    : UART_Number;
       Periph : not null access RP2040_SVD.UART.UART_Peripheral)
   is new HAL.UART.UART_Port with record
      Config : UART_Configuration;
   end record;

   procedure Configure
      (This   : in out UART_Port;
       Config : UART_Configuration := Default_UART_Configuration)
      with Pre => RP.Clock.Frequency (RP.Clock.PERI) > 3_686_400;

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
      (This     : in out UART_Port;
       Delays   : HAL.Time.Any_Delays;
       Duration : Microseconds;
       Start    : Boolean := True);

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

   procedure Set_FIFO_IRQ_Level (This : in out UART_Port;
                                 RX   :        FIFO_IRQ_Level;
                                 TX   :        FIFO_IRQ_Level);
   --  Set the trigger point for receive and transmit FIFO interrupt. For the
   --  receive FIFO, the interrupt is triggered when the FIFO level is above or
   --  equal to the set level. For the transmit FIFO, the interrupt is triggered
   --  when the FIFO level is below or equal to the set level.

   type UART_IRQ_Flag is
     (Modem_RI, Modem_CTS, Modem_DCD, Modem_DSR,
      Receive,
      Transmit,
      Receive_Timeout,
      Framing_Error,
      Parity_Error,
      Break_Error,
      Overrun_Error);

   procedure Enable_IRQ (This : in out UART_Port;
                         IRQ  :        UART_IRQ_Flag);
   --  Enable the given IRQ flag

   procedure Disable_IRQ (This : in out UART_Port;
                          IRQ  :        UART_IRQ_Flag);
   --  Disable the given IRQ flag

   procedure Clear_IRQ (This : in out UART_Port;
                        IRQ  :        UART_IRQ_Flag);
   --  Clear the given IRQ flag

   function Masked_IRQ_Status (This : UART_Port;
                               IRQ  : UART_IRQ_Flag)
                               return Boolean;
   --  Return true if the given IRQ flag is signaled and enabled

   function RAW_IRQ_Status (This : UART_Port;
                            IRQ  : UART_IRQ_Flag)
                            return Boolean;
   --  Return true if the given IRQ flag is signaled even if the flag is not
   --  enabled.

private

   UART_Fraction : constant := 1.0 / 2 ** UARTFBRD_BAUD_DIVFRAC_Field'Size;
   type UART_Divider is delta UART_Fraction
      range UART_Fraction .. (2.0 ** UARTIBRD_BAUD_DIVINT_Field'Size) - UART_Fraction;

   function Div_Integer
      (D : UART_Divider)
      return UARTIBRD_BAUD_DIVINT_Field;

   function Div_Fraction
      (D : UART_Divider)
      return UARTFBRD_BAUD_DIVFRAC_Field;

   function Div_Value
      (Int  : UARTIBRD_BAUD_DIVINT_Field;
       Frac : UARTFBRD_BAUD_DIVFRAC_Field)
       return UART_Divider;

   for FIFO_IRQ_Level use
     (Lvl_Eighth        => 2#000#,
      Lvl_Quarter       => 2#001#,
      Lvl_Half          => 2#010#,
      Lvl_Three_Quarter => 2#011#,
      Lvl_Seven_Eighth  => 2#100#);

   for UART_IRQ_Flag use
     (Modem_RI        => 2#0000_0000_0001#,
      Modem_CTS       => 2#0000_0000_0010#,
      Modem_DCD       => 2#0000_0000_0100#,
      Modem_DSR       => 2#0000_0000_1000#,
      Receive         => 2#0000_0001_0000#,
      Transmit        => 2#0000_0010_0000#,
      Receive_Timeout => 2#0000_0100_0000#,
      Framing_Error   => 2#0000_1000_0000#,
      Parity_Error    => 2#0001_0000_0000#,
      Break_Error     => 2#0010_0000_0000#,
      Overrun_Error   => 2#0100_0000_0000#);

end RP.UART;
