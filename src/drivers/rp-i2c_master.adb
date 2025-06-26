--
--  Copyright 2022 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with HAL; use HAL;

package body RP.I2C_Master is
   use type RP.I2C.I2C_Status;
   use type HAL.I2C.I2C_Status;

   function To_HAL_Status
      (S : RP.I2C.I2C_Status)
      return HAL.I2C.I2C_Status
   is
   begin
      case S is
         when RP.I2C.Ok       => return HAL.I2C.Ok;
         when RP.I2C.Timeout  => return HAL.I2C.Err_Timeout;
         when RP.I2C.Error    => return HAL.I2C.Err_Error;
      end case;
   end To_HAL_Status;

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
       Addr     : HAL.I2C.I2C_Address;
       Status   : out HAL.I2C.I2C_Status;
       Deadline : RP.Timer.Time)
   is
      use type RP.Timer.Time;
      --  Most drivers that use HAL.I2C expect I2C_Address to be shifted left
      --  with the LSB set by the controller depending on whether the
      --  transaction is a read or write.
      --
      --  RP.I2C uses distinct UInt7 and UInt10 types for bus addresses, so we
      --  need to shift right first. This doesn't really need to be UInt32, any
      --  modular type >2**10 will do, but 32 bits fits nicely in a CPU
      --  register.
      Bus_Addr : constant UInt32 := Shift_Right (UInt32 (Addr), 1);
   begin
      This.Port.Disable (Deadline);
      while This.Port.Enabled loop
         if RP.Timer.Clock >= Deadline then
            Status := HAL.I2C.Err_Timeout;
            return;
         end if;
      end loop;

      case This.Address_Size is
         when Address_Size_7b =>
            This.Port.Set_Address (HAL.UInt7 (Bus_Addr));
         when Address_Size_10b =>
            This.Port.Set_Address (HAL.UInt10 (Bus_Addr));
      end case;

      This.Port.Enable (Deadline);
      while not This.Port.Enabled loop
         if RP.Timer.Clock >= Deadline then
            Status := HAL.I2C.Err_Timeout;
            return;
         end if;
      end loop;

      Status := HAL.I2C.Ok;
   end Set_Address;

   overriding
   procedure Master_Transmit
     (This    : in out I2C_Master_Port;
      Addr    : HAL.I2C.I2C_Address;
      Data    : HAL.I2C.I2C_Data;
      Status  : out HAL.I2C.I2C_Status;
      Timeout : Natural := 1000)
   is
      use RP.Timer;
      Deadline : constant Time := RP.Timer.Clock + Milliseconds (Timeout);
      S : RP.I2C.I2C_Status;
   begin
      This.Set_Address (Addr, Status, Deadline);
      if Status /= HAL.I2C.Ok then
         return;
      end if;

      This.Port.Start_Write (Data'Length, Deadline => Deadline);
      for D of Data loop
         This.Port.Write (D, S, Deadline);
         if S /= RP.I2C.Ok then
            This.Port.Abort_Write;
            This.Port.Clear_Error;
            Status := To_HAL_Status (S);
            return;
         end if;
      end loop;

      while not This.Port.State.TX_Empty loop
         if Clock >= Deadline then
            Status := HAL.I2C.Err_Timeout;
            return;
         end if;
      end loop;

      Status := HAL.I2C.Ok;
   end Master_Transmit;

   overriding
   procedure Master_Receive
     (This    : in out I2C_Master_Port;
      Addr    : HAL.I2C.I2C_Address;
      Data    : out HAL.I2C.I2C_Data;
      Status  : out HAL.I2C.I2C_Status;
      Timeout : Natural := 1000)
   is
      use RP.Timer;
      Deadline : constant Time := RP.Timer.Clock + Milliseconds (Timeout);
      S : RP.I2C.I2C_Status;
   begin
      This.Set_Address (Addr, Status, Deadline);
      if Status /= HAL.I2C.Ok then
         return;
      end if;

      This.Port.Start_Read (Data'Length);
      for I in Data'Range loop
         This.Port.Read (Data (I), S, Deadline);
         if S /= RP.I2C.Ok then
            This.Port.Clear_Error;
            Status := To_HAL_Status (S);
            return;
         end if;
      end loop;
      Status := HAL.I2C.Ok;
   end Master_Receive;

   overriding
   procedure Mem_Write
     (This          : in out I2C_Master_Port;
      Addr          : HAL.I2C.I2C_Address;
      Mem_Addr      : HAL.UInt16;
      Mem_Addr_Size : HAL.I2C.I2C_Memory_Address_Size;
      Data          : HAL.I2C.I2C_Data;
      Status        : out HAL.I2C.I2C_Status;
      Timeout       : Natural := 1000)
   is
      use RP.Timer;
      Deadline : constant Time := RP.Timer.Clock + Milliseconds (Timeout);
      S : RP.I2C.I2C_Status;
   begin
      This.Set_Address (Addr, Status, Deadline);
      if Status /= HAL.I2C.Ok then
         return;
      end if;

      case Mem_Addr_Size is
         when HAL.I2C.Memory_Size_8b =>
            This.Port.Start_Write (Data'Length + 1);
            This.Port.Write (UInt8 (Mem_Addr), S, Deadline);
            if S /= RP.I2C.Ok then
               This.Port.Abort_Write;
               This.Port.Clear_Error;
               Status := To_HAL_Status (S);
               return;
            end if;
         when HAL.I2C.Memory_Size_16b =>
            This.Port.Start_Write (Data'Length + 2);
            This.Port.Write (UInt8 (Shift_Right (Mem_Addr, 8)), S, Deadline);
            if S /= RP.I2C.Ok then
               This.Port.Abort_Write;
               This.Port.Clear_Error;
               Status := To_HAL_Status (S);
               return;
            end if;
            This.Port.Write (UInt8 (Mem_Addr and 16#FF#), S, Deadline);
            if S /= RP.I2C.Ok then
               This.Port.Abort_Write;
               This.Port.Clear_Error;
               Status := To_HAL_Status (S);
               return;
            end if;
      end case;

      for D of Data loop
         This.Port.Write (D, S, Deadline);
         if S /= RP.I2C.Ok then
            This.Port.Abort_Write;
            This.Port.Clear_Error;
            Status := To_HAL_Status (S);
            return;
         end if;
      end loop;

      while not This.Port.State.TX_Empty loop
         if Clock >= Deadline then
            Status := HAL.I2C.Err_Timeout;
            return;
         end if;
      end loop;

      Status := HAL.I2C.Ok;
   end Mem_Write;

   overriding
   procedure Mem_Read
     (This          : in out I2C_Master_Port;
      Addr          : HAL.I2C.I2C_Address;
      Mem_Addr      : HAL.UInt16;
      Mem_Addr_Size : HAL.I2C.I2C_Memory_Address_Size;
      Data          : out HAL.I2C.I2C_Data;
      Status        : out HAL.I2C.I2C_Status;
      Timeout       : Natural := 1000)
   is
      use RP.Timer;
      Deadline : constant Time := RP.Timer.Clock + Milliseconds (Timeout);
      S : RP.I2C.I2C_Status;
   begin
      This.Set_Address (Addr, Status, Deadline);
      if Status /= HAL.I2C.Ok then
         return;
      end if;

      case Mem_Addr_Size is
         when HAL.I2C.Memory_Size_8b =>
            This.Port.Start_Write (1);
            This.Port.Write (UInt8 (Mem_Addr), S, Deadline);
            if S /= RP.I2C.Ok then
               This.Port.Abort_Write;
               This.Port.Clear_Error;
               Status := To_HAL_Status (S);
               return;
            end if;
         when HAL.I2C.Memory_Size_16b =>
            This.Port.Start_Write (2);
            This.Port.Write (UInt8 (Shift_Right (Mem_Addr, 8)), S, Deadline);
            if S /= RP.I2C.Ok then
               This.Port.Abort_Write;
               This.Port.Clear_Error;
               Status := To_HAL_Status (S);
               return;
            end if;
            This.Port.Write (UInt8 (Mem_Addr and 16#FF#), S, Deadline);
            if S /= RP.I2C.Ok then
               This.Port.Abort_Write;
               This.Port.Clear_Error;
               Status := To_HAL_Status (S);
               return;
            end if;
      end case;

      This.Port.Start_Read (Data'Length);

      for I in Data'Range loop
         This.Port.Read (Data (I), S, Deadline);
         if S /= RP.I2C.Ok then
            This.Port.Clear_Error;
            Status := To_HAL_Status (S);
            return;
         end if;
      end loop;

      Status := HAL.I2C.Ok;
   end Mem_Read;

end RP.I2C_Master;
