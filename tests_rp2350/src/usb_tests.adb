--
--  Copyright (C) 2026 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Assertions; use AUnit.Assertions;
with Ada.Real_Time; use Ada.Real_Time;
with System.Storage_Elements; use System.Storage_Elements;
with System;
with HAL; use HAL;
with USB.Device.Serial;
with USB.Device;
with USB.HAL.Device;
with USB;
with RP.USB_Device;
with RP.Device;
with RP.Clock;
with RP.Reset;

package body USB_Tests is

   --  usb_echo.py sends this byte after it has put the tty into raw mode.
   --  Anything received before it is discarded, which keeps tty echo and
   --  ModemManager probes out of the loopback data.
   Sync : constant UInt8 := 16#A5#;

   Enumerate_Timeout : constant Time_Span := Seconds (15);
   Loopback_Timeout  : constant Time_Span := Seconds (5);

   DPRAM_Base : constant Integer_Address := 16#5010_0000#;

   UDC    : RP.USB_Device.USB_Device_Controller renames RP.Device.UDC;
   Stack  : USB.Device.USB_Device_Stack (Max_Classes => 1);
   Serial : aliased USB.Device.Serial.Default_Serial_Class
      (TX_Buffer_Size => 256,
       RX_Buffer_Size => 256);

   Started : Boolean := False;
   Synced  : Boolean := False;

   procedure Test_Buffers
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use type System.Address;
      Local : RP.USB_Device.USB_Device_Controller;
      EP0_In, EP0_Out, EP1_In, EP1_Out, EP2_In : Integer_Address;
   begin
      for Id in USB.EP_Id'Range loop
         Assert (Local.Valid_EP_Id (Id), "All 16 endpoints should be valid");
      end loop;
      Assert (not Local.Early_Address, "Address must be set after the status stage");

      EP0_In := To_Integer (Local.Request_Buffer ((0, USB.EP_In), 64));
      EP0_Out := To_Integer (Local.Request_Buffer ((0, USB.EP_Out), 64));
      Assert (EP0_In = DPRAM_Base + 16#100#, "EP0 IN buffer is not at the fixed DPRAM offset");
      Assert (EP0_Out = EP0_In, "EP0 IN and OUT must share a buffer");

      EP1_In := To_Integer (Local.Request_Buffer ((1, USB.EP_In), 64));
      EP1_Out := To_Integer (Local.Request_Buffer ((1, USB.EP_Out), 64));
      EP2_In := To_Integer (Local.Request_Buffer ((2, USB.EP_In), 1));
      Assert (EP1_In = DPRAM_Base + 16#180#, "First endpoint buffer does not follow EP0");
      Assert (EP1_Out >= EP1_In + 64, "EP1 IN and OUT buffers overlap");
      Assert (EP2_In >= EP1_Out + 64, "EP1 OUT and EP2 IN buffers overlap");
      Assert (EP1_Out mod 64 = 0 and then EP2_In mod 64 = 0, "Buffers must be 64 byte aligned");
      Assert (EP2_In + 1 <= DPRAM_Base + 16#1000#, "Buffer allocated outside of DPRAM");
   end Test_Buffers;

   procedure Test_Initialize
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use USB.Device;
      use type USB.HAL.Device.UDC_Event_Kind;
   begin
      Assert (Stack.Register_Class (Serial'Access), "Register_Class failed");
      Assert (Stack.Initialize
         (Controller      => UDC'Access,
          Manufacturer    => USB.To_USB_String ("rp2040_hal"),
          Product         => USB.To_USB_String ("USB_Tests"),
          Serial_Number   => USB.To_USB_String ("0001"),
          Max_Packet_Size => 64) = Ok,
          "USB stack initialization failed");

      Stack.Start;
      Started := True;

      Assert (RP.Reset.Reset_Done (RP.Reset.Reset_USBCTRL), "USBCTRL is still in reset");
      Assert (RP.Clock.Frequency (RP.Clock.USB) = 48_000_000, "clk_usb is not running at 48 MHz");

      --  A host cannot have addressed us yet. Nothing but a bus reset may
      --  be reported this early, and Poll must not block.
      Assert (UDC.Poll.Kind in USB.HAL.Device.None | USB.HAL.Device.Reset,
         "Unexpected event immediately after Start");
   end Test_Initialize;

   procedure Test_Enumerate
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      Deadline : Time;
      Data     : UInt8_Array (1 .. 64);
      Len      : UInt32;
   begin
      Assert (Started, "Controller was not started");

      Deadline := Clock + Enumerate_Timeout;
      loop
         exit when Serial.List_Ctrl_State.DTE_Is_Present;
         Assert (Clock < Deadline, "Host did not open the serial port. Is USB connected and usb_echo.py running?");
         Stack.Poll;
      end loop;

      loop
         exit when Synced;
         Assert (Clock < Deadline, "Host opened the serial port but did not send sync");
         Stack.Poll;
         Len := Data'Length;
         Serial.Read (Data'Address, Len);
         --  Echo starts after sync, so sync must be the last thing received
         Synced := Len > 0 and then Data (Positive (Len)) = Sync;
      end loop;
   end Test_Enumerate;

   procedure Test_Loopback
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      --  Not a multiple of the packet size, so the transfer ends with a short
      --  packet, and bigger than the class queues, so they have to wrap.
      Total    : constant := 1000;
      TX, RX   : aliased UInt8_Array (1 .. Total) := (others => 0);
      Sent     : Natural := 0;
      Received : Natural := 0;
      Deadline : Time;
      Len      : UInt32;
   begin
      Assert (Synced, "No host connection");

      for I in TX'Range loop
         TX (I) := UInt8 ((I * 7) mod 251);
      end loop;

      Deadline := Clock + Loopback_Timeout;
      while Received < Total loop
         Assert (Clock < Deadline,
            "Loopback timeout, sent" & Sent'Image & " received" & Received'Image);
         Stack.Poll;

         if Sent < Total then
            Len := UInt32 (Natural'Min (64, Total - Sent));
            Serial.Write (UDC, TX (Sent + 1)'Address, Len);
            Sent := Sent + Natural (Len);
         end if;

         Len := UInt32 (Total - Received);
         Serial.Read (RX (Received + 1)'Address, Len);
         Received := Received + Natural (Len);
      end loop;

      Assert (RX = TX, "Echoed data does not match");

      --  Nothing further should arrive
      Deadline := Clock + Milliseconds (50);
      while Clock < Deadline loop
         Stack.Poll;
         Len := 1;
         Serial.Read (RX (1)'Address, Len);
         Assert (Len = 0, "Received more data than was sent");
      end loop;
   end Test_Loopback;

   overriding
   procedure Register_Tests
      (T : in out USB_Test)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Buffers'Access, "Buffers");
      Register_Routine (T, Test_Initialize'Access, "Initialize");
      Register_Routine (T, Test_Enumerate'Access, "Enumerate");
      Register_Routine (T, Test_Loopback'Access, "CDC-ACM Loopback");
   end Register_Tests;

   overriding
   function Name
      (T : USB_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.USB_Device"));

end USB_Tests;
