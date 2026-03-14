--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Assertions; use AUnit.Assertions;
with HAL; use HAL;
with RP.Flash;
with RP.Flash.Cache;

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

   procedure Test_Cache
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      X : UInt8 with Volatile;
   begin
      X := Test_Area (1);
      Assert (RP.Flash.Cache.Access_Count > 0, "access counter not incrementing");
      Assert (RP.Flash.Cache.Hit_Count > 0, "hit counter not incrementing");
      Assert (RP.Flash.Cache.Is_Enabled, "not enabled prior to testing");

      RP.Flash.Cache.Disable;
      Assert (not RP.Flash.Cache.Is_Enabled, "cache disable failed");

      RP.Flash.Cache.Flush;
      RP.Flash.Cache.Reset_Counters;
      Assert (RP.Flash.Cache.Access_Count = 0, "access counter did not reset");
      Assert (RP.Flash.Cache.Hit_Count = 0, "hit counter did not reset");

      RP.Flash.Cache.Enable;
      Assert (RP.Flash.Cache.Is_Enabled, "enable failed");
      RP.Flash.Cache.Power_Down;
      Assert (not RP.Flash.Cache.Is_Enabled, "cache power down failed");
      RP.Flash.Cache.Enable;
      Assert (RP.Flash.Cache.Is_Enabled, "power up enable failed");

      X := Test_Area (1);
      X := Test_Area (1);
      Assert (RP.Flash.Cache.Hit_Count > 0, "cache hit counter did not increment");
   end Test_Cache;

   procedure Test_Unique_Id
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      X : UInt64 with Volatile;
   begin
      X := RP.Flash.Unique_Id;
      Assert (X /= 0, "unique id is 0");
   end Test_Unique_Id;

   overriding
   procedure Register_Tests
      (T : in out Flash_Test)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Erase'Access, "Erase");
      Register_Routine (T, Test_Program'Access, "Program");
      Register_Routine (T, Test_Cache'Access, "Cache");
      Register_Routine (T, Test_Unique_Id'Access, "Unique Id");
   end Register_Tests;

   overriding
   function Name
      (T : Flash_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.Flash"));

end Flash_Tests;
