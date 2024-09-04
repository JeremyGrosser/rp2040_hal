pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

--  SNPS OTP control IF (SBPI and RPi wrapper control)
package RP2350_SVD.OTP is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Secure lock status. Writes are OR'd with the current value. This field
   --  is read-only to Non-secure code.
   type SW_LOCK0_SEC_Field is
     (read_write,
      read_only,
      inaccessible)
     with Size => 2;
   for SW_LOCK0_SEC_Field use
     (read_write => 0,
      read_only => 1,
      inaccessible => 3);

   --  Non-secure lock status. Writes are OR'd with the current value.
   type SW_LOCK0_NSEC_Field is
     (read_write,
      read_only,
      inaccessible)
     with Size => 2;
   for SW_LOCK0_NSEC_Field use
     (read_write => 0,
      read_only => 1,
      inaccessible => 3);

   --  Software lock register for page 0. Locks are initialised from the OTP
   --  lock pages at reset. This register can be written to further advance the
   --  lock state of each page (until next reset), and read to check the
   --  current lock state of a page.
   type SW_LOCK_Register is record
      --  Secure lock status. Writes are OR'd with the current value. This
      --  field is read-only to Non-secure code.
      SEC           : SW_LOCK0_SEC_Field := RP2350_SVD.OTP.read_write;
      --  Non-secure lock status. Writes are OR'd with the current value.
      NSEC          : SW_LOCK0_NSEC_Field := RP2350_SVD.OTP.read_write;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SW_LOCK_Register use record
      SEC           at 0 range 0 .. 1;
      NSEC          at 0 range 2 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype SBPI_INSTR_SHORT_WDATA_Field is HAL.UInt8;
   subtype SBPI_INSTR_CMD_Field is HAL.UInt8;
   subtype SBPI_INSTR_TARGET_Field is HAL.UInt8;
   subtype SBPI_INSTR_PAYLOAD_SIZE_M1_Field is HAL.UInt4;

   --  Dispatch instructions to the SBPI interface, used for programming the
   --  OTP fuses.
   type SBPI_INSTR_Register is record
      --  wdata to be used only when payload_size_m1=0
      SHORT_WDATA     : SBPI_INSTR_SHORT_WDATA_Field := 16#0#;
      CMD             : SBPI_INSTR_CMD_Field := 16#0#;
      --  Instruction target, it can be PMC (0x3a) or DAP (0x02)
      TARGET          : SBPI_INSTR_TARGET_Field := 16#0#;
      --  Instruction payload size in bytes minus 1
      PAYLOAD_SIZE_M1 : SBPI_INSTR_PAYLOAD_SIZE_M1_Field := 16#0#;
      --  Instruction has payload (data to be written or to be read)
      HAS_PAYLOAD     : Boolean := False;
      --  Payload type is write
      IS_WR           : Boolean := False;
      --  Write-only. Execute instruction
      EXEC            : Boolean := False;
      --  unspecified
      Reserved_31_31  : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SBPI_INSTR_Register use record
      SHORT_WDATA     at 0 range 0 .. 7;
      CMD             at 0 range 8 .. 15;
      TARGET          at 0 range 16 .. 23;
      PAYLOAD_SIZE_M1 at 0 range 24 .. 27;
      HAS_PAYLOAD     at 0 range 28 .. 28;
      IS_WR           at 0 range 29 .. 29;
      EXEC            at 0 range 30 .. 30;
      Reserved_31_31  at 0 range 31 .. 31;
   end record;

   subtype SBPI_STATUS_MISO_Field is HAL.UInt8;

   type SBPI_STATUS_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Read command has returned data
      RDATA_VLD      : Boolean := False;
      --  unspecified
      Reserved_1_3   : HAL.UInt3 := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Last instruction done
      INSTR_DONE     : Boolean := False;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Last instruction missed (dropped), as the previous has
      --  not finished running
      INSTR_MISS     : Boolean := False;
      --  unspecified
      Reserved_9_11  : HAL.UInt3 := 16#0#;
      --  Read-only. SBPI flag
      FLAG           : Boolean := False;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
      --  Read-only. SBPI MISO (master in - slave out): response from SBPI
      MISO           : SBPI_STATUS_MISO_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SBPI_STATUS_Register use record
      RDATA_VLD      at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      INSTR_DONE     at 0 range 4 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      INSTR_MISS     at 0 range 8 .. 8;
      Reserved_9_11  at 0 range 9 .. 11;
      FLAG           at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      MISO           at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Controls for APB data read interface (USER interface)
   type USR_Register is record
      --  1 enables USER interface; 0 disables USER interface (enables SBPI).
      --  This bit must be cleared before performing any SBPI access, such as
      --  when programming the OTP. The APB data read interface (USER
      --  interface) will be inaccessible during this time, and will return a
      --  bus error if any read is attempted.
      DCTRL         : Boolean := True;
      --  unspecified
      Reserved_1_3  : HAL.UInt3 := 16#0#;
      --  Power-down; 1 disables current reference. Must be 0 to read data from
      --  the OTP.
      PD            : Boolean := False;
      --  unspecified
      Reserved_5_31 : HAL.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for USR_Register use record
      DCTRL         at 0 range 0 .. 0;
      Reserved_1_3  at 0 range 1 .. 3;
      PD            at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype DBG_PSM_STATE_Field is HAL.UInt4;

   --  Debug for OTP power-on state machine
   type DBG_Register is record
      --  Read-only. PSM done status flag
      PSM_DONE          : Boolean := False;
      --  Read-only. PSM boot done status flag
      BOOT_DONE         : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Ring oscillator was seen up and running
      ROSC_UP_SEEN      : Boolean := False;
      --  Read-only. Ring oscillator is up and running
      ROSC_UP           : Boolean := False;
      --  Read-only. Monitor the PSM FSM's state
      PSM_STATE         : DBG_PSM_STATE_Field := 16#0#;
      --  unspecified
      Reserved_8_11     : HAL.UInt4 := 16#0#;
      --  Read-only. The chip is in RMA mode
      CUSTOMER_RMA_FLAG : Boolean := False;
      --  unspecified
      Reserved_13_31    : HAL.UInt19 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DBG_Register use record
      PSM_DONE          at 0 range 0 .. 0;
      BOOT_DONE         at 0 range 1 .. 1;
      ROSC_UP_SEEN      at 0 range 2 .. 2;
      ROSC_UP           at 0 range 3 .. 3;
      PSM_STATE         at 0 range 4 .. 7;
      Reserved_8_11     at 0 range 8 .. 11;
      CUSTOMER_RMA_FLAG at 0 range 12 .. 12;
      Reserved_13_31    at 0 range 13 .. 31;
   end record;

   subtype BIST_CNT_Field is HAL.UInt13;
   subtype BIST_CNT_MAX_Field is HAL.UInt12;

   --  During BIST, count address locations that have at least one leaky bit
   type BIST_Register is record
      --  Read-only. Number of locations that have at least one leaky bit.
      --  Note: This count is true only if the BIST was initiated without the
      --  fix option.
      CNT            : BIST_CNT_Field := 16#0#;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
      --  The cnt_fail flag will be set if the number of leaky locations
      --  exceeds this number
      CNT_MAX        : BIST_CNT_MAX_Field := 16#FFF#;
      --  Enable the counter before the BIST function is initiated
      CNT_ENA        : Boolean := False;
      --  Write-only. Clear counter before use
      CNT_CLR        : Boolean := False;
      --  Read-only. Flag if the count of address locations with at least one
      --  leaky bit exceeds cnt_max
      CNT_FAIL       : Boolean := False;
      --  unspecified
      Reserved_31_31 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BIST_Register use record
      CNT            at 0 range 0 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      CNT_MAX        at 0 range 16 .. 27;
      CNT_ENA        at 0 range 28 .. 28;
      CNT_CLR        at 0 range 29 .. 29;
      CNT_FAIL       at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   subtype CRITICAL_GLITCH_DETECTOR_SENS_Field is HAL.UInt2;

   --  Quickly check values of critical flags read during boot up
   type CRITICAL_Register is record
      --  Read-only.
      SECURE_BOOT_ENABLE     : Boolean;
      --  Read-only.
      SECURE_DEBUG_DISABLE   : Boolean;
      --  Read-only.
      DEBUG_DISABLE          : Boolean;
      --  Read-only.
      DEFAULT_ARCHSEL        : Boolean;
      --  Read-only.
      GLITCH_DETECTOR_ENABLE : Boolean;
      --  Read-only.
      GLITCH_DETECTOR_SENS   : CRITICAL_GLITCH_DETECTOR_SENS_Field;
      --  unspecified
      Reserved_7_15          : HAL.UInt9;
      --  Read-only.
      ARM_DISABLE            : Boolean;
      --  Read-only.
      RISCV_DISABLE          : Boolean;
      --  unspecified
      Reserved_18_31         : HAL.UInt14;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRITICAL_Register use record
      SECURE_BOOT_ENABLE     at 0 range 0 .. 0;
      SECURE_DEBUG_DISABLE   at 0 range 1 .. 1;
      DEBUG_DISABLE          at 0 range 2 .. 2;
      DEFAULT_ARCHSEL        at 0 range 3 .. 3;
      GLITCH_DETECTOR_ENABLE at 0 range 4 .. 4;
      GLITCH_DETECTOR_SENS   at 0 range 5 .. 6;
      Reserved_7_15          at 0 range 7 .. 15;
      ARM_DISABLE            at 0 range 16 .. 16;
      RISCV_DISABLE          at 0 range 17 .. 17;
      Reserved_18_31         at 0 range 18 .. 31;
   end record;

   subtype KEY_VALID_KEY_VALID_Field is HAL.UInt8;

   --  Which keys were valid (enrolled) at boot time
   type KEY_VALID_Register is record
      --  Read-only.
      KEY_VALID     : KEY_VALID_KEY_VALID_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEY_VALID_Register use record
      KEY_VALID     at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  Enable a debug feature that has been disabled. Debug features are
   --  disabled if one of the relevant critical boot flags is set in OTP
   --  (DEBUG_DISABLE or SECURE_DEBUG_DISABLE), OR if a debug key is marked
   --  valid in OTP, and the matching key value has not been supplied over SWD.
   --  Specifically: - The DEBUG_DISABLE flag disables all debug features. This
   --  can be fully overridden by setting all bits of this register. - The
   --  SECURE_DEBUG_DISABLE flag disables secure processor debug. This can be
   --  fully overridden by setting the PROC0_SECURE and PROC1_SECURE bits of
   --  this register. - If a single debug key has been registered, and no
   --  matching key value has been supplied over SWD, then all debug features
   --  are disabled. This can be fully overridden by setting all bits of this
   --  register. - If both debug keys have been registered, and the Non-secure
   --  key's value (key 6) has been supplied over SWD, secure processor debug
   --  is disabled. This can be fully overridden by setting the PROC0_SECURE
   --  and PROC1_SECURE bits of this register. - If both debug keys have been
   --  registered, and the Secure key's value (key 5) has been supplied over
   --  SWD, then no debug features are disabled by the key mechanism. However,
   --  note that in this case debug features may still be disabled by the
   --  critical boot flags.
   type DEBUGEN_Register is record
      --  Enable core 0's Mem-AP if it is currently disabled. The Mem-AP is
      --  disabled by default if either of the debug disable critical flags is
      --  set, or if at least one debug key has been enrolled and the least
      --  secure of these enrolled key values has not been provided over SWD.
      --  Note also that core Mem-APs are unconditionally disabled when a core
      --  is switched to RISC-V mode (by setting the ARCHSEL bit and performing
      --  a warm reset of the core).
      PROC0         : Boolean := False;
      --  Permit core 0's Mem-AP to generate Secure accesses, assuming it is
      --  enabled at all. Also enable secure debug of core 0 (SPIDEN and
      --  SPNIDEN). Secure debug of core 0 is disabled by default if the secure
      --  debug disable critical flag is set, or if at least one debug key has
      --  been enrolled and the most secure of these enrolled key values not
      --  yet provided over SWD. Note also that core Mem-APs are
      --  unconditionally disabled when a core is switched to RISC-V mode (by
      --  setting the ARCHSEL bit and performing a warm reset of the core).
      PROC0_SECURE  : Boolean := False;
      --  Enable core 1's Mem-AP if it is currently disabled. The Mem-AP is
      --  disabled by default if either of the debug disable critical flags is
      --  set, or if at least one debug key has been enrolled and the least
      --  secure of these enrolled key values has not been provided over SWD.
      PROC1         : Boolean := False;
      --  Permit core 1's Mem-AP to generate Secure accesses, assuming it is
      --  enabled at all. Also enable secure debug of core 1 (SPIDEN and
      --  SPNIDEN). Secure debug of core 1 is disabled by default if the secure
      --  debug disable critical flag is set, or if at least one debug key has
      --  been enrolled and the most secure of these enrolled key values not
      --  yet provided over SWD.
      PROC1_SECURE  : Boolean := False;
      --  unspecified
      Reserved_4_7  : HAL.UInt4 := 16#0#;
      --  Enable other debug components. Specifically, the CTI, and the APB-AP
      --  used to access the RISC-V Debug Module. These components are disabled
      --  by default if either of the debug disable critical flags is set, or
      --  if at least one debug key has been enrolled and the least secure of
      --  these enrolled key values has not been provided over SWD.
      MISC          : Boolean := False;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DEBUGEN_Register use record
      PROC0         at 0 range 0 .. 0;
      PROC0_SECURE  at 0 range 1 .. 1;
      PROC1         at 0 range 2 .. 2;
      PROC1_SECURE  at 0 range 3 .. 3;
      Reserved_4_7  at 0 range 4 .. 7;
      MISC          at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  Write 1s to lock corresponding bits in DEBUGEN. This register is reset
   --  by the processor cold reset.
   type DEBUGEN_LOCK_Register is record
      --  Write 1 to lock the PROC0 bit of DEBUGEN. Can't be cleared once set.
      PROC0         : Boolean := False;
      --  Write 1 to lock the PROC0_SECURE bit of DEBUGEN. Can't be cleared
      --  once set.
      PROC0_SECURE  : Boolean := False;
      --  Write 1 to lock the PROC1 bit of DEBUGEN. Can't be cleared once set.
      PROC1         : Boolean := False;
      --  Write 1 to lock the PROC1_SECURE bit of DEBUGEN. Can't be cleared
      --  once set.
      PROC1_SECURE  : Boolean := False;
      --  unspecified
      Reserved_4_7  : HAL.UInt4 := 16#0#;
      --  Write 1 to lock the MISC bit of DEBUGEN. Can't be cleared once set.
      MISC          : Boolean := False;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DEBUGEN_LOCK_Register use record
      PROC0         at 0 range 0 .. 0;
      PROC0_SECURE  at 0 range 1 .. 1;
      PROC1         at 0 range 2 .. 2;
      PROC1_SECURE  at 0 range 3 .. 3;
      Reserved_4_7  at 0 range 4 .. 7;
      MISC          at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  Select architecture for core 0.
   type ARCHSEL_CORE0_Field is
     (--  Switch core 0 to Arm (Cortex-M33)
      arm,
      --  Switch core 0 to RISC-V (Hazard3)
      riscv)
     with Size => 1;
   for ARCHSEL_CORE0_Field use
     (arm => 0,
      riscv => 1);

   --  Select architecture for core 1.
   type ARCHSEL_CORE1_Field is
     (--  Switch core 1 to Arm (Cortex-M33)
      arm,
      --  Switch core 1 to RISC-V (Hazard3)
      riscv)
     with Size => 1;
   for ARCHSEL_CORE1_Field use
     (arm => 0,
      riscv => 1);

   --  Architecture select (Arm/RISC-V). The default and allowable values of
   --  this register are constrained by the critical boot flags. This register
   --  is reset by the earliest reset in the switched core power domain (before
   --  a processor cold reset). Cores sample their architecture select signal
   --  on a warm reset. The source of the warm reset could be the system
   --  power-up state machine, the watchdog timer, Arm SYSRESETREQ or from
   --  RISC-V hartresetreq. Note that when an Arm core is deselected, its cold
   --  reset domain is also held in reset, since in particular the SYSRESETREQ
   --  bit becomes inaccessible once the core is deselected. Note also the
   --  RISC-V cores do not have a cold reset domain, since their corresponding
   --  controls are located in the Debug Module.
   type ARCHSEL_Register is record
      --  Select architecture for core 0.
      CORE0         : ARCHSEL_CORE0_Field := RP2350_SVD.OTP.arm;
      --  Select architecture for core 1.
      CORE1         : ARCHSEL_CORE1_Field := RP2350_SVD.OTP.arm;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ARCHSEL_Register use record
      CORE0         at 0 range 0 .. 0;
      CORE1         at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   --  Current architecture for core 0. Updated on processor warm reset.
   type ARCHSEL_STATUS_CORE0_Field is
     (--  Core 0 is currently Arm (Cortex-M33)
      arm,
      --  Core 0 is currently RISC-V (Hazard3)
      riscv)
     with Size => 1;
   for ARCHSEL_STATUS_CORE0_Field use
     (arm => 0,
      riscv => 1);

   --  Current architecture for core 0. Updated on processor warm reset.
   type ARCHSEL_STATUS_CORE1_Field is
     (--  Core 1 is currently Arm (Cortex-M33)
      arm,
      --  Core 1 is currently RISC-V (Hazard3)
      riscv)
     with Size => 1;
   for ARCHSEL_STATUS_CORE1_Field use
     (arm => 0,
      riscv => 1);

   --  Get the current architecture select state of each core. Cores sample the
   --  current value of the ARCHSEL register when their warm reset is released,
   --  at which point the corresponding bit in this register will also update.
   type ARCHSEL_STATUS_Register is record
      --  Read-only. Current architecture for core 0. Updated on processor warm
      --  reset.
      CORE0         : ARCHSEL_STATUS_CORE0_Field;
      --  Read-only. Current architecture for core 0. Updated on processor warm
      --  reset.
      CORE1         : ARCHSEL_STATUS_CORE1_Field;
      --  unspecified
      Reserved_2_31 : HAL.UInt30;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ARCHSEL_STATUS_Register use record
      CORE0         at 0 range 0 .. 0;
      CORE1         at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   --  Tell the bootrom to ignore scratch register boot vectors (both power
   --  manager and watchdog) on the next power up. If an early boot stage has
   --  soft-locked some OTP pages in order to protect their contents from later
   --  stages, there is a risk that Secure code running at a later stage can
   --  unlock the pages by performing a watchdog reset that resets the OTP.
   --  This register can be used to ensure that the bootloader runs as normal
   --  on the next power up, preventing Secure code at a later stage from
   --  accessing OTP in its unlocked state. Should be used in conjunction with
   --  the power manager BOOTDIS register.
   type BOOTDIS_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. When the core is powered down, the current value of
      --  BOOTDIS_NEXT is OR'd into BOOTDIS_NOW, and BOOTDIS_NEXT is cleared.
      --  The bootrom checks this flag before reading the boot scratch
      --  registers. If it is set, the bootrom clears it, and ignores the BOOT
      --  registers. This prevents Secure software from diverting the boot path
      --  before a bootloader has had the chance to soft lock OTP pages
      --  containing sensitive data.
      NOW           : Boolean := False;
      --  This flag always ORs writes into its current contents. It can be set
      --  but not cleared by software. The BOOTDIS_NEXT bit is OR'd into the
      --  BOOTDIS_NOW bit when the core is powered down. Simultaneously, the
      --  BOOTDIS_NEXT bit is cleared. Setting this bit means that the boot
      --  scratch registers will be ignored following the next core power down.
      --  This flag should be set by an early boot stage that has soft-locked
      --  OTP pages, to prevent later stages from unlocking it via watchdog
      --  reset.
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

   --  Raw Interrupts
   type INTR_Register is record
      --  Read-only.
      SBPI_FLAG_N      : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      SBPI_WR_FAIL     : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      APB_DCTRL_FAIL   : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      APB_RD_SEC_FAIL  : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      APB_RD_NSEC_FAIL : Boolean := False;
      --  unspecified
      Reserved_5_31    : HAL.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTR_Register use record
      SBPI_FLAG_N      at 0 range 0 .. 0;
      SBPI_WR_FAIL     at 0 range 1 .. 1;
      APB_DCTRL_FAIL   at 0 range 2 .. 2;
      APB_RD_SEC_FAIL  at 0 range 3 .. 3;
      APB_RD_NSEC_FAIL at 0 range 4 .. 4;
      Reserved_5_31    at 0 range 5 .. 31;
   end record;

   --  Interrupt Enable
   type INTE_Register is record
      SBPI_FLAG_N      : Boolean := False;
      SBPI_WR_FAIL     : Boolean := False;
      APB_DCTRL_FAIL   : Boolean := False;
      APB_RD_SEC_FAIL  : Boolean := False;
      APB_RD_NSEC_FAIL : Boolean := False;
      --  unspecified
      Reserved_5_31    : HAL.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTE_Register use record
      SBPI_FLAG_N      at 0 range 0 .. 0;
      SBPI_WR_FAIL     at 0 range 1 .. 1;
      APB_DCTRL_FAIL   at 0 range 2 .. 2;
      APB_RD_SEC_FAIL  at 0 range 3 .. 3;
      APB_RD_NSEC_FAIL at 0 range 4 .. 4;
      Reserved_5_31    at 0 range 5 .. 31;
   end record;

   --  Interrupt Force
   type INTF_Register is record
      SBPI_FLAG_N      : Boolean := False;
      SBPI_WR_FAIL     : Boolean := False;
      APB_DCTRL_FAIL   : Boolean := False;
      APB_RD_SEC_FAIL  : Boolean := False;
      APB_RD_NSEC_FAIL : Boolean := False;
      --  unspecified
      Reserved_5_31    : HAL.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTF_Register use record
      SBPI_FLAG_N      at 0 range 0 .. 0;
      SBPI_WR_FAIL     at 0 range 1 .. 1;
      APB_DCTRL_FAIL   at 0 range 2 .. 2;
      APB_RD_SEC_FAIL  at 0 range 3 .. 3;
      APB_RD_NSEC_FAIL at 0 range 4 .. 4;
      Reserved_5_31    at 0 range 5 .. 31;
   end record;

   --  Interrupt status after masking & forcing
   type INTS_Register is record
      --  Read-only.
      SBPI_FLAG_N      : Boolean;
      --  Read-only.
      SBPI_WR_FAIL     : Boolean;
      --  Read-only.
      APB_DCTRL_FAIL   : Boolean;
      --  Read-only.
      APB_RD_SEC_FAIL  : Boolean;
      --  Read-only.
      APB_RD_NSEC_FAIL : Boolean;
      --  unspecified
      Reserved_5_31    : HAL.UInt27;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTS_Register use record
      SBPI_FLAG_N      at 0 range 0 .. 0;
      SBPI_WR_FAIL     at 0 range 1 .. 1;
      APB_DCTRL_FAIL   at 0 range 2 .. 2;
      APB_RD_SEC_FAIL  at 0 range 3 .. 3;
      APB_RD_NSEC_FAIL at 0 range 4 .. 4;
      Reserved_5_31    at 0 range 5 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  SNPS OTP control IF (SBPI and RPi wrapper control)
   type OTP_Peripheral is record
      --  Software lock register for page 0. Locks are initialised from the OTP
      --  lock pages at reset. This register can be written to further advance
      --  the lock state of each page (until next reset), and read to check the
      --  current lock state of a page.
      SW_LOCK0       : aliased SW_LOCK_Register;
      --  Software lock register for page 1. Locks are initialised from the OTP
      --  lock pages at reset. This register can be written to further advance
      --  the lock state of each page (until next reset), and read to check the
      --  current lock state of a page.
      SW_LOCK1       : aliased SW_LOCK_Register;
      --  Software lock register for page 2. Locks are initialised from the OTP
      --  lock pages at reset. This register can be written to further advance
      --  the lock state of each page (until next reset), and read to check the
      --  current lock state of a page.
      SW_LOCK2       : aliased SW_LOCK_Register;
      --  Software lock register for page 3. Locks are initialised from the OTP
      --  lock pages at reset. This register can be written to further advance
      --  the lock state of each page (until next reset), and read to check the
      --  current lock state of a page.
      SW_LOCK3       : aliased SW_LOCK_Register;
      --  Software lock register for page 4. Locks are initialised from the OTP
      --  lock pages at reset. This register can be written to further advance
      --  the lock state of each page (until next reset), and read to check the
      --  current lock state of a page.
      SW_LOCK4       : aliased SW_LOCK_Register;
      --  Software lock register for page 5. Locks are initialised from the OTP
      --  lock pages at reset. This register can be written to further advance
      --  the lock state of each page (until next reset), and read to check the
      --  current lock state of a page.
      SW_LOCK5       : aliased SW_LOCK_Register;
      --  Software lock register for page 6. Locks are initialised from the OTP
      --  lock pages at reset. This register can be written to further advance
      --  the lock state of each page (until next reset), and read to check the
      --  current lock state of a page.
      SW_LOCK6       : aliased SW_LOCK_Register;
      --  Software lock register for page 7. Locks are initialised from the OTP
      --  lock pages at reset. This register can be written to further advance
      --  the lock state of each page (until next reset), and read to check the
      --  current lock state of a page.
      SW_LOCK7       : aliased SW_LOCK_Register;
      --  Software lock register for page 8. Locks are initialised from the OTP
      --  lock pages at reset. This register can be written to further advance
      --  the lock state of each page (until next reset), and read to check the
      --  current lock state of a page.
      SW_LOCK8       : aliased SW_LOCK_Register;
      --  Software lock register for page 9. Locks are initialised from the OTP
      --  lock pages at reset. This register can be written to further advance
      --  the lock state of each page (until next reset), and read to check the
      --  current lock state of a page.
      SW_LOCK9       : aliased SW_LOCK_Register;
      --  Software lock register for page 10. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK10      : aliased SW_LOCK_Register;
      --  Software lock register for page 11. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK11      : aliased SW_LOCK_Register;
      --  Software lock register for page 12. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK12      : aliased SW_LOCK_Register;
      --  Software lock register for page 13. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK13      : aliased SW_LOCK_Register;
      --  Software lock register for page 14. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK14      : aliased SW_LOCK_Register;
      --  Software lock register for page 15. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK15      : aliased SW_LOCK_Register;
      --  Software lock register for page 16. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK16      : aliased SW_LOCK_Register;
      --  Software lock register for page 17. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK17      : aliased SW_LOCK_Register;
      --  Software lock register for page 18. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK18      : aliased SW_LOCK_Register;
      --  Software lock register for page 19. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK19      : aliased SW_LOCK_Register;
      --  Software lock register for page 20. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK20      : aliased SW_LOCK_Register;
      --  Software lock register for page 21. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK21      : aliased SW_LOCK_Register;
      --  Software lock register for page 22. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK22      : aliased SW_LOCK_Register;
      --  Software lock register for page 23. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK23      : aliased SW_LOCK_Register;
      --  Software lock register for page 24. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK24      : aliased SW_LOCK_Register;
      --  Software lock register for page 25. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK25      : aliased SW_LOCK_Register;
      --  Software lock register for page 26. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK26      : aliased SW_LOCK_Register;
      --  Software lock register for page 27. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK27      : aliased SW_LOCK_Register;
      --  Software lock register for page 28. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK28      : aliased SW_LOCK_Register;
      --  Software lock register for page 29. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK29      : aliased SW_LOCK_Register;
      --  Software lock register for page 30. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK30      : aliased SW_LOCK_Register;
      --  Software lock register for page 31. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK31      : aliased SW_LOCK_Register;
      --  Software lock register for page 32. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK32      : aliased SW_LOCK_Register;
      --  Software lock register for page 33. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK33      : aliased SW_LOCK_Register;
      --  Software lock register for page 34. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK34      : aliased SW_LOCK_Register;
      --  Software lock register for page 35. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK35      : aliased SW_LOCK_Register;
      --  Software lock register for page 36. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK36      : aliased SW_LOCK_Register;
      --  Software lock register for page 37. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK37      : aliased SW_LOCK_Register;
      --  Software lock register for page 38. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK38      : aliased SW_LOCK_Register;
      --  Software lock register for page 39. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK39      : aliased SW_LOCK_Register;
      --  Software lock register for page 40. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK40      : aliased SW_LOCK_Register;
      --  Software lock register for page 41. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK41      : aliased SW_LOCK_Register;
      --  Software lock register for page 42. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK42      : aliased SW_LOCK_Register;
      --  Software lock register for page 43. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK43      : aliased SW_LOCK_Register;
      --  Software lock register for page 44. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK44      : aliased SW_LOCK_Register;
      --  Software lock register for page 45. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK45      : aliased SW_LOCK_Register;
      --  Software lock register for page 46. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK46      : aliased SW_LOCK_Register;
      --  Software lock register for page 47. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK47      : aliased SW_LOCK_Register;
      --  Software lock register for page 48. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK48      : aliased SW_LOCK_Register;
      --  Software lock register for page 49. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK49      : aliased SW_LOCK_Register;
      --  Software lock register for page 50. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK50      : aliased SW_LOCK_Register;
      --  Software lock register for page 51. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK51      : aliased SW_LOCK_Register;
      --  Software lock register for page 52. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK52      : aliased SW_LOCK_Register;
      --  Software lock register for page 53. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK53      : aliased SW_LOCK_Register;
      --  Software lock register for page 54. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK54      : aliased SW_LOCK_Register;
      --  Software lock register for page 55. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK55      : aliased SW_LOCK_Register;
      --  Software lock register for page 56. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK56      : aliased SW_LOCK_Register;
      --  Software lock register for page 57. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK57      : aliased SW_LOCK_Register;
      --  Software lock register for page 58. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK58      : aliased SW_LOCK_Register;
      --  Software lock register for page 59. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK59      : aliased SW_LOCK_Register;
      --  Software lock register for page 60. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK60      : aliased SW_LOCK_Register;
      --  Software lock register for page 61. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK61      : aliased SW_LOCK_Register;
      --  Software lock register for page 62. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK62      : aliased SW_LOCK_Register;
      --  Software lock register for page 63. Locks are initialised from the
      --  OTP lock pages at reset. This register can be written to further
      --  advance the lock state of each page (until next reset), and read to
      --  check the current lock state of a page.
      SW_LOCK63      : aliased SW_LOCK_Register;
      --  Dispatch instructions to the SBPI interface, used for programming the
      --  OTP fuses.
      SBPI_INSTR     : aliased SBPI_INSTR_Register;
      --  SBPI write payload bytes 3..0
      SBPI_WDATA_0   : aliased HAL.UInt32;
      --  SBPI write payload bytes 7..4
      SBPI_WDATA_1   : aliased HAL.UInt32;
      --  SBPI write payload bytes 11..8
      SBPI_WDATA_2   : aliased HAL.UInt32;
      --  SBPI write payload bytes 15..12
      SBPI_WDATA_3   : aliased HAL.UInt32;
      --  Read payload bytes 3..0. Once read, the data in the register will
      --  automatically clear to 0.
      SBPI_RDATA_0   : aliased HAL.UInt32;
      --  Read payload bytes 7..4. Once read, the data in the register will
      --  automatically clear to 0.
      SBPI_RDATA_1   : aliased HAL.UInt32;
      --  Read payload bytes 11..8. Once read, the data in the register will
      --  automatically clear to 0.
      SBPI_RDATA_2   : aliased HAL.UInt32;
      --  Read payload bytes 15..12. Once read, the data in the register will
      --  automatically clear to 0.
      SBPI_RDATA_3   : aliased HAL.UInt32;
      SBPI_STATUS    : aliased SBPI_STATUS_Register;
      --  Controls for APB data read interface (USER interface)
      USR            : aliased USR_Register;
      --  Debug for OTP power-on state machine
      DBG            : aliased DBG_Register;
      --  During BIST, count address locations that have at least one leaky bit
      BIST           : aliased BIST_Register;
      --  Word 0 (bits 31..0) of the key. Write only, read returns 0x0
      CRT_KEY_W0     : aliased HAL.UInt32;
      --  Word 1 (bits 63..32) of the key. Write only, read returns 0x0
      CRT_KEY_W1     : aliased HAL.UInt32;
      --  Word 2 (bits 95..64) of the key. Write only, read returns 0x0
      CRT_KEY_W2     : aliased HAL.UInt32;
      --  Word 3 (bits 127..96) of the key. Write only, read returns 0x0
      CRT_KEY_W3     : aliased HAL.UInt32;
      --  Quickly check values of critical flags read during boot up
      CRITICAL       : aliased CRITICAL_Register;
      --  Which keys were valid (enrolled) at boot time
      KEY_VALID      : aliased KEY_VALID_Register;
      --  Enable a debug feature that has been disabled. Debug features are
      --  disabled if one of the relevant critical boot flags is set in OTP
      --  (DEBUG_DISABLE or SECURE_DEBUG_DISABLE), OR if a debug key is marked
      --  valid in OTP, and the matching key value has not been supplied over
      --  SWD. Specifically: - The DEBUG_DISABLE flag disables all debug
      --  features. This can be fully overridden by setting all bits of this
      --  register. - The SECURE_DEBUG_DISABLE flag disables secure processor
      --  debug. This can be fully overridden by setting the PROC0_SECURE and
      --  PROC1_SECURE bits of this register. - If a single debug key has been
      --  registered, and no matching key value has been supplied over SWD,
      --  then all debug features are disabled. This can be fully overridden by
      --  setting all bits of this register. - If both debug keys have been
      --  registered, and the Non-secure key's value (key 6) has been supplied
      --  over SWD, secure processor debug is disabled. This can be fully
      --  overridden by setting the PROC0_SECURE and PROC1_SECURE bits of this
      --  register. - If both debug keys have been registered, and the Secure
      --  key's value (key 5) has been supplied over SWD, then no debug
      --  features are disabled by the key mechanism. However, note that in
      --  this case debug features may still be disabled by the critical boot
      --  flags.
      DEBUGEN        : aliased DEBUGEN_Register;
      --  Write 1s to lock corresponding bits in DEBUGEN. This register is
      --  reset by the processor cold reset.
      DEBUGEN_LOCK   : aliased DEBUGEN_LOCK_Register;
      --  Architecture select (Arm/RISC-V). The default and allowable values of
      --  this register are constrained by the critical boot flags. This
      --  register is reset by the earliest reset in the switched core power
      --  domain (before a processor cold reset). Cores sample their
      --  architecture select signal on a warm reset. The source of the warm
      --  reset could be the system power-up state machine, the watchdog timer,
      --  Arm SYSRESETREQ or from RISC-V hartresetreq. Note that when an Arm
      --  core is deselected, its cold reset domain is also held in reset,
      --  since in particular the SYSRESETREQ bit becomes inaccessible once the
      --  core is deselected. Note also the RISC-V cores do not have a cold
      --  reset domain, since their corresponding controls are located in the
      --  Debug Module.
      ARCHSEL        : aliased ARCHSEL_Register;
      --  Get the current architecture select state of each core. Cores sample
      --  the current value of the ARCHSEL register when their warm reset is
      --  released, at which point the corresponding bit in this register will
      --  also update.
      ARCHSEL_STATUS : aliased ARCHSEL_STATUS_Register;
      --  Tell the bootrom to ignore scratch register boot vectors (both power
      --  manager and watchdog) on the next power up. If an early boot stage
      --  has soft-locked some OTP pages in order to protect their contents
      --  from later stages, there is a risk that Secure code running at a
      --  later stage can unlock the pages by performing a watchdog reset that
      --  resets the OTP. This register can be used to ensure that the
      --  bootloader runs as normal on the next power up, preventing Secure
      --  code at a later stage from accessing OTP in its unlocked state.
      --  Should be used in conjunction with the power manager BOOTDIS
      --  register.
      BOOTDIS        : aliased BOOTDIS_Register;
      --  Raw Interrupts
      INTR           : aliased INTR_Register;
      --  Interrupt Enable
      INTE           : aliased INTE_Register;
      --  Interrupt Force
      INTF           : aliased INTF_Register;
      --  Interrupt status after masking & forcing
      INTS           : aliased INTS_Register;
   end record
     with Volatile;

   for OTP_Peripheral use record
      SW_LOCK0       at 16#0# range 0 .. 31;
      SW_LOCK1       at 16#4# range 0 .. 31;
      SW_LOCK2       at 16#8# range 0 .. 31;
      SW_LOCK3       at 16#C# range 0 .. 31;
      SW_LOCK4       at 16#10# range 0 .. 31;
      SW_LOCK5       at 16#14# range 0 .. 31;
      SW_LOCK6       at 16#18# range 0 .. 31;
      SW_LOCK7       at 16#1C# range 0 .. 31;
      SW_LOCK8       at 16#20# range 0 .. 31;
      SW_LOCK9       at 16#24# range 0 .. 31;
      SW_LOCK10      at 16#28# range 0 .. 31;
      SW_LOCK11      at 16#2C# range 0 .. 31;
      SW_LOCK12      at 16#30# range 0 .. 31;
      SW_LOCK13      at 16#34# range 0 .. 31;
      SW_LOCK14      at 16#38# range 0 .. 31;
      SW_LOCK15      at 16#3C# range 0 .. 31;
      SW_LOCK16      at 16#40# range 0 .. 31;
      SW_LOCK17      at 16#44# range 0 .. 31;
      SW_LOCK18      at 16#48# range 0 .. 31;
      SW_LOCK19      at 16#4C# range 0 .. 31;
      SW_LOCK20      at 16#50# range 0 .. 31;
      SW_LOCK21      at 16#54# range 0 .. 31;
      SW_LOCK22      at 16#58# range 0 .. 31;
      SW_LOCK23      at 16#5C# range 0 .. 31;
      SW_LOCK24      at 16#60# range 0 .. 31;
      SW_LOCK25      at 16#64# range 0 .. 31;
      SW_LOCK26      at 16#68# range 0 .. 31;
      SW_LOCK27      at 16#6C# range 0 .. 31;
      SW_LOCK28      at 16#70# range 0 .. 31;
      SW_LOCK29      at 16#74# range 0 .. 31;
      SW_LOCK30      at 16#78# range 0 .. 31;
      SW_LOCK31      at 16#7C# range 0 .. 31;
      SW_LOCK32      at 16#80# range 0 .. 31;
      SW_LOCK33      at 16#84# range 0 .. 31;
      SW_LOCK34      at 16#88# range 0 .. 31;
      SW_LOCK35      at 16#8C# range 0 .. 31;
      SW_LOCK36      at 16#90# range 0 .. 31;
      SW_LOCK37      at 16#94# range 0 .. 31;
      SW_LOCK38      at 16#98# range 0 .. 31;
      SW_LOCK39      at 16#9C# range 0 .. 31;
      SW_LOCK40      at 16#A0# range 0 .. 31;
      SW_LOCK41      at 16#A4# range 0 .. 31;
      SW_LOCK42      at 16#A8# range 0 .. 31;
      SW_LOCK43      at 16#AC# range 0 .. 31;
      SW_LOCK44      at 16#B0# range 0 .. 31;
      SW_LOCK45      at 16#B4# range 0 .. 31;
      SW_LOCK46      at 16#B8# range 0 .. 31;
      SW_LOCK47      at 16#BC# range 0 .. 31;
      SW_LOCK48      at 16#C0# range 0 .. 31;
      SW_LOCK49      at 16#C4# range 0 .. 31;
      SW_LOCK50      at 16#C8# range 0 .. 31;
      SW_LOCK51      at 16#CC# range 0 .. 31;
      SW_LOCK52      at 16#D0# range 0 .. 31;
      SW_LOCK53      at 16#D4# range 0 .. 31;
      SW_LOCK54      at 16#D8# range 0 .. 31;
      SW_LOCK55      at 16#DC# range 0 .. 31;
      SW_LOCK56      at 16#E0# range 0 .. 31;
      SW_LOCK57      at 16#E4# range 0 .. 31;
      SW_LOCK58      at 16#E8# range 0 .. 31;
      SW_LOCK59      at 16#EC# range 0 .. 31;
      SW_LOCK60      at 16#F0# range 0 .. 31;
      SW_LOCK61      at 16#F4# range 0 .. 31;
      SW_LOCK62      at 16#F8# range 0 .. 31;
      SW_LOCK63      at 16#FC# range 0 .. 31;
      SBPI_INSTR     at 16#100# range 0 .. 31;
      SBPI_WDATA_0   at 16#104# range 0 .. 31;
      SBPI_WDATA_1   at 16#108# range 0 .. 31;
      SBPI_WDATA_2   at 16#10C# range 0 .. 31;
      SBPI_WDATA_3   at 16#110# range 0 .. 31;
      SBPI_RDATA_0   at 16#114# range 0 .. 31;
      SBPI_RDATA_1   at 16#118# range 0 .. 31;
      SBPI_RDATA_2   at 16#11C# range 0 .. 31;
      SBPI_RDATA_3   at 16#120# range 0 .. 31;
      SBPI_STATUS    at 16#124# range 0 .. 31;
      USR            at 16#128# range 0 .. 31;
      DBG            at 16#12C# range 0 .. 31;
      BIST           at 16#134# range 0 .. 31;
      CRT_KEY_W0     at 16#138# range 0 .. 31;
      CRT_KEY_W1     at 16#13C# range 0 .. 31;
      CRT_KEY_W2     at 16#140# range 0 .. 31;
      CRT_KEY_W3     at 16#144# range 0 .. 31;
      CRITICAL       at 16#148# range 0 .. 31;
      KEY_VALID      at 16#14C# range 0 .. 31;
      DEBUGEN        at 16#150# range 0 .. 31;
      DEBUGEN_LOCK   at 16#154# range 0 .. 31;
      ARCHSEL        at 16#158# range 0 .. 31;
      ARCHSEL_STATUS at 16#15C# range 0 .. 31;
      BOOTDIS        at 16#160# range 0 .. 31;
      INTR           at 16#164# range 0 .. 31;
      INTE           at 16#168# range 0 .. 31;
      INTF           at 16#16C# range 0 .. 31;
      INTS           at 16#170# range 0 .. 31;
   end record;

   --  SNPS OTP control IF (SBPI and RPi wrapper control)
   OTP_Periph : aliased OTP_Peripheral
     with Import, Address => OTP_Base;

end RP2350_SVD.OTP;
