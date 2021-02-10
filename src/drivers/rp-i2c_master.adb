with HAL; use HAL;

with RP2040_SVD.RESETS; use RP2040_SVD.RESETS;
with RP2040_SVD.I2C;    use RP2040_SVD.I2C;

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

   procedure Enable (This     : in out I2C_Master_Port;
                     Baudrate : Hertz)
   is
      P : RP2040_SVD.I2C.I2C_Peripheral renames This.Periph.all;
   begin
      RP.Clock.Enable (RP.Clock.PERI);

      if RESETS_Periph.RESET.i2c.Arr (This.Num) then
         RESETS_Periph.RESET.i2c.Arr (This.Num) := False;
         while not RESETS_Periph.RESET_DONE.i2c.Arr (This.Num) loop
            null;
         end loop;
      end if;

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
                   TX_EMPTY_CTRL             => DISABLED,
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

         Freq_In : constant Hertz := RP.Clock.Frequency (RP.Clock.PERI);
         Period  : constant UInt32 := UInt32 ((Freq_In + Baudrate / 2) / Baudrate);
         HCNT    : constant UInt32 := Period * 3 / 5;
         LCNT    : constant UInt32 := Period - HCNT;
      begin

         if HCNT > UInt32 (UInt16'Last) or else HCNT < 8
           or else
            LCNT > UInt32 (UInt16'Last) or else LCNT < 8
         then
            raise Clock_Speed_Error;
         end if;

         P.IC_FS_SCL_HCNT.IC_FS_SCL_HCNT := UInt16 (HCNT);
         P.IC_FS_SCL_LCNT.IC_FS_SCL_LCNT := UInt16 (LCNT);
         P.IC_FS_SPKLEN.IC_FS_SPKLEN :=
           UInt8 (if LCNT < 10 then 1 else LCNT / 16);
      end;

      P.IC_ENABLE.ENABLE := ENABLED;
   end Enable;

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
      P : RP2040_SVD.I2C.I2C_Peripheral renames This.Periph.all;
   begin

      --  Set address
      P.IC_ENABLE.ENABLE := DISABLED;
      P.IC_TAR.IC_TAR := Addr;
      P.IC_ENABLE.ENABLE := ENABLED;

      for Index in Data'Range loop

         declare
            Stop : constant IC_DATA_CMD_STOP_Field :=
              (if Index = Data'Last
                  and then
                  This.Do_Stop_Sequence
               then ENABLE else DISABLE);

            Restart : constant IC_DATA_CMD_RESTART_Field :=
              (if Index = Data'First then ENABLE else DISABLE);
         begin

            P.IC_DATA_CMD := (DAT     => Data (Index),
                              CMD     => WRITE,
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
                  exit;
               end if;

               exit when P.IC_STATUS.TFE = EMPTY;
            end loop;
         end;
      end loop;

      Status := Ok;
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
      P : RP2040_SVD.I2C.I2C_Peripheral renames This.Periph.all;
   begin

      --  Set address
      P.IC_ENABLE.ENABLE := DISABLED;
      P.IC_TAR.IC_TAR := Addr;
      P.IC_ENABLE.ENABLE := ENABLED;

      for Index in Data'Range loop

         declare
            Stop : constant IC_DATA_CMD_STOP_Field :=
              (if Index = Data'Last
                  and then
                  This.Do_Stop_Sequence
               then ENABLE else DISABLE);

            Restart : constant IC_DATA_CMD_RESTART_Field :=
              (if Index = Data'First then ENABLE else DISABLE);
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
                  exit;
               end if;

               exit when P.IC_RXFLR.RXFLR /= 0;
            end loop;

            Data (Index) := P.IC_DATA_CMD.DAT;
         end;
      end loop;

      Status := Ok;
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

      This.Do_Stop_Sequence := False;

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

      This.Do_Stop_Sequence := True;

      if Status /= Ok then
         return;
      end if;

      This.Master_Transmit (Addr    => Addr,
                            Data    => Data,
                            Status  => Status,
                            Timeout => Timeout);
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
      This.Do_Stop_Sequence := False;

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

      This.Do_Stop_Sequence := True;

      if Status /= Ok then
         return;
      end if;

      This.Master_Receive (Addr    => Addr,
                           Data    => Data,
                           Status  => Status,
                           Timeout => Timeout);
   end Mem_Read;

end RP.I2C_Master;
