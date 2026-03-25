--
--  Copyright 2021 (C) Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP2040_SVD;
with RP.Timer;

package body RP.Reset is

   type RESET_Register is array (Reset_Id) of Boolean
      with Component_Size => 1,
           Size           => 32;

   type RESETS_Peripheral is record
      RESET      : aliased RESET_Register;
      WDSEL      : aliased RESET_Register;
      RESET_DONE : aliased RESET_Register;
   end record
      with Volatile;

   for RESETS_Peripheral use record
      RESET      at 0 range 0 .. 31;
      WDSEL      at 4 range 0 .. 31;
      RESET_DONE at 8 range 0 .. 31;
   end record;

   RESETS_Periph : aliased RESETS_Peripheral
      with Import, Address => RP2040_SVD.RESETS_Base;

   procedure Reset_Peripheral
      (Peripheral : Reset_Id)
   is
   begin
      RESETS_Periph.RESET (Peripheral) := True;
      RESETS_Periph.RESET (Peripheral) := False;
      while not RESETS_Periph.RESET_DONE (Peripheral) loop
         null;
      end loop;
   end Reset_Peripheral;

   procedure Reset_Peripheral
      (Peripheral : Reset_Id;
       Status     : out Reset_Status;
       Timeout    : Natural := 100)
   is
      use RP.Timer;
      Deadline : constant Time := Clock + Milliseconds (Timeout);
   begin
      RESETS_Periph.RESET (Peripheral) := True;
      RESETS_Periph.RESET (Peripheral) := False;
      while not RESETS_Periph.RESET_DONE (Peripheral) loop
         if Timeout > 0 and then Clock >= Deadline then
            Status := Reset_Timeout;
            return;
         end if;
      end loop;
      Status := Reset_Ok;
   end Reset_Peripheral;

end RP.Reset;
