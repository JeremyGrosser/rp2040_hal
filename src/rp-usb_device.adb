--
--  Copyright (C) 2021 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP.Device_Parameters;
with RP.Clock;
with RP.Reset;

package body RP.USB_Device is
   type EP_CTRL_Register is record
      ENABLE                     : Boolean := False;
      DOUBLE_BUFFERED            : Boolean := False;
      INTERRUPT_PER_BUFF         : Boolean := False;
      INTERRUPT_PER_DOUBLE_BUFF  : Boolean := False;
      ENDPOINT_TYPE              : USB.EP_Type := USB.Control;
      INTERRUPT_ON_STALL         : Boolean := False;
      INTERRUPT_ON_NAK           : Boolean := False;
      BUFFER_ADDRESS             : UInt16 := 0;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Async_Writers,
           Object_Size => 32;
   for EP_CTRL_Register use record
      ENABLE                     at 0 range 31 .. 31;
      DOUBLE_BUFFERED            at 0 range 30 .. 30;
      INTERRUPT_PER_BUFF         at 0 range 29 .. 29;
      INTERRUPT_PER_DOUBLE_BUFF  at 0 range 28 .. 28;
      ENDPOINT_TYPE              at 0 range 26 .. 27;
      INTERRUPT_ON_STALL         at 0 range 17 .. 17;
      INTERRUPT_ON_NAK           at 0 range 16 .. 16;
      BUFFER_ADDRESS             at 0 range 0 .. 15;
   end record;

   type EP_CTRL_Array is array (USB.EP_Id range 1 .. 15, USB.EP_Dir) of EP_CTRL_Register
      with Volatile, Component_Size => 32;

   type BUFF_CTRL_Register is record
      FULL_1      : Boolean := False;
      LAST_1      : Boolean := False;
      PID_1       : Boolean := False;
      DOUBLE_BUFFER_ISO_OFFSET : UInt2 := 0;
      AVAILABLE_1 : Boolean := False;
      LENGTH_1    : UInt10 := 0;
      FULL_0      : Boolean := False;
      LAST_0      : Boolean := False;
      PID_0       : Boolean := False;
      RESET       : Boolean := False;
      STALL       : Boolean := False;
      AVAILABLE_0 : Boolean := False;
      LENGTH_0    : UInt10 := 0;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Async_Writers,
           Object_Size => 32;
   for BUFF_CTRL_Register use record
      FULL_1      at 0 range 31 .. 31;
      LAST_1      at 0 range 30 .. 30;
      PID_1       at 0 range 29 .. 29;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      AVAILABLE_1 at 0 range 26 .. 26;
      LENGTH_1    at 0 range 16 .. 25;
      FULL_0      at 0 range 15 .. 15;
      LAST_0      at 0 range 14 .. 14;
      PID_0       at 0 range 13 .. 13;
      RESET       at 0 range 12 .. 12;
      STALL       at 0 range 11 .. 11;
      AVAILABLE_0 at 0 range 10 .. 10;
      LENGTH_0    at 0 range 0 .. 9;
   end record;

   type BUFF_CTRL_Array is array (USB.EP_Id, USB.EP_Dir) of BUFF_CTRL_Register
      with Volatile, Component_Size => 32;

   type DPRAM_Peripheral is record
      SETUP_PACKET   : USB.Setup_Data;
      EP_CTRL        : EP_CTRL_Array;
      BUFF_CTRL      : BUFF_CTRL_Array;
   end record
      with Volatile;
   for DPRAM_Peripheral use record
      SETUP_PACKET   at 16#00# range 0 .. 63;
      EP_CTRL        at 16#08# range 0 .. 959;
      BUFF_CTRL      at 16#80# range 0 .. 1023;
   end record;

   type ADDR_ENDP_Register is record
      ENDPOINT       : USB.EP_Id := 0;
      ADDRESS        : UInt7 := 0;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Object_Size => 32;
   for ADDR_ENDP_Register use record
      ENDPOINT       at 0 range 16 .. 19;
      ADDRESS        at 0 range 0 .. 6;
   end record;

   type ADDR_ENDP_Array is array (USB.EP_Id) of ADDR_ENDP_Register
      with Volatile, Component_Size => 32;

   type MAIN_CTRL_Register is record
      SIM_TIMING     : Boolean := False;
      PHY_ISO        : Boolean := True;
      HOST_NDEVICE   : Boolean := False;
      CONTROLLER_EN  : Boolean := False;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Object_Size => 32;
   for MAIN_CTRL_Register use record
      SIM_TIMING     at 0 range 31 .. 31;
      PHY_ISO        at 0 range 2 .. 2;
      HOST_NDEVICE   at 0 range 1 .. 1;
      CONTROLLER_EN  at 0 range 0 .. 0;
   end record;

   type SIE_CTRL_Register is record
      EP0_INT_STALL  : Boolean := False;
      EP0_DOUBLE_BUF : Boolean := False;
      EP0_INT_1BUF   : Boolean := False;
      EP0_INT_2BUF   : Boolean := False;
      EP0_INT_NAK    : Boolean := False;
      DIRECT_EN      : Boolean := False;
      DIRECT_DP      : Boolean := False;
      DIRECT_DM      : Boolean := False;
      EP0_STOP_ON_SHORT_PACKET   : Boolean := False;
      TRANSCEIVER_PD : Boolean := False;
      RPU_OPT        : Boolean := False;
      PULLUP_EN      : Boolean := False;
      PULLDOWN_EN    : Boolean := False;
      RESET_BUS      : Boolean := False;
      RESUME         : Boolean := False;
      VBUS_EN        : Boolean := False;
      KEEP_ALIVE_EN  : Boolean := False;
      SOF_EN         : Boolean := False;
      SOF_SYNC       : Boolean := False;
      PREAMBLE_EN    : Boolean := False;
      STOP_TRANS     : Boolean := False;
      RECEIVE_DATA   : Boolean := False;
      SEND_DATA      : Boolean := False;
      SEND_SETUP     : Boolean := False;
      START_TRANS    : Boolean := False;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Async_Writers,
           Object_Size => 32;
   for SIE_CTRL_Register use record
      EP0_INT_STALL  at 0 range 31 .. 31;
      EP0_DOUBLE_BUF at 0 range 30 .. 30;
      EP0_INT_1BUF   at 0 range 29 .. 29;
      EP0_INT_2BUF   at 0 range 28 .. 28;
      EP0_INT_NAK    at 0 range 27 .. 27;
      DIRECT_EN      at 0 range 26 .. 26;
      DIRECT_DP      at 0 range 25 .. 25;
      DIRECT_DM      at 0 range 24 .. 24;
      EP0_STOP_ON_SHORT_PACKET   at 0 range 19 .. 19;
      TRANSCEIVER_PD at 0 range 18 .. 18;
      RPU_OPT        at 0 range 17 .. 17;
      PULLUP_EN      at 0 range 16 .. 16;
      PULLDOWN_EN    at 0 range 15 .. 15;
      RESET_BUS      at 0 range 13 .. 13;
      RESUME         at 0 range 12 .. 12;
      VBUS_EN        at 0 range 11 .. 11;
      KEEP_ALIVE_EN  at 0 range 10 .. 10;
      SOF_EN         at 0 range 9 .. 9;
      SOF_SYNC       at 0 range 8 .. 8;
      PREAMBLE_EN    at 0 range 6 .. 6;
      STOP_TRANS     at 0 range 4 .. 4;
      RECEIVE_DATA   at 0 range 3 .. 3;
      SEND_DATA      at 0 range 2 .. 2;
      SEND_SETUP     at 0 range 1 .. 1;
      START_TRANS    at 0 range 0 .. 0;
   end record;

   type SIE_STATUS_Register is record
      DATA_SEQ_ERROR    : Boolean := False;
      ACK_REC           : Boolean := False;
      STALL_REC         : Boolean := False;
      NAK_REC           : Boolean := False;
      RX_TIMEOUT        : Boolean := False;
      RX_OVERFLOW       : Boolean := False;
      BIT_STUFF_ERROR   : Boolean := False;
      CRC_ERROR         : Boolean := False;
      ENDPOINT_ERROR    : Boolean := False;
      BUS_RESET         : Boolean := False;
      TRANS_COMPLETE    : Boolean := False;
      SETUP_REC         : Boolean := False;
      CONNECTED         : Boolean := False;
      RX_SHORT_PACKET   : Boolean := False;
      RESUME            : Boolean := False;
      VBUS_OVER_CURR    : Boolean := False;
      SPEED             : UInt2 := 0;
      SUSPENDED         : Boolean := False;
      LINE_STATE        : UInt2 := 0;
      VBUS_DETECTED     : Boolean := False;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Async_Writers,
           Object_Size => 32;
   for SIE_STATUS_Register use record
      DATA_SEQ_ERROR    at 0 range 31 .. 31;
      ACK_REC           at 0 range 30 .. 30;
      STALL_REC         at 0 range 29 .. 29;
      NAK_REC           at 0 range 28 .. 28;
      RX_TIMEOUT        at 0 range 27 .. 27;
      RX_OVERFLOW       at 0 range 26 .. 26;
      BIT_STUFF_ERROR   at 0 range 25 .. 25;
      CRC_ERROR         at 0 range 24 .. 24;
      ENDPOINT_ERROR    at 0 range 23 .. 23;
      BUS_RESET         at 0 range 19 .. 19;
      TRANS_COMPLETE    at 0 range 18 .. 18;
      SETUP_REC         at 0 range 17 .. 17;
      CONNECTED         at 0 range 16 .. 16;
      RX_SHORT_PACKET   at 0 range 12 .. 12;
      RESUME            at 0 range 11 .. 11;
      VBUS_OVER_CURR    at 0 range 10 .. 10;
      SPEED             at 0 range 8 .. 9;
      SUSPENDED         at 0 range 4 .. 4;
      LINE_STATE        at 0 range 2 .. 3;
      VBUS_DETECTED     at 0 range 0 .. 0;
   end record;

   type EP_STALL_ARM_Register is record
      EP0_OUT  : Boolean := False;
      EP0_IN   : Boolean := False;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Async_Writers,
           Object_Size => 32;
   for EP_STALL_ARM_Register use record
      EP0_OUT  at 0 range 1 .. 1;
      EP0_IN   at 0 range 0 .. 0;
   end record;

   type USB_MUXING_Register is record
      SOFTCON        : Boolean := False;
      TO_DIGITAL_PAD : Boolean := False;
      TO_EXTPHY      : Boolean := False;
      TO_PHY         : Boolean := False;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Object_Size => 32;
   for USB_MUXING_Register use record
      SOFTCON        at 0 range 3 .. 3;
      TO_DIGITAL_PAD at 0 range 2 .. 2;
      TO_EXTPHY      at 0 range 1 .. 1;
      TO_PHY         at 0 range 0 .. 0;
   end record;

   type USB_PWR_Register is record
      OVERCURR_DETECT_EN      : Boolean := False;
      OVERCURR_DETECT         : Boolean := False;
      VBUS_DETECT_OVERRIDE_EN : Boolean := False;
      VBUS_DETECT             : Boolean := False;
      VBUS_EN_OVERRIDE_EN     : Boolean := False;
      VBUS_EN                 : Boolean := False;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Object_Size => 32;
   for USB_PWR_Register use record
      OVERCURR_DETECT_EN      at 0 range 5 .. 5;
      OVERCURR_DETECT         at 0 range 4 .. 4;
      VBUS_DETECT_OVERRIDE_EN at 0 range 3 .. 3;
      VBUS_DETECT             at 0 range 2 .. 2;
      VBUS_EN_OVERRIDE_EN     at 0 range 1 .. 1;
      VBUS_EN                 at 0 range 0 .. 0;
   end record;

   type INT_Register is record
      EPX_STOPPED_ON_NAK      : Boolean := False;
      DEV_SM_WATCHDOG_FIRED   : Boolean := False;
      ENDPOINT_ERROR          : Boolean := False;
      RX_SHORT_PACKET         : Boolean := False;
      EP_STALL_NAK            : Boolean := False;
      ABORT_DONE              : Boolean := False;
      DEV_SOF                 : Boolean := False;
      SETUP_REQ               : Boolean := False;
      DEV_RESUME_FROM_HOST    : Boolean := False;
      DEV_SUSPEND             : Boolean := False;
      DEV_CONN_DIS            : Boolean := False;
      BUS_RESET               : Boolean := False;
      VBUS_DETECT             : Boolean := False;
      STALL                   : Boolean := False;
      ERROR_CRC               : Boolean := False;
      ERROR_BIT_STUFF         : Boolean := False;
      ERROR_RX_OVERFLOW       : Boolean := False;
      ERROR_RX_TIMEOUT        : Boolean := False;
      ERROR_DATA_SEQ          : Boolean := False;
      BUFF_STATUS             : Boolean := False;
      TRANS_COMPLETE          : Boolean := False;
      HOST_SOF                : Boolean := False;
      HOST_RESUME             : Boolean := False;
      HOST_CONN_DIS           : Boolean := False;
   end record
      with Volatile_Full_Access,
           Effective_Writes,
           Async_Readers,
           Async_Writers,
           Object_Size => 32;
   for INT_Register use record
      EPX_STOPPED_ON_NAK      at 0 range 23 .. 23;
      DEV_SM_WATCHDOG_FIRED   at 0 range 22 .. 22;
      ENDPOINT_ERROR          at 0 range 21 .. 21;
      RX_SHORT_PACKET         at 0 range 20 .. 20;
      EP_STALL_NAK            at 0 range 19 .. 19;
      ABORT_DONE              at 0 range 18 .. 18;
      DEV_SOF                 at 0 range 17 .. 17;
      SETUP_REQ               at 0 range 16 .. 16;
      DEV_RESUME_FROM_HOST    at 0 range 15 .. 15;
      DEV_SUSPEND             at 0 range 14 .. 14;
      DEV_CONN_DIS            at 0 range 13 .. 13;
      BUS_RESET               at 0 range 12 .. 12;
      VBUS_DETECT             at 0 range 11 .. 11;
      STALL                   at 0 range 10 .. 10;
      ERROR_CRC               at 0 range 9 .. 9;
      ERROR_BIT_STUFF         at 0 range 8 .. 8;
      ERROR_RX_OVERFLOW       at 0 range 7 .. 7;
      ERROR_RX_TIMEOUT        at 0 range 6 .. 6;
      ERROR_DATA_SEQ          at 0 range 5 .. 5;
      BUFF_STATUS             at 0 range 4 .. 4;
      TRANS_COMPLETE          at 0 range 3 .. 3;
      HOST_SOF                at 0 range 2 .. 2;
      HOST_RESUME             at 0 range 1 .. 1;
      HOST_CONN_DIS           at 0 range 0 .. 0;
   end record;

   type REGS_Peripheral is record
      ADDR_ENDP      : ADDR_ENDP_Array;
      MAIN_CTRL      : MAIN_CTRL_Register;
      SIE_CTRL       : SIE_CTRL_Register;
      SIE_STATUS     : SIE_STATUS_Register;
      BUFF_STATUS    : UInt32;
      EP_STALL_ARM   : EP_STALL_ARM_Register;
      USB_MUXING     : USB_MUXING_Register;
      USB_PWR        : USB_PWR_Register;
      USBPHY_DIRECT  : UInt32;
      USBPHY_DIRECT_OVERRIDE : UInt32;
      INTR           : INT_Register;
      INTE           : INT_Register;
      INTF           : INT_Register;
      INTS           : INT_Register;
   end record
      with Volatile;
   for REGS_Peripheral use record
      ADDR_ENDP      at 16#00# range 0 .. 511;
      MAIN_CTRL      at 16#40# range 0 .. 31;
      SIE_CTRL       at 16#4C# range 0 .. 31;
      SIE_STATUS     at 16#50# range 0 .. 31;
      BUFF_STATUS    at 16#58# range 0 .. 31;
      EP_STALL_ARM   at 16#68# range 0 .. 31;
      USB_MUXING     at 16#74# range 0 .. 31;
      USB_PWR        at 16#78# range 0 .. 31;
      USBPHY_DIRECT  at 16#7C# range 0 .. 31;
      USBPHY_DIRECT_OVERRIDE at 16#80# range 0 .. 31;
      INTR           at 16#8C# range 0 .. 31;
      INTE           at 16#90# range 0 .. 31;
      INTF           at 16#94# range 0 .. 31;
      INTS           at 16#98# range 0 .. 31;
   end record;

   DPRAM_Base  : constant := 16#5010_0000#;
   REGS_Base   : constant := 16#5011_0000#;
   DPRAM : DPRAM_Peripheral
      with Import, Address => System'To_Address (DPRAM_Base);
   REGS : REGS_Peripheral
      with Import, Address => System'To_Address (REGS_Base);

   overriding
   procedure Initialize
      (This : in out USB_Device_Controller)
   is
      use RP.Reset;
   begin
      RP.Clock.Enable_USB;
      Reset_Peripheral (Reset_USBCTRL);
   end Initialize;

   overriding
   procedure Start
      (This : in out USB_Device_Controller)
   is
   begin
      --  Onboard PHY
      REGS.USB_MUXING :=
         (SOFTCON          => True,
          TO_DIGITAL_PAD   => False,
          TO_EXTPHY        => False,
          TO_PHY           => True);

      --  Force VBUS detect
      REGS.USB_PWR :=
         (OVERCURR_DETECT_EN        => False,
          OVERCURR_DETECT           => False,
          VBUS_DETECT_OVERRIDE_EN   => True,
          VBUS_DETECT               => True,
          VBUS_EN_OVERRIDE_EN       => False,
          VBUS_EN                   => False);

      --  Device mode
      REGS.MAIN_CTRL :=
         (SIM_TIMING    => False,
          PHY_ISO       => False,
          HOST_NDEVICE  => False,
          CONTROLLER_EN => True);

      --  Enable Endpoint 0 interrupt
      REGS.SIE_CTRL :=
         (EP0_INT_STALL    => False,
          EP0_DOUBLE_BUF   => False,
          EP0_INT_1BUF     => True,
          EP0_INT_2BUF     => False,
          EP0_INT_NAK      => False,
          DIRECT_EN        => False,
          DIRECT_DP        => False,
          DIRECT_DM        => False,
          EP0_STOP_ON_SHORT_PACKET => False,
          TRANSCEIVER_PD   => False,
          RPU_OPT          => False,
          PULLUP_EN        => False,
          PULLDOWN_EN      => False,
          RESET_BUS        => False,
          RESUME           => False,
          VBUS_EN          => False,
          KEEP_ALIVE_EN    => False,
          SOF_EN           => False,
          SOF_SYNC         => False,
          PREAMBLE_EN      => False,
          STOP_TRANS       => False,
          RECEIVE_DATA     => False,
          SEND_DATA        => False,
          SEND_SETUP       => False,
          START_TRANS      => False);

      --  Enable interrupts for the events used in the Poll procedure
      REGS.INTE :=
         (EPX_STOPPED_ON_NAK     => False,
          DEV_SM_WATCHDOG_FIRED  => False,
          ENDPOINT_ERROR         => False,
          RX_SHORT_PACKET        => False,
          EP_STALL_NAK           => False,
          ABORT_DONE             => False,
          DEV_SOF                => False,
          SETUP_REQ              => True,
          DEV_RESUME_FROM_HOST   => False,
          DEV_SUSPEND            => False,
          DEV_CONN_DIS           => False,
          BUS_RESET              => True,
          VBUS_DETECT            => False,
          STALL                  => False,
          ERROR_CRC              => False,
          ERROR_BIT_STUFF        => False,
          ERROR_RX_OVERFLOW      => False,
          ERROR_RX_TIMEOUT       => False,
          ERROR_DATA_SEQ         => False,
          BUFF_STATUS            => True,
          TRANS_COMPLETE         => False,
          HOST_SOF               => False,
          HOST_RESUME            => False,
          HOST_CONN_DIS          => False);

      --  Pullup USB_DP to indicate full speed
      REGS.SIE_CTRL.PULLUP_EN := True;
   end Start;

   function Find_First_Set
      (A : UInt32)
      return Natural
   is
   begin
      for I in 0 .. 31 loop
         if (Shift_Right (A, I) and 1) /= 0 then
            return I + 1;
         end if;
      end loop;
      return 0;
   end Find_First_Set;

   overriding
   function Poll
      (This : in out USB_Device_Controller)
       return USB.HAL.Device.UDC_Event
   is
      use USB.HAL.Device;
      use type USB.EP_Dir;
   begin
      if REGS.SIE_STATUS.BUS_RESET then

         --  Write 1 to clear
         REGS.SIE_STATUS := (BUS_RESET => True, others => <>);

         if RP.Device_Parameters.Has_USB_Errata_E5 and then REGS.SIE_CTRL.PULLUP_EN then
            This.Enumeration_Fix;
         end if;
         return (Kind => USB.HAL.Device.Reset);
      end if;

      if REGS.INTS.BUFF_STATUS then
         declare
            Bit_Index : constant Natural :=
              Find_First_Set (REGS.BUFF_STATUS);
         begin
            if Bit_Index /= 0 then
               declare
                  Num : constant USB.EP_Id := USB.EP_Id ((Bit_Index - 1) / 2);
                  Dir : constant USB.EP_Dir := (if (Bit_Index mod 2) = 1
                                                then USB.EP_In
                                                else USB.EP_Out);
                  Bit : constant UInt32 :=
                    Shift_Left (1, Natural (Bit_Index - 1));
               begin
                  REGS.BUFF_STATUS := Bit; -- Write 1 to clear
                  return (Kind => Transfer_Complete,
                          EP   => (Num => Num, Dir => Dir),
                          BCNT => USB.Packet_Size (DPRAM.BUFF_CTRL (Num, Dir).LENGTH_0));
               end;
            end if;
         end;
      end if;

      if REGS.SIE_STATUS.SETUP_REC then

         --  Write 1 to clear
         REGS.SIE_STATUS := (SETUP_REC => True, others => <>);

         This.EP_Status (0, USB.EP_In).Next_PID := True;
         This.EP_Status (0, USB.EP_Out).Next_PID := True;
         return (Kind   => Setup_Request,
                 Req    => DPRAM.SETUP_PACKET,
                 Req_EP => 0);
      end if;

      return No_Event;
   end Poll;

   overriding
   procedure Reset
      (This : in out USB_Device_Controller)
   is
   begin
      for Num in USB.EP_Id'Range loop
         for Dir in USB.EP_Dir'Range loop
            DPRAM.BUFF_CTRL (Num, Dir) := (others => <>);
            REGS.BUFF_STATUS := 16#FF_FF_FF_FF#;
         end loop;
      end loop;
   end Reset;

   function Allocate_Buffer
      (This      : in out USB_Device_Controller;
       Size      : Natural)
      return DPRAM_Offset
   is
      use System.Storage_Elements;
      Addr  : constant DPRAM_Offset := This.Next_Buffer;
   begin
      This.Next_Buffer := This.Next_Buffer + Storage_Offset (Size);
      return Addr;
   end Allocate_Buffer;

   overriding
   function Request_Buffer
      (This          : in out USB_Device_Controller;
       Ep            : USB.EP_Addr;
       Len           : USB.Packet_Size)
       return System.Address
   is
      use System.Storage_Elements;
      Size   : UInt32 := UInt32 (Len);
      Offset : DPRAM_Offset;
   begin
      --  Size must be a multiple of 64
      Size := ((Size + 64 + 1) / 64) * 64;

      if Ep.Num = 0 then
         --  EP0 IN and OUT use the same buffer
         Offset := DPRAM_Offset'First;
      else
         Offset := Allocate_Buffer (This, Natural (Size));
      end if;

      This.EP_Status (Ep.Num, Ep.Dir).Buffer_Address := Offset;
      This.EP_Status (Ep.Num, Ep.Dir).Max_Len := Len;
      return DPRAM'Address + Offset;
   end Request_Buffer;

   overriding
   function Valid_EP_Id
      (This : in out USB_Device_Controller;
       EP   : USB.EP_Id)
       return Boolean
   is (True);
   --  EP_Id is UInt4 and we have 0 .. 15 endpoints
   --  therefore, all values of EP_Id are valid.

   function Endpoint_Buffer_Address
      (Ep : USB.EP_Addr)
      return System.Address
   is
      use System.Storage_Elements;
   begin
      if Ep.Num = 0 then
         return DPRAM'Address + DPRAM_Offset'First;
      else
         return DPRAM'Address + DPRAM_Offset (DPRAM.EP_CTRL (Ep.Num, Ep.Dir).BUFFER_ADDRESS);
      end if;
   end Endpoint_Buffer_Address;

   overriding
   procedure EP_Send_Packet
      (This : in out USB_Device_Controller;
       Ep   : USB.EP_Id;
       Len  : USB.Packet_Size)
   is
      use USB;
   begin
      if Len > This.EP_Status (Ep, USB.EP_In).Max_Len then
         raise Program_Error;
      end if;

      DPRAM.BUFF_CTRL (Ep, USB.EP_In).AVAILABLE_0 := False;
      DPRAM.BUFF_CTRL (Ep, USB.EP_In) :=
         (LENGTH_0    => UInt10 (Len),
          PID_0       => This.EP_Status (Ep, USB.EP_In).Next_PID,
          FULL_0      => True,
          LAST_0      => False,
          STALL       => False,
          AVAILABLE_0 => True,
          others      => <>);

      This.EP_Status (Ep, USB.EP_In).Next_PID := not This.EP_Status (Ep, USB.EP_In).Next_PID;
   end EP_Send_Packet;

   overriding
   procedure EP_Setup
      (This     : in out USB_Device_Controller;
       Ep       : USB.EP_Addr;
       Typ      : USB.EP_Type)
   is
   begin
      if Ep.Num = 0 then
         --  Endpoint 0 has no control register
         return;
      end if;

      DPRAM.EP_CTRL (Ep.Num, Ep.Dir).ENDPOINT_TYPE :=  Typ;
      DPRAM.EP_CTRL (Ep.Num, Ep.Dir).INTERRUPT_PER_BUFF := True;
      DPRAM.EP_CTRL (Ep.Num, Ep.Dir).ENABLE := True;
      DPRAM.EP_CTRL (Ep.Num, Ep.Dir).DOUBLE_BUFFERED := False;
      DPRAM.EP_CTRL (Ep.Num, Ep.Dir).BUFFER_ADDRESS := UInt16 (This.EP_Status (Ep.Num, Ep.Dir).Buffer_Address);
   end EP_Setup;

   overriding
   procedure EP_Ready_For_Data
      (This     : in out USB_Device_Controller;
       Ep       : USB.EP_Id;
       Max_Len  : USB.Packet_Size;
       Ready    : Boolean := True)
   is
      Dir : constant USB.EP_Dir := USB.EP_Out;
   begin
      if Ready then
         DPRAM.BUFF_CTRL (Ep, Dir).LENGTH_0 := UInt10 (Max_Len);
         DPRAM.BUFF_CTRL (Ep, Dir).PID_0 := This.EP_Status (Ep, Dir).Next_PID;
         DPRAM.BUFF_CTRL (Ep, Dir).FULL_0 := False;
         DPRAM.BUFF_CTRL (Ep, Dir).AVAILABLE_0 := True;
         This.EP_Status (Ep, Dir).Next_PID := not This.EP_Status (Ep, Dir).Next_PID;
      else
         DPRAM.BUFF_CTRL (Ep, Dir).AVAILABLE_0 := False;
      end if;
   end EP_Ready_For_Data;

   overriding
   procedure EP_Stall
      (This     : in out USB_Device_Controller;
       Ep       : USB.EP_Addr;
       Set      : Boolean := True)
   is
   begin
      if Ep.Num = 0 and then Set then
         case Ep.Dir is
            when USB.EP_In =>
               REGS.EP_STALL_ARM.EP0_IN := Set;
            when USB.EP_Out =>
               REGS.EP_STALL_ARM.EP0_OUT := Set;
         end case;
      end if;
      DPRAM.BUFF_CTRL (Ep.Num, Ep.Dir).STALL := Set;
   end EP_Stall;

   overriding
   procedure Set_Address
      (This : in out USB_Device_Controller;
       Addr : UInt7)
   is
   begin
      REGS.ADDR_ENDP (0) :=
         (ENDPOINT   => 0,
          ADDRESS    => Addr);
   end Set_Address;

   overriding
   function Early_Address
      (This : USB_Device_Controller)
      return Boolean
   is (False);

   function Line_State
      (This : in out USB_Device_Controller)
      return Line_States
   is (Line_States'Val (REGS.SIE_STATUS.LINE_STATE));

   --  RP2040-E5: the device controller may miss a bus reset that arrives
   --  while DP is still low. Work around it by borrowing GPIO15 to force a J
   --  state into the controller for 1 ms. Only called on RP2040, the register
   --  addresses and GPIO function below do not apply to any other device.
   procedure Enumeration_Fix
      (This : in out USB_Device_Controller)
   is
      DP_CTRL : UInt32 --  IO_BANK0.GPIO15_CTRL
         with Import, Volatile, Address => System'To_Address (16#4001_407C#);
      DP_PAD  : UInt32 --  PADS_BANK0.GPIO15
         with Import, Volatile, Address => System'To_Address (16#4001_C040#);

      PAD_PUE              : constant UInt32 := Shift_Left (1, 3);
      PAD_PDE              : constant UInt32 := Shift_Left (1, 2);
      CTRL_FUNCSEL_Mask    : constant UInt32 := 16#1F#;
      CTRL_FUNCSEL_USB_DP  : constant UInt32 := 8; --  usb_muxing_digital_dp
      CTRL_OEOVER_Mask     : constant UInt32 := Shift_Left (3, 12);
      CTRL_OEOVER_Disable  : constant UInt32 := Shift_Left (2, 12);
      CTRL_INOVER_High     : constant UInt32 := Shift_Left (3, 16);

      --  Save DP state
      DP_CTRL_Save : constant UInt32 := DP_CTRL;
      DP_PAD_Save  : constant UInt32 := DP_PAD;

      DP_PULLUP_EN               : constant UInt32 := Shift_Left (1, 6);
      DP_PULLUP_EN_OVERRIDE_EN   : constant UInt32 := Shift_Left (1, 4);
   begin
      while This.Line_State = SE0 loop
         null;
      end loop;

      --  Enable pull up/down
      DP_PAD := DP_PAD_Save or PAD_PUE or PAD_PDE;

      --  Disconnect the pad from USB
      DP_CTRL := (DP_CTRL_Save and not (CTRL_OEOVER_Mask or CTRL_FUNCSEL_Mask))
                 or CTRL_OEOVER_Disable or CTRL_FUNCSEL_USB_DP;

      --  Pretend DP is high
      DP_CTRL := DP_CTRL or CTRL_INOVER_High;
      REGS.USBPHY_DIRECT := DP_PULLUP_EN;
      REGS.USBPHY_DIRECT_OVERRIDE := DP_PULLUP_EN_OVERRIDE_EN;
      REGS.USB_MUXING :=
         (TO_DIGITAL_PAD => True,
          SOFTCON        => True,
          others         => <>);

      --  J state is now forced, hold for 1ms
      delay 0.001;

      --  Put everything back the way we found it
      REGS.USB_MUXING :=
         (TO_PHY  => True,
          SOFTCON => True,
          others  => <>);
      REGS.USBPHY_DIRECT_OVERRIDE := 0;
      DP_CTRL := DP_CTRL_Save;
      DP_PAD := DP_PAD_Save;
   end Enumeration_Fix;

end RP.USB_Device;
