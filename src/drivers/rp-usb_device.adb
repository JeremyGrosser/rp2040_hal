--
--  Copyright (C) 2021 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP2040_SVD.USBCTRL_DPRAM; use RP2040_SVD.USBCTRL_DPRAM;
with RP2040_SVD.USBCTRL_REGS;  use RP2040_SVD.USBCTRL_REGS;
with RP2040_SVD.PADS_BANK0;
with RP2040_SVD.IO_BANK0;
with RP2040_SVD;
with RP.Timer;
with RP.Clock;
with RP.Reset;

package body RP.USB_Device is
   UD : USBCTRL_DPRAM_Peripheral renames USBCTRL_DPRAM_Periph;
   UR : USBCTRL_REGS_Peripheral  renames USBCTRL_REGS_Periph;

   type BUFF_CTRL_Registers is
      array (USB.EP_Id, USB.EP_Dir)
      of EP0_IN_BUFFER_CONTROL_Register
      with Size => 64 * 16;

   type EP_CTRL_Registers is
      array (USB.EP_Id range 1 .. 15, USB.EP_Dir)
      of EP1_IN_CONTROL_Register
      with Size => 64 * 15;

   SETUP_PACKET : aliased USB.Setup_Data
      with Import, Address => UD.SETUP_PACKET_LOW'Address;
   BUFF_STATUS_U32  : aliased UInt32
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

      --  Enable interrupts for the events used in the Poll procedure
      UR.INTE :=
        (BUFF_STATUS => True,
         BUS_RESET   => True,
         SETUP_REQ   => True,
         others      => <>);

      --  Pullup USB_DP to indicate full speed
      UR.SIE_CTRL.PULLUP_EN := True;
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
      if UR.SIE_STATUS.BUS_RESET then

         --  Write 1 to clear
         UR.SIE_STATUS := (BUS_RESET => True, others => <>);

         if UR.SIE_CTRL.PULLUP_EN then
            This.Enumeration_Fix;
         end if;
         return (Kind => USB.HAL.Device.Reset);
      end if;

      if UR.INTS.BUFF_STATUS then
         declare
            Bit_Index : constant Natural :=
              Find_First_Set (BUFF_STATUS_U32);
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
                  BUFF_STATUS_U32 := Bit; -- Write 1 to clear
                  return (Kind => Transfer_Complete,
                          EP   => (Num => Num, Dir => Dir),
                          BCNT => USB.Packet_Size (BUFF_CTRL (Num, Dir).LENGTH_0));
               end;
            end if;
         end;
      end if;

      if UR.SIE_STATUS.SETUP_REC then

         --  Write 1 to clear
         UR.SIE_STATUS := (SETUP_REC => True, others => <>);

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
            BUFF_CTRL (Num, Dir) := (others => <>);
            BUFF_STATUS_U32 := 16#FF_FF_FF_FF#;
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

      BUFF_CTRL (Ep, USB.EP_In).AVAILABLE_0 := False;
      BUFF_CTRL (Ep, USB.EP_In) :=
         (LENGTH_0    => EP0_IN_BUFFER_CONTROL_LENGTH_0_Field (Len),
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

      EP_CTRL (Ep.Num, Ep.Dir).ENDPOINT_TYPE :=  EP1_IN_CONTROL_ENDPOINT_TYPE_Field'Val (USB.EP_Type'Pos (Typ));
      EP_CTRL (Ep.Num, Ep.Dir).INTERRUPT_PER_BUFF := True;
      EP_CTRL (Ep.Num, Ep.Dir).ENABLE := True;
      EP_CTRL (Ep.Num, Ep.Dir).DOUBLE_BUFFERED := False;
      EP_CTRL (Ep.Num, Ep.Dir).BUFFER_ADDRESS := UInt16 (This.EP_Status (Ep.Num, Ep.Dir).Buffer_Address);
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
         BUFF_CTRL (Ep, Dir).LENGTH_0 := EP0_IN_BUFFER_CONTROL_LENGTH_0_Field (Max_Len);
         BUFF_CTRL (Ep, Dir).PID_0 := This.EP_Status (Ep, Dir).Next_PID;
         BUFF_CTRL (Ep, Dir).FULL_0 := False;
         BUFF_CTRL (Ep, Dir).AVAILABLE_0 := True;
         This.EP_Status (Ep, Dir).Next_PID := not This.EP_Status (Ep, Dir).Next_PID;
      else
         BUFF_CTRL (Ep, Dir).AVAILABLE_0 := False;
      end if;
   end EP_Ready_For_Data;

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

   function Line_State
      (This : in out USB_Device_Controller)
      return Line_States
   is (Line_States'Val (UR.SIE_STATUS.LINE_STATE));

   procedure Enumeration_Fix
      (This : in out USB_Device_Controller)
   is
      use RP2040_SVD.IO_BANK0;
      use RP2040_SVD.PADS_BANK0;
      DP_CTRL : GPIO15_CTRL_Register renames IO_BANK0_Periph.GPIO15_CTRL;
      DP_PAD  : GPIO_Register renames PADS_BANK0_Periph.GPIO15;

      --  Save DP state
      DP_CTRL_Save : constant GPIO15_CTRL_Register := DP_CTRL;
      DP_PAD_Save  : constant GPIO_Register := DP_PAD;
   begin
      while This.Line_State = SE0 loop
         null;
      end loop;

      --  Enable pull up/down
      DP_PAD.PUE := True;
      DP_PAD.PDE := True;

      --  Disconnect the pad from USB
      DP_CTRL.OEOVER := DISABLE;
      DP_CTRL.FUNCSEL := usb_muxing_digital_dp;

      --  Pretend DP is high
      DP_CTRL.INOVER := HIGH;
      UR.USBPHY_DIRECT.DP_PULLUP_EN := True;
      UR.USBPHY_DIRECT_OVERRIDE.DP_PULLUP_EN_OVERRIDE_EN := True;
      UR.USB_MUXING :=
         (TO_DIGITAL_PAD => True,
          SOFTCON        => True,
          others         => <>);

      --  J state is now forced, hold for 1ms
      declare
         use RP.Timer;
      begin
         --  Use a busy wait in case this procedure is called in an interrupt
         --  handler.
         Busy_Wait_Until (RP.Timer.Clock + Milliseconds (1));
      end;

      --  Put everything back the way we found it
      UR.USB_MUXING :=
         (TO_PHY  => True,
          SOFTCON => True,
          others  => <>);
      UR.USBPHY_DIRECT_OVERRIDE.DP_PULLUP_EN_OVERRIDE_EN := False;
      DP_CTRL := DP_CTRL_Save;
      DP_PAD := DP_PAD_Save;
   end Enumeration_Fix;

end RP.USB_Device;
