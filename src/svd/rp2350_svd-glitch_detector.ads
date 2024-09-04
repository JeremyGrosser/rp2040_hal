pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

--  Glitch detector controls
package RP2350_SVD.GLITCH_DETECTOR is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   type ARM_ARM_Field is
     (--  Force the glitch detectors to be armed. (Any value other than ARM_NO counts
--  as YES)
      yes,
      --  Do not force the glitch detectors to be armed
      no)
     with Size => 16;
   for ARM_ARM_Field use
     (yes => 0,
      no => 23469);

   --  Forcibly arm the glitch detectors, if they are not already armed by OTP.
   --  When armed, any individual detector trigger will cause a restart of the
   --  switched core power domain's power-on reset state machine. Glitch
   --  detector triggers are recorded accumulatively in TRIG_STATUS. If the
   --  system is reset by a glitch detector trigger, this is recorded in
   --  POWMAN_CHIP_RESET. This register is Secure read/write only.
   type ARM_Register is record
      ARM            : ARM_ARM_Field := RP2350_SVD.GLITCH_DETECTOR.no;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ARM_Register use record
      ARM            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Forcibly disarm the glitch detectors, if they are armed by OTP. Ignored
   --  if ARM is YES. This register is Secure read/write only.
   type DISARM_DISARM_Field is
     (--  Do not disarm the glitch detectors. (Any value other than DISARM_YES counts
--  as NO)
      no,
      --  Disarm the glitch detectors
      yes)
     with Size => 16;
   for DISARM_DISARM_Field use
     (no => 0,
      yes => 56495);

   type DISARM_Register is record
      --  Forcibly disarm the glitch detectors, if they are armed by OTP.
      --  Ignored if ARM is YES. This register is Secure read/write only.
      DISARM         : DISARM_DISARM_Field := RP2350_SVD.GLITCH_DETECTOR.no;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DISARM_Register use record
      DISARM         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  SENSITIVITY_DET array element
   subtype SENSITIVITY_DET_Element is HAL.UInt2;

   --  SENSITIVITY_DET array
   type SENSITIVITY_DET_Field_Array is array (0 .. 3)
     of SENSITIVITY_DET_Element
     with Component_Size => 2, Size => 8;

   --  Type definition for SENSITIVITY_DET
   type SENSITIVITY_DET_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  DET as a value
            Val : HAL.UInt8;
         when True =>
            --  DET as an array
            Arr : SENSITIVITY_DET_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for SENSITIVITY_DET_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   subtype SENSITIVITY_DET0_INV_Field is HAL.UInt2;
   subtype SENSITIVITY_DET1_INV_Field is HAL.UInt2;
   subtype SENSITIVITY_DET2_INV_Field is HAL.UInt2;
   subtype SENSITIVITY_DET3_INV_Field is HAL.UInt2;

   type SENSITIVITY_DEFAULT_Field is
     (--  Use the default sensitivity configured in OTP for all detectors. (Any value
--  other than DEFAULT_NO counts as YES)
      yes,
      --  Do not use the default sensitivity configured in OTP. Instead use the value
--  from this register.
      no)
     with Size => 8;
   for SENSITIVITY_DEFAULT_Field use
     (yes => 0,
      no => 222);

   --  Adjust the sensitivity of glitch detectors to values other than their
   --  OTP-provided defaults. This register is Secure read/write only.
   type SENSITIVITY_Register is record
      --  Set sensitivity for detector 0. Higher values are more sensitive.
      DET            : SENSITIVITY_DET_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Must be the inverse of DET0, else the default value is used.
      DET0_INV       : SENSITIVITY_DET0_INV_Field := 16#0#;
      --  Must be the inverse of DET1, else the default value is used.
      DET1_INV       : SENSITIVITY_DET1_INV_Field := 16#0#;
      --  Must be the inverse of DET2, else the default value is used.
      DET2_INV       : SENSITIVITY_DET2_INV_Field := 16#0#;
      --  Must be the inverse of DET3, else the default value is used.
      DET3_INV       : SENSITIVITY_DET3_INV_Field := 16#0#;
      --  unspecified
      Reserved_16_23 : HAL.UInt8 := 16#0#;
      DEFAULT        : SENSITIVITY_DEFAULT_Field :=
                        RP2350_SVD.GLITCH_DETECTOR.yes;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SENSITIVITY_Register use record
      DET            at 0 range 0 .. 7;
      DET0_INV       at 0 range 8 .. 9;
      DET1_INV       at 0 range 10 .. 11;
      DET2_INV       at 0 range 12 .. 13;
      DET3_INV       at 0 range 14 .. 15;
      Reserved_16_23 at 0 range 16 .. 23;
      DEFAULT        at 0 range 24 .. 31;
   end record;

   subtype LOCK_LOCK_Field is HAL.UInt8;

   type LOCK_Register is record
      --  Write any nonzero value to disable writes to ARM, DISARM, SENSITIVITY
      --  and LOCK. This register is Secure read/write only.
      LOCK          : LOCK_LOCK_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for LOCK_Register use record
      LOCK          at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  TRIG_STATUS_DET array
   type TRIG_STATUS_DET_Field_Array is array (0 .. 3) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for TRIG_STATUS_DET
   type TRIG_STATUS_DET_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  DET as a value
            Val : HAL.UInt4;
         when True =>
            --  DET as an array
            Arr : TRIG_STATUS_DET_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for TRIG_STATUS_DET_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  Set when a detector output triggers. Write-1-clear. (May immediately
   --  return high if the detector remains in a failed state. Detectors can
   --  only be cleared by a full reset of the switched core power domain.) This
   --  register is Secure read/write only.
   type TRIG_STATUS_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      DET           : TRIG_STATUS_DET_Field :=
                       (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRIG_STATUS_Register use record
      DET           at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype TRIG_FORCE_TRIG_FORCE_Field is HAL.UInt4;

   --  Simulate the firing of one or more detectors. Writing ones to this
   --  register will set the matching bits in STATUS_TRIG. If the glitch
   --  detectors are currently armed, writing ones will also immediately reset
   --  the switched core power domain, and set the reset reason latches in
   --  POWMAN_CHIP_RESET to indicate a glitch detector resets. This register is
   --  Secure read/write only.
   type TRIG_FORCE_Register is record
      --  Write-only.
      TRIG_FORCE    : TRIG_FORCE_TRIG_FORCE_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRIG_FORCE_Register use record
      TRIG_FORCE    at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Glitch detector controls
   type GLITCH_DETECTOR_Peripheral is record
      --  Forcibly arm the glitch detectors, if they are not already armed by
      --  OTP. When armed, any individual detector trigger will cause a restart
      --  of the switched core power domain's power-on reset state machine.
      --  Glitch detector triggers are recorded accumulatively in TRIG_STATUS.
      --  If the system is reset by a glitch detector trigger, this is recorded
      --  in POWMAN_CHIP_RESET. This register is Secure read/write only.
      ARM         : aliased ARM_Register;
      DISARM      : aliased DISARM_Register;
      --  Adjust the sensitivity of glitch detectors to values other than their
      --  OTP-provided defaults. This register is Secure read/write only.
      SENSITIVITY : aliased SENSITIVITY_Register;
      LOCK        : aliased LOCK_Register;
      --  Set when a detector output triggers. Write-1-clear. (May immediately
      --  return high if the detector remains in a failed state. Detectors can
      --  only be cleared by a full reset of the switched core power domain.)
      --  This register is Secure read/write only.
      TRIG_STATUS : aliased TRIG_STATUS_Register;
      --  Simulate the firing of one or more detectors. Writing ones to this
      --  register will set the matching bits in STATUS_TRIG. If the glitch
      --  detectors are currently armed, writing ones will also immediately
      --  reset the switched core power domain, and set the reset reason
      --  latches in POWMAN_CHIP_RESET to indicate a glitch detector resets.
      --  This register is Secure read/write only.
      TRIG_FORCE  : aliased TRIG_FORCE_Register;
   end record
     with Volatile;

   for GLITCH_DETECTOR_Peripheral use record
      ARM         at 16#0# range 0 .. 31;
      DISARM      at 16#4# range 0 .. 31;
      SENSITIVITY at 16#8# range 0 .. 31;
      LOCK        at 16#C# range 0 .. 31;
      TRIG_STATUS at 16#10# range 0 .. 31;
      TRIG_FORCE  at 16#14# range 0 .. 31;
   end record;

   --  Glitch detector controls
   GLITCH_DETECTOR_Periph : aliased GLITCH_DETECTOR_Peripheral
     with Import, Address => GLITCH_DETECTOR_Base;

end RP2350_SVD.GLITCH_DETECTOR;
