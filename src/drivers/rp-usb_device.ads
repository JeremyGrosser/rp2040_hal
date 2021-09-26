with System.Storage_Elements;
with System;
with HAL; use HAL;

with USB.HAL.Device;
with USB;

package RP.USB_Device is

   type USB_Device_Controller is new USB.HAL.Device.USB_Device_Controller with private;

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
       EP   : USB.EP_Id)
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

   --  The first 0x100 bytes of DPRAM are control registers. 0x100-0x180 is EP0
   --  buffers. The remainder of the 4k DPRAM is allocated to endpoints as needed.
   subtype DPRAM_Offset is System.Storage_Elements.Storage_Offset range 16#100# .. 16#FFF#;

   type Endpoint_Status is record
      Addr           : System.Address := System.Null_Address;
      Next_PID       : Boolean := False;
      Buffer_Address : DPRAM_Offset := DPRAM_Offset'Last;
   end record;

   type Endpoint_Status_Array is array (USB.EP_Id, USB.EP_Dir) of Endpoint_Status;

   type USB_Device_Controller is new USB.HAL.Device.USB_Device_Controller with record
      Next_Buffer : DPRAM_Offset := 16#180#; --  EP0 buffers cannot be allocated, start at EP1
      EP_Status   : Endpoint_Status_Array := (others => (others => <>));
   end record;

   use type System.Storage_Elements.Storage_Offset;
   function Allocate_Buffer
      (This      : in out USB_Device_Controller;
       Size      : Natural;
       Alignment : Natural)
       return DPRAM_Offset
   with Pre  => Alignment >= 64
                and Alignment mod 64 = 0
                and Size <= 1024,
        Post => Allocate_Buffer'Result >= 16#180#
                and (Natural (Allocate_Buffer'Result) + Size) <= Natural (DPRAM_Offset'Last)
                and (Natural (Allocate_Buffer'Result) mod Alignment) = 0;

   function Endpoint_Buffer_Address
      (Ep : USB.EP_Addr)
      return System.Address;

   procedure Copy_Endpoint_Buffer
      (This : in out USB_Device_Controller;
       Num  : USB.EP_Id;
       Dir  : USB.EP_Dir);

end RP.USB_Device;
