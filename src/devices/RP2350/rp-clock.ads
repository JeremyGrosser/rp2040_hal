--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with HAL; use HAL;

package RP.Clock
   with Preelaborate
is
   type GP_Output is
      (GPOUT0, GPOUT1, GPOUT2, GPOUT3);
   type GP_Source is
      (PLL_SYS, GPIN0, GPIN1, PLL_USB, PLL_USB_REF_OPCG, ROSC, XOSC,
       LPOSC, SYS, USB, ADC, REF, PERI, HSTX, CLK2FC)
   with Size => 4;

   GP_Divider_Fraction : constant := 1.0 / (2 ** 16);
   type GP_Divider is delta GP_Divider_Fraction
      range 0.0 .. (2.0 ** 16) - GP_Divider_Fraction
      with Small => GP_Divider_Fraction,
           Size => 32;
   --  If GP_Divider is 0.0, then it represents (2.0 ** 16)

   procedure Set_Divider
      (GP  : GP_Output;
       Div : GP_Divider);

   procedure Set_Source
      (GP     : GP_Output;
       Source : GP_Source);
   --  GP will glitch if enabled while changing sources

   procedure Enable
      (CID : GP_Output);

   procedure Disable
      (CID : GP_Output);

   function Enabled
      (CID : GP_Output)
      return Boolean;

   type FC_Source is
      (DISABLED, PLL_SYS, PLL_USB, ROSC, ROSC_PH, XOSC, GPIN0, GPIN1,
       REF, SYS, PERI, USB, ADC, HSTX, LPOSC, OTP_CLK2FC, PLL_USB_DFT)
   with Size => 32;

   function Frequency
      (CID      : FC_Source;
       Rounded  : Boolean := True;
       Accuracy : UInt4 := 15)
       return Hertz;
   --  By default, the fractional part of the frequency counter result register
   --  is ignored. Setting Rounded = False includes the fractional frequency,
   --  which may include as much as 2048 KHz of error, depending on the
   --  value of Accuracy. Higher Accuracy values take longer to measure the
   --  clock, but produce more accurate results.

   procedure Enable_PERI;
end RP.Clock;
