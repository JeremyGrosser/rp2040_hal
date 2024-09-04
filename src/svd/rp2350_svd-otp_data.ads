pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

--  Predefined OTP data layout for RP2350
package RP2350_SVD.OTP_DATA is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype NUM_GPIOS_NUM_GPIOS_Field is HAL.UInt8;

   --  The number of main user GPIOs (bank 0). Should read 48 in the QFN80
   --  package, and 30 in the QFN60 package. (ECC)
   type NUM_GPIOS_Register is record
      --  Read-only.
      NUM_GPIOS     : NUM_GPIOS_NUM_GPIOS_Field;
      --  unspecified
      Reserved_8_15 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for NUM_GPIOS_Register use record
      NUM_GPIOS     at 0 range 0 .. 7;
      Reserved_8_15 at 0 range 8 .. 15;
   end record;

   subtype FLASH_DEVINFO_CS1_GPIO_Field is HAL.UInt6;

   --  The size of the flash/PSRAM device on chip select 0 (addressable at
   --  0x10000000 through 0x10ffffff). A value of zero is decoded as a size of
   --  zero (no device). Nonzero values are decoded as 4kiB << CS0_SIZE. For
   --  example, four megabytes is encoded with a CS0_SIZE value of 10, and 16
   --  megabytes is encoded with a CS0_SIZE value of 12. When
   --  BOOT_FLAGS0_FLASH_DEVINFO_ENABLE is not set, a default of 12 (16 MiB) is
   --  used.
   type FLASH_DEVINFO_CS0_SIZE_Field is
     (NONE,
      Val_8K,
      Val_16K,
      Val_32K,
      Val_64k,
      Val_128K,
      Val_256K,
      Val_512K,
      Val_1M,
      Val_2M,
      Val_4M,
      Val_8M,
      Val_16M)
     with Size => 4;
   for FLASH_DEVINFO_CS0_SIZE_Field use
     (NONE => 0,
      Val_8K => 1,
      Val_16K => 2,
      Val_32K => 3,
      Val_64k => 4,
      Val_128K => 5,
      Val_256K => 6,
      Val_512K => 7,
      Val_1M => 8,
      Val_2M => 9,
      Val_4M => 10,
      Val_8M => 11,
      Val_16M => 12);

   --  The size of the flash/PSRAM device on chip select 1 (addressable at
   --  0x11000000 through 0x11ffffff). A value of zero is decoded as a size of
   --  zero (no device). Nonzero values are decoded as 4kiB << CS1_SIZE. For
   --  example, four megabytes is encoded with a CS1_SIZE value of 10, and 16
   --  megabytes is encoded with a CS1_SIZE value of 12. When
   --  BOOT_FLAGS0_FLASH_DEVINFO_ENABLE is not set, a default of zero is used.
   type FLASH_DEVINFO_CS1_SIZE_Field is
     (NONE,
      Val_8K,
      Val_16K,
      Val_32K,
      Val_64k,
      Val_128K,
      Val_256K,
      Val_512K,
      Val_1M,
      Val_2M,
      Val_4M,
      Val_8M,
      Val_16M)
     with Size => 4;
   for FLASH_DEVINFO_CS1_SIZE_Field use
     (NONE => 0,
      Val_8K => 1,
      Val_16K => 2,
      Val_32K => 3,
      Val_64k => 4,
      Val_128K => 5,
      Val_256K => 6,
      Val_512K => 7,
      Val_1M => 8,
      Val_2M => 9,
      Val_4M => 10,
      Val_8M => 11,
      Val_16M => 12);

   --  Stores information about external flash device(s). (ECC) Assumed to be
   --  valid if BOOT_FLAGS0_FLASH_DEVINFO_ENABLE is set.
   type FLASH_DEVINFO_Register is record
      --  Read-only. Indicate a GPIO number to be used for the secondary flash
      --  chip select (CS1), which selects the external QSPI device mapped at
      --  system addresses 0x11000000 through 0x11ffffff. There is no such
      --  configuration for CS0, as the primary chip select has a dedicated
      --  pin. On RP2350 the permissible GPIO numbers are 0, 8, 19 and 47.
      --  Ignored if CS1_size is zero. If CS1_SIZE is nonzero, the bootrom will
      --  automatically configure this GPIO as a second chip select upon
      --  entering the flash boot path, or entering any other path that may use
      --  the QSPI flash interface, such as BOOTSEL mode (nsboot).
      CS1_GPIO            : FLASH_DEVINFO_CS1_GPIO_Field;
      --  unspecified
      Reserved_6_6        : HAL.Bit;
      --  Read-only. If true, all attached devices are assumed to support (or
      --  ignore, in the case of PSRAM) a block erase command with a command
      --  prefix of D8h, an erase size of 64 kiB, and a 24-bit address. Almost
      --  all 25-series flash devices support this command. If set, the bootrom
      --  will use the D8h erase command where it is able, to accelerate bulk
      --  erase operations. This makes flash programming faster. When
      --  BOOT_FLAGS0_FLASH_DEVINFO_ENABLE is not set, this field defaults to
      --  false.
      D8H_ERASE_SUPPORTED : Boolean;
      --  Read-only. The size of the flash/PSRAM device on chip select 0
      --  (addressable at 0x10000000 through 0x10ffffff). A value of zero is
      --  decoded as a size of zero (no device). Nonzero values are decoded as
      --  4kiB << CS0_SIZE. For example, four megabytes is encoded with a
      --  CS0_SIZE value of 10, and 16 megabytes is encoded with a CS0_SIZE
      --  value of 12. When BOOT_FLAGS0_FLASH_DEVINFO_ENABLE is not set, a
      --  default of 12 (16 MiB) is used.
      CS0_SIZE            : FLASH_DEVINFO_CS0_SIZE_Field;
      --  Read-only. The size of the flash/PSRAM device on chip select 1
      --  (addressable at 0x11000000 through 0x11ffffff). A value of zero is
      --  decoded as a size of zero (no device). Nonzero values are decoded as
      --  4kiB << CS1_SIZE. For example, four megabytes is encoded with a
      --  CS1_SIZE value of 10, and 16 megabytes is encoded with a CS1_SIZE
      --  value of 12. When BOOT_FLAGS0_FLASH_DEVINFO_ENABLE is not set, a
      --  default of zero is used.
      CS1_SIZE            : FLASH_DEVINFO_CS1_SIZE_Field;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for FLASH_DEVINFO_Register use record
      CS1_GPIO            at 0 range 0 .. 5;
      Reserved_6_6        at 0 range 6 .. 6;
      D8H_ERASE_SUPPORTED at 0 range 7 .. 7;
      CS0_SIZE            at 0 range 8 .. 11;
      CS1_SIZE            at 0 range 12 .. 15;
   end record;

   subtype BOOTSEL_LED_CFG_PIN_Field is HAL.UInt6;

   --  Pin configuration for LED status, used by USB bootloader. (ECC) Must be
   --  valid if BOOT_FLAGS0_ENABLE_BOOTSEL_LED is set.
   type BOOTSEL_LED_CFG_Register is record
      --  Read-only. GPIO index to use for bootloader activity LED.
      PIN           : BOOTSEL_LED_CFG_PIN_Field;
      --  unspecified
      Reserved_6_7  : HAL.UInt2;
      --  Read-only. LED is active-low. (Default: active-high.)
      ACTIVELOW     : Boolean;
      --  unspecified
      Reserved_9_15 : HAL.UInt7;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for BOOTSEL_LED_CFG_Register use record
      PIN           at 0 range 0 .. 5;
      Reserved_6_7  at 0 range 6 .. 7;
      ACTIVELOW     at 0 range 8 .. 8;
      Reserved_9_15 at 0 range 9 .. 15;
   end record;

   subtype BOOTSEL_PLL_CFG_FBDIV_Field is HAL.UInt9;
   --  BOOTSEL_PLL_CFG_POSTDIV array element
   subtype BOOTSEL_PLL_CFG_POSTDIV_Element is HAL.UInt3;

   --  BOOTSEL_PLL_CFG_POSTDIV array
   type BOOTSEL_PLL_CFG_POSTDIV_Field_Array is array (1 .. 2)
     of BOOTSEL_PLL_CFG_POSTDIV_Element
     with Component_Size => 3, Size => 6;

   --  Type definition for BOOTSEL_PLL_CFG_POSTDIV
   type BOOTSEL_PLL_CFG_POSTDIV_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  POSTDIV as a value
            Val : HAL.UInt6;
         when True =>
            --  POSTDIV as an array
            Arr : BOOTSEL_PLL_CFG_POSTDIV_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for BOOTSEL_PLL_CFG_POSTDIV_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  Optional PLL configuration for BOOTSEL mode. (ECC) This should be
   --  configured to produce an exact 48 MHz based on the crystal oscillator
   --  frequency. User mode software may also use this value to calculate the
   --  expected crystal frequency based on an assumed 48 MHz PLL output. If no
   --  configuration is given, the crystal is assumed to be 12 MHz. The PLL
   --  frequency can be calculated as: PLL out = (XOSC frequency / (REFDIV+1))
   --  x FBDIV / (POSTDIV1 x POSTDIV2) Conversely the crystal frequency can be
   --  calculated as: XOSC frequency = 48 MHz x (REFDIV+1) x (POSTDIV1 x
   --  POSTDIV2) / FBDIV (Note the +1 on REFDIV is because the value stored in
   --  this OTP location is the actual divisor value minus one.) Used if and
   --  only if ENABLE_BOOTSEL_NON_DEFAULT_PLL_XOSC_CFG is set in BOOT_FLAGS0.
   --  That bit should be set only after this row and BOOTSEL_XOSC_CFG are both
   --  correctly programmed.
   type BOOTSEL_PLL_CFG_Register is record
      --  Read-only. PLL feedback divisor, in the range 16..320 inclusive.
      FBDIV   : BOOTSEL_PLL_CFG_FBDIV_Field;
      --  Read-only. PLL post-divide 1 divisor, in the range 1..7 inclusive.
      POSTDIV : BOOTSEL_PLL_CFG_POSTDIV_Field;
      --  Read-only. PLL reference divisor, minus one. Programming a value of 0
      --  means a reference divisor of 1. Programming a value of 1 means a
      --  reference divisor of 2 (for exceptionally fast XIN inputs)
      REFDIV  : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for BOOTSEL_PLL_CFG_Register use record
      FBDIV   at 0 range 0 .. 8;
      POSTDIV at 0 range 9 .. 14;
      REFDIV  at 0 range 15 .. 15;
   end record;

   subtype BOOTSEL_XOSC_CFG_STARTUP_Field is HAL.UInt14;

   --  Value of the XOSC_CTRL_FREQ_RANGE register.
   type BOOTSEL_XOSC_CFG_RANGE_Field is
     (Val_1_15MHZ,
      Val_10_30MHZ,
      Val_25_60MHZ,
      Val_40_100MHZ)
     with Size => 2;
   for BOOTSEL_XOSC_CFG_RANGE_Field use
     (Val_1_15MHZ => 0,
      Val_10_30MHZ => 1,
      Val_25_60MHZ => 2,
      Val_40_100MHZ => 3);

   --  Non-default crystal oscillator configuration for the USB bootloader.
   --  (ECC) These values may also be used by user code configuring the crystal
   --  oscillator. Used if and only if ENABLE_BOOTSEL_NON_DEFAULT_PLL_XOSC_CFG
   --  is set in BOOT_FLAGS0. That bit should be set only after this row and
   --  BOOTSEL_PLL_CFG are both correctly programmed.
   type BOOTSEL_XOSC_CFG_Register is record
      --  Read-only. Value of the XOSC_STARTUP register
      STARTUP : BOOTSEL_XOSC_CFG_STARTUP_Field;
      --  Read-only. Value of the XOSC_CTRL_FREQ_RANGE register.
      RANGE_k : BOOTSEL_XOSC_CFG_RANGE_Field;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for BOOTSEL_XOSC_CFG_Register use record
      STARTUP at 0 range 0 .. 13;
      RANGE_k at 0 range 14 .. 15;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Predefined OTP data layout for RP2350
   type OTP_DATA_Peripheral is record
      --  Bits 15:0 of public device ID. (ECC) The CHIPID0..3 rows contain a
      --  64-bit random identifier for this chip, which can be read from the
      --  USB bootloader PICOBOOT interface or from the get_sys_info ROM API.
      --  The number of random bits makes the occurrence of twins exceedingly
      --  unlikely: for example, a fleet of a hundred million devices has a
      --  99.97% probability of no twinned IDs. This is estimated to be lower
      --  than the occurrence of process errors in the assignment of sequential
      --  random IDs, and for practical purposes CHIPID may be treated as
      --  unique.
      CHIPID0                   : aliased HAL.UInt16;
      --  Bits 31:16 of public device ID (ECC)
      CHIPID1                   : aliased HAL.UInt16;
      --  Bits 47:32 of public device ID (ECC)
      CHIPID2                   : aliased HAL.UInt16;
      --  Bits 63:48 of public device ID (ECC)
      CHIPID3                   : aliased HAL.UInt16;
      --  Bits 15:0 of private per-device random number (ECC) The RANDID0..7
      --  rows form a 128-bit random number generated during device test. This
      --  ID is not exposed through the USB PICOBOOT GET_INFO command or the
      --  ROM `get_sys_info()` API. However note that the USB PICOBOOT OTP
      --  access point can read the entirety of page 0, so this value is not
      --  meaningfully private unless the USB PICOBOOT interface is disabled
      --  via the DISABLE_BOOTSEL_USB_PICOBOOT_IFC flag in BOOT_FLAGS0.
      RANDID0                   : aliased HAL.UInt16;
      --  Bits 31:16 of private per-device random number (ECC)
      RANDID1                   : aliased HAL.UInt16;
      --  Bits 47:32 of private per-device random number (ECC)
      RANDID2                   : aliased HAL.UInt16;
      --  Bits 63:48 of private per-device random number (ECC)
      RANDID3                   : aliased HAL.UInt16;
      --  Bits 79:64 of private per-device random number (ECC)
      RANDID4                   : aliased HAL.UInt16;
      --  Bits 95:80 of private per-device random number (ECC)
      RANDID5                   : aliased HAL.UInt16;
      --  Bits 111:96 of private per-device random number (ECC)
      RANDID6                   : aliased HAL.UInt16;
      --  Bits 127:112 of private per-device random number (ECC)
      RANDID7                   : aliased HAL.UInt16;
      --  Ring oscillator frequency in kHz, measured during manufacturing (ECC)
      --  This is measured at 1.1 V, at room temperature, with the ROSC
      --  configuration registers in their reset state.
      ROSC_CALIB                : aliased HAL.UInt16;
      --  Low-power oscillator frequency in Hz, measured during manufacturing
      --  (ECC) This is measured at 1.1V, at room temperature, with the LPOSC
      --  trim register in its reset state.
      LPOSC_CALIB               : aliased HAL.UInt16;
      --  The number of main user GPIOs (bank 0). Should read 48 in the QFN80
      --  package, and 30 in the QFN60 package. (ECC)
      NUM_GPIOS                 : aliased NUM_GPIOS_Register;
      --  Lower 16 bits of CRC32 of OTP addresses 0x00 through 0x6b (polynomial
      --  0x4c11db7, input reflected, output reflected, seed all-ones, final
      --  XOR all-ones) (ECC)
      INFO_CRC0                 : aliased HAL.UInt16;
      --  Upper 16 bits of CRC32 of OTP addresses 0x00 through 0x6b (ECC)
      INFO_CRC1                 : aliased HAL.UInt16;
      --  Stores information about external flash device(s). (ECC) Assumed to
      --  be valid if BOOT_FLAGS0_FLASH_DEVINFO_ENABLE is set.
      FLASH_DEVINFO             : aliased FLASH_DEVINFO_Register;
      --  Gap between partition table slot 0 and slot 1 at the start of flash
      --  (the default size is 4096 bytes) (ECC) Enabled by the
      --  OVERRIDE_FLASH_PARTITION_SLOT_SIZE bit in BOOT_FLAGS, the size is
      --  4096 * (value + 1)
      FLASH_PARTITION_SLOT_SIZE : aliased HAL.UInt16;
      --  Pin configuration for LED status, used by USB bootloader. (ECC) Must
      --  be valid if BOOT_FLAGS0_ENABLE_BOOTSEL_LED is set.
      BOOTSEL_LED_CFG           : aliased BOOTSEL_LED_CFG_Register;
      --  Optional PLL configuration for BOOTSEL mode. (ECC) This should be
      --  configured to produce an exact 48 MHz based on the crystal oscillator
      --  frequency. User mode software may also use this value to calculate
      --  the expected crystal frequency based on an assumed 48 MHz PLL output.
      --  If no configuration is given, the crystal is assumed to be 12 MHz.
      --  The PLL frequency can be calculated as: PLL out = (XOSC frequency /
      --  (REFDIV+1)) x FBDIV / (POSTDIV1 x POSTDIV2) Conversely the crystal
      --  frequency can be calculated as: XOSC frequency = 48 MHz x (REFDIV+1)
      --  x (POSTDIV1 x POSTDIV2) / FBDIV (Note the +1 on REFDIV is because the
      --  value stored in this OTP location is the actual divisor value minus
      --  one.) Used if and only if ENABLE_BOOTSEL_NON_DEFAULT_PLL_XOSC_CFG is
      --  set in BOOT_FLAGS0. That bit should be set only after this row and
      --  BOOTSEL_XOSC_CFG are both correctly programmed.
      BOOTSEL_PLL_CFG           : aliased BOOTSEL_PLL_CFG_Register;
      --  Non-default crystal oscillator configuration for the USB bootloader.
      --  (ECC) These values may also be used by user code configuring the
      --  crystal oscillator. Used if and only if
      --  ENABLE_BOOTSEL_NON_DEFAULT_PLL_XOSC_CFG is set in BOOT_FLAGS0. That
      --  bit should be set only after this row and BOOTSEL_PLL_CFG are both
      --  correctly programmed.
      BOOTSEL_XOSC_CFG          : aliased BOOTSEL_XOSC_CFG_Register;
      --  Row index of the USB_WHITE_LABEL structure within OTP (ECC) The table
      --  has 16 rows, each of which are also ECC and marked valid by the
      --  corresponding valid bit in USB_BOOT_FLAGS (ECC). The entries are
      --  either _VALUEs where the 16 bit value is used as is, or _STRDEFs
      --  which acts as a pointers to a string value. The value stored in a
      --  _STRDEF is two separate bytes: The low seven bits of the first (LSB)
      --  byte indicates the number of characters in the string, and the top
      --  bit of the first (LSB) byte if set to indicate that each character in
      --  the string is two bytes (Unicode) versus one byte if unset. The
      --  second (MSB) byte represents the location of the string data, and is
      --  encoded as the number of rows from this USB_WHITE_LABEL_ADDR; i.e.
      --  the row of the start of the string is USB_WHITE_LABEL_ADDR value +
      --  msb_byte. In each case, the corresponding valid bit enables replacing
      --  the default value for the corresponding item provided by the boot
      --  rom. Note that Unicode _STRDEFs are only supported for
      --  USB_DEVICE_PRODUCT_STRDEF, USB_DEVICE_SERIAL_NUMBER_STRDEF and
      --  USB_DEVICE_MANUFACTURER_STRDEF. Unicode values will be ignored if
      --  specified for other fields, and non-unicode values for these three
      --  items will be converted to Unicode characters by setting the upper 8
      --  bits to zero. Note that if the USB_WHITE_LABEL structure or the
      --  corresponding strings are not readable by BOOTSEL mode based on OTP
      --  permissions, or if alignment requirements are not met, then the
      --  corresponding default values are used. The index values indicate
      --  where each field is located (row USB_WHITE_LABEL_ADDR value + index):
      USB_WHITE_LABEL_ADDR      : aliased HAL.UInt16;
      --  OTP start row for the OTP boot image. (ECC) If OTP boot is enabled,
      --  the bootrom will load from this location into SRAM and then directly
      --  enter the loaded image. Note that the image must be signed if
      --  SECURE_BOOT_ENABLE is set. The image itself is assumed to be
      --  ECC-protected. This must be an even number. Equivalently, the OTP
      --  boot image must start at a word-aligned location in the ECC read data
      --  address window.
      OTPBOOT_SRC               : aliased HAL.UInt16;
      --  Length in rows of the OTP boot image. (ECC) OTPBOOT_LEN must be even.
      --  The total image size must be a multiple of 4 bytes (32 bits).
      OTPBOOT_LEN               : aliased HAL.UInt16;
      --  Bits 15:0 of the OTP boot image load destination (and entry point).
      --  (ECC) This must be a location in main SRAM (main SRAM is addresses
      --  0x20000000 through 0x20082000) and must be word-aligned.
      OTPBOOT_DST0              : aliased HAL.UInt16;
      --  Bits 31:16 of the OTP boot image load destination (and entry point).
      --  (ECC) This must be a location in main SRAM (main SRAM is addresses
      --  0x20000000 through 0x20082000) and must be word-aligned.
      OTPBOOT_DST1              : aliased HAL.UInt16;
      --  Bits 15:0 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_0                : aliased HAL.UInt16;
      --  Bits 31:16 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_1                : aliased HAL.UInt16;
      --  Bits 47:32 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_2                : aliased HAL.UInt16;
      --  Bits 63:48 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_3                : aliased HAL.UInt16;
      --  Bits 79:64 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_4                : aliased HAL.UInt16;
      --  Bits 95:80 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_5                : aliased HAL.UInt16;
      --  Bits 111:96 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_6                : aliased HAL.UInt16;
      --  Bits 127:112 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_7                : aliased HAL.UInt16;
      --  Bits 143:128 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_8                : aliased HAL.UInt16;
      --  Bits 159:144 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_9                : aliased HAL.UInt16;
      --  Bits 175:160 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_10               : aliased HAL.UInt16;
      --  Bits 191:176 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_11               : aliased HAL.UInt16;
      --  Bits 207:192 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_12               : aliased HAL.UInt16;
      --  Bits 223:208 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_13               : aliased HAL.UInt16;
      --  Bits 239:224 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_14               : aliased HAL.UInt16;
      --  Bits 255:240 of SHA-256 hash of boot key 0 (ECC)
      BOOTKEY0_15               : aliased HAL.UInt16;
      --  Bits 15:0 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_0                : aliased HAL.UInt16;
      --  Bits 31:16 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_1                : aliased HAL.UInt16;
      --  Bits 47:32 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_2                : aliased HAL.UInt16;
      --  Bits 63:48 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_3                : aliased HAL.UInt16;
      --  Bits 79:64 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_4                : aliased HAL.UInt16;
      --  Bits 95:80 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_5                : aliased HAL.UInt16;
      --  Bits 111:96 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_6                : aliased HAL.UInt16;
      --  Bits 127:112 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_7                : aliased HAL.UInt16;
      --  Bits 143:128 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_8                : aliased HAL.UInt16;
      --  Bits 159:144 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_9                : aliased HAL.UInt16;
      --  Bits 175:160 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_10               : aliased HAL.UInt16;
      --  Bits 191:176 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_11               : aliased HAL.UInt16;
      --  Bits 207:192 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_12               : aliased HAL.UInt16;
      --  Bits 223:208 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_13               : aliased HAL.UInt16;
      --  Bits 239:224 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_14               : aliased HAL.UInt16;
      --  Bits 255:240 of SHA-256 hash of boot key 1 (ECC)
      BOOTKEY1_15               : aliased HAL.UInt16;
      --  Bits 15:0 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_0                : aliased HAL.UInt16;
      --  Bits 31:16 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_1                : aliased HAL.UInt16;
      --  Bits 47:32 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_2                : aliased HAL.UInt16;
      --  Bits 63:48 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_3                : aliased HAL.UInt16;
      --  Bits 79:64 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_4                : aliased HAL.UInt16;
      --  Bits 95:80 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_5                : aliased HAL.UInt16;
      --  Bits 111:96 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_6                : aliased HAL.UInt16;
      --  Bits 127:112 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_7                : aliased HAL.UInt16;
      --  Bits 143:128 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_8                : aliased HAL.UInt16;
      --  Bits 159:144 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_9                : aliased HAL.UInt16;
      --  Bits 175:160 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_10               : aliased HAL.UInt16;
      --  Bits 191:176 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_11               : aliased HAL.UInt16;
      --  Bits 207:192 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_12               : aliased HAL.UInt16;
      --  Bits 223:208 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_13               : aliased HAL.UInt16;
      --  Bits 239:224 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_14               : aliased HAL.UInt16;
      --  Bits 255:240 of SHA-256 hash of boot key 2 (ECC)
      BOOTKEY2_15               : aliased HAL.UInt16;
      --  Bits 15:0 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_0                : aliased HAL.UInt16;
      --  Bits 31:16 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_1                : aliased HAL.UInt16;
      --  Bits 47:32 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_2                : aliased HAL.UInt16;
      --  Bits 63:48 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_3                : aliased HAL.UInt16;
      --  Bits 79:64 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_4                : aliased HAL.UInt16;
      --  Bits 95:80 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_5                : aliased HAL.UInt16;
      --  Bits 111:96 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_6                : aliased HAL.UInt16;
      --  Bits 127:112 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_7                : aliased HAL.UInt16;
      --  Bits 143:128 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_8                : aliased HAL.UInt16;
      --  Bits 159:144 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_9                : aliased HAL.UInt16;
      --  Bits 175:160 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_10               : aliased HAL.UInt16;
      --  Bits 191:176 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_11               : aliased HAL.UInt16;
      --  Bits 207:192 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_12               : aliased HAL.UInt16;
      --  Bits 223:208 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_13               : aliased HAL.UInt16;
      --  Bits 239:224 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_14               : aliased HAL.UInt16;
      --  Bits 255:240 of SHA-256 hash of boot key 3 (ECC)
      BOOTKEY3_15               : aliased HAL.UInt16;
      --  Bits 15:0 of OTP access key 1 (ECC)
      KEY1_0                    : aliased HAL.UInt16;
      --  Bits 31:16 of OTP access key 1 (ECC)
      KEY1_1                    : aliased HAL.UInt16;
      --  Bits 47:32 of OTP access key 1 (ECC)
      KEY1_2                    : aliased HAL.UInt16;
      --  Bits 63:48 of OTP access key 1 (ECC)
      KEY1_3                    : aliased HAL.UInt16;
      --  Bits 79:64 of OTP access key 1 (ECC)
      KEY1_4                    : aliased HAL.UInt16;
      --  Bits 95:80 of OTP access key 1 (ECC)
      KEY1_5                    : aliased HAL.UInt16;
      --  Bits 111:96 of OTP access key 1 (ECC)
      KEY1_6                    : aliased HAL.UInt16;
      --  Bits 127:112 of OTP access key 1 (ECC)
      KEY1_7                    : aliased HAL.UInt16;
      --  Bits 15:0 of OTP access key 2 (ECC)
      KEY2_0                    : aliased HAL.UInt16;
      --  Bits 31:16 of OTP access key 2 (ECC)
      KEY2_1                    : aliased HAL.UInt16;
      --  Bits 47:32 of OTP access key 2 (ECC)
      KEY2_2                    : aliased HAL.UInt16;
      --  Bits 63:48 of OTP access key 2 (ECC)
      KEY2_3                    : aliased HAL.UInt16;
      --  Bits 79:64 of OTP access key 2 (ECC)
      KEY2_4                    : aliased HAL.UInt16;
      --  Bits 95:80 of OTP access key 2 (ECC)
      KEY2_5                    : aliased HAL.UInt16;
      --  Bits 111:96 of OTP access key 2 (ECC)
      KEY2_6                    : aliased HAL.UInt16;
      --  Bits 127:112 of OTP access key 2 (ECC)
      KEY2_7                    : aliased HAL.UInt16;
      --  Bits 15:0 of OTP access key 3 (ECC)
      KEY3_0                    : aliased HAL.UInt16;
      --  Bits 31:16 of OTP access key 3 (ECC)
      KEY3_1                    : aliased HAL.UInt16;
      --  Bits 47:32 of OTP access key 3 (ECC)
      KEY3_2                    : aliased HAL.UInt16;
      --  Bits 63:48 of OTP access key 3 (ECC)
      KEY3_3                    : aliased HAL.UInt16;
      --  Bits 79:64 of OTP access key 3 (ECC)
      KEY3_4                    : aliased HAL.UInt16;
      --  Bits 95:80 of OTP access key 3 (ECC)
      KEY3_5                    : aliased HAL.UInt16;
      --  Bits 111:96 of OTP access key 3 (ECC)
      KEY3_6                    : aliased HAL.UInt16;
      --  Bits 127:112 of OTP access key 3 (ECC)
      KEY3_7                    : aliased HAL.UInt16;
      --  Bits 15:0 of OTP access key 4 (ECC)
      KEY4_0                    : aliased HAL.UInt16;
      --  Bits 31:16 of OTP access key 4 (ECC)
      KEY4_1                    : aliased HAL.UInt16;
      --  Bits 47:32 of OTP access key 4 (ECC)
      KEY4_2                    : aliased HAL.UInt16;
      --  Bits 63:48 of OTP access key 4 (ECC)
      KEY4_3                    : aliased HAL.UInt16;
      --  Bits 79:64 of OTP access key 4 (ECC)
      KEY4_4                    : aliased HAL.UInt16;
      --  Bits 95:80 of OTP access key 4 (ECC)
      KEY4_5                    : aliased HAL.UInt16;
      --  Bits 111:96 of OTP access key 4 (ECC)
      KEY4_6                    : aliased HAL.UInt16;
      --  Bits 127:112 of OTP access key 4 (ECC)
      KEY4_7                    : aliased HAL.UInt16;
      --  Bits 15:0 of OTP access key 5 (ECC)
      KEY5_0                    : aliased HAL.UInt16;
      --  Bits 31:16 of OTP access key 5 (ECC)
      KEY5_1                    : aliased HAL.UInt16;
      --  Bits 47:32 of OTP access key 5 (ECC)
      KEY5_2                    : aliased HAL.UInt16;
      --  Bits 63:48 of OTP access key 5 (ECC)
      KEY5_3                    : aliased HAL.UInt16;
      --  Bits 79:64 of OTP access key 5 (ECC)
      KEY5_4                    : aliased HAL.UInt16;
      --  Bits 95:80 of OTP access key 5 (ECC)
      KEY5_5                    : aliased HAL.UInt16;
      --  Bits 111:96 of OTP access key 5 (ECC)
      KEY5_6                    : aliased HAL.UInt16;
      --  Bits 127:112 of OTP access key 5 (ECC)
      KEY5_7                    : aliased HAL.UInt16;
      --  Bits 15:0 of OTP access key 6 (ECC)
      KEY6_0                    : aliased HAL.UInt16;
      --  Bits 31:16 of OTP access key 6 (ECC)
      KEY6_1                    : aliased HAL.UInt16;
      --  Bits 47:32 of OTP access key 6 (ECC)
      KEY6_2                    : aliased HAL.UInt16;
      --  Bits 63:48 of OTP access key 6 (ECC)
      KEY6_3                    : aliased HAL.UInt16;
      --  Bits 79:64 of OTP access key 6 (ECC)
      KEY6_4                    : aliased HAL.UInt16;
      --  Bits 95:80 of OTP access key 6 (ECC)
      KEY6_5                    : aliased HAL.UInt16;
      --  Bits 111:96 of OTP access key 6 (ECC)
      KEY6_6                    : aliased HAL.UInt16;
      --  Bits 127:112 of OTP access key 6 (ECC)
      KEY6_7                    : aliased HAL.UInt16;
   end record
     with Volatile;

   for OTP_DATA_Peripheral use record
      CHIPID0                   at 16#0# range 0 .. 15;
      CHIPID1                   at 16#2# range 0 .. 15;
      CHIPID2                   at 16#4# range 0 .. 15;
      CHIPID3                   at 16#6# range 0 .. 15;
      RANDID0                   at 16#8# range 0 .. 15;
      RANDID1                   at 16#A# range 0 .. 15;
      RANDID2                   at 16#C# range 0 .. 15;
      RANDID3                   at 16#E# range 0 .. 15;
      RANDID4                   at 16#10# range 0 .. 15;
      RANDID5                   at 16#12# range 0 .. 15;
      RANDID6                   at 16#14# range 0 .. 15;
      RANDID7                   at 16#16# range 0 .. 15;
      ROSC_CALIB                at 16#20# range 0 .. 15;
      LPOSC_CALIB               at 16#22# range 0 .. 15;
      NUM_GPIOS                 at 16#30# range 0 .. 15;
      INFO_CRC0                 at 16#6C# range 0 .. 15;
      INFO_CRC1                 at 16#6E# range 0 .. 15;
      FLASH_DEVINFO             at 16#A8# range 0 .. 15;
      FLASH_PARTITION_SLOT_SIZE at 16#AA# range 0 .. 15;
      BOOTSEL_LED_CFG           at 16#AC# range 0 .. 15;
      BOOTSEL_PLL_CFG           at 16#AE# range 0 .. 15;
      BOOTSEL_XOSC_CFG          at 16#B0# range 0 .. 15;
      USB_WHITE_LABEL_ADDR      at 16#B8# range 0 .. 15;
      OTPBOOT_SRC               at 16#BC# range 0 .. 15;
      OTPBOOT_LEN               at 16#BE# range 0 .. 15;
      OTPBOOT_DST0              at 16#C0# range 0 .. 15;
      OTPBOOT_DST1              at 16#C2# range 0 .. 15;
      BOOTKEY0_0                at 16#100# range 0 .. 15;
      BOOTKEY0_1                at 16#102# range 0 .. 15;
      BOOTKEY0_2                at 16#104# range 0 .. 15;
      BOOTKEY0_3                at 16#106# range 0 .. 15;
      BOOTKEY0_4                at 16#108# range 0 .. 15;
      BOOTKEY0_5                at 16#10A# range 0 .. 15;
      BOOTKEY0_6                at 16#10C# range 0 .. 15;
      BOOTKEY0_7                at 16#10E# range 0 .. 15;
      BOOTKEY0_8                at 16#110# range 0 .. 15;
      BOOTKEY0_9                at 16#112# range 0 .. 15;
      BOOTKEY0_10               at 16#114# range 0 .. 15;
      BOOTKEY0_11               at 16#116# range 0 .. 15;
      BOOTKEY0_12               at 16#118# range 0 .. 15;
      BOOTKEY0_13               at 16#11A# range 0 .. 15;
      BOOTKEY0_14               at 16#11C# range 0 .. 15;
      BOOTKEY0_15               at 16#11E# range 0 .. 15;
      BOOTKEY1_0                at 16#120# range 0 .. 15;
      BOOTKEY1_1                at 16#122# range 0 .. 15;
      BOOTKEY1_2                at 16#124# range 0 .. 15;
      BOOTKEY1_3                at 16#126# range 0 .. 15;
      BOOTKEY1_4                at 16#128# range 0 .. 15;
      BOOTKEY1_5                at 16#12A# range 0 .. 15;
      BOOTKEY1_6                at 16#12C# range 0 .. 15;
      BOOTKEY1_7                at 16#12E# range 0 .. 15;
      BOOTKEY1_8                at 16#130# range 0 .. 15;
      BOOTKEY1_9                at 16#132# range 0 .. 15;
      BOOTKEY1_10               at 16#134# range 0 .. 15;
      BOOTKEY1_11               at 16#136# range 0 .. 15;
      BOOTKEY1_12               at 16#138# range 0 .. 15;
      BOOTKEY1_13               at 16#13A# range 0 .. 15;
      BOOTKEY1_14               at 16#13C# range 0 .. 15;
      BOOTKEY1_15               at 16#13E# range 0 .. 15;
      BOOTKEY2_0                at 16#140# range 0 .. 15;
      BOOTKEY2_1                at 16#142# range 0 .. 15;
      BOOTKEY2_2                at 16#144# range 0 .. 15;
      BOOTKEY2_3                at 16#146# range 0 .. 15;
      BOOTKEY2_4                at 16#148# range 0 .. 15;
      BOOTKEY2_5                at 16#14A# range 0 .. 15;
      BOOTKEY2_6                at 16#14C# range 0 .. 15;
      BOOTKEY2_7                at 16#14E# range 0 .. 15;
      BOOTKEY2_8                at 16#150# range 0 .. 15;
      BOOTKEY2_9                at 16#152# range 0 .. 15;
      BOOTKEY2_10               at 16#154# range 0 .. 15;
      BOOTKEY2_11               at 16#156# range 0 .. 15;
      BOOTKEY2_12               at 16#158# range 0 .. 15;
      BOOTKEY2_13               at 16#15A# range 0 .. 15;
      BOOTKEY2_14               at 16#15C# range 0 .. 15;
      BOOTKEY2_15               at 16#15E# range 0 .. 15;
      BOOTKEY3_0                at 16#160# range 0 .. 15;
      BOOTKEY3_1                at 16#162# range 0 .. 15;
      BOOTKEY3_2                at 16#164# range 0 .. 15;
      BOOTKEY3_3                at 16#166# range 0 .. 15;
      BOOTKEY3_4                at 16#168# range 0 .. 15;
      BOOTKEY3_5                at 16#16A# range 0 .. 15;
      BOOTKEY3_6                at 16#16C# range 0 .. 15;
      BOOTKEY3_7                at 16#16E# range 0 .. 15;
      BOOTKEY3_8                at 16#170# range 0 .. 15;
      BOOTKEY3_9                at 16#172# range 0 .. 15;
      BOOTKEY3_10               at 16#174# range 0 .. 15;
      BOOTKEY3_11               at 16#176# range 0 .. 15;
      BOOTKEY3_12               at 16#178# range 0 .. 15;
      BOOTKEY3_13               at 16#17A# range 0 .. 15;
      BOOTKEY3_14               at 16#17C# range 0 .. 15;
      BOOTKEY3_15               at 16#17E# range 0 .. 15;
      KEY1_0                    at 16#1E90# range 0 .. 15;
      KEY1_1                    at 16#1E92# range 0 .. 15;
      KEY1_2                    at 16#1E94# range 0 .. 15;
      KEY1_3                    at 16#1E96# range 0 .. 15;
      KEY1_4                    at 16#1E98# range 0 .. 15;
      KEY1_5                    at 16#1E9A# range 0 .. 15;
      KEY1_6                    at 16#1E9C# range 0 .. 15;
      KEY1_7                    at 16#1E9E# range 0 .. 15;
      KEY2_0                    at 16#1EA0# range 0 .. 15;
      KEY2_1                    at 16#1EA2# range 0 .. 15;
      KEY2_2                    at 16#1EA4# range 0 .. 15;
      KEY2_3                    at 16#1EA6# range 0 .. 15;
      KEY2_4                    at 16#1EA8# range 0 .. 15;
      KEY2_5                    at 16#1EAA# range 0 .. 15;
      KEY2_6                    at 16#1EAC# range 0 .. 15;
      KEY2_7                    at 16#1EAE# range 0 .. 15;
      KEY3_0                    at 16#1EB0# range 0 .. 15;
      KEY3_1                    at 16#1EB2# range 0 .. 15;
      KEY3_2                    at 16#1EB4# range 0 .. 15;
      KEY3_3                    at 16#1EB6# range 0 .. 15;
      KEY3_4                    at 16#1EB8# range 0 .. 15;
      KEY3_5                    at 16#1EBA# range 0 .. 15;
      KEY3_6                    at 16#1EBC# range 0 .. 15;
      KEY3_7                    at 16#1EBE# range 0 .. 15;
      KEY4_0                    at 16#1EC0# range 0 .. 15;
      KEY4_1                    at 16#1EC2# range 0 .. 15;
      KEY4_2                    at 16#1EC4# range 0 .. 15;
      KEY4_3                    at 16#1EC6# range 0 .. 15;
      KEY4_4                    at 16#1EC8# range 0 .. 15;
      KEY4_5                    at 16#1ECA# range 0 .. 15;
      KEY4_6                    at 16#1ECC# range 0 .. 15;
      KEY4_7                    at 16#1ECE# range 0 .. 15;
      KEY5_0                    at 16#1ED0# range 0 .. 15;
      KEY5_1                    at 16#1ED2# range 0 .. 15;
      KEY5_2                    at 16#1ED4# range 0 .. 15;
      KEY5_3                    at 16#1ED6# range 0 .. 15;
      KEY5_4                    at 16#1ED8# range 0 .. 15;
      KEY5_5                    at 16#1EDA# range 0 .. 15;
      KEY5_6                    at 16#1EDC# range 0 .. 15;
      KEY5_7                    at 16#1EDE# range 0 .. 15;
      KEY6_0                    at 16#1EE0# range 0 .. 15;
      KEY6_1                    at 16#1EE2# range 0 .. 15;
      KEY6_2                    at 16#1EE4# range 0 .. 15;
      KEY6_3                    at 16#1EE6# range 0 .. 15;
      KEY6_4                    at 16#1EE8# range 0 .. 15;
      KEY6_5                    at 16#1EEA# range 0 .. 15;
      KEY6_6                    at 16#1EEC# range 0 .. 15;
      KEY6_7                    at 16#1EEE# range 0 .. 15;
   end record;

   --  Predefined OTP data layout for RP2350
   OTP_DATA_Periph : aliased OTP_DATA_Peripheral
     with Import, Address => OTP_DATA_Base;

end RP2350_SVD.OTP_DATA;
