pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

--  Coresight block - RP specific registers
package RP2350_SVD.CORESIGHT_TRACE is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Control and status register
   type CTRL_STATUS_Register is record
      --  Set to 1 to continuously hold the trace FIFO in a flushed state and
      --  prevent overflow. Before clearing this flag, configure and start a
      --  DMA channel with the correct DREQ for the TRACE_CAPTURE_FIFO
      --  register. Clear this flag to begin sampling trace data, and set once
      --  again once the trace capture buffer is full. You must configure the
      --  TPIU in order to generate trace packets to be captured, as well as
      --  components like the ETM further upstream to generate the event stream
      --  propagated to the TPIU.
      TRACE_CAPTURE_FIFO_FLUSH    : Boolean := True;
      --  This status flag is set high when trace data has been dropped due to
      --  the FIFO being full at the point trace data was sampled. Write 1 to
      --  acknowledge and clear the bit.
      TRACE_CAPTURE_FIFO_OVERFLOW : Boolean := False;
      --  unspecified
      Reserved_2_31               : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CTRL_STATUS_Register use record
      TRACE_CAPTURE_FIFO_FLUSH    at 0 range 0 .. 0;
      TRACE_CAPTURE_FIFO_OVERFLOW at 0 range 1 .. 1;
      Reserved_2_31               at 0 range 2 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Coresight block - RP specific registers
   type CORESIGHT_TRACE_Peripheral is record
      --  Control and status register
      CTRL_STATUS        : aliased CTRL_STATUS_Register;
      --  FIFO for trace data captured from the TPIU
      TRACE_CAPTURE_FIFO : aliased HAL.UInt32;
   end record
     with Volatile;

   for CORESIGHT_TRACE_Peripheral use record
      CTRL_STATUS        at 16#0# range 0 .. 31;
      TRACE_CAPTURE_FIFO at 16#4# range 0 .. 31;
   end record;

   --  Coresight block - RP specific registers
   CORESIGHT_TRACE_Periph : aliased CORESIGHT_TRACE_Peripheral
     with Import, Address => CORESIGHT_TRACE_Base;

end RP2350_SVD.CORESIGHT_TRACE;
