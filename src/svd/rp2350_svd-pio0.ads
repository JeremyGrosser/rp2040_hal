pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

--  Programmable IO block
package RP2350_SVD.PIO0 is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CTRL_SM_ENABLE_Field is HAL.UInt4;
   subtype CTRL_SM_RESTART_Field is HAL.UInt4;
   subtype CTRL_CLKDIV_RESTART_Field is HAL.UInt4;
   subtype CTRL_PREV_PIO_MASK_Field is HAL.UInt4;
   subtype CTRL_NEXT_PIO_MASK_Field is HAL.UInt4;

   --  PIO control register
   type CTRL_Register is record
      --  Enable/disable each of the four state machines by writing 1/0 to each
      --  of these four bits. When disabled, a state machine will cease
      --  executing instructions, except those written directly to SMx_INSTR by
      --  the system. Multiple bits can be set/cleared at once to run/halt
      --  multiple state machines simultaneously.
      SM_ENABLE               : CTRL_SM_ENABLE_Field := 16#0#;
      --  Write-only. Write 1 to instantly clear internal SM state which may be
      --  otherwise difficult to access and will affect future execution.
      --  Specifically, the following are cleared: input and output shift
      --  counters; the contents of the input shift register; the delay
      --  counter; the waiting-on-IRQ state; any stalled instruction written to
      --  SMx_INSTR or run by OUT/MOV EXEC; any pin write left asserted due to
      --  OUT_STICKY. The contents of the output shift register and the X/Y
      --  scratch registers are not affected.
      SM_RESTART              : CTRL_SM_RESTART_Field := 16#0#;
      --  Write-only. Restart a state machine's clock divider from an initial
      --  phase of 0. Clock dividers are free-running, so once started, their
      --  output (including fractional jitter) is completely determined by the
      --  integer/fractional divisor configured in SMx_CLKDIV. This means that,
      --  if multiple clock dividers with the same divisor are restarted
      --  simultaneously, by writing multiple 1 bits to this field, the
      --  execution clocks of those state machines will run in precise
      --  lockstep. Note that setting/clearing SM_ENABLE does not stop the
      --  clock divider from running, so once multiple state machines' clocks
      --  are synchronised, it is safe to disable/reenable a state machine,
      --  whilst keeping the clock dividers in sync. Note also that
      --  CLKDIV_RESTART can be written to whilst the state machine is running,
      --  and this is useful to resynchronise clock dividers after the divisors
      --  (SMx_CLKDIV) have been changed on-the-fly.
      CLKDIV_RESTART          : CTRL_CLKDIV_RESTART_Field := 16#0#;
      --  unspecified
      Reserved_12_15          : HAL.UInt4 := 16#0#;
      --  Write-only. A mask of state machines in the neighbouring
      --  lower-numbered PIO block in the system (or the highest-numbered PIO
      --  block if this is PIO block 0) to which to apply the operations
      --  specified by OP_CLKDIV_RESTART, OP_ENABLE, OP_DISABLE in the same
      --  write. This allows state machines in a neighbouring PIO block to be
      --  started/stopped/clock-synced exactly simultaneously with a write to
      --  this PIO block's CTRL register. Neighbouring PIO blocks are
      --  disconnected (status signals tied to 0 and control signals ignored)
      --  if one block is accessible to NonSecure code, and one is not.
      PREV_PIO_MASK           : CTRL_PREV_PIO_MASK_Field := 16#0#;
      --  Write-only. A mask of state machines in the neighbouring
      --  higher-numbered PIO block in the system (or PIO block 0 if this is
      --  the highest-numbered PIO block) to which to apply the operations
      --  specified by NEXTPREV_CLKDIV_RESTART, NEXTPREV_SM_ENABLE, and
      --  NEXTPREV_SM_DISABLE in the same write. This allows state machines in
      --  a neighbouring PIO block to be started/stopped/clock-synced exactly
      --  simultaneously with a write to this PIO block's CTRL register. Note
      --  that in a system with two PIOs, NEXT_PIO_MASK and PREV_PIO_MASK
      --  actually indicate the same PIO block. In this case the effects are
      --  applied cumulatively (as though the masks were OR'd together).
      --  Neighbouring PIO blocks are disconnected (status signals tied to 0
      --  and control signals ignored) if one block is accessible to NonSecure
      --  code, and one is not.
      NEXT_PIO_MASK           : CTRL_NEXT_PIO_MASK_Field := 16#0#;
      --  Write-only. Write 1 to enable state machines in neighbouring PIO
      --  blocks, as specified by NEXT_PIO_MASK and PREV_PIO_MASK in the same
      --  write. This is equivalent to setting the corresponding SM_ENABLE bits
      --  in those PIOs' CTRL registers. If both OTHERS_SM_ENABLE and
      --  OTHERS_SM_DISABLE are set, the disable takes precedence.
      NEXTPREV_SM_ENABLE      : Boolean := False;
      --  Write-only. Write 1 to disable state machines in neighbouring PIO
      --  blocks, as specified by NEXT_PIO_MASK and PREV_PIO_MASK in the same
      --  write. This is equivalent to clearing the corresponding SM_ENABLE
      --  bits in those PIOs' CTRL registers.
      NEXTPREV_SM_DISABLE     : Boolean := False;
      --  Write-only. Write 1 to restart the clock dividers of state machines
      --  in neighbouring PIO blocks, as specified by NEXT_PIO_MASK and
      --  PREV_PIO_MASK in the same write. This is equivalent to writing 1 to
      --  the corresponding CLKDIV_RESTART bits in those PIOs' CTRL registers.
      NEXTPREV_CLKDIV_RESTART : Boolean := False;
      --  unspecified
      Reserved_27_31          : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CTRL_Register use record
      SM_ENABLE               at 0 range 0 .. 3;
      SM_RESTART              at 0 range 4 .. 7;
      CLKDIV_RESTART          at 0 range 8 .. 11;
      Reserved_12_15          at 0 range 12 .. 15;
      PREV_PIO_MASK           at 0 range 16 .. 19;
      NEXT_PIO_MASK           at 0 range 20 .. 23;
      NEXTPREV_SM_ENABLE      at 0 range 24 .. 24;
      NEXTPREV_SM_DISABLE     at 0 range 25 .. 25;
      NEXTPREV_CLKDIV_RESTART at 0 range 26 .. 26;
      Reserved_27_31          at 0 range 27 .. 31;
   end record;

   subtype FSTAT_RXFULL_Field is HAL.UInt4;
   subtype FSTAT_RXEMPTY_Field is HAL.UInt4;
   subtype FSTAT_TXFULL_Field is HAL.UInt4;
   subtype FSTAT_TXEMPTY_Field is HAL.UInt4;

   --  FIFO status register
   type FSTAT_Register is record
      --  Read-only. State machine RX FIFO is full
      RXFULL         : FSTAT_RXFULL_Field;
      --  unspecified
      Reserved_4_7   : HAL.UInt4;
      --  Read-only. State machine RX FIFO is empty
      RXEMPTY        : FSTAT_RXEMPTY_Field;
      --  unspecified
      Reserved_12_15 : HAL.UInt4;
      --  Read-only. State machine TX FIFO is full
      TXFULL         : FSTAT_TXFULL_Field;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. State machine TX FIFO is empty
      TXEMPTY        : FSTAT_TXEMPTY_Field;
      --  unspecified
      Reserved_28_31 : HAL.UInt4;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FSTAT_Register use record
      RXFULL         at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      RXEMPTY        at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      TXFULL         at 0 range 16 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      TXEMPTY        at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype FDEBUG_RXSTALL_Field is HAL.UInt4;
   subtype FDEBUG_RXUNDER_Field is HAL.UInt4;
   subtype FDEBUG_TXOVER_Field is HAL.UInt4;
   subtype FDEBUG_TXSTALL_Field is HAL.UInt4;

   --  FIFO debug register
   type FDEBUG_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. State machine has stalled on full RX FIFO during a
      --  blocking PUSH, or an IN with autopush enabled. This flag is also set
      --  when a nonblocking PUSH to a full FIFO took place, in which case the
      --  state machine has dropped data. Write 1 to clear.
      RXSTALL        : FDEBUG_RXSTALL_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : HAL.UInt4 := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. RX FIFO underflow (i.e. read-on-empty by the system)
      --  has occurred. Write 1 to clear. Note that read-on-empty does not
      --  perturb the state of the FIFO in any way, but the data returned by
      --  reading from an empty FIFO is undefined, so this flag generally only
      --  becomes set due to some kind of software error.
      RXUNDER        : FDEBUG_RXUNDER_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. TX FIFO overflow (i.e. write-on-full by the system) has
      --  occurred. Write 1 to clear. Note that write-on-full does not alter
      --  the state or contents of the FIFO in any way, but the data that the
      --  system attempted to write is dropped, so if this flag is set, your
      --  software has quite likely dropped some data on the floor.
      TXOVER         : FDEBUG_TXOVER_Field := 16#0#;
      --  unspecified
      Reserved_20_23 : HAL.UInt4 := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. State machine has stalled on empty TX FIFO during a
      --  blocking PULL, or an OUT with autopull enabled. Write 1 to clear.
      TXSTALL        : FDEBUG_TXSTALL_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDEBUG_Register use record
      RXSTALL        at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      RXUNDER        at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      TXOVER         at 0 range 16 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      TXSTALL        at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype FLEVEL_TX0_Field is HAL.UInt4;
   subtype FLEVEL_RX0_Field is HAL.UInt4;
   subtype FLEVEL_TX1_Field is HAL.UInt4;
   subtype FLEVEL_RX1_Field is HAL.UInt4;
   subtype FLEVEL_TX2_Field is HAL.UInt4;
   subtype FLEVEL_RX2_Field is HAL.UInt4;
   subtype FLEVEL_TX3_Field is HAL.UInt4;
   subtype FLEVEL_RX3_Field is HAL.UInt4;

   --  FIFO levels
   type FLEVEL_Register is record
      --  Read-only.
      TX0 : FLEVEL_TX0_Field;
      --  Read-only.
      RX0 : FLEVEL_RX0_Field;
      --  Read-only.
      TX1 : FLEVEL_TX1_Field;
      --  Read-only.
      RX1 : FLEVEL_RX1_Field;
      --  Read-only.
      TX2 : FLEVEL_TX2_Field;
      --  Read-only.
      RX2 : FLEVEL_RX2_Field;
      --  Read-only.
      TX3 : FLEVEL_TX3_Field;
      --  Read-only.
      RX3 : FLEVEL_RX3_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FLEVEL_Register use record
      TX0 at 0 range 0 .. 3;
      RX0 at 0 range 4 .. 7;
      TX1 at 0 range 8 .. 11;
      RX1 at 0 range 12 .. 15;
      TX2 at 0 range 16 .. 19;
      RX2 at 0 range 20 .. 23;
      TX3 at 0 range 24 .. 27;
      RX3 at 0 range 28 .. 31;
   end record;

   subtype IRQ_IRQ_Field is HAL.UInt8;

   --  State machine IRQ flags register. Write 1 to clear. There are eight
   --  state machine IRQ flags, which can be set, cleared, and waited on by the
   --  state machines. There's no fixed association between flags and state
   --  machines -- any state machine can use any flag. Any of the eight flags
   --  can be used for timing synchronisation between state machines, using IRQ
   --  and WAIT instructions. Any combination of the eight flags can also
   --  routed out to either of the two system-level interrupt requests,
   --  alongside FIFO status interrupts -- see e.g. IRQ0_INTE.
   type IRQ_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      IRQ           : IRQ_IRQ_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRQ_Register use record
      IRQ           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype IRQ_FORCE_IRQ_FORCE_Field is HAL.UInt8;

   --  Writing a 1 to each of these bits will forcibly assert the corresponding
   --  IRQ. Note this is different to the INTF register: writing here affects
   --  PIO internal state. INTF just asserts the processor-facing IRQ signal
   --  for testing ISRs, and is not visible to the state machines.
   type IRQ_FORCE_Register is record
      --  Write-only.
      IRQ_FORCE     : IRQ_FORCE_IRQ_FORCE_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRQ_FORCE_Register use record
      IRQ_FORCE     at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DBG_CFGINFO_FIFO_DEPTH_Field is HAL.UInt6;
   subtype DBG_CFGINFO_SM_COUNT_Field is HAL.UInt4;
   subtype DBG_CFGINFO_IMEM_SIZE_Field is HAL.UInt6;

   --  Version of the core PIO hardware.
   type DBG_CFGINFO_VERSION_Field is
     (--  Version 0 (RP2040)
      v0,
      --  Version 1 (RP2350)
      v1)
     with Size => 4;
   for DBG_CFGINFO_VERSION_Field use
     (v0 => 0,
      v1 => 1);

   --  The PIO hardware has some free parameters that may vary between chip
   --  products. These should be provided in the chip datasheet, but are also
   --  exposed here.
   type DBG_CFGINFO_Register is record
      --  Read-only. The depth of the state machine TX/RX FIFOs, measured in
      --  words. Joining fifos via SHIFTCTRL_FJOIN gives one FIFO with double
      --  this depth.
      FIFO_DEPTH     : DBG_CFGINFO_FIFO_DEPTH_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. The number of state machines this PIO instance is equipped
      --  with.
      SM_COUNT       : DBG_CFGINFO_SM_COUNT_Field;
      --  unspecified
      Reserved_12_15 : HAL.UInt4;
      --  Read-only. The size of the instruction memory, measured in units of
      --  one instruction
      IMEM_SIZE      : DBG_CFGINFO_IMEM_SIZE_Field;
      --  unspecified
      Reserved_22_27 : HAL.UInt6;
      --  Read-only. Version of the core PIO hardware.
      VERSION        : DBG_CFGINFO_VERSION_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DBG_CFGINFO_Register use record
      FIFO_DEPTH     at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      SM_COUNT       at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      IMEM_SIZE      at 0 range 16 .. 21;
      Reserved_22_27 at 0 range 22 .. 27;
      VERSION        at 0 range 28 .. 31;
   end record;

   subtype INSTR_MEM0_INSTR_MEM0_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 0
   type INSTR_MEM0_Register is record
      --  Write-only.
      INSTR_MEM0     : INSTR_MEM0_INSTR_MEM0_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM0_Register use record
      INSTR_MEM0     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM1_INSTR_MEM1_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 1
   type INSTR_MEM1_Register is record
      --  Write-only.
      INSTR_MEM1     : INSTR_MEM1_INSTR_MEM1_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM1_Register use record
      INSTR_MEM1     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM2_INSTR_MEM2_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 2
   type INSTR_MEM2_Register is record
      --  Write-only.
      INSTR_MEM2     : INSTR_MEM2_INSTR_MEM2_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM2_Register use record
      INSTR_MEM2     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM3_INSTR_MEM3_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 3
   type INSTR_MEM3_Register is record
      --  Write-only.
      INSTR_MEM3     : INSTR_MEM3_INSTR_MEM3_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM3_Register use record
      INSTR_MEM3     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM4_INSTR_MEM4_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 4
   type INSTR_MEM4_Register is record
      --  Write-only.
      INSTR_MEM4     : INSTR_MEM4_INSTR_MEM4_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM4_Register use record
      INSTR_MEM4     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM5_INSTR_MEM5_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 5
   type INSTR_MEM5_Register is record
      --  Write-only.
      INSTR_MEM5     : INSTR_MEM5_INSTR_MEM5_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM5_Register use record
      INSTR_MEM5     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM6_INSTR_MEM6_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 6
   type INSTR_MEM6_Register is record
      --  Write-only.
      INSTR_MEM6     : INSTR_MEM6_INSTR_MEM6_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM6_Register use record
      INSTR_MEM6     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM7_INSTR_MEM7_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 7
   type INSTR_MEM7_Register is record
      --  Write-only.
      INSTR_MEM7     : INSTR_MEM7_INSTR_MEM7_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM7_Register use record
      INSTR_MEM7     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM8_INSTR_MEM8_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 8
   type INSTR_MEM8_Register is record
      --  Write-only.
      INSTR_MEM8     : INSTR_MEM8_INSTR_MEM8_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM8_Register use record
      INSTR_MEM8     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM9_INSTR_MEM9_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 9
   type INSTR_MEM9_Register is record
      --  Write-only.
      INSTR_MEM9     : INSTR_MEM9_INSTR_MEM9_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM9_Register use record
      INSTR_MEM9     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM10_INSTR_MEM10_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 10
   type INSTR_MEM10_Register is record
      --  Write-only.
      INSTR_MEM10    : INSTR_MEM10_INSTR_MEM10_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM10_Register use record
      INSTR_MEM10    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM11_INSTR_MEM11_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 11
   type INSTR_MEM11_Register is record
      --  Write-only.
      INSTR_MEM11    : INSTR_MEM11_INSTR_MEM11_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM11_Register use record
      INSTR_MEM11    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM12_INSTR_MEM12_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 12
   type INSTR_MEM12_Register is record
      --  Write-only.
      INSTR_MEM12    : INSTR_MEM12_INSTR_MEM12_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM12_Register use record
      INSTR_MEM12    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM13_INSTR_MEM13_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 13
   type INSTR_MEM13_Register is record
      --  Write-only.
      INSTR_MEM13    : INSTR_MEM13_INSTR_MEM13_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM13_Register use record
      INSTR_MEM13    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM14_INSTR_MEM14_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 14
   type INSTR_MEM14_Register is record
      --  Write-only.
      INSTR_MEM14    : INSTR_MEM14_INSTR_MEM14_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM14_Register use record
      INSTR_MEM14    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM15_INSTR_MEM15_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 15
   type INSTR_MEM15_Register is record
      --  Write-only.
      INSTR_MEM15    : INSTR_MEM15_INSTR_MEM15_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM15_Register use record
      INSTR_MEM15    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM16_INSTR_MEM16_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 16
   type INSTR_MEM16_Register is record
      --  Write-only.
      INSTR_MEM16    : INSTR_MEM16_INSTR_MEM16_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM16_Register use record
      INSTR_MEM16    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM17_INSTR_MEM17_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 17
   type INSTR_MEM17_Register is record
      --  Write-only.
      INSTR_MEM17    : INSTR_MEM17_INSTR_MEM17_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM17_Register use record
      INSTR_MEM17    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM18_INSTR_MEM18_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 18
   type INSTR_MEM18_Register is record
      --  Write-only.
      INSTR_MEM18    : INSTR_MEM18_INSTR_MEM18_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM18_Register use record
      INSTR_MEM18    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM19_INSTR_MEM19_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 19
   type INSTR_MEM19_Register is record
      --  Write-only.
      INSTR_MEM19    : INSTR_MEM19_INSTR_MEM19_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM19_Register use record
      INSTR_MEM19    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM20_INSTR_MEM20_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 20
   type INSTR_MEM20_Register is record
      --  Write-only.
      INSTR_MEM20    : INSTR_MEM20_INSTR_MEM20_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM20_Register use record
      INSTR_MEM20    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM21_INSTR_MEM21_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 21
   type INSTR_MEM21_Register is record
      --  Write-only.
      INSTR_MEM21    : INSTR_MEM21_INSTR_MEM21_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM21_Register use record
      INSTR_MEM21    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM22_INSTR_MEM22_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 22
   type INSTR_MEM22_Register is record
      --  Write-only.
      INSTR_MEM22    : INSTR_MEM22_INSTR_MEM22_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM22_Register use record
      INSTR_MEM22    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM23_INSTR_MEM23_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 23
   type INSTR_MEM23_Register is record
      --  Write-only.
      INSTR_MEM23    : INSTR_MEM23_INSTR_MEM23_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM23_Register use record
      INSTR_MEM23    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM24_INSTR_MEM24_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 24
   type INSTR_MEM24_Register is record
      --  Write-only.
      INSTR_MEM24    : INSTR_MEM24_INSTR_MEM24_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM24_Register use record
      INSTR_MEM24    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM25_INSTR_MEM25_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 25
   type INSTR_MEM25_Register is record
      --  Write-only.
      INSTR_MEM25    : INSTR_MEM25_INSTR_MEM25_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM25_Register use record
      INSTR_MEM25    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM26_INSTR_MEM26_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 26
   type INSTR_MEM26_Register is record
      --  Write-only.
      INSTR_MEM26    : INSTR_MEM26_INSTR_MEM26_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM26_Register use record
      INSTR_MEM26    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM27_INSTR_MEM27_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 27
   type INSTR_MEM27_Register is record
      --  Write-only.
      INSTR_MEM27    : INSTR_MEM27_INSTR_MEM27_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM27_Register use record
      INSTR_MEM27    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM28_INSTR_MEM28_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 28
   type INSTR_MEM28_Register is record
      --  Write-only.
      INSTR_MEM28    : INSTR_MEM28_INSTR_MEM28_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM28_Register use record
      INSTR_MEM28    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM29_INSTR_MEM29_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 29
   type INSTR_MEM29_Register is record
      --  Write-only.
      INSTR_MEM29    : INSTR_MEM29_INSTR_MEM29_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM29_Register use record
      INSTR_MEM29    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM30_INSTR_MEM30_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 30
   type INSTR_MEM30_Register is record
      --  Write-only.
      INSTR_MEM30    : INSTR_MEM30_INSTR_MEM30_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM30_Register use record
      INSTR_MEM30    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INSTR_MEM31_INSTR_MEM31_Field is HAL.UInt16;

   --  Write-only access to instruction memory location 31
   type INSTR_MEM31_Register is record
      --  Write-only.
      INSTR_MEM31    : INSTR_MEM31_INSTR_MEM31_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INSTR_MEM31_Register use record
      INSTR_MEM31    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype SM0_CLKDIV_FRAC_Field is HAL.UInt8;
   subtype SM0_CLKDIV_INT_Field is HAL.UInt16;

   --  Clock divisor register for state machine 0 Frequency = clock freq /
   --  (CLKDIV_INT + CLKDIV_FRAC / 256)
   type SM0_CLKDIV_Register is record
      --  unspecified
      Reserved_0_7 : HAL.UInt8 := 16#0#;
      --  Fractional part of clock divisor
      FRAC         : SM0_CLKDIV_FRAC_Field := 16#0#;
      --  Effective frequency is sysclk/(int + frac/256). Value of 0 is
      --  interpreted as 65536. If INT is 0, FRAC must also be 0.
      INT          : SM0_CLKDIV_INT_Field := 16#1#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SM0_CLKDIV_Register use record
      Reserved_0_7 at 0 range 0 .. 7;
      FRAC         at 0 range 8 .. 15;
      INT          at 0 range 16 .. 31;
   end record;

   --  Comparison level or IRQ index for the MOV x, STATUS instruction. If
   --  STATUS_SEL is TXLEVEL or RXLEVEL, then values of STATUS_N greater than
   --  the current FIFO depth are reserved, and have undefined behaviour.
   type SM0_EXECCTRL_STATUS_N_Field is
     (--  Index 0-7 of an IRQ flag in this PIO block
      IRQ,
      --  Index 0-7 of an IRQ flag in the next lower-numbered PIO block
      IRQ_PREVPIO,
      --  Index 0-7 of an IRQ flag in the next higher-numbered PIO block
      IRQ_NEXTPIO)
     with Size => 5;
   for SM0_EXECCTRL_STATUS_N_Field use
     (IRQ => 0,
      IRQ_PREVPIO => 8,
      IRQ_NEXTPIO => 16);

   --  Comparison used for the MOV x, STATUS instruction.
   type SM0_EXECCTRL_STATUS_SEL_Field is
     (--  All-ones if TX FIFO level < N, otherwise all-zeroes
      TXLEVEL,
      --  All-ones if RX FIFO level < N, otherwise all-zeroes
      RXLEVEL,
      --  All-ones if the indexed IRQ flag is raised, otherwise all-zeroes
      IRQ)
     with Size => 2;
   for SM0_EXECCTRL_STATUS_SEL_Field use
     (TXLEVEL => 0,
      RXLEVEL => 1,
      IRQ => 2);

   subtype SM0_EXECCTRL_WRAP_BOTTOM_Field is HAL.UInt5;
   subtype SM0_EXECCTRL_WRAP_TOP_Field is HAL.UInt5;
   subtype SM0_EXECCTRL_OUT_EN_SEL_Field is HAL.UInt5;
   subtype SM0_EXECCTRL_JMP_PIN_Field is HAL.UInt5;

   --  Execution/behavioural settings for state machine 0
   type SM0_EXECCTRL_Register is record
      --  Comparison level or IRQ index for the MOV x, STATUS instruction. If
      --  STATUS_SEL is TXLEVEL or RXLEVEL, then values of STATUS_N greater
      --  than the current FIFO depth are reserved, and have undefined
      --  behaviour.
      STATUS_N      : SM0_EXECCTRL_STATUS_N_Field := RP2350_SVD.PIO0.IRQ;
      --  Comparison used for the MOV x, STATUS instruction.
      STATUS_SEL    : SM0_EXECCTRL_STATUS_SEL_Field :=
                       RP2350_SVD.PIO0.TXLEVEL;
      --  After reaching wrap_top, execution is wrapped to this address.
      WRAP_BOTTOM   : SM0_EXECCTRL_WRAP_BOTTOM_Field := 16#0#;
      --  After reaching this address, execution is wrapped to wrap_bottom. If
      --  the instruction is a jump, and the jump condition is true, the jump
      --  takes priority.
      WRAP_TOP      : SM0_EXECCTRL_WRAP_TOP_Field := 16#1F#;
      --  Continuously assert the most recent OUT/SET to the pins
      OUT_STICKY    : Boolean := False;
      --  If 1, use a bit of OUT data as an auxiliary write enable When used in
      --  conjunction with OUT_STICKY, writes with an enable of 0 will deassert
      --  the latest pin write. This can create useful masking/override
      --  behaviour due to the priority ordering of state machine pin writes
      --  (SM0 < SM1 < ...)
      INLINE_OUT_EN : Boolean := False;
      --  Which data bit to use for inline OUT enable
      OUT_EN_SEL    : SM0_EXECCTRL_OUT_EN_SEL_Field := 16#0#;
      --  The GPIO number to use as condition for JMP PIN. Unaffected by input
      --  mapping.
      JMP_PIN       : SM0_EXECCTRL_JMP_PIN_Field := 16#0#;
      --  If 1, side-set data is asserted to pin directions, instead of pin
      --  values
      SIDE_PINDIR   : Boolean := False;
      --  If 1, the MSB of the Delay/Side-set instruction field is used as
      --  side-set enable, rather than a side-set data bit. This allows
      --  instructions to perform side-set optionally, rather than on every
      --  instruction, but the maximum possible side-set width is reduced from
      --  5 to 4. Note that the value of PINCTRL_SIDESET_COUNT is inclusive of
      --  this enable bit.
      SIDE_EN       : Boolean := False;
      --  Read-only. If 1, an instruction written to SMx_INSTR is stalled, and
      --  latched by the state machine. Will clear to 0 once this instruction
      --  completes.
      EXEC_STALLED  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SM0_EXECCTRL_Register use record
      STATUS_N      at 0 range 0 .. 4;
      STATUS_SEL    at 0 range 5 .. 6;
      WRAP_BOTTOM   at 0 range 7 .. 11;
      WRAP_TOP      at 0 range 12 .. 16;
      OUT_STICKY    at 0 range 17 .. 17;
      INLINE_OUT_EN at 0 range 18 .. 18;
      OUT_EN_SEL    at 0 range 19 .. 23;
      JMP_PIN       at 0 range 24 .. 28;
      SIDE_PINDIR   at 0 range 29 .. 29;
      SIDE_EN       at 0 range 30 .. 30;
      EXEC_STALLED  at 0 range 31 .. 31;
   end record;

   subtype SM0_SHIFTCTRL_IN_COUNT_Field is HAL.UInt5;
   subtype SM0_SHIFTCTRL_PUSH_THRESH_Field is HAL.UInt5;
   subtype SM0_SHIFTCTRL_PULL_THRESH_Field is HAL.UInt5;

   --  Control behaviour of the input/output shift registers for state machine
   --  0
   type SM0_SHIFTCTRL_Register is record
      --  Set the number of pins which are not masked to 0 when read by an IN
      --  PINS, WAIT PIN or MOV x, PINS instruction. For example, an IN_COUNT
      --  of 5 means that the 5 LSBs of the IN pin group are visible (bits
      --  4:0), but the remaining 27 MSBs are masked to 0. A count of 32 is
      --  encoded with a field value of 0, so the default behaviour is to not
      --  perform any masking. Note this masking is applied in addition to the
      --  masking usually performed by the IN instruction. This is mainly
      --  useful for the MOV x, PINS instruction, which otherwise has no way of
      --  masking pins.
      IN_COUNT      : SM0_SHIFTCTRL_IN_COUNT_Field := 16#0#;
      --  unspecified
      Reserved_5_13 : HAL.UInt9 := 16#0#;
      --  If 1, disable this state machine's RX FIFO, make its storage
      --  available for random read access by the state machine (using the
      --  `get` instruction) and, unless FJOIN_RX_PUT is also set, random write
      --  access by the processor (through the RXFx_PUTGETy registers). If
      --  FJOIN_RX_PUT and FJOIN_RX_GET are both set, then the RX FIFO's
      --  registers can be randomly read/written by the state machine, but are
      --  completely inaccessible to the processor. Setting this bit will clear
      --  the FJOIN_TX and FJOIN_RX bits.
      FJOIN_RX_GET  : Boolean := False;
      --  If 1, disable this state machine's RX FIFO, make its storage
      --  available for random write access by the state machine (using the
      --  `put` instruction) and, unless FJOIN_RX_GET is also set, random read
      --  access by the processor (through the RXFx_PUTGETy registers). If
      --  FJOIN_RX_PUT and FJOIN_RX_GET are both set, then the RX FIFO's
      --  registers can be randomly read/written by the state machine, but are
      --  completely inaccessible to the processor. Setting this bit will clear
      --  the FJOIN_TX and FJOIN_RX bits.
      FJOIN_RX_PUT  : Boolean := False;
      --  Push automatically when the input shift register is filled, i.e. on
      --  an IN instruction which causes the input shift counter to reach or
      --  exceed PUSH_THRESH.
      AUTOPUSH      : Boolean := False;
      --  Pull automatically when the output shift register is emptied, i.e. on
      --  or following an OUT instruction which causes the output shift counter
      --  to reach or exceed PULL_THRESH.
      AUTOPULL      : Boolean := False;
      --  1 = shift input shift register to right (data enters from left). 0 =
      --  to left.
      IN_SHIFTDIR   : Boolean := True;
      --  1 = shift out of output shift register to right. 0 = to left.
      OUT_SHIFTDIR  : Boolean := True;
      --  Number of bits shifted into ISR before autopush, or conditional push
      --  (PUSH IFFULL), will take place. Write 0 for value of 32.
      PUSH_THRESH   : SM0_SHIFTCTRL_PUSH_THRESH_Field := 16#0#;
      --  Number of bits shifted out of OSR before autopull, or conditional
      --  pull (PULL IFEMPTY), will take place. Write 0 for value of 32.
      PULL_THRESH   : SM0_SHIFTCTRL_PULL_THRESH_Field := 16#0#;
      --  When 1, TX FIFO steals the RX FIFO's storage, and becomes twice as
      --  deep. RX FIFO is disabled as a result (always reads as both full and
      --  empty). FIFOs are flushed when this bit is changed.
      FJOIN_TX      : Boolean := False;
      --  When 1, RX FIFO steals the TX FIFO's storage, and becomes twice as
      --  deep. TX FIFO is disabled as a result (always reads as both full and
      --  empty). FIFOs are flushed when this bit is changed.
      FJOIN_RX      : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SM0_SHIFTCTRL_Register use record
      IN_COUNT      at 0 range 0 .. 4;
      Reserved_5_13 at 0 range 5 .. 13;
      FJOIN_RX_GET  at 0 range 14 .. 14;
      FJOIN_RX_PUT  at 0 range 15 .. 15;
      AUTOPUSH      at 0 range 16 .. 16;
      AUTOPULL      at 0 range 17 .. 17;
      IN_SHIFTDIR   at 0 range 18 .. 18;
      OUT_SHIFTDIR  at 0 range 19 .. 19;
      PUSH_THRESH   at 0 range 20 .. 24;
      PULL_THRESH   at 0 range 25 .. 29;
      FJOIN_TX      at 0 range 30 .. 30;
      FJOIN_RX      at 0 range 31 .. 31;
   end record;

   subtype SM0_ADDR_SM0_ADDR_Field is HAL.UInt5;

   --  Current instruction address of state machine 0
   type SM0_ADDR_Register is record
      --  Read-only.
      SM0_ADDR      : SM0_ADDR_SM0_ADDR_Field;
      --  unspecified
      Reserved_5_31 : HAL.UInt27;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SM0_ADDR_Register use record
      SM0_ADDR      at 0 range 0 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype SM0_INSTR_SM0_INSTR_Field is HAL.UInt16;

   --  Read to see the instruction currently addressed by state machine 0's
   --  program counter Write to execute an instruction immediately (including
   --  jumps) and then resume execution.
   type SM0_INSTR_Register is record
      SM0_INSTR      : SM0_INSTR_SM0_INSTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SM0_INSTR_Register use record
      SM0_INSTR      at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype SM0_PINCTRL_OUT_BASE_Field is HAL.UInt5;
   subtype SM0_PINCTRL_SET_BASE_Field is HAL.UInt5;
   subtype SM0_PINCTRL_SIDESET_BASE_Field is HAL.UInt5;
   subtype SM0_PINCTRL_IN_BASE_Field is HAL.UInt5;
   subtype SM0_PINCTRL_OUT_COUNT_Field is HAL.UInt6;
   subtype SM0_PINCTRL_SET_COUNT_Field is HAL.UInt3;
   subtype SM0_PINCTRL_SIDESET_COUNT_Field is HAL.UInt3;

   --  State machine pin control
   type SM0_PINCTRL_Register is record
      --  The lowest-numbered pin that will be affected by an OUT PINS, OUT
      --  PINDIRS or MOV PINS instruction. The data written to this pin will
      --  always be the least-significant bit of the OUT or MOV data.
      OUT_BASE      : SM0_PINCTRL_OUT_BASE_Field := 16#0#;
      --  The lowest-numbered pin that will be affected by a SET PINS or SET
      --  PINDIRS instruction. The data written to this pin is the
      --  least-significant bit of the SET data.
      SET_BASE      : SM0_PINCTRL_SET_BASE_Field := 16#0#;
      --  The lowest-numbered pin that will be affected by a side-set
      --  operation. The MSBs of an instruction's side-set/delay field (up to
      --  5, determined by SIDESET_COUNT) are used for side-set data, with the
      --  remaining LSBs used for delay. The least-significant bit of the
      --  side-set portion is the bit written to this pin, with
      --  more-significant bits written to higher-numbered pins.
      SIDESET_BASE  : SM0_PINCTRL_SIDESET_BASE_Field := 16#0#;
      --  The pin which is mapped to the least-significant bit of a state
      --  machine's IN data bus. Higher-numbered pins are mapped to
      --  consecutively more-significant data bits, with a modulo of 32 applied
      --  to pin number.
      IN_BASE       : SM0_PINCTRL_IN_BASE_Field := 16#0#;
      --  The number of pins asserted by an OUT PINS, OUT PINDIRS or MOV PINS
      --  instruction. In the range 0 to 32 inclusive.
      OUT_COUNT     : SM0_PINCTRL_OUT_COUNT_Field := 16#0#;
      --  The number of pins asserted by a SET. In the range 0 to 5 inclusive.
      SET_COUNT     : SM0_PINCTRL_SET_COUNT_Field := 16#5#;
      --  The number of MSBs of the Delay/Side-set instruction field which are
      --  used for side-set. Inclusive of the enable bit, if present. Minimum
      --  of 0 (all delay bits, no side-set) and maximum of 5 (all side-set, no
      --  delay).
      SIDESET_COUNT : SM0_PINCTRL_SIDESET_COUNT_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SM0_PINCTRL_Register use record
      OUT_BASE      at 0 range 0 .. 4;
      SET_BASE      at 0 range 5 .. 9;
      SIDESET_BASE  at 0 range 10 .. 14;
      IN_BASE       at 0 range 15 .. 19;
      OUT_COUNT     at 0 range 20 .. 25;
      SET_COUNT     at 0 range 26 .. 28;
      SIDESET_COUNT at 0 range 29 .. 31;
   end record;

   subtype SM1_CLKDIV_FRAC_Field is HAL.UInt8;
   subtype SM1_CLKDIV_INT_Field is HAL.UInt16;

   --  Clock divisor register for state machine 1 Frequency = clock freq /
   --  (CLKDIV_INT + CLKDIV_FRAC / 256)
   type SM1_CLKDIV_Register is record
      --  unspecified
      Reserved_0_7 : HAL.UInt8 := 16#0#;
      --  Fractional part of clock divisor
      FRAC         : SM1_CLKDIV_FRAC_Field := 16#0#;
      --  Effective frequency is sysclk/(int + frac/256). Value of 0 is
      --  interpreted as 65536. If INT is 0, FRAC must also be 0.
      INT          : SM1_CLKDIV_INT_Field := 16#1#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SM1_CLKDIV_Register use record
      Reserved_0_7 at 0 range 0 .. 7;
      FRAC         at 0 range 8 .. 15;
      INT          at 0 range 16 .. 31;
   end record;

   --  Comparison level or IRQ index for the MOV x, STATUS instruction. If
   --  STATUS_SEL is TXLEVEL or RXLEVEL, then values of STATUS_N greater than
   --  the current FIFO depth are reserved, and have undefined behaviour.
   type SM1_EXECCTRL_STATUS_N_Field is
     (--  Index 0-7 of an IRQ flag in this PIO block
      IRQ,
      --  Index 0-7 of an IRQ flag in the next lower-numbered PIO block
      IRQ_PREVPIO,
      --  Index 0-7 of an IRQ flag in the next higher-numbered PIO block
      IRQ_NEXTPIO)
     with Size => 5;
   for SM1_EXECCTRL_STATUS_N_Field use
     (IRQ => 0,
      IRQ_PREVPIO => 8,
      IRQ_NEXTPIO => 16);

   --  Comparison used for the MOV x, STATUS instruction.
   type SM1_EXECCTRL_STATUS_SEL_Field is
     (--  All-ones if TX FIFO level < N, otherwise all-zeroes
      TXLEVEL,
      --  All-ones if RX FIFO level < N, otherwise all-zeroes
      RXLEVEL,
      --  All-ones if the indexed IRQ flag is raised, otherwise all-zeroes
      IRQ)
     with Size => 2;
   for SM1_EXECCTRL_STATUS_SEL_Field use
     (TXLEVEL => 0,
      RXLEVEL => 1,
      IRQ => 2);

   subtype SM1_EXECCTRL_WRAP_BOTTOM_Field is HAL.UInt5;
   subtype SM1_EXECCTRL_WRAP_TOP_Field is HAL.UInt5;
   subtype SM1_EXECCTRL_OUT_EN_SEL_Field is HAL.UInt5;
   subtype SM1_EXECCTRL_JMP_PIN_Field is HAL.UInt5;

   --  Execution/behavioural settings for state machine 1
   type SM1_EXECCTRL_Register is record
      --  Comparison level or IRQ index for the MOV x, STATUS instruction. If
      --  STATUS_SEL is TXLEVEL or RXLEVEL, then values of STATUS_N greater
      --  than the current FIFO depth are reserved, and have undefined
      --  behaviour.
      STATUS_N      : SM1_EXECCTRL_STATUS_N_Field := RP2350_SVD.PIO0.IRQ;
      --  Comparison used for the MOV x, STATUS instruction.
      STATUS_SEL    : SM1_EXECCTRL_STATUS_SEL_Field :=
                       RP2350_SVD.PIO0.TXLEVEL;
      --  After reaching wrap_top, execution is wrapped to this address.
      WRAP_BOTTOM   : SM1_EXECCTRL_WRAP_BOTTOM_Field := 16#0#;
      --  After reaching this address, execution is wrapped to wrap_bottom. If
      --  the instruction is a jump, and the jump condition is true, the jump
      --  takes priority.
      WRAP_TOP      : SM1_EXECCTRL_WRAP_TOP_Field := 16#1F#;
      --  Continuously assert the most recent OUT/SET to the pins
      OUT_STICKY    : Boolean := False;
      --  If 1, use a bit of OUT data as an auxiliary write enable When used in
      --  conjunction with OUT_STICKY, writes with an enable of 0 will deassert
      --  the latest pin write. This can create useful masking/override
      --  behaviour due to the priority ordering of state machine pin writes
      --  (SM0 < SM1 < ...)
      INLINE_OUT_EN : Boolean := False;
      --  Which data bit to use for inline OUT enable
      OUT_EN_SEL    : SM1_EXECCTRL_OUT_EN_SEL_Field := 16#0#;
      --  The GPIO number to use as condition for JMP PIN. Unaffected by input
      --  mapping.
      JMP_PIN       : SM1_EXECCTRL_JMP_PIN_Field := 16#0#;
      --  If 1, side-set data is asserted to pin directions, instead of pin
      --  values
      SIDE_PINDIR   : Boolean := False;
      --  If 1, the MSB of the Delay/Side-set instruction field is used as
      --  side-set enable, rather than a side-set data bit. This allows
      --  instructions to perform side-set optionally, rather than on every
      --  instruction, but the maximum possible side-set width is reduced from
      --  5 to 4. Note that the value of PINCTRL_SIDESET_COUNT is inclusive of
      --  this enable bit.
      SIDE_EN       : Boolean := False;
      --  Read-only. If 1, an instruction written to SMx_INSTR is stalled, and
      --  latched by the state machine. Will clear to 0 once this instruction
      --  completes.
      EXEC_STALLED  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SM1_EXECCTRL_Register use record
      STATUS_N      at 0 range 0 .. 4;
      STATUS_SEL    at 0 range 5 .. 6;
      WRAP_BOTTOM   at 0 range 7 .. 11;
      WRAP_TOP      at 0 range 12 .. 16;
      OUT_STICKY    at 0 range 17 .. 17;
      INLINE_OUT_EN at 0 range 18 .. 18;
      OUT_EN_SEL    at 0 range 19 .. 23;
      JMP_PIN       at 0 range 24 .. 28;
      SIDE_PINDIR   at 0 range 29 .. 29;
      SIDE_EN       at 0 range 30 .. 30;
      EXEC_STALLED  at 0 range 31 .. 31;
   end record;

   subtype SM1_SHIFTCTRL_IN_COUNT_Field is HAL.UInt5;
   subtype SM1_SHIFTCTRL_PUSH_THRESH_Field is HAL.UInt5;
   subtype SM1_SHIFTCTRL_PULL_THRESH_Field is HAL.UInt5;

   --  Control behaviour of the input/output shift registers for state machine
   --  1
   type SM1_SHIFTCTRL_Register is record
      --  Set the number of pins which are not masked to 0 when read by an IN
      --  PINS, WAIT PIN or MOV x, PINS instruction. For example, an IN_COUNT
      --  of 5 means that the 5 LSBs of the IN pin group are visible (bits
      --  4:0), but the remaining 27 MSBs are masked to 0. A count of 32 is
      --  encoded with a field value of 0, so the default behaviour is to not
      --  perform any masking. Note this masking is applied in addition to the
      --  masking usually performed by the IN instruction. This is mainly
      --  useful for the MOV x, PINS instruction, which otherwise has no way of
      --  masking pins.
      IN_COUNT      : SM1_SHIFTCTRL_IN_COUNT_Field := 16#0#;
      --  unspecified
      Reserved_5_13 : HAL.UInt9 := 16#0#;
      --  If 1, disable this state machine's RX FIFO, make its storage
      --  available for random read access by the state machine (using the
      --  `get` instruction) and, unless FJOIN_RX_PUT is also set, random write
      --  access by the processor (through the RXFx_PUTGETy registers). If
      --  FJOIN_RX_PUT and FJOIN_RX_GET are both set, then the RX FIFO's
      --  registers can be randomly read/written by the state machine, but are
      --  completely inaccessible to the processor. Setting this bit will clear
      --  the FJOIN_TX and FJOIN_RX bits.
      FJOIN_RX_GET  : Boolean := False;
      --  If 1, disable this state machine's RX FIFO, make its storage
      --  available for random write access by the state machine (using the
      --  `put` instruction) and, unless FJOIN_RX_GET is also set, random read
      --  access by the processor (through the RXFx_PUTGETy registers). If
      --  FJOIN_RX_PUT and FJOIN_RX_GET are both set, then the RX FIFO's
      --  registers can be randomly read/written by the state machine, but are
      --  completely inaccessible to the processor. Setting this bit will clear
      --  the FJOIN_TX and FJOIN_RX bits.
      FJOIN_RX_PUT  : Boolean := False;
      --  Push automatically when the input shift register is filled, i.e. on
      --  an IN instruction which causes the input shift counter to reach or
      --  exceed PUSH_THRESH.
      AUTOPUSH      : Boolean := False;
      --  Pull automatically when the output shift register is emptied, i.e. on
      --  or following an OUT instruction which causes the output shift counter
      --  to reach or exceed PULL_THRESH.
      AUTOPULL      : Boolean := False;
      --  1 = shift input shift register to right (data enters from left). 0 =
      --  to left.
      IN_SHIFTDIR   : Boolean := True;
      --  1 = shift out of output shift register to right. 0 = to left.
      OUT_SHIFTDIR  : Boolean := True;
      --  Number of bits shifted into ISR before autopush, or conditional push
      --  (PUSH IFFULL), will take place. Write 0 for value of 32.
      PUSH_THRESH   : SM1_SHIFTCTRL_PUSH_THRESH_Field := 16#0#;
      --  Number of bits shifted out of OSR before autopull, or conditional
      --  pull (PULL IFEMPTY), will take place. Write 0 for value of 32.
      PULL_THRESH   : SM1_SHIFTCTRL_PULL_THRESH_Field := 16#0#;
      --  When 1, TX FIFO steals the RX FIFO's storage, and becomes twice as
      --  deep. RX FIFO is disabled as a result (always reads as both full and
      --  empty). FIFOs are flushed when this bit is changed.
      FJOIN_TX      : Boolean := False;
      --  When 1, RX FIFO steals the TX FIFO's storage, and becomes twice as
      --  deep. TX FIFO is disabled as a result (always reads as both full and
      --  empty). FIFOs are flushed when this bit is changed.
      FJOIN_RX      : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SM1_SHIFTCTRL_Register use record
      IN_COUNT      at 0 range 0 .. 4;
      Reserved_5_13 at 0 range 5 .. 13;
      FJOIN_RX_GET  at 0 range 14 .. 14;
      FJOIN_RX_PUT  at 0 range 15 .. 15;
      AUTOPUSH      at 0 range 16 .. 16;
      AUTOPULL      at 0 range 17 .. 17;
      IN_SHIFTDIR   at 0 range 18 .. 18;
      OUT_SHIFTDIR  at 0 range 19 .. 19;
      PUSH_THRESH   at 0 range 20 .. 24;
      PULL_THRESH   at 0 range 25 .. 29;
      FJOIN_TX      at 0 range 30 .. 30;
      FJOIN_RX      at 0 range 31 .. 31;
   end record;

   subtype SM1_ADDR_SM1_ADDR_Field is HAL.UInt5;

   --  Current instruction address of state machine 1
   type SM1_ADDR_Register is record
      --  Read-only.
      SM1_ADDR      : SM1_ADDR_SM1_ADDR_Field;
      --  unspecified
      Reserved_5_31 : HAL.UInt27;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SM1_ADDR_Register use record
      SM1_ADDR      at 0 range 0 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype SM1_INSTR_SM1_INSTR_Field is HAL.UInt16;

   --  Read to see the instruction currently addressed by state machine 1's
   --  program counter Write to execute an instruction immediately (including
   --  jumps) and then resume execution.
   type SM1_INSTR_Register is record
      SM1_INSTR      : SM1_INSTR_SM1_INSTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SM1_INSTR_Register use record
      SM1_INSTR      at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype SM1_PINCTRL_OUT_BASE_Field is HAL.UInt5;
   subtype SM1_PINCTRL_SET_BASE_Field is HAL.UInt5;
   subtype SM1_PINCTRL_SIDESET_BASE_Field is HAL.UInt5;
   subtype SM1_PINCTRL_IN_BASE_Field is HAL.UInt5;
   subtype SM1_PINCTRL_OUT_COUNT_Field is HAL.UInt6;
   subtype SM1_PINCTRL_SET_COUNT_Field is HAL.UInt3;
   subtype SM1_PINCTRL_SIDESET_COUNT_Field is HAL.UInt3;

   --  State machine pin control
   type SM1_PINCTRL_Register is record
      --  The lowest-numbered pin that will be affected by an OUT PINS, OUT
      --  PINDIRS or MOV PINS instruction. The data written to this pin will
      --  always be the least-significant bit of the OUT or MOV data.
      OUT_BASE      : SM1_PINCTRL_OUT_BASE_Field := 16#0#;
      --  The lowest-numbered pin that will be affected by a SET PINS or SET
      --  PINDIRS instruction. The data written to this pin is the
      --  least-significant bit of the SET data.
      SET_BASE      : SM1_PINCTRL_SET_BASE_Field := 16#0#;
      --  The lowest-numbered pin that will be affected by a side-set
      --  operation. The MSBs of an instruction's side-set/delay field (up to
      --  5, determined by SIDESET_COUNT) are used for side-set data, with the
      --  remaining LSBs used for delay. The least-significant bit of the
      --  side-set portion is the bit written to this pin, with
      --  more-significant bits written to higher-numbered pins.
      SIDESET_BASE  : SM1_PINCTRL_SIDESET_BASE_Field := 16#0#;
      --  The pin which is mapped to the least-significant bit of a state
      --  machine's IN data bus. Higher-numbered pins are mapped to
      --  consecutively more-significant data bits, with a modulo of 32 applied
      --  to pin number.
      IN_BASE       : SM1_PINCTRL_IN_BASE_Field := 16#0#;
      --  The number of pins asserted by an OUT PINS, OUT PINDIRS or MOV PINS
      --  instruction. In the range 0 to 32 inclusive.
      OUT_COUNT     : SM1_PINCTRL_OUT_COUNT_Field := 16#0#;
      --  The number of pins asserted by a SET. In the range 0 to 5 inclusive.
      SET_COUNT     : SM1_PINCTRL_SET_COUNT_Field := 16#5#;
      --  The number of MSBs of the Delay/Side-set instruction field which are
      --  used for side-set. Inclusive of the enable bit, if present. Minimum
      --  of 0 (all delay bits, no side-set) and maximum of 5 (all side-set, no
      --  delay).
      SIDESET_COUNT : SM1_PINCTRL_SIDESET_COUNT_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SM1_PINCTRL_Register use record
      OUT_BASE      at 0 range 0 .. 4;
      SET_BASE      at 0 range 5 .. 9;
      SIDESET_BASE  at 0 range 10 .. 14;
      IN_BASE       at 0 range 15 .. 19;
      OUT_COUNT     at 0 range 20 .. 25;
      SET_COUNT     at 0 range 26 .. 28;
      SIDESET_COUNT at 0 range 29 .. 31;
   end record;

   subtype SM2_CLKDIV_FRAC_Field is HAL.UInt8;
   subtype SM2_CLKDIV_INT_Field is HAL.UInt16;

   --  Clock divisor register for state machine 2 Frequency = clock freq /
   --  (CLKDIV_INT + CLKDIV_FRAC / 256)
   type SM2_CLKDIV_Register is record
      --  unspecified
      Reserved_0_7 : HAL.UInt8 := 16#0#;
      --  Fractional part of clock divisor
      FRAC         : SM2_CLKDIV_FRAC_Field := 16#0#;
      --  Effective frequency is sysclk/(int + frac/256). Value of 0 is
      --  interpreted as 65536. If INT is 0, FRAC must also be 0.
      INT          : SM2_CLKDIV_INT_Field := 16#1#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SM2_CLKDIV_Register use record
      Reserved_0_7 at 0 range 0 .. 7;
      FRAC         at 0 range 8 .. 15;
      INT          at 0 range 16 .. 31;
   end record;

   --  Comparison level or IRQ index for the MOV x, STATUS instruction. If
   --  STATUS_SEL is TXLEVEL or RXLEVEL, then values of STATUS_N greater than
   --  the current FIFO depth are reserved, and have undefined behaviour.
   type SM2_EXECCTRL_STATUS_N_Field is
     (--  Index 0-7 of an IRQ flag in this PIO block
      IRQ,
      --  Index 0-7 of an IRQ flag in the next lower-numbered PIO block
      IRQ_PREVPIO,
      --  Index 0-7 of an IRQ flag in the next higher-numbered PIO block
      IRQ_NEXTPIO)
     with Size => 5;
   for SM2_EXECCTRL_STATUS_N_Field use
     (IRQ => 0,
      IRQ_PREVPIO => 8,
      IRQ_NEXTPIO => 16);

   --  Comparison used for the MOV x, STATUS instruction.
   type SM2_EXECCTRL_STATUS_SEL_Field is
     (--  All-ones if TX FIFO level < N, otherwise all-zeroes
      TXLEVEL,
      --  All-ones if RX FIFO level < N, otherwise all-zeroes
      RXLEVEL,
      --  All-ones if the indexed IRQ flag is raised, otherwise all-zeroes
      IRQ)
     with Size => 2;
   for SM2_EXECCTRL_STATUS_SEL_Field use
     (TXLEVEL => 0,
      RXLEVEL => 1,
      IRQ => 2);

   subtype SM2_EXECCTRL_WRAP_BOTTOM_Field is HAL.UInt5;
   subtype SM2_EXECCTRL_WRAP_TOP_Field is HAL.UInt5;
   subtype SM2_EXECCTRL_OUT_EN_SEL_Field is HAL.UInt5;
   subtype SM2_EXECCTRL_JMP_PIN_Field is HAL.UInt5;

   --  Execution/behavioural settings for state machine 2
   type SM2_EXECCTRL_Register is record
      --  Comparison level or IRQ index for the MOV x, STATUS instruction. If
      --  STATUS_SEL is TXLEVEL or RXLEVEL, then values of STATUS_N greater
      --  than the current FIFO depth are reserved, and have undefined
      --  behaviour.
      STATUS_N      : SM2_EXECCTRL_STATUS_N_Field := RP2350_SVD.PIO0.IRQ;
      --  Comparison used for the MOV x, STATUS instruction.
      STATUS_SEL    : SM2_EXECCTRL_STATUS_SEL_Field :=
                       RP2350_SVD.PIO0.TXLEVEL;
      --  After reaching wrap_top, execution is wrapped to this address.
      WRAP_BOTTOM   : SM2_EXECCTRL_WRAP_BOTTOM_Field := 16#0#;
      --  After reaching this address, execution is wrapped to wrap_bottom. If
      --  the instruction is a jump, and the jump condition is true, the jump
      --  takes priority.
      WRAP_TOP      : SM2_EXECCTRL_WRAP_TOP_Field := 16#1F#;
      --  Continuously assert the most recent OUT/SET to the pins
      OUT_STICKY    : Boolean := False;
      --  If 1, use a bit of OUT data as an auxiliary write enable When used in
      --  conjunction with OUT_STICKY, writes with an enable of 0 will deassert
      --  the latest pin write. This can create useful masking/override
      --  behaviour due to the priority ordering of state machine pin writes
      --  (SM0 < SM1 < ...)
      INLINE_OUT_EN : Boolean := False;
      --  Which data bit to use for inline OUT enable
      OUT_EN_SEL    : SM2_EXECCTRL_OUT_EN_SEL_Field := 16#0#;
      --  The GPIO number to use as condition for JMP PIN. Unaffected by input
      --  mapping.
      JMP_PIN       : SM2_EXECCTRL_JMP_PIN_Field := 16#0#;
      --  If 1, side-set data is asserted to pin directions, instead of pin
      --  values
      SIDE_PINDIR   : Boolean := False;
      --  If 1, the MSB of the Delay/Side-set instruction field is used as
      --  side-set enable, rather than a side-set data bit. This allows
      --  instructions to perform side-set optionally, rather than on every
      --  instruction, but the maximum possible side-set width is reduced from
      --  5 to 4. Note that the value of PINCTRL_SIDESET_COUNT is inclusive of
      --  this enable bit.
      SIDE_EN       : Boolean := False;
      --  Read-only. If 1, an instruction written to SMx_INSTR is stalled, and
      --  latched by the state machine. Will clear to 0 once this instruction
      --  completes.
      EXEC_STALLED  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SM2_EXECCTRL_Register use record
      STATUS_N      at 0 range 0 .. 4;
      STATUS_SEL    at 0 range 5 .. 6;
      WRAP_BOTTOM   at 0 range 7 .. 11;
      WRAP_TOP      at 0 range 12 .. 16;
      OUT_STICKY    at 0 range 17 .. 17;
      INLINE_OUT_EN at 0 range 18 .. 18;
      OUT_EN_SEL    at 0 range 19 .. 23;
      JMP_PIN       at 0 range 24 .. 28;
      SIDE_PINDIR   at 0 range 29 .. 29;
      SIDE_EN       at 0 range 30 .. 30;
      EXEC_STALLED  at 0 range 31 .. 31;
   end record;

   subtype SM2_SHIFTCTRL_IN_COUNT_Field is HAL.UInt5;
   subtype SM2_SHIFTCTRL_PUSH_THRESH_Field is HAL.UInt5;
   subtype SM2_SHIFTCTRL_PULL_THRESH_Field is HAL.UInt5;

   --  Control behaviour of the input/output shift registers for state machine
   --  2
   type SM2_SHIFTCTRL_Register is record
      --  Set the number of pins which are not masked to 0 when read by an IN
      --  PINS, WAIT PIN or MOV x, PINS instruction. For example, an IN_COUNT
      --  of 5 means that the 5 LSBs of the IN pin group are visible (bits
      --  4:0), but the remaining 27 MSBs are masked to 0. A count of 32 is
      --  encoded with a field value of 0, so the default behaviour is to not
      --  perform any masking. Note this masking is applied in addition to the
      --  masking usually performed by the IN instruction. This is mainly
      --  useful for the MOV x, PINS instruction, which otherwise has no way of
      --  masking pins.
      IN_COUNT      : SM2_SHIFTCTRL_IN_COUNT_Field := 16#0#;
      --  unspecified
      Reserved_5_13 : HAL.UInt9 := 16#0#;
      --  If 1, disable this state machine's RX FIFO, make its storage
      --  available for random read access by the state machine (using the
      --  `get` instruction) and, unless FJOIN_RX_PUT is also set, random write
      --  access by the processor (through the RXFx_PUTGETy registers). If
      --  FJOIN_RX_PUT and FJOIN_RX_GET are both set, then the RX FIFO's
      --  registers can be randomly read/written by the state machine, but are
      --  completely inaccessible to the processor. Setting this bit will clear
      --  the FJOIN_TX and FJOIN_RX bits.
      FJOIN_RX_GET  : Boolean := False;
      --  If 1, disable this state machine's RX FIFO, make its storage
      --  available for random write access by the state machine (using the
      --  `put` instruction) and, unless FJOIN_RX_GET is also set, random read
      --  access by the processor (through the RXFx_PUTGETy registers). If
      --  FJOIN_RX_PUT and FJOIN_RX_GET are both set, then the RX FIFO's
      --  registers can be randomly read/written by the state machine, but are
      --  completely inaccessible to the processor. Setting this bit will clear
      --  the FJOIN_TX and FJOIN_RX bits.
      FJOIN_RX_PUT  : Boolean := False;
      --  Push automatically when the input shift register is filled, i.e. on
      --  an IN instruction which causes the input shift counter to reach or
      --  exceed PUSH_THRESH.
      AUTOPUSH      : Boolean := False;
      --  Pull automatically when the output shift register is emptied, i.e. on
      --  or following an OUT instruction which causes the output shift counter
      --  to reach or exceed PULL_THRESH.
      AUTOPULL      : Boolean := False;
      --  1 = shift input shift register to right (data enters from left). 0 =
      --  to left.
      IN_SHIFTDIR   : Boolean := True;
      --  1 = shift out of output shift register to right. 0 = to left.
      OUT_SHIFTDIR  : Boolean := True;
      --  Number of bits shifted into ISR before autopush, or conditional push
      --  (PUSH IFFULL), will take place. Write 0 for value of 32.
      PUSH_THRESH   : SM2_SHIFTCTRL_PUSH_THRESH_Field := 16#0#;
      --  Number of bits shifted out of OSR before autopull, or conditional
      --  pull (PULL IFEMPTY), will take place. Write 0 for value of 32.
      PULL_THRESH   : SM2_SHIFTCTRL_PULL_THRESH_Field := 16#0#;
      --  When 1, TX FIFO steals the RX FIFO's storage, and becomes twice as
      --  deep. RX FIFO is disabled as a result (always reads as both full and
      --  empty). FIFOs are flushed when this bit is changed.
      FJOIN_TX      : Boolean := False;
      --  When 1, RX FIFO steals the TX FIFO's storage, and becomes twice as
      --  deep. TX FIFO is disabled as a result (always reads as both full and
      --  empty). FIFOs are flushed when this bit is changed.
      FJOIN_RX      : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SM2_SHIFTCTRL_Register use record
      IN_COUNT      at 0 range 0 .. 4;
      Reserved_5_13 at 0 range 5 .. 13;
      FJOIN_RX_GET  at 0 range 14 .. 14;
      FJOIN_RX_PUT  at 0 range 15 .. 15;
      AUTOPUSH      at 0 range 16 .. 16;
      AUTOPULL      at 0 range 17 .. 17;
      IN_SHIFTDIR   at 0 range 18 .. 18;
      OUT_SHIFTDIR  at 0 range 19 .. 19;
      PUSH_THRESH   at 0 range 20 .. 24;
      PULL_THRESH   at 0 range 25 .. 29;
      FJOIN_TX      at 0 range 30 .. 30;
      FJOIN_RX      at 0 range 31 .. 31;
   end record;

   subtype SM2_ADDR_SM2_ADDR_Field is HAL.UInt5;

   --  Current instruction address of state machine 2
   type SM2_ADDR_Register is record
      --  Read-only.
      SM2_ADDR      : SM2_ADDR_SM2_ADDR_Field;
      --  unspecified
      Reserved_5_31 : HAL.UInt27;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SM2_ADDR_Register use record
      SM2_ADDR      at 0 range 0 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype SM2_INSTR_SM2_INSTR_Field is HAL.UInt16;

   --  Read to see the instruction currently addressed by state machine 2's
   --  program counter Write to execute an instruction immediately (including
   --  jumps) and then resume execution.
   type SM2_INSTR_Register is record
      SM2_INSTR      : SM2_INSTR_SM2_INSTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SM2_INSTR_Register use record
      SM2_INSTR      at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype SM2_PINCTRL_OUT_BASE_Field is HAL.UInt5;
   subtype SM2_PINCTRL_SET_BASE_Field is HAL.UInt5;
   subtype SM2_PINCTRL_SIDESET_BASE_Field is HAL.UInt5;
   subtype SM2_PINCTRL_IN_BASE_Field is HAL.UInt5;
   subtype SM2_PINCTRL_OUT_COUNT_Field is HAL.UInt6;
   subtype SM2_PINCTRL_SET_COUNT_Field is HAL.UInt3;
   subtype SM2_PINCTRL_SIDESET_COUNT_Field is HAL.UInt3;

   --  State machine pin control
   type SM2_PINCTRL_Register is record
      --  The lowest-numbered pin that will be affected by an OUT PINS, OUT
      --  PINDIRS or MOV PINS instruction. The data written to this pin will
      --  always be the least-significant bit of the OUT or MOV data.
      OUT_BASE      : SM2_PINCTRL_OUT_BASE_Field := 16#0#;
      --  The lowest-numbered pin that will be affected by a SET PINS or SET
      --  PINDIRS instruction. The data written to this pin is the
      --  least-significant bit of the SET data.
      SET_BASE      : SM2_PINCTRL_SET_BASE_Field := 16#0#;
      --  The lowest-numbered pin that will be affected by a side-set
      --  operation. The MSBs of an instruction's side-set/delay field (up to
      --  5, determined by SIDESET_COUNT) are used for side-set data, with the
      --  remaining LSBs used for delay. The least-significant bit of the
      --  side-set portion is the bit written to this pin, with
      --  more-significant bits written to higher-numbered pins.
      SIDESET_BASE  : SM2_PINCTRL_SIDESET_BASE_Field := 16#0#;
      --  The pin which is mapped to the least-significant bit of a state
      --  machine's IN data bus. Higher-numbered pins are mapped to
      --  consecutively more-significant data bits, with a modulo of 32 applied
      --  to pin number.
      IN_BASE       : SM2_PINCTRL_IN_BASE_Field := 16#0#;
      --  The number of pins asserted by an OUT PINS, OUT PINDIRS or MOV PINS
      --  instruction. In the range 0 to 32 inclusive.
      OUT_COUNT     : SM2_PINCTRL_OUT_COUNT_Field := 16#0#;
      --  The number of pins asserted by a SET. In the range 0 to 5 inclusive.
      SET_COUNT     : SM2_PINCTRL_SET_COUNT_Field := 16#5#;
      --  The number of MSBs of the Delay/Side-set instruction field which are
      --  used for side-set. Inclusive of the enable bit, if present. Minimum
      --  of 0 (all delay bits, no side-set) and maximum of 5 (all side-set, no
      --  delay).
      SIDESET_COUNT : SM2_PINCTRL_SIDESET_COUNT_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SM2_PINCTRL_Register use record
      OUT_BASE      at 0 range 0 .. 4;
      SET_BASE      at 0 range 5 .. 9;
      SIDESET_BASE  at 0 range 10 .. 14;
      IN_BASE       at 0 range 15 .. 19;
      OUT_COUNT     at 0 range 20 .. 25;
      SET_COUNT     at 0 range 26 .. 28;
      SIDESET_COUNT at 0 range 29 .. 31;
   end record;

   subtype SM3_CLKDIV_FRAC_Field is HAL.UInt8;
   subtype SM3_CLKDIV_INT_Field is HAL.UInt16;

   --  Clock divisor register for state machine 3 Frequency = clock freq /
   --  (CLKDIV_INT + CLKDIV_FRAC / 256)
   type SM3_CLKDIV_Register is record
      --  unspecified
      Reserved_0_7 : HAL.UInt8 := 16#0#;
      --  Fractional part of clock divisor
      FRAC         : SM3_CLKDIV_FRAC_Field := 16#0#;
      --  Effective frequency is sysclk/(int + frac/256). Value of 0 is
      --  interpreted as 65536. If INT is 0, FRAC must also be 0.
      INT          : SM3_CLKDIV_INT_Field := 16#1#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SM3_CLKDIV_Register use record
      Reserved_0_7 at 0 range 0 .. 7;
      FRAC         at 0 range 8 .. 15;
      INT          at 0 range 16 .. 31;
   end record;

   --  Comparison level or IRQ index for the MOV x, STATUS instruction. If
   --  STATUS_SEL is TXLEVEL or RXLEVEL, then values of STATUS_N greater than
   --  the current FIFO depth are reserved, and have undefined behaviour.
   type SM3_EXECCTRL_STATUS_N_Field is
     (--  Index 0-7 of an IRQ flag in this PIO block
      IRQ,
      --  Index 0-7 of an IRQ flag in the next lower-numbered PIO block
      IRQ_PREVPIO,
      --  Index 0-7 of an IRQ flag in the next higher-numbered PIO block
      IRQ_NEXTPIO)
     with Size => 5;
   for SM3_EXECCTRL_STATUS_N_Field use
     (IRQ => 0,
      IRQ_PREVPIO => 8,
      IRQ_NEXTPIO => 16);

   --  Comparison used for the MOV x, STATUS instruction.
   type SM3_EXECCTRL_STATUS_SEL_Field is
     (--  All-ones if TX FIFO level < N, otherwise all-zeroes
      TXLEVEL,
      --  All-ones if RX FIFO level < N, otherwise all-zeroes
      RXLEVEL,
      --  All-ones if the indexed IRQ flag is raised, otherwise all-zeroes
      IRQ)
     with Size => 2;
   for SM3_EXECCTRL_STATUS_SEL_Field use
     (TXLEVEL => 0,
      RXLEVEL => 1,
      IRQ => 2);

   subtype SM3_EXECCTRL_WRAP_BOTTOM_Field is HAL.UInt5;
   subtype SM3_EXECCTRL_WRAP_TOP_Field is HAL.UInt5;
   subtype SM3_EXECCTRL_OUT_EN_SEL_Field is HAL.UInt5;
   subtype SM3_EXECCTRL_JMP_PIN_Field is HAL.UInt5;

   --  Execution/behavioural settings for state machine 3
   type SM3_EXECCTRL_Register is record
      --  Comparison level or IRQ index for the MOV x, STATUS instruction. If
      --  STATUS_SEL is TXLEVEL or RXLEVEL, then values of STATUS_N greater
      --  than the current FIFO depth are reserved, and have undefined
      --  behaviour.
      STATUS_N      : SM3_EXECCTRL_STATUS_N_Field := RP2350_SVD.PIO0.IRQ;
      --  Comparison used for the MOV x, STATUS instruction.
      STATUS_SEL    : SM3_EXECCTRL_STATUS_SEL_Field :=
                       RP2350_SVD.PIO0.TXLEVEL;
      --  After reaching wrap_top, execution is wrapped to this address.
      WRAP_BOTTOM   : SM3_EXECCTRL_WRAP_BOTTOM_Field := 16#0#;
      --  After reaching this address, execution is wrapped to wrap_bottom. If
      --  the instruction is a jump, and the jump condition is true, the jump
      --  takes priority.
      WRAP_TOP      : SM3_EXECCTRL_WRAP_TOP_Field := 16#1F#;
      --  Continuously assert the most recent OUT/SET to the pins
      OUT_STICKY    : Boolean := False;
      --  If 1, use a bit of OUT data as an auxiliary write enable When used in
      --  conjunction with OUT_STICKY, writes with an enable of 0 will deassert
      --  the latest pin write. This can create useful masking/override
      --  behaviour due to the priority ordering of state machine pin writes
      --  (SM0 < SM1 < ...)
      INLINE_OUT_EN : Boolean := False;
      --  Which data bit to use for inline OUT enable
      OUT_EN_SEL    : SM3_EXECCTRL_OUT_EN_SEL_Field := 16#0#;
      --  The GPIO number to use as condition for JMP PIN. Unaffected by input
      --  mapping.
      JMP_PIN       : SM3_EXECCTRL_JMP_PIN_Field := 16#0#;
      --  If 1, side-set data is asserted to pin directions, instead of pin
      --  values
      SIDE_PINDIR   : Boolean := False;
      --  If 1, the MSB of the Delay/Side-set instruction field is used as
      --  side-set enable, rather than a side-set data bit. This allows
      --  instructions to perform side-set optionally, rather than on every
      --  instruction, but the maximum possible side-set width is reduced from
      --  5 to 4. Note that the value of PINCTRL_SIDESET_COUNT is inclusive of
      --  this enable bit.
      SIDE_EN       : Boolean := False;
      --  Read-only. If 1, an instruction written to SMx_INSTR is stalled, and
      --  latched by the state machine. Will clear to 0 once this instruction
      --  completes.
      EXEC_STALLED  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SM3_EXECCTRL_Register use record
      STATUS_N      at 0 range 0 .. 4;
      STATUS_SEL    at 0 range 5 .. 6;
      WRAP_BOTTOM   at 0 range 7 .. 11;
      WRAP_TOP      at 0 range 12 .. 16;
      OUT_STICKY    at 0 range 17 .. 17;
      INLINE_OUT_EN at 0 range 18 .. 18;
      OUT_EN_SEL    at 0 range 19 .. 23;
      JMP_PIN       at 0 range 24 .. 28;
      SIDE_PINDIR   at 0 range 29 .. 29;
      SIDE_EN       at 0 range 30 .. 30;
      EXEC_STALLED  at 0 range 31 .. 31;
   end record;

   subtype SM3_SHIFTCTRL_IN_COUNT_Field is HAL.UInt5;
   subtype SM3_SHIFTCTRL_PUSH_THRESH_Field is HAL.UInt5;
   subtype SM3_SHIFTCTRL_PULL_THRESH_Field is HAL.UInt5;

   --  Control behaviour of the input/output shift registers for state machine
   --  3
   type SM3_SHIFTCTRL_Register is record
      --  Set the number of pins which are not masked to 0 when read by an IN
      --  PINS, WAIT PIN or MOV x, PINS instruction. For example, an IN_COUNT
      --  of 5 means that the 5 LSBs of the IN pin group are visible (bits
      --  4:0), but the remaining 27 MSBs are masked to 0. A count of 32 is
      --  encoded with a field value of 0, so the default behaviour is to not
      --  perform any masking. Note this masking is applied in addition to the
      --  masking usually performed by the IN instruction. This is mainly
      --  useful for the MOV x, PINS instruction, which otherwise has no way of
      --  masking pins.
      IN_COUNT      : SM3_SHIFTCTRL_IN_COUNT_Field := 16#0#;
      --  unspecified
      Reserved_5_13 : HAL.UInt9 := 16#0#;
      --  If 1, disable this state machine's RX FIFO, make its storage
      --  available for random read access by the state machine (using the
      --  `get` instruction) and, unless FJOIN_RX_PUT is also set, random write
      --  access by the processor (through the RXFx_PUTGETy registers). If
      --  FJOIN_RX_PUT and FJOIN_RX_GET are both set, then the RX FIFO's
      --  registers can be randomly read/written by the state machine, but are
      --  completely inaccessible to the processor. Setting this bit will clear
      --  the FJOIN_TX and FJOIN_RX bits.
      FJOIN_RX_GET  : Boolean := False;
      --  If 1, disable this state machine's RX FIFO, make its storage
      --  available for random write access by the state machine (using the
      --  `put` instruction) and, unless FJOIN_RX_GET is also set, random read
      --  access by the processor (through the RXFx_PUTGETy registers). If
      --  FJOIN_RX_PUT and FJOIN_RX_GET are both set, then the RX FIFO's
      --  registers can be randomly read/written by the state machine, but are
      --  completely inaccessible to the processor. Setting this bit will clear
      --  the FJOIN_TX and FJOIN_RX bits.
      FJOIN_RX_PUT  : Boolean := False;
      --  Push automatically when the input shift register is filled, i.e. on
      --  an IN instruction which causes the input shift counter to reach or
      --  exceed PUSH_THRESH.
      AUTOPUSH      : Boolean := False;
      --  Pull automatically when the output shift register is emptied, i.e. on
      --  or following an OUT instruction which causes the output shift counter
      --  to reach or exceed PULL_THRESH.
      AUTOPULL      : Boolean := False;
      --  1 = shift input shift register to right (data enters from left). 0 =
      --  to left.
      IN_SHIFTDIR   : Boolean := True;
      --  1 = shift out of output shift register to right. 0 = to left.
      OUT_SHIFTDIR  : Boolean := True;
      --  Number of bits shifted into ISR before autopush, or conditional push
      --  (PUSH IFFULL), will take place. Write 0 for value of 32.
      PUSH_THRESH   : SM3_SHIFTCTRL_PUSH_THRESH_Field := 16#0#;
      --  Number of bits shifted out of OSR before autopull, or conditional
      --  pull (PULL IFEMPTY), will take place. Write 0 for value of 32.
      PULL_THRESH   : SM3_SHIFTCTRL_PULL_THRESH_Field := 16#0#;
      --  When 1, TX FIFO steals the RX FIFO's storage, and becomes twice as
      --  deep. RX FIFO is disabled as a result (always reads as both full and
      --  empty). FIFOs are flushed when this bit is changed.
      FJOIN_TX      : Boolean := False;
      --  When 1, RX FIFO steals the TX FIFO's storage, and becomes twice as
      --  deep. TX FIFO is disabled as a result (always reads as both full and
      --  empty). FIFOs are flushed when this bit is changed.
      FJOIN_RX      : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SM3_SHIFTCTRL_Register use record
      IN_COUNT      at 0 range 0 .. 4;
      Reserved_5_13 at 0 range 5 .. 13;
      FJOIN_RX_GET  at 0 range 14 .. 14;
      FJOIN_RX_PUT  at 0 range 15 .. 15;
      AUTOPUSH      at 0 range 16 .. 16;
      AUTOPULL      at 0 range 17 .. 17;
      IN_SHIFTDIR   at 0 range 18 .. 18;
      OUT_SHIFTDIR  at 0 range 19 .. 19;
      PUSH_THRESH   at 0 range 20 .. 24;
      PULL_THRESH   at 0 range 25 .. 29;
      FJOIN_TX      at 0 range 30 .. 30;
      FJOIN_RX      at 0 range 31 .. 31;
   end record;

   subtype SM3_ADDR_SM3_ADDR_Field is HAL.UInt5;

   --  Current instruction address of state machine 3
   type SM3_ADDR_Register is record
      --  Read-only.
      SM3_ADDR      : SM3_ADDR_SM3_ADDR_Field;
      --  unspecified
      Reserved_5_31 : HAL.UInt27;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SM3_ADDR_Register use record
      SM3_ADDR      at 0 range 0 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype SM3_INSTR_SM3_INSTR_Field is HAL.UInt16;

   --  Read to see the instruction currently addressed by state machine 3's
   --  program counter Write to execute an instruction immediately (including
   --  jumps) and then resume execution.
   type SM3_INSTR_Register is record
      SM3_INSTR      : SM3_INSTR_SM3_INSTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SM3_INSTR_Register use record
      SM3_INSTR      at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype SM3_PINCTRL_OUT_BASE_Field is HAL.UInt5;
   subtype SM3_PINCTRL_SET_BASE_Field is HAL.UInt5;
   subtype SM3_PINCTRL_SIDESET_BASE_Field is HAL.UInt5;
   subtype SM3_PINCTRL_IN_BASE_Field is HAL.UInt5;
   subtype SM3_PINCTRL_OUT_COUNT_Field is HAL.UInt6;
   subtype SM3_PINCTRL_SET_COUNT_Field is HAL.UInt3;
   subtype SM3_PINCTRL_SIDESET_COUNT_Field is HAL.UInt3;

   --  State machine pin control
   type SM3_PINCTRL_Register is record
      --  The lowest-numbered pin that will be affected by an OUT PINS, OUT
      --  PINDIRS or MOV PINS instruction. The data written to this pin will
      --  always be the least-significant bit of the OUT or MOV data.
      OUT_BASE      : SM3_PINCTRL_OUT_BASE_Field := 16#0#;
      --  The lowest-numbered pin that will be affected by a SET PINS or SET
      --  PINDIRS instruction. The data written to this pin is the
      --  least-significant bit of the SET data.
      SET_BASE      : SM3_PINCTRL_SET_BASE_Field := 16#0#;
      --  The lowest-numbered pin that will be affected by a side-set
      --  operation. The MSBs of an instruction's side-set/delay field (up to
      --  5, determined by SIDESET_COUNT) are used for side-set data, with the
      --  remaining LSBs used for delay. The least-significant bit of the
      --  side-set portion is the bit written to this pin, with
      --  more-significant bits written to higher-numbered pins.
      SIDESET_BASE  : SM3_PINCTRL_SIDESET_BASE_Field := 16#0#;
      --  The pin which is mapped to the least-significant bit of a state
      --  machine's IN data bus. Higher-numbered pins are mapped to
      --  consecutively more-significant data bits, with a modulo of 32 applied
      --  to pin number.
      IN_BASE       : SM3_PINCTRL_IN_BASE_Field := 16#0#;
      --  The number of pins asserted by an OUT PINS, OUT PINDIRS or MOV PINS
      --  instruction. In the range 0 to 32 inclusive.
      OUT_COUNT     : SM3_PINCTRL_OUT_COUNT_Field := 16#0#;
      --  The number of pins asserted by a SET. In the range 0 to 5 inclusive.
      SET_COUNT     : SM3_PINCTRL_SET_COUNT_Field := 16#5#;
      --  The number of MSBs of the Delay/Side-set instruction field which are
      --  used for side-set. Inclusive of the enable bit, if present. Minimum
      --  of 0 (all delay bits, no side-set) and maximum of 5 (all side-set, no
      --  delay).
      SIDESET_COUNT : SM3_PINCTRL_SIDESET_COUNT_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SM3_PINCTRL_Register use record
      OUT_BASE      at 0 range 0 .. 4;
      SET_BASE      at 0 range 5 .. 9;
      SIDESET_BASE  at 0 range 10 .. 14;
      IN_BASE       at 0 range 15 .. 19;
      OUT_COUNT     at 0 range 20 .. 25;
      SET_COUNT     at 0 range 26 .. 28;
      SIDESET_COUNT at 0 range 29 .. 31;
   end record;

   --  Relocate GPIO 0 (from PIO's point of view) in the system GPIO numbering,
   --  to access more than 32 GPIOs from PIO. Only the values 0 and 16 are
   --  supported (only bit 4 is writable).
   type GPIOBASE_Register is record
      --  unspecified
      Reserved_0_3  : HAL.UInt4 := 16#0#;
      GPIOBASE      : Boolean := False;
      --  unspecified
      Reserved_5_31 : HAL.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIOBASE_Register use record
      Reserved_0_3  at 0 range 0 .. 3;
      GPIOBASE      at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   --  INTR_SM array
   type INTR_SM_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for INTR_SM
   type INTR_SM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SM as a value
            Val : HAL.UInt8;
         when True =>
            --  SM as an array
            Arr : INTR_SM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for INTR_SM_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  Raw Interrupts
   type INTR_Register is record
      --  Read-only.
      SM0_RXNEMPTY   : Boolean;
      --  Read-only.
      SM1_RXNEMPTY   : Boolean;
      --  Read-only.
      SM2_RXNEMPTY   : Boolean;
      --  Read-only.
      SM3_RXNEMPTY   : Boolean;
      --  Read-only.
      SM0_TXNFULL    : Boolean;
      --  Read-only.
      SM1_TXNFULL    : Boolean;
      --  Read-only.
      SM2_TXNFULL    : Boolean;
      --  Read-only.
      SM3_TXNFULL    : Boolean;
      --  Read-only.
      SM             : INTR_SM_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTR_Register use record
      SM0_RXNEMPTY   at 0 range 0 .. 0;
      SM1_RXNEMPTY   at 0 range 1 .. 1;
      SM2_RXNEMPTY   at 0 range 2 .. 2;
      SM3_RXNEMPTY   at 0 range 3 .. 3;
      SM0_TXNFULL    at 0 range 4 .. 4;
      SM1_TXNFULL    at 0 range 5 .. 5;
      SM2_TXNFULL    at 0 range 6 .. 6;
      SM3_TXNFULL    at 0 range 7 .. 7;
      SM             at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  IRQ0_INTE_SM array
   type IRQ0_INTE_SM_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for IRQ0_INTE_SM
   type IRQ0_INTE_SM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SM as a value
            Val : HAL.UInt8;
         when True =>
            --  SM as an array
            Arr : IRQ0_INTE_SM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for IRQ0_INTE_SM_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  Interrupt Enable for irq0
   type IRQ0_INTE_Register is record
      SM0_RXNEMPTY   : Boolean := False;
      SM1_RXNEMPTY   : Boolean := False;
      SM2_RXNEMPTY   : Boolean := False;
      SM3_RXNEMPTY   : Boolean := False;
      SM0_TXNFULL    : Boolean := False;
      SM1_TXNFULL    : Boolean := False;
      SM2_TXNFULL    : Boolean := False;
      SM3_TXNFULL    : Boolean := False;
      SM             : IRQ0_INTE_SM_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRQ0_INTE_Register use record
      SM0_RXNEMPTY   at 0 range 0 .. 0;
      SM1_RXNEMPTY   at 0 range 1 .. 1;
      SM2_RXNEMPTY   at 0 range 2 .. 2;
      SM3_RXNEMPTY   at 0 range 3 .. 3;
      SM0_TXNFULL    at 0 range 4 .. 4;
      SM1_TXNFULL    at 0 range 5 .. 5;
      SM2_TXNFULL    at 0 range 6 .. 6;
      SM3_TXNFULL    at 0 range 7 .. 7;
      SM             at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  IRQ0_INTF_SM array
   type IRQ0_INTF_SM_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for IRQ0_INTF_SM
   type IRQ0_INTF_SM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SM as a value
            Val : HAL.UInt8;
         when True =>
            --  SM as an array
            Arr : IRQ0_INTF_SM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for IRQ0_INTF_SM_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  Interrupt Force for irq0
   type IRQ0_INTF_Register is record
      SM0_RXNEMPTY   : Boolean := False;
      SM1_RXNEMPTY   : Boolean := False;
      SM2_RXNEMPTY   : Boolean := False;
      SM3_RXNEMPTY   : Boolean := False;
      SM0_TXNFULL    : Boolean := False;
      SM1_TXNFULL    : Boolean := False;
      SM2_TXNFULL    : Boolean := False;
      SM3_TXNFULL    : Boolean := False;
      SM             : IRQ0_INTF_SM_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRQ0_INTF_Register use record
      SM0_RXNEMPTY   at 0 range 0 .. 0;
      SM1_RXNEMPTY   at 0 range 1 .. 1;
      SM2_RXNEMPTY   at 0 range 2 .. 2;
      SM3_RXNEMPTY   at 0 range 3 .. 3;
      SM0_TXNFULL    at 0 range 4 .. 4;
      SM1_TXNFULL    at 0 range 5 .. 5;
      SM2_TXNFULL    at 0 range 6 .. 6;
      SM3_TXNFULL    at 0 range 7 .. 7;
      SM             at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  IRQ0_INTS_SM array
   type IRQ0_INTS_SM_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for IRQ0_INTS_SM
   type IRQ0_INTS_SM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SM as a value
            Val : HAL.UInt8;
         when True =>
            --  SM as an array
            Arr : IRQ0_INTS_SM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for IRQ0_INTS_SM_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  Interrupt status after masking & forcing for irq0
   type IRQ0_INTS_Register is record
      --  Read-only.
      SM0_RXNEMPTY   : Boolean;
      --  Read-only.
      SM1_RXNEMPTY   : Boolean;
      --  Read-only.
      SM2_RXNEMPTY   : Boolean;
      --  Read-only.
      SM3_RXNEMPTY   : Boolean;
      --  Read-only.
      SM0_TXNFULL    : Boolean;
      --  Read-only.
      SM1_TXNFULL    : Boolean;
      --  Read-only.
      SM2_TXNFULL    : Boolean;
      --  Read-only.
      SM3_TXNFULL    : Boolean;
      --  Read-only.
      SM             : IRQ0_INTS_SM_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRQ0_INTS_Register use record
      SM0_RXNEMPTY   at 0 range 0 .. 0;
      SM1_RXNEMPTY   at 0 range 1 .. 1;
      SM2_RXNEMPTY   at 0 range 2 .. 2;
      SM3_RXNEMPTY   at 0 range 3 .. 3;
      SM0_TXNFULL    at 0 range 4 .. 4;
      SM1_TXNFULL    at 0 range 5 .. 5;
      SM2_TXNFULL    at 0 range 6 .. 6;
      SM3_TXNFULL    at 0 range 7 .. 7;
      SM             at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  IRQ1_INTE_SM array
   type IRQ1_INTE_SM_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for IRQ1_INTE_SM
   type IRQ1_INTE_SM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SM as a value
            Val : HAL.UInt8;
         when True =>
            --  SM as an array
            Arr : IRQ1_INTE_SM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for IRQ1_INTE_SM_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  Interrupt Enable for irq1
   type IRQ1_INTE_Register is record
      SM0_RXNEMPTY   : Boolean := False;
      SM1_RXNEMPTY   : Boolean := False;
      SM2_RXNEMPTY   : Boolean := False;
      SM3_RXNEMPTY   : Boolean := False;
      SM0_TXNFULL    : Boolean := False;
      SM1_TXNFULL    : Boolean := False;
      SM2_TXNFULL    : Boolean := False;
      SM3_TXNFULL    : Boolean := False;
      SM             : IRQ1_INTE_SM_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRQ1_INTE_Register use record
      SM0_RXNEMPTY   at 0 range 0 .. 0;
      SM1_RXNEMPTY   at 0 range 1 .. 1;
      SM2_RXNEMPTY   at 0 range 2 .. 2;
      SM3_RXNEMPTY   at 0 range 3 .. 3;
      SM0_TXNFULL    at 0 range 4 .. 4;
      SM1_TXNFULL    at 0 range 5 .. 5;
      SM2_TXNFULL    at 0 range 6 .. 6;
      SM3_TXNFULL    at 0 range 7 .. 7;
      SM             at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  IRQ1_INTF_SM array
   type IRQ1_INTF_SM_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for IRQ1_INTF_SM
   type IRQ1_INTF_SM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SM as a value
            Val : HAL.UInt8;
         when True =>
            --  SM as an array
            Arr : IRQ1_INTF_SM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for IRQ1_INTF_SM_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  Interrupt Force for irq1
   type IRQ1_INTF_Register is record
      SM0_RXNEMPTY   : Boolean := False;
      SM1_RXNEMPTY   : Boolean := False;
      SM2_RXNEMPTY   : Boolean := False;
      SM3_RXNEMPTY   : Boolean := False;
      SM0_TXNFULL    : Boolean := False;
      SM1_TXNFULL    : Boolean := False;
      SM2_TXNFULL    : Boolean := False;
      SM3_TXNFULL    : Boolean := False;
      SM             : IRQ1_INTF_SM_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRQ1_INTF_Register use record
      SM0_RXNEMPTY   at 0 range 0 .. 0;
      SM1_RXNEMPTY   at 0 range 1 .. 1;
      SM2_RXNEMPTY   at 0 range 2 .. 2;
      SM3_RXNEMPTY   at 0 range 3 .. 3;
      SM0_TXNFULL    at 0 range 4 .. 4;
      SM1_TXNFULL    at 0 range 5 .. 5;
      SM2_TXNFULL    at 0 range 6 .. 6;
      SM3_TXNFULL    at 0 range 7 .. 7;
      SM             at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  IRQ1_INTS_SM array
   type IRQ1_INTS_SM_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for IRQ1_INTS_SM
   type IRQ1_INTS_SM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SM as a value
            Val : HAL.UInt8;
         when True =>
            --  SM as an array
            Arr : IRQ1_INTS_SM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for IRQ1_INTS_SM_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  Interrupt status after masking & forcing for irq1
   type IRQ1_INTS_Register is record
      --  Read-only.
      SM0_RXNEMPTY   : Boolean;
      --  Read-only.
      SM1_RXNEMPTY   : Boolean;
      --  Read-only.
      SM2_RXNEMPTY   : Boolean;
      --  Read-only.
      SM3_RXNEMPTY   : Boolean;
      --  Read-only.
      SM0_TXNFULL    : Boolean;
      --  Read-only.
      SM1_TXNFULL    : Boolean;
      --  Read-only.
      SM2_TXNFULL    : Boolean;
      --  Read-only.
      SM3_TXNFULL    : Boolean;
      --  Read-only.
      SM             : IRQ1_INTS_SM_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRQ1_INTS_Register use record
      SM0_RXNEMPTY   at 0 range 0 .. 0;
      SM1_RXNEMPTY   at 0 range 1 .. 1;
      SM2_RXNEMPTY   at 0 range 2 .. 2;
      SM3_RXNEMPTY   at 0 range 3 .. 3;
      SM0_TXNFULL    at 0 range 4 .. 4;
      SM1_TXNFULL    at 0 range 5 .. 5;
      SM2_TXNFULL    at 0 range 6 .. 6;
      SM3_TXNFULL    at 0 range 7 .. 7;
      SM             at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Programmable IO block
   type PIO0_Peripheral is record
      --  PIO control register
      CTRL              : aliased CTRL_Register;
      --  FIFO status register
      FSTAT             : aliased FSTAT_Register;
      --  FIFO debug register
      FDEBUG            : aliased FDEBUG_Register;
      --  FIFO levels
      FLEVEL            : aliased FLEVEL_Register;
      --  Direct write access to the TX FIFO for this state machine. Each write
      --  pushes one word to the FIFO. Attempting to write to a full FIFO has
      --  no effect on the FIFO state or contents, and sets the sticky
      --  FDEBUG_TXOVER error flag for this FIFO.
      TXF0              : aliased HAL.UInt32;
      --  Direct write access to the TX FIFO for this state machine. Each write
      --  pushes one word to the FIFO. Attempting to write to a full FIFO has
      --  no effect on the FIFO state or contents, and sets the sticky
      --  FDEBUG_TXOVER error flag for this FIFO.
      TXF1              : aliased HAL.UInt32;
      --  Direct write access to the TX FIFO for this state machine. Each write
      --  pushes one word to the FIFO. Attempting to write to a full FIFO has
      --  no effect on the FIFO state or contents, and sets the sticky
      --  FDEBUG_TXOVER error flag for this FIFO.
      TXF2              : aliased HAL.UInt32;
      --  Direct write access to the TX FIFO for this state machine. Each write
      --  pushes one word to the FIFO. Attempting to write to a full FIFO has
      --  no effect on the FIFO state or contents, and sets the sticky
      --  FDEBUG_TXOVER error flag for this FIFO.
      TXF3              : aliased HAL.UInt32;
      --  Direct read access to the RX FIFO for this state machine. Each read
      --  pops one word from the FIFO. Attempting to read from an empty FIFO
      --  has no effect on the FIFO state, and sets the sticky FDEBUG_RXUNDER
      --  error flag for this FIFO. The data returned to the system on a read
      --  from an empty FIFO is undefined.
      RXF0              : aliased HAL.UInt32;
      --  Direct read access to the RX FIFO for this state machine. Each read
      --  pops one word from the FIFO. Attempting to read from an empty FIFO
      --  has no effect on the FIFO state, and sets the sticky FDEBUG_RXUNDER
      --  error flag for this FIFO. The data returned to the system on a read
      --  from an empty FIFO is undefined.
      RXF1              : aliased HAL.UInt32;
      --  Direct read access to the RX FIFO for this state machine. Each read
      --  pops one word from the FIFO. Attempting to read from an empty FIFO
      --  has no effect on the FIFO state, and sets the sticky FDEBUG_RXUNDER
      --  error flag for this FIFO. The data returned to the system on a read
      --  from an empty FIFO is undefined.
      RXF2              : aliased HAL.UInt32;
      --  Direct read access to the RX FIFO for this state machine. Each read
      --  pops one word from the FIFO. Attempting to read from an empty FIFO
      --  has no effect on the FIFO state, and sets the sticky FDEBUG_RXUNDER
      --  error flag for this FIFO. The data returned to the system on a read
      --  from an empty FIFO is undefined.
      RXF3              : aliased HAL.UInt32;
      --  State machine IRQ flags register. Write 1 to clear. There are eight
      --  state machine IRQ flags, which can be set, cleared, and waited on by
      --  the state machines. There's no fixed association between flags and
      --  state machines -- any state machine can use any flag. Any of the
      --  eight flags can be used for timing synchronisation between state
      --  machines, using IRQ and WAIT instructions. Any combination of the
      --  eight flags can also routed out to either of the two system-level
      --  interrupt requests, alongside FIFO status interrupts -- see e.g.
      --  IRQ0_INTE.
      IRQ               : aliased IRQ_Register;
      --  Writing a 1 to each of these bits will forcibly assert the
      --  corresponding IRQ. Note this is different to the INTF register:
      --  writing here affects PIO internal state. INTF just asserts the
      --  processor-facing IRQ signal for testing ISRs, and is not visible to
      --  the state machines.
      IRQ_FORCE         : aliased IRQ_FORCE_Register;
      --  There is a 2-flipflop synchronizer on each GPIO input, which protects
      --  PIO logic from metastabilities. This increases input delay, and for
      --  fast synchronous IO (e.g. SPI) these synchronizers may need to be
      --  bypassed. Each bit in this register corresponds to one GPIO. 0 ->
      --  input is synchronized (default) 1 -> synchronizer is bypassed If in
      --  doubt, leave this register as all zeroes.
      INPUT_SYNC_BYPASS : aliased HAL.UInt32;
      --  Read to sample the pad output values PIO is currently driving to the
      --  GPIOs. On RP2040 there are 30 GPIOs, so the two most significant bits
      --  are hardwired to 0.
      DBG_PADOUT        : aliased HAL.UInt32;
      --  Read to sample the pad output enables (direction) PIO is currently
      --  driving to the GPIOs. On RP2040 there are 30 GPIOs, so the two most
      --  significant bits are hardwired to 0.
      DBG_PADOE         : aliased HAL.UInt32;
      --  The PIO hardware has some free parameters that may vary between chip
      --  products. These should be provided in the chip datasheet, but are
      --  also exposed here.
      DBG_CFGINFO       : aliased DBG_CFGINFO_Register;
      --  Write-only access to instruction memory location 0
      INSTR_MEM0        : aliased INSTR_MEM0_Register;
      --  Write-only access to instruction memory location 1
      INSTR_MEM1        : aliased INSTR_MEM1_Register;
      --  Write-only access to instruction memory location 2
      INSTR_MEM2        : aliased INSTR_MEM2_Register;
      --  Write-only access to instruction memory location 3
      INSTR_MEM3        : aliased INSTR_MEM3_Register;
      --  Write-only access to instruction memory location 4
      INSTR_MEM4        : aliased INSTR_MEM4_Register;
      --  Write-only access to instruction memory location 5
      INSTR_MEM5        : aliased INSTR_MEM5_Register;
      --  Write-only access to instruction memory location 6
      INSTR_MEM6        : aliased INSTR_MEM6_Register;
      --  Write-only access to instruction memory location 7
      INSTR_MEM7        : aliased INSTR_MEM7_Register;
      --  Write-only access to instruction memory location 8
      INSTR_MEM8        : aliased INSTR_MEM8_Register;
      --  Write-only access to instruction memory location 9
      INSTR_MEM9        : aliased INSTR_MEM9_Register;
      --  Write-only access to instruction memory location 10
      INSTR_MEM10       : aliased INSTR_MEM10_Register;
      --  Write-only access to instruction memory location 11
      INSTR_MEM11       : aliased INSTR_MEM11_Register;
      --  Write-only access to instruction memory location 12
      INSTR_MEM12       : aliased INSTR_MEM12_Register;
      --  Write-only access to instruction memory location 13
      INSTR_MEM13       : aliased INSTR_MEM13_Register;
      --  Write-only access to instruction memory location 14
      INSTR_MEM14       : aliased INSTR_MEM14_Register;
      --  Write-only access to instruction memory location 15
      INSTR_MEM15       : aliased INSTR_MEM15_Register;
      --  Write-only access to instruction memory location 16
      INSTR_MEM16       : aliased INSTR_MEM16_Register;
      --  Write-only access to instruction memory location 17
      INSTR_MEM17       : aliased INSTR_MEM17_Register;
      --  Write-only access to instruction memory location 18
      INSTR_MEM18       : aliased INSTR_MEM18_Register;
      --  Write-only access to instruction memory location 19
      INSTR_MEM19       : aliased INSTR_MEM19_Register;
      --  Write-only access to instruction memory location 20
      INSTR_MEM20       : aliased INSTR_MEM20_Register;
      --  Write-only access to instruction memory location 21
      INSTR_MEM21       : aliased INSTR_MEM21_Register;
      --  Write-only access to instruction memory location 22
      INSTR_MEM22       : aliased INSTR_MEM22_Register;
      --  Write-only access to instruction memory location 23
      INSTR_MEM23       : aliased INSTR_MEM23_Register;
      --  Write-only access to instruction memory location 24
      INSTR_MEM24       : aliased INSTR_MEM24_Register;
      --  Write-only access to instruction memory location 25
      INSTR_MEM25       : aliased INSTR_MEM25_Register;
      --  Write-only access to instruction memory location 26
      INSTR_MEM26       : aliased INSTR_MEM26_Register;
      --  Write-only access to instruction memory location 27
      INSTR_MEM27       : aliased INSTR_MEM27_Register;
      --  Write-only access to instruction memory location 28
      INSTR_MEM28       : aliased INSTR_MEM28_Register;
      --  Write-only access to instruction memory location 29
      INSTR_MEM29       : aliased INSTR_MEM29_Register;
      --  Write-only access to instruction memory location 30
      INSTR_MEM30       : aliased INSTR_MEM30_Register;
      --  Write-only access to instruction memory location 31
      INSTR_MEM31       : aliased INSTR_MEM31_Register;
      --  Clock divisor register for state machine 0 Frequency = clock freq /
      --  (CLKDIV_INT + CLKDIV_FRAC / 256)
      SM0_CLKDIV        : aliased SM0_CLKDIV_Register;
      --  Execution/behavioural settings for state machine 0
      SM0_EXECCTRL      : aliased SM0_EXECCTRL_Register;
      --  Control behaviour of the input/output shift registers for state
      --  machine 0
      SM0_SHIFTCTRL     : aliased SM0_SHIFTCTRL_Register;
      --  Current instruction address of state machine 0
      SM0_ADDR          : aliased SM0_ADDR_Register;
      --  Read to see the instruction currently addressed by state machine 0's
      --  program counter Write to execute an instruction immediately
      --  (including jumps) and then resume execution.
      SM0_INSTR         : aliased SM0_INSTR_Register;
      --  State machine pin control
      SM0_PINCTRL       : aliased SM0_PINCTRL_Register;
      --  Clock divisor register for state machine 1 Frequency = clock freq /
      --  (CLKDIV_INT + CLKDIV_FRAC / 256)
      SM1_CLKDIV        : aliased SM1_CLKDIV_Register;
      --  Execution/behavioural settings for state machine 1
      SM1_EXECCTRL      : aliased SM1_EXECCTRL_Register;
      --  Control behaviour of the input/output shift registers for state
      --  machine 1
      SM1_SHIFTCTRL     : aliased SM1_SHIFTCTRL_Register;
      --  Current instruction address of state machine 1
      SM1_ADDR          : aliased SM1_ADDR_Register;
      --  Read to see the instruction currently addressed by state machine 1's
      --  program counter Write to execute an instruction immediately
      --  (including jumps) and then resume execution.
      SM1_INSTR         : aliased SM1_INSTR_Register;
      --  State machine pin control
      SM1_PINCTRL       : aliased SM1_PINCTRL_Register;
      --  Clock divisor register for state machine 2 Frequency = clock freq /
      --  (CLKDIV_INT + CLKDIV_FRAC / 256)
      SM2_CLKDIV        : aliased SM2_CLKDIV_Register;
      --  Execution/behavioural settings for state machine 2
      SM2_EXECCTRL      : aliased SM2_EXECCTRL_Register;
      --  Control behaviour of the input/output shift registers for state
      --  machine 2
      SM2_SHIFTCTRL     : aliased SM2_SHIFTCTRL_Register;
      --  Current instruction address of state machine 2
      SM2_ADDR          : aliased SM2_ADDR_Register;
      --  Read to see the instruction currently addressed by state machine 2's
      --  program counter Write to execute an instruction immediately
      --  (including jumps) and then resume execution.
      SM2_INSTR         : aliased SM2_INSTR_Register;
      --  State machine pin control
      SM2_PINCTRL       : aliased SM2_PINCTRL_Register;
      --  Clock divisor register for state machine 3 Frequency = clock freq /
      --  (CLKDIV_INT + CLKDIV_FRAC / 256)
      SM3_CLKDIV        : aliased SM3_CLKDIV_Register;
      --  Execution/behavioural settings for state machine 3
      SM3_EXECCTRL      : aliased SM3_EXECCTRL_Register;
      --  Control behaviour of the input/output shift registers for state
      --  machine 3
      SM3_SHIFTCTRL     : aliased SM3_SHIFTCTRL_Register;
      --  Current instruction address of state machine 3
      SM3_ADDR          : aliased SM3_ADDR_Register;
      --  Read to see the instruction currently addressed by state machine 3's
      --  program counter Write to execute an instruction immediately
      --  (including jumps) and then resume execution.
      SM3_INSTR         : aliased SM3_INSTR_Register;
      --  State machine pin control
      SM3_PINCTRL       : aliased SM3_PINCTRL_Register;
      --  Direct read/write access to entry 0 of SM0's RX FIFO, if
      --  SHIFTCTRL_FJOIN_RX_PUT xor SHIFTCTRL_FJOIN_RX_GET is set.
      RXF0_PUTGET0      : aliased HAL.UInt32;
      --  Direct read/write access to entry 1 of SM0's RX FIFO, if
      --  SHIFTCTRL_FJOIN_RX_PUT xor SHIFTCTRL_FJOIN_RX_GET is set.
      RXF0_PUTGET1      : aliased HAL.UInt32;
      --  Direct read/write access to entry 2 of SM0's RX FIFO, if
      --  SHIFTCTRL_FJOIN_RX_PUT xor SHIFTCTRL_FJOIN_RX_GET is set.
      RXF0_PUTGET2      : aliased HAL.UInt32;
      --  Direct read/write access to entry 3 of SM0's RX FIFO, if
      --  SHIFTCTRL_FJOIN_RX_PUT xor SHIFTCTRL_FJOIN_RX_GET is set.
      RXF0_PUTGET3      : aliased HAL.UInt32;
      --  Direct read/write access to entry 0 of SM1's RX FIFO, if
      --  SHIFTCTRL_FJOIN_RX_PUT xor SHIFTCTRL_FJOIN_RX_GET is set.
      RXF1_PUTGET0      : aliased HAL.UInt32;
      --  Direct read/write access to entry 1 of SM1's RX FIFO, if
      --  SHIFTCTRL_FJOIN_RX_PUT xor SHIFTCTRL_FJOIN_RX_GET is set.
      RXF1_PUTGET1      : aliased HAL.UInt32;
      --  Direct read/write access to entry 2 of SM1's RX FIFO, if
      --  SHIFTCTRL_FJOIN_RX_PUT xor SHIFTCTRL_FJOIN_RX_GET is set.
      RXF1_PUTGET2      : aliased HAL.UInt32;
      --  Direct read/write access to entry 3 of SM1's RX FIFO, if
      --  SHIFTCTRL_FJOIN_RX_PUT xor SHIFTCTRL_FJOIN_RX_GET is set.
      RXF1_PUTGET3      : aliased HAL.UInt32;
      --  Direct read/write access to entry 0 of SM2's RX FIFO, if
      --  SHIFTCTRL_FJOIN_RX_PUT xor SHIFTCTRL_FJOIN_RX_GET is set.
      RXF2_PUTGET0      : aliased HAL.UInt32;
      --  Direct read/write access to entry 1 of SM2's RX FIFO, if
      --  SHIFTCTRL_FJOIN_RX_PUT xor SHIFTCTRL_FJOIN_RX_GET is set.
      RXF2_PUTGET1      : aliased HAL.UInt32;
      --  Direct read/write access to entry 2 of SM2's RX FIFO, if
      --  SHIFTCTRL_FJOIN_RX_PUT xor SHIFTCTRL_FJOIN_RX_GET is set.
      RXF2_PUTGET2      : aliased HAL.UInt32;
      --  Direct read/write access to entry 3 of SM2's RX FIFO, if
      --  SHIFTCTRL_FJOIN_RX_PUT xor SHIFTCTRL_FJOIN_RX_GET is set.
      RXF2_PUTGET3      : aliased HAL.UInt32;
      --  Direct read/write access to entry 0 of SM3's RX FIFO, if
      --  SHIFTCTRL_FJOIN_RX_PUT xor SHIFTCTRL_FJOIN_RX_GET is set.
      RXF3_PUTGET0      : aliased HAL.UInt32;
      --  Direct read/write access to entry 1 of SM3's RX FIFO, if
      --  SHIFTCTRL_FJOIN_RX_PUT xor SHIFTCTRL_FJOIN_RX_GET is set.
      RXF3_PUTGET1      : aliased HAL.UInt32;
      --  Direct read/write access to entry 2 of SM3's RX FIFO, if
      --  SHIFTCTRL_FJOIN_RX_PUT xor SHIFTCTRL_FJOIN_RX_GET is set.
      RXF3_PUTGET2      : aliased HAL.UInt32;
      --  Direct read/write access to entry 3 of SM3's RX FIFO, if
      --  SHIFTCTRL_FJOIN_RX_PUT xor SHIFTCTRL_FJOIN_RX_GET is set.
      RXF3_PUTGET3      : aliased HAL.UInt32;
      --  Relocate GPIO 0 (from PIO's point of view) in the system GPIO
      --  numbering, to access more than 32 GPIOs from PIO. Only the values 0
      --  and 16 are supported (only bit 4 is writable).
      GPIOBASE          : aliased GPIOBASE_Register;
      --  Raw Interrupts
      INTR              : aliased INTR_Register;
      --  Interrupt Enable for irq0
      IRQ0_INTE         : aliased IRQ0_INTE_Register;
      --  Interrupt Force for irq0
      IRQ0_INTF         : aliased IRQ0_INTF_Register;
      --  Interrupt status after masking & forcing for irq0
      IRQ0_INTS         : aliased IRQ0_INTS_Register;
      --  Interrupt Enable for irq1
      IRQ1_INTE         : aliased IRQ1_INTE_Register;
      --  Interrupt Force for irq1
      IRQ1_INTF         : aliased IRQ1_INTF_Register;
      --  Interrupt status after masking & forcing for irq1
      IRQ1_INTS         : aliased IRQ1_INTS_Register;
   end record
     with Volatile;

   for PIO0_Peripheral use record
      CTRL              at 16#0# range 0 .. 31;
      FSTAT             at 16#4# range 0 .. 31;
      FDEBUG            at 16#8# range 0 .. 31;
      FLEVEL            at 16#C# range 0 .. 31;
      TXF0              at 16#10# range 0 .. 31;
      TXF1              at 16#14# range 0 .. 31;
      TXF2              at 16#18# range 0 .. 31;
      TXF3              at 16#1C# range 0 .. 31;
      RXF0              at 16#20# range 0 .. 31;
      RXF1              at 16#24# range 0 .. 31;
      RXF2              at 16#28# range 0 .. 31;
      RXF3              at 16#2C# range 0 .. 31;
      IRQ               at 16#30# range 0 .. 31;
      IRQ_FORCE         at 16#34# range 0 .. 31;
      INPUT_SYNC_BYPASS at 16#38# range 0 .. 31;
      DBG_PADOUT        at 16#3C# range 0 .. 31;
      DBG_PADOE         at 16#40# range 0 .. 31;
      DBG_CFGINFO       at 16#44# range 0 .. 31;
      INSTR_MEM0        at 16#48# range 0 .. 31;
      INSTR_MEM1        at 16#4C# range 0 .. 31;
      INSTR_MEM2        at 16#50# range 0 .. 31;
      INSTR_MEM3        at 16#54# range 0 .. 31;
      INSTR_MEM4        at 16#58# range 0 .. 31;
      INSTR_MEM5        at 16#5C# range 0 .. 31;
      INSTR_MEM6        at 16#60# range 0 .. 31;
      INSTR_MEM7        at 16#64# range 0 .. 31;
      INSTR_MEM8        at 16#68# range 0 .. 31;
      INSTR_MEM9        at 16#6C# range 0 .. 31;
      INSTR_MEM10       at 16#70# range 0 .. 31;
      INSTR_MEM11       at 16#74# range 0 .. 31;
      INSTR_MEM12       at 16#78# range 0 .. 31;
      INSTR_MEM13       at 16#7C# range 0 .. 31;
      INSTR_MEM14       at 16#80# range 0 .. 31;
      INSTR_MEM15       at 16#84# range 0 .. 31;
      INSTR_MEM16       at 16#88# range 0 .. 31;
      INSTR_MEM17       at 16#8C# range 0 .. 31;
      INSTR_MEM18       at 16#90# range 0 .. 31;
      INSTR_MEM19       at 16#94# range 0 .. 31;
      INSTR_MEM20       at 16#98# range 0 .. 31;
      INSTR_MEM21       at 16#9C# range 0 .. 31;
      INSTR_MEM22       at 16#A0# range 0 .. 31;
      INSTR_MEM23       at 16#A4# range 0 .. 31;
      INSTR_MEM24       at 16#A8# range 0 .. 31;
      INSTR_MEM25       at 16#AC# range 0 .. 31;
      INSTR_MEM26       at 16#B0# range 0 .. 31;
      INSTR_MEM27       at 16#B4# range 0 .. 31;
      INSTR_MEM28       at 16#B8# range 0 .. 31;
      INSTR_MEM29       at 16#BC# range 0 .. 31;
      INSTR_MEM30       at 16#C0# range 0 .. 31;
      INSTR_MEM31       at 16#C4# range 0 .. 31;
      SM0_CLKDIV        at 16#C8# range 0 .. 31;
      SM0_EXECCTRL      at 16#CC# range 0 .. 31;
      SM0_SHIFTCTRL     at 16#D0# range 0 .. 31;
      SM0_ADDR          at 16#D4# range 0 .. 31;
      SM0_INSTR         at 16#D8# range 0 .. 31;
      SM0_PINCTRL       at 16#DC# range 0 .. 31;
      SM1_CLKDIV        at 16#E0# range 0 .. 31;
      SM1_EXECCTRL      at 16#E4# range 0 .. 31;
      SM1_SHIFTCTRL     at 16#E8# range 0 .. 31;
      SM1_ADDR          at 16#EC# range 0 .. 31;
      SM1_INSTR         at 16#F0# range 0 .. 31;
      SM1_PINCTRL       at 16#F4# range 0 .. 31;
      SM2_CLKDIV        at 16#F8# range 0 .. 31;
      SM2_EXECCTRL      at 16#FC# range 0 .. 31;
      SM2_SHIFTCTRL     at 16#100# range 0 .. 31;
      SM2_ADDR          at 16#104# range 0 .. 31;
      SM2_INSTR         at 16#108# range 0 .. 31;
      SM2_PINCTRL       at 16#10C# range 0 .. 31;
      SM3_CLKDIV        at 16#110# range 0 .. 31;
      SM3_EXECCTRL      at 16#114# range 0 .. 31;
      SM3_SHIFTCTRL     at 16#118# range 0 .. 31;
      SM3_ADDR          at 16#11C# range 0 .. 31;
      SM3_INSTR         at 16#120# range 0 .. 31;
      SM3_PINCTRL       at 16#124# range 0 .. 31;
      RXF0_PUTGET0      at 16#128# range 0 .. 31;
      RXF0_PUTGET1      at 16#12C# range 0 .. 31;
      RXF0_PUTGET2      at 16#130# range 0 .. 31;
      RXF0_PUTGET3      at 16#134# range 0 .. 31;
      RXF1_PUTGET0      at 16#138# range 0 .. 31;
      RXF1_PUTGET1      at 16#13C# range 0 .. 31;
      RXF1_PUTGET2      at 16#140# range 0 .. 31;
      RXF1_PUTGET3      at 16#144# range 0 .. 31;
      RXF2_PUTGET0      at 16#148# range 0 .. 31;
      RXF2_PUTGET1      at 16#14C# range 0 .. 31;
      RXF2_PUTGET2      at 16#150# range 0 .. 31;
      RXF2_PUTGET3      at 16#154# range 0 .. 31;
      RXF3_PUTGET0      at 16#158# range 0 .. 31;
      RXF3_PUTGET1      at 16#15C# range 0 .. 31;
      RXF3_PUTGET2      at 16#160# range 0 .. 31;
      RXF3_PUTGET3      at 16#164# range 0 .. 31;
      GPIOBASE          at 16#168# range 0 .. 31;
      INTR              at 16#16C# range 0 .. 31;
      IRQ0_INTE         at 16#170# range 0 .. 31;
      IRQ0_INTF         at 16#174# range 0 .. 31;
      IRQ0_INTS         at 16#178# range 0 .. 31;
      IRQ1_INTE         at 16#17C# range 0 .. 31;
      IRQ1_INTF         at 16#180# range 0 .. 31;
      IRQ1_INTS         at 16#184# range 0 .. 31;
   end record;

   --  Programmable IO block
   PIO0_Periph : aliased PIO0_Peripheral
     with Import, Address => PIO0_Base;

end RP2350_SVD.PIO0;
