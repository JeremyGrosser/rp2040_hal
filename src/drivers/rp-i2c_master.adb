--
--  Copyright 2022 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with HAL; use HAL;
with RP.Timer;

package body RP.I2C_Master is

   procedure Configure
      (This     : in out I2C_Master_Port;
       Baudrate : Hertz)
   is
   begin
      if Baudrate >= 1_000_000 then
         This.Port.Configure ((Role => RP.I2C.Controller, Timing => RP.I2C.Fast_Mode_Plus));
      elsif Baudrate >= 400_000 then
         This.Port.Configure ((Role => RP.I2C.Controller, Timing => RP.I2C.Fast_Mode_Plus));
      else
         This.Port.Configure ((Role => RP.I2C.Controller, Timing => RP.I2C.Standard_Mode));
      end if;
   end Configure;

   procedure Set_Address
      (This : in out I2C_Master_Port;
       Addr : I2C_Address)
   is
   begin
      --  HAL.I2C doesn't differentiate between 7 and 10 bit addresses, so we guess.
      if Addr > I2C_Address (UInt7'Last) then
         This.Port.Set_Address (UInt10 (Addr));
      else
         This.Port.Set_Address (UInt7 (Addr));
      end if;
   end Set_Address;

   overriding
   procedure Master_Transmit
     (This    : in out I2C_Master_Port;
      Addr    : I2C_Address;
      Data    : I2C_Data;
      Status  : out I2C_Status;
      Timeout : Natural := 1000)
   is
      use RP.Timer;
      Deadline : constant Time := RP.Timer.Clock + Milliseconds (Timeout);
      S : I2C_Status;
   begin
      This.Set_Address (Addr);
      This.Port.Start_Write (Data'Length);

      for D of Data loop
         This.Port.Write (D, S, Deadline);
         if S /= Ok then
            This.Port.Clear_Error;
            Status := S;
            return;
         end if;
      end loop;

      Status := Ok;
   end Master_Transmit;

   overriding
   procedure Master_Receive
     (This    : in out I2C_Master_Port;
      Addr    : I2C_Address;
      Data    : out I2C_Data;
      Status  : out I2C_Status;
      Timeout : Natural := 1000)
   is
      use RP.Timer;
      Deadline : constant Time := RP.Timer.Clock + Milliseconds (Timeout);
      S : I2C_Status;
   begin
      This.Set_Address (Addr);
      This.Port.Start_Read (Data'Length);

      for I in Data'Range loop
         This.Port.Read (Data (I), S, Deadline);
         if S /= Ok then
            This.Port.Clear_Error;
            Status := S;
            return;
         end if;
      end loop;

      Status := Ok;
   end Master_Receive;

   overriding
   procedure Mem_Write
     (This          : in out I2C_Master_Port;
      Addr          : I2C_Address;
      Mem_Addr      : HAL.UInt16;
      Mem_Addr_Size : I2C_Memory_Address_Size;
      Data          : I2C_Data;
      Status        : out I2C_Status;
      Timeout       : Natural := 1000)
   is
      use RP.Timer;
      Deadline : constant Time := RP.Timer.Clock + Milliseconds (Timeout);
      S : I2C_Status;
   begin
      This.Set_Address (Addr);

      case Mem_Addr_Size is
         when Memory_Size_8b =>
            This.Port.Start_Write (Data'Length + 1);
            This.Port.Write (UInt8 (Mem_Addr), S, Deadline);
         when Memory_Size_16b =>
            This.Port.Start_Write (Data'Length + 2);
            This.Port.Write (UInt8 (Shift_Right (Mem_Addr, 8)), S, Deadline);
            This.Port.Write (UInt8 (Mem_Addr and 16#FF#), S, Deadline);
      end case;

      for D of Data loop
         This.Port.Write (D, S, Deadline);
         if S /= Ok then
            This.Port.Clear_Error;
            Status := S;
            return;
         end if;
      end loop;

      Status := Ok;
   end Mem_Write;

   overriding
   procedure Mem_Read
     (This          : in out I2C_Master_Port;
      Addr          : I2C_Address;
      Mem_Addr      : HAL.UInt16;
      Mem_Addr_Size : I2C_Memory_Address_Size;
      Data          : out I2C_Data;
      Status        : out I2C_Status;
      Timeout       : Natural := 1000)
   is
      use RP.Timer;
      Deadline : constant Time := RP.Timer.Clock + Milliseconds (Timeout);
      S : I2C_Status;
   begin
      This.Set_Address (Addr);

      case Mem_Addr_Size is
         when Memory_Size_8b =>
            This.Port.Start_Write (1, Stop => False);
            This.Port.Write (UInt8 (Mem_Addr), S, Deadline);
         when Memory_Size_16b =>
            This.Port.Start_Write (2, Stop => False);
            This.Port.Write (UInt8 (Shift_Right (Mem_Addr, 8)), S, Deadline);
            This.Port.Write (UInt8 (Mem_Addr and 16#FF#), S, Deadline);
      end case;

      This.Port.Start_Read (Data'Length);

      for I in Data'Range loop
         This.Port.Read (Data (I), S, Deadline);
         if S /= Ok then
            This.Port.Clear_Error;
            Status := S;
            return;
         end if;
      end loop;

      Status := Ok;
   end Mem_Read;

end RP.I2C_Master;
