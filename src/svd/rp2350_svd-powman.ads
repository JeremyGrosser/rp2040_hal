pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

--  Controls vreg, bor, lposc, chip resets & xosc startup, powman and provides
--  scratch register for general use and for bootcode use
package RP2350_SVD.POWMAN is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Indicates a bad password has been used
   type BADPASSWD_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      BADPASSWD     : Boolean := False;
      --  unspecified
      Reserved_1_31 : HAL.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BADPASSWD_Register use record
      BADPASSWD     at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype VREG_CTRL_HT_TH_Field is HAL.UInt3;

   --  Voltage Regulator Control
   type VREG_CTRL_Register is record
      --  unspecified
      Reserved_0_3          : HAL.UInt4 := 16#0#;
      --  high temperature protection threshold regulator power transistors are
      --  disabled when junction temperature exceeds threshold 000 - 100C 001 -
      --  105C 010 - 110C 011 - 115C 100 - 120C 101 - 125C 110 - 135C 111 -
      --  150C
      HT_TH                 : VREG_CTRL_HT_TH_Field := 16#5#;
      --  unspecified
      Reserved_7_7          : HAL.Bit := 16#0#;
      --  0=not disabled, 1=enabled
      DISABLE_VOLTAGE_LIMIT : Boolean := False;
      --  unspecified
      Reserved_9_11         : HAL.UInt3 := 16#0#;
      --  isolates the VREG control interface 0 - not isolated (default) 1 -
      --  isolated
      ISOLATE               : Boolean := False;
      --  unlocks the VREG control interface after power up 0 - Locked
      --  (default) 1 - Unlocked It cannot be relocked when it is unlocked.
      UNLOCK                : Boolean := False;
      --  unspecified
      Reserved_14_14        : HAL.Bit := 16#0#;
      --  returns the regulator to its startup settings 0 - reset 1 - not reset
      --  (default)
      RST_N                 : Boolean := True;
      --  unspecified
      Reserved_16_31        : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for VREG_CTRL_Register use record
      Reserved_0_3          at 0 range 0 .. 3;
      HT_TH                 at 0 range 4 .. 6;
      Reserved_7_7          at 0 range 7 .. 7;
      DISABLE_VOLTAGE_LIMIT at 0 range 8 .. 8;
      Reserved_9_11         at 0 range 9 .. 11;
      ISOLATE               at 0 range 12 .. 12;
      UNLOCK                at 0 range 13 .. 13;
      Reserved_14_14        at 0 range 14 .. 14;
      RST_N                 at 0 range 15 .. 15;
      Reserved_16_31        at 0 range 16 .. 31;
   end record;

   --  Voltage Regulator Status
   type VREG_STS_Register is record
      --  Read-only. startup status 0=startup complete, 1=starting up
      STARTUP       : Boolean;
      --  unspecified
      Reserved_1_3  : HAL.UInt3;
      --  Read-only. output regulation status 0=not in regulation, 1=in
      --  regulation
      VOUT_OK       : Boolean;
      --  unspecified
      Reserved_5_31 : HAL.UInt27;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for VREG_STS_Register use record
      STARTUP       at 0 range 0 .. 0;
      Reserved_1_3  at 0 range 1 .. 3;
      VOUT_OK       at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype VREG_VSEL_Field is HAL.UInt5;

   --  Voltage Regulator Settings
   type VREG_Register is record
      --  unspecified
      Reserved_0_0       : HAL.Bit := 16#0#;
      --  high impedance mode select 0=not in high impedance mode, 1=in high
      --  impedance mode
      HIZ                : Boolean := False;
      --  unspecified
      Reserved_2_3       : HAL.UInt2 := 16#0#;
      --  output voltage select the regulator output voltage is limited to 1.3V
      --  unless the voltage limit is disabled using the disable_voltage_limit
      --  field in the vreg_ctrl register 00000 - 0.55V 00001 - 0.60V 00010 -
      --  0.65V 00011 - 0.70V 00100 - 0.75V 00101 - 0.80V 00110 - 0.85V 00111 -
      --  0.90V 01000 - 0.95V 01001 - 1.00V 01010 - 1.05V 01011 - 1.10V
      --  (default) 01100 - 1.15V 01101 - 1.20V 01110 - 1.25V 01111 - 1.30V
      --  10000 - 1.35V 10001 - 1.40V 10010 - 1.50V 10011 - 1.60V 10100 - 1.65V
      --  10101 - 1.70V 10110 - 1.80V 10111 - 1.90V 11000 - 2.00V 11001 - 2.35V
      --  11010 - 2.50V 11011 - 2.65V 11100 - 2.80V 11101 - 3.00V 11110 - 3.15V
      --  11111 - 3.30V
      VSEL               : VREG_VSEL_Field := 16#B#;
      --  unspecified
      Reserved_9_14      : HAL.UInt6 := 16#0#;
      --  Read-only. regulator state is being updated writes to the vreg
      --  register will be ignored when this field is set
      UPDATE_IN_PROGRESS : Boolean := False;
      --  unspecified
      Reserved_16_31     : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for VREG_Register use record
      Reserved_0_0       at 0 range 0 .. 0;
      HIZ                at 0 range 1 .. 1;
      Reserved_2_3       at 0 range 2 .. 3;
      VSEL               at 0 range 4 .. 8;
      Reserved_9_14      at 0 range 9 .. 14;
      UPDATE_IN_PROGRESS at 0 range 15 .. 15;
      Reserved_16_31     at 0 range 16 .. 31;
   end record;

   subtype VREG_LP_ENTRY_VSEL_Field is HAL.UInt5;

   --  Voltage Regulator Low Power Entry Settings
   type VREG_LP_ENTRY_Register is record
      --  unspecified
      Reserved_0_0  : HAL.Bit := 16#0#;
      --  high impedance mode select 0=not in high impedance mode, 1=in high
      --  impedance mode
      HIZ           : Boolean := False;
      --  selects either normal (switching) mode or low power (linear) mode low
      --  power mode can only be selected for output voltages up to 1.3V 0 =
      --  normal mode (switching) 1 = low power mode (linear)
      MODE          : Boolean := True;
      --  unspecified
      Reserved_3_3  : HAL.Bit := 16#0#;
      --  output voltage select the regulator output voltage is limited to 1.3V
      --  unless the voltage limit is disabled using the disable_voltage_limit
      --  field in the vreg_ctrl register 00000 - 0.55V 00001 - 0.60V 00010 -
      --  0.65V 00011 - 0.70V 00100 - 0.75V 00101 - 0.80V 00110 - 0.85V 00111 -
      --  0.90V 01000 - 0.95V 01001 - 1.00V 01010 - 1.05V 01011 - 1.10V
      --  (default) 01100 - 1.15V 01101 - 1.20V 01110 - 1.25V 01111 - 1.30V
      --  10000 - 1.35V 10001 - 1.40V 10010 - 1.50V 10011 - 1.60V 10100 - 1.65V
      --  10101 - 1.70V 10110 - 1.80V 10111 - 1.90V 11000 - 2.00V 11001 - 2.35V
      --  11010 - 2.50V 11011 - 2.65V 11100 - 2.80V 11101 - 3.00V 11110 - 3.15V
      --  11111 - 3.30V
      VSEL          : VREG_LP_ENTRY_VSEL_Field := 16#B#;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for VREG_LP_ENTRY_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      HIZ           at 0 range 1 .. 1;
      MODE          at 0 range 2 .. 2;
      Reserved_3_3  at 0 range 3 .. 3;
      VSEL          at 0 range 4 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype VREG_LP_EXIT_VSEL_Field is HAL.UInt5;

   --  Voltage Regulator Low Power Exit Settings
   type VREG_LP_EXIT_Register is record
      --  unspecified
      Reserved_0_0  : HAL.Bit := 16#0#;
      --  high impedance mode select 0=not in high impedance mode, 1=in high
      --  impedance mode
      HIZ           : Boolean := False;
      --  selects either normal (switching) mode or low power (linear) mode low
      --  power mode can only be selected for output voltages up to 1.3V 0 =
      --  normal mode (switching) 1 = low power mode (linear)
      MODE          : Boolean := False;
      --  unspecified
      Reserved_3_3  : HAL.Bit := 16#0#;
      --  output voltage select the regulator output voltage is limited to 1.3V
      --  unless the voltage limit is disabled using the disable_voltage_limit
      --  field in the vreg_ctrl register 00000 - 0.55V 00001 - 0.60V 00010 -
      --  0.65V 00011 - 0.70V 00100 - 0.75V 00101 - 0.80V 00110 - 0.85V 00111 -
      --  0.90V 01000 - 0.95V 01001 - 1.00V 01010 - 1.05V 01011 - 1.10V
      --  (default) 01100 - 1.15V 01101 - 1.20V 01110 - 1.25V 01111 - 1.30V
      --  10000 - 1.35V 10001 - 1.40V 10010 - 1.50V 10011 - 1.60V 10100 - 1.65V
      --  10101 - 1.70V 10110 - 1.80V 10111 - 1.90V 11000 - 2.00V 11001 - 2.35V
      --  11010 - 2.50V 11011 - 2.65V 11100 - 2.80V 11101 - 3.00V 11110 - 3.15V
      --  11111 - 3.30V
      VSEL          : VREG_LP_EXIT_VSEL_Field := 16#B#;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for VREG_LP_EXIT_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      HIZ           at 0 range 1 .. 1;
      MODE          at 0 range 2 .. 2;
      Reserved_3_3  at 0 range 3 .. 3;
      VSEL          at 0 range 4 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  Brown-out Detection Control
   type BOD_CTRL_Register is record
      --  unspecified
      Reserved_0_11  : HAL.UInt12 := 16#0#;
      --  isolates the brown-out detection control interface 0 - not isolated
      --  (default) 1 - isolated
      ISOLATE        : Boolean := False;
      --  unspecified
      Reserved_13_31 : HAL.UInt19 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOD_CTRL_Register use record
      Reserved_0_11  at 0 range 0 .. 11;
      ISOLATE        at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   subtype BOD_VSEL_Field is HAL.UInt5;

   --  Brown-out Detection Settings
   type BOD_Register is record
      --  enable brown-out detection 0=not enabled, 1=enabled
      EN            : Boolean := True;
      --  unspecified
      Reserved_1_3  : HAL.UInt3 := 16#0#;
      --  threshold select 00000 - 0.473V 00001 - 0.516V 00010 - 0.559V 00011 -
      --  0.602V 00100 - 0.645VS 00101 - 0.688V 00110 - 0.731V 00111 - 0.774V
      --  01000 - 0.817V 01001 - 0.860V (default) 01010 - 0.903V 01011 - 0.946V
      --  01100 - 0.989V 01101 - 1.032V 01110 - 1.075V 01111 - 1.118V 10000 -
      --  1.161 10001 - 1.204V
      VSEL          : BOD_VSEL_Field := 16#B#;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOD_Register use record
      EN            at 0 range 0 .. 0;
      Reserved_1_3  at 0 range 1 .. 3;
      VSEL          at 0 range 4 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype BOD_LP_ENTRY_VSEL_Field is HAL.UInt5;

   --  Brown-out Detection Low Power Entry Settings
   type BOD_LP_ENTRY_Register is record
      --  enable brown-out detection 0=not enabled, 1=enabled
      EN            : Boolean := False;
      --  unspecified
      Reserved_1_3  : HAL.UInt3 := 16#0#;
      --  threshold select 00000 - 0.473V 00001 - 0.516V 00010 - 0.559V 00011 -
      --  0.602V 00100 - 0.645VS 00101 - 0.688V 00110 - 0.731V 00111 - 0.774V
      --  01000 - 0.817V 01001 - 0.860V (default) 01010 - 0.903V 01011 - 0.946V
      --  01100 - 0.989V 01101 - 1.032V 01110 - 1.075V 01111 - 1.118V 10000 -
      --  1.161 10001 - 1.204V
      VSEL          : BOD_LP_ENTRY_VSEL_Field := 16#B#;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOD_LP_ENTRY_Register use record
      EN            at 0 range 0 .. 0;
      Reserved_1_3  at 0 range 1 .. 3;
      VSEL          at 0 range 4 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype BOD_LP_EXIT_VSEL_Field is HAL.UInt5;

   --  Brown-out Detection Low Power Exit Settings
   type BOD_LP_EXIT_Register is record
      --  enable brown-out detection 0=not enabled, 1=enabled
      EN            : Boolean := True;
      --  unspecified
      Reserved_1_3  : HAL.UInt3 := 16#0#;
      --  threshold select 00000 - 0.473V 00001 - 0.516V 00010 - 0.559V 00011 -
      --  0.602V 00100 - 0.645VS 00101 - 0.688V 00110 - 0.731V 00111 - 0.774V
      --  01000 - 0.817V 01001 - 0.860V (default) 01010 - 0.903V 01011 - 0.946V
      --  01100 - 0.989V 01101 - 1.032V 01110 - 1.075V 01111 - 1.118V 10000 -
      --  1.161 10001 - 1.204V
      VSEL          : BOD_LP_EXIT_VSEL_Field := 16#B#;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOD_LP_EXIT_Register use record
      EN            at 0 range 0 .. 0;
      Reserved_1_3  at 0 range 1 .. 3;
      VSEL          at 0 range 4 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype LPOSC_MODE_Field is HAL.UInt2;
   subtype LPOSC_TRIM_Field is HAL.UInt6;

   --  Low power oscillator control register.
   type LPOSC_Register is record
      --  This feature has been removed
      MODE           : LPOSC_MODE_Field := 16#3#;
      --  unspecified
      Reserved_2_3   : HAL.UInt2 := 16#0#;
      --  Frequency trim - the trim step is typically 1% of the reset
      --  frequency, but can be up to 3%
      TRIM           : LPOSC_TRIM_Field := 16#20#;
      --  unspecified
      Reserved_10_31 : HAL.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for LPOSC_Register use record
      MODE           at 0 range 0 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      TRIM           at 0 range 4 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   --  Chip reset control and status
   type CHIP_RESET_Register is record
      --  This flag is set by double-tapping RUN. It tells bootcode to go into
      --  the bootloader.
      DOUBLE_TAP                      : Boolean := False;
      --  unspecified
      Reserved_1_3                    : HAL.UInt3 := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. This is set by a rescue reset from the RP-AP. Its
      --  purpose is to halt before the bootrom before booting from flash in
      --  order to recover from a boot lock-up. The debugger can then attach
      --  once the bootrom has been halted and flash some working code that
      --  does not lock up.
      RESCUE_FLAG                     : Boolean := False;
      --  unspecified
      Reserved_5_15                   : HAL.UInt11 := 16#0#;
      --  Read-only. Last reset was from the power-on reset This resets:
      --  double_tap flag yes DP yes RPAP yes rescue_flag yes timer yes powman
      --  yes swcore yes psm yes then starts the power sequencer
      HAD_POR                         : Boolean := False;
      --  Read-only. Last reset was from the brown-out detection block This
      --  resets: double_tap flag yes DP yes RPAP yes rescue_flag yes timer yes
      --  powman yes swcore yes psm yes then starts the power sequencer
      HAD_BOR                         : Boolean := False;
      --  Read-only. Last reset was from the RUN pin This resets: double_tap
      --  flag no DP yes RPAP yes rescue_flag yes timer yes powman yes swcore
      --  yes psm yes then starts the power sequencer
      HAD_RUN_LOW                     : Boolean := False;
      --  Read-only. Last reset was an reset request from the arm debugger This
      --  resets: double_tap flag no DP no RPAP no rescue_flag yes timer yes
      --  powman yes swcore yes psm yes then starts the power sequencer
      HAD_DP_RESET_REQ                : Boolean := False;
      --  unspecified
      Reserved_20_20                  : HAL.Bit := 16#0#;
      --  Read-only. Last reset was a rescue reset from the debugger This
      --  resets: double_tap flag no DP no RPAP no rescue_flag no, it sets this
      --  flag timer yes powman yes swcore yes psm yes then starts the power
      --  sequencer
      HAD_RESCUE                      : Boolean := False;
      --  Read-only. Last reset was a watchdog timeout which was configured to
      --  reset the power manager asynchronously This resets: double_tap flag
      --  no DP no RPAP no rescue_flag no timer yes powman yes swcore yes psm
      --  yes then starts the power sequencer
      HAD_WATCHDOG_RESET_POWMAN_ASYNC : Boolean := False;
      --  Read-only. Last reset was a watchdog timeout which was configured to
      --  reset the power manager This resets: double_tap flag no DP no RPAP no
      --  rescue_flag no timer yes powman yes swcore yes psm yes then starts
      --  the power sequencer
      HAD_WATCHDOG_RESET_POWMAN       : Boolean := False;
      --  Read-only. Last reset was a watchdog timeout which was configured to
      --  reset the switched-core This resets: double_tap flag no DP no RPAP no
      --  rescue_flag no timer no powman no swcore yes psm yes then starts the
      --  power sequencer
      HAD_WATCHDOG_RESET_SWCORE       : Boolean := False;
      --  Read-only. Last reset was a switched core powerdown This resets:
      --  double_tap flag no DP no RPAP no rescue_flag no timer no powman no
      --  swcore yes psm yes then starts the power sequencer
      HAD_SWCORE_PD                   : Boolean := False;
      --  Read-only. Last reset was due to a power supply glitch This resets:
      --  double_tap flag no DP no RPAP no rescue_flag no timer no powman no
      --  swcore no psm yes and does not change the power state
      HAD_GLITCH_DETECT               : Boolean := False;
      --  Read-only. Last reset was a system reset from the hazard debugger
      --  This resets: double_tap flag no DP no RPAP no rescue_flag no timer no
      --  powman no swcore no psm yes and does not change the power state
      HAD_HZD_SYS_RESET_REQ           : Boolean := False;
      --  Read-only. Last reset was a watchdog timeout which was configured to
      --  reset the power-on state machine This resets: double_tap flag no DP
      --  no RPAP no rescue_flag no timer no powman no swcore no psm yes and
      --  does not change the power state
      HAD_WATCHDOG_RESET_RSM          : Boolean := False;
      --  unspecified
      Reserved_29_31                  : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CHIP_RESET_Register use record
      DOUBLE_TAP                      at 0 range 0 .. 0;
      Reserved_1_3                    at 0 range 1 .. 3;
      RESCUE_FLAG                     at 0 range 4 .. 4;
      Reserved_5_15                   at 0 range 5 .. 15;
      HAD_POR                         at 0 range 16 .. 16;
      HAD_BOR                         at 0 range 17 .. 17;
      HAD_RUN_LOW                     at 0 range 18 .. 18;
      HAD_DP_RESET_REQ                at 0 range 19 .. 19;
      Reserved_20_20                  at 0 range 20 .. 20;
      HAD_RESCUE                      at 0 range 21 .. 21;
      HAD_WATCHDOG_RESET_POWMAN_ASYNC at 0 range 22 .. 22;
      HAD_WATCHDOG_RESET_POWMAN       at 0 range 23 .. 23;
      HAD_WATCHDOG_RESET_SWCORE       at 0 range 24 .. 24;
      HAD_SWCORE_PD                   at 0 range 25 .. 25;
      HAD_GLITCH_DETECT               at 0 range 26 .. 26;
      HAD_HZD_SYS_RESET_REQ           at 0 range 27 .. 27;
      HAD_WATCHDOG_RESET_RSM          at 0 range 28 .. 28;
      Reserved_29_31                  at 0 range 29 .. 31;
   end record;

   --  Allows a watchdog reset to reset the internal state of powman in
   --  addition to the power-on state machine (PSM). Note that powman ignores
   --  watchdog resets that do not select at least the CLOCKS stage or earlier
   --  stages in the PSM. If using these bits, it's recommended to set
   --  PSM_WDSEL to all-ones in addition to the desired bits in this register.
   --  Failing to select CLOCKS or earlier will result in the POWMAN_WDSEL
   --  register having no effect.
   type WDSEL_Register is record
      --  If set to 1, a watchdog reset will restore powman defaults, reset the
      --  timer, reset the switched core domain and run the full power-on state
      --  machine (PSM) sequence This does not rely on clk_ref running
      RESET_POWMAN_ASYNC : Boolean := False;
      --  unspecified
      Reserved_1_3       : HAL.UInt3 := 16#0#;
      --  If set to 1, a watchdog reset will restore powman defaults, reset the
      --  timer, reset the switched core power domain and run the full power-on
      --  state machine (PSM) sequence This relies on clk_ref running. Use
      --  reset_powman_async if that may not be true
      RESET_POWMAN       : Boolean := False;
      --  unspecified
      Reserved_5_7       : HAL.UInt3 := 16#0#;
      --  If set to 1, a watchdog reset will reset the switched core power
      --  domain and run the full power-on state machine (PSM) sequence From a
      --  user perspective it is the same as setting RSM_WDSEL_PROC_COLD From a
      --  hardware debug perspective it has the same effect as a power-on reset
      --  for the switched core power domain
      RESET_SWCORE       : Boolean := False;
      --  unspecified
      Reserved_9_11      : HAL.UInt3 := 16#0#;
      --  If set to 1, a watchdog reset will run the full power-on state
      --  machine (PSM) sequence From a user perspective it is the same as
      --  setting RSM_WDSEL_PROC_COLD From a hardware debug perspective it has
      --  the same effect as a reset from a glitch detector
      RESET_RSM          : Boolean := False;
      --  unspecified
      Reserved_13_31     : HAL.UInt19 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for WDSEL_Register use record
      RESET_POWMAN_ASYNC at 0 range 0 .. 0;
      Reserved_1_3       at 0 range 1 .. 3;
      RESET_POWMAN       at 0 range 4 .. 4;
      Reserved_5_7       at 0 range 5 .. 7;
      RESET_SWCORE       at 0 range 8 .. 8;
      Reserved_9_11      at 0 range 9 .. 11;
      RESET_RSM          at 0 range 12 .. 12;
      Reserved_13_31     at 0 range 13 .. 31;
   end record;

   --  For configuration of the power sequencer Writes are ignored while
   --  POWMAN_STATE_CHANGING=1
   type SEQ_CFG_Register is record
      --  Specifies the power state of SRAM1 when powering up swcore from a low
      --  power state (P1.xxx) to a high power state (P0.0xx). 0=power-up 1=no
      --  change
      HW_PWRUP_SRAM1   : Boolean := False;
      --  Specifies the power state of SRAM0 when powering up swcore from a low
      --  power state (P1.xxx) to a high power state (P0.0xx). 0=power-up 1=no
      --  change
      HW_PWRUP_SRAM0   : Boolean := False;
      --  unspecified
      Reserved_2_3     : HAL.UInt2 := 16#0#;
      --  Set to 0 to prevent automatic switching to vreg low power mode when
      --  switched-core is powered down This setting takes effect when the
      --  swcore is next powered down
      USE_VREG_LP      : Boolean := True;
      --  Set to 0 to prevent automatic switching to vreg high power mode when
      --  switched-core is powered up This setting takes effect when the swcore
      --  is next powered up
      USE_VREG_HP      : Boolean := True;
      --  Set to 0 to prevent automatic switching to bod low power mode when
      --  switched-core is powered down This setting takes effect when the
      --  swcore is next powered down
      USE_BOD_LP       : Boolean := True;
      --  Set to 0 to prevent automatic switching to bod high power mode when
      --  switched-core is powered up This setting takes effect when the swcore
      --  is next powered up
      USE_BOD_HP       : Boolean := True;
      --  Set to 0 to stop the low power osc when the switched-core is powered
      --  down, which is unwise if using it to clock the timer This setting
      --  takes effect when the swcore is next powered down
      RUN_LPOSC_IN_LP  : Boolean := True;
      --  unspecified
      Reserved_9_11    : HAL.UInt3 := 16#0#;
      --  selects the reference clock (clk_ref) as the source of the POWMAN
      --  clock when switched-core is powered. The POWMAN clock always switches
      --  to the slow clock (lposc) when switched-core is powered down because
      --  the fast clock stops running. 0 always run the POWMAN clock from the
      --  slow clock (lposc) 1 run the POWMAN clock from the fast clock when
      --  available This setting takes effect when a power up sequence is next
      --  run
      USE_FAST_POWCK   : Boolean := True;
      --  unspecified
      Reserved_13_15   : HAL.UInt3 := 16#0#;
      --  Read-only. Indicates the voltage regulator (VREG) mode 0 = VREG high
      --  power mode which is the default 1 = VREG low power mode
      USING_VREG_LP    : Boolean := False;
      --  Read-only. Indicates the brown-out detector (BOD) mode 0 = BOD high
      --  power mode which is the default 1 = BOD low power mode
      USING_BOD_LP     : Boolean := False;
      --  unspecified
      Reserved_18_19   : HAL.UInt2 := 16#0#;
      --  Read-only. 0 indicates the POWMAN clock is running from the low power
      --  oscillator (32kHz) 1 indicates the POWMAN clock is running from the
      --  reference clock (2-50MHz)
      USING_FAST_POWCK : Boolean := True;
      --  unspecified
      Reserved_21_31   : HAL.UInt11 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SEQ_CFG_Register use record
      HW_PWRUP_SRAM1   at 0 range 0 .. 0;
      HW_PWRUP_SRAM0   at 0 range 1 .. 1;
      Reserved_2_3     at 0 range 2 .. 3;
      USE_VREG_LP      at 0 range 4 .. 4;
      USE_VREG_HP      at 0 range 5 .. 5;
      USE_BOD_LP       at 0 range 6 .. 6;
      USE_BOD_HP       at 0 range 7 .. 7;
      RUN_LPOSC_IN_LP  at 0 range 8 .. 8;
      Reserved_9_11    at 0 range 9 .. 11;
      USE_FAST_POWCK   at 0 range 12 .. 12;
      Reserved_13_15   at 0 range 13 .. 15;
      USING_VREG_LP    at 0 range 16 .. 16;
      USING_BOD_LP     at 0 range 17 .. 17;
      Reserved_18_19   at 0 range 18 .. 19;
      USING_FAST_POWCK at 0 range 20 .. 20;
      Reserved_21_31   at 0 range 21 .. 31;
   end record;

   subtype STATE_CURRENT_Field is HAL.UInt4;
   subtype STATE_REQ_Field is HAL.UInt4;

   --  This register controls the power state of the 4 power domains. The
   --  current power state is indicated in POWMAN_STATE_CURRENT which is
   --  read-only. To change the state, write to POWMAN_STATE_REQ. The coding of
   --  POWMAN_STATE_CURRENT & POWMAN_STATE_REQ corresponds to the power states
   --  defined in the datasheet: bit 3 = SWCORE bit 2 = XIP cache bit 1 = SRAM0
   --  bit 0 = SRAM1 0 = powered up 1 = powered down When POWMAN_STATE_REQ is
   --  written, the POWMAN_STATE_WAITING flag is set while the Power Manager
   --  determines what is required. If an invalid transition is requested the
   --  Power Manager will still register the request in POWMAN_STATE_REQ but
   --  will also set the POWMAN_BAD_REQ flag. It will then implement the
   --  power-up requests and ignore the power down requests. To do nothing
   --  would risk entering an unrecoverable lock-up state. Invalid requests
   --  are: any combination of power up and power down requests any request
   --  that results in swcore boing powered and xip unpowered If the request is
   --  to power down the switched-core domain then POWMAN_STATE_WAITING stays
   --  active until the processors halt. During this time the POWMAN_STATE_REQ
   --  field can be re-written to change or cancel the request. When the power
   --  state transition begins the POWMAN_STATE_WAITING_flag is cleared, the
   --  POWMAN_STATE_CHANGING flag is set and POWMAN register writes are ignored
   --  until the transition completes.
   type STATE_Register is record
      --  Read-only.
      CURRENT             : STATE_CURRENT_Field := 16#F#;
      REQ                 : STATE_REQ_Field := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      REQ_IGNORED         : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Request ignored because of a pending pwrup request. See
      --  current_pwrup_req. Note this blocks powering up AND powering down.
      PWRUP_WHILE_WAITING : Boolean := False;
      --  Read-only. Bad software initiated state request. No action taken.
      BAD_SW_REQ          : Boolean := False;
      --  Read-only. Bad hardware initiated state request. Went back to state 0
      --  (i.e. everything powered up)
      BAD_HW_REQ          : Boolean := False;
      --  Read-only.
      WAITING             : Boolean := False;
      --  Read-only.
      CHANGING            : Boolean := False;
      --  unspecified
      Reserved_14_31      : HAL.UInt18 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for STATE_Register use record
      CURRENT             at 0 range 0 .. 3;
      REQ                 at 0 range 4 .. 7;
      REQ_IGNORED         at 0 range 8 .. 8;
      PWRUP_WHILE_WAITING at 0 range 9 .. 9;
      BAD_SW_REQ          at 0 range 10 .. 10;
      BAD_HW_REQ          at 0 range 11 .. 11;
      WAITING             at 0 range 12 .. 12;
      CHANGING            at 0 range 13 .. 13;
      Reserved_14_31      at 0 range 14 .. 31;
   end record;

   subtype POW_FASTDIV_POW_FASTDIV_Field is HAL.UInt11;

   type POW_FASTDIV_Register is record
      --  divides the POWMAN clock to provide a tick for the delay module and
      --  state machines when clk_pow is running from the slow clock it is not
      --  divided when clk_pow is running from the fast clock it is divided by
      --  tick_div
      POW_FASTDIV    : POW_FASTDIV_POW_FASTDIV_Field := 16#40#;
      --  unspecified
      Reserved_11_31 : HAL.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for POW_FASTDIV_Register use record
      POW_FASTDIV    at 0 range 0 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   subtype POW_DELAY_SWCORE_STEP_Field is HAL.UInt4;
   subtype POW_DELAY_XIP_STEP_Field is HAL.UInt4;
   subtype POW_DELAY_SRAM_STEP_Field is HAL.UInt8;

   --  power state machine delays
   type POW_DELAY_Register is record
      --  timing between the swcore power state machine steps measured in units
      --  of the lposc period, 0 gives a delay of 1 unit
      SWCORE_STEP    : POW_DELAY_SWCORE_STEP_Field := 16#1#;
      --  timing between the xip power state machine steps measured in units of
      --  the lposc period, 0 gives a delay of 1 unit
      XIP_STEP       : POW_DELAY_XIP_STEP_Field := 16#1#;
      --  timing between the sram0 and sram1 power state machine steps measured
      --  in units of the powman tick period (>=1us), 0 gives a delay of 1 unit
      SRAM_STEP      : POW_DELAY_SRAM_STEP_Field := 16#20#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for POW_DELAY_Register use record
      SWCORE_STEP    at 0 range 0 .. 3;
      XIP_STEP       at 0 range 4 .. 7;
      SRAM_STEP      at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype EXT_CTRL_GPIO_SELECT_Field is HAL.UInt6;

   --  Configures a gpio as a power mode aware control output
   type EXT_CTRL_Register is record
      --  selects from gpio 0->30 set to 31 to disable this feature
      GPIO_SELECT    : EXT_CTRL_GPIO_SELECT_Field := 16#3F#;
      --  unspecified
      Reserved_6_7   : HAL.UInt2 := 16#0#;
      INIT           : Boolean := False;
      --  unspecified
      Reserved_9_11  : HAL.UInt3 := 16#0#;
      INIT_STATE     : Boolean := False;
      --  output level when entering the low power state
      LP_ENTRY_STATE : Boolean := False;
      --  output level when exiting the low power state
      LP_EXIT_STATE  : Boolean := False;
      --  unspecified
      Reserved_15_31 : HAL.UInt17 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EXT_CTRL_Register use record
      GPIO_SELECT    at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      INIT           at 0 range 8 .. 8;
      Reserved_9_11  at 0 range 9 .. 11;
      INIT_STATE     at 0 range 12 .. 12;
      LP_ENTRY_STATE at 0 range 13 .. 13;
      LP_EXIT_STATE  at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   subtype EXT_TIME_REF_SOURCE_SEL_Field is HAL.UInt2;

   --  Select a GPIO to use as a time reference, the source can be used to
   --  drive the low power clock at 32kHz, or to provide a 1ms tick to the
   --  timer, or provide a 1Hz tick to the timer. The tick selection is
   --  controlled by the POWMAN_TIMER register.
   type EXT_TIME_REF_Register is record
      --  0 -> gpio12 1 -> gpio20 2 -> gpio14 3 -> gpio22
      SOURCE_SEL    : EXT_TIME_REF_SOURCE_SEL_Field := 16#0#;
      --  unspecified
      Reserved_2_3  : HAL.UInt2 := 16#0#;
      --  Use the selected GPIO to drive the 32kHz low power clock, in place of
      --  LPOSC. This field must only be written when POWMAN_TIMER_RUN=0
      DRIVE_LPCK    : Boolean := False;
      --  unspecified
      Reserved_5_31 : HAL.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EXT_TIME_REF_Register use record
      SOURCE_SEL    at 0 range 0 .. 1;
      Reserved_2_3  at 0 range 2 .. 3;
      DRIVE_LPCK    at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype LPOSC_FREQ_KHZ_INT_LPOSC_FREQ_KHZ_INT_Field is HAL.UInt6;

   --  Informs the AON Timer of the integer component of the clock frequency
   --  when running off the LPOSC.
   type LPOSC_FREQ_KHZ_INT_Register is record
      --  Integer component of the LPOSC or GPIO clock source frequency in kHz.
      --  Default = 32 This field must only be written when POWMAN_TIMER_RUN=0
      --  or POWMAN_TIMER_USING_XOSC=1
      LPOSC_FREQ_KHZ_INT : LPOSC_FREQ_KHZ_INT_LPOSC_FREQ_KHZ_INT_Field :=
                            16#20#;
      --  unspecified
      Reserved_6_31      : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for LPOSC_FREQ_KHZ_INT_Register use record
      LPOSC_FREQ_KHZ_INT at 0 range 0 .. 5;
      Reserved_6_31      at 0 range 6 .. 31;
   end record;

   subtype LPOSC_FREQ_KHZ_FRAC_LPOSC_FREQ_KHZ_FRAC_Field is HAL.UInt16;

   --  Informs the AON Timer of the fractional component of the clock frequency
   --  when running off the LPOSC.
   type LPOSC_FREQ_KHZ_FRAC_Register is record
      --  Fractional component of the LPOSC or GPIO clock source frequency in
      --  kHz. Default = 0.768 This field must only be written when
      --  POWMAN_TIMER_RUN=0 or POWMAN_TIMER_USING_XOSC=1
      LPOSC_FREQ_KHZ_FRAC : LPOSC_FREQ_KHZ_FRAC_LPOSC_FREQ_KHZ_FRAC_Field :=
                             16#C49C#;
      --  unspecified
      Reserved_16_31      : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for LPOSC_FREQ_KHZ_FRAC_Register use record
      LPOSC_FREQ_KHZ_FRAC at 0 range 0 .. 15;
      Reserved_16_31      at 0 range 16 .. 31;
   end record;

   subtype XOSC_FREQ_KHZ_INT_XOSC_FREQ_KHZ_INT_Field is HAL.UInt16;

   --  Informs the AON Timer of the integer component of the clock frequency
   --  when running off the XOSC.
   type XOSC_FREQ_KHZ_INT_Register is record
      --  Integer component of the XOSC frequency in kHz. Default = 12000 Must
      --  be >1 This field must only be written when POWMAN_TIMER_RUN=0 or
      --  POWMAN_TIMER_USING_XOSC=0
      XOSC_FREQ_KHZ_INT : XOSC_FREQ_KHZ_INT_XOSC_FREQ_KHZ_INT_Field :=
                           16#2EE0#;
      --  unspecified
      Reserved_16_31    : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for XOSC_FREQ_KHZ_INT_Register use record
      XOSC_FREQ_KHZ_INT at 0 range 0 .. 15;
      Reserved_16_31    at 0 range 16 .. 31;
   end record;

   subtype XOSC_FREQ_KHZ_FRAC_XOSC_FREQ_KHZ_FRAC_Field is HAL.UInt16;

   --  Informs the AON Timer of the fractional component of the clock frequency
   --  when running off the XOSC.
   type XOSC_FREQ_KHZ_FRAC_Register is record
      --  Fractional component of the XOSC frequency in kHz. This field must
      --  only be written when POWMAN_TIMER_RUN=0 or POWMAN_TIMER_USING_XOSC=0
      XOSC_FREQ_KHZ_FRAC : XOSC_FREQ_KHZ_FRAC_XOSC_FREQ_KHZ_FRAC_Field :=
                            16#0#;
      --  unspecified
      Reserved_16_31     : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for XOSC_FREQ_KHZ_FRAC_Register use record
      XOSC_FREQ_KHZ_FRAC at 0 range 0 .. 15;
      Reserved_16_31     at 0 range 16 .. 31;
   end record;

   subtype SET_TIME_63TO48_SET_TIME_63TO48_Field is HAL.UInt16;

   type SET_TIME_63TO48_Register is record
      --  For setting the time, do not use for reading the time, use
      --  POWMAN_READ_TIME_UPPER and POWMAN_READ_TIME_LOWER. This field must
      --  only be written when POWMAN_TIMER_RUN=0
      SET_TIME_63TO48 : SET_TIME_63TO48_SET_TIME_63TO48_Field := 16#0#;
      --  unspecified
      Reserved_16_31  : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SET_TIME_63TO48_Register use record
      SET_TIME_63TO48 at 0 range 0 .. 15;
      Reserved_16_31  at 0 range 16 .. 31;
   end record;

   subtype SET_TIME_47TO32_SET_TIME_47TO32_Field is HAL.UInt16;

   type SET_TIME_47TO32_Register is record
      --  For setting the time, do not use for reading the time, use
      --  POWMAN_READ_TIME_UPPER and POWMAN_READ_TIME_LOWER. This field must
      --  only be written when POWMAN_TIMER_RUN=0
      SET_TIME_47TO32 : SET_TIME_47TO32_SET_TIME_47TO32_Field := 16#0#;
      --  unspecified
      Reserved_16_31  : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SET_TIME_47TO32_Register use record
      SET_TIME_47TO32 at 0 range 0 .. 15;
      Reserved_16_31  at 0 range 16 .. 31;
   end record;

   subtype SET_TIME_31TO16_SET_TIME_31TO16_Field is HAL.UInt16;

   type SET_TIME_31TO16_Register is record
      --  For setting the time, do not use for reading the time, use
      --  POWMAN_READ_TIME_UPPER and POWMAN_READ_TIME_LOWER. This field must
      --  only be written when POWMAN_TIMER_RUN=0
      SET_TIME_31TO16 : SET_TIME_31TO16_SET_TIME_31TO16_Field := 16#0#;
      --  unspecified
      Reserved_16_31  : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SET_TIME_31TO16_Register use record
      SET_TIME_31TO16 at 0 range 0 .. 15;
      Reserved_16_31  at 0 range 16 .. 31;
   end record;

   subtype SET_TIME_15TO0_SET_TIME_15TO0_Field is HAL.UInt16;

   type SET_TIME_15TO0_Register is record
      --  For setting the time, do not use for reading the time, use
      --  POWMAN_READ_TIME_UPPER and POWMAN_READ_TIME_LOWER. This field must
      --  only be written when POWMAN_TIMER_RUN=0
      SET_TIME_15TO0 : SET_TIME_15TO0_SET_TIME_15TO0_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SET_TIME_15TO0_Register use record
      SET_TIME_15TO0 at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype ALARM_TIME_63TO48_ALARM_TIME_63TO48_Field is HAL.UInt16;

   type ALARM_TIME_63TO48_Register is record
      --  This field must only be written when POWMAN_ALARM_ENAB=0
      ALARM_TIME_63TO48 : ALARM_TIME_63TO48_ALARM_TIME_63TO48_Field := 16#0#;
      --  unspecified
      Reserved_16_31    : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ALARM_TIME_63TO48_Register use record
      ALARM_TIME_63TO48 at 0 range 0 .. 15;
      Reserved_16_31    at 0 range 16 .. 31;
   end record;

   subtype ALARM_TIME_47TO32_ALARM_TIME_47TO32_Field is HAL.UInt16;

   type ALARM_TIME_47TO32_Register is record
      --  This field must only be written when POWMAN_ALARM_ENAB=0
      ALARM_TIME_47TO32 : ALARM_TIME_47TO32_ALARM_TIME_47TO32_Field := 16#0#;
      --  unspecified
      Reserved_16_31    : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ALARM_TIME_47TO32_Register use record
      ALARM_TIME_47TO32 at 0 range 0 .. 15;
      Reserved_16_31    at 0 range 16 .. 31;
   end record;

   subtype ALARM_TIME_31TO16_ALARM_TIME_31TO16_Field is HAL.UInt16;

   type ALARM_TIME_31TO16_Register is record
      --  This field must only be written when POWMAN_ALARM_ENAB=0
      ALARM_TIME_31TO16 : ALARM_TIME_31TO16_ALARM_TIME_31TO16_Field := 16#0#;
      --  unspecified
      Reserved_16_31    : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ALARM_TIME_31TO16_Register use record
      ALARM_TIME_31TO16 at 0 range 0 .. 15;
      Reserved_16_31    at 0 range 16 .. 31;
   end record;

   subtype ALARM_TIME_15TO0_ALARM_TIME_15TO0_Field is HAL.UInt16;

   type ALARM_TIME_15TO0_Register is record
      --  This field must only be written when POWMAN_ALARM_ENAB=0
      ALARM_TIME_15TO0 : ALARM_TIME_15TO0_ALARM_TIME_15TO0_Field := 16#0#;
      --  unspecified
      Reserved_16_31   : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ALARM_TIME_15TO0_Register use record
      ALARM_TIME_15TO0 at 0 range 0 .. 15;
      Reserved_16_31   at 0 range 16 .. 31;
   end record;

   type TIMER_Register is record
      --  Control whether Non-secure software can write to the timer registers.
      --  All other registers are hardwired to be inaccessible to Non-secure.
      NONSEC_WRITE    : Boolean := False;
      --  Timer enable. Setting this bit causes the timer to begin counting up
      --  from its current value. Clearing this bit stops the timer from
      --  counting. Before enabling the timer, set the POWMAN_LPOSC_FREQ* and
      --  POWMAN_XOSC_FREQ* registers to configure the count rate, and
      --  initialise the current time by writing to SET_TIME_63TO48 through
      --  SET_TIME_15TO0. You must not write to the SET_TIME_x registers when
      --  the timer is running. Once configured, start the timer by setting
      --  POWMAN_TIMER_RUN=1. This will start the timer running from the LPOSC.
      --  When the XOSC is available switch the reference clock to XOSC then
      --  select it as the timer clock by setting POWMAN_TIMER_USE_XOSC=1
      RUN             : Boolean := False;
      --  Write-only. Clears the timer, does not disable the timer and does not
      --  affect the alarm. This control can be written at any time.
      CLEAR           : Boolean := False;
      --  unspecified
      Reserved_3_3    : HAL.Bit := 16#0#;
      --  Enables the alarm. The alarm must be disabled while writing the alarm
      --  time.
      ALARM_ENAB      : Boolean := False;
      --  Alarm wakes the chip from low power mode
      PWRUP_ON_ALARM  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Alarm has fired. Write to 1 to clear the alarm.
      ALARM           : Boolean := False;
      --  unspecified
      Reserved_7_7    : HAL.Bit := 16#0#;
      --  Write-only. Switch to lposc as the source of the 1kHz timer tick
      USE_LPOSC       : Boolean := False;
      --  Write-only. switch to xosc as the source of the 1kHz timer tick
      USE_XOSC        : Boolean := False;
      --  Write-only. switch to gpio as the source of the 1kHz timer tick
      USE_GPIO_1KHZ   : Boolean := False;
      --  unspecified
      Reserved_11_12  : HAL.UInt2 := 16#0#;
      --  Selects the gpio source as the reference for the sec counter. The
      --  msec counter will continue to use the lposc or xosc reference.
      USE_GPIO_1HZ    : Boolean := False;
      --  unspecified
      Reserved_14_15  : HAL.UInt2 := 16#0#;
      --  Read-only. Timer is running from xosc
      USING_XOSC      : Boolean := False;
      --  Read-only. Timer is running from lposc
      USING_LPOSC     : Boolean := False;
      --  Read-only. Timer is running from a 1khz gpio source
      USING_GPIO_1KHZ : Boolean := False;
      --  Read-only. Timer is synchronised to a 1hz gpio source
      USING_GPIO_1HZ  : Boolean := False;
      --  unspecified
      Reserved_20_31  : HAL.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TIMER_Register use record
      NONSEC_WRITE    at 0 range 0 .. 0;
      RUN             at 0 range 1 .. 1;
      CLEAR           at 0 range 2 .. 2;
      Reserved_3_3    at 0 range 3 .. 3;
      ALARM_ENAB      at 0 range 4 .. 4;
      PWRUP_ON_ALARM  at 0 range 5 .. 5;
      ALARM           at 0 range 6 .. 6;
      Reserved_7_7    at 0 range 7 .. 7;
      USE_LPOSC       at 0 range 8 .. 8;
      USE_XOSC        at 0 range 9 .. 9;
      USE_GPIO_1KHZ   at 0 range 10 .. 10;
      Reserved_11_12  at 0 range 11 .. 12;
      USE_GPIO_1HZ    at 0 range 13 .. 13;
      Reserved_14_15  at 0 range 14 .. 15;
      USING_XOSC      at 0 range 16 .. 16;
      USING_LPOSC     at 0 range 17 .. 17;
      USING_GPIO_1KHZ at 0 range 18 .. 18;
      USING_GPIO_1HZ  at 0 range 19 .. 19;
      Reserved_20_31  at 0 range 20 .. 31;
   end record;

   subtype PWRUP_SOURCE_Field is HAL.UInt6;

   type PWRUP0_DIRECTION_Field is
     (low_falling,
      high_rising)
     with Size => 1;
   for PWRUP0_DIRECTION_Field use
     (low_falling => 0,
      high_rising => 1);

   --  Edge or level detect. Edge will detect a 0 to 1 transition (or 1 to 0
   --  transition). Level will detect a 1 or 0. Both types of event get latched
   --  into the current_pwrup_req register.
   type PWRUP0_MODE_Field is
     (level,
      edge)
     with Size => 1;
   for PWRUP0_MODE_Field use
     (level => 0,
      edge => 1);

   --  4 GPIO powerup events can be configured to wake the chip up from a low
   --  power state. The pwrups are level/edge sensitive and can be set to
   --  trigger on a high/rising or low/falling event The number of gpios
   --  available depends on the package option. An invalid selection will be
   --  ignored source = 0 selects gpio0 . . source = 47 selects gpio47 source =
   --  48 selects qspi_ss source = 49 selects qspi_sd0 source = 50 selects
   --  qspi_sd1 source = 51 selects qspi_sd2 source = 52 selects qspi_sd3
   --  source = 53 selects qspi_sclk level = 0 triggers the pwrup when the
   --  source is low level = 1 triggers the pwrup when the source is high
   type PWRUP_Register is record
      SOURCE         : PWRUP_SOURCE_Field := 16#3F#;
      --  Set to 1 to enable the wakeup source. Set to 0 to disable the wakeup
      --  source and clear a pending wakeup event. If using edge detect a
      --  latched edge needs to be cleared by writing 1 to the status register
      --  also.
      ENABLE         : Boolean := False;
      DIRECTION      : PWRUP0_DIRECTION_Field :=
                        RP2350_SVD.POWMAN.low_falling;
      --  Edge or level detect. Edge will detect a 0 to 1 transition (or 1 to 0
      --  transition). Level will detect a 1 or 0. Both types of event get
      --  latched into the current_pwrup_req register.
      MODE           : PWRUP0_MODE_Field := RP2350_SVD.POWMAN.level;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Status of gpio wakeup. Write to 1 to clear a latched
      --  edge detect.
      STATUS         : Boolean := False;
      --  Read-only. Value of selected gpio pin (only if enable == 1)
      RAW_STATUS     : Boolean := False;
      --  unspecified
      Reserved_11_31 : HAL.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PWRUP_Register use record
      SOURCE         at 0 range 0 .. 5;
      ENABLE         at 0 range 6 .. 6;
      DIRECTION      at 0 range 7 .. 7;
      MODE           at 0 range 8 .. 8;
      STATUS         at 0 range 9 .. 9;
      RAW_STATUS     at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   subtype CURRENT_PWRUP_REQ_CURRENT_PWRUP_REQ_Field is HAL.UInt7;

   --  Indicates current powerup request state pwrup events can be cleared by
   --  removing the enable from the pwrup register. The alarm pwrup req can be
   --  cleared by clearing timer.alarm_enab 0 = chip reset, for the source of
   --  the last reset see POWMAN_CHIP_RESET 1 = pwrup0 2 = pwrup1 3 = pwrup2 4
   --  = pwrup3 5 = coresight_pwrup 6 = alarm_pwrup
   type CURRENT_PWRUP_REQ_Register is record
      --  Read-only.
      CURRENT_PWRUP_REQ : CURRENT_PWRUP_REQ_CURRENT_PWRUP_REQ_Field;
      --  unspecified
      Reserved_7_31     : HAL.UInt25;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CURRENT_PWRUP_REQ_Register use record
      CURRENT_PWRUP_REQ at 0 range 0 .. 6;
      Reserved_7_31     at 0 range 7 .. 31;
   end record;

   subtype LAST_SWCORE_PWRUP_LAST_SWCORE_PWRUP_Field is HAL.UInt7;

   --  Indicates which pwrup source triggered the last switched-core power up 0
   --  = chip reset, for the source of the last reset see POWMAN_CHIP_RESET 1 =
   --  pwrup0 2 = pwrup1 3 = pwrup2 4 = pwrup3 5 = coresight_pwrup 6 =
   --  alarm_pwrup
   type LAST_SWCORE_PWRUP_Register is record
      --  Read-only.
      LAST_SWCORE_PWRUP : LAST_SWCORE_PWRUP_LAST_SWCORE_PWRUP_Field;
      --  unspecified
      Reserved_7_31     : HAL.UInt25;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for LAST_SWCORE_PWRUP_Register use record
      LAST_SWCORE_PWRUP at 0 range 0 .. 6;
      Reserved_7_31     at 0 range 7 .. 31;
   end record;

   type DBG_PWRCFG_Register is record
      --  Ignore pwrup req from debugger. If pwrup req is asserted then this
      --  will prevent power down and set powerdown blocked. Set ignore to stop
      --  paying attention to pwrup_req
      IGNORE        : Boolean := False;
      --  unspecified
      Reserved_1_31 : HAL.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DBG_PWRCFG_Register use record
      IGNORE        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Tell the bootrom to ignore the BOOT0..3 registers following the next RSM
   --  reset (e.g. the next core power down/up). If an early boot stage has
   --  soft-locked some OTP pages in order to protect their contents from later
   --  stages, there is a risk that Secure code running at a later stage can
   --  unlock the pages by powering the core up and down. This register can be
   --  used to ensure that the bootloader runs as normal on the next power up,
   --  preventing Secure code at a later stage from accessing OTP in its
   --  unlocked state. Should be used in conjunction with the OTP BOOTDIS
   --  register.
   type BOOTDIS_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. When powman resets the RSM, the current value of
      --  BOOTDIS_NEXT is OR'd into BOOTDIS_NOW, and BOOTDIS_NEXT is cleared.
      --  The bootrom checks this flag before reading the BOOT0..3 registers.
      --  If it is set, the bootrom clears it, and ignores the BOOT registers.
      --  This prevents Secure software from diverting the boot path before a
      --  bootloader has had the chance to soft lock OTP pages containing
      --  sensitive data.
      NOW           : Boolean := False;
      --  This flag always ORs writes into its current contents. It can be set
      --  but not cleared by software. The BOOTDIS_NEXT bit is OR'd into the
      --  BOOTDIS_NOW bit when the core is powered down. Simultaneously, the
      --  BOOTDIS_NEXT bit is cleared. Setting this bit means that the BOOT0..3
      --  registers will be ignored following the next reset of the RSM by
      --  powman. This flag should be set by an early boot stage that has
      --  soft-locked OTP pages, to prevent later stages from unlocking it by
      --  power cycling.
      NEXT          : Boolean := False;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOTDIS_Register use record
      NOW           at 0 range 0 .. 0;
      NEXT          at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype DBGCONFIG_DP_INSTID_Field is HAL.UInt4;

   type DBGCONFIG_Register is record
      --  Configure DP instance ID for SWD multidrop selection. Recommend that
      --  this is NOT changed until you require debug access in multi-chip
      --  environment
      DP_INSTID     : DBGCONFIG_DP_INSTID_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DBGCONFIG_Register use record
      DP_INSTID     at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  Raw Interrupts
   type INTR_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      VREG_OUTPUT_LOW     : Boolean := False;
      --  Read-only.
      TIMER               : Boolean := False;
      --  Read-only. Source is state.req_ignored
      STATE_REQ_IGNORED   : Boolean := False;
      --  Read-only. Source is state.pwrup_while_waiting
      PWRUP_WHILE_WAITING : Boolean := False;
      --  unspecified
      Reserved_4_31       : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTR_Register use record
      VREG_OUTPUT_LOW     at 0 range 0 .. 0;
      TIMER               at 0 range 1 .. 1;
      STATE_REQ_IGNORED   at 0 range 2 .. 2;
      PWRUP_WHILE_WAITING at 0 range 3 .. 3;
      Reserved_4_31       at 0 range 4 .. 31;
   end record;

   --  Interrupt Enable
   type INTE_Register is record
      VREG_OUTPUT_LOW     : Boolean := False;
      TIMER               : Boolean := False;
      --  Source is state.req_ignored
      STATE_REQ_IGNORED   : Boolean := False;
      --  Source is state.pwrup_while_waiting
      PWRUP_WHILE_WAITING : Boolean := False;
      --  unspecified
      Reserved_4_31       : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTE_Register use record
      VREG_OUTPUT_LOW     at 0 range 0 .. 0;
      TIMER               at 0 range 1 .. 1;
      STATE_REQ_IGNORED   at 0 range 2 .. 2;
      PWRUP_WHILE_WAITING at 0 range 3 .. 3;
      Reserved_4_31       at 0 range 4 .. 31;
   end record;

   --  Interrupt Force
   type INTF_Register is record
      VREG_OUTPUT_LOW     : Boolean := False;
      TIMER               : Boolean := False;
      --  Source is state.req_ignored
      STATE_REQ_IGNORED   : Boolean := False;
      --  Source is state.pwrup_while_waiting
      PWRUP_WHILE_WAITING : Boolean := False;
      --  unspecified
      Reserved_4_31       : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTF_Register use record
      VREG_OUTPUT_LOW     at 0 range 0 .. 0;
      TIMER               at 0 range 1 .. 1;
      STATE_REQ_IGNORED   at 0 range 2 .. 2;
      PWRUP_WHILE_WAITING at 0 range 3 .. 3;
      Reserved_4_31       at 0 range 4 .. 31;
   end record;

   --  Interrupt status after masking & forcing
   type INTS_Register is record
      --  Read-only.
      VREG_OUTPUT_LOW     : Boolean;
      --  Read-only.
      TIMER               : Boolean;
      --  Read-only. Source is state.req_ignored
      STATE_REQ_IGNORED   : Boolean;
      --  Read-only. Source is state.pwrup_while_waiting
      PWRUP_WHILE_WAITING : Boolean;
      --  unspecified
      Reserved_4_31       : HAL.UInt28;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTS_Register use record
      VREG_OUTPUT_LOW     at 0 range 0 .. 0;
      TIMER               at 0 range 1 .. 1;
      STATE_REQ_IGNORED   at 0 range 2 .. 2;
      PWRUP_WHILE_WAITING at 0 range 3 .. 3;
      Reserved_4_31       at 0 range 4 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Controls vreg, bor, lposc, chip resets & xosc startup, powman and
   --  provides scratch register for general use and for bootcode use
   type POWMAN_Peripheral is record
      --  Indicates a bad password has been used
      BADPASSWD           : aliased BADPASSWD_Register;
      --  Voltage Regulator Control
      VREG_CTRL           : aliased VREG_CTRL_Register;
      --  Voltage Regulator Status
      VREG_STS            : aliased VREG_STS_Register;
      --  Voltage Regulator Settings
      VREG                : aliased VREG_Register;
      --  Voltage Regulator Low Power Entry Settings
      VREG_LP_ENTRY       : aliased VREG_LP_ENTRY_Register;
      --  Voltage Regulator Low Power Exit Settings
      VREG_LP_EXIT        : aliased VREG_LP_EXIT_Register;
      --  Brown-out Detection Control
      BOD_CTRL            : aliased BOD_CTRL_Register;
      --  Brown-out Detection Settings
      BOD                 : aliased BOD_Register;
      --  Brown-out Detection Low Power Entry Settings
      BOD_LP_ENTRY        : aliased BOD_LP_ENTRY_Register;
      --  Brown-out Detection Low Power Exit Settings
      BOD_LP_EXIT         : aliased BOD_LP_EXIT_Register;
      --  Low power oscillator control register.
      LPOSC               : aliased LPOSC_Register;
      --  Chip reset control and status
      CHIP_RESET          : aliased CHIP_RESET_Register;
      --  Allows a watchdog reset to reset the internal state of powman in
      --  addition to the power-on state machine (PSM). Note that powman
      --  ignores watchdog resets that do not select at least the CLOCKS stage
      --  or earlier stages in the PSM. If using these bits, it's recommended
      --  to set PSM_WDSEL to all-ones in addition to the desired bits in this
      --  register. Failing to select CLOCKS or earlier will result in the
      --  POWMAN_WDSEL register having no effect.
      WDSEL               : aliased WDSEL_Register;
      --  For configuration of the power sequencer Writes are ignored while
      --  POWMAN_STATE_CHANGING=1
      SEQ_CFG             : aliased SEQ_CFG_Register;
      --  This register controls the power state of the 4 power domains. The
      --  current power state is indicated in POWMAN_STATE_CURRENT which is
      --  read-only. To change the state, write to POWMAN_STATE_REQ. The coding
      --  of POWMAN_STATE_CURRENT & POWMAN_STATE_REQ corresponds to the power
      --  states defined in the datasheet: bit 3 = SWCORE bit 2 = XIP cache bit
      --  1 = SRAM0 bit 0 = SRAM1 0 = powered up 1 = powered down When
      --  POWMAN_STATE_REQ is written, the POWMAN_STATE_WAITING flag is set
      --  while the Power Manager determines what is required. If an invalid
      --  transition is requested the Power Manager will still register the
      --  request in POWMAN_STATE_REQ but will also set the POWMAN_BAD_REQ
      --  flag. It will then implement the power-up requests and ignore the
      --  power down requests. To do nothing would risk entering an
      --  unrecoverable lock-up state. Invalid requests are: any combination of
      --  power up and power down requests any request that results in swcore
      --  boing powered and xip unpowered If the request is to power down the
      --  switched-core domain then POWMAN_STATE_WAITING stays active until the
      --  processors halt. During this time the POWMAN_STATE_REQ field can be
      --  re-written to change or cancel the request. When the power state
      --  transition begins the POWMAN_STATE_WAITING_flag is cleared, the
      --  POWMAN_STATE_CHANGING flag is set and POWMAN register writes are
      --  ignored until the transition completes.
      STATE               : aliased STATE_Register;
      POW_FASTDIV         : aliased POW_FASTDIV_Register;
      --  power state machine delays
      POW_DELAY           : aliased POW_DELAY_Register;
      --  Configures a gpio as a power mode aware control output
      EXT_CTRL0           : aliased EXT_CTRL_Register;
      --  Configures a gpio as a power mode aware control output
      EXT_CTRL1           : aliased EXT_CTRL_Register;
      --  Select a GPIO to use as a time reference, the source can be used to
      --  drive the low power clock at 32kHz, or to provide a 1ms tick to the
      --  timer, or provide a 1Hz tick to the timer. The tick selection is
      --  controlled by the POWMAN_TIMER register.
      EXT_TIME_REF        : aliased EXT_TIME_REF_Register;
      --  Informs the AON Timer of the integer component of the clock frequency
      --  when running off the LPOSC.
      LPOSC_FREQ_KHZ_INT  : aliased LPOSC_FREQ_KHZ_INT_Register;
      --  Informs the AON Timer of the fractional component of the clock
      --  frequency when running off the LPOSC.
      LPOSC_FREQ_KHZ_FRAC : aliased LPOSC_FREQ_KHZ_FRAC_Register;
      --  Informs the AON Timer of the integer component of the clock frequency
      --  when running off the XOSC.
      XOSC_FREQ_KHZ_INT   : aliased XOSC_FREQ_KHZ_INT_Register;
      --  Informs the AON Timer of the fractional component of the clock
      --  frequency when running off the XOSC.
      XOSC_FREQ_KHZ_FRAC  : aliased XOSC_FREQ_KHZ_FRAC_Register;
      SET_TIME_63TO48     : aliased SET_TIME_63TO48_Register;
      SET_TIME_47TO32     : aliased SET_TIME_47TO32_Register;
      SET_TIME_31TO16     : aliased SET_TIME_31TO16_Register;
      SET_TIME_15TO0      : aliased SET_TIME_15TO0_Register;
      READ_TIME_UPPER     : aliased HAL.UInt32;
      READ_TIME_LOWER     : aliased HAL.UInt32;
      ALARM_TIME_63TO48   : aliased ALARM_TIME_63TO48_Register;
      ALARM_TIME_47TO32   : aliased ALARM_TIME_47TO32_Register;
      ALARM_TIME_31TO16   : aliased ALARM_TIME_31TO16_Register;
      ALARM_TIME_15TO0    : aliased ALARM_TIME_15TO0_Register;
      TIMER               : aliased TIMER_Register;
      --  4 GPIO powerup events can be configured to wake the chip up from a
      --  low power state. The pwrups are level/edge sensitive and can be set
      --  to trigger on a high/rising or low/falling event The number of gpios
      --  available depends on the package option. An invalid selection will be
      --  ignored source = 0 selects gpio0 . . source = 47 selects gpio47
      --  source = 48 selects qspi_ss source = 49 selects qspi_sd0 source = 50
      --  selects qspi_sd1 source = 51 selects qspi_sd2 source = 52 selects
      --  qspi_sd3 source = 53 selects qspi_sclk level = 0 triggers the pwrup
      --  when the source is low level = 1 triggers the pwrup when the source
      --  is high
      PWRUP0              : aliased PWRUP_Register;
      --  4 GPIO powerup events can be configured to wake the chip up from a
      --  low power state. The pwrups are level/edge sensitive and can be set
      --  to trigger on a high/rising or low/falling event The number of gpios
      --  available depends on the package option. An invalid selection will be
      --  ignored source = 0 selects gpio0 . . source = 47 selects gpio47
      --  source = 48 selects qspi_ss source = 49 selects qspi_sd0 source = 50
      --  selects qspi_sd1 source = 51 selects qspi_sd2 source = 52 selects
      --  qspi_sd3 source = 53 selects qspi_sclk level = 0 triggers the pwrup
      --  when the source is low level = 1 triggers the pwrup when the source
      --  is high
      PWRUP1              : aliased PWRUP_Register;
      --  4 GPIO powerup events can be configured to wake the chip up from a
      --  low power state. The pwrups are level/edge sensitive and can be set
      --  to trigger on a high/rising or low/falling event The number of gpios
      --  available depends on the package option. An invalid selection will be
      --  ignored source = 0 selects gpio0 . . source = 47 selects gpio47
      --  source = 48 selects qspi_ss source = 49 selects qspi_sd0 source = 50
      --  selects qspi_sd1 source = 51 selects qspi_sd2 source = 52 selects
      --  qspi_sd3 source = 53 selects qspi_sclk level = 0 triggers the pwrup
      --  when the source is low level = 1 triggers the pwrup when the source
      --  is high
      PWRUP2              : aliased PWRUP_Register;
      --  4 GPIO powerup events can be configured to wake the chip up from a
      --  low power state. The pwrups are level/edge sensitive and can be set
      --  to trigger on a high/rising or low/falling event The number of gpios
      --  available depends on the package option. An invalid selection will be
      --  ignored source = 0 selects gpio0 . . source = 47 selects gpio47
      --  source = 48 selects qspi_ss source = 49 selects qspi_sd0 source = 50
      --  selects qspi_sd1 source = 51 selects qspi_sd2 source = 52 selects
      --  qspi_sd3 source = 53 selects qspi_sclk level = 0 triggers the pwrup
      --  when the source is low level = 1 triggers the pwrup when the source
      --  is high
      PWRUP3              : aliased PWRUP_Register;
      --  Indicates current powerup request state pwrup events can be cleared
      --  by removing the enable from the pwrup register. The alarm pwrup req
      --  can be cleared by clearing timer.alarm_enab 0 = chip reset, for the
      --  source of the last reset see POWMAN_CHIP_RESET 1 = pwrup0 2 = pwrup1
      --  3 = pwrup2 4 = pwrup3 5 = coresight_pwrup 6 = alarm_pwrup
      CURRENT_PWRUP_REQ   : aliased CURRENT_PWRUP_REQ_Register;
      --  Indicates which pwrup source triggered the last switched-core power
      --  up 0 = chip reset, for the source of the last reset see
      --  POWMAN_CHIP_RESET 1 = pwrup0 2 = pwrup1 3 = pwrup2 4 = pwrup3 5 =
      --  coresight_pwrup 6 = alarm_pwrup
      LAST_SWCORE_PWRUP   : aliased LAST_SWCORE_PWRUP_Register;
      DBG_PWRCFG          : aliased DBG_PWRCFG_Register;
      --  Tell the bootrom to ignore the BOOT0..3 registers following the next
      --  RSM reset (e.g. the next core power down/up). If an early boot stage
      --  has soft-locked some OTP pages in order to protect their contents
      --  from later stages, there is a risk that Secure code running at a
      --  later stage can unlock the pages by powering the core up and down.
      --  This register can be used to ensure that the bootloader runs as
      --  normal on the next power up, preventing Secure code at a later stage
      --  from accessing OTP in its unlocked state. Should be used in
      --  conjunction with the OTP BOOTDIS register.
      BOOTDIS             : aliased BOOTDIS_Register;
      DBGCONFIG           : aliased DBGCONFIG_Register;
      --  Scratch register. Information persists in low power mode
      SCRATCH0            : aliased HAL.UInt32;
      --  Scratch register. Information persists in low power mode
      SCRATCH1            : aliased HAL.UInt32;
      --  Scratch register. Information persists in low power mode
      SCRATCH2            : aliased HAL.UInt32;
      --  Scratch register. Information persists in low power mode
      SCRATCH3            : aliased HAL.UInt32;
      --  Scratch register. Information persists in low power mode
      SCRATCH4            : aliased HAL.UInt32;
      --  Scratch register. Information persists in low power mode
      SCRATCH5            : aliased HAL.UInt32;
      --  Scratch register. Information persists in low power mode
      SCRATCH6            : aliased HAL.UInt32;
      --  Scratch register. Information persists in low power mode
      SCRATCH7            : aliased HAL.UInt32;
      --  Scratch register. Information persists in low power mode
      BOOT0               : aliased HAL.UInt32;
      --  Scratch register. Information persists in low power mode
      BOOT1               : aliased HAL.UInt32;
      --  Scratch register. Information persists in low power mode
      BOOT2               : aliased HAL.UInt32;
      --  Scratch register. Information persists in low power mode
      BOOT3               : aliased HAL.UInt32;
      --  Raw Interrupts
      INTR                : aliased INTR_Register;
      --  Interrupt Enable
      INTE                : aliased INTE_Register;
      --  Interrupt Force
      INTF                : aliased INTF_Register;
      --  Interrupt status after masking & forcing
      INTS                : aliased INTS_Register;
   end record
     with Volatile;

   for POWMAN_Peripheral use record
      BADPASSWD           at 16#0# range 0 .. 31;
      VREG_CTRL           at 16#4# range 0 .. 31;
      VREG_STS            at 16#8# range 0 .. 31;
      VREG                at 16#C# range 0 .. 31;
      VREG_LP_ENTRY       at 16#10# range 0 .. 31;
      VREG_LP_EXIT        at 16#14# range 0 .. 31;
      BOD_CTRL            at 16#18# range 0 .. 31;
      BOD                 at 16#1C# range 0 .. 31;
      BOD_LP_ENTRY        at 16#20# range 0 .. 31;
      BOD_LP_EXIT         at 16#24# range 0 .. 31;
      LPOSC               at 16#28# range 0 .. 31;
      CHIP_RESET          at 16#2C# range 0 .. 31;
      WDSEL               at 16#30# range 0 .. 31;
      SEQ_CFG             at 16#34# range 0 .. 31;
      STATE               at 16#38# range 0 .. 31;
      POW_FASTDIV         at 16#3C# range 0 .. 31;
      POW_DELAY           at 16#40# range 0 .. 31;
      EXT_CTRL0           at 16#44# range 0 .. 31;
      EXT_CTRL1           at 16#48# range 0 .. 31;
      EXT_TIME_REF        at 16#4C# range 0 .. 31;
      LPOSC_FREQ_KHZ_INT  at 16#50# range 0 .. 31;
      LPOSC_FREQ_KHZ_FRAC at 16#54# range 0 .. 31;
      XOSC_FREQ_KHZ_INT   at 16#58# range 0 .. 31;
      XOSC_FREQ_KHZ_FRAC  at 16#5C# range 0 .. 31;
      SET_TIME_63TO48     at 16#60# range 0 .. 31;
      SET_TIME_47TO32     at 16#64# range 0 .. 31;
      SET_TIME_31TO16     at 16#68# range 0 .. 31;
      SET_TIME_15TO0      at 16#6C# range 0 .. 31;
      READ_TIME_UPPER     at 16#70# range 0 .. 31;
      READ_TIME_LOWER     at 16#74# range 0 .. 31;
      ALARM_TIME_63TO48   at 16#78# range 0 .. 31;
      ALARM_TIME_47TO32   at 16#7C# range 0 .. 31;
      ALARM_TIME_31TO16   at 16#80# range 0 .. 31;
      ALARM_TIME_15TO0    at 16#84# range 0 .. 31;
      TIMER               at 16#88# range 0 .. 31;
      PWRUP0              at 16#8C# range 0 .. 31;
      PWRUP1              at 16#90# range 0 .. 31;
      PWRUP2              at 16#94# range 0 .. 31;
      PWRUP3              at 16#98# range 0 .. 31;
      CURRENT_PWRUP_REQ   at 16#9C# range 0 .. 31;
      LAST_SWCORE_PWRUP   at 16#A0# range 0 .. 31;
      DBG_PWRCFG          at 16#A4# range 0 .. 31;
      BOOTDIS             at 16#A8# range 0 .. 31;
      DBGCONFIG           at 16#AC# range 0 .. 31;
      SCRATCH0            at 16#B0# range 0 .. 31;
      SCRATCH1            at 16#B4# range 0 .. 31;
      SCRATCH2            at 16#B8# range 0 .. 31;
      SCRATCH3            at 16#BC# range 0 .. 31;
      SCRATCH4            at 16#C0# range 0 .. 31;
      SCRATCH5            at 16#C4# range 0 .. 31;
      SCRATCH6            at 16#C8# range 0 .. 31;
      SCRATCH7            at 16#CC# range 0 .. 31;
      BOOT0               at 16#D0# range 0 .. 31;
      BOOT1               at 16#D4# range 0 .. 31;
      BOOT2               at 16#D8# range 0 .. 31;
      BOOT3               at 16#DC# range 0 .. 31;
      INTR                at 16#E0# range 0 .. 31;
      INTE                at 16#E4# range 0 .. 31;
      INTF                at 16#E8# range 0 .. 31;
      INTS                at 16#EC# range 0 .. 31;
   end record;

   --  Controls vreg, bor, lposc, chip resets & xosc startup, powman and
   --  provides scratch register for general use and for bootcode use
   POWMAN_Periph : aliased POWMAN_Peripheral
     with Import, Address => POWMAN_Base;

end RP2350_SVD.POWMAN;
