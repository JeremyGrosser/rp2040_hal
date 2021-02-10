with RP2040_SVD.RESETS; use RP2040_SVD.RESETS;

package body RP.UART is

   procedure Enable
      (This     : in out UART_Port;
       Baudrate : Hertz)
   is
   begin
      RP.Clock.Enable (RP.Clock.PERI);

      if RESETS_Periph.RESET.uart.Arr (This.Num) then
         RESETS_Periph.RESET.uart.Arr (This.Num) := False;
         while not RESETS_Periph.RESET_DONE.uart.Arr (This.Num) loop
            null;
         end loop;
      end if;

      This.Periph.UARTDMACR :=
         (RXDMAE => True,
          TXDMAE => True,
          others => <>);

      declare
         Div : constant UART_Divider := UART_Divider
            (Float (RP.Clock.Frequency (RP.Clock.PERI)) / Float (Baudrate * 16));
      begin
         This.Periph.UARTIBRD.BAUD_DIVINT := Div_Integer (Div);
         This.Periph.UARTFBRD.BAUD_DIVFRAC := Div_Fraction (Div);
      end;

      This.Periph.UARTLCR_H :=
         (WLEN => 2#11#, --  8-bit words
          PEN  => False, --  No parity
          STP2 => False, --  1 stop bit
          FEN  => True,  --  FIFO buffer enabled
          others => <>);

      This.Periph.UARTCR :=
         (UARTEN => True,
          TXE    => True,
          RXE    => True,
          others => <>);
   end Enable;

   overriding
   function Data_Size
      (Port : UART_Port)
      return UART_Data_Size
   is (Data_Size_8b);

   overriding
   procedure Transmit
     (This    : in out UART_Port;
      Data    : UART_Data_8b;
      Status  : out UART_Status;
      Timeout : Natural := 1000)
   is
   begin
      for D of Data loop
         while This.Periph.UARTFR.TXFF loop
            null;
         end loop;
         This.Periph.UARTDR.DATA := D;
      end loop;
      while This.Periph.UARTFR.BUSY loop
         null;
      end loop;
      Status := Ok;
   end Transmit;

   overriding
   procedure Receive
     (This    : in out UART_Port;
      Data    : out UART_Data_8b;
      Status  : out UART_Status;
      Timeout : Natural := 1000)
   is
   begin
      for I in Data'Range loop
         while This.Periph.UARTFR.RXFE loop
            null;
         end loop;
         Data (I) := This.Periph.UARTDR.DATA;
         if This.Periph.UARTDR.FE or else This.Periph.UARTDR.PE then
            Status := Err_Error;
            return;
         end if;
      end loop;
      Status := Ok;
   end Receive;

   overriding
   procedure Transmit
     (This    : in out UART_Port;
      Data    : UART_Data_9b;
      Status  : out UART_Status;
      Timeout : Natural := 1000)
   is
   begin
      raise Unsupported_Data_Size;
   end Transmit;

   overriding
   procedure Receive
     (This    : in out UART_Port;
      Data    : out UART_Data_9b;
      Status  : out UART_Status;
      Timeout : Natural := 1000)
   is
   begin
      raise Unsupported_Data_Size;
   end Receive;

   function Div_Integer
      (D : UART_Divider)
      return UARTIBRD_BAUD_DIVINT_Field
   is
      I : constant Natural := Natural (D);
   begin
      if UART_Divider (I) > D then
         return UARTIBRD_BAUD_DIVINT_Field (I - 1);
      else
         return UARTIBRD_BAUD_DIVINT_Field (I);
      end if;
   end Div_Integer;

   function Div_Fraction
      (D : UART_Divider)
      return UARTFBRD_BAUD_DIVFRAC_Field
   is
      Multiple : constant UART_Divider := UART_Divider (2 ** UARTFBRD_BAUD_DIVFRAC_Field'Size);
      Int      : constant UART_Divider := UART_Divider (Div_Integer (D));
   begin
      return UARTFBRD_BAUD_DIVFRAC_Field ((D - Int) * Multiple);
   end Div_Fraction;

   function Div_Value
      (Int  : UARTIBRD_BAUD_DIVINT_Field;
       Frac : UARTFBRD_BAUD_DIVFRAC_Field)
       return UART_Divider
   is (UART_Divider (Int) + (UART_Divider (Frac) / UART_Divider (2 ** UARTFBRD_BAUD_DIVFRAC_Field'Size)));

end RP.UART;
