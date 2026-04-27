--
--  Copyright (C) 2022 Fabien Chouteau <fabien.chouteau@gmail.com>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP.PIO.Touch_Sense_Discharge_PIO; use RP.PIO.Touch_Sense_Discharge_PIO;
with RP.PIO.Touch_Sense_Charge_PIO; use RP.PIO.Touch_Sense_Charge_PIO;

package body RP.PIO.Touch_Sense is

   function Initialized (This : Touch_Sensor) return Boolean
   is (This.Enabled);

   procedure Initialize (This       : in out Touch_Sensor;
                         ASM_Offset :        PIO_Address := 0;
                         Max_Count  :        HAL.UInt32  := 10_000;
                         Mode       :        Touch_Mode  := Discharge)
   is
      Config : PIO_SM_Config := Default_SM_Config;
   begin
      This.Max_Count := Max_Count;

      case Mode is
         when Discharge =>
            Load
              (This   => This.PIO,
               Prog   => Touch_Sense_Discharge_Program_Instructions,
               Offset => ASM_Offset);
         when Charge =>
            Load
              (This   => This.PIO,
               Prog   => Touch_Sense_Charge_Program_Instructions,
               Offset => ASM_Offset);
      end case;

      RP.GPIO.Configure (This.Pin.all, RP.GPIO.Output, RP.GPIO.Floating, RP.PIO.GPIO_Function (This.PIO));

      Set_Jmp_Pin (Config, This.Pin.Pin);
      Set_Set_Pins (Config, This.Pin.Pin, 1);

      case Mode is
         when Discharge =>
            Set_Wrap (Config,
                      ASM_Offset + Touch_Sense_Discharge_Wrap_Target,
                      ASM_Offset + Touch_Sense_Discharge_Wrap);

         when Charge =>
            Set_Wrap (Config,
                      ASM_Offset + Touch_Sense_Charge_Wrap_Target,
                      ASM_Offset + Touch_Sense_Charge_Wrap);
      end case;

      Set_Clock_Frequency (Config, 125_000_000);
      SM_Initialize (This.PIO, This.SM, ASM_Offset, Config);
      Set_Enabled (This.PIO, This.SM, True);

      This.Enabled := True;

      --  Do a first read to set a default threshold
      This.Threshold := This.Raw_Value + 200;
   end Initialize;

   function Raw_Value (This : Touch_Sensor) return HAL.UInt32 is
      Data : HAL.UInt32;
   begin
      if not This.Enabled then
         return 0;
      else
         Put (This.PIO, This.SM, This.Max_Count);
         Get (This.PIO, This.SM, Data);
         return This.Max_Count - Data;
      end if;
   end Raw_Value;

   function Touch (This : Touch_Sensor) return Boolean
   is (This.Raw_Value > This.Threshold);

   function Threshold (This : Touch_Sensor) return HAL.UInt32
   is (This.Threshold);

   procedure Set_Threshold (This      : in out Touch_Sensor;
                            Threshold :        HAL.UInt32)
   is
   begin
      This.Threshold := Threshold;
   end Set_Threshold;

end RP.PIO.Touch_Sense;
