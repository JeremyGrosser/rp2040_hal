with RP2040_SVD.USBCTRL_REGS; use RP2040_SVD.USBCTRL_REGS;
with HAL; use HAL;
with System.Storage_Elements;
with System;

package RP.USB_Common is

   type USB_Endpoint is range 0 .. 15;

   type USB_Endpoint_Registers is array (USB_Endpoint) of ADDR_ENDP_Register_1;

   type USB_Peripheral is record
      EP                     : aliased USB_Endpoint_Registers;
      MAIN_CTRL              : aliased MAIN_CTRL_Register;
      SOF_WR                 : aliased SOF_WR_Register;
      SOF_RD                 : aliased SOF_RD_Register;
      SIE_CTRL               : aliased SIE_CTRL_Register;
      SIE_STATUS             : aliased SIE_STATUS_Register;
      INT_EP_CTRL            : aliased INT_EP_CTRL_Register;
      BUFF_STATUS            : aliased BUFF_STATUS_Register;
      BUFF_CPU_SHOULD_HANDLE : aliased BUFF_CPU_SHOULD_HANDLE_Register;
      EP_ABORT               : aliased EP_ABORT_Register;
      EP_ABORT_DONE          : aliased EP_ABORT_DONE_Register;
      EP_STALL_ARM           : aliased EP_STALL_ARM_Register;
      NAK_POLL               : aliased NAK_POLL_Register;
      EP_STATUS_STALL_NAK    : aliased EP_STATUS_STALL_NAK_Register;
      USB_MUXING             : aliased USB_MUXING_Register;
      USB_PWR                : aliased USB_PWR_Register;
      USBPHY_DIRECT          : aliased USBPHY_DIRECT_Register;
      USBPHY_DIRECT_OVERRIDE : aliased USBPHY_DIRECT_OVERRIDE_Register;
      USBPHY_TRIM            : aliased USBPHY_TRIM_Register;
      INTR                   : aliased INTR_Register;
      INTE                   : aliased INTE_Register;
      INTF                   : aliased INTF_Register;
      INTS                   : aliased INTS_Register;
   end record
      with Volatile;
   for USB_Peripheral use record
      EP                     at 16#00# range 0 .. 511;
      MAIN_CTRL              at 16#40# range 0 .. 31;
      SOF_WR                 at 16#44# range 0 .. 31;
      SOF_RD                 at 16#48# range 0 .. 31;
      SIE_CTRL               at 16#4C# range 0 .. 31;
      SIE_STATUS             at 16#50# range 0 .. 31;
      INT_EP_CTRL            at 16#54# range 0 .. 31;
      BUFF_STATUS            at 16#58# range 0 .. 31;
      BUFF_CPU_SHOULD_HANDLE at 16#5C# range 0 .. 31;
      EP_ABORT               at 16#60# range 0 .. 31;
      EP_ABORT_DONE          at 16#64# range 0 .. 31;
      EP_STALL_ARM           at 16#68# range 0 .. 31;
      NAK_POLL               at 16#6C# range 0 .. 31;
      EP_STATUS_STALL_NAK    at 16#70# range 0 .. 31;
      USB_MUXING             at 16#74# range 0 .. 31;
      USB_PWR                at 16#78# range 0 .. 31;
      USBPHY_DIRECT          at 16#7C# range 0 .. 31;
      USBPHY_DIRECT_OVERRIDE at 16#80# range 0 .. 31;
      USBPHY_TRIM            at 16#84# range 0 .. 31;
      INTR                   at 16#8C# range 0 .. 31;
      INTE                   at 16#90# range 0 .. 31;
      INTF                   at 16#94# range 0 .. 31;
      INTS                   at 16#98# range 0 .. 31;
   end record;

   USB_Periph : aliased USB_Peripheral
      with Import, Address => RP2040_SVD.USBCTRL_REGS_Base;

   --  The first 0x180 bytes of USB_DPRAM contain endpoint control registers,
   --  their layout depends on whether the controller is operating in device or
   --  host mode.
   USB_DPRAM_Base : constant System.Address := System'To_Address (16#50100000#);

   --  USB data buffer offsets and lengths depend on endpoint configurations.
   --  Buffers will usually be 64 bytes, but may be up to 1024 bytes in some
   --  modes.
   USB_DATA_Base : constant System.Address := System'To_Address (16#50100180#);

end RP.USB_Common;
