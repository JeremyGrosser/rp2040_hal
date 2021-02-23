with RP2040_SVD.UART; use RP2040_SVD.UART;
with HAL.UART; use HAL.UART;
with RP.Clock;

package RP.UART
   with Elaborate_Body
is

   type UART_Port
      (Num    : Natural;
       Periph : not null access RP2040_SVD.UART.UART_Peripheral)
   is new HAL.UART.UART_Port with private;

   procedure Enable
      (This     : in out UART_Port;
       Baudrate : Hertz)
      with Pre => RP.Clock.Frequency (RP.Clock.PERI) > 3_686_400;

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

private

   type UART_Port
      (Num    : Natural;
       Periph : not null access RP2040_SVD.UART.UART_Peripheral)
   is new HAL.UART.UART_Port with null record;

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

end RP.UART;
