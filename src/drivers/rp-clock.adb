--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP2040_SVD.XOSC;
with RP2040_SVD.ROSC;
with RP2040_SVD.WATCHDOG;
with RP.Watchdog;
with RP.Reset;

package body RP.Clock is
   function CLK_SELECTED_Mask (SRC : CLK_CTRL_SRC_Field)
      return CLK_SELECTED_Field
   is (Shift_Left (1, Natural (SRC)));

   procedure Enable_XOSC is
      use RP2040_SVD.XOSC;
   begin
      XOSC_Periph.CTRL.FREQ_RANGE := Val_1_15MHZ;
      XOSC_Periph.CTRL.ENABLE := ENABLE;
      while not XOSC_Periph.STATUS.STABLE loop
         null;
      end loop;
   end Enable_XOSC;

   procedure Enable_ROSC is
      use RP2040_SVD.ROSC;
   begin
      ROSC_Periph.CTRL.ENABLE := ENABLE;
      while not ROSC_Periph.STATUS.STABLE loop
         null;
      end loop;
   end Enable_ROSC;

   procedure Configure_PLL
      (PLL    : PLL_Clock_Id;
       Config : PLL_Config)
   is
      Periph : constant access PLL_Peripheral :=
         (if PLL = PLL_SYS then PLL_SYS_Periph'Access else PLL_USB_Periph'Access);
   begin
      --  Ensure PLL is stopped before configuring
      Periph.PWR := (others => <>);

      Periph.CS.REFDIV := Config.REFDIV;
      Periph.FBDIV_INT.FBDIV_INT := Config.FBDIV;

      --  Turn on PLL
      Periph.PWR.PD := False;
      Periph.PWR.VCOPD := False;

      --  Wait for lock
      while not Periph.CS.LOCK loop
         null;
      end loop;

      --  Setup post dividers
      Periph.PRIM.POSTDIV1 := Config.POSTDIV1;
      Periph.PRIM.POSTDIV2 := Config.POSTDIV2;
      Periph.PWR.POSTDIVPD := False;
   end Configure_PLL;

   procedure Init_PLLs
      (XOSC_Frequency : Hertz)
   is
      use RP.Reset;
   begin
      --  Reset PLLs
      Reset_Peripheral (Reset_PLL_SYS);
      Reset_Peripheral (Reset_PLL_USB);

      --  Assumes clk_ref = 12 MHz
      Configure_PLL (PLL_SYS, PLL_125_MHz);
      Configure_PLL (PLL_USB, PLL_48_MHz);

      --  Switch clk_sys to pll_sys
      Set_SYS_Source (PLL_SYS);

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
   end Init_PLLs;

   procedure Initialize
      (XOSC_Frequency     : XOSC_Hertz := 0;
       XOSC_Startup_Delay : XOSC_Cycles := 770_048)
   is
      use RP2040_SVD.WATCHDOG;
      Reference : Hertz;
   begin
      --  Enable RESUS in case things go badly
      CLOCKS_Periph.CLK_SYS_RESUS_CTRL.ENABLE := True;

      --  If clocks aren't stable in 100ms, reset
      RP.Watchdog.Configure (Timeout => 100);

      --  Enable watchdog and maybe XOSC
      if XOSC_Frequency > 0 then
         Reference := XOSC_Frequency;
         RP2040_SVD.XOSC.XOSC_Periph.STARTUP.DELAY_k := RP2040_SVD.XOSC.STARTUP_DELAY_Field (XOSC_Startup_Delay / 256);
         Set_SYS_Source (XOSC);
         Disable (ROSC);
         Init_PLLs (XOSC_Frequency);
      else
         Reference := ROSC_Frequency;
         Set_SYS_Source (ROSC);
         Disable (PLL_SYS);
         Disable (PLL_USB);
         Disable (XOSC);
      end if;

      WATCHDOG_Periph.TICK :=
         (ENABLE => True,
          CYCLES => TICK_CYCLES_Field (Reference / 1_000_000),
          others => <>);

      CLOCKS_Periph.FC0_REF_KHZ.FC0_REF_KHZ := FC0_REF_KHZ_FC0_REF_KHZ_Field (Reference / 1_000);

      RP.Watchdog.Disable;
   end Initialize;

   procedure Enable
      (CID : Clock_Id)
   is
   begin
      CLOCKS_Periph.CLK (CID).CTRL.ENABLE := True;
      case CID is
         when ROSC =>
            Enable_ROSC;
         when XOSC =>
            Enable_XOSC;
         when others =>
            null;
      end case;
   end Enable;

   procedure Disable
      (CID : Clock_Id)
   is
   begin
      if CID in CLOCKS_Periph.CLK'Range then
         CLOCKS_Periph.CLK (CID).CTRL.ENABLE := False;
      end if;

      case CID is
         when PLL_USB =>
            PLL_USB_Periph.PWR := (others => <>);
         when PLL_SYS =>
            PLL_SYS_Periph.PWR := (others => <>);
         when ROSC =>
            RP2040_SVD.ROSC.ROSC_Periph.CTRL.ENABLE := RP2040_SVD.ROSC.DISABLE;
         when XOSC =>
            RP2040_SVD.XOSC.XOSC_Periph.CTRL.ENABLE := RP2040_SVD.XOSC.DISABLE;
         when others =>
            null;
      end case;
   end Disable;

   procedure Set_Source
      (GP     : GP_Output;
       Source : GP_Source)
   is
      AUXSRC : CLK_CTRL_AUXSRC_Field
         with Volatile, Address => CLOCKS_Periph.CLK (GP).CTRL.AUXSRC'Address;
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
   is (6_500_000);

   procedure Set_SYS_Source
      (Source : SYS_Clock_Id)
   is
      SRC : CLK_CTRL_SRC_Field;
   begin
      case Source is
         when PLL_SYS =>
            CLOCKS_Periph.CLK (SYS).CTRL.AUXSRC := PLL_SYS;
            CLOCKS_Periph.CLK (SYS).DIV := (INT => 1, FRAC => 0);
            SRC := SYS_SRC_AUX;
         when GPIN0 =>
            CLOCKS_Periph.CLK (SYS).CTRL.AUXSRC := GPIN0;
            CLOCKS_Periph.CLK (SYS).DIV := (INT => 1, FRAC => 0);
            SRC := SYS_SRC_AUX;
         when GPIN1 =>
            CLOCKS_Periph.CLK (SYS).CTRL.AUXSRC := GPIN1;
            CLOCKS_Periph.CLK (SYS).DIV := (INT => 1, FRAC => 0);
            SRC := SYS_SRC_AUX;
         when PLL_USB =>
            CLOCKS_Periph.CLK (SYS).CTRL.AUXSRC := USB;
            CLOCKS_Periph.CLK (SYS).DIV := (INT => 1, FRAC => 0);
            SRC := SYS_SRC_AUX;
         when ROSC =>
            Enable_ROSC;
            CLOCKS_Periph.CLK (REF).CTRL.SRC := REF_SRC_ROSC;
            CLOCKS_Periph.CLK (REF).DIV := (INT => 1, FRAC => 0);
            SRC := SYS_SRC_REF;
         when XOSC =>
            Enable_XOSC;
            CLOCKS_Periph.CLK (REF).CTRL.SRC := REF_SRC_XOSC;
            CLOCKS_Periph.CLK (REF).DIV := (INT => 1, FRAC => 0);
            SRC := SYS_SRC_REF;
      end case;

      CLOCKS_Periph.CLK (SYS).CTRL.SRC := SRC;
      while CLOCKS_Periph.CLK (SYS).SELECTED /= CLK_SELECTED_Mask (SRC) loop
         null;
      end loop;
   end Set_SYS_Source;

end RP.Clock;
