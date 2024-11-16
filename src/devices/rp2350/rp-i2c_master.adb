--
--  Copyright 2022-2024 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP.Clock;
with RP.Reset;
with System;

package body RP.I2C_Master is
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
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Async_Writers,
           Object_Size => 32;
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

   type TAR_Register is record
      SPECIAL     : Boolean := False;
      GC_OR_START : Boolean := False;
      TAR         : UInt10 := 16#55#;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Object_Size => 32;
   for TAR_Register use record
      SPECIAL     at 0 range 11 .. 11;
      GC_OR_START at 0 range 10 .. 10;
      TAR         at 0 range 0 .. 9;
   end record;

   type DATA_CMD_Register is record
      FIRST_DATA_BYTE   : Boolean := False;
      RESTART           : Boolean := False;
      STOP              : Boolean := False;
      CMD               : Boolean := False;
      DAT               : UInt8 := 0;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Effective_Reads,
           Async_Writers,
           Async_Readers,
           Object_Size => 32;
   for DATA_CMD_Register use record
      FIRST_DATA_BYTE   at 0 range 11 .. 11;
      RESTART           at 0 range 10 .. 10;
      STOP              at 0 range 9 .. 9;
      CMD               at 0 range 8 .. 8;
      DAT               at 0 range 0 .. 7;
   end record;

   type INTR_Register is record
      RESTART_DET : Boolean;
      GEN_CALL    : Boolean;
      START_DET   : Boolean;
      STOP_DET    : Boolean;
      ACTIVITY    : Boolean;
      RX_DONE     : Boolean;
      TX_ABRT     : Boolean;
      RD_REQ      : Boolean;
      TX_EMPTY    : Boolean;
      TX_OVER     : Boolean;
      RX_FULL     : Boolean;
      RX_OVER     : Boolean;
      RX_UNDER    : Boolean;
   end record
      with Volatile_Full_Access,
           Async_Writers,
           Object_Size => 32;
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

   type ENABLE_Register is record
      TX_CMD_BLOCK : Boolean := False;
      TX_ABORT     : Boolean := False;
      ENABLE       : Boolean := False;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Async_Writers,
           Object_Size => 32;
   for ENABLE_Register use record
      TX_CMD_BLOCK at 0 range 2 .. 2;
      TX_ABORT     at 0 range 1 .. 1;
      ENABLE       at 0 range 0 .. 0;
   end record;

   type SDA_HOLD_Register is record
      SDA_RX_HOLD : UInt8 := 16#00#;
      SDA_TX_HOLD : UInt16 := 16#0001#;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Object_Size => 32;
   for SDA_HOLD_Register use record
      SDA_RX_HOLD at 0 range 16 .. 23;
      SDA_TX_HOLD at 0 range 0 .. 15;
   end record;

   type CLR_Register is mod 2 ** 32
      with Volatile_Full_Access,
           Effective_Reads,
           Async_Writers,
           Async_Readers,
           Object_Size => 32;

   type I2C_Peripheral is record
      CON            : CON_Register;
      TAR            : TAR_Register;
      DATA_CMD       : DATA_CMD_Register;
      FS_SCL_LCNT    : UInt32 := 16#002F#;
      FS_SCL_HCNT    : UInt32 := 16#0006#;
      CLR_TX_ABRT    : CLR_Register;
      CLR_STOP_DET   : CLR_Register;
      RAW_INTR_STAT  : INTR_Register;
      ENABLE         : ENABLE_Register;
      TXFLR          : UInt32;
      RXFLR          : UInt32;
      SDA_HOLD       : SDA_HOLD_Register;
      TX_ABRT_SOURCE : UInt32;
      FS_SPKLEN      : UInt32 := 16#07#;
   end record
      with Volatile;
   for I2C_Peripheral use record
      CON            at 16#00# range 0 .. 31;
      TAR            at 16#04# range 0 .. 31;
      DATA_CMD       at 16#10# range 0 .. 31;
      FS_SCL_LCNT    at 16#18# range 0 .. 31;
      FS_SCL_HCNT    at 16#1C# range 0 .. 31;
      RAW_INTR_STAT  at 16#34# range 0 .. 31;
      CLR_TX_ABRT    at 16#54# range 0 .. 31;
      CLR_STOP_DET   at 16#60# range 0 .. 31;
      ENABLE         at 16#6C# range 0 .. 31;
      TXFLR          at 16#74# range 0 .. 31;
      RXFLR          at 16#78# range 0 .. 31;
      SDA_HOLD       at 16#7C# range 0 .. 31;
      TX_ABRT_SOURCE at 16#80# range 0 .. 31;
      FS_SPKLEN      at 16#A0# range 0 .. 31;
   end record;

   type Any_I2C_Peripheral is not null access all I2C_Peripheral;

   I2C_0 : aliased I2C_Peripheral
      with Import, Address => System'To_Address (16#4009_0000#);
   I2C_1 : aliased I2C_Peripheral
      with Import, Address => System'To_Address (16#4009_8000#);

   function Periph
      (This : I2C_Master_Port)
      return Any_I2C_Peripheral
   is (case This.Num is
         when 0 => I2C_0'Access,
         when 1 => I2C_1'Access);

   function Time_Exceeded
      (This : I2C_Master_Port)
      return Boolean
   is
      use type RP.Timer.Time;
   begin
      return RP.Timer.Clock >= This.Deadline;
   end Time_Exceeded;

   procedure Configure
      (This         : in out I2C_Master_Port;
       Baudrate     : Hertz;
       Address_Size : I2C_Address_Size := Address_Size_7b)
   is
      P : constant Any_I2C_Peripheral := Periph (This);
      CLK_SYS : constant Hertz := RP.Clock.Frequency (RP.Clock.SYS);
      Period  : constant Natural := Natural ((CLK_SYS + Baudrate / 2) / Baudrate);
      LCNT    : constant Natural := Period * 3 / 5;
      HCNT    : constant Natural := Period - LCNT;
      SDA_TX_HOLD : constant Natural :=
         ((CLK_SYS * 3) / (if Baudrate < 1e6 then 10e6 else 25e6)) + 1;
   begin
      RP.Clock.Enable (RP.Clock.PERI);
      case This.Num is
         when 0 =>
            RP.Reset.Reset_Peripheral (RP.Reset.Reset_I2C0);
         when 1 =>
            RP.Reset.Reset_Peripheral (RP.Reset.Reset_I2C1);
      end case;

      P.ENABLE := (others => False);
      P.CON :=
         (TX_EMPTY_CTRL => True,
          IC_10BITADDR_MASTER => (Address_Size = Address_Size_10b),
          others => <>);
      P.FS_SCL_HCNT := UInt32 (HCNT);
      P.FS_SCL_LCNT := UInt32 (LCNT);
      P.SDA_HOLD :=
         (SDA_RX_HOLD => 0,
          SDA_TX_HOLD => UInt16 (SDA_TX_HOLD));
      P.ENABLE.ENABLE := True;
      This.Restart_On_Next := False;
      This.Address_Size := Address_Size;
      This.Deadline := RP.Timer.Time'First;
   end Configure;

   procedure Set_Deadline
      (This     : in out I2C_Master_Port;
       Deadline : RP.Timer.Time)
   is
   begin
      This.Deadline := Deadline;
   end Set_Deadline;

   procedure Write
      (This  : in out I2C_Master_Port;
       Addr  : UInt10;
       Data  : UInt8_Array;
       Error : out Boolean;
       Stop  : Boolean := True)
   is
      P : constant Any_I2C_Peripheral := Periph (This);

      STAT : INTR_Register;
      TX_ABRT_SOURCE : UInt32;
      Timeout, TX_Abort : Boolean := False;
      Read_Clear : CLR_Register with Volatile;
   begin
      P.ENABLE.ENABLE := False;
      P.TAR := (TAR => Addr, others => <>);
      P.ENABLE.ENABLE := True;

      for I in Data'Range loop
         P.DATA_CMD :=
            (RESTART => (I = Data'First) and then This.Restart_On_Next,
             STOP    => (I = Data'Last) and then Stop,
             DAT     => Data (I),
             others  => <>);
         loop
            STAT := P.RAW_INTR_STAT;
            exit when STAT.TX_EMPTY;
            Timeout := Time_Exceeded (This);
            TX_Abort := Timeout;
            exit when Timeout;
         end loop;

         if not Timeout then
            TX_ABRT_SOURCE := P.TX_ABRT_SOURCE;
            if TX_ABRT_SOURCE > 0 then
               Read_Clear := P.CLR_TX_ABRT;
               TX_Abort := True;
            end if;

            if TX_Abort or else ((I = Data'Last) and then Stop) then
               loop
                  Timeout := Time_Exceeded (This);
                  TX_Abort := TX_Abort or else Timeout;
                  STAT := P.RAW_INTR_STAT;
                  exit when Timeout or else STAT.STOP_DET;
               end loop;

               if not Timeout then
                  Read_Clear := P.CLR_STOP_DET;
               end if;
            end if;
         end if;

         exit when TX_Abort;
      end loop;

      This.Restart_On_Next := not Stop;
      Error := TX_Abort;
   end Write;

   procedure Read
      (This  : in out I2C_Master_Port;
       Addr  : UInt10;
       Data  : out UInt8_Array;
       Error : out Boolean;
       Stop  : Boolean := True)
   is
      P : constant Any_I2C_Peripheral := Periph (This);
      TX_BUFFER_DEPTH : constant := 16;
      Timeout      : Boolean;
      RX_Abort     : Boolean := False;
      TXFLR, RXFLR : UInt32;
      TX_ABRT_SOURCE : UInt32;
      Read_Clear : CLR_Register with Volatile;
   begin
      P.ENABLE.ENABLE := False;
      P.TAR := (TAR => Addr, others => <>);
      P.ENABLE.ENABLE := True;

      Data := (others => 0);

      for I in Data'Range loop
         loop
            TXFLR := P.TXFLR;
            exit when (TX_BUFFER_DEPTH - TXFLR) > 0;
         end loop;

         P.DATA_CMD :=
            (RESTART => (I = Data'First) and then This.Restart_On_Next,
             STOP    => (I = Data'Last) and then Stop,
             CMD     => True,
             others  => <>);

         loop
            TX_ABRT_SOURCE := P.TX_ABRT_SOURCE;
            if TX_ABRT_SOURCE > 0 then
               Read_Clear := P.CLR_TX_ABRT;
               RX_Abort := True;
            end if;
            Timeout := Time_Exceeded (This);
            RX_Abort := RX_Abort or else Timeout;
            RXFLR := P.RXFLR;
            exit when RX_Abort or else RXFLR > 0;
         end loop;

         exit when RX_Abort;

         Data (I) := P.DATA_CMD.DAT;
      end loop;

      This.Restart_On_Next := not Stop;
      Error := RX_Abort;
   end Read;

   overriding
   procedure Master_Transmit
     (This    : in out I2C_Master_Port;
      Addr    : HAL.I2C.I2C_Address;
      Data    : HAL.I2C.I2C_Data;
      Status  : out HAL.I2C.I2C_Status;
      Timeout : Natural := 1000)
   is
      use type RP.Timer.Time;
      Error : Boolean;
   begin
      This.Deadline := RP.Timer.Clock + RP.Timer.Milliseconds (Timeout);
      Write
         (This => This,
          Addr => UInt10 (Addr),
          Data => UInt8_Array (Data),
          Error => Error,
          Stop  => True);
      if Time_Exceeded (This) then
         Status := HAL.I2C.Err_Timeout;
      elsif Error then
         Status := HAL.I2C.Err_Error;
      else
         Status := HAL.I2C.Ok;
      end if;
   end Master_Transmit;

   overriding
   procedure Master_Receive
     (This    : in out I2C_Master_Port;
      Addr    : HAL.I2C.I2C_Address;
      Data    : out HAL.I2C.I2C_Data;
      Status  : out HAL.I2C.I2C_Status;
      Timeout : Natural := 1000)
   is
      use type RP.Timer.Time;
      Error : Boolean;
   begin
      This.Deadline := RP.Timer.Clock + RP.Timer.Milliseconds (Timeout);
      Read
         (This  => This,
          Addr  => UInt10 (Addr),
          Data  => UInt8_Array (Data),
          Error => Error,
          Stop  => True);
      if Time_Exceeded (This) then
         Status := HAL.I2C.Err_Timeout;
      elsif Error then
         Status := HAL.I2C.Err_Error;
      else
         Status := HAL.I2C.Ok;
      end if;
   end Master_Receive;

   function Mem_Addr_Data
      (Size : HAL.I2C.I2C_Memory_Address_Size;
       Addr : HAL.UInt16)
      return HAL.UInt8_Array
   is
      use HAL.I2C;
   begin
      case Size is
         when Memory_Size_8b =>
            return UInt8_Array'(1 => UInt8 (Addr));
         when Memory_Size_16b =>
            return UInt8_Array'(1 => UInt8 (Shift_Right (Addr, 8)),
                                2 => UInt8 (Addr and 16#FF#));
      end case;
   end Mem_Addr_Data;

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
      use type RP.Timer.Time;
      Error : Boolean;
   begin
      This.Deadline := RP.Timer.Clock + RP.Timer.Milliseconds (Timeout);
      Write
         (This  => This,
          Addr  => UInt10 (Addr),
          Data  => Mem_Addr_Data (Mem_Addr_Size, Mem_Addr),
          Error => Error,
          Stop  => False);
      if not Error then
         Write
            (This  => This,
             Addr  => UInt10 (Addr),
             Data  => UInt8_Array (Data),
             Error => Error,
             Stop  => True);
      end if;

      if Time_Exceeded (This) then
         Status := HAL.I2C.Err_Timeout;
         return;
      elsif Error then
         Status := HAL.I2C.Err_Error;
         return;
      else
         Status := HAL.I2C.Ok;
         return;
      end if;
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
      use type RP.Timer.Time;
      Error : Boolean;
   begin
      This.Deadline := RP.Timer.Clock + RP.Timer.Milliseconds (Timeout);
      Write
         (This  => This,
          Addr  => UInt10 (Addr),
          Data  => Mem_Addr_Data (Mem_Addr_Size, Mem_Addr),
          Error => Error,
          Stop  => False);
      if not Error then
         Read
            (This  => This,
             Addr  => UInt10 (Addr),
             Data  => UInt8_Array (Data),
             Error => Error,
             Stop  => True);
      end if;

      if Time_Exceeded (This) then
         Status := HAL.I2C.Err_Timeout;
         return;
      elsif Error then
         Status := HAL.I2C.Err_Error;
         return;
      else
         Status := HAL.I2C.Ok;
         return;
      end if;
   end Mem_Read;

end RP.I2C_Master;
