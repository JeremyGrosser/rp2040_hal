with HAL; use HAL;
with System;

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
   is new USB.HAL.Device.USB_Device_Controller with null record;

end RP.USB_Device;
