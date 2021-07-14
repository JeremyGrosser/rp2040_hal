with System.Storage_Elements;
with System;
with HAL; use HAL;

with RP.USB_Common; use RP.USB_Common;
with USB.HAL.Device;
with USB;

package RP.USB_Device is

   type USB_Device_Controller
   is new USB.HAL.Device.USB_Device_Controller with private;

   overriding
   procedure Initialize
      (This : in out USB_Device_Controller);

   overriding
   procedure Start
      (This : in out USB_Device_Controller);

   overriding
   function Poll
      (This : in out USB_Device_Controller)
       return USB.HAL.Device.UDC_Event;

   overriding
   procedure Reset
      (This : in out USB_Device_Controller);

   overriding
   function Request_Buffer
      (This          : in out USB_Device_Controller;
       Ep            : USB.EP_Addr;
       Len           : UInt11;
       Min_Alignment : UInt8 := 1)
       return System.Address;

   overriding
   function Valid_EP_Id
      (This : in out USB_Device_Controller;
       Ep   : USB.EP_Id)
       return Boolean;

   overriding
   procedure EP_Write_Packet
      (This : in out USB_Device_Controller;
       Ep   : USB.EP_Id;
       Addr : System.Address;
       Len  : UInt32);

   overriding
   procedure EP_Setup
      (This     : in out USB_Device_Controller;
       Ep       : USB.EP_Addr;
       Typ      : USB.EP_Type;
       Max_Size : UInt16);

   overriding
   procedure EP_Ready_For_Data
      (This     : in out USB_Device_Controller;
       Ep       : USB.EP_Id;
       Addr     : System.Address;
       Max_Len  : UInt32;
       Ready    : Boolean := True);

   overriding
   procedure EP_Stall
      (This     : in out USB_Device_Controller;
       Ep       : USB.EP_Addr;
       Set      : Boolean := True);

   overriding
   procedure Set_Address
      (This : in out USB_Device_Controller;
       Addr : UInt7);

   overriding
   function Early_Address
      (This : USB_Device_Controller)
      return Boolean;

private

   type USB_Device_Controller
   is new USB.HAL.Device.USB_Device_Controller with record
      Next_Base : UInt16 := 16#180#;
   end record;

   --  The first 0x100 bytes of USB_DPSRAM contain configuration data

   --  4.1.2.5.2. Endpoint control register
   type USB_EP_CONTROL_Register is record
      ENABLE     : Boolean := False;
      DOUBLE     : Boolean := False;
      INT_EVERY  : Boolean := False;
      INT_DOUBLE : Boolean := False;
      EP_TYPE    : USB.EP_Type := USB.Control;
      INT_STALL  : Boolean := False;
      INT_NAK    : Boolean := False;
      BASE       : UInt16 := 0; --  low 8 bits must be 0
   end record
      with Size => 32;

   for USB_EP_CONTROL_Register use record
      ENABLE     at 0 range 31 .. 31;
      DOUBLE     at 0 range 30 .. 30;
      INT_EVERY  at 0 range 29 .. 29;
      INT_DOUBLE at 0 range 28 .. 28;
      EP_TYPE    at 0 range 26 .. 27;
      INT_STALL  at 0 range 17 .. 17;
      INT_NAK    at 0 range 16 .. 16;
      BASE       at 0 range 0 .. 15;
   end record;

   type USB_EP_CONTROL_Registers is array (USB.EP_Dir) of USB_EP_CONTROL_Register
      with Component_Size => 32, Size => 64;

   type USB_EP_CONTROL_Array is array (USB.EP_Id range 1 .. 15) of USB_EP_CONTROL_Registers
      with Component_Size => 64, Size => 960;

   --  USB_EP_BUFFER (1) is only valid when DOUBLE = True in the corresponding USB_EP_CONTROL register
   type USB_EP_BUFFER_Register is record
      FULL_1        : Boolean := False;
      LAST_1        : Boolean := False;
      PID_1         : Boolean := False;
      DOUBLE_OFFSET : UInt2 := 0;
      AVAILABLE_1   : Boolean := False;
      LENGTH_1      : UInt9 := 0;
      FULL_0        : Boolean := False;
      LAST_0        : Boolean := False;
      PID_0         : Boolean := False;
      RESET_SELECT  : Boolean := False;
      STALL         : Boolean := False;
      AVAILABLE_0   : Boolean := False;
      LENGTH_0      : UInt9 := 0;
   end record
      with Size => 32;

   for USB_EP_BUFFER_Register use record
      FULL_1        at 0 range 31 .. 31;
      LAST_1        at 0 range 30 .. 30;
      PID_1         at 0 range 29 .. 29;
      DOUBLE_OFFSET at 0 range 27 .. 28;
      AVAILABLE_1   at 0 range 26 .. 26;
      LENGTH_1      at 0 range 16 .. 25;
      FULL_0        at 0 range 15 .. 15;
      LAST_0        at 0 range 14 .. 14;
      PID_0         at 0 range 13 .. 13;
      RESET_SELECT  at 0 range 12 .. 12;
      STALL         at 0 range 11 .. 11;
      AVAILABLE_0   at 0 range 10 .. 10;
      LENGTH_0      at 0 range 0 .. 9;
   end record;

   type USB_EP_BUFFER_Registers is array (USB.EP_Dir) of USB_EP_BUFFER_Register
      with Component_Size => 32;

   type USB_EP_BUFFER_Array is array (USB.EP_Id) of USB_EP_BUFFER_Registers
      with Component_Size => 64,
           Size => 1024;

   type USB_EP_Registers is record
      SETUP        : aliased USB.Setup_Data;
      EP_CONTROL   : aliased USB_EP_CONTROL_Array;
      EP_BUFFER    : aliased USB_EP_BUFFER_Array;
   end record
      with Volatile,
           Size => 16#100# * 8;

   for USB_EP_Registers use record
      SETUP        at 16#00# range 0 .. 63;
      EP_CONTROL   at 16#08# range 0 .. 959;
      EP_BUFFER    at 16#80# range 0 .. 1023;
   end record;

   USB_EP : USB_EP_Registers
      with Import, Address => USB_DPSRAM_Base;

   use System.Storage_Elements;
   USB_EP0_BUFFER : UInt8_Array (0 .. 63)
      with Import, Address => USB_DPSRAM_Base + 16#100#;

end RP.USB_Device;
