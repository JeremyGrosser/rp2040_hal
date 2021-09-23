with RP2040_SVD.USBCTRL_DPRAM; use RP2040_SVD.USBCTRL_DPRAM;
with RP2040_SVD.USBCTRL_REGS;  use RP2040_SVD.USBCTRL_REGS;
with RP2040_SVD;
with RP.Clock;
with RP.Reset;

package body RP.USB_Device is
   UD : USBCTRL_DPRAM_Peripheral renames USBCTRL_DPRAM_Periph;
   UR : USBCTRL_REGS_Peripheral  renames USBCTRL_REGS_Periph;

   type BUFF_CTRL_Registers is
      array (USB.EP_Id, USB.EP_Dir)
      of EP0_IN_BUFFER_CONTROL_Register
      with Size => 64 * 16;

   type BUFF_STATUS_Registers is
      array (USB.EP_Id, USB.EP_Dir)
      of Boolean
      with Component_Size => 1,
           Size           => 32;

   type EP_CTRL_Registers is
      array (USB.EP_Id range 1 .. 15, USB.EP_Dir)
      of EP1_IN_CONTROL_Register
      with Size => 64 * 15;

   SETUP_PACKET : aliased USB.Setup_Data
      with Import, Address => UD.SETUP_PACKET_LOW'Address;
   BUFF_STATUS  : aliased BUFF_STATUS_Registers
      with Import, Address => UR.BUFF_STATUS'Address;
   BUFF_CTRL    : aliased BUFF_CTRL_Registers
      with Import, Address => UD.EP0_IN_BUFFER_CONTROL'Address;
   EP_CTRL      : aliased EP_CTRL_Registers
      with Import, Address => UD.EP1_IN_CONTROL'Address;

   overriding
   procedure Initialize
      (This : in out USB_Device_Controller)
   is
      use RP.Reset;
   begin
      RP.Clock.Enable (RP.Clock.USB);
      Reset_Peripheral (Reset_USBCTRL);
   end Initialize;

   overriding
   procedure Start
      (This : in out USB_Device_Controller)
   is
   begin
      --  TODO: Errata RP2040-E5 requires some GPIO shenanigans to hold DP high
      --        to force a reset on a busy bus.
      --  pico-sdk/src/rp2_common/pico_fix/rp2040_usb_device_enumeration/rp2040_usb_device_enumeration.c

      --  Onboard PHY
      UR.USB_MUXING :=
         (TO_PHY  => True,
          SOFTCON => True,
          others  => <>);

      --  Force VBUS detect
      UR.USB_PWR :=
         (VBUS_DETECT             => True,
          VBUS_DETECT_OVERRIDE_EN => True,
          others                  => <>);

      --  Device mode
      UR.MAIN_CTRL :=
         (CONTROLLER_EN => True,
          others        => <>);

      --  Enable Endpoint 0 interrupt
      UR.SIE_CTRL :=
         (EP0_INT_1BUF => True,
          others       => <>);

      --  Most interrupts are read directly from SIE_STATUS. BUFF_STATUS is the
      --  only masked interrupt we care about.
      UR.INTE :=
         (BUFF_STATUS => True,
          others      => <>);

      --  Pullup USB_DP to indicate full speed
      UR.SIE_CTRL.PULLUP_EN := True;
   end Start;

   overriding
   function Poll
      (This : in out USB_Device_Controller)
       return USB.HAL.Device.UDC_Event
   is
      use USB.HAL.Device;
      use type USB.EP_Dir;
   begin
      if UR.SIE_STATUS.BUS_RESET then
         UR.SIE_STATUS.BUS_RESET := True;
         return (Kind => USB.HAL.Device.Reset);
      end if;

      if UR.INTS.BUFF_STATUS then
         for Num in USB.EP_Id'Range loop
            for Dir in USB.EP_Dir'Range loop
               if BUFF_STATUS (Num, Dir) then
                  BUFF_STATUS (Num, Dir) := True;
                  if Dir = USB.EP_Out then
                     Copy_Endpoint_Buffer (This, Num, Dir);
                  end if;
                  return (Kind => Transfer_Complete,
                          EP   => (Num => Num, Dir => Dir),
                          BCNT => UInt11 (BUFF_CTRL (Num, Dir).LENGTH_0));
               end if;
            end loop;
         end loop;
      end if;

      if UR.SIE_STATUS.SETUP_REC then
         UR.SIE_STATUS.SETUP_REC := True;
         This.EP_Status (0, USB.EP_In).Next_PID := True;
         This.EP_Status (0, USB.EP_Out).Next_PID := True;
         return (Kind   => Setup_Request,
                 Req    => SETUP_PACKET,
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
            This.EP_Status (Num, Dir) := (others => <>);
            BUFF_CTRL (Num, Dir) := (others => <>);
            BUFF_STATUS (Num, Dir) := True;
         end loop;
      end loop;
   end Reset;

   function Allocate_Buffer
      (This      : in out USB_Device_Controller;
       Size      : Natural;
       Alignment : Natural)
      return DPRAM_Offset
   is
      use System.Storage_Elements;
      Addr  : DPRAM_Offset := This.Next_Buffer;
      A     : constant Natural := Natural (Addr) mod Alignment;
      Extra : constant Natural := Alignment - A;
   begin
      if A /= 0 then
         Addr := Addr + Storage_Offset (Extra);
      end if;
      This.Next_Buffer := This.Next_Buffer + Storage_Offset (Extra) + Storage_Offset (Size);
      return Addr;
   end Allocate_Buffer;

   overriding
   function Request_Buffer
      (This          : in out USB_Device_Controller;
       Ep            : USB.EP_Addr;
       Len           : UInt11;
       Min_Alignment : UInt8 := 1)
       return System.Address
   is
      use System.Storage_Elements;
      Alignment : UInt32 := UInt32 (Min_Alignment);
      Offset    : DPRAM_Offset;
   begin
      --  Alignment must be a multiple of 64
      Alignment := Alignment and (not 16#3F#);
      if Alignment = 0 or Alignment < UInt32 (Min_Alignment) then
         Alignment := Alignment + 64;
      end if;

      Offset := Allocate_Buffer (This, Natural (Len), Natural (Alignment));
      EP_CTRL (Ep.Num, Ep.Dir).BUFFER_ADDRESS := UInt16 (Offset);
      return RP2040_SVD.USBCTRL_DPRAM_Base + Offset;
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
         return RP2040_SVD.USBCTRL_DPRAM_Base + DPRAM_Offset'First;
      else
         return RP2040_SVD.USBCTRL_DPRAM_Base + DPRAM_Offset (EP_CTRL (Ep.Num, Ep.Dir).BUFFER_ADDRESS);
      end if;
   end Endpoint_Buffer_Address;

   overriding
   procedure EP_Write_Packet
      (This : in out USB_Device_Controller;
       Ep   : USB.EP_Id;
       Addr : System.Address;
       Len  : UInt32)
   is
      use System.Storage_Elements;
      use System;
      Source : Storage_Array (1 .. Storage_Offset (Len))
         with Address => Addr;
      Target : Storage_Array (1 .. Storage_Offset (Len))
         with Address => Endpoint_Buffer_Address ((Num => Ep, Dir => USB.EP_In));
   begin
      BUFF_CTRL (Ep, USB.EP_In).AVAILABLE_0 := False;
      Target := Source;
      BUFF_CTRL (Ep, USB.EP_In) :=
         (LENGTH_0    => EP0_IN_BUFFER_CONTROL_LENGTH_0_Field (Len),
          PID_0       => This.EP_Status (Ep, USB.EP_In).Next_PID,
          FULL_0      => True,
          LAST_0      => False,
          STALL       => False,
          AVAILABLE_0 => True,
          others      => <>);

      This.EP_Status (Ep, USB.EP_In).Next_PID := not This.EP_Status (Ep, USB.EP_In).Next_PID;
   end EP_Write_Packet;

   overriding
   procedure EP_Setup
      (This     : in out USB_Device_Controller;
       Ep       : USB.EP_Addr;
       Typ      : USB.EP_Type;
       Max_Size : UInt16)
   is
   begin
      if Ep.Num = 0 then
         --  Endpoint 0 has no control register
         return;
      end if;

      EP_CTRL (Ep.Num, Ep.Dir).ENDPOINT_TYPE :=  EP1_IN_CONTROL_ENDPOINT_TYPE_Field'Val (USB.EP_Type'Pos (Typ));
      EP_CTRL (Ep.Num, Ep.Dir).INTERRUPT_PER_BUFF := True;
      EP_CTRL (Ep.Num, Ep.Dir).ENABLE := True;
      This.EP_Status (Ep.Num, Ep.Dir) := (others => <>);
   end EP_Setup;

   overriding
   procedure EP_Ready_For_Data
      (This     : in out USB_Device_Controller;
       Ep       : USB.EP_Id;
       Addr     : System.Address;
       Max_Len  : UInt32;
       Ready    : Boolean := True)
   is
      Dir : constant USB.EP_Dir := USB.EP_Out;
   begin
      This.EP_Status (Ep, Dir).Addr := Addr;

      if Ready then
         BUFF_CTRL (Ep, Dir).LENGTH_0 := EP0_IN_BUFFER_CONTROL_LENGTH_0_Field (Max_Len);
         BUFF_CTRL (Ep, Dir).PID_0 := This.EP_Status (Ep, Dir).Next_PID;
         BUFF_CTRL (Ep, Dir).FULL_0 := False;
         BUFF_CTRL (Ep, Dir).AVAILABLE_0 := True;
         This.EP_Status (Ep, Dir).Next_PID := not This.EP_Status (Ep, Dir).Next_PID;
      else
         BUFF_CTRL (Ep, Dir).AVAILABLE_0 := False;
      end if;
   end EP_Ready_For_Data;

   procedure Copy_Endpoint_Buffer
      (This : in out USB_Device_Controller;
       Num  : USB.EP_Id;
       Dir  : USB.EP_Dir)
   is
      use System.Storage_Elements;
      use System;
      Length         : constant Storage_Offset := Storage_Offset (BUFF_CTRL (Num, Dir).LENGTH_0);
      Source_Address : constant Address := Endpoint_Buffer_Address ((Num => Num, Dir => Dir));
      Target_Address : constant Address := This.EP_Status (Num, Dir).Addr;
   begin
      BUFF_CTRL (Num, Dir).AVAILABLE_0 := False;

      if Length = 0 or Target_Address = System.Null_Address or Source_Address = Target_Address then
         return;
      end if;

      declare
         Source : Storage_Array (1 .. Length)
            with Address => Source_Address;
         Target : Storage_Array (1 .. Length)
            with Address => Target_Address;
      begin
         Target := Source;
      end;
   end Copy_Endpoint_Buffer;

   overriding
   procedure EP_Stall
      (This     : in out USB_Device_Controller;
       Ep       : USB.EP_Addr;
       Set      : Boolean := True)
   is
      use USB;
   begin
      if Ep.Num = 0 and Set then
         case Ep.Dir is
            when USB.EP_In =>
               UR.EP_STALL_ARM.EP0_IN := Set;
            when USB.EP_Out =>
               UR.EP_STALL_ARM.EP0_OUT := Set;
         end case;
      end if;
      BUFF_CTRL (Ep.Num, Ep.Dir).STALL := Set;
   end EP_Stall;

   overriding
   procedure Set_Address
      (This : in out USB_Device_Controller;
       Addr : UInt7)
   is
   begin
      UR.ADDR_ENDP.ADDRESS := Addr;
   end Set_Address;

   overriding
   function Early_Address
      (This : USB_Device_Controller)
      return Boolean
   is (False);

end RP.USB_Device;
