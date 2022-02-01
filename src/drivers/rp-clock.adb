--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP2040_SVD.XOSC;
with RP2040_SVD.ROSC;
with RP.Watchdog;
with RP.Reset;

package body RP.Clock is
   function CLK_SELECTED_Mask (SRC : CLK_CTRL_SRC_Field)
      return CLK_SELECTED_Field
   is (Shift_Left (1, Natural (SRC)));

   procedure Enable_XOSC
      (XOSC_Frequency     : XOSC_Hertz;
       XOSC_Startup_Delay : XOSC_Cycles)
   is
      use RP2040_SVD.XOSC;
   begin
      XOSC_Periph.CTRL.FREQ_RANGE := Val_1_15MHZ;
      XOSC_Periph.STARTUP.DELAY_k := STARTUP_DELAY_Field (XOSC_Startup_Delay / 256);
      XOSC_Periph.CTRL.ENABLE := ENABLE;
      while not XOSC_Periph.STATUS.STABLE loop
         null;
      end loop;
   end Enable_XOSC;

   procedure Enable_ROSC is
      use RP2040_SVD.ROSC;
   begin
      --  Just ensure that ROSC is enabled, don't reset it or change the
      --  frequency
      ROSC_Periph.CTRL.ENABLE := ENABLE;
      while not ROSC_Periph.STATUS.STABLE loop
         null;
      end loop;
   end Enable_ROSC;

   procedure Enable_PLL
      (Periph        : not null access PLL_Peripheral;
       Reference     : Hertz;
       Reference_Div : Natural;
       VCO_Multiple  : Positive;
       Post_Div_1    : PLL_Divider;
       Post_Div_2    : PLL_Divider)
   is
      VCO     : constant Hertz := (Reference / Reference_Div) * VCO_Multiple;
      Ref_MHz : constant Natural := Reference / 1_000_000 / Reference_Div;
      FBDIV   : constant FBDIV_INT_FBDIV_INT_Field := FBDIV_INT_FBDIV_INT_Field
         (VCO / (Reference / Reference_Div));
   begin
      if FBDIV not in 16 .. 320 then
         raise Invalid_PLL_Config with "FBDIV out of range";
      end if;

      if Ref_MHz > VCO / 16 then
         raise Invalid_PLL_Config with "Ref_MHz out of range";
      end if;

      --  Ensure PLL is stopped before configuring
      Periph.PWR := (others => <>);
      Periph.FBDIV_INT := (others => <>);

      Periph.CS :=
         (REFDIV => CS_REFDIV_Field (Reference_Div),
          others => <>);

      Periph.FBDIV_INT.FBDIV_INT := FBDIV;

      --  Turn on PLL
      Periph.PWR.PD := False;
      Periph.PWR.VCOPD := False;

      --  Wait for lock
      while not Periph.CS.LOCK loop
         null;
      end loop;

      --  Setup post dividers
      Periph.PRIM :=
         (POSTDIV1 => PRIM_POSTDIV1_Field (Post_Div_1),
          POSTDIV2 => PRIM_POSTDIV2_Field (Post_Div_2),
          others   => <>);

      --  Turn on post dividers
      Periph.PWR.POSTDIVPD := False;
   end Enable_PLL;

   procedure Initialize
      (XOSC_Frequency     : XOSC_Hertz := 0;
       XOSC_Startup_Delay : XOSC_Cycles := 12_032)
   is
      use RP.Reset;
      Has_XOSC  : constant Boolean := XOSC_Frequency > 0;
      Reference : Hertz;
   begin
      --  Enable RESUS in case things go badly
      CLOCKS_Periph.CLK_SYS_RESUS_CTRL.ENABLE := True;

      --  Enable watchdog and maybe XOSC
      if Has_XOSC then
         Reference := XOSC_Frequency;
         Enable_XOSC (XOSC_Frequency, XOSC_Startup_Delay);
      else
         Reference := ROSC_Frequency;
         Enable_ROSC;
      end if;

      RP.Watchdog.Configure (Reference);
      CLOCKS_Periph.FC0_REF_KHZ.FC0_REF_KHZ := FC0_REF_KHZ_FC0_REF_KHZ_Field (Reference / 1_000);

      --  Ensure that clk_sys = clk_ref before we reset the PLLs
      CLOCKS_Periph.CLK (SYS).CTRL.SRC := SYS_SRC_REF;
      while CLOCKS_Periph.CLK (SYS).SELECTED /= CLK_SELECTED_Mask (SYS_SRC_REF) loop
         null;
      end loop;

      --  Switch clk_ref to XOSC if available
      if Has_XOSC then
         CLOCKS_Periph.CLK (REF).CTRL.SRC := REF_SRC_XOSC; -- xosc_clksrc
         while CLOCKS_Periph.CLK (REF).SELECTED /= CLK_SELECTED_Mask (REF_SRC_XOSC) loop
            null;
         end loop;
      else
         CLOCKS_Periph.CLK (REF).CTRL.SRC := REF_SRC_ROSC;
         while CLOCKS_Periph.CLK (REF).SELECTED /= CLK_SELECTED_Mask (REF_SRC_ROSC) loop
            null;
         end loop;
      end if;
      CLOCKS_Periph.CLK (REF).DIV := (INT => 1, FRAC => 0);

      --  Reset PLLs
      Reset_Peripheral (Reset_PLL_SYS);
      Reset_Peripheral (Reset_PLL_USB);

      if Reference = 12_000_000 then
         --  PLL_SYS = (12_000_000 / 1 * 125 / 6 / 2) = 125_000_000
         --  PLL_USB = (12_000_000 / 1 *  40 / 5 / 2) =  48_000_000
         Enable_PLL (PLL_SYS_Periph'Access,
             Reference     => Reference,
             Reference_Div => 1,
             VCO_Multiple  => 125,
             Post_Div_1    => 6,
             Post_Div_2    => 2);
         Enable_PLL (PLL_USB_Periph'Access,
             Reference     => Reference,
             Reference_Div => 1,
             VCO_Multiple  => 40,
             Post_Div_1    => 5,
             Post_Div_2    => 2);
      else
         --  TODO: calculate PLL dividers for other clk_ref frequencies
         raise Invalid_PLL_Config with "unsupported clk_ref frequency";
      end if;

      --  Switch clk_sys to pll_sys
      CLOCKS_Periph.CLK (SYS).DIV := (INT => 1, FRAC => 0);
      CLOCKS_Periph.CLK (SYS).CTRL.AUXSRC := PLL_SYS;
      CLOCKS_Periph.CLK (SYS).CTRL.SRC := SYS_SRC_AUX;
      while CLOCKS_Periph.CLK (SYS).SELECTED /= CLK_SELECTED_Mask (SYS_SRC_AUX) loop
         null;
      end loop;

      --  Switch clk_usb to pll_usb
      CLOCKS_Periph.CLK (USB).DIV.INT := 1;
      CLOCKS_Periph.CLK (USB).CTRL.AUXSRC := PLL_SYS; -- the AUXSRC enum has the wrong name for some registers
      while CLOCKS_Periph.CLK (USB).SELECTED /= CLK_SELECTED_Mask (USB_SRC_USB) loop
         null;
      end loop;

      --  Switch clk_adc to pll_usb
      CLOCKS_Periph.CLK (ADC).DIV.INT := 1;
      CLOCKS_Periph.CLK (ADC).CTRL.AUXSRC := PLL_SYS;
      while CLOCKS_Periph.CLK (ADC).SELECTED /= CLK_SELECTED_Mask (ADC_SRC_USB) loop
         null;
      end loop;

      --  Switch clk_rtc to clk_xosc / 256 = 46_875 Hz
      CLOCKS_Periph.CLK (RTC).DIV :=
         (INT  => CLK_DIV_INT_Field (XOSC_Frequency / 46_875),
          FRAC => 0);
      CLOCKS_Periph.CLK (RTC).CTRL.AUXSRC := PLL_USB;
      --  PLL_USB is actually XOSC here, CLK_RTC_CTRL_AUXSRC is different from the others.
      --  clk_rtc SELECTED is hardwired, no point in polling it.

      --  Switch clk_peri to pll_sys
      CLOCKS_Periph.CLK (PERI).CTRL.AUXSRC := PLL_SYS;
      while CLOCKS_Periph.CLK (PERI).SELECTED /= CLK_SELECTED_Mask (PERI_SRC_SYS) loop
         null;
      end loop;
   end Initialize;

   procedure Enable
      (CID : Clock_Id)
   is
   begin
      CLOCKS_Periph.CLK (CID).CTRL.ENABLE := True;
   end Enable;

   procedure Disable
      (CID : Clock_Id)
   is
   begin
      CLOCKS_Periph.CLK (CID).CTRL.ENABLE := False;
   end Disable;

   procedure Set_Source
      (GP     : GP_Output;
       Source : GP_Source)
   is
      AUXSRC : CLK_CTRL_AUXSRC_Field renames CLOCKS_Periph.CLK (GP).CTRL.AUXSRC;
   begin
      case Source is
         when REF =>
            AUXSRC := REF;
         when SYS =>
            AUXSRC := SYS;
         when USB =>
            AUXSRC := USB;
         when ADC =>
            AUXSRC := ADC;
         when RTC =>
            AUXSRC := RTC;
         when PLL_SYS =>
            AUXSRC := PLL_SYS;
         when GPIN0 =>
            AUXSRC := GPIN0;
         when GPIN1 =>
            AUXSRC := GPIN1;
         when PLL_USB =>
            AUXSRC := PLL_USB;
         when ROSC =>
            AUXSRC := ROSC;
         when XOSC =>
            AUXSRC := XOSC;
         when PERI =>
            --  PERI has no divider, so just copy it's AUXSRC
            AUXSRC := CLOCKS_Periph.CLK (PERI).CTRL.AUXSRC;
      end case;

      --  Output clock with 50% duty cycle
      CLOCKS_Periph.CLK (GP).CTRL.DC50 := True;
   end Set_Source;

   procedure Set_Divider
      (GP  : GP_Output;
       Div : GP_Divider)
   is
   begin
      CLOCKS_Periph.CLK (GP).DIV := To_CLK_DIV (Div);
   end Set_Divider;

   function Enabled
      (CID : Clock_Id)
      return Boolean
   is (CLOCKS_Periph.CLK (CID).CTRL.ENABLE);

   function Frequency
      (CID      : Countable_Clock_Id;
       Rounded  : Boolean := True;
       Accuracy : UInt4 := 15)
      return Hertz
   is
      use type RP2040_SVD.CLOCKS.FC0_SRC_FC0_SRC_Field;
      F : Hertz;
   begin
      CLOCKS_Periph.FC0_INTERVAL.FC0_INTERVAL := Accuracy;

      case CID is
         when REF  => CLOCKS_Periph.FC0_SRC.FC0_SRC := clk_ref;
         when SYS  => CLOCKS_Periph.FC0_SRC.FC0_SRC := clk_sys;
         when PERI => CLOCKS_Periph.FC0_SRC.FC0_SRC := clk_peri;
         when USB  => CLOCKS_Periph.FC0_SRC.FC0_SRC := clk_usb;
         when ADC  => CLOCKS_Periph.FC0_SRC.FC0_SRC := clk_adc;
         when RTC  => CLOCKS_Periph.FC0_SRC.FC0_SRC := clk_rtc;
      end case;

      while not CLOCKS_Periph.FC0_STATUS.DONE loop
         null;
      end loop;

      if CLOCKS_Periph.FC0_STATUS.DIED then
         return 0;
      else
         F := Hertz (CLOCKS_Periph.FC0_RESULT.KHZ) * 1_000;
         if Rounded then
            return F;
         else
            --  FRAC is 5 bits, 1.0/2**5 = 0.03125
            return F + ((Hertz (CLOCKS_Periph.FC0_RESULT.FRAC) * 3125) / 100);
         end if;
      end if;
   end Frequency;

   function ROSC_Frequency
      return Hertz
   is (12_000_000);
end RP.Clock;
