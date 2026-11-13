--
--  Copyright (C) 2026 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Test_Cases;
with AUnit;

package USB_Tests is

   type USB_Test is new AUnit.Test_Cases.Test_Case with null record;

   overriding
   procedure Register_Tests
      (T : in out USB_Test);

   overriding
   function Name
      (T : USB_Test)
      return AUnit.Message_String;

   procedure Test_Buffers
      (T : in out AUnit.Test_Cases.Test_Case'Class);
   --  Endpoint buffer allocation. Does not touch the hardware.

   procedure Test_Initialize
      (T : in out AUnit.Test_Cases.Test_Case'Class);
   --  Bring up the controller with a CDC-ACM class. No host required.

   procedure Test_Enumerate
      (T : in out AUnit.Test_Cases.Test_Case'Class);
   --  Wait for a host to enumerate the device, open the serial port and send
   --  the sync byte. Requires usb_echo.py running on the host.

   procedure Test_Loopback
      (T : in out AUnit.Test_Cases.Test_Case'Class);
   --  Send data to the host and expect it to be echoed back unmodified

end USB_Tests;
