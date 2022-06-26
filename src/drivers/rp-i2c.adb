with Ada.Unchecked_Conversion;
with RP.Reset;
with RP.Clock;

package body RP.I2C is
   use RP2040_SVD.I2C;

   --  These constants would usually come from IC_COMP_PARAM_1, but it's not
   --  implemented on this chip, so we just hardcode what the datasheet says.
   TX_BUFFER_DEPTH : constant := 16;
   RX_BUFFER_DEPTH : constant := 16;

   procedure Configure
      (This   : in out I2C_Port;
       Config : I2C_Config)
   is
      use RP.Reset;
      P : RP2040_SVD.I2C.I2C_Peripheral renames This.Periph.all;
   begin
      case This.Num is
         when 0 => Reset_Peripheral (Reset_I2C0);
         when 1 => Reset_Peripheral (Reset_I2C1);
      end case;
      This.Role := Config.Role;

      This.Disable;

      P.IC_CON :=
         (MASTER_MODE            => (if Config.Role = Controller then ENABLED else DISABLED),
          IC_SLAVE_DISABLE       => (if Config.Role = Controller then SLAVE_DISABLED else SLAVE_ENABLED),
          IC_RESTART_EN          => ENABLED,
          RX_FIFO_FULL_HLD_CTRL  => ENABLED,
          STOP_DET_IFADDRESSED   => DISABLED,
          TX_EMPTY_CTRL          => DISABLED,
          others                 => <>);
      This.Set_Timing (Config.Timing);

      P.IC_RX_TL.RX_TL := RX_BUFFER_DEPTH;
      P.IC_TX_TL.TX_TL := TX_BUFFER_DEPTH;

      This.Repeated_Start := False;
   end Configure;

   procedure Set_Timing
      (This : in out I2C_Port;
       T    : I2C_Timing)
   is
      use HAL;
      P : RP2040_SVD.I2C.I2C_Peripheral renames This.Periph.all;
      Cycle : constant Nanoseconds := Nanoseconds (1.0e9 * (1.0 / Float (RP.Clock.Frequency (RP.Clock.SYS))));
   begin
      if (T.High + T.Low) <= 1_000 then
         P.IC_CON.SPEED := RP2040_SVD.I2C.HIGH;
      elsif (T.High + T.Low) <= 2_500 then
         P.IC_CON.SPEED := RP2040_SVD.I2C.FAST;
      else
         P.IC_CON.SPEED := RP2040_SVD.I2C.STANDARD;
      end if;

      if (T.High + T.Low) <= 2_500 then
         P.IC_FS_SPKLEN.IC_FS_SPKLEN := UInt8 (T.Spike / Cycle);
         P.IC_FS_SCL_HCNT.IC_FS_SCL_HCNT := UInt16 ((T.High - (T.Rise / 7) * 4) / Cycle);
         P.IC_FS_SCL_LCNT.IC_FS_SCL_LCNT := UInt16 ((T.Low - (T.Fall / 7) * 4) / Cycle);
      else
         P.IC_SS_SCL_HCNT.IC_SS_SCL_HCNT := UInt16 ((T.High - (T.Rise / 7) * 4) / Cycle);
         P.IC_SS_SCL_LCNT.IC_SS_SCL_LCNT := UInt16 ((T.Low - (T.Fall / 7) * 4) / Cycle);
      end if;

      if T.Hold / Cycle <= Nanoseconds (UInt16'Last) then
         P.IC_SDA_HOLD.IC_SDA_TX_HOLD := UInt16 (T.Hold / Cycle);
      else
         P.IC_SDA_HOLD.IC_SDA_TX_HOLD := UInt16'Last;
      end if;
   end Set_Timing;

   function Status
      (This : I2C_Port)
      return I2C_State
   is
      use HAL;
      Code : UInt32
         with Import, Address => This.Periph.all.IC_TX_ABRT_SOURCE'Address;
      Source : I2C_Abort_Source
         with Import, Address => Code'Address;
   begin
      return
         (Abort_Source     => Source,
          Last_Command     => This.Last_Command,
          Repeated_Start   => This.Repeated_Start,
          RX_Remaining     => This.RX_Remaining,
          TX_Remaining     => This.TX_Remaining,
          TX_Empty         => This.Periph.IC_STATUS.TFE = EMPTY,
          RX_Empty         => This.Periph.IC_STATUS.RFNE = EMPTY,
          Is_Error         => Code /= 0);
   end Status;

   procedure Clear_Error
      (This : in out I2C_Port)
   is
      Clear : IC_CLR_TX_ABRT_Register
         with Volatile, Unreferenced;
   begin
      --  Read to clear.
      Clear := This.Periph.all.IC_CLR_TX_ABRT;
      This.Repeated_Start := False;
   end Clear_Error;

   procedure Set_Address
      (This : in out I2C_Port;
       Addr : HAL.I2C.I2C_Address;
       Size : I2C_Address_Size := Addr_7b)
   is
      P : RP2040_SVD.I2C.I2C_Peripheral renames This.Periph.all;
   begin
      This.Disable;
      case This.Role is
         when Controller =>
            P.IC_CON.IC_10BITADDR_MASTER := (if Size = Addr_7b then ADDR_7BITS else ADDR_10BITS);
            P.IC_TAR.IC_TAR := IC_TAR_IC_TAR_Field (Addr);
         when Target =>
            P.IC_CON.IC_10BITADDR_SLAVE := (if Size = Addr_7b then ADDR_7BITS else ADDR_10BITS);
            P.IC_SAR.IC_SAR := IC_SAR_IC_SAR_Field (Addr);
      end case;
      This.Repeated_Start := False;
      This.Enable;
   end Set_Address;

   procedure Enable
      (This : in out I2C_Port)
   is
      P : RP2040_SVD.I2C.I2C_Peripheral renames This.Periph.all;
   begin
      P.IC_ENABLE :=
         (ENABLE => ENABLED,
          others => <>);
      P.IC_DMA_CR :=
         (RDMAE  => ENABLED,
          TDMAE  => ENABLED,
          others => <>);

      while P.IC_ENABLE_STATUS.IC_EN /= ENABLED loop
         null;
      end loop;
   end Enable;

   procedure Disable
      (This : in out I2C_Port)
   is
      P : RP2040_SVD.I2C.I2C_Peripheral renames This.Periph.all;
   begin
      P.IC_DMA_CR :=
         (RDMAE  => DISABLED,
          TDMAE  => DISABLED,
          others => <>);
      P.IC_ENABLE :=
         (ENABLE  => DISABLED,
          ABORT_k => (if This.Role = Controller and then This.Last_Command.STOP /= ENABLE then ENABLED else DISABLE),
          others  => <>);

      while P.IC_ENABLE_STATUS.IC_EN /= DISABLED loop
         null;
      end loop;

      This.Clear_Error;
   end Disable;

   function Enabled
      (This : I2C_Port)
      return Boolean
   is (This.Periph.IC_ENABLE_STATUS.IC_EN = ENABLED);

   procedure Start_Read
      (This   : in out I2C_Port;
       Length : Positive := 1;
       Stop   : Boolean := True)
   is
      P : RP2040_SVD.I2C.I2C_Peripheral renames This.Periph.all;
      Cmd : IC_DATA_CMD_Register;
   begin
      This.RX_Remaining := Natural (Length);

      if not This.Enabled then
         This.Enable;
      end if;

      if This.Role = Controller then
         Cmd :=
            (RESTART => (if This.Repeated_Start then ENABLE else DISABLE),
             STOP    => (if Stop and Length = 1 then ENABLE else DISABLE),
             CMD     => READ,
             others  => <>);
         P.IC_DATA_CMD := Cmd;
         This.Last_Command := Cmd;
         This.Repeated_Start := not Stop;
      end if;
   end Start_Read;

   function Read_Ready
      (This : I2C_Port)
      return Boolean
   is (This.Periph.IC_STATUS.RFNE = NOT_EMPTY);

   procedure Read
      (This     : in out I2C_Port;
       Data     : out HAL.UInt8;
       Status   : out HAL.I2C.I2C_Status;
       Deadline : RP.Timer.Time := RP.Timer.Time'Last)
   is
      use RP.Timer;
      P : RP2040_SVD.I2C.I2C_Peripheral renames This.Periph.all;
      Cmd : IC_DATA_CMD_Register;
   begin
      while not This.Read_Ready loop
         if RP.Timer.Clock >= Deadline then
            Status := HAL.I2C.Err_Timeout;
            Data := 0;
            return;
         end if;
      end loop;

      Data := P.IC_DATA_CMD.DAT;

      if This.Status.Is_Error then
         Status := HAL.I2C.Err_Error;
         return;
      end if;

      This.RX_Remaining := This.RX_Remaining - 1;

      if This.Role = Controller and This.RX_Remaining > 0 then
         Cmd :=
            (RESTART => (if This.Repeated_Start and P.IC_DATA_CMD.FIRST_DATA_BYTE = ACTIVE then ENABLE else DISABLE),
             STOP    => (if not This.Repeated_Start and This.RX_Remaining = 1 then ENABLE else DISABLE),
             CMD     => READ,
             others  => <>);
         P.IC_DATA_CMD := Cmd;
         This.Last_Command := Cmd;
      end if;

      Status := HAL.I2C.Ok;
   end Read;

   procedure Start_Write
      (This     : in out I2C_Port;
       Length   : Positive := 1;
       Stop     : Boolean := True;
       Deadline : RP.Timer.Time := RP.Timer.Time'Last)
   is
      use type RP.Timer.Time;
   begin
      This.TX_Remaining := Natural (Length);

      if not This.Enabled then
         This.Enable;
      end if;

      if This.Role = Target then
         --  Wait for the controller to send our address
         while This.Periph.IC_RAW_INTR_STAT.RD_REQ = INACTIVE loop
            if RP.Timer.Clock >= Deadline then
               return;
            end if;
         end loop;
      else
         This.Repeated_Start := not Stop;
      end if;
   end Start_Write;

   function Write_Ready
      (This : I2C_Port)
      return Boolean
   is (This.Periph.IC_STATUS.TFNF = NOT_FULL);

   procedure Write
      (This    : in out I2C_Port;
       Data    : HAL.UInt8;
       Status  : out HAL.I2C.I2C_Status;
       Deadline : RP.Timer.Time := RP.Timer.Time'Last)
   is
      use RP.Timer;
      P : RP2040_SVD.I2C.I2C_Peripheral renames This.Periph.all;
      Clear : Boolean
         with Volatile, Unreferenced;
   begin
      while not This.Write_Ready loop
         if RP.Timer.Clock >= Deadline then
            Status := HAL.I2C.Err_Timeout;
            This.Abort_Write;
            return;
         end if;
      end loop;

      P.IC_DATA_CMD :=
         (RESTART => (if This.Repeated_Start and P.IC_DATA_CMD.FIRST_DATA_BYTE = ACTIVE then ENABLE else DISABLE),
          STOP    => (if not This.Repeated_Start and This.TX_Remaining = 1 then ENABLE else DISABLE),
          CMD     => WRITE,
          DAT     => Data,
          others  => <>);

      if This.Status.Is_Error then
         Status := HAL.I2C.Err_Error;
         return;
      end if;

      Clear := This.Periph.IC_CLR_RD_REQ.CLR_RD_REQ;
      This.TX_Remaining := This.TX_Remaining - 1;
      Status := HAL.I2C.Ok;
   end Write;

   procedure Abort_Write
      (This : in out I2C_Port)
   is
      P : RP2040_SVD.I2C.I2C_Peripheral renames This.Periph.all;
   begin
      P.IC_DMA_CR.TDMAE := DISABLED;
      P.IC_ENABLE.ABORT_k := ENABLED;
      while P.IC_RAW_INTR_STAT.TX_ABRT = INACTIVE loop
         null;
      end loop;
   end Abort_Write;

end RP.I2C;
