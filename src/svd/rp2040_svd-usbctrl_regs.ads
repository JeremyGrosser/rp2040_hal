pragma Style_Checks (Off);

--  Copyright (c) 2020 Raspberry Pi (Trading) Ltd.
--
--  SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2040.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

--  USB FS/LS controller device registers
package RP2040_SVD.USBCTRL_REGS is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype ADDR_ENDP_ADDRESS_Field is HAL.UInt7;
   subtype ADDR_ENDP_ENDPOINT_Field is HAL.UInt4;

   --  Device address and endpoint control
   type ADDR_ENDP_Register is record
      --  In device mode, the address that the device should respond to. Set in
      --  response to a SET_ADDR setup packet from the host. In host mode set
      --  to the address of the device to communicate with.
      ADDRESS        : ADDR_ENDP_ADDRESS_Field := 16#0#;
      --  unspecified
      Reserved_7_15  : HAL.UInt9 := 16#0#;
      --  Device endpoint to send data to. Only valid for HOST mode.
      ENDPOINT       : ADDR_ENDP_ENDPOINT_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : HAL.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ADDR_ENDP_Register use record
      ADDRESS        at 0 range 0 .. 6;
      Reserved_7_15  at 0 range 7 .. 15;
      ENDPOINT       at 0 range 16 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   --  Interrupt endpoint 1. Only valid for HOST mode.
   type ADDR_ENDP_Register_1 is record
      --  Device address
      ADDRESS        : ADDR_ENDP_ADDRESS_Field := 16#0#;
      --  unspecified
      Reserved_7_15  : HAL.UInt9 := 16#0#;
      --  Endpoint number of the interrupt endpoint
      ENDPOINT       : ADDR_ENDP_ENDPOINT_Field := 16#0#;
      --  unspecified
      Reserved_20_24 : HAL.UInt5 := 16#0#;
      --  Direction of the interrupt endpoint. In=0, Out=1
      INTEP_DIR      : Boolean := False;
      --  Interrupt EP requires preamble (is a low speed device on a full speed
      --  hub)
      INTEP_PREAMBLE : Boolean := False;
      --  unspecified
      Reserved_27_31 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ADDR_ENDP_Register_1 use record
      ADDRESS        at 0 range 0 .. 6;
      Reserved_7_15  at 0 range 7 .. 15;
      ENDPOINT       at 0 range 16 .. 19;
      Reserved_20_24 at 0 range 20 .. 24;
      INTEP_DIR      at 0 range 25 .. 25;
      INTEP_PREAMBLE at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  Main control register
   type MAIN_CTRL_Register is record
      --  Enable controller
      CONTROLLER_EN : Boolean := False;
      --  Device mode = 0, Host mode = 1
      HOST_NDEVICE  : Boolean := False;
      --  unspecified
      Reserved_2_30 : HAL.UInt29 := 16#0#;
      --  Reduced timings for simulation
      SIM_TIMING    : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MAIN_CTRL_Register use record
      CONTROLLER_EN at 0 range 0 .. 0;
      HOST_NDEVICE  at 0 range 1 .. 1;
      Reserved_2_30 at 0 range 2 .. 30;
      SIM_TIMING    at 0 range 31 .. 31;
   end record;

   subtype SOF_WR_COUNT_Field is HAL.UInt11;

   --  Set the SOF (Start of Frame) frame number in the host controller. The
   --  SOF packet is sent every 1ms and the host will increment the frame
   --  number by 1 each time.
   type SOF_WR_Register is record
      --  Write-only.
      COUNT          : SOF_WR_COUNT_Field := 16#0#;
      --  unspecified
      Reserved_11_31 : HAL.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SOF_WR_Register use record
      COUNT          at 0 range 0 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   subtype SOF_RD_COUNT_Field is HAL.UInt11;

   --  Read the last SOF (Start of Frame) frame number seen. In device mode the
   --  last SOF received from the host. In host mode the last SOF sent by the
   --  host.
   type SOF_RD_Register is record
      --  Read-only.
      COUNT          : SOF_RD_COUNT_Field;
      --  unspecified
      Reserved_11_31 : HAL.UInt21;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SOF_RD_Register use record
      COUNT          at 0 range 0 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   --  SIE control register
   type SIE_CTRL_Register is record
      --  After a write operation all bits in the field are cleared (set to
      --  zero). Host: Start transaction
      START_TRANS    : Boolean := False;
      --  Host: Send Setup packet
      SEND_SETUP     : Boolean := False;
      --  Host: Send transaction (OUT from host)
      SEND_DATA      : Boolean := False;
      --  Host: Receive transaction (IN to host)
      RECEIVE_DATA   : Boolean := False;
      --  After a write operation all bits in the field are cleared (set to
      --  zero). Host: Stop transaction
      STOP_TRANS     : Boolean := False;
      --  unspecified
      Reserved_5_5   : HAL.Bit := 16#0#;
      --  Host: Preable enable for LS device on FS hub
      PREAMBLE_EN    : Boolean := False;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      --  Host: Delay packet(s) until after SOF
      SOF_SYNC       : Boolean := False;
      --  Host: Enable SOF generation (for full speed bus)
      SOF_EN         : Boolean := False;
      --  Host: Enable keep alive packet (for low speed bus)
      KEEP_ALIVE_EN  : Boolean := False;
      --  Host: Enable VBUS
      VBUS_EN        : Boolean := False;
      --  After a write operation all bits in the field are cleared (set to
      --  zero). Device: Remote wakeup. Device can initiate its own resume
      --  after suspend.
      RESUME         : Boolean := False;
      --  After a write operation all bits in the field are cleared (set to
      --  zero). Host: Reset bus
      RESET_BUS      : Boolean := False;
      --  unspecified
      Reserved_14_14 : HAL.Bit := 16#0#;
      --  Host: Enable pull down resistors
      PULLDOWN_EN    : Boolean := False;
      --  Device: Enable pull up resistor
      PULLUP_EN      : Boolean := False;
      --  Device: Pull-up strength (0=1K2, 1=2k3)
      RPU_OPT        : Boolean := False;
      --  Power down bus transceiver
      TRANSCEIVER_PD : Boolean := False;
      --  unspecified
      Reserved_19_23 : HAL.UInt5 := 16#0#;
      --  Direct control of DM
      DIRECT_DM      : Boolean := False;
      --  Direct control of DP
      DIRECT_DP      : Boolean := False;
      --  Direct bus drive enable
      DIRECT_EN      : Boolean := False;
      --  Device: Set bit in EP_STATUS_STALL_NAK when EP0 sends a NAK
      EP0_INT_NAK    : Boolean := False;
      --  Device: Set bit in BUFF_STATUS for every 2 buffers completed on EP0
      EP0_INT_2BUF   : Boolean := False;
      --  Device: Set bit in BUFF_STATUS for every buffer completed on EP0
      EP0_INT_1BUF   : Boolean := False;
      --  Device: EP0 single buffered = 0, double buffered = 1
      EP0_DOUBLE_BUF : Boolean := False;
      --  Device: Set bit in EP_STATUS_STALL_NAK when EP0 sends a STALL
      EP0_INT_STALL  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SIE_CTRL_Register use record
      START_TRANS    at 0 range 0 .. 0;
      SEND_SETUP     at 0 range 1 .. 1;
      SEND_DATA      at 0 range 2 .. 2;
      RECEIVE_DATA   at 0 range 3 .. 3;
      STOP_TRANS     at 0 range 4 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      PREAMBLE_EN    at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      SOF_SYNC       at 0 range 8 .. 8;
      SOF_EN         at 0 range 9 .. 9;
      KEEP_ALIVE_EN  at 0 range 10 .. 10;
      VBUS_EN        at 0 range 11 .. 11;
      RESUME         at 0 range 12 .. 12;
      RESET_BUS      at 0 range 13 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      PULLDOWN_EN    at 0 range 15 .. 15;
      PULLUP_EN      at 0 range 16 .. 16;
      RPU_OPT        at 0 range 17 .. 17;
      TRANSCEIVER_PD at 0 range 18 .. 18;
      Reserved_19_23 at 0 range 19 .. 23;
      DIRECT_DM      at 0 range 24 .. 24;
      DIRECT_DP      at 0 range 25 .. 25;
      DIRECT_EN      at 0 range 26 .. 26;
      EP0_INT_NAK    at 0 range 27 .. 27;
      EP0_INT_2BUF   at 0 range 28 .. 28;
      EP0_INT_1BUF   at 0 range 29 .. 29;
      EP0_DOUBLE_BUF at 0 range 30 .. 30;
      EP0_INT_STALL  at 0 range 31 .. 31;
   end record;

   subtype SIE_STATUS_LINE_STATE_Field is HAL.UInt2;
   subtype SIE_STATUS_SPEED_Field is HAL.UInt2;

   --  SIE status register
   type SIE_STATUS_Register is record
      --  Read-only. Device: VBUS Detected
      VBUS_DETECTED   : Boolean := False;
      --  unspecified
      Reserved_1_1    : HAL.Bit := 16#0#;
      --  Read-only. USB bus line state
      LINE_STATE      : SIE_STATUS_LINE_STATE_Field := 16#0#;
      --  Read-only. Bus in suspended state. Valid for device and host. Host
      --  and device will go into suspend if neither Keep Alive / SOF frames
      --  are enabled.
      SUSPENDED       : Boolean := False;
      --  unspecified
      Reserved_5_7    : HAL.UInt3 := 16#0#;
      --  Read-only. Host: device speed. Disconnected = 00, LS = 01, FS = 10
      SPEED           : SIE_STATUS_SPEED_Field := 16#0#;
      --  Read-only. VBUS over current detected
      VBUS_OVER_CURR  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Host: Device has initiated a remote resume. Device:
      --  host has initiated a resume.
      RESUME          : Boolean := False;
      --  unspecified
      Reserved_12_15  : HAL.UInt4 := 16#0#;
      --  Read-only. Device: connected
      CONNECTED       : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Device: Setup packet received
      SETUP_REC       : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Transaction complete.\n\n Raised by device if:\n\n * An
      --  IN or OUT packet is sent with the `LAST_BUFF` bit set in the buffer
      --  control register\n\n Raised by host if:\n\n * A setup packet is sent
      --  when no data in or data out transaction follows * An IN packet is
      --  received and the `LAST_BUFF` bit is set in the buffer control
      --  register * An IN packet is received with zero length * An OUT packet
      --  is sent and the `LAST_BUFF` bit is set
      TRANS_COMPLETE  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Device: bus reset received
      BUS_RESET       : Boolean := False;
      --  unspecified
      Reserved_20_23  : HAL.UInt4 := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. CRC Error. Raised by the Serial RX engine.
      CRC_ERROR       : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Bit Stuff Error. Raised by the Serial RX engine.
      BIT_STUFF_ERROR : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. RX overflow is raised by the Serial RX engine if the
      --  incoming data is too fast.
      RX_OVERFLOW     : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. RX timeout is raised by both the host and device if an
      --  ACK is not received in the maximum time specified by the USB spec.
      RX_TIMEOUT      : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Host: NAK received
      NAK_REC         : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Host: STALL received
      STALL_REC       : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. ACK received. Raised by both host and device.
      ACK_REC         : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Data Sequence Error.\n\n The device can raise a
      --  sequence error in the following conditions:\n\n * A SETUP packet is
      --  received followed by a DATA1 packet (data phase should always be
      --  DATA0) * An OUT packet is received from the host but doesn't match
      --  the data pid in the buffer control register read from DPSRAM\n\n The
      --  host can raise a data sequence error in the following conditions:\n\n
      --  * An IN packet from the device has the wrong data PID
      DATA_SEQ_ERROR  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SIE_STATUS_Register use record
      VBUS_DETECTED   at 0 range 0 .. 0;
      Reserved_1_1    at 0 range 1 .. 1;
      LINE_STATE      at 0 range 2 .. 3;
      SUSPENDED       at 0 range 4 .. 4;
      Reserved_5_7    at 0 range 5 .. 7;
      SPEED           at 0 range 8 .. 9;
      VBUS_OVER_CURR  at 0 range 10 .. 10;
      RESUME          at 0 range 11 .. 11;
      Reserved_12_15  at 0 range 12 .. 15;
      CONNECTED       at 0 range 16 .. 16;
      SETUP_REC       at 0 range 17 .. 17;
      TRANS_COMPLETE  at 0 range 18 .. 18;
      BUS_RESET       at 0 range 19 .. 19;
      Reserved_20_23  at 0 range 20 .. 23;
      CRC_ERROR       at 0 range 24 .. 24;
      BIT_STUFF_ERROR at 0 range 25 .. 25;
      RX_OVERFLOW     at 0 range 26 .. 26;
      RX_TIMEOUT      at 0 range 27 .. 27;
      NAK_REC         at 0 range 28 .. 28;
      STALL_REC       at 0 range 29 .. 29;
      ACK_REC         at 0 range 30 .. 30;
      DATA_SEQ_ERROR  at 0 range 31 .. 31;
   end record;

   subtype INT_EP_CTRL_INT_EP_ACTIVE_Field is HAL.UInt15;

   --  interrupt endpoint control register
   type INT_EP_CTRL_Register is record
      --  unspecified
      Reserved_0_0   : HAL.Bit := 16#0#;
      --  Host: Enable interrupt endpoint 1 -> 15
      INT_EP_ACTIVE  : INT_EP_CTRL_INT_EP_ACTIVE_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INT_EP_CTRL_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      INT_EP_ACTIVE  at 0 range 1 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Buffer status register. A bit set here indicates that a buffer has
   --  completed on the endpoint (if the buffer interrupt is enabled). It is
   --  possible for 2 buffers to be completed, so clearing the buffer status
   --  bit may instantly re set it on the next clock cycle.
   type BUFF_STATUS_Register is record
      --  Read-only.
      EP0_IN   : Boolean;
      --  Read-only.
      EP0_OUT  : Boolean;
      --  Read-only.
      EP1_IN   : Boolean;
      --  Read-only.
      EP1_OUT  : Boolean;
      --  Read-only.
      EP2_IN   : Boolean;
      --  Read-only.
      EP2_OUT  : Boolean;
      --  Read-only.
      EP3_IN   : Boolean;
      --  Read-only.
      EP3_OUT  : Boolean;
      --  Read-only.
      EP4_IN   : Boolean;
      --  Read-only.
      EP4_OUT  : Boolean;
      --  Read-only.
      EP5_IN   : Boolean;
      --  Read-only.
      EP5_OUT  : Boolean;
      --  Read-only.
      EP6_IN   : Boolean;
      --  Read-only.
      EP6_OUT  : Boolean;
      --  Read-only.
      EP7_IN   : Boolean;
      --  Read-only.
      EP7_OUT  : Boolean;
      --  Read-only.
      EP8_IN   : Boolean;
      --  Read-only.
      EP8_OUT  : Boolean;
      --  Read-only.
      EP9_IN   : Boolean;
      --  Read-only.
      EP9_OUT  : Boolean;
      --  Read-only.
      EP10_IN  : Boolean;
      --  Read-only.
      EP10_OUT : Boolean;
      --  Read-only.
      EP11_IN  : Boolean;
      --  Read-only.
      EP11_OUT : Boolean;
      --  Read-only.
      EP12_IN  : Boolean;
      --  Read-only.
      EP12_OUT : Boolean;
      --  Read-only.
      EP13_IN  : Boolean;
      --  Read-only.
      EP13_OUT : Boolean;
      --  Read-only.
      EP14_IN  : Boolean;
      --  Read-only.
      EP14_OUT : Boolean;
      --  Read-only.
      EP15_IN  : Boolean;
      --  Read-only.
      EP15_OUT : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BUFF_STATUS_Register use record
      EP0_IN   at 0 range 0 .. 0;
      EP0_OUT  at 0 range 1 .. 1;
      EP1_IN   at 0 range 2 .. 2;
      EP1_OUT  at 0 range 3 .. 3;
      EP2_IN   at 0 range 4 .. 4;
      EP2_OUT  at 0 range 5 .. 5;
      EP3_IN   at 0 range 6 .. 6;
      EP3_OUT  at 0 range 7 .. 7;
      EP4_IN   at 0 range 8 .. 8;
      EP4_OUT  at 0 range 9 .. 9;
      EP5_IN   at 0 range 10 .. 10;
      EP5_OUT  at 0 range 11 .. 11;
      EP6_IN   at 0 range 12 .. 12;
      EP6_OUT  at 0 range 13 .. 13;
      EP7_IN   at 0 range 14 .. 14;
      EP7_OUT  at 0 range 15 .. 15;
      EP8_IN   at 0 range 16 .. 16;
      EP8_OUT  at 0 range 17 .. 17;
      EP9_IN   at 0 range 18 .. 18;
      EP9_OUT  at 0 range 19 .. 19;
      EP10_IN  at 0 range 20 .. 20;
      EP10_OUT at 0 range 21 .. 21;
      EP11_IN  at 0 range 22 .. 22;
      EP11_OUT at 0 range 23 .. 23;
      EP12_IN  at 0 range 24 .. 24;
      EP12_OUT at 0 range 25 .. 25;
      EP13_IN  at 0 range 26 .. 26;
      EP13_OUT at 0 range 27 .. 27;
      EP14_IN  at 0 range 28 .. 28;
      EP14_OUT at 0 range 29 .. 29;
      EP15_IN  at 0 range 30 .. 30;
      EP15_OUT at 0 range 31 .. 31;
   end record;

   --  Which of the double buffers should be handled. Only valid if using an
   --  interrupt per buffer (i.e. not per 2 buffers). Not valid for host
   --  interrupt endpoint polling because they are only single buffered.
   type BUFF_CPU_SHOULD_HANDLE_Register is record
      --  Read-only.
      EP0_IN   : Boolean;
      --  Read-only.
      EP0_OUT  : Boolean;
      --  Read-only.
      EP1_IN   : Boolean;
      --  Read-only.
      EP1_OUT  : Boolean;
      --  Read-only.
      EP2_IN   : Boolean;
      --  Read-only.
      EP2_OUT  : Boolean;
      --  Read-only.
      EP3_IN   : Boolean;
      --  Read-only.
      EP3_OUT  : Boolean;
      --  Read-only.
      EP4_IN   : Boolean;
      --  Read-only.
      EP4_OUT  : Boolean;
      --  Read-only.
      EP5_IN   : Boolean;
      --  Read-only.
      EP5_OUT  : Boolean;
      --  Read-only.
      EP6_IN   : Boolean;
      --  Read-only.
      EP6_OUT  : Boolean;
      --  Read-only.
      EP7_IN   : Boolean;
      --  Read-only.
      EP7_OUT  : Boolean;
      --  Read-only.
      EP8_IN   : Boolean;
      --  Read-only.
      EP8_OUT  : Boolean;
      --  Read-only.
      EP9_IN   : Boolean;
      --  Read-only.
      EP9_OUT  : Boolean;
      --  Read-only.
      EP10_IN  : Boolean;
      --  Read-only.
      EP10_OUT : Boolean;
      --  Read-only.
      EP11_IN  : Boolean;
      --  Read-only.
      EP11_OUT : Boolean;
      --  Read-only.
      EP12_IN  : Boolean;
      --  Read-only.
      EP12_OUT : Boolean;
      --  Read-only.
      EP13_IN  : Boolean;
      --  Read-only.
      EP13_OUT : Boolean;
      --  Read-only.
      EP14_IN  : Boolean;
      --  Read-only.
      EP14_OUT : Boolean;
      --  Read-only.
      EP15_IN  : Boolean;
      --  Read-only.
      EP15_OUT : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BUFF_CPU_SHOULD_HANDLE_Register use record
      EP0_IN   at 0 range 0 .. 0;
      EP0_OUT  at 0 range 1 .. 1;
      EP1_IN   at 0 range 2 .. 2;
      EP1_OUT  at 0 range 3 .. 3;
      EP2_IN   at 0 range 4 .. 4;
      EP2_OUT  at 0 range 5 .. 5;
      EP3_IN   at 0 range 6 .. 6;
      EP3_OUT  at 0 range 7 .. 7;
      EP4_IN   at 0 range 8 .. 8;
      EP4_OUT  at 0 range 9 .. 9;
      EP5_IN   at 0 range 10 .. 10;
      EP5_OUT  at 0 range 11 .. 11;
      EP6_IN   at 0 range 12 .. 12;
      EP6_OUT  at 0 range 13 .. 13;
      EP7_IN   at 0 range 14 .. 14;
      EP7_OUT  at 0 range 15 .. 15;
      EP8_IN   at 0 range 16 .. 16;
      EP8_OUT  at 0 range 17 .. 17;
      EP9_IN   at 0 range 18 .. 18;
      EP9_OUT  at 0 range 19 .. 19;
      EP10_IN  at 0 range 20 .. 20;
      EP10_OUT at 0 range 21 .. 21;
      EP11_IN  at 0 range 22 .. 22;
      EP11_OUT at 0 range 23 .. 23;
      EP12_IN  at 0 range 24 .. 24;
      EP12_OUT at 0 range 25 .. 25;
      EP13_IN  at 0 range 26 .. 26;
      EP13_OUT at 0 range 27 .. 27;
      EP14_IN  at 0 range 28 .. 28;
      EP14_OUT at 0 range 29 .. 29;
      EP15_IN  at 0 range 30 .. 30;
      EP15_OUT at 0 range 31 .. 31;
   end record;

   --  Device only: Can be set to ignore the buffer control register for this
   --  endpoint in case you would like to revoke a buffer. A NAK will be sent
   --  for every access to the endpoint until this bit is cleared. A
   --  corresponding bit in `EP_ABORT_DONE` is set when it is safe to modify
   --  the buffer control register.
   type EP_ABORT_Register is record
      EP0_IN   : Boolean := False;
      EP0_OUT  : Boolean := False;
      EP1_IN   : Boolean := False;
      EP1_OUT  : Boolean := False;
      EP2_IN   : Boolean := False;
      EP2_OUT  : Boolean := False;
      EP3_IN   : Boolean := False;
      EP3_OUT  : Boolean := False;
      EP4_IN   : Boolean := False;
      EP4_OUT  : Boolean := False;
      EP5_IN   : Boolean := False;
      EP5_OUT  : Boolean := False;
      EP6_IN   : Boolean := False;
      EP6_OUT  : Boolean := False;
      EP7_IN   : Boolean := False;
      EP7_OUT  : Boolean := False;
      EP8_IN   : Boolean := False;
      EP8_OUT  : Boolean := False;
      EP9_IN   : Boolean := False;
      EP9_OUT  : Boolean := False;
      EP10_IN  : Boolean := False;
      EP10_OUT : Boolean := False;
      EP11_IN  : Boolean := False;
      EP11_OUT : Boolean := False;
      EP12_IN  : Boolean := False;
      EP12_OUT : Boolean := False;
      EP13_IN  : Boolean := False;
      EP13_OUT : Boolean := False;
      EP14_IN  : Boolean := False;
      EP14_OUT : Boolean := False;
      EP15_IN  : Boolean := False;
      EP15_OUT : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP_ABORT_Register use record
      EP0_IN   at 0 range 0 .. 0;
      EP0_OUT  at 0 range 1 .. 1;
      EP1_IN   at 0 range 2 .. 2;
      EP1_OUT  at 0 range 3 .. 3;
      EP2_IN   at 0 range 4 .. 4;
      EP2_OUT  at 0 range 5 .. 5;
      EP3_IN   at 0 range 6 .. 6;
      EP3_OUT  at 0 range 7 .. 7;
      EP4_IN   at 0 range 8 .. 8;
      EP4_OUT  at 0 range 9 .. 9;
      EP5_IN   at 0 range 10 .. 10;
      EP5_OUT  at 0 range 11 .. 11;
      EP6_IN   at 0 range 12 .. 12;
      EP6_OUT  at 0 range 13 .. 13;
      EP7_IN   at 0 range 14 .. 14;
      EP7_OUT  at 0 range 15 .. 15;
      EP8_IN   at 0 range 16 .. 16;
      EP8_OUT  at 0 range 17 .. 17;
      EP9_IN   at 0 range 18 .. 18;
      EP9_OUT  at 0 range 19 .. 19;
      EP10_IN  at 0 range 20 .. 20;
      EP10_OUT at 0 range 21 .. 21;
      EP11_IN  at 0 range 22 .. 22;
      EP11_OUT at 0 range 23 .. 23;
      EP12_IN  at 0 range 24 .. 24;
      EP12_OUT at 0 range 25 .. 25;
      EP13_IN  at 0 range 26 .. 26;
      EP13_OUT at 0 range 27 .. 27;
      EP14_IN  at 0 range 28 .. 28;
      EP14_OUT at 0 range 29 .. 29;
      EP15_IN  at 0 range 30 .. 30;
      EP15_OUT at 0 range 31 .. 31;
   end record;

   --  Device only: Used in conjunction with `EP_ABORT`. Set once an endpoint
   --  is idle so the programmer knows it is safe to modify the buffer control
   --  register.
   type EP_ABORT_DONE_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP0_IN   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP0_OUT  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP1_IN   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP1_OUT  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP2_IN   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP2_OUT  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP3_IN   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP3_OUT  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP4_IN   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP4_OUT  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP5_IN   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP5_OUT  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP6_IN   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP6_OUT  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP7_IN   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP7_OUT  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP8_IN   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP8_OUT  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP9_IN   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP9_OUT  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP10_IN  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP10_OUT : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP11_IN  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP11_OUT : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP12_IN  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP12_OUT : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP13_IN  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP13_OUT : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP14_IN  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP14_OUT : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP15_IN  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP15_OUT : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP_ABORT_DONE_Register use record
      EP0_IN   at 0 range 0 .. 0;
      EP0_OUT  at 0 range 1 .. 1;
      EP1_IN   at 0 range 2 .. 2;
      EP1_OUT  at 0 range 3 .. 3;
      EP2_IN   at 0 range 4 .. 4;
      EP2_OUT  at 0 range 5 .. 5;
      EP3_IN   at 0 range 6 .. 6;
      EP3_OUT  at 0 range 7 .. 7;
      EP4_IN   at 0 range 8 .. 8;
      EP4_OUT  at 0 range 9 .. 9;
      EP5_IN   at 0 range 10 .. 10;
      EP5_OUT  at 0 range 11 .. 11;
      EP6_IN   at 0 range 12 .. 12;
      EP6_OUT  at 0 range 13 .. 13;
      EP7_IN   at 0 range 14 .. 14;
      EP7_OUT  at 0 range 15 .. 15;
      EP8_IN   at 0 range 16 .. 16;
      EP8_OUT  at 0 range 17 .. 17;
      EP9_IN   at 0 range 18 .. 18;
      EP9_OUT  at 0 range 19 .. 19;
      EP10_IN  at 0 range 20 .. 20;
      EP10_OUT at 0 range 21 .. 21;
      EP11_IN  at 0 range 22 .. 22;
      EP11_OUT at 0 range 23 .. 23;
      EP12_IN  at 0 range 24 .. 24;
      EP12_OUT at 0 range 25 .. 25;
      EP13_IN  at 0 range 26 .. 26;
      EP13_OUT at 0 range 27 .. 27;
      EP14_IN  at 0 range 28 .. 28;
      EP14_OUT at 0 range 29 .. 29;
      EP15_IN  at 0 range 30 .. 30;
      EP15_OUT at 0 range 31 .. 31;
   end record;

   --  Device: this bit must be set in conjunction with the `STALL` bit in the
   --  buffer control register to send a STALL on EP0. The device controller
   --  clears these bits when a SETUP packet is received because the USB spec
   --  requires that a STALL condition is cleared when a SETUP packet is
   --  received.
   type EP_STALL_ARM_Register is record
      EP0_IN        : Boolean := False;
      EP0_OUT       : Boolean := False;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP_STALL_ARM_Register use record
      EP0_IN        at 0 range 0 .. 0;
      EP0_OUT       at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype NAK_POLL_DELAY_LS_Field is HAL.UInt10;
   subtype NAK_POLL_DELAY_FS_Field is HAL.UInt10;

   --  Used by the host controller. Sets the wait time in microseconds before
   --  trying again if the device replies with a NAK.
   type NAK_POLL_Register is record
      --  NAK polling interval for a low speed device
      DELAY_LS       : NAK_POLL_DELAY_LS_Field := 16#10#;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
      --  NAK polling interval for a full speed device
      DELAY_FS       : NAK_POLL_DELAY_FS_Field := 16#10#;
      --  unspecified
      Reserved_26_31 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for NAK_POLL_Register use record
      DELAY_LS       at 0 range 0 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      DELAY_FS       at 0 range 16 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   --  Device: bits are set when the `IRQ_ON_NAK` or `IRQ_ON_STALL` bits are
   --  set. For EP0 this comes from `SIE_CTRL`. For all other endpoints it
   --  comes from the endpoint control register.
   type EP_STATUS_STALL_NAK_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP0_IN   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP0_OUT  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP1_IN   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP1_OUT  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP2_IN   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP2_OUT  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP3_IN   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP3_OUT  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP4_IN   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP4_OUT  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP5_IN   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP5_OUT  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP6_IN   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP6_OUT  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP7_IN   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP7_OUT  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP8_IN   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP8_OUT  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP9_IN   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP9_OUT  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP10_IN  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP10_OUT : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP11_IN  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP11_OUT : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP12_IN  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP12_OUT : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP13_IN  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP13_OUT : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP14_IN  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP14_OUT : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP15_IN  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      EP15_OUT : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP_STATUS_STALL_NAK_Register use record
      EP0_IN   at 0 range 0 .. 0;
      EP0_OUT  at 0 range 1 .. 1;
      EP1_IN   at 0 range 2 .. 2;
      EP1_OUT  at 0 range 3 .. 3;
      EP2_IN   at 0 range 4 .. 4;
      EP2_OUT  at 0 range 5 .. 5;
      EP3_IN   at 0 range 6 .. 6;
      EP3_OUT  at 0 range 7 .. 7;
      EP4_IN   at 0 range 8 .. 8;
      EP4_OUT  at 0 range 9 .. 9;
      EP5_IN   at 0 range 10 .. 10;
      EP5_OUT  at 0 range 11 .. 11;
      EP6_IN   at 0 range 12 .. 12;
      EP6_OUT  at 0 range 13 .. 13;
      EP7_IN   at 0 range 14 .. 14;
      EP7_OUT  at 0 range 15 .. 15;
      EP8_IN   at 0 range 16 .. 16;
      EP8_OUT  at 0 range 17 .. 17;
      EP9_IN   at 0 range 18 .. 18;
      EP9_OUT  at 0 range 19 .. 19;
      EP10_IN  at 0 range 20 .. 20;
      EP10_OUT at 0 range 21 .. 21;
      EP11_IN  at 0 range 22 .. 22;
      EP11_OUT at 0 range 23 .. 23;
      EP12_IN  at 0 range 24 .. 24;
      EP12_OUT at 0 range 25 .. 25;
      EP13_IN  at 0 range 26 .. 26;
      EP13_OUT at 0 range 27 .. 27;
      EP14_IN  at 0 range 28 .. 28;
      EP14_OUT at 0 range 29 .. 29;
      EP15_IN  at 0 range 30 .. 30;
      EP15_OUT at 0 range 31 .. 31;
   end record;

   --  Where to connect the USB controller. Should be to_phy by default.
   type USB_MUXING_Register is record
      TO_PHY         : Boolean := False;
      TO_EXTPHY      : Boolean := False;
      TO_DIGITAL_PAD : Boolean := False;
      SOFTCON        : Boolean := False;
      --  unspecified
      Reserved_4_31  : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for USB_MUXING_Register use record
      TO_PHY         at 0 range 0 .. 0;
      TO_EXTPHY      at 0 range 1 .. 1;
      TO_DIGITAL_PAD at 0 range 2 .. 2;
      SOFTCON        at 0 range 3 .. 3;
      Reserved_4_31  at 0 range 4 .. 31;
   end record;

   --  Overrides for the power signals in the event that the VBUS signals are
   --  not hooked up to GPIO. Set the value of the override and then the
   --  override enable to switch over to the override value.
   type USB_PWR_Register is record
      VBUS_EN                 : Boolean := False;
      VBUS_EN_OVERRIDE_EN     : Boolean := False;
      VBUS_DETECT             : Boolean := False;
      VBUS_DETECT_OVERRIDE_EN : Boolean := False;
      OVERCURR_DETECT         : Boolean := False;
      OVERCURR_DETECT_EN      : Boolean := False;
      --  unspecified
      Reserved_6_31           : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for USB_PWR_Register use record
      VBUS_EN                 at 0 range 0 .. 0;
      VBUS_EN_OVERRIDE_EN     at 0 range 1 .. 1;
      VBUS_DETECT             at 0 range 2 .. 2;
      VBUS_DETECT_OVERRIDE_EN at 0 range 3 .. 3;
      OVERCURR_DETECT         at 0 range 4 .. 4;
      OVERCURR_DETECT_EN      at 0 range 5 .. 5;
      Reserved_6_31           at 0 range 6 .. 31;
   end record;

   --  This register allows for direct control of the USB phy. Use in
   --  conjunction with usbphy_direct_override register to enable each override
   --  bit.
   type USBPHY_DIRECT_Register is record
      --  Enable the second DP pull up resistor. 0 - Pull = Rpu2; 1 - Pull =
      --  Rpu1 + Rpu2
      DP_PULLUP_HISEL : Boolean := False;
      --  DP pull up enable
      DP_PULLUP_EN    : Boolean := False;
      --  DP pull down enable
      DP_PULLDN_EN    : Boolean := False;
      --  unspecified
      Reserved_3_3    : HAL.Bit := 16#0#;
      --  Enable the second DM pull up resistor. 0 - Pull = Rpu2; 1 - Pull =
      --  Rpu1 + Rpu2
      DM_PULLUP_HISEL : Boolean := False;
      --  DM pull up enable
      DM_PULLUP_EN    : Boolean := False;
      --  DM pull down enable
      DM_PULLDN_EN    : Boolean := False;
      --  unspecified
      Reserved_7_7    : HAL.Bit := 16#0#;
      --  Output enable. If TX_DIFFMODE=1, OE for DPP/DPM diff pair. 0 -
      --  DPP/DPM in Hi-Z state; 1 - DPP/DPM driving\n If TX_DIFFMODE=0, OE for
      --  DPP only. 0 - DPP in Hi-Z state; 1 - DPP driving
      TX_DP_OE        : Boolean := False;
      --  Output enable. If TX_DIFFMODE=1, Ignored.\n If TX_DIFFMODE=0, OE for
      --  DPM only. 0 - DPM in Hi-Z state; 1 - DPM driving
      TX_DM_OE        : Boolean := False;
      --  Output data. If TX_DIFFMODE=1, Drives DPP/DPM diff pair. TX_DP_OE=1
      --  to enable drive. DPP=TX_DP, DPM=~TX_DP\n If TX_DIFFMODE=0, Drives DPP
      --  only. TX_DP_OE=1 to enable drive. DPP=TX_DP
      TX_DP           : Boolean := False;
      --  Output data. TX_DIFFMODE=1, Ignored\n TX_DIFFMODE=0, Drives DPM only.
      --  TX_DM_OE=1 to enable drive. DPM=TX_DM
      TX_DM           : Boolean := False;
      --  RX power down override (if override enable is set). 1 = powered down.
      RX_PD           : Boolean := False;
      --  TX power down override (if override enable is set). 1 = powered down.
      TX_PD           : Boolean := False;
      --  TX_FSSLEW=0: Low speed slew rate\n TX_FSSLEW=1: Full speed slew rate
      TX_FSSLEW       : Boolean := False;
      --  TX_DIFFMODE=0: Single ended mode\n TX_DIFFMODE=1: Differential drive
      --  mode (TX_DM, TX_DM_OE ignored)
      TX_DIFFMODE     : Boolean := False;
      --  Read-only. Differential RX
      RX_DD           : Boolean := False;
      --  Read-only. DPP pin state
      RX_DP           : Boolean := False;
      --  Read-only. DPM pin state
      RX_DM           : Boolean := False;
      --  Read-only. DP overcurrent
      DP_OVCN         : Boolean := False;
      --  Read-only. DM overcurrent
      DM_OVCN         : Boolean := False;
      --  Read-only. DP over voltage
      DP_OVV          : Boolean := False;
      --  Read-only. DM over voltage
      DM_OVV          : Boolean := False;
      --  unspecified
      Reserved_23_31  : HAL.UInt9 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for USBPHY_DIRECT_Register use record
      DP_PULLUP_HISEL at 0 range 0 .. 0;
      DP_PULLUP_EN    at 0 range 1 .. 1;
      DP_PULLDN_EN    at 0 range 2 .. 2;
      Reserved_3_3    at 0 range 3 .. 3;
      DM_PULLUP_HISEL at 0 range 4 .. 4;
      DM_PULLUP_EN    at 0 range 5 .. 5;
      DM_PULLDN_EN    at 0 range 6 .. 6;
      Reserved_7_7    at 0 range 7 .. 7;
      TX_DP_OE        at 0 range 8 .. 8;
      TX_DM_OE        at 0 range 9 .. 9;
      TX_DP           at 0 range 10 .. 10;
      TX_DM           at 0 range 11 .. 11;
      RX_PD           at 0 range 12 .. 12;
      TX_PD           at 0 range 13 .. 13;
      TX_FSSLEW       at 0 range 14 .. 14;
      TX_DIFFMODE     at 0 range 15 .. 15;
      RX_DD           at 0 range 16 .. 16;
      RX_DP           at 0 range 17 .. 17;
      RX_DM           at 0 range 18 .. 18;
      DP_OVCN         at 0 range 19 .. 19;
      DM_OVCN         at 0 range 20 .. 20;
      DP_OVV          at 0 range 21 .. 21;
      DM_OVV          at 0 range 22 .. 22;
      Reserved_23_31  at 0 range 23 .. 31;
   end record;

   --  Override enable for each control in usbphy_direct
   type USBPHY_DIRECT_OVERRIDE_Register is record
      DP_PULLUP_HISEL_OVERRIDE_EN : Boolean := False;
      DM_PULLUP_HISEL_OVERRIDE_EN : Boolean := False;
      DP_PULLUP_EN_OVERRIDE_EN    : Boolean := False;
      DP_PULLDN_EN_OVERRIDE_EN    : Boolean := False;
      DM_PULLDN_EN_OVERRIDE_EN    : Boolean := False;
      TX_DP_OE_OVERRIDE_EN        : Boolean := False;
      TX_DM_OE_OVERRIDE_EN        : Boolean := False;
      TX_DP_OVERRIDE_EN           : Boolean := False;
      TX_DM_OVERRIDE_EN           : Boolean := False;
      RX_PD_OVERRIDE_EN           : Boolean := False;
      TX_PD_OVERRIDE_EN           : Boolean := False;
      TX_FSSLEW_OVERRIDE_EN       : Boolean := False;
      DM_PULLUP_OVERRIDE_EN       : Boolean := False;
      --  unspecified
      Reserved_13_14              : HAL.UInt2 := 16#0#;
      TX_DIFFMODE_OVERRIDE_EN     : Boolean := False;
      --  unspecified
      Reserved_16_31              : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for USBPHY_DIRECT_OVERRIDE_Register use record
      DP_PULLUP_HISEL_OVERRIDE_EN at 0 range 0 .. 0;
      DM_PULLUP_HISEL_OVERRIDE_EN at 0 range 1 .. 1;
      DP_PULLUP_EN_OVERRIDE_EN    at 0 range 2 .. 2;
      DP_PULLDN_EN_OVERRIDE_EN    at 0 range 3 .. 3;
      DM_PULLDN_EN_OVERRIDE_EN    at 0 range 4 .. 4;
      TX_DP_OE_OVERRIDE_EN        at 0 range 5 .. 5;
      TX_DM_OE_OVERRIDE_EN        at 0 range 6 .. 6;
      TX_DP_OVERRIDE_EN           at 0 range 7 .. 7;
      TX_DM_OVERRIDE_EN           at 0 range 8 .. 8;
      RX_PD_OVERRIDE_EN           at 0 range 9 .. 9;
      TX_PD_OVERRIDE_EN           at 0 range 10 .. 10;
      TX_FSSLEW_OVERRIDE_EN       at 0 range 11 .. 11;
      DM_PULLUP_OVERRIDE_EN       at 0 range 12 .. 12;
      Reserved_13_14              at 0 range 13 .. 14;
      TX_DIFFMODE_OVERRIDE_EN     at 0 range 15 .. 15;
      Reserved_16_31              at 0 range 16 .. 31;
   end record;

   subtype USBPHY_TRIM_DP_PULLDN_TRIM_Field is HAL.UInt5;
   subtype USBPHY_TRIM_DM_PULLDN_TRIM_Field is HAL.UInt5;

   --  Used to adjust trim values of USB phy pull down resistors.
   type USBPHY_TRIM_Register is record
      --  Value to drive to USB PHY\n DP pulldown resistor trim control\n
      --  Experimental data suggests that the reset value will work, but this
      --  register allows adjustment if required
      DP_PULLDN_TRIM : USBPHY_TRIM_DP_PULLDN_TRIM_Field := 16#1F#;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      --  Value to drive to USB PHY\n DM pulldown resistor trim control\n
      --  Experimental data suggests that the reset value will work, but this
      --  register allows adjustment if required
      DM_PULLDN_TRIM : USBPHY_TRIM_DM_PULLDN_TRIM_Field := 16#1F#;
      --  unspecified
      Reserved_13_31 : HAL.UInt19 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for USBPHY_TRIM_Register use record
      DP_PULLDN_TRIM at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      DM_PULLDN_TRIM at 0 range 8 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   --  Raw Interrupts
   type INTR_Register is record
      --  Read-only. Host: raised when a device is connected or disconnected
      --  (i.e. when SIE_STATUS.SPEED changes). Cleared by writing to
      --  SIE_STATUS.SPEED
      HOST_CONN_DIS        : Boolean;
      --  Read-only. Host: raised when a device wakes up the host. Cleared by
      --  writing to SIE_STATUS.RESUME
      HOST_RESUME          : Boolean;
      --  Read-only. Host: raised every time the host sends a SOF (Start of
      --  Frame). Cleared by reading SOF_RD
      HOST_SOF             : Boolean;
      --  Read-only. Raised every time SIE_STATUS.TRANS_COMPLETE is set. Clear
      --  by writing to this bit.
      TRANS_COMPLETE       : Boolean;
      --  Read-only. Raised when any bit in BUFF_STATUS is set. Clear by
      --  clearing all bits in BUFF_STATUS.
      BUFF_STATUS          : Boolean;
      --  Read-only. Source: SIE_STATUS.DATA_SEQ_ERROR
      ERROR_DATA_SEQ       : Boolean;
      --  Read-only. Source: SIE_STATUS.RX_TIMEOUT
      ERROR_RX_TIMEOUT     : Boolean;
      --  Read-only. Source: SIE_STATUS.RX_OVERFLOW
      ERROR_RX_OVERFLOW    : Boolean;
      --  Read-only. Source: SIE_STATUS.BIT_STUFF_ERROR
      ERROR_BIT_STUFF      : Boolean;
      --  Read-only. Source: SIE_STATUS.CRC_ERROR
      ERROR_CRC            : Boolean;
      --  Read-only. Source: SIE_STATUS.STALL_REC
      STALL                : Boolean;
      --  Read-only. Source: SIE_STATUS.VBUS_DETECT
      VBUS_DETECT          : Boolean;
      --  Read-only. Source: SIE_STATUS.BUS_RESET
      BUS_RESET            : Boolean;
      --  Read-only. Set when the device connection state changes. Cleared by
      --  writing to SIE_STATUS.CONNECTED
      DEV_CONN_DIS         : Boolean;
      --  Read-only. Set when the device suspend state changes. Cleared by
      --  writing to SIE_STATUS.SUSPENDED
      DEV_SUSPEND          : Boolean;
      --  Read-only. Set when the device receives a resume from the host.
      --  Cleared by writing to SIE_STATUS.RESUME
      DEV_RESUME_FROM_HOST : Boolean;
      --  Read-only. Device. Source: SIE_STATUS.SETUP_REC
      SETUP_REQ            : Boolean;
      --  Read-only. Set every time the device receives a SOF (Start of Frame)
      --  packet. Cleared by reading SOF_RD
      DEV_SOF              : Boolean;
      --  Read-only. Raised when any bit in ABORT_DONE is set. Clear by
      --  clearing all bits in ABORT_DONE.
      ABORT_DONE           : Boolean;
      --  Read-only. Raised when any bit in EP_STATUS_STALL_NAK is set. Clear
      --  by clearing all bits in EP_STATUS_STALL_NAK.
      EP_STALL_NAK         : Boolean;
      --  unspecified
      Reserved_20_31       : HAL.UInt12;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTR_Register use record
      HOST_CONN_DIS        at 0 range 0 .. 0;
      HOST_RESUME          at 0 range 1 .. 1;
      HOST_SOF             at 0 range 2 .. 2;
      TRANS_COMPLETE       at 0 range 3 .. 3;
      BUFF_STATUS          at 0 range 4 .. 4;
      ERROR_DATA_SEQ       at 0 range 5 .. 5;
      ERROR_RX_TIMEOUT     at 0 range 6 .. 6;
      ERROR_RX_OVERFLOW    at 0 range 7 .. 7;
      ERROR_BIT_STUFF      at 0 range 8 .. 8;
      ERROR_CRC            at 0 range 9 .. 9;
      STALL                at 0 range 10 .. 10;
      VBUS_DETECT          at 0 range 11 .. 11;
      BUS_RESET            at 0 range 12 .. 12;
      DEV_CONN_DIS         at 0 range 13 .. 13;
      DEV_SUSPEND          at 0 range 14 .. 14;
      DEV_RESUME_FROM_HOST at 0 range 15 .. 15;
      SETUP_REQ            at 0 range 16 .. 16;
      DEV_SOF              at 0 range 17 .. 17;
      ABORT_DONE           at 0 range 18 .. 18;
      EP_STALL_NAK         at 0 range 19 .. 19;
      Reserved_20_31       at 0 range 20 .. 31;
   end record;

   --  Interrupt Enable
   type INTE_Register is record
      --  Host: raised when a device is connected or disconnected (i.e. when
      --  SIE_STATUS.SPEED changes). Cleared by writing to SIE_STATUS.SPEED
      HOST_CONN_DIS        : Boolean := False;
      --  Host: raised when a device wakes up the host. Cleared by writing to
      --  SIE_STATUS.RESUME
      HOST_RESUME          : Boolean := False;
      --  Host: raised every time the host sends a SOF (Start of Frame).
      --  Cleared by reading SOF_RD
      HOST_SOF             : Boolean := False;
      --  Raised every time SIE_STATUS.TRANS_COMPLETE is set. Clear by writing
      --  to this bit.
      TRANS_COMPLETE       : Boolean := False;
      --  Raised when any bit in BUFF_STATUS is set. Clear by clearing all bits
      --  in BUFF_STATUS.
      BUFF_STATUS          : Boolean := False;
      --  Source: SIE_STATUS.DATA_SEQ_ERROR
      ERROR_DATA_SEQ       : Boolean := False;
      --  Source: SIE_STATUS.RX_TIMEOUT
      ERROR_RX_TIMEOUT     : Boolean := False;
      --  Source: SIE_STATUS.RX_OVERFLOW
      ERROR_RX_OVERFLOW    : Boolean := False;
      --  Source: SIE_STATUS.BIT_STUFF_ERROR
      ERROR_BIT_STUFF      : Boolean := False;
      --  Source: SIE_STATUS.CRC_ERROR
      ERROR_CRC            : Boolean := False;
      --  Source: SIE_STATUS.STALL_REC
      STALL                : Boolean := False;
      --  Source: SIE_STATUS.VBUS_DETECT
      VBUS_DETECT          : Boolean := False;
      --  Source: SIE_STATUS.BUS_RESET
      BUS_RESET            : Boolean := False;
      --  Set when the device connection state changes. Cleared by writing to
      --  SIE_STATUS.CONNECTED
      DEV_CONN_DIS         : Boolean := False;
      --  Set when the device suspend state changes. Cleared by writing to
      --  SIE_STATUS.SUSPENDED
      DEV_SUSPEND          : Boolean := False;
      --  Set when the device receives a resume from the host. Cleared by
      --  writing to SIE_STATUS.RESUME
      DEV_RESUME_FROM_HOST : Boolean := False;
      --  Device. Source: SIE_STATUS.SETUP_REC
      SETUP_REQ            : Boolean := False;
      --  Set every time the device receives a SOF (Start of Frame) packet.
      --  Cleared by reading SOF_RD
      DEV_SOF              : Boolean := False;
      --  Raised when any bit in ABORT_DONE is set. Clear by clearing all bits
      --  in ABORT_DONE.
      ABORT_DONE           : Boolean := False;
      --  Raised when any bit in EP_STATUS_STALL_NAK is set. Clear by clearing
      --  all bits in EP_STATUS_STALL_NAK.
      EP_STALL_NAK         : Boolean := False;
      --  unspecified
      Reserved_20_31       : HAL.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTE_Register use record
      HOST_CONN_DIS        at 0 range 0 .. 0;
      HOST_RESUME          at 0 range 1 .. 1;
      HOST_SOF             at 0 range 2 .. 2;
      TRANS_COMPLETE       at 0 range 3 .. 3;
      BUFF_STATUS          at 0 range 4 .. 4;
      ERROR_DATA_SEQ       at 0 range 5 .. 5;
      ERROR_RX_TIMEOUT     at 0 range 6 .. 6;
      ERROR_RX_OVERFLOW    at 0 range 7 .. 7;
      ERROR_BIT_STUFF      at 0 range 8 .. 8;
      ERROR_CRC            at 0 range 9 .. 9;
      STALL                at 0 range 10 .. 10;
      VBUS_DETECT          at 0 range 11 .. 11;
      BUS_RESET            at 0 range 12 .. 12;
      DEV_CONN_DIS         at 0 range 13 .. 13;
      DEV_SUSPEND          at 0 range 14 .. 14;
      DEV_RESUME_FROM_HOST at 0 range 15 .. 15;
      SETUP_REQ            at 0 range 16 .. 16;
      DEV_SOF              at 0 range 17 .. 17;
      ABORT_DONE           at 0 range 18 .. 18;
      EP_STALL_NAK         at 0 range 19 .. 19;
      Reserved_20_31       at 0 range 20 .. 31;
   end record;

   --  Interrupt Force
   type INTF_Register is record
      --  Host: raised when a device is connected or disconnected (i.e. when
      --  SIE_STATUS.SPEED changes). Cleared by writing to SIE_STATUS.SPEED
      HOST_CONN_DIS        : Boolean := False;
      --  Host: raised when a device wakes up the host. Cleared by writing to
      --  SIE_STATUS.RESUME
      HOST_RESUME          : Boolean := False;
      --  Host: raised every time the host sends a SOF (Start of Frame).
      --  Cleared by reading SOF_RD
      HOST_SOF             : Boolean := False;
      --  Raised every time SIE_STATUS.TRANS_COMPLETE is set. Clear by writing
      --  to this bit.
      TRANS_COMPLETE       : Boolean := False;
      --  Raised when any bit in BUFF_STATUS is set. Clear by clearing all bits
      --  in BUFF_STATUS.
      BUFF_STATUS          : Boolean := False;
      --  Source: SIE_STATUS.DATA_SEQ_ERROR
      ERROR_DATA_SEQ       : Boolean := False;
      --  Source: SIE_STATUS.RX_TIMEOUT
      ERROR_RX_TIMEOUT     : Boolean := False;
      --  Source: SIE_STATUS.RX_OVERFLOW
      ERROR_RX_OVERFLOW    : Boolean := False;
      --  Source: SIE_STATUS.BIT_STUFF_ERROR
      ERROR_BIT_STUFF      : Boolean := False;
      --  Source: SIE_STATUS.CRC_ERROR
      ERROR_CRC            : Boolean := False;
      --  Source: SIE_STATUS.STALL_REC
      STALL                : Boolean := False;
      --  Source: SIE_STATUS.VBUS_DETECT
      VBUS_DETECT          : Boolean := False;
      --  Source: SIE_STATUS.BUS_RESET
      BUS_RESET            : Boolean := False;
      --  Set when the device connection state changes. Cleared by writing to
      --  SIE_STATUS.CONNECTED
      DEV_CONN_DIS         : Boolean := False;
      --  Set when the device suspend state changes. Cleared by writing to
      --  SIE_STATUS.SUSPENDED
      DEV_SUSPEND          : Boolean := False;
      --  Set when the device receives a resume from the host. Cleared by
      --  writing to SIE_STATUS.RESUME
      DEV_RESUME_FROM_HOST : Boolean := False;
      --  Device. Source: SIE_STATUS.SETUP_REC
      SETUP_REQ            : Boolean := False;
      --  Set every time the device receives a SOF (Start of Frame) packet.
      --  Cleared by reading SOF_RD
      DEV_SOF              : Boolean := False;
      --  Raised when any bit in ABORT_DONE is set. Clear by clearing all bits
      --  in ABORT_DONE.
      ABORT_DONE           : Boolean := False;
      --  Raised when any bit in EP_STATUS_STALL_NAK is set. Clear by clearing
      --  all bits in EP_STATUS_STALL_NAK.
      EP_STALL_NAK         : Boolean := False;
      --  unspecified
      Reserved_20_31       : HAL.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTF_Register use record
      HOST_CONN_DIS        at 0 range 0 .. 0;
      HOST_RESUME          at 0 range 1 .. 1;
      HOST_SOF             at 0 range 2 .. 2;
      TRANS_COMPLETE       at 0 range 3 .. 3;
      BUFF_STATUS          at 0 range 4 .. 4;
      ERROR_DATA_SEQ       at 0 range 5 .. 5;
      ERROR_RX_TIMEOUT     at 0 range 6 .. 6;
      ERROR_RX_OVERFLOW    at 0 range 7 .. 7;
      ERROR_BIT_STUFF      at 0 range 8 .. 8;
      ERROR_CRC            at 0 range 9 .. 9;
      STALL                at 0 range 10 .. 10;
      VBUS_DETECT          at 0 range 11 .. 11;
      BUS_RESET            at 0 range 12 .. 12;
      DEV_CONN_DIS         at 0 range 13 .. 13;
      DEV_SUSPEND          at 0 range 14 .. 14;
      DEV_RESUME_FROM_HOST at 0 range 15 .. 15;
      SETUP_REQ            at 0 range 16 .. 16;
      DEV_SOF              at 0 range 17 .. 17;
      ABORT_DONE           at 0 range 18 .. 18;
      EP_STALL_NAK         at 0 range 19 .. 19;
      Reserved_20_31       at 0 range 20 .. 31;
   end record;

   --  Interrupt status after masking & forcing
   type INTS_Register is record
      --  Read-only. Host: raised when a device is connected or disconnected
      --  (i.e. when SIE_STATUS.SPEED changes). Cleared by writing to
      --  SIE_STATUS.SPEED
      HOST_CONN_DIS        : Boolean;
      --  Read-only. Host: raised when a device wakes up the host. Cleared by
      --  writing to SIE_STATUS.RESUME
      HOST_RESUME          : Boolean;
      --  Read-only. Host: raised every time the host sends a SOF (Start of
      --  Frame). Cleared by reading SOF_RD
      HOST_SOF             : Boolean;
      --  Read-only. Raised every time SIE_STATUS.TRANS_COMPLETE is set. Clear
      --  by writing to this bit.
      TRANS_COMPLETE       : Boolean;
      --  Read-only. Raised when any bit in BUFF_STATUS is set. Clear by
      --  clearing all bits in BUFF_STATUS.
      BUFF_STATUS          : Boolean;
      --  Read-only. Source: SIE_STATUS.DATA_SEQ_ERROR
      ERROR_DATA_SEQ       : Boolean;
      --  Read-only. Source: SIE_STATUS.RX_TIMEOUT
      ERROR_RX_TIMEOUT     : Boolean;
      --  Read-only. Source: SIE_STATUS.RX_OVERFLOW
      ERROR_RX_OVERFLOW    : Boolean;
      --  Read-only. Source: SIE_STATUS.BIT_STUFF_ERROR
      ERROR_BIT_STUFF      : Boolean;
      --  Read-only. Source: SIE_STATUS.CRC_ERROR
      ERROR_CRC            : Boolean;
      --  Read-only. Source: SIE_STATUS.STALL_REC
      STALL                : Boolean;
      --  Read-only. Source: SIE_STATUS.VBUS_DETECT
      VBUS_DETECT          : Boolean;
      --  Read-only. Source: SIE_STATUS.BUS_RESET
      BUS_RESET            : Boolean;
      --  Read-only. Set when the device connection state changes. Cleared by
      --  writing to SIE_STATUS.CONNECTED
      DEV_CONN_DIS         : Boolean;
      --  Read-only. Set when the device suspend state changes. Cleared by
      --  writing to SIE_STATUS.SUSPENDED
      DEV_SUSPEND          : Boolean;
      --  Read-only. Set when the device receives a resume from the host.
      --  Cleared by writing to SIE_STATUS.RESUME
      DEV_RESUME_FROM_HOST : Boolean;
      --  Read-only. Device. Source: SIE_STATUS.SETUP_REC
      SETUP_REQ            : Boolean;
      --  Read-only. Set every time the device receives a SOF (Start of Frame)
      --  packet. Cleared by reading SOF_RD
      DEV_SOF              : Boolean;
      --  Read-only. Raised when any bit in ABORT_DONE is set. Clear by
      --  clearing all bits in ABORT_DONE.
      ABORT_DONE           : Boolean;
      --  Read-only. Raised when any bit in EP_STATUS_STALL_NAK is set. Clear
      --  by clearing all bits in EP_STATUS_STALL_NAK.
      EP_STALL_NAK         : Boolean;
      --  unspecified
      Reserved_20_31       : HAL.UInt12;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTS_Register use record
      HOST_CONN_DIS        at 0 range 0 .. 0;
      HOST_RESUME          at 0 range 1 .. 1;
      HOST_SOF             at 0 range 2 .. 2;
      TRANS_COMPLETE       at 0 range 3 .. 3;
      BUFF_STATUS          at 0 range 4 .. 4;
      ERROR_DATA_SEQ       at 0 range 5 .. 5;
      ERROR_RX_TIMEOUT     at 0 range 6 .. 6;
      ERROR_RX_OVERFLOW    at 0 range 7 .. 7;
      ERROR_BIT_STUFF      at 0 range 8 .. 8;
      ERROR_CRC            at 0 range 9 .. 9;
      STALL                at 0 range 10 .. 10;
      VBUS_DETECT          at 0 range 11 .. 11;
      BUS_RESET            at 0 range 12 .. 12;
      DEV_CONN_DIS         at 0 range 13 .. 13;
      DEV_SUSPEND          at 0 range 14 .. 14;
      DEV_RESUME_FROM_HOST at 0 range 15 .. 15;
      SETUP_REQ            at 0 range 16 .. 16;
      DEV_SOF              at 0 range 17 .. 17;
      ABORT_DONE           at 0 range 18 .. 18;
      EP_STALL_NAK         at 0 range 19 .. 19;
      Reserved_20_31       at 0 range 20 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  USB FS/LS controller device registers
   type USBCTRL_REGS_Peripheral is record
      --  Device address and endpoint control
      ADDR_ENDP              : aliased ADDR_ENDP_Register;
      --  Interrupt endpoint 1. Only valid for HOST mode.
      ADDR_ENDP1             : aliased ADDR_ENDP_Register_1;
      --  Interrupt endpoint 2. Only valid for HOST mode.
      ADDR_ENDP2             : aliased ADDR_ENDP_Register_1;
      --  Interrupt endpoint 3. Only valid for HOST mode.
      ADDR_ENDP3             : aliased ADDR_ENDP_Register_1;
      --  Interrupt endpoint 4. Only valid for HOST mode.
      ADDR_ENDP4             : aliased ADDR_ENDP_Register_1;
      --  Interrupt endpoint 5. Only valid for HOST mode.
      ADDR_ENDP5             : aliased ADDR_ENDP_Register_1;
      --  Interrupt endpoint 6. Only valid for HOST mode.
      ADDR_ENDP6             : aliased ADDR_ENDP_Register_1;
      --  Interrupt endpoint 7. Only valid for HOST mode.
      ADDR_ENDP7             : aliased ADDR_ENDP_Register_1;
      --  Interrupt endpoint 8. Only valid for HOST mode.
      ADDR_ENDP8             : aliased ADDR_ENDP_Register_1;
      --  Interrupt endpoint 9. Only valid for HOST mode.
      ADDR_ENDP9             : aliased ADDR_ENDP_Register_1;
      --  Interrupt endpoint 10. Only valid for HOST mode.
      ADDR_ENDP10            : aliased ADDR_ENDP_Register_1;
      --  Interrupt endpoint 11. Only valid for HOST mode.
      ADDR_ENDP11            : aliased ADDR_ENDP_Register_1;
      --  Interrupt endpoint 12. Only valid for HOST mode.
      ADDR_ENDP12            : aliased ADDR_ENDP_Register_1;
      --  Interrupt endpoint 13. Only valid for HOST mode.
      ADDR_ENDP13            : aliased ADDR_ENDP_Register_1;
      --  Interrupt endpoint 14. Only valid for HOST mode.
      ADDR_ENDP14            : aliased ADDR_ENDP_Register_1;
      --  Interrupt endpoint 15. Only valid for HOST mode.
      ADDR_ENDP15            : aliased ADDR_ENDP_Register_1;
      --  Main control register
      MAIN_CTRL              : aliased MAIN_CTRL_Register;
      --  Set the SOF (Start of Frame) frame number in the host controller. The
      --  SOF packet is sent every 1ms and the host will increment the frame
      --  number by 1 each time.
      SOF_WR                 : aliased SOF_WR_Register;
      --  Read the last SOF (Start of Frame) frame number seen. In device mode
      --  the last SOF received from the host. In host mode the last SOF sent
      --  by the host.
      SOF_RD                 : aliased SOF_RD_Register;
      --  SIE control register
      SIE_CTRL               : aliased SIE_CTRL_Register;
      --  SIE status register
      SIE_STATUS             : aliased SIE_STATUS_Register;
      --  interrupt endpoint control register
      INT_EP_CTRL            : aliased INT_EP_CTRL_Register;
      --  Buffer status register. A bit set here indicates that a buffer has
      --  completed on the endpoint (if the buffer interrupt is enabled). It is
      --  possible for 2 buffers to be completed, so clearing the buffer status
      --  bit may instantly re set it on the next clock cycle.
      BUFF_STATUS            : aliased BUFF_STATUS_Register;
      --  Which of the double buffers should be handled. Only valid if using an
      --  interrupt per buffer (i.e. not per 2 buffers). Not valid for host
      --  interrupt endpoint polling because they are only single buffered.
      BUFF_CPU_SHOULD_HANDLE : aliased BUFF_CPU_SHOULD_HANDLE_Register;
      --  Device only: Can be set to ignore the buffer control register for
      --  this endpoint in case you would like to revoke a buffer. A NAK will
      --  be sent for every access to the endpoint until this bit is cleared. A
      --  corresponding bit in `EP_ABORT_DONE` is set when it is safe to modify
      --  the buffer control register.
      EP_ABORT               : aliased EP_ABORT_Register;
      --  Device only: Used in conjunction with `EP_ABORT`. Set once an
      --  endpoint is idle so the programmer knows it is safe to modify the
      --  buffer control register.
      EP_ABORT_DONE          : aliased EP_ABORT_DONE_Register;
      --  Device: this bit must be set in conjunction with the `STALL` bit in
      --  the buffer control register to send a STALL on EP0. The device
      --  controller clears these bits when a SETUP packet is received because
      --  the USB spec requires that a STALL condition is cleared when a SETUP
      --  packet is received.
      EP_STALL_ARM           : aliased EP_STALL_ARM_Register;
      --  Used by the host controller. Sets the wait time in microseconds
      --  before trying again if the device replies with a NAK.
      NAK_POLL               : aliased NAK_POLL_Register;
      --  Device: bits are set when the `IRQ_ON_NAK` or `IRQ_ON_STALL` bits are
      --  set. For EP0 this comes from `SIE_CTRL`. For all other endpoints it
      --  comes from the endpoint control register.
      EP_STATUS_STALL_NAK    : aliased EP_STATUS_STALL_NAK_Register;
      --  Where to connect the USB controller. Should be to_phy by default.
      USB_MUXING             : aliased USB_MUXING_Register;
      --  Overrides for the power signals in the event that the VBUS signals
      --  are not hooked up to GPIO. Set the value of the override and then the
      --  override enable to switch over to the override value.
      USB_PWR                : aliased USB_PWR_Register;
      --  This register allows for direct control of the USB phy. Use in
      --  conjunction with usbphy_direct_override register to enable each
      --  override bit.
      USBPHY_DIRECT          : aliased USBPHY_DIRECT_Register;
      --  Override enable for each control in usbphy_direct
      USBPHY_DIRECT_OVERRIDE : aliased USBPHY_DIRECT_OVERRIDE_Register;
      --  Used to adjust trim values of USB phy pull down resistors.
      USBPHY_TRIM            : aliased USBPHY_TRIM_Register;
      --  Raw Interrupts
      INTR                   : aliased INTR_Register;
      --  Interrupt Enable
      INTE                   : aliased INTE_Register;
      --  Interrupt Force
      INTF                   : aliased INTF_Register;
      --  Interrupt status after masking & forcing
      INTS                   : aliased INTS_Register;
   end record
     with Volatile;

   for USBCTRL_REGS_Peripheral use record
      ADDR_ENDP              at 16#0# range 0 .. 31;
      ADDR_ENDP1             at 16#4# range 0 .. 31;
      ADDR_ENDP2             at 16#8# range 0 .. 31;
      ADDR_ENDP3             at 16#C# range 0 .. 31;
      ADDR_ENDP4             at 16#10# range 0 .. 31;
      ADDR_ENDP5             at 16#14# range 0 .. 31;
      ADDR_ENDP6             at 16#18# range 0 .. 31;
      ADDR_ENDP7             at 16#1C# range 0 .. 31;
      ADDR_ENDP8             at 16#20# range 0 .. 31;
      ADDR_ENDP9             at 16#24# range 0 .. 31;
      ADDR_ENDP10            at 16#28# range 0 .. 31;
      ADDR_ENDP11            at 16#2C# range 0 .. 31;
      ADDR_ENDP12            at 16#30# range 0 .. 31;
      ADDR_ENDP13            at 16#34# range 0 .. 31;
      ADDR_ENDP14            at 16#38# range 0 .. 31;
      ADDR_ENDP15            at 16#3C# range 0 .. 31;
      MAIN_CTRL              at 16#40# range 0 .. 31;
      SOF_WR                 at 16#44# range 0 .. 31;
      SOF_RD                 at 16#48# range 0 .. 31;
      SIE_CTRL               at 16#4C# range 0 .. 31;
      SIE_STATUS             at 16#50# range 0 .. 31;
      INT_EP_CTRL            at 16#54# range 0 .. 31;
      BUFF_STATUS            at 16#58# range 0 .. 31;
      BUFF_CPU_SHOULD_HANDLE at 16#5C# range 0 .. 31;
      EP_ABORT               at 16#60# range 0 .. 31;
      EP_ABORT_DONE          at 16#64# range 0 .. 31;
      EP_STALL_ARM           at 16#68# range 0 .. 31;
      NAK_POLL               at 16#6C# range 0 .. 31;
      EP_STATUS_STALL_NAK    at 16#70# range 0 .. 31;
      USB_MUXING             at 16#74# range 0 .. 31;
      USB_PWR                at 16#78# range 0 .. 31;
      USBPHY_DIRECT          at 16#7C# range 0 .. 31;
      USBPHY_DIRECT_OVERRIDE at 16#80# range 0 .. 31;
      USBPHY_TRIM            at 16#84# range 0 .. 31;
      INTR                   at 16#8C# range 0 .. 31;
      INTE                   at 16#90# range 0 .. 31;
      INTF                   at 16#94# range 0 .. 31;
      INTS                   at 16#98# range 0 .. 31;
   end record;

   --  USB FS/LS controller device registers
   USBCTRL_REGS_Periph : aliased USBCTRL_REGS_Peripheral
     with Import, Address => USBCTRL_REGS_Base;

end RP2040_SVD.USBCTRL_REGS;
