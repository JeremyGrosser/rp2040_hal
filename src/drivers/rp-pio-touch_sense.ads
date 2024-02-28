--
--  Copyright (C) 2024 Fabien Chouteau <fabien.chouteau@gmail.com>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP.GPIO;

package RP.PIO.Touch_Sense
   with Preelaborate
is
   --  Capacitive touch sensing is based on change in capacitance typically
   --  introduced by the contact or proximity of the user finger(s) with a
   --  pin.
   --
   --  Using PIO, any RP2040 pin connected to ground through a large resistor
   --  (e.g. 1Mohm) can be a capacitive touch sensor.
   --
   --  The PIO program will charge the internal pin capacitor by configuring
   --  the pin as an output and set it high for a few microseconds. And then
   --  set the pin as an input and count how many cycles it takes for the
   --  capacitor to discharge through the resistor.
   --
   --  If users touch the pin, the capacitance will increase and therefore the
   --  number of cycles it takes to discharge will increase as well.

   type Touch_Sensor
     (Pin : not null access RP.GPIO.GPIO_Point;
      PIO : not null access PIO_Device;
      SM  : PIO_SM)
   is tagged private;

   --  Return True if the touch sensor is configured and ready to use
   function Initialized (This : Touch_Sensor) return Boolean;

   --  Configure the Pin, PIO and state machine for capacitive touch sensing.
   --  And set a default detection threshold based on a first measurement.
   --
   --  ASM_Offset is the location in PIO memory where the PIO assembly code
   --  will be installed.
   --
   --  Max_Count is the maximum number of loops in the PIO program for a
   --  single measure. Lowering this number will shorten the measure time
   --  in worst case (high capacitance).
   procedure Initialize (This       : in out Touch_Sensor;
                         ASM_Offset :        PIO_Address := 0;
                         Max_Count  :        HAL.UInt32  := 10_000);

   --  Trigger a measurement and return the number of cycles it took for the
   --  capacitor to discharge.
   --
   --  User touching the pin will increase capacitance, higher capacitance
   --  means higher Raw_Value.
   function Raw_Value (This : Touch_Sensor) return HAL.UInt32;

   --  Return True if Raw_Value is above the detection threshold
   function Touch (This : Touch_Sensor) return Boolean;

   --  Return the threshold for touch detection
   function Threshold (This : Touch_Sensor) return HAL.UInt32;

   --  Set threshold for touch detection
   procedure Set_Threshold (This      : in out Touch_Sensor;
                            Threshold :        HAL.UInt32);

private

   type Touch_Sensor
     (Pin : not null access RP.GPIO.GPIO_Point;
      PIO : not null access PIO_Device;
      SM  : PIO_SM)
   is tagged record
      Enabled   : Boolean := False;
      Max_Count : HAL.UInt32;
      Threshold : HAL.UInt32 := HAL.UInt32'Last;
   end record;

end RP.PIO.Touch_Sense;
