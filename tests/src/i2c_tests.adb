--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Assertions; use AUnit.Assertions;
with Ada.Text_IO;
with RP.GPIO; use RP.GPIO;

with RP2040_SVD.I2C;
with RP.I2C;  use RP.I2C;
with HAL.I2C;
with HAL;

package body I2C_Tests is

   I2C0_SDA    : aliased RP.GPIO.GPIO_Point := (Pin => 0);
   I2C0_SCL    : aliased RP.GPIO.GPIO_Point := (Pin => 1);
   I2C0        : RP.I2C.I2C_Port (0, RP2040_SVD.I2C.I2C0_Periph'Access);

   I2C1_SDA    : aliased RP.GPIO.GPIO_Point := (Pin => 2);
   I2C1_SCL    : aliased RP.GPIO.GPIO_Point := (Pin => 3);
   I2C1        : RP.I2C.I2C_Port (1, RP2040_SVD.I2C.I2C1_Periph'Access);
   Target_Addr : constant HAL.UInt7 := 16#42#;

   overriding
   procedure Set_Up
      (T : in out I2C_Test)
   is
      Controller_Config : constant I2C_Config :=
         (Role   => Controller,
          Timing => Standard_Mode);
      Target_Config : constant I2C_Config :=
         (Role   => Target,
          Timing => Standard_Mode);
   begin
      I2C0_SDA.Configure (Output, Pull_Up, RP.GPIO.I2C, Schmitt => True);
      I2C0_SCL.Configure (Output, Pull_Up, RP.GPIO.I2C, Schmitt => True);
      I2C0.Configure (Controller_Config);
      I2C0.Set_Address (Target_Addr);
      I2C0.Enable;

      I2C1_SDA.Configure (Output, Pull_Up, RP.GPIO.I2C, Schmitt => True);
      I2C1_SCL.Configure (Output, Pull_Up, RP.GPIO.I2C, Schmitt => True);
      I2C1.Configure (Target_Config);
      I2C1.Set_Address (Target_Addr);
      I2C1.Enable;
   end Set_Up;

   procedure Test_Single
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use HAL.I2C;
      use HAL;
      Data   : UInt8;
      Status : RP.I2C.I2C_Status;
   begin
      I2C1.Start_Read (1);
      I2C0.Start_Write (1);

      Data := 42;
      I2C0.Write (Data, Status);
      Assert (Status = Ok, "Controller Write error");

      Data := 0;
      I2C1.Read (Data, Status);
      Assert (Status = Ok, "Target Read error");
      Assert (Data = 42, "Target read incorrect data");

      I2C0.Start_Read (1);
      I2C1.Start_Write (1);

      Data := 55;
      I2C1.Write (Data, Status);
      Assert (Status = Ok, "Target Write error");

      Data := 0;
      I2C0.Read (Data, Status);
      Assert (Status = Ok, "Controller Read error");
      Assert (Data = 55, "Controller read incorrect data");
   end Test_Single;

   procedure Test_Multiple
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use HAL.I2C;
      use HAL;
      Data   : constant I2C_Data (1 .. 4) := (1, 2, 3, 4);
      D      : UInt8;
      Status : RP.I2C.I2C_Status;
   begin
      I2C1.Start_Read (Data'Length);
      I2C0.Start_Write (Data'Length);

      for I in Data'Range loop
         D := Data (I);
         I2C0.Write (D, Status);
         Assert (Status = Ok, "Controller Write error");
      end loop;

      for I in Data'Range loop
         I2C1.Read (D, Status);
         Assert (Status = Ok, "Target Read error");
         Assert (D = Data (I), "Target read incorrect data");
      end loop;

      I2C0.Start_Read (Data'Length);
      I2C1.Start_Write (Data'Length);

      for I in Data'Range loop
         D := Data (I);
         I2C1.Write (D, Status);
         Assert (Status = Ok, "Target Write error");
      end loop;

      for I in Data'Range loop
         I2C0.Read (D, Status);
         Assert (Status = Ok, "Controller Read error");
         Assert (D = Data (I), "Controller read incorrect data");
      end loop;
   end Test_Multiple;

   procedure Test_Repeated_Start
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use HAL.I2C;
      use HAL;
      Data   : UInt8;
      Status : RP.I2C.I2C_Status;
   begin
      I2C0.Start_Read (2, Stop => False);
      I2C1.Start_Write (2);

      I2C1.Write (8, Status);
      Assert (Status = Ok, "Target write error");
      I2C1.Write (9, Status);
      Assert (Status = Ok, "Target write error");

      I2C0.Read (Data, Status);
      Assert (Status = Ok, "Controller read error");
      Assert (Data = 8, "Controller read incorrect data");

      I2C0.Read (Data, Status);
      Assert (Status = Ok, "Controller read error");
      Assert (Data = 9, "Controller read incorrect data");

      I2C0.Start_Write (2, Stop => True);
      I2C1.Start_Read (2);

      I2C0.Write (16, Status);
      Assert (Status = Ok, "Controller write error");
      I2C0.Write (17, Status);
      Assert (Status = Ok, "Controller write error");

      I2C1.Read (Data, Status);
      Assert (Status = Ok, "Target read error");
      Assert (Data = 16, "Target read incorrect data");

      I2C1.Read (Data, Status);
      Assert (Status = Ok, "Target read error");
      Assert (Data = 17, "Target read incorrect data");
   end Test_Repeated_Start;

   procedure Test_Long_Transfer
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      use HAL.I2C;
      use HAL;
      Data   : UInt8;
      Status : RP.I2C.I2C_Status;
      Length : constant := 64;
   begin
      I2C0.Start_Write (Length, Stop => False);
      I2C1.Start_Read (Length);

      for I in 1 .. Length loop
         Data := UInt8 (I);
         I2C0.Write (Data, Status);
         Assert (Status = Ok, "Controller write error");

         I2C1.Read (Data, Status);
         Assert (Status = Ok, "Target read error");
         Assert (Data = UInt8 (I), "Target read incorrect data");
      end loop;

      I2C0.Start_Read (Length);
      I2C1.Start_Write (Length);

      for I in 1 .. Length loop
         Data := UInt8 (I);
         I2C1.Write (Data, Status);
         Assert (Status = Ok, "Target write error");

         I2C0.Read (Data, Status);
         Assert (Status = Ok, "Controller read error");
         Assert (Data = UInt8 (I), "Controller read incorrect data");
      end loop;
   end Test_Long_Transfer;

   procedure Test_Timing
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
   begin
      I2C0.Disable;
      I2C0.Set_Timing (RP.I2C.Fast_Mode);
      I2C0.Enable;

      I2C1.Disable;
      I2C1.Set_Timing (RP.I2C.Fast_Mode);
      I2C1.Enable;

      Test_Single (T);

      I2C0.Disable;
      I2C0.Set_Timing (RP.I2C.Fast_Mode_Plus);
      I2C0.Enable;

      I2C1.Disable;
      I2C1.Set_Timing (RP.I2C.Fast_Mode_Plus);
      I2C1.Enable;

      Test_Single (T);

      I2C0.Disable;
      I2C0.Set_Timing (RP.I2C.Standard_Mode);
      I2C0.Enable;

      I2C1.Disable;
      I2C1.Set_Timing (RP.I2C.Standard_Mode);
      I2C1.Enable;
   end Test_Timing;

   procedure Test_10b_Address
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      Addr : constant HAL.UInt10 := 16#230#;
   begin
      I2C0.Disable;
      I2C0.Set_Address (Addr);
      I2C0.Enable;

      I2C1.Disable;
      I2C1.Set_Address (Addr);
      I2C1.Enable;

      Test_Single (T);
   end Test_10b_Address;

   function Is_Jumper_Present
      (A, B : not null access RP.GPIO.GPIO_Point)
      return Boolean
   is
   begin
      A.Configure (Output, Pull_Up);
      B.Configure (Input, Pull_Up);

      A.Set;
      if not B.Get then
         return False;
      end if;

      A.Clear;
      if B.Get then
         return False;
      end if;

      A.Configure (Input, Pull_Up);
      return True;
   end Is_Jumper_Present;

   function Check_Pullup
      (A : not null access RP.GPIO.GPIO_Point)
      return Boolean
   is
   begin
      A.Configure (Input, Pull_Up);
      return A.Get;
   end Check_Pullup;

   function Check_Wiring
      return Boolean
   is
      use Ada.Text_IO;
   begin
      if not Is_Jumper_Present (I2C0_SDA'Access, I2C1_SDA'Access) then
         Put_Line ("SDA Jumper not present: GP0 -!- GP2");
         return False;
      end if;

      if not Is_Jumper_Present (I2C0_SCL'Access, I2C1_SCL'Access) then
         Put_Line ("SCL Jumper not present: GP1 -!- GP3");
         return False;
      end if;

      if not Check_Pullup (I2C0_SDA'Access) then
         Put_Line ("SDA pullup not present: GP0 -- R4.7K -- 3V3");
         return False;
      end if;

      if not Check_Pullup (I2C0_SCL'Access) then
         Put_Line ("SCL pullup not present: GP1 -- R4.7K -- 3V3");
         return False;
      end if;

      return True;
   end Check_Wiring;

   overriding
   procedure Register_Tests
      (T : in out I2C_Test)
   is
      use AUnit.Test_Cases.Registration;
   begin
      if Check_Wiring then
         Register_Routine (T, Test_Single'Access, "Single byte transfer");
         Register_Routine (T, Test_Multiple'Access, "Multi byte transfer");
         Register_Routine (T, Test_Repeated_Start'Access, "Repeated start");
         Register_Routine (T, Test_Long_Transfer'Access, "Long transfer");
         Register_Routine (T, Test_Timing'Access, "Timing");
         Register_Routine (T, Test_10b_Address'Access, "10-bit address");
      else
         Ada.Text_IO.Put_Line ("WARNING: External I2C wiring is incorrect, not testing I2C.");
      end if;
   end Register_Tests;

   overriding
   function Name
      (T : I2C_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.I2C"));

end I2C_Tests;
