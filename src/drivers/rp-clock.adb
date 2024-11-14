--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with Ada.Unchecked_Conversion;
with RP2040_SVD.XOSC;
with RP2040_SVD.ROSC;
with RP2040_SVD.WATCHDOG;
with RP.Watchdog;
with RP.Reset;

package body RP.Clock is
   procedure Enable_ROSC;

   procedure Enable_XOSC;

   type CLK_CTRL_AUXSRC_Field is
      (PLL_SYS, GPIN0, GPIN1, PLL_USB, ROSC, XOSC, SYS, USB, ADC, RTC, REF)
      with Size => 4;
   for CLK_CTRL_AUXSRC_Field use
      (PLL_SYS => 0,
       GPIN0   => 1,
       GPIN1   => 2,
       PLL_USB => 3,
       ROSC    => 4,
       XOSC    => 5,
       SYS     => 6,
       USB     => 7,
       ADC     => 8,
       RTC     => 9,
       REF     => 10);

   --  SRC can only be set for REF and SYS and has different meanings for both
   subtype CLK_CTRL_SRC_Field is UInt2;
   REF_SRC_ROSC : constant CLK_CTRL_SRC_Field := 0;
   --  REF_SRC_AUX  : constant CLK_CTRL_SRC_Field := 1;
   REF_SRC_XOSC : constant CLK_CTRL_SRC_Field := 2;
   SYS_SRC_REF  : constant CLK_CTRL_SRC_Field := 0;
   SYS_SRC_AUX  : constant CLK_CTRL_SRC_Field := 1;
   USB_SRC_USB  : constant CLK_CTRL_SRC_Field := 0;
   ADC_SRC_USB  : constant CLK_CTRL_SRC_Field := 0;
   PERI_SRC_SYS : constant CLK_CTRL_SRC_Field := 0;

   subtype CLK_CTRL_PHASE_Field is UInt2;

   type CLK_CTRL_Register is record
      AUXSRC : CLK_CTRL_AUXSRC_Field := PLL_SYS;
      SRC    : CLK_CTRL_SRC_Field := 0;
      KILL   : Boolean := False;
      ENABLE : Boolean := False;
      DC50   : Boolean := False;
      PHASE  : CLK_CTRL_PHASE_Field := 0;
      NUDGE  : Boolean := False;
   end record
      with Volatile_Full_Access, Object_Size => 32;
   for CLK_CTRL_Register use record
      SRC    at 0 range 0 .. 1;
      AUXSRC at 0 range 5 .. 8;
      KILL   at 0 range 10 .. 10;
      ENABLE at 0 range 11 .. 11;
      DC50   at 0 range 12 .. 12;
      PHASE  at 0 range 16 .. 17;
      NUDGE  at 0 range 20 .. 20;
   end record;

   subtype CLK_DIV_INT_Field is UInt24;
   subtype CLK_DIV_FRAC_Field is UInt8;

   type CLK_DIV_Register is record
      INT  : CLK_DIV_INT_Field := 1;
      FRAC : CLK_DIV_FRAC_Field := 0;
   end record
      with Volatile_Full_Access, Object_Size => 32;
   for CLK_DIV_Register use record
      INT  at 0 range 8 .. 31;
      FRAC at 0 range 0 .. 7;
   end record;

   function To_CLK_DIV is new Ada.Unchecked_Conversion
      (Source => GP_Divider,
       Target => CLK_DIV_Register);

   subtype CLK_SELECTED_Field is UInt32;
   function CLK_SELECTED_Mask (SRC : CLK_CTRL_SRC_Field)
      return CLK_SELECTED_Field;

   type CLK_Register is record
      CTRL     : CLK_CTRL_Register;
      DIV      : CLK_DIV_Register;
      SELECTED : CLK_SELECTED_Field;
   end record
      with Size => (3 * 32),
           Volatile;

   for CLK_Register use record
      CTRL     at 0 range 0 .. 31;
      DIV      at 0 range 32 .. 63;
      SELECTED at 0 range 64 .. 95;
   end record;

   type CLK_Array is array (Clock_Id range GPOUT0 .. RTC) of CLK_Register;

   type CLOCKS_Peripheral is record
      CLK                  : aliased CLK_Array;
      CLK_SYS_RESUS_CTRL   : aliased CLK_SYS_RESUS_CTRL_Register;
      CLK_SYS_RESUS_STATUS : aliased CLK_SYS_RESUS_STATUS_Register;
      --  Reference clock frequency in kHz
      FC0_REF_KHZ          : aliased FC0_REF_KHZ_Register;
      --  Minimum pass frequency in kHz. This is optional. Set to 0 if you are
      --  not using the pass/fail flags
      FC0_MIN_KHZ          : aliased FC0_MIN_KHZ_Register;
      --  Maximum pass frequency in kHz. This is optional. Set to 0x1ffffff if
      --  you are not using the pass/fail flags
      FC0_MAX_KHZ          : aliased FC0_MAX_KHZ_Register;
      --  Delays the start of frequency counting to allow the mux to settle\n
      --  Delay is measured in multiples of the reference clock period
      FC0_DELAY            : aliased FC0_DELAY_Register;
      --  The test interval is 0.98us * 2**interval, but let's call it 1us *
      --  2**interval\n The default gives a test interval of 250us
      FC0_INTERVAL         : aliased FC0_INTERVAL_Register;
      --  Clock sent to frequency counter, set to 0 when not required\n Writing
      --  to this register initiates the frequency count
      FC0_SRC              : aliased FC0_SRC_Register;
      --  Frequency counter status
      FC0_STATUS           : aliased FC0_STATUS_Register;
      --  Result of frequency measurement, only valid when status_done=1
      FC0_RESULT           : aliased FC0_RESULT_Register;
      --  enable clock in wake mode
      WAKE_EN0             : aliased WAKE_EN0_Register;
      --  enable clock in wake mode
      WAKE_EN1             : aliased WAKE_EN1_Register;
      --  enable clock in sleep mode
      SLEEP_EN0            : aliased SLEEP_EN0_Register;
      --  enable clock in sleep mode
      SLEEP_EN1            : aliased SLEEP_EN1_Register;
      --  indicates the state of the clock enable
      ENABLED0             : aliased ENABLED0_Register;
      --  indicates the state of the clock enable
      ENABLED1             : aliased ENABLED1_Register;
      --  Raw Interrupts
      INTR                 : aliased INTR_Register;
      --  Interrupt Enable
      INTE                 : aliased INTE_Register;
      --  Interrupt Force
      INTF                 : aliased INTF_Register;
      --  Interrupt status after masking & forcing
      INTS                 : aliased INTS_Register;
   end record
     with Volatile;

   for CLOCKS_Peripheral use record
      CLK                  at 16#00# range 0 .. 959;
      CLK_SYS_RESUS_CTRL   at 16#78# range 0 .. 31;
      CLK_SYS_RESUS_STATUS at 16#7C# range 0 .. 31;
      FC0_REF_KHZ          at 16#80# range 0 .. 31;
      FC0_MIN_KHZ          at 16#84# range 0 .. 31;
      FC0_MAX_KHZ          at 16#88# range 0 .. 31;
      FC0_DELAY            at 16#8C# range 0 .. 31;
      FC0_INTERVAL         at 16#90# range 0 .. 31;
      FC0_SRC              at 16#94# range 0 .. 31;
      FC0_STATUS           at 16#98# range 0 .. 31;
      FC0_RESULT           at 16#9C# range 0 .. 31;
      WAKE_EN0             at 16#A0# range 0 .. 31;
      WAKE_EN1             at 16#A4# range 0 .. 31;
      SLEEP_EN0            at 16#A8# range 0 .. 31;
      SLEEP_EN1            at 16#AC# range 0 .. 31;
      ENABLED0             at 16#B0# range 0 .. 31;
      ENABLED1             at 16#B4# range 0 .. 31;
      INTR                 at 16#B8# range 0 .. 31;
      INTE                 at 16#BC# range 0 .. 31;
      INTF                 at 16#C0# range 0 .. 31;
      INTS                 at 16#C4# range 0 .. 31;
   end record;

   CLOCKS_Periph : aliased CLOCKS_Peripheral
      with Import, Address => RP2040_SVD.CLOCKS_Base;

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
