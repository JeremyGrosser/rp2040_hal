--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with HAL; use HAL;

with RP2040_SVD.I2C;    use RP2040_SVD.I2C;
with RP.Timer;
with RP.Reset;

package body RP.I2C_Master is

   No_Err : constant IC_TX_ABRT_SOURCE_Register :=
     (ABRT_7B_ADDR_NOACK   => INACTIVE,
      ABRT_10ADDR1_NOACK   => INACTIVE,
      ABRT_10ADDR2_NOACK   => INACTIVE,
      ABRT_TXDATA_NOACK    => ABRT_TXDATA_NOACK_VOID,
      ABRT_GCALL_NOACK     => ABRT_GCALL_NOACK_VOID,
      ABRT_GCALL_READ      => ABRT_GCALL_READ_VOID,
      ABRT_HS_ACKDET       => ABRT_HS_ACK_VOID,
      ABRT_SBYTE_ACKDET    => ABRT_SBYTE_ACKDET_VOID,
      ABRT_HS_NORSTRT      => ABRT_HS_NORSTRT_VOID,
      ABRT_SBYTE_NORSTRT   => ABRT_SBYTE_NORSTRT_VOID,
      ABRT_10B_RD_NORSTRT  => ABRT_10B_RD_VOID,
      ABRT_MASTER_DIS      => ABRT_MASTER_DIS_VOID,
      ARB_LOST             => ABRT_LOST_VOID,
      ABRT_SLVFLUSH_TXFIFO => ABRT_SLVFLUSH_TXFIFO_VOID,
      ABRT_SLV_ARBLOST     => ABRT_SLV_ARBLOST_VOID,
      ABRT_SLVRD_INTX      => ABRT_SLVRD_INTX_VOID,
      ABRT_USER_ABRT       => ABRT_USER_ABRT_VOID,
      Reserved_17_22       => 0,
      TX_FLUSH_CNT         => 0);
   --  Useful constant to check if any error is reported from the device

   ------------
   -- Enable --
   ------------

   procedure Configure
      (This     : in out I2C_Master_Port;
       Baudrate : Hertz)
   is
      use RP.Reset;
      P : RP2040_SVD.I2C.I2C_Peripheral renames This.Periph.all;
   begin
      RP.Clock.Enable (RP.Clock.PERI);
      case This.Num is
         when 0 => Reset_Peripheral (Reset_I2C0);
         when 1 => Reset_Peripheral (Reset_I2C1);
      end case;

      P.IC_ENABLE := (ENABLE       => DISABLED,
                      ABORT_k      => DISABLE,
                      TX_CMD_BLOCK => NOT_BLOCKED,
                      others       => <>);

      --  Configure as a fast - mode master with RepStart support, 7 - bit
      --  addresses
      P.IC_CON := (MASTER_MODE               => ENABLED,
                   SPEED                     => FAST,
                   IC_10BITADDR_SLAVE        => ADDR_7BITS,
                   IC_10BITADDR_MASTER       => ADDR_7BITS,
                   IC_RESTART_EN             => ENABLED,
                   IC_SLAVE_DISABLE          => SLAVE_DISABLED,
                   STOP_DET_IFADDRESSED      => DISABLED,
                   TX_EMPTY_CTRL             => ENABLED,
                   RX_FIFO_FULL_HLD_CTRL     => DISABLED,
                   STOP_DET_IF_MASTER_ACTIVE => False,
                   others                    => <>);

      --  FIFO watermarks to 1
      P.IC_RX_TL.RX_TL := 0;
      P.IC_TX_TL.TX_TL := 0;

      --  Always enable DMA requests signaling, harmless if DMA isn't listening
      P.IC_DMA_CR := (RDMAE => ENABLED, TDMAE => ENABLED, others => <>);

      declare
         --  This part is taken as is from the RP2040 SDK...

         Freq_In : constant Hertz := RP.Clock.Frequency (RP.Clock.SYS);
         Period  : constant UInt32 := UInt32 ((Freq_In + Baudrate / 2) / Baudrate);
         LCNT    : constant UInt32 := Period * 3 / 5;
         HCNT    : constant UInt32 := Period - LCNT;
         SDA_Tx_Hold_Count : UInt32;
      begin

         if HCNT > UInt32 (UInt16'Last) or HCNT < 8 or
            LCNT > UInt32 (UInt16'Last) or LCNT < 8
         then
            raise Clock_Speed_Error;
         end if;

         if Baudrate < 1_000_000 then
            SDA_Tx_Hold_Count := UInt32 (((Freq_In * 3) / 10_000_000) + 1);
         else
            SDA_Tx_Hold_Count := UInt32 (((Freq_In * 3) / 25_000_000) + 1);
         end if;

         if SDA_Tx_Hold_Count > LCNT - 2 then
            raise Clock_Speed_Error;
         end if;

         P.IC_FS_SCL_HCNT.IC_FS_SCL_HCNT := UInt16 (HCNT);
         P.IC_FS_SCL_LCNT.IC_FS_SCL_LCNT := UInt16 (LCNT);
         P.IC_FS_SPKLEN.IC_FS_SPKLEN :=
           UInt8 (if LCNT < 16 then 1 else LCNT / 16);
         P.IC_SDA_HOLD.IC_SDA_TX_HOLD := UInt16 (SDA_Tx_Hold_Count);
      end;

      P.IC_ENABLE.ENABLE := ENABLED;

      This.Restart_On_Next := False;
   end Configure;

   ---------------------
   -- Master_Transmit --
   ---------------------

   overriding
   procedure Master_Transmit
     (This    : in out I2C_Master_Port;
      Addr    : I2C_Address;
      Data    : I2C_Data;
      Status  : out I2C_Status;
      Timeout : Natural := 1_000)
   is
      use RP.Timer;
      Deadline : constant Time := RP.Timer.Clock + Milliseconds (Timeout);
      P        : RP2040_SVD.I2C.I2C_Peripheral renames This.Periph.all;
      Unused   : Boolean;
   begin

      Status := Ok;

      --  Set address
      P.IC_ENABLE.ENABLE := DISABLED;

      --  HAL.I2C uses addresses that include the R/W bit, we remove it before
      --  setting the address register of the RP2040.
      P.IC_TAR.IC_TAR := Addr / 2;

      P.IC_ENABLE.ENABLE := ENABLED;

      for Index in Data'Range loop

         declare
            Stop : constant IC_DATA_CMD_STOP_Field :=
              (if Index = Data'Last and then not This.No_Stop
               then ENABLE else DISABLE);

            Restart : constant IC_DATA_CMD_RESTART_Field :=
              (if Index = Data'First and then This.Restart_On_Next
               then ENABLE else DISABLE);
         begin

            P.IC_DATA_CMD := (DAT     => Data (Index),
                              CMD     => WRITE,
                              STOP    => Stop,
                              RESTART => Restart,
                              others  => <>);

            while P.IC_RAW_INTR_STAT.TX_EMPTY /= ACTIVE loop
               if Timeout > 0 and then RP.Timer.Clock >= Deadline then
                  Status := HAL.I2C.Err_Timeout;
                  exit;
               end if;
            end loop;

            if Status /= HAL.I2C.Err_Timeout then
               if P.IC_TX_ABRT_SOURCE /= No_Err then
                  if P.IC_TX_ABRT_SOURCE.ARB_LOST = ABRT_LOST_GENERATED then
                     Status := HAL.I2C.Busy;
                  else
                     Status := HAL.I2C.Err_Error;
                  end if;

                  --  Read to clear
                  Unused := P.IC_CLR_TX_ABRT.CLR_TX_ABRT;
                  exit;
               end if;

               if Status /= Ok
                 or else
                   (Index = Data'Last and then not This.No_Stop)
               then

                  --  Wait for stop bit
                  loop
                     exit when P.IC_RAW_INTR_STAT.STOP_DET = ACTIVE;
                  end loop;

                  --  Read to clear
                  Unused := P.IC_CLR_STOP_DET.CLR_STOP_DET;
               end if;

            end if;
         end;

         exit when Status /= Ok;
      end loop;

      This.Restart_On_Next := This.No_Stop;
   end Master_Transmit;

   --------------------
   -- Master_Receive --
   --------------------

   overriding
   procedure Master_Receive
     (This    : in out I2C_Master_Port;
      Addr    : I2C_Address;
      Data    : out I2C_Data;
      Status  : out I2C_Status;
      Timeout : Natural := 1_000)
   is
      use RP.Timer;
      Deadline : constant Time := RP.Timer.Clock + Milliseconds (Timeout);
      P        : RP2040_SVD.I2C.I2C_Peripheral renames This.Periph.all;
      Unused   : Boolean;
   begin

      Status := Ok;

      --  Set address
      P.IC_ENABLE.ENABLE := DISABLED;

      --  HAL.I2C uses addresses that include the R/W bit, we remove it before
      --  setting the address register of the RP2040.
      P.IC_TAR.IC_TAR := Addr / 2;

      P.IC_ENABLE.ENABLE := ENABLED;

      for Index in Data'Range loop

         declare
            Stop : constant IC_DATA_CMD_STOP_Field :=
              (if Index = Data'Last and then not This.No_Stop
               then ENABLE else DISABLE);

            Restart : constant IC_DATA_CMD_RESTART_Field :=
              (if Index = Data'First and then This.Restart_On_Next
               then ENABLE else DISABLE);
         begin

            --  Trigger read
            P.IC_DATA_CMD := (DAT     => 0,
                              CMD     => READ,
                              STOP    => Stop,
                              RESTART => Restart,
                              others  => <>);

            loop
               if P.IC_TX_ABRT_SOURCE /= No_Err then
                  if P.IC_TX_ABRT_SOURCE.ARB_LOST = ABRT_LOST_GENERATED then
                     Status := HAL.I2C.Busy;
                  else
                     Status := HAL.I2C.Err_Error;
                  end if;

                  --  Read to clear
                  Unused := P.IC_CLR_TX_ABRT.CLR_TX_ABRT;
                  exit;
               end if;

               if Timeout > 0 and then RP.Timer.Clock >= Deadline then
                  Status := HAL.I2C.Err_Timeout;
                  exit;
               end if;

               exit when P.IC_RXFLR.RXFLR /= 0;
            end loop;

            if Status /= Ok then
               exit;
            else
               Data (Index) := P.IC_DATA_CMD.DAT;
            end if;
         end;
      end loop;

      This.Restart_On_Next := This.No_Stop;
   end Master_Receive;

   ---------------
   -- Mem_Write --
   ---------------

   overriding
   procedure Mem_Write
     (This          : in out I2C_Master_Port;
      Addr          : I2C_Address;
      Mem_Addr      : HAL.UInt16;
      Mem_Addr_Size : I2C_Memory_Address_Size;
      Data          : I2C_Data;
      Status        : out I2C_Status;
      Timeout       : Natural := 1_000)
   is
   begin
      case Mem_Addr_Size is
         when Memory_Size_8b =>
            declare
               A : constant I2C_Data (1 .. 1) := (1 => UInt8 (Mem_Addr));
            begin
               This.Master_Transmit (Addr    => Addr,
                                     Data    => A & Data,
                                     Status  => Status,
                                     Timeout => Timeout);
            end;
         when Memory_Size_16b =>
            declare
               A : constant I2C_Data (1 .. 2) :=
                  (UInt8 (Shift_Right (Mem_Addr, 8)),
                   UInt8 (Mem_Addr and 16#FF#));
            begin
               This.Master_Transmit (Addr    => Addr,
                                     Data    => A & Data,
                                     Status  => Status,
                                     Timeout => Timeout);
            end;
      end case;
   end Mem_Write;

   --------------
   -- Mem_Read --
   --------------

   overriding procedure Mem_Read
     (This          : in out I2C_Master_Port;
      Addr          : I2C_Address;
      Mem_Addr      : HAL.UInt16;
      Mem_Addr_Size : I2C_Memory_Address_Size;
      Data          : out I2C_Data;
      Status        : out I2C_Status;
      Timeout       : Natural := 1_000)
   is
   begin
      This.No_Stop := True;

      case Mem_Addr_Size is
         when Memory_Size_8b =>
            This.Master_Transmit (Addr    => Addr,
                                  Data    => (0 => UInt8 (Mem_Addr)),
                                  Status  => Status,
                                  Timeout => Timeout);
         when Memory_Size_16b =>
            This.Master_Transmit (Addr    => Addr,
                                  Data    => (UInt8 (Shift_Right (Mem_Addr, 8)),
                                              UInt8 (Mem_Addr and 16#FF#)),
                                  Status  => Status,
                                  Timeout => Timeout);
      end case;

      This.No_Stop := False;
      This.Restart_On_Next := False;

      if Status /= Ok then
         return;
      end if;

      This.Master_Receive (Addr    => Addr,
                           Data    => Data,
                           Status  => Status,
                           Timeout => Timeout);
   end Mem_Read;

end RP.I2C_Master;
