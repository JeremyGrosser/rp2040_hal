--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with AUnit.Assertions; use AUnit.Assertions;
with RP2040_SVD;
with RP.Timer.Interrupts;
with RP.I2C_Master;
with RP.GPIO;
with HAL.I2C; use HAL.I2C;
with HAL; use HAL;

package body I2CM_Tests is

   I2CM0_SDA : aliased RP.GPIO.GPIO_Point := (Pin => 0);
   I2CM0_SCL : aliased RP.GPIO.GPIO_Point := (Pin => 1);
   IC : aliased RP.I2C_Master.I2C_Peripheral
      with Import, Address => RP2040_SVD.I2C0_Base;
   I2CM0 : RP.I2C_Master.I2C_Master_Port (0, IC'Access);
   Timer : RP.Timer.Interrupts.Delays;

   Target_Addr : constant I2C_Address := 2#1010_0000#; --  24FC64F with A0,A1,A2=GND
   Bad_Addr    : constant I2C_Address := 2#0101_0000#; --  no device at this address

   overriding
   procedure Set_Up
      (T : in out I2CM_Test)
   is
      use RP.GPIO;
   begin
      I2CM0_SDA.Configure (Output, Pull_Up, RP.GPIO.I2C, Schmitt => True);
      I2CM0_SCL.Configure (Output, Pull_Up, RP.GPIO.I2C, Schmitt => True);
      I2CM0.Configure (400_000);
      Timer.Enable;
   end Set_Up;

   procedure Test_Master_Transmit
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      Data_1 : constant I2C_Data (1 .. 1) := (1 => 16#00#);
      Data_2 : constant I2C_Data (1 .. 2) := (16#00#, 16#A2#);
      Status : I2C_Status;
   begin
      I2CM0.Master_Transmit (Bad_Addr, Data_1, Status, Timeout => 1000);
      Assert (Status = Err_Error, "Did not get error transmitting to bad address");

      I2CM0.Master_Transmit (Target_Addr, Data_1, Status, Timeout => 1000);
      Assert (Status = Ok, "Master transmit single byte");

      I2CM0.Master_Transmit (Target_Addr, Data_2, Status, Timeout => 1000);
      Assert (Status = Ok, "Master transmit multiple bytes");
   end Test_Master_Transmit;

   procedure Test_Master_Receive
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      Data_1 : I2C_Data (1 .. 1);
      Data_2 : I2C_Data (1 .. 2);
      Status : I2C_Status;
   begin
      I2CM0.Master_Receive (Bad_Addr, Data_1, Status, Timeout => 1000);
      Assert (Status = Err_Error, "Did not get error receiving from bad address");

      I2CM0.Master_Receive (Target_Addr, Data_1, Status, Timeout => 1000);
      Assert (Status = Ok, "Master receive single byte");

      I2CM0.Master_Receive (Target_Addr, Data_2, Status, Timeout => 1000);
      Assert (Status = Ok, "Master receive single byte");
   end Test_Master_Receive;

   procedure Test_Mem_Write
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      Data : I2C_Data (1 .. 32) := (others => 16#A2#);
      Status : I2C_Status;
   begin
      I2CM0.Mem_Write
         (Addr          => Target_Addr,
          Mem_Addr      => 16#00#,
          Mem_Addr_Size => Memory_Size_8b,
          Data          => Data,
          Status        => Status);
      Assert (Status = Ok, "8-bit memory write");

      Timer.Delay_Milliseconds (5);
      --  write cycle time

      Data := (others => 16#B2#);
      I2CM0.Mem_Write
         (Addr          => Target_Addr,
          Mem_Addr      => 16#0010#,
          Mem_Addr_Size => Memory_Size_16b,
          Data          => Data,
          Status        => Status);
      Assert (Status = Ok, "16-bit memory write");
   end Test_Mem_Write;

   procedure Test_Mem_Read_16
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      Mem_Addr : constant UInt16 := 16#0200#;
      Expected : constant I2C_Data (1 .. 8) := (others => 16#B4#);
      Zero     : constant I2C_Data (1 .. 8) := (others => 0);
      Data     : I2C_Data (1 .. 8) := Zero;
      Status   : I2C_Status;
   begin
      I2CM0.Mem_Write
         (Addr          => Target_Addr,
          Mem_Addr      => Mem_Addr,
          Mem_Addr_Size => Memory_Size_16b,
          Data          => Zero,
          Status        => Status);
      Assert (Status = Ok, "16-bit write zero");

      Timer.Delay_Milliseconds (5);
      --  write cycle time

      Data := (others => 16#AA#);

      I2CM0.Mem_Read
         (Addr          => Target_Addr,
          Mem_Addr      => Mem_Addr,
          Mem_Addr_Size => Memory_Size_16b,
          Data          => Data,
          Status        => Status);
      Assert (Status = Ok, "16-bit test read");
      Assert (Data = Zero, "16-bit test zero incorrect");

      I2CM0.Mem_Write
         (Addr          => Target_Addr,
          Mem_Addr      => Mem_Addr,
          Mem_Addr_Size => Memory_Size_16b,
          Data          => Expected,
          Status        => Status);
      Assert (Status = Ok, "16-bit test write data");

      Timer.Delay_Milliseconds (5);
      --  write cycle time

      I2CM0.Mem_Read
         (Addr          => Target_Addr,
          Mem_Addr      => Mem_Addr,
          Mem_Addr_Size => Memory_Size_16b,
          Data          => Data,
          Status        => Status);
      Assert (Status = Ok, "16-bit test read data");
      Assert (Data = Expected, "16-bit test data incorrect");
   end Test_Mem_Read_16;

   procedure Test_Mem_Read_8
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      Mem_Addr : constant UInt16 := 16#0020#;
      Zero     : constant I2C_Data (1 .. 32) := (others => 0);
      Data     : I2C_Data (1 .. 32) := Zero;
      Expected : I2C_Data (1 .. 32);
      Status   : I2C_Status;
   begin
      I2CM0.Mem_Write
         (Addr          => Target_Addr,
          Mem_Addr      => Mem_Addr,
          Mem_Addr_Size => Memory_Size_8b,
          Data          => Zero,
          Status        => Status);
      Assert (Status = Ok, "8-bit write zero");

      Timer.Delay_Milliseconds (5);
      --  write cycle time

      Data := (others => 16#AA#);

      I2CM0.Mem_Read
         (Addr          => Target_Addr,
          Mem_Addr      => Mem_Addr,
          Mem_Addr_Size => Memory_Size_8b,
          Data          => Data,
          Status        => Status);
      Assert (Status = Ok, "8-bit test read");
      Assert (Data = Zero, "8-bit test zero incorrect");

      --  walking bits pattern
      for I in Expected'Range loop
         Expected (I) := UInt8 ((I * 2) mod 256);
      end loop;

      I2CM0.Mem_Write
         (Addr          => Target_Addr,
          Mem_Addr      => Mem_Addr,
          Mem_Addr_Size => Memory_Size_8b,
          Data          => Expected,
          Status        => Status);
      Assert (Status = Ok, "8-bit test write pattern");

      Timer.Delay_Milliseconds (5);
      --  write cycle time

      I2CM0.Mem_Read
         (Addr          => Target_Addr,
          Mem_Addr      => Mem_Addr,
          Mem_Addr_Size => Memory_Size_8b,
          Data          => Data,
          Status        => Status);
      Assert (Status = Ok, "8-bit test read pattern");
      Assert (Data = Expected, "8-bit test pattern incorrect");
   end Test_Mem_Read_8;

   procedure Test_High_Speed
      (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      Data : I2C_Data (1 .. 32);
      Status : I2C_Status;
   begin
      for I in Data'Range loop
         Data (I) := UInt8 (I);
      end loop;

      I2CM0.Configure (1_000_000);
      I2CM0.Mem_Write
         (Addr          => Target_Addr,
          Mem_Addr      => 16#0200#,
          Mem_Addr_Size => Memory_Size_16b,
          Data          => Data,
          Status        => Status);
      Assert (Status = Ok, "1 MHz write");

      Timer.Delay_Milliseconds (5);
      --  write cycle time

      Data := (others => 16#AA#);

      I2CM0.Mem_Read
         (Addr          => Target_Addr,
          Mem_Addr      => 16#0200#,
          Mem_Addr_Size => Memory_Size_16b,
          Data          => Data,
          Status        => Status);
      Assert (Status = Ok, "1 MHz read");

      for I in Data'Range loop
         Assert (Data (I) = UInt8 (I), "1 MHz pattern check");
      end loop;
   end Test_High_Speed;

   overriding
   procedure Register_Tests
      (T : in out I2CM_Test)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Master_Transmit'Access, "Master_Transmit");
      Register_Routine (T, Test_Master_Receive'Access, "Master_Receive");
      Register_Routine (T, Test_Mem_Write'Access, "Mem_Write");
      Register_Routine (T, Test_Mem_Read_16'Access, "Mem_Read_16");
      Register_Routine (T, Test_High_Speed'Access, "High_Speed");
      --  Register_Routine (T, Test_Mem_Read_8'Access, "Mem_Read_8");
      --  8-bit pattern test fails with a 16-bit EEPROM, obviously
   end Register_Tests;

   overriding
   function Name
      (T : I2CM_Test)
      return AUnit.Message_String
   is (AUnit.Format ("RP.I2C_Master"));

end I2CM_Tests;
