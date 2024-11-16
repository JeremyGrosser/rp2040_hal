--
--  Copyright 2021-2024 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP2350_SVD.CLOCKS; use RP2350_SVD.CLOCKS;
with RP2350_SVD.PLL; use RP2350_SVD.PLL;
with RP2350_SVD.TICKS; use RP2350_SVD.TICKS;
with RP2350_SVD.XOSC;
with RP2350_SVD.ROSC;
with RP.Reset;

package body RP.Clock is

   procedure Enable_XOSC is
      use RP2350_SVD.XOSC;
      STATUS : STATUS_Register;
   begin
      XOSC_Periph.CTRL.FREQ_RANGE := Val_1_15MHZ;
      XOSC_Periph.CTRL.ENABLE := ENABLE;
      loop
         STATUS := XOSC_Periph.STATUS;
         exit when STATUS.STABLE;
      end loop;
   end Enable_XOSC;

   procedure Enable_ROSC is
      use RP2350_SVD.ROSC;
      STATUS : STATUS_Register;
   begin
      ROSC_Periph.CTRL.ENABLE := ENABLE;
      loop
         STATUS := ROSC_Periph.STATUS;
         exit when STATUS.STABLE;
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
      Periph.PWR :=
         (PD            => True,
          DSMPD         => True,
          POSTDIVPD     => True,
          VCOPD         => True,
          Reserved_1_1  => 0,
          Reserved_4_4  => 0,
          Reserved_6_31 => 0);

      Periph.CS :=
         (REFDIV        => Config.REFDIV,
          BYPASS        => False,
          LOCK_N        => False,
          LOCK          => False,
          Reserved_6_7  => 0,
          Reserved_9_29 => 0);

      Periph.FBDIV_INT :=
         (FBDIV_INT      => Config.FBDIV,
          Reserved_12_31 => 0);

      --  Turn on PLL
      Periph.PWR :=
         (PD            => False,
          DSMPD         => True,
          POSTDIVPD     => True,
          VCOPD         => False,
          Reserved_1_1  => 0,
          Reserved_4_4  => 0,
          Reserved_6_31 => 0);

      --  Wait for lock
      declare
         CS : CS_Register;
      begin
         loop
            CS := Periph.CS;
            exit when CS.LOCK;
         end loop;
      end;

      --  Setup post dividers
      Periph.PRIM :=
         (POSTDIV1         => Config.POSTDIV1,
          POSTDIV2         => Config.POSTDIV2,
          Reserved_0_11    => 0,
          Reserved_15_15   => 0,
          Reserved_19_31   => 0);
      Periph.PWR.POSTDIVPD := False;
   end Configure_PLL;

   procedure Init_PLLs is
      use RP.Reset;
   begin
      --  Reset PLLs
      Reset_Peripheral (Reset_PLL_SYS);
      Reset_Peripheral (Reset_PLL_USB);

      --  Assumes clk_ref = 12 MHz
      Configure_PLL (PLL_SYS, PLL_125_MHz);
      Configure_PLL (PLL_USB, PLL_48_MHz);

      --  Switch clk_sys to pll_sys (glitchless)
      CLOCKS_Periph.CLK_SYS_CTRL.AUXSRC := clksrc_pll_sys;
      CLOCKS_Periph.CLK_SYS_DIV := (INT => 1, FRAC => 0);
      CLOCKS_Periph.CLK_SYS_CTRL.SRC := clksrc_clk_sys_aux;

      --  clk_usb and clk_adc use pll_usb by default after reset, no need to
      --  configure them.

      --  Switch clk_peri to pll_sys (might glitch)
      CLOCKS_Periph.CLK_PERI_CTRL.AUXSRC := clksrc_pll_sys;
   end Init_PLLs;

   procedure Initialize
      (XOSC_Frequency     : XOSC_Hertz := 0;
       XOSC_Startup_Delay : XOSC_Cycles := 770_048)
   is
      Reference : Hertz;
   begin
      if XOSC_Frequency > 15_000_000 then
         raise Clock_Error with "Maximum XOSC_Frequency for RP2350 is 15_000_000";
      end if;

      --  Enable RESUS in case things go badly
      CLOCKS_Periph.CLK_SYS_RESUS_CTRL.ENABLE := True;

      if XOSC_Frequency > 0 then
         --  Enable XOSC, set it as clk_ref source
         RP2350_SVD.XOSC.XOSC_Periph.STARTUP.DELAY_k := RP2350_SVD.XOSC.STARTUP_DELAY_Field (XOSC_Startup_Delay / 256);
         Enable_XOSC;
         CLOCKS_Periph.CLK_REF_CTRL.SRC := xosc_clksrc;
         Reference := XOSC_Frequency;

         --  Run clk_sys directly from clk_ref while configuring PLLs
         CLOCKS_Periph.CLK_SYS_CTRL.SRC := clk_ref;

         --  Configure PLLs and select them as the source for all clocks
         Init_PLLs;
      else
         Reference := 11_000_000; --  nominal ROSC frequency, much variance
      end if;

      CLOCKS_Periph.FC0_REF_KHZ.FC0_REF_KHZ := FC0_REF_KHZ_FC0_REF_KHZ_Field (Reference / 1_000);
      TICKS_Periph.TIMER0_CTRL.ENABLE := False;
      TICKS_Periph.TIMER0_CYCLES.TIMER0_CYCLES := UInt9 (Reference / 1_000_000);
      TICKS_Periph.TIMER0_CTRL.ENABLE := True;
   end Initialize;

   procedure Enable
      (CID : Clock_Id)
   is
      P : CLOCKS_Peripheral renames CLOCKS_Periph;
   begin
      case CID is
         when GPOUT0 =>
            P.CLK_GPOUT0_CTRL.ENABLE := True;
         when GPOUT1 =>
            CLOCKS_Periph.CLK_GPOUT1_CTRL.ENABLE := True;
         when GPOUT2 =>
            CLOCKS_Periph.CLK_GPOUT2_CTRL.ENABLE := True;
         when GPOUT3 =>
            CLOCKS_Periph.CLK_GPOUT3_CTRL.ENABLE := True;
         when REF =>
            null;
         when SYS =>
            null;
         when PERI =>
            CLOCKS_Periph.CLK_PERI_CTRL.ENABLE := True;
         when USB =>
            CLOCKS_Periph.CLK_USB_CTRL.ENABLE := True;
         when ADC =>
            CLOCKS_Periph.CLK_ADC_CTRL.ENABLE := True;
         when RTC =>
            raise Clock_Error with "RTC not supported on RP2350";
         when HSTX =>
            CLOCKS_Periph.CLK_HSTX_CTRL.ENABLE := True;
         when PLL_SYS =>
            Configure_PLL (PLL_SYS, PLL_125_MHz); --  TODO correct default PLL setup
         when GPIN0 =>
            null;
         when GPIN1 =>
            null;
         when PLL_USB =>
            Configure_PLL (PLL_USB, PLL_48_MHz);
         when ROSC =>
            Enable_ROSC;
         when XOSC =>
            Enable_XOSC;
      end case;
   end Enable;

   procedure Disable
      (CID : Clock_Id)
   is
   begin
      case CID is
         when GPOUT0 =>
            CLOCKS_Periph.CLK_GPOUT0_CTRL.ENABLE := False;
         when GPOUT1 =>
            CLOCKS_Periph.CLK_GPOUT1_CTRL.ENABLE := False;
         when GPOUT2 =>
            CLOCKS_Periph.CLK_GPOUT2_CTRL.ENABLE := False;
         when GPOUT3 =>
            CLOCKS_Periph.CLK_GPOUT3_CTRL.ENABLE := False;
         when REF =>
            raise Clock_Error with "Cannot disable REF clock";
         when SYS =>
            raise Clock_Error with "Cannot disable SYS clock";
         when PERI =>
            CLOCKS_Periph.CLK_PERI_CTRL.ENABLE := False;
         when USB =>
            CLOCKS_Periph.CLK_USB_CTRL.ENABLE := False;
         when ADC =>
            CLOCKS_Periph.CLK_ADC_CTRL.ENABLE := False;
         when RTC =>
            raise Clock_Error with "RTC not supported on RP2350";
         when HSTX =>
            CLOCKS_Periph.CLK_HSTX_CTRL.ENABLE := True;
         when PLL_SYS =>
            PLL_SYS_Periph.PWR := (others => <>);
         when GPIN0 =>
            raise Clock_Error with "Cannot disable GPIN0 clock";
         when GPIN1 =>
            raise Clock_Error with "Cannot disable GPIN1 clock";
         when PLL_USB =>
            PLL_USB_Periph.PWR := (others => <>);
         when ROSC =>
            RP2350_SVD.ROSC.ROSC_Periph.CTRL.ENABLE := RP2350_SVD.ROSC.DISABLE;
         when XOSC =>
            RP2350_SVD.XOSC.XOSC_Periph.CTRL.ENABLE := RP2350_SVD.XOSC.DISABLE;
      end case;
   end Disable;

   function Enabled
      (CID : Clock_Id)
      return Boolean
   is
      use type RP2350_SVD.ROSC.CTRL_ENABLE_Field;
      use type RP2350_SVD.XOSC.CTRL_ENABLE_Field;
   begin
      case CID is
         when GPOUT0 =>
            return CLOCKS_Periph.CLK_GPOUT0_CTRL.ENABLE;
         when GPOUT1 =>
            return CLOCKS_Periph.CLK_GPOUT1_CTRL.ENABLE;
         when GPOUT2 =>
            return CLOCKS_Periph.CLK_GPOUT2_CTRL.ENABLE;
         when GPOUT3 =>
            return CLOCKS_Periph.CLK_GPOUT3_CTRL.ENABLE;
         when REF =>
            return True;
         when SYS =>
            return True;
         when PERI =>
            return CLOCKS_Periph.CLK_PERI_CTRL.ENABLE;
         when USB =>
            return CLOCKS_Periph.CLK_USB_CTRL.ENABLE;
         when ADC =>
            return CLOCKS_Periph.CLK_ADC_CTRL.ENABLE;
         when RTC =>
            raise Clock_Error with "RTC not supported on RP2350";
         when HSTX =>
            return CLOCKS_Periph.CLK_HSTX_CTRL.ENABLE;
         when PLL_SYS =>
            return not PLL_SYS_Periph.PWR.PD;
         when GPIN0 =>
            return True;
         when GPIN1 =>
            return True;
         when PLL_USB =>
            return not PLL_USB_Periph.PWR.PD;
         when ROSC =>
            return RP2350_SVD.ROSC.ROSC_Periph.CTRL.ENABLE = RP2350_SVD.ROSC.ENABLE;
         when XOSC =>
            return RP2350_SVD.XOSC.XOSC_Periph.CTRL.ENABLE = RP2350_SVD.XOSC.ENABLE;
      end case;
   end Enabled;

   procedure Set_Source
      (GP     : GP_Output;
       Source : GP_Source)
   is
   begin
      case GP is
         when GPOUT0 =>
            case Source is
               when PLL_SYS =>
                  CLOCKS_Periph.CLK_GPOUT0_CTRL.AUXSRC := clksrc_pll_sys;
               when GPIN0 =>
                  CLOCKS_Periph.CLK_GPOUT0_CTRL.AUXSRC := clksrc_gpin0;
               when GPIN1 =>
                  CLOCKS_Periph.CLK_GPOUT0_CTRL.AUXSRC := clksrc_gpin1;
               when PLL_USB =>
                  CLOCKS_Periph.CLK_GPOUT0_CTRL.AUXSRC := clksrc_pll_usb;
               when ROSC =>
                  CLOCKS_Periph.CLK_GPOUT0_CTRL.AUXSRC := rosc_clksrc;
               when XOSC =>
                  CLOCKS_Periph.CLK_GPOUT0_CTRL.AUXSRC := xosc_clksrc;
               when SYS =>
                  CLOCKS_Periph.CLK_GPOUT0_CTRL.AUXSRC := clk_sys;
               when USB =>
                  CLOCKS_Periph.CLK_GPOUT0_CTRL.AUXSRC := clk_usb;
               when ADC =>
                  CLOCKS_Periph.CLK_GPOUT0_CTRL.AUXSRC := clk_adc;
               when RTC =>
                  raise Clock_Error with "RTC not supported on RP2350";
               when REF =>
                  CLOCKS_Periph.CLK_GPOUT0_CTRL.AUXSRC := clk_ref;
               when PERI =>
                  CLOCKS_Periph.CLK_GPOUT0_CTRL.AUXSRC := clk_peri;
               when HSTX =>
                  CLOCKS_Periph.CLK_GPOUT0_CTRL.AUXSRC := clk_hstx;
               --  Not mapped in RP.Clock:
               --  lposc_clksrc
               --  clksrc_pll_usb_primary_ref_opcg
               --  otp_clk2fc
            end case;
         when others =>
            raise Clock_Error with "Not implemented";
      end case;
   end Set_Source;

   procedure Set_Divider
      (GP  : GP_Output;
       Div : GP_Divider)
   is
   begin
      raise Clock_Error with "Not implemented";
   end Set_Divider;

   function Frequency
      (CID      : Countable_Clock_Id;
       Rounded  : Boolean := True;
       Accuracy : UInt4 := 15)
      return Hertz
   is
      F : Hertz;
   begin
      CLOCKS_Periph.FC0_INTERVAL.FC0_INTERVAL := Accuracy;

      case CID is
         when REF  => CLOCKS_Periph.FC0_SRC.FC0_SRC := clk_ref;
         when SYS  => CLOCKS_Periph.FC0_SRC.FC0_SRC := clk_sys;
         when PERI => CLOCKS_Periph.FC0_SRC.FC0_SRC := clk_peri;
         when USB  => CLOCKS_Periph.FC0_SRC.FC0_SRC := clk_usb;
         when ADC  => CLOCKS_Periph.FC0_SRC.FC0_SRC := clk_adc;
         when RTC  => raise Clock_Error with "RTC not supported on RP2350";
         when HSTX => CLOCKS_Periph.FC0_SRC.FC0_SRC := clk_hstx;
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
   is (11_000_000);

end RP.Clock;
