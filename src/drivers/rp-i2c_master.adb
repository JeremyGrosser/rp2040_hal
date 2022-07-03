--
--  Copyright 2022 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with HAL; use HAL;

package body RP.I2C_Master is

   procedure Configure
      (This         : in out I2C_Master_Port;
       Baudrate     : Hertz;
       Address_Size : I2C_Address_Size := Address_Size_7b)
   is
   begin
      This.Address_Size := Address_Size;
      if Baudrate >= 1_000_000 then
         This.Port.Configure ((Role => RP.I2C.Controller, Timing => RP.I2C.Fast_Mode_Plus));
      elsif Baudrate >= 400_000 then
         This.Port.Configure ((Role => RP.I2C.Controller, Timing => RP.I2C.Fast_Mode_Plus));
      else
         This.Port.Configure ((Role => RP.I2C.Controller, Timing => RP.I2C.Standard_Mode));
      end if;
   end Configure;

   procedure Set_Address
      (This     : in out I2C_Master_Port;
       Addr     : I2C_Address;
       Status   : out I2C_Status;
       Deadline : RP.Timer.Time)
   is
      use type RP.Timer.Time;
   begin
      This.Port.Disable (Deadline);
      while This.Port.Enabled loop
         if RP.Timer.Clock >= Deadline then
            Status := Err_Timeout;
            return;
         end if;
      end loop;

      case This.Address_Size is
         when Address_Size_7b =>
            This.Port.Set_Address (UInt7 (Addr));
         when Address_Size_10b =>
            This.Port.Set_Address (UInt10 (Addr));
      end case;

      This.Port.Enable (Deadline);
      while not This.Port.Enabled loop
         if RP.Timer.Clock >= Deadline then
            Status := Err_Timeout;
            return;
         end if;
      end loop;

      Status := Ok;
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
      This.Set_Address (Addr, S, Deadline);
      if S /= Ok then
         Status := Err_Timeout;
         return;
      end if;

      This.Port.Start_Write (Data'Length, Deadline => Deadline);
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
      This.Set_Address (Addr, S, Deadline);
      if S /= Ok then
         Status := Err_Timeout;
         return;
      end if;

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
      This.Set_Address (Addr, S, Deadline);
      if S /= Ok then
         Status := Err_Timeout;
         return;
      end if;

      case Mem_Addr_Size is
         when Memory_Size_8b =>
            This.Port.Start_Write (Data'Length + 1);
            This.Port.Write (UInt8 (Mem_Addr), S, Deadline);
            if S /= Ok then
               This.Port.Clear_Error;
               Status := S;
               return;
            end if;
         when Memory_Size_16b =>
            This.Port.Start_Write (Data'Length + 2);
            This.Port.Write (UInt8 (Shift_Right (Mem_Addr, 8)), S, Deadline);
            if S /= Ok then
               This.Port.Clear_Error;
               Status := S;
               return;
            end if;
            This.Port.Write (UInt8 (Mem_Addr and 16#FF#), S, Deadline);
            if S /= Ok then
               This.Port.Clear_Error;
               Status := S;
               return;
            end if;
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
      This.Set_Address (Addr, S, Deadline);
      if S /= Ok then
         Status := Err_Timeout;
         return;
      end if;

      case Mem_Addr_Size is
         when Memory_Size_8b =>
            This.Port.Start_Write (1, Stop => False);
            This.Port.Write (UInt8 (Mem_Addr), S, Deadline);
            if S /= Ok then
               Status := Err_Timeout;
               This.Port.Clear_Error;
               return;
            end if;
         when Memory_Size_16b =>
            This.Port.Start_Write (2, Stop => False);
            This.Port.Write (UInt8 (Shift_Right (Mem_Addr, 8)), S, Deadline);
            if S /= Ok then
               Status := Err_Timeout;
               This.Port.Clear_Error;
               return;
            end if;
            This.Port.Write (UInt8 (Mem_Addr and 16#FF#), S, Deadline);
            if S /= Ok then
               Status := Err_Timeout;
               This.Port.Clear_Error;
               return;
            end if;
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
