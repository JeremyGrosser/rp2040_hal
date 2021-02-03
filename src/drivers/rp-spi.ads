with HAL.SPI; use HAL.SPI;
with RP2040_SVD.SPI;
with RP.Clock;

package RP.SPI is
   type SPI_Port
      (Num    : Natural;
       Periph : not null access RP2040_SVD.SPI.SPI_Peripheral) is
      new HAL.SPI.SPI_Port with private;

   procedure Enable
      (This : in out SPI_Port);

   procedure Set_Speed
      (This : in out SPI_Port;
       Baud : Hertz)
   with Pre => Baud < RP.Clock.Frequency (RP.Clock.PERI);
   Clock_Speed_Error : exception;

   overriding
   function Data_Size
      (This : SPI_Port)
      return SPI_Data_Size;

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
      (Num    : Natural;
       Periph : not null access RP2040_SVD.SPI.SPI_Peripheral) is
      new HAL.SPI.SPI_Port with null record;

end RP.SPI;
