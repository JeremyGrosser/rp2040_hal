with RP2040_SVD.Interrupts;
with Cortex_M_SVD.NVIC;
with RP.Clock;
with RP.Reset;

package body RP.USB_Device is

   overriding
   procedure Initialize
      (This : in out USB_Device_Controller)
   is
      use RP2040_SVD.Interrupts;
      use Cortex_M_SVD.NVIC;
      use RP.Reset;
   begin
      RP.Clock.Enable (RP.Clock.USB);
      Reset_Peripheral (Reset_USBCTRL);

      --  Clear endpoint control registers
      USB_EP.EP_CONTROL := (others => (others => <>));

      --  Enable interrupts
      NVIC_Periph.NVIC_ICPR := Shift_Left (1, USBCTRL_Interrupt);
      NVIC_Periph.NVIC_ISER := NVIC_Periph.NVIC_ISER or Shift_Left (1, USBCTRL_Interrupt);

      --  Onboard PHY
      USB_Periph.USB_MUXING :=
         (TO_PHY  => True,
          SOFTCON => True,
          others  => <>);

      --  Force VBUS detect
      USB_Periph.USB_PWR :=
         (VBUS_DETECT             => True,
          VBUS_DETECT_OVERRIDE_EN => True,
          others                  => <>);

      --  Device mode
      USB_Periph.MAIN_CTRL :=
         (CONTROLLER_EN => True,
          others        => <>);

      --  Enable Endpoint 0 interrupt
      USB_Periph.SIE_CTRL :=
         (EP0_INT_1BUF => True,
          others       => <>);

      --  More interrupts
      USB_Periph.INTE :=
         (BUFF_STATUS => True,
          BUS_RESET   => True,
          SETUP_REQ   => True,
          others      => <>);

      --  Pullup USB_DP to indicate full speed
      USB_Periph.SIE_CTRL :=
         (PULLUP_EN => True,
          others    => <>);
   end Initialize;

   overriding
   procedure Start
      (This : in out USB_Device_Controller)
   is null;

   overriding
   function Poll
      (This : in out USB_Device_Controller)
       return USB.HAL.Device.UDC_Event
   is
      use USB.HAL.Device;
      Event : UDC_Event := (others => <>);
   begin
      if USB_Periph.SIE_STATUS.SETUP_REC then
         USB_Periph.SIE_STATUS.SETUP_REC := True;
         return (Kind   => Setup_Request,
                 Req    => USB_EP.SETUP,
                 Req_EP => 0);
      end if;
      return Event;
   end Poll;

   overriding
   procedure Reset
      (This : in out USB_Device_Controller)
   is null;

   overriding
   function Request_Buffer
      (This          : in out USB_Device_Controller;
       Ep            : USB.EP_Addr;
       Len           : UInt11;
       Min_Alignment : UInt8 := 1)
       return System.Address
   is
   begin
      return System.Null_Address;
   end Request_Buffer;

   overriding
   function Valid_EP_Id
      (This : in out USB_Device_Controller;
       Ep   : USB.EP_Id)
       return Boolean
   is (False);

   overriding
   procedure EP_Write_Packet
      (This : in out USB_Device_Controller;
       Ep   : USB.EP_Id;
       Addr : System.Address;
       Len  : UInt32)
   is null;

   overriding
   procedure EP_Setup
      (This     : in out USB_Device_Controller;
       Ep       : USB.EP_Addr;
       Typ      : USB.EP_Type;
       Max_Size : UInt16)
   is
   begin
      USB_EP.EP_CONTROL (Ep.Num)(Ep.Dir) :=
         (ENABLE  => True,
          EP_TYPE => Typ,
          BASE    => This.Next_Base,
          others  => <>);
      This.Next_Base := This.Next_Base + Max_Size;
      USB_EP.EP_BUFFER (Ep.Num)(Ep.Dir).LENGTH_0 := UInt9 (Max_Size);
   end EP_Setup;

   overriding
   procedure EP_Ready_For_Data
      (This     : in out USB_Device_Controller;
       Ep       : USB.EP_Id;
       Addr     : System.Address;
       Max_Len  : UInt32;
       Ready    : Boolean := True)
   is null;

   overriding
   procedure EP_Stall
      (This     : in out USB_Device_Controller;
       Ep       : USB.EP_Addr;
       Set      : Boolean := True)
   is null;

   overriding
   procedure Set_Address
      (This : in out USB_Device_Controller;
       Addr : UInt7)
   is null;

   overriding
   function Early_Address
      (This : USB_Device_Controller)
      return Boolean
   is (False);

end RP.USB_Device;
