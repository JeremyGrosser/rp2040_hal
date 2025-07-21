--
--  Copyright 2021-2025 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP.Clock;
with RP.Timer;
with RP.Reset;

package body RP.I2C_Master is

   procedure Set_Baudrate
      (This     : in out I2C_Master_Port;
       Baudrate : Hertz)
   is
      IC : Any_I2C_Peripheral renames This.Periph;
      Freq_In, Period, LCNT, HCNT, SDA_TX_Hold_Count : Natural;
   begin
      Freq_In := Natural (RP.Clock.Frequency (RP.Clock.SYS));
      Period := (Freq_In + Baudrate / 2) / Baudrate;
      LCNT := Period * 3 / 5;
      HCNT := Period - LCNT;
      pragma Assert (LCNT in 8 .. 65535 and HCNT in 8 .. 65535);

      if Baudrate < 1_000_000 then
         SDA_TX_Hold_Count := ((Freq_In * 3) / 10_000_000) + 1;
      else
         SDA_TX_Hold_Count := ((Freq_In * 3) / 25_000_000) + 1;
      end if;
      pragma Assert (SDA_TX_Hold_Count <= LCNT - 2);

      IC.ENABLE := 0;
      IC.CON.SPEED := 2;
      IC.FS_SCL_HCNT := UInt32 (HCNT);
      IC.FS_SCL_LCNT := UInt32 (LCNT);
      IC.FS_SPKLEN := UInt32 (if LCNT < 16 then 1 else LCNT / 16);
      IC.SDA_HOLD.SDA_TX_HOLD := UInt16 (SDA_TX_Hold_Count);
      IC.ENABLE := 1;
   end Set_Baudrate;

   procedure Configure
      (This     : in out I2C_Master_Port;
       Baudrate : Hertz)
   is
      IC : Any_I2C_Peripheral renames This.Periph;
   begin
      This.Restart_On_Next := False;
      This.No_Stop := False;

      RP.Clock.Enable (RP.Clock.PERI);

      case This.Num is
         when 0 =>
            RP.Reset.Reset_Peripheral (RP.Reset.Reset_I2C0);
         when 1 =>
            RP.Reset.Reset_Peripheral (RP.Reset.Reset_I2C1);
      end case;

      This.Periph.ENABLE := 0;

      IC.CON :=
         (MASTER_MODE               => True,
          SPEED                     => 2,
          IC_10BITADDR_SLAVE        => False,
          IC_10BITADDR_MASTER       => False,
          IC_RESTART_EN             => True,
          IC_SLAVE_DISABLE          => True,
          STOP_DET_IFADDRESSED      => False,
          TX_EMPTY_CTRL             => True,
          RX_FIFO_FULL_HLD_CTRL     => False,
          STOP_DET_IF_MASTER_ACTIVE => False);

      IC.TX_TL := 0;
      IC.RX_TL := 0;
      IC.DMA_CR :=
         (TDMAE => True,
          RDMAE => True);
      Set_Baudrate (This, Baudrate);
   end Configure;

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
      function Time_Expired
         return Boolean
      is (Timeout > 0 and then RP.Timer.Clock >= Deadline);

      Did_Abort      : Boolean := False;
      --  Abort_Reason   : UInt32;
      Read_Clear     : UInt32 with Volatile;
      IC : Any_I2C_Peripheral renames This.Periph;
   begin
      IC.ENABLE := 0;
      IC.TAR := Shift_Right (UInt32 (Addr), 1);
      IC.ENABLE := 1;

      Write_Data : for I in Data'Range loop
         IC.DATA_CMD :=
            (FIRST_DATA_BYTE  => False,
             RESTART          => I = Data'First and then This.Restart_On_Next,
             STOP             => I = Data'Last and not This.No_Stop,
             CMD              => False,
             DAT              => Data (I));

         loop
            exit when IC.RAW_INTR_STAT.TX_EMPTY or else Time_Expired;
         end loop;

         if not Time_Expired then
            --  Abort_Reason := IC.TX_ABRT_SOURCE;
            --  if Abort_Reason > 0 then
            if IC.RAW_INTR_STAT.TX_ABRT then
               Did_Abort := True;
               Read_Clear := IC.CLR_TX_ABRT;
            end if;

            if Did_Abort or else I = Data'Last then
               loop
                  exit when This.No_Stop or else IC.RAW_INTR_STAT.STOP_DET or else Time_Expired;
               end loop;
            end if;

            if not This.No_Stop and then not Time_Expired then
               Read_Clear := IC.CLR_STOP_DET;
            end if;
         end if;

         exit Write_Data when Did_Abort;
      end loop Write_Data;

      Status := HAL.I2C.Ok;

      if Time_Expired then
         Status := HAL.I2C.Err_Timeout;
      end if;

      if Did_Abort then
         Status := HAL.I2C.Err_Error;
      end if;
      --  This.Restart_On_Next := False; --  next transmit is not a repeated start
   end Master_Transmit;

   function Write_Available
      (IC : Any_I2C_Peripheral)
      return Natural
   is (16 - Natural (IC.TXFLR));

   function Read_Available
      (IC : Any_I2C_Peripheral)
      return Natural
   is (Natural (IC.RXFLR));

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
      function Time_Expired
         return Boolean
      is (Timeout > 0 and then RP.Timer.Clock >= Deadline);

      IC : Any_I2C_Peripheral renames This.Periph;
      Did_Abort : Boolean := False;
      Did_Timeout : Boolean := False;
      --  Abort_Reason : UInt32 := 0;
      Read_Clear : UInt32 with Volatile;
   begin
      IC.ENABLE := 0;
      IC.TAR := Shift_Right (UInt32 (Addr), 1);
      IC.ENABLE := 1;

      for I in Data'Range loop
         loop
            exit when Write_Available (IC) > 0;
         end loop;

         IC.DATA_CMD :=
            (FIRST_DATA_BYTE  => False,
             RESTART          => I = Data'First and then This.Restart_On_Next,
             STOP             => I = Data'Last and not This.No_Stop,
             CMD              => True,
             DAT              => 0);

         loop
            --  Abort_Reason := IC.TX_ABRT_SOURCE;
            if IC.RAW_INTR_STAT.TX_ABRT then
               Did_Abort := True;
               Read_Clear := IC.CLR_TX_ABRT;
            end if;

            if Time_Expired then
               Did_Timeout := True;
            end if;
            exit when Did_Abort or else Did_Timeout or else Read_Available (IC) > 0;
         end loop;

         exit when Did_Abort or else Did_Timeout;
         Data (I) := IC.DATA_CMD.DAT;
      end loop;

      Status := HAL.I2C.Ok;

      if Did_Timeout then
         Status := HAL.I2C.Err_Timeout;
      end if;

      if Did_Abort then
         Status := HAL.I2C.Err_Error;
      end if;
      --  This.Restart_On_Next := False;
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
      use HAL.I2C;
      Addr_Data : constant I2C_Data (1 .. 2) := (UInt8 (Shift_Right (Mem_Addr, 8)), UInt8 (Mem_Addr and 16#FF#));
   begin
      case Mem_Addr_Size is
         when Memory_Size_8b =>
            Master_Transmit (This, Addr, Addr_Data (2 .. 2) & Data, Status, Timeout);
         when Memory_Size_16b =>
            Master_Transmit (This, Addr, Addr_Data & Data, Status, Timeout);
      end case;
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
      use HAL.I2C;
   begin
      This.No_Stop := True;
      case Mem_Addr_Size is
         when Memory_Size_8b =>
            Master_Transmit (This, Addr, I2C_Data'(1 => UInt8 (Mem_Addr)), Status, Timeout);
         when Memory_Size_16b =>
            Master_Transmit (This, Addr, I2C_Data'
               (1 => UInt8 (Shift_Right (Mem_Addr, 8)),
                2 => UInt8 (Mem_Addr and 16#FF#)),
               Status, Timeout);
      end case;
      This.No_Stop := False;

      if Status /= Ok then
         return;
      end if;

      This.Restart_On_Next := True;
      Master_Receive (This, Addr, Data, Status, Timeout);
      This.Restart_On_Next := False;
   end Mem_Read;

end RP.I2C_Master;
