--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP2040_SVD.CLOCKS; use RP2040_SVD.CLOCKS;
with RP2040_SVD.PLL; use RP2040_SVD.PLL;
with RP2040_SVD;
with HAL; use HAL;

package RP.Clock
   with Preelaborate
is
   subtype XOSC_Hertz is Hertz range 0 .. 15_000_000
      with Static_Predicate => XOSC_Hertz in 0 | 1_000_000 .. 15_000_000;
   --  The special value 0 indicates that the XOSC is not available.

   subtype XOSC_Cycles is Natural;

   procedure Initialize
      (XOSC_Frequency     : XOSC_Hertz := 0;
       XOSC_Startup_Delay : XOSC_Cycles := 770_048) --  ~64ms with a 12 MHz crystal
       with Pre => XOSC_Startup_Delay <= (Natural (UInt14'Last) * 256)
               and XOSC_Startup_Delay mod 256 = 0;
   --  See 2.16.3 Startup Delay for XOSC_Startup_Delay calculation. The default
   --  value is approximately 1ms with a 12 MHz crystal.

   --  Currently we have hardcoded PLL divider values for 12 MHz ROSC or XOSC
   --  operation. This exception is thrown if any other reference frequency is
   --  given or Enable_PLL is called with invalid arguments.
   Invalid_PLL_Config : exception;

   type Clock_Id is
      (GPOUT0, GPOUT1, GPOUT2, GPOUT3, REF, SYS, PERI, USB, ADC, RTC,
       PLL_SYS, GPIN0, GPIN1, PLL_USB, ROSC, XOSC);

   procedure Enable
      (CID : Clock_Id);

   procedure Disable
      (CID : Clock_Id);

   subtype GP_Output is Clock_Id range GPOUT0 .. GPOUT3;
   subtype GP_Source is Clock_Id range REF .. XOSC;

   procedure Set_Source
      (GP     : GP_Output;
       Source : GP_Source);
   --  GP will glitch if enabled while changing sources

   GP_Divider_Fraction : constant := 1.0 / (2 ** 8);
   type GP_Divider is delta GP_Divider_Fraction range 0.0 .. (2.0 ** 24) - GP_Divider_Fraction
      with Small => GP_Divider_Fraction,
           Size  => 32;
   --  If GP_Divider is 0.0, then it represents (2.0 ** 16)

   procedure Set_Divider
      (GP  : GP_Output;
       Div : GP_Divider);

   function Enabled
      (CID : Clock_Id)
      return Boolean;

   subtype SYS_Clock_Id is Clock_Id range PLL_SYS .. XOSC;
   procedure Set_SYS_Source
      (Source : SYS_Clock_Id);

   subtype PLL_Clock_Id is Clock_Id
      with Static_Predicate => PLL_Clock_Id in PLL_SYS | PLL_USB;
   subtype PLL_FREF_Field is Hertz range 5_000_000 .. 800_000_000;
   subtype PLL_REFDIV_Field is UInt6 range 1 .. 63;
   subtype PLL_FBDIV_Field is UInt12 range 16 .. 320;
   subtype PLL_POSTDIV_Field is UInt3 range 1 .. 7;
   type PLL_Config is record
      FREF     : PLL_FREF_Field;
      REFDIV   : PLL_REFDIV_Field;
      FBDIV    : PLL_FBDIV_Field;
      POSTDIV1 : PLL_POSTDIV_Field;
      POSTDIV2 : PLL_POSTDIV_Field;
   end record;
   --  2.18.2. Calculating PLL parameters
   --  PLL = (FREF / REFDIV) * FBDIV / (POSTDIV1 / POSTDIV2)
   --  Common configurations are included below.
   --  Use pico-sdk/src/rp2_common/hardware_clocks/scripts/vcocalc.py

   PLL_48_MHz : constant PLL_Config :=
      (FREF     => 12_000_000,
       REFDIV   => 1,
       FBDIV    => 64,
       POSTDIV1 => 4,
       POSTDIV2 => 4);

   PLL_125_MHz : constant PLL_Config :=
      (FREF     => 12_000_000,
       REFDIV   => 1,
       FBDIV    => 125,
       POSTDIV1 => 6,
       POSTDIV2 => 2);

   PLL_133_MHz : constant PLL_Config :=
      (FREF     => 12_000_000,
       REFDIV   => 1,
       FBDIV    => 133,
       POSTDIV1 => 6,
       POSTDIV2 => 2);

   PLL_250_MHz : constant PLL_Config :=
      (FREF     => 12_000_000,
       REFDIV   => 1,
       FBDIV    => 125,
       POSTDIV1 => 6,
       POSTDIV2 => 1);

   procedure Configure_PLL
      (PLL    : PLL_Clock_Id;
       Config : PLL_Config)
   with Pre => Config.POSTDIV1 >= Config.POSTDIV2
               and (Integer (Config.FREF) / Integer (Config.REFDIV)) >= 5_000_000
               and (Integer (Config.FREF) / Integer (Config.REFDIV)) * Integer (Config.FBDIV)
                  in 400_000_000 .. 1_600_000_000;
   --  Remember to switch clk_sys to another source before modifying PLL_SYS

   subtype Countable_Clock_Id is Clock_Id range REF .. RTC;
   function Frequency
      (CID      : Countable_Clock_Id;
       Rounded  : Boolean := True;
       Accuracy : UInt4 := 15)
       return Hertz;
   --  By default, the fractional part of the frequency counter result register
   --  is ignored. Setting Rounded = False includes the fractional frequency,
   --  which may include as much as 2048 KHz of error, depending on the
   --  value of Accuracy. Higher Accuracy values take longer to measure the
   --  clock, but produce more accurate results.

   --  ROSC can vary from 1 .. 12 MHz. Assume that ROSC is running at the
   --  maximum ROSC frequency to avoid unintentional overclocking.
   --
   --  TODO: measure ROSC with the internal frequency counter and temperature
   --        sensor, then update this value before enabling PLLs
   --  2.15.2.1.1. Mitigating ROSC frequency variation due to process
   function ROSC_Frequency return Hertz;

end RP.Clock;
