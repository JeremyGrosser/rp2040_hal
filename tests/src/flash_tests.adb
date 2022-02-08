--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Assertions; use AUnit.Assertions;
with HAL; use HAL;
with RP.Flash;
with System.Storage_Elements; use System.Storage_Elements;

package body Flash_Tests is
   Test_Area : UInt8_Array (1 .. RP.Flash.Sector_Size)
      with Alignment      => RP.Flash.Sector_Size,
           Linker_Section => ".flashdata";

   procedure Test_Erase
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
   begin
      RP.Flash.Erase
         (Offset => RP.Flash.To_Flash_Offset (Test_Area'Address),
          Length => Test_Area'Length);

      for I in Test_Area'Range loop
         Assert (Test_Area (I) = 16#FF#, "erase didn't");
      end loop;
   end Test_Erase;

   procedure Test_Program
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      Data : UInt8_Array (Test_Area'Range)
         with Alignment => RP.Flash.Sector_Size;
   begin
      for I in Data'Range loop
         Data (I) := UInt8 (I mod Integer (UInt8'Last));
      end loop;

      RP.Flash.Program
         (Offset => RP.Flash.To_Flash_Offset (Test_Area'Address),
          Source => Data'Address,
          Length => Data'Length);

      for I in Data'Range loop
         Assert (Test_Area (I) = Data (I), "verify failed");
      end loop;

      --  Erase after programming to be certain that erase works
      Test_Erase (T);
   end Test_Program;

   overriding
   procedure Register_Tests
      (T : in out Flash_Test)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Erase'Access, "Erase");
      Register_Routine (T, Test_Program'Access, "Program");
   end Register_Tests;

   overriding
   function Name
      (T : Flash_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.Flash"));

end Flash_Tests;
