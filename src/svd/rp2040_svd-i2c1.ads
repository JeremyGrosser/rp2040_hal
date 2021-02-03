pragma Style_Checks (Off);

--  Copyright (c) 2020 Raspberry Pi (Trading) Ltd.
--
--  SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2040.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

--  DW_apb_i2c address block
package RP2040_SVD.I2C1 is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  This bit controls whether the DW_apb_i2c master is enabled.\n\n NOTE:
   --  Software should ensure that if this bit is written with '1' then bit 6
   --  should also be written with a '1'.
   type IC_CON_MASTER_MODE_Field is
     (--  Master mode is disabled
      DISABLED,
      --  Master mode is enabled
      ENABLED)
     with Size => 1;
   for IC_CON_MASTER_MODE_Field use
     (DISABLED => 0,
      ENABLED => 1);

   --  These bits control at which speed the DW_apb_i2c operates; its setting
   --  is relevant only if one is operating the DW_apb_i2c in master mode.
   --  Hardware protects against illegal values being programmed by software.
   --  These bits must be programmed appropriately for slave mode also, as it
   --  is used to capture correct value of spike filter as per the speed
   --  mode.\n\n This register should be programmed only with a value in the
   --  range of 1 to IC_MAX_SPEED_MODE; otherwise, hardware updates this
   --  register with the value of IC_MAX_SPEED_MODE.\n\n 1: standard mode (100
   --  kbit/s)\n\n 2: fast mode (<=400 kbit/s) or fast mode plus
   --  (<=1000Kbit/s)\n\n 3: high speed mode (3.4 Mbit/s)\n\n Note: This field
   --  is not applicable when IC_ULTRA_FAST_MODE=1
   type IC_CON_SPEED_Field is
     (--  Standard Speed mode of operation
      STANDARD,
      --  Fast or Fast Plus mode of operation
      FAST,
      --  High Speed mode of operation
      HIGH)
     with Size => 2;
   for IC_CON_SPEED_Field use
     (STANDARD => 1,
      FAST => 2,
      HIGH => 3);

   --  When acting as a slave, this bit controls whether the DW_apb_i2c
   --  responds to 7- or 10-bit addresses. - 0: 7-bit addressing. The
   --  DW_apb_i2c ignores transactions that involve 10-bit addressing; for
   --  7-bit addressing, only the lower 7 bits of the IC_SAR register are
   --  compared. - 1: 10-bit addressing. The DW_apb_i2c responds to only 10-bit
   --  addressing transfers that match the full 10 bits of the IC_SAR register.
   type IC_CON_IC_10BITADDR_SLAVE_Field is
     (--  Slave 7Bit addressing
      ADDR_7BITS,
      --  Slave 10Bit addressing
      ADDR_10BITS)
     with Size => 1;
   for IC_CON_IC_10BITADDR_SLAVE_Field use
     (ADDR_7BITS => 0,
      ADDR_10BITS => 1);

   --  Controls whether the DW_apb_i2c starts its transfers in 7- or 10-bit
   --  addressing mode when acting as a master. - 0: 7-bit addressing - 1:
   --  10-bit addressing
   type IC_CON_IC_10BITADDR_MASTER_Field is
     (--  Master 7Bit addressing mode
      ADDR_7BITS,
      --  Master 10Bit addressing mode
      ADDR_10BITS)
     with Size => 1;
   for IC_CON_IC_10BITADDR_MASTER_Field use
     (ADDR_7BITS => 0,
      ADDR_10BITS => 1);

   --  Determines whether RESTART conditions may be sent when acting as a
   --  master. Some older slaves do not support handling RESTART conditions;
   --  however, RESTART conditions are used in several DW_apb_i2c operations.
   --  When RESTART is disabled, the master is prohibited from performing the
   --  following functions: - Sending a START BYTE - Performing any high-speed
   --  mode operation - High-speed mode operation - Performing direction
   --  changes in combined format mode - Performing a read operation with a
   --  10-bit address By replacing RESTART condition followed by a STOP and a
   --  subsequent START condition, split operations are broken down into
   --  multiple DW_apb_i2c transfers. If the above operations are performed, it
   --  will result in setting bit 6 (TX_ABRT) of the IC_RAW_INTR_STAT
   --  register.\n\n Reset value: ENABLED
   type IC_CON_IC_RESTART_EN_Field is
     (--  Master restart disabled
      DISABLED,
      --  Master restart enabled
      ENABLED)
     with Size => 1;
   for IC_CON_IC_RESTART_EN_Field use
     (DISABLED => 0,
      ENABLED => 1);

   --  This bit controls whether I2C has its slave disabled, which means once
   --  the presetn signal is applied, then this bit is set and the slave is
   --  disabled.\n\n If this bit is set (slave is disabled), DW_apb_i2c
   --  functions only as a master and does not perform any action that requires
   --  a slave.\n\n NOTE: Software should ensure that if this bit is written
   --  with 0, then bit 0 should also be written with a 0.
   type IC_CON_IC_SLAVE_DISABLE_Field is
     (--  Slave mode is enabled
      SLAVE_ENABLED,
      --  Slave mode is disabled
      SLAVE_DISABLED)
     with Size => 1;
   for IC_CON_IC_SLAVE_DISABLE_Field use
     (SLAVE_ENABLED => 0,
      SLAVE_DISABLED => 1);

   --  In slave mode: - 1'b1: issues the STOP_DET interrupt only when it is
   --  addressed. - 1'b0: issues the STOP_DET irrespective of whether it's
   --  addressed or not. Reset value: 0x0\n\n NOTE: During a general call
   --  address, this slave does not issue the STOP_DET interrupt if
   --  STOP_DET_IF_ADDRESSED = 1'b1, even if the slave responds to the general
   --  call address by generating ACK. The STOP_DET interrupt is generated only
   --  when the transmitted address matches the slave address (SAR).
   type IC_CON_STOP_DET_IFADDRESSED_Field is
     (--  slave issues STOP_DET intr always
      DISABLED,
      --  slave issues STOP_DET intr only if addressed
      ENABLED)
     with Size => 1;
   for IC_CON_STOP_DET_IFADDRESSED_Field use
     (DISABLED => 0,
      ENABLED => 1);

   --  This bit controls the generation of the TX_EMPTY interrupt, as described
   --  in the IC_RAW_INTR_STAT register.\n\n Reset value: 0x0.
   type IC_CON_TX_EMPTY_CTRL_Field is
     (--  Default behaviour of TX_EMPTY interrupt
      DISABLED,
      --  Controlled generation of TX_EMPTY interrupt
      ENABLED)
     with Size => 1;
   for IC_CON_TX_EMPTY_CTRL_Field use
     (DISABLED => 0,
      ENABLED => 1);

   --  This bit controls whether DW_apb_i2c should hold the bus when the Rx
   --  FIFO is physically full to its RX_BUFFER_DEPTH, as described in the
   --  IC_RX_FULL_HLD_BUS_EN parameter.\n\n Reset value: 0x0.
   type IC_CON_RX_FIFO_FULL_HLD_CTRL_Field is
     (--  Overflow when RX_FIFO is full
      DISABLED,
      --  Hold bus when RX_FIFO is full
      ENABLED)
     with Size => 1;
   for IC_CON_RX_FIFO_FULL_HLD_CTRL_Field use
     (DISABLED => 0,
      ENABLED => 1);

   --  I2C Control Register. This register can be written only when the
   --  DW_apb_i2c is disabled, which corresponds to the IC_ENABLE[0] register
   --  being set to 0. Writes at other times have no effect.\n\n Read/Write
   --  Access: - bit 10 is read only. - bit 11 is read only - bit 16 is read
   --  only - bit 17 is read only - bits 18 and 19 are read only.
   type IC_CON_Register is record
      --  This bit controls whether the DW_apb_i2c master is enabled.\n\n NOTE:
      --  Software should ensure that if this bit is written with '1' then bit
      --  6 should also be written with a '1'.
      MASTER_MODE               : IC_CON_MASTER_MODE_Field :=
                                   RP2040_SVD.I2C1.ENABLED;
      --  These bits control at which speed the DW_apb_i2c operates; its
      --  setting is relevant only if one is operating the DW_apb_i2c in master
      --  mode. Hardware protects against illegal values being programmed by
      --  software. These bits must be programmed appropriately for slave mode
      --  also, as it is used to capture correct value of spike filter as per
      --  the speed mode.\n\n This register should be programmed only with a
      --  value in the range of 1 to IC_MAX_SPEED_MODE; otherwise, hardware
      --  updates this register with the value of IC_MAX_SPEED_MODE.\n\n 1:
      --  standard mode (100 kbit/s)\n\n 2: fast mode (<=400 kbit/s) or fast
      --  mode plus (<=1000Kbit/s)\n\n 3: high speed mode (3.4 Mbit/s)\n\n
      --  Note: This field is not applicable when IC_ULTRA_FAST_MODE=1
      SPEED                     : IC_CON_SPEED_Field := RP2040_SVD.I2C1.FAST;
      --  When acting as a slave, this bit controls whether the DW_apb_i2c
      --  responds to 7- or 10-bit addresses. - 0: 7-bit addressing. The
      --  DW_apb_i2c ignores transactions that involve 10-bit addressing; for
      --  7-bit addressing, only the lower 7 bits of the IC_SAR register are
      --  compared. - 1: 10-bit addressing. The DW_apb_i2c responds to only
      --  10-bit addressing transfers that match the full 10 bits of the IC_SAR
      --  register.
      IC_10BITADDR_SLAVE        : IC_CON_IC_10BITADDR_SLAVE_Field :=
                                   RP2040_SVD.I2C1.ADDR_7BITS;
      --  Controls whether the DW_apb_i2c starts its transfers in 7- or 10-bit
      --  addressing mode when acting as a master. - 0: 7-bit addressing - 1:
      --  10-bit addressing
      IC_10BITADDR_MASTER       : IC_CON_IC_10BITADDR_MASTER_Field :=
                                   RP2040_SVD.I2C1.ADDR_7BITS;
      --  Determines whether RESTART conditions may be sent when acting as a
      --  master. Some older slaves do not support handling RESTART conditions;
      --  however, RESTART conditions are used in several DW_apb_i2c
      --  operations. When RESTART is disabled, the master is prohibited from
      --  performing the following functions: - Sending a START BYTE -
      --  Performing any high-speed mode operation - High-speed mode operation
      --  - Performing direction changes in combined format mode - Performing a
      --  read operation with a 10-bit address By replacing RESTART condition
      --  followed by a STOP and a subsequent START condition, split operations
      --  are broken down into multiple DW_apb_i2c transfers. If the above
      --  operations are performed, it will result in setting bit 6 (TX_ABRT)
      --  of the IC_RAW_INTR_STAT register.\n\n Reset value: ENABLED
      IC_RESTART_EN             : IC_CON_IC_RESTART_EN_Field :=
                                   RP2040_SVD.I2C1.ENABLED;
      --  This bit controls whether I2C has its slave disabled, which means
      --  once the presetn signal is applied, then this bit is set and the
      --  slave is disabled.\n\n If this bit is set (slave is disabled),
      --  DW_apb_i2c functions only as a master and does not perform any action
      --  that requires a slave.\n\n NOTE: Software should ensure that if this
      --  bit is written with 0, then bit 0 should also be written with a 0.
      IC_SLAVE_DISABLE          : IC_CON_IC_SLAVE_DISABLE_Field :=
                                   RP2040_SVD.I2C1.SLAVE_DISABLED;
      --  In slave mode: - 1'b1: issues the STOP_DET interrupt only when it is
      --  addressed. - 1'b0: issues the STOP_DET irrespective of whether it's
      --  addressed or not. Reset value: 0x0\n\n NOTE: During a general call
      --  address, this slave does not issue the STOP_DET interrupt if
      --  STOP_DET_IF_ADDRESSED = 1'b1, even if the slave responds to the
      --  general call address by generating ACK. The STOP_DET interrupt is
      --  generated only when the transmitted address matches the slave address
      --  (SAR).
      STOP_DET_IFADDRESSED      : IC_CON_STOP_DET_IFADDRESSED_Field :=
                                   RP2040_SVD.I2C1.DISABLED;
      --  This bit controls the generation of the TX_EMPTY interrupt, as
      --  described in the IC_RAW_INTR_STAT register.\n\n Reset value: 0x0.
      TX_EMPTY_CTRL             : IC_CON_TX_EMPTY_CTRL_Field :=
                                   RP2040_SVD.I2C1.DISABLED;
      --  This bit controls whether DW_apb_i2c should hold the bus when the Rx
      --  FIFO is physically full to its RX_BUFFER_DEPTH, as described in the
      --  IC_RX_FULL_HLD_BUS_EN parameter.\n\n Reset value: 0x0.
      RX_FIFO_FULL_HLD_CTRL     : IC_CON_RX_FIFO_FULL_HLD_CTRL_Field :=
                                   RP2040_SVD.I2C1.DISABLED;
      --  Read-only. Master issues the STOP_DET interrupt irrespective of
      --  whether master is active or not
      STOP_DET_IF_MASTER_ACTIVE : Boolean := False;
      --  unspecified
      Reserved_11_31            : HAL.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_CON_Register use record
      MASTER_MODE               at 0 range 0 .. 0;
      SPEED                     at 0 range 1 .. 2;
      IC_10BITADDR_SLAVE        at 0 range 3 .. 3;
      IC_10BITADDR_MASTER       at 0 range 4 .. 4;
      IC_RESTART_EN             at 0 range 5 .. 5;
      IC_SLAVE_DISABLE          at 0 range 6 .. 6;
      STOP_DET_IFADDRESSED      at 0 range 7 .. 7;
      TX_EMPTY_CTRL             at 0 range 8 .. 8;
      RX_FIFO_FULL_HLD_CTRL     at 0 range 9 .. 9;
      STOP_DET_IF_MASTER_ACTIVE at 0 range 10 .. 10;
      Reserved_11_31            at 0 range 11 .. 31;
   end record;

   subtype IC_TAR_IC_TAR_Field is HAL.UInt10;

   --  If bit 11 (SPECIAL) is set to 1 and bit 13(Device-ID) is set to 0, then
   --  this bit indicates whether a General Call or START byte command is to be
   --  performed by the DW_apb_i2c. - 0: General Call Address - after issuing a
   --  General Call, only writes may be performed. Attempting to issue a read
   --  command results in setting bit 6 (TX_ABRT) of the IC_RAW_INTR_STAT
   --  register. The DW_apb_i2c remains in General Call mode until the SPECIAL
   --  bit value (bit 11) is cleared. - 1: START BYTE Reset value: 0x0
   type IC_TAR_GC_OR_START_Field is
     (--  GENERAL_CALL byte transmission
      GENERAL_CALL,
      --  START byte transmission
      START_BYTE)
     with Size => 1;
   for IC_TAR_GC_OR_START_Field use
     (GENERAL_CALL => 0,
      START_BYTE => 1);

   --  This bit indicates whether software performs a Device-ID or General Call
   --  or START BYTE command. - 0: ignore bit 10 GC_OR_START and use IC_TAR
   --  normally - 1: perform special I2C command as specified in Device_ID or
   --  GC_OR_START bit Reset value: 0x0
   type IC_TAR_SPECIAL_Field is
     (--  Disables programming of GENERAL_CALL or START_BYTE transmission
      DISABLED,
      --  Enables programming of GENERAL_CALL or START_BYTE transmission
      ENABLED)
     with Size => 1;
   for IC_TAR_SPECIAL_Field use
     (DISABLED => 0,
      ENABLED => 1);

   --  I2C Target Address Register\n\n This register is 12 bits wide, and bits
   --  31:12 are reserved. This register can be written to only when
   --  IC_ENABLE[0] is set to 0.\n\n Note: If the software or application is
   --  aware that the DW_apb_i2c is not using the TAR address for the pending
   --  commands in the Tx FIFO, then it is possible to update the TAR address
   --  even while the Tx FIFO has entries (IC_STATUS[2]= 0). - It is not
   --  necessary to perform any write to this register if DW_apb_i2c is enabled
   --  as an I2C slave only.
   type IC_TAR_Register is record
      --  This is the target address for any master transaction. When
      --  transmitting a General Call, these bits are ignored. To generate a
      --  START BYTE, the CPU needs to write only once into these bits.\n\n If
      --  the IC_TAR and IC_SAR are the same, loopback exists but the FIFOs are
      --  shared between master and slave, so full loopback is not feasible.
      --  Only one direction loopback mode is supported (simplex), not duplex.
      --  A master cannot transmit to itself; it can transmit to only a slave.
      IC_TAR         : IC_TAR_IC_TAR_Field := 16#55#;
      --  If bit 11 (SPECIAL) is set to 1 and bit 13(Device-ID) is set to 0,
      --  then this bit indicates whether a General Call or START byte command
      --  is to be performed by the DW_apb_i2c. - 0: General Call Address -
      --  after issuing a General Call, only writes may be performed.
      --  Attempting to issue a read command results in setting bit 6 (TX_ABRT)
      --  of the IC_RAW_INTR_STAT register. The DW_apb_i2c remains in General
      --  Call mode until the SPECIAL bit value (bit 11) is cleared. - 1: START
      --  BYTE Reset value: 0x0
      GC_OR_START    : IC_TAR_GC_OR_START_Field :=
                        RP2040_SVD.I2C1.GENERAL_CALL;
      --  This bit indicates whether software performs a Device-ID or General
      --  Call or START BYTE command. - 0: ignore bit 10 GC_OR_START and use
      --  IC_TAR normally - 1: perform special I2C command as specified in
      --  Device_ID or GC_OR_START bit Reset value: 0x0
      SPECIAL        : IC_TAR_SPECIAL_Field := RP2040_SVD.I2C1.DISABLED;
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_TAR_Register use record
      IC_TAR         at 0 range 0 .. 9;
      GC_OR_START    at 0 range 10 .. 10;
      SPECIAL        at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype IC_SAR_IC_SAR_Field is HAL.UInt10;

   --  I2C Slave Address Register
   type IC_SAR_Register is record
      --  The IC_SAR holds the slave address when the I2C is operating as a
      --  slave. For 7-bit addressing, only IC_SAR[6:0] is used.\n\n This
      --  register can be written only when the I2C interface is disabled,
      --  which corresponds to the IC_ENABLE[0] register being set to 0. Writes
      --  at other times have no effect.\n\n Note: The default values cannot be
      --  any of the reserved address locations: that is, 0x00 to 0x07, or 0x78
      --  to 0x7f. The correct operation of the device is not guaranteed if you
      --  program the IC_SAR or IC_TAR to a reserved value. Refer to
      --  <<table_I2C_firstbyte_bit_defs>> for a complete list of these
      --  reserved values.
      IC_SAR         : IC_SAR_IC_SAR_Field := 16#55#;
      --  unspecified
      Reserved_10_31 : HAL.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_SAR_Register use record
      IC_SAR         at 0 range 0 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype IC_DATA_CMD_DAT_Field is HAL.UInt8;

   --  This bit controls whether a read or a write is performed. This bit does
   --  not control the direction when the DW_apb_i2con acts as a slave. It
   --  controls only the direction when it acts as a master.\n\n When a command
   --  is entered in the TX FIFO, this bit distinguishes the write and read
   --  commands. In slave-receiver mode, this bit is a 'don't care' because
   --  writes to this register are not required. In slave-transmitter mode, a
   --  '0' indicates that the data in IC_DATA_CMD is to be transmitted.\n\n
   --  When programming this bit, you should remember the following: attempting
   --  to perform a read operation after a General Call command has been sent
   --  results in a TX_ABRT interrupt (bit 6 of the IC_RAW_INTR_STAT register),
   --  unless bit 11 (SPECIAL) in the IC_TAR register has been cleared. If a
   --  '1' is written to this bit after receiving a RD_REQ interrupt, then a
   --  TX_ABRT interrupt occurs.\n\n Reset value: 0x0
   type IC_DATA_CMD_CMD_Field is
     (--  Master Write Command
      WRITE,
      --  Master Read Command
      READ)
     with Size => 1;
   for IC_DATA_CMD_CMD_Field use
     (WRITE => 0,
      READ => 1);

   --  This bit controls whether a STOP is issued after the byte is sent or
   --  received.\n\n - 1 - STOP is issued after this byte, regardless of
   --  whether or not the Tx FIFO is empty. If the Tx FIFO is not empty, the
   --  master immediately tries to start a new transfer by issuing a START and
   --  arbitrating for the bus. - 0 - STOP is not issued after this byte,
   --  regardless of whether or not the Tx FIFO is empty. If the Tx FIFO is not
   --  empty, the master continues the current transfer by sending/receiving
   --  data bytes according to the value of the CMD bit. If the Tx FIFO is
   --  empty, the master holds the SCL line low and stalls the bus until a new
   --  command is available in the Tx FIFO. Reset value: 0x0
   type IC_DATA_CMD_STOP_Field is
     (--  Don't Issue STOP after this command
      DISABLE,
      --  Issue STOP after this command
      ENABLE)
     with Size => 1;
   for IC_DATA_CMD_STOP_Field use
     (DISABLE => 0,
      ENABLE => 1);

   --  This bit controls whether a RESTART is issued before the byte is sent or
   --  received.\n\n 1 - If IC_RESTART_EN is 1, a RESTART is issued before the
   --  data is sent/received (according to the value of CMD), regardless of
   --  whether or not the transfer direction is changing from the previous
   --  command; if IC_RESTART_EN is 0, a STOP followed by a START is issued
   --  instead.\n\n 0 - If IC_RESTART_EN is 1, a RESTART is issued only if the
   --  transfer direction is changing from the previous command; if
   --  IC_RESTART_EN is 0, a STOP followed by a START is issued instead.\n\n
   --  Reset value: 0x0
   type IC_DATA_CMD_RESTART_Field is
     (--  Don't Issue RESTART before this command
      DISABLE,
      --  Issue RESTART before this command
      ENABLE)
     with Size => 1;
   for IC_DATA_CMD_RESTART_Field use
     (DISABLE => 0,
      ENABLE => 1);

   --  Indicates the first data byte received after the address phase for
   --  receive transfer in Master receiver or Slave receiver mode.\n\n Reset
   --  value : 0x0\n\n NOTE: In case of APB_DATA_WIDTH=8,\n\n 1. The user has
   --  to perform two APB Reads to IC_DATA_CMD in order to get status on 11
   --  bit.\n\n 2. In order to read the 11 bit, the user has to perform the
   --  first data byte read [7:0] (offset 0x10) and then perform the second
   --  read [15:8] (offset 0x11) in order to know the status of 11 bit (whether
   --  the data received in previous read is a first data byte or not).\n\n 3.
   --  The 11th bit is an optional read field, user can ignore 2nd byte read
   --  [15:8] (offset 0x11) if not interested in FIRST_DATA_BYTE status.
   type IC_DATA_CMD_FIRST_DATA_BYTE_Field is
     (--  Sequential data byte received
      INACTIVE,
      --  Non sequential data byte received
      ACTIVE)
     with Size => 1;
   for IC_DATA_CMD_FIRST_DATA_BYTE_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  I2C Rx/Tx Data Buffer and Command Register; this is the register the CPU
   --  writes to when filling the TX FIFO and the CPU reads from when
   --  retrieving bytes from RX FIFO.\n\n The size of the register changes as
   --  follows:\n\n Write: - 11 bits when IC_EMPTYFIFO_HOLD_MASTER_EN=1 - 9
   --  bits when IC_EMPTYFIFO_HOLD_MASTER_EN=0 Read: - 12 bits when
   --  IC_FIRST_DATA_BYTE_STATUS = 1 - 8 bits when IC_FIRST_DATA_BYTE_STATUS =
   --  0 Note: In order for the DW_apb_i2c to continue acknowledging reads, a
   --  read command should be written for every byte that is to be received;
   --  otherwise the DW_apb_i2c will stop acknowledging.
   type IC_DATA_CMD_Register is record
      --  This register contains the data to be transmitted or received on the
      --  I2C bus. If you are writing to this register and want to perform a
      --  read, bits 7:0 (DAT) are ignored by the DW_apb_i2c. However, when you
      --  read this register, these bits return the value of data received on
      --  the DW_apb_i2c interface.\n\n Reset value: 0x0
      DAT             : IC_DATA_CMD_DAT_Field := 16#0#;
      --  After a write operation all bits in the field are cleared (set to
      --  zero). This bit controls whether a read or a write is performed. This
      --  bit does not control the direction when the DW_apb_i2con acts as a
      --  slave. It controls only the direction when it acts as a master.\n\n
      --  When a command is entered in the TX FIFO, this bit distinguishes the
      --  write and read commands. In slave-receiver mode, this bit is a 'don't
      --  care' because writes to this register are not required. In
      --  slave-transmitter mode, a '0' indicates that the data in IC_DATA_CMD
      --  is to be transmitted.\n\n When programming this bit, you should
      --  remember the following: attempting to perform a read operation after
      --  a General Call command has been sent results in a TX_ABRT interrupt
      --  (bit 6 of the IC_RAW_INTR_STAT register), unless bit 11 (SPECIAL) in
      --  the IC_TAR register has been cleared. If a '1' is written to this bit
      --  after receiving a RD_REQ interrupt, then a TX_ABRT interrupt
      --  occurs.\n\n Reset value: 0x0
      CMD             : IC_DATA_CMD_CMD_Field := RP2040_SVD.I2C1.WRITE;
      --  After a write operation all bits in the field are cleared (set to
      --  zero). This bit controls whether a STOP is issued after the byte is
      --  sent or received.\n\n - 1 - STOP is issued after this byte,
      --  regardless of whether or not the Tx FIFO is empty. If the Tx FIFO is
      --  not empty, the master immediately tries to start a new transfer by
      --  issuing a START and arbitrating for the bus. - 0 - STOP is not issued
      --  after this byte, regardless of whether or not the Tx FIFO is empty.
      --  If the Tx FIFO is not empty, the master continues the current
      --  transfer by sending/receiving data bytes according to the value of
      --  the CMD bit. If the Tx FIFO is empty, the master holds the SCL line
      --  low and stalls the bus until a new command is available in the Tx
      --  FIFO. Reset value: 0x0
      STOP            : IC_DATA_CMD_STOP_Field := RP2040_SVD.I2C1.DISABLE;
      --  After a write operation all bits in the field are cleared (set to
      --  zero). This bit controls whether a RESTART is issued before the byte
      --  is sent or received.\n\n 1 - If IC_RESTART_EN is 1, a RESTART is
      --  issued before the data is sent/received (according to the value of
      --  CMD), regardless of whether or not the transfer direction is changing
      --  from the previous command; if IC_RESTART_EN is 0, a STOP followed by
      --  a START is issued instead.\n\n 0 - If IC_RESTART_EN is 1, a RESTART
      --  is issued only if the transfer direction is changing from the
      --  previous command; if IC_RESTART_EN is 0, a STOP followed by a START
      --  is issued instead.\n\n Reset value: 0x0
      RESTART         : IC_DATA_CMD_RESTART_Field := RP2040_SVD.I2C1.DISABLE;
      --  Read-only. Indicates the first data byte received after the address
      --  phase for receive transfer in Master receiver or Slave receiver
      --  mode.\n\n Reset value : 0x0\n\n NOTE: In case of
      --  APB_DATA_WIDTH=8,\n\n 1. The user has to perform two APB Reads to
      --  IC_DATA_CMD in order to get status on 11 bit.\n\n 2. In order to read
      --  the 11 bit, the user has to perform the first data byte read [7:0]
      --  (offset 0x10) and then perform the second read [15:8] (offset 0x11)
      --  in order to know the status of 11 bit (whether the data received in
      --  previous read is a first data byte or not).\n\n 3. The 11th bit is an
      --  optional read field, user can ignore 2nd byte read [15:8] (offset
      --  0x11) if not interested in FIRST_DATA_BYTE status.
      FIRST_DATA_BYTE : IC_DATA_CMD_FIRST_DATA_BYTE_Field :=
                         RP2040_SVD.I2C1.INACTIVE;
      --  unspecified
      Reserved_12_31  : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_DATA_CMD_Register use record
      DAT             at 0 range 0 .. 7;
      CMD             at 0 range 8 .. 8;
      STOP            at 0 range 9 .. 9;
      RESTART         at 0 range 10 .. 10;
      FIRST_DATA_BYTE at 0 range 11 .. 11;
      Reserved_12_31  at 0 range 12 .. 31;
   end record;

   subtype IC_SS_SCL_HCNT_IC_SS_SCL_HCNT_Field is HAL.UInt16;

   --  Standard Speed I2C Clock SCL High Count Register
   type IC_SS_SCL_HCNT_Register is record
      --  This register must be set before any I2C bus transaction can take
      --  place to ensure proper I/O timing. This register sets the SCL clock
      --  high-period count for standard speed. For more information, refer to
      --  'IC_CLK Frequency Configuration'.\n\n This register can be written
      --  only when the I2C interface is disabled which corresponds to the
      --  IC_ENABLE[0] register being set to 0. Writes at other times have no
      --  effect.\n\n The minimum valid value is 6; hardware prevents values
      --  less than this being written, and if attempted results in 6 being
      --  set. For designs with APB_DATA_WIDTH = 8, the order of programming is
      --  important to ensure the correct operation of the DW_apb_i2c. The
      --  lower byte must be programmed first. Then the upper byte is
      --  programmed.\n\n NOTE: This register must not be programmed to a value
      --  higher than 65525, because DW_apb_i2c uses a 16-bit counter to flag
      --  an I2C bus idle condition when this counter reaches a value of
      --  IC_SS_SCL_HCNT + 10.
      IC_SS_SCL_HCNT : IC_SS_SCL_HCNT_IC_SS_SCL_HCNT_Field := 16#28#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_SS_SCL_HCNT_Register use record
      IC_SS_SCL_HCNT at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype IC_SS_SCL_LCNT_IC_SS_SCL_LCNT_Field is HAL.UInt16;

   --  Standard Speed I2C Clock SCL Low Count Register
   type IC_SS_SCL_LCNT_Register is record
      --  This register must be set before any I2C bus transaction can take
      --  place to ensure proper I/O timing. This register sets the SCL clock
      --  low period count for standard speed. For more information, refer to
      --  'IC_CLK Frequency Configuration'\n\n This register can be written
      --  only when the I2C interface is disabled which corresponds to the
      --  IC_ENABLE[0] register being set to 0. Writes at other times have no
      --  effect.\n\n The minimum valid value is 8; hardware prevents values
      --  less than this being written, and if attempted, results in 8 being
      --  set. For designs with APB_DATA_WIDTH = 8, the order of programming is
      --  important to ensure the correct operation of DW_apb_i2c. The lower
      --  byte must be programmed first, and then the upper byte is programmed.
      IC_SS_SCL_LCNT : IC_SS_SCL_LCNT_IC_SS_SCL_LCNT_Field := 16#2F#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_SS_SCL_LCNT_Register use record
      IC_SS_SCL_LCNT at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype IC_FS_SCL_HCNT_IC_FS_SCL_HCNT_Field is HAL.UInt16;

   --  Fast Mode or Fast Mode Plus I2C Clock SCL High Count Register
   type IC_FS_SCL_HCNT_Register is record
      --  This register must be set before any I2C bus transaction can take
      --  place to ensure proper I/O timing. This register sets the SCL clock
      --  high-period count for fast mode or fast mode plus. It is used in
      --  high-speed mode to send the Master Code and START BYTE or General
      --  CALL. For more information, refer to 'IC_CLK Frequency
      --  Configuration'.\n\n This register goes away and becomes read-only
      --  returning 0s if IC_MAX_SPEED_MODE = standard. This register can be
      --  written only when the I2C interface is disabled, which corresponds to
      --  the IC_ENABLE[0] register being set to 0. Writes at other times have
      --  no effect.\n\n The minimum valid value is 6; hardware prevents values
      --  less than this being written, and if attempted results in 6 being
      --  set. For designs with APB_DATA_WIDTH == 8 the order of programming is
      --  important to ensure the correct operation of the DW_apb_i2c. The
      --  lower byte must be programmed first. Then the upper byte is
      --  programmed.
      IC_FS_SCL_HCNT : IC_FS_SCL_HCNT_IC_FS_SCL_HCNT_Field := 16#6#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_FS_SCL_HCNT_Register use record
      IC_FS_SCL_HCNT at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype IC_FS_SCL_LCNT_IC_FS_SCL_LCNT_Field is HAL.UInt16;

   --  Fast Mode or Fast Mode Plus I2C Clock SCL Low Count Register
   type IC_FS_SCL_LCNT_Register is record
      --  This register must be set before any I2C bus transaction can take
      --  place to ensure proper I/O timing. This register sets the SCL clock
      --  low period count for fast speed. It is used in high-speed mode to
      --  send the Master Code and START BYTE or General CALL. For more
      --  information, refer to 'IC_CLK Frequency Configuration'.\n\n This
      --  register goes away and becomes read-only returning 0s if
      --  IC_MAX_SPEED_MODE = standard.\n\n This register can be written only
      --  when the I2C interface is disabled, which corresponds to the
      --  IC_ENABLE[0] register being set to 0. Writes at other times have no
      --  effect.\n\n The minimum valid value is 8; hardware prevents values
      --  less than this being written, and if attempted results in 8 being
      --  set. For designs with APB_DATA_WIDTH = 8 the order of programming is
      --  important to ensure the correct operation of the DW_apb_i2c. The
      --  lower byte must be programmed first. Then the upper byte is
      --  programmed. If the value is less than 8 then the count value gets
      --  changed to 8.
      IC_FS_SCL_LCNT : IC_FS_SCL_LCNT_IC_FS_SCL_LCNT_Field := 16#D#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_FS_SCL_LCNT_Register use record
      IC_FS_SCL_LCNT at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  See IC_RAW_INTR_STAT for a detailed description of R_RX_UNDER bit.\n\n
   --  Reset value: 0x0
   type IC_INTR_STAT_R_RX_UNDER_Field is
     (--  RX_UNDER interrupt is inactive
      INACTIVE,
      --  RX_UNDER interrupt is active
      ACTIVE)
     with Size => 1;
   for IC_INTR_STAT_R_RX_UNDER_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  See IC_RAW_INTR_STAT for a detailed description of R_RX_OVER bit.\n\n
   --  Reset value: 0x0
   type IC_INTR_STAT_R_RX_OVER_Field is
     (--  R_RX_OVER interrupt is inactive
      INACTIVE,
      --  R_RX_OVER interrupt is active
      ACTIVE)
     with Size => 1;
   for IC_INTR_STAT_R_RX_OVER_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  See IC_RAW_INTR_STAT for a detailed description of R_RX_FULL bit.\n\n
   --  Reset value: 0x0
   type IC_INTR_STAT_R_RX_FULL_Field is
     (--  R_RX_FULL interrupt is inactive
      INACTIVE,
      --  R_RX_FULL interrupt is active
      ACTIVE)
     with Size => 1;
   for IC_INTR_STAT_R_RX_FULL_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  See IC_RAW_INTR_STAT for a detailed description of R_TX_OVER bit.\n\n
   --  Reset value: 0x0
   type IC_INTR_STAT_R_TX_OVER_Field is
     (--  R_TX_OVER interrupt is inactive
      INACTIVE,
      --  R_TX_OVER interrupt is active
      ACTIVE)
     with Size => 1;
   for IC_INTR_STAT_R_TX_OVER_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  See IC_RAW_INTR_STAT for a detailed description of R_TX_EMPTY bit.\n\n
   --  Reset value: 0x0
   type IC_INTR_STAT_R_TX_EMPTY_Field is
     (--  R_TX_EMPTY interrupt is inactive
      INACTIVE,
      --  R_TX_EMPTY interrupt is active
      ACTIVE)
     with Size => 1;
   for IC_INTR_STAT_R_TX_EMPTY_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  See IC_RAW_INTR_STAT for a detailed description of R_RD_REQ bit.\n\n
   --  Reset value: 0x0
   type IC_INTR_STAT_R_RD_REQ_Field is
     (--  R_RD_REQ interrupt is inactive
      INACTIVE,
      --  R_RD_REQ interrupt is active
      ACTIVE)
     with Size => 1;
   for IC_INTR_STAT_R_RD_REQ_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  See IC_RAW_INTR_STAT for a detailed description of R_TX_ABRT bit.\n\n
   --  Reset value: 0x0
   type IC_INTR_STAT_R_TX_ABRT_Field is
     (--  R_TX_ABRT interrupt is inactive
      INACTIVE,
      --  R_TX_ABRT interrupt is active
      ACTIVE)
     with Size => 1;
   for IC_INTR_STAT_R_TX_ABRT_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  See IC_RAW_INTR_STAT for a detailed description of R_RX_DONE bit.\n\n
   --  Reset value: 0x0
   type IC_INTR_STAT_R_RX_DONE_Field is
     (--  R_RX_DONE interrupt is inactive
      INACTIVE,
      --  R_RX_DONE interrupt is active
      ACTIVE)
     with Size => 1;
   for IC_INTR_STAT_R_RX_DONE_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  See IC_RAW_INTR_STAT for a detailed description of R_ACTIVITY bit.\n\n
   --  Reset value: 0x0
   type IC_INTR_STAT_R_ACTIVITY_Field is
     (--  R_ACTIVITY interrupt is inactive
      INACTIVE,
      --  R_ACTIVITY interrupt is active
      ACTIVE)
     with Size => 1;
   for IC_INTR_STAT_R_ACTIVITY_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  See IC_RAW_INTR_STAT for a detailed description of R_STOP_DET bit.\n\n
   --  Reset value: 0x0
   type IC_INTR_STAT_R_STOP_DET_Field is
     (--  R_STOP_DET interrupt is inactive
      INACTIVE,
      --  R_STOP_DET interrupt is active
      ACTIVE)
     with Size => 1;
   for IC_INTR_STAT_R_STOP_DET_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  See IC_RAW_INTR_STAT for a detailed description of R_START_DET bit.\n\n
   --  Reset value: 0x0
   type IC_INTR_STAT_R_START_DET_Field is
     (--  R_START_DET interrupt is inactive
      INACTIVE,
      --  R_START_DET interrupt is active
      ACTIVE)
     with Size => 1;
   for IC_INTR_STAT_R_START_DET_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  See IC_RAW_INTR_STAT for a detailed description of R_GEN_CALL bit.\n\n
   --  Reset value: 0x0
   type IC_INTR_STAT_R_GEN_CALL_Field is
     (--  R_GEN_CALL interrupt is inactive
      INACTIVE,
      --  R_GEN_CALL interrupt is active
      ACTIVE)
     with Size => 1;
   for IC_INTR_STAT_R_GEN_CALL_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  See IC_RAW_INTR_STAT for a detailed description of R_RESTART_DET
   --  bit.\n\n Reset value: 0x0
   type IC_INTR_STAT_R_RESTART_DET_Field is
     (--  R_RESTART_DET interrupt is inactive
      INACTIVE,
      --  R_RESTART_DET interrupt is active
      ACTIVE)
     with Size => 1;
   for IC_INTR_STAT_R_RESTART_DET_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  See IC_RAW_INTR_STAT for a detailed description of R_MASTER_ON_HOLD
   --  bit.\n\n Reset value: 0x0
   type IC_INTR_STAT_R_MASTER_ON_HOLD_Field is
     (--  R_MASTER_ON_HOLD interrupt is inactive
      INACTIVE,
      --  R_MASTER_ON_HOLD interrupt is active
      ACTIVE)
     with Size => 1;
   for IC_INTR_STAT_R_MASTER_ON_HOLD_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  I2C Interrupt Status Register\n\n Each bit in this register has a
   --  corresponding mask bit in the IC_INTR_MASK register. These bits are
   --  cleared by reading the matching interrupt clear register. The unmasked
   --  raw versions of these bits are available in the IC_RAW_INTR_STAT
   --  register.
   type IC_INTR_STAT_Register is record
      --  Read-only. See IC_RAW_INTR_STAT for a detailed description of
      --  R_RX_UNDER bit.\n\n Reset value: 0x0
      R_RX_UNDER       : IC_INTR_STAT_R_RX_UNDER_Field;
      --  Read-only. See IC_RAW_INTR_STAT for a detailed description of
      --  R_RX_OVER bit.\n\n Reset value: 0x0
      R_RX_OVER        : IC_INTR_STAT_R_RX_OVER_Field;
      --  Read-only. See IC_RAW_INTR_STAT for a detailed description of
      --  R_RX_FULL bit.\n\n Reset value: 0x0
      R_RX_FULL        : IC_INTR_STAT_R_RX_FULL_Field;
      --  Read-only. See IC_RAW_INTR_STAT for a detailed description of
      --  R_TX_OVER bit.\n\n Reset value: 0x0
      R_TX_OVER        : IC_INTR_STAT_R_TX_OVER_Field;
      --  Read-only. See IC_RAW_INTR_STAT for a detailed description of
      --  R_TX_EMPTY bit.\n\n Reset value: 0x0
      R_TX_EMPTY       : IC_INTR_STAT_R_TX_EMPTY_Field;
      --  Read-only. See IC_RAW_INTR_STAT for a detailed description of
      --  R_RD_REQ bit.\n\n Reset value: 0x0
      R_RD_REQ         : IC_INTR_STAT_R_RD_REQ_Field;
      --  Read-only. See IC_RAW_INTR_STAT for a detailed description of
      --  R_TX_ABRT bit.\n\n Reset value: 0x0
      R_TX_ABRT        : IC_INTR_STAT_R_TX_ABRT_Field;
      --  Read-only. See IC_RAW_INTR_STAT for a detailed description of
      --  R_RX_DONE bit.\n\n Reset value: 0x0
      R_RX_DONE        : IC_INTR_STAT_R_RX_DONE_Field;
      --  Read-only. See IC_RAW_INTR_STAT for a detailed description of
      --  R_ACTIVITY bit.\n\n Reset value: 0x0
      R_ACTIVITY       : IC_INTR_STAT_R_ACTIVITY_Field;
      --  Read-only. See IC_RAW_INTR_STAT for a detailed description of
      --  R_STOP_DET bit.\n\n Reset value: 0x0
      R_STOP_DET       : IC_INTR_STAT_R_STOP_DET_Field;
      --  Read-only. See IC_RAW_INTR_STAT for a detailed description of
      --  R_START_DET bit.\n\n Reset value: 0x0
      R_START_DET      : IC_INTR_STAT_R_START_DET_Field;
      --  Read-only. See IC_RAW_INTR_STAT for a detailed description of
      --  R_GEN_CALL bit.\n\n Reset value: 0x0
      R_GEN_CALL       : IC_INTR_STAT_R_GEN_CALL_Field;
      --  Read-only. See IC_RAW_INTR_STAT for a detailed description of
      --  R_RESTART_DET bit.\n\n Reset value: 0x0
      R_RESTART_DET    : IC_INTR_STAT_R_RESTART_DET_Field;
      --  Read-only. See IC_RAW_INTR_STAT for a detailed description of
      --  R_MASTER_ON_HOLD bit.\n\n Reset value: 0x0
      R_MASTER_ON_HOLD : IC_INTR_STAT_R_MASTER_ON_HOLD_Field;
      --  unspecified
      Reserved_14_31   : HAL.UInt18;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_INTR_STAT_Register use record
      R_RX_UNDER       at 0 range 0 .. 0;
      R_RX_OVER        at 0 range 1 .. 1;
      R_RX_FULL        at 0 range 2 .. 2;
      R_TX_OVER        at 0 range 3 .. 3;
      R_TX_EMPTY       at 0 range 4 .. 4;
      R_RD_REQ         at 0 range 5 .. 5;
      R_TX_ABRT        at 0 range 6 .. 6;
      R_RX_DONE        at 0 range 7 .. 7;
      R_ACTIVITY       at 0 range 8 .. 8;
      R_STOP_DET       at 0 range 9 .. 9;
      R_START_DET      at 0 range 10 .. 10;
      R_GEN_CALL       at 0 range 11 .. 11;
      R_RESTART_DET    at 0 range 12 .. 12;
      R_MASTER_ON_HOLD at 0 range 13 .. 13;
      Reserved_14_31   at 0 range 14 .. 31;
   end record;

   --  This bit masks the R_RX_UNDER interrupt in IC_INTR_STAT register.\n\n
   --  Reset value: 0x1
   type IC_INTR_MASK_M_RX_UNDER_Field is
     (--  RX_UNDER interrupt is masked
      ENABLED,
      --  RX_UNDER interrupt is unmasked
      DISABLED)
     with Size => 1;
   for IC_INTR_MASK_M_RX_UNDER_Field use
     (ENABLED => 0,
      DISABLED => 1);

   --  This bit masks the R_RX_OVER interrupt in IC_INTR_STAT register.\n\n
   --  Reset value: 0x1
   type IC_INTR_MASK_M_RX_OVER_Field is
     (--  RX_OVER interrupt is masked
      ENABLED,
      --  RX_OVER interrupt is unmasked
      DISABLED)
     with Size => 1;
   for IC_INTR_MASK_M_RX_OVER_Field use
     (ENABLED => 0,
      DISABLED => 1);

   --  This bit masks the R_RX_FULL interrupt in IC_INTR_STAT register.\n\n
   --  Reset value: 0x1
   type IC_INTR_MASK_M_RX_FULL_Field is
     (--  RX_FULL interrupt is masked
      ENABLED,
      --  RX_FULL interrupt is unmasked
      DISABLED)
     with Size => 1;
   for IC_INTR_MASK_M_RX_FULL_Field use
     (ENABLED => 0,
      DISABLED => 1);

   --  This bit masks the R_TX_OVER interrupt in IC_INTR_STAT register.\n\n
   --  Reset value: 0x1
   type IC_INTR_MASK_M_TX_OVER_Field is
     (--  TX_OVER interrupt is masked
      ENABLED,
      --  TX_OVER interrupt is unmasked
      DISABLED)
     with Size => 1;
   for IC_INTR_MASK_M_TX_OVER_Field use
     (ENABLED => 0,
      DISABLED => 1);

   --  This bit masks the R_TX_EMPTY interrupt in IC_INTR_STAT register.\n\n
   --  Reset value: 0x1
   type IC_INTR_MASK_M_TX_EMPTY_Field is
     (--  TX_EMPTY interrupt is masked
      ENABLED,
      --  TX_EMPTY interrupt is unmasked
      DISABLED)
     with Size => 1;
   for IC_INTR_MASK_M_TX_EMPTY_Field use
     (ENABLED => 0,
      DISABLED => 1);

   --  This bit masks the R_RD_REQ interrupt in IC_INTR_STAT register.\n\n
   --  Reset value: 0x1
   type IC_INTR_MASK_M_RD_REQ_Field is
     (--  RD_REQ interrupt is masked
      ENABLED,
      --  RD_REQ interrupt is unmasked
      DISABLED)
     with Size => 1;
   for IC_INTR_MASK_M_RD_REQ_Field use
     (ENABLED => 0,
      DISABLED => 1);

   --  This bit masks the R_TX_ABRT interrupt in IC_INTR_STAT register.\n\n
   --  Reset value: 0x1
   type IC_INTR_MASK_M_TX_ABRT_Field is
     (--  TX_ABORT interrupt is masked
      ENABLED,
      --  TX_ABORT interrupt is unmasked
      DISABLED)
     with Size => 1;
   for IC_INTR_MASK_M_TX_ABRT_Field use
     (ENABLED => 0,
      DISABLED => 1);

   --  This bit masks the R_RX_DONE interrupt in IC_INTR_STAT register.\n\n
   --  Reset value: 0x1
   type IC_INTR_MASK_M_RX_DONE_Field is
     (--  RX_DONE interrupt is masked
      ENABLED,
      --  RX_DONE interrupt is unmasked
      DISABLED)
     with Size => 1;
   for IC_INTR_MASK_M_RX_DONE_Field use
     (ENABLED => 0,
      DISABLED => 1);

   --  This bit masks the R_ACTIVITY interrupt in IC_INTR_STAT register.\n\n
   --  Reset value: 0x0
   type IC_INTR_MASK_M_ACTIVITY_Field is
     (--  ACTIVITY interrupt is masked
      ENABLED,
      --  ACTIVITY interrupt is unmasked
      DISABLED)
     with Size => 1;
   for IC_INTR_MASK_M_ACTIVITY_Field use
     (ENABLED => 0,
      DISABLED => 1);

   --  This bit masks the R_STOP_DET interrupt in IC_INTR_STAT register.\n\n
   --  Reset value: 0x0
   type IC_INTR_MASK_M_STOP_DET_Field is
     (--  STOP_DET interrupt is masked
      ENABLED,
      --  STOP_DET interrupt is unmasked
      DISABLED)
     with Size => 1;
   for IC_INTR_MASK_M_STOP_DET_Field use
     (ENABLED => 0,
      DISABLED => 1);

   --  This bit masks the R_START_DET interrupt in IC_INTR_STAT register.\n\n
   --  Reset value: 0x0
   type IC_INTR_MASK_M_START_DET_Field is
     (--  START_DET interrupt is masked
      ENABLED,
      --  START_DET interrupt is unmasked
      DISABLED)
     with Size => 1;
   for IC_INTR_MASK_M_START_DET_Field use
     (ENABLED => 0,
      DISABLED => 1);

   --  This bit masks the R_GEN_CALL interrupt in IC_INTR_STAT register.\n\n
   --  Reset value: 0x1
   type IC_INTR_MASK_M_GEN_CALL_Field is
     (--  GEN_CALL interrupt is masked
      ENABLED,
      --  GEN_CALL interrupt is unmasked
      DISABLED)
     with Size => 1;
   for IC_INTR_MASK_M_GEN_CALL_Field use
     (ENABLED => 0,
      DISABLED => 1);

   --  This bit masks the R_RESTART_DET interrupt in IC_INTR_STAT register.\n\n
   --  Reset value: 0x0
   type IC_INTR_MASK_M_RESTART_DET_Field is
     (--  RESTART_DET interrupt is masked
      ENABLED,
      --  RESTART_DET interrupt is unmasked
      DISABLED)
     with Size => 1;
   for IC_INTR_MASK_M_RESTART_DET_Field use
     (ENABLED => 0,
      DISABLED => 1);

   --  This M_MASTER_ON_HOLD_read_only bit masks the R_MASTER_ON_HOLD interrupt
   --  in IC_INTR_STAT register.\n\n Reset value: 0x0
   type IC_INTR_MASK_M_MASTER_ON_HOLD_READ_ONLY_Field is
     (--  MASTER_ON_HOLD interrupt is masked
      ENABLED,
      --  MASTER_ON_HOLD interrupt is unmasked
      DISABLED)
     with Size => 1;
   for IC_INTR_MASK_M_MASTER_ON_HOLD_READ_ONLY_Field use
     (ENABLED => 0,
      DISABLED => 1);

   --  I2C Interrupt Mask Register.\n\n These bits mask their corresponding
   --  interrupt status bits. This register is active low; a value of 0 masks
   --  the interrupt, whereas a value of 1 unmasks the interrupt.
   type IC_INTR_MASK_Register is record
      --  This bit masks the R_RX_UNDER interrupt in IC_INTR_STAT register.\n\n
      --  Reset value: 0x1
      M_RX_UNDER                 : IC_INTR_MASK_M_RX_UNDER_Field :=
                                    RP2040_SVD.I2C1.DISABLED;
      --  This bit masks the R_RX_OVER interrupt in IC_INTR_STAT register.\n\n
      --  Reset value: 0x1
      M_RX_OVER                  : IC_INTR_MASK_M_RX_OVER_Field :=
                                    RP2040_SVD.I2C1.DISABLED;
      --  This bit masks the R_RX_FULL interrupt in IC_INTR_STAT register.\n\n
      --  Reset value: 0x1
      M_RX_FULL                  : IC_INTR_MASK_M_RX_FULL_Field :=
                                    RP2040_SVD.I2C1.DISABLED;
      --  This bit masks the R_TX_OVER interrupt in IC_INTR_STAT register.\n\n
      --  Reset value: 0x1
      M_TX_OVER                  : IC_INTR_MASK_M_TX_OVER_Field :=
                                    RP2040_SVD.I2C1.DISABLED;
      --  This bit masks the R_TX_EMPTY interrupt in IC_INTR_STAT register.\n\n
      --  Reset value: 0x1
      M_TX_EMPTY                 : IC_INTR_MASK_M_TX_EMPTY_Field :=
                                    RP2040_SVD.I2C1.DISABLED;
      --  This bit masks the R_RD_REQ interrupt in IC_INTR_STAT register.\n\n
      --  Reset value: 0x1
      M_RD_REQ                   : IC_INTR_MASK_M_RD_REQ_Field :=
                                    RP2040_SVD.I2C1.DISABLED;
      --  This bit masks the R_TX_ABRT interrupt in IC_INTR_STAT register.\n\n
      --  Reset value: 0x1
      M_TX_ABRT                  : IC_INTR_MASK_M_TX_ABRT_Field :=
                                    RP2040_SVD.I2C1.DISABLED;
      --  This bit masks the R_RX_DONE interrupt in IC_INTR_STAT register.\n\n
      --  Reset value: 0x1
      M_RX_DONE                  : IC_INTR_MASK_M_RX_DONE_Field :=
                                    RP2040_SVD.I2C1.DISABLED;
      --  This bit masks the R_ACTIVITY interrupt in IC_INTR_STAT register.\n\n
      --  Reset value: 0x0
      M_ACTIVITY                 : IC_INTR_MASK_M_ACTIVITY_Field :=
                                    RP2040_SVD.I2C1.ENABLED;
      --  This bit masks the R_STOP_DET interrupt in IC_INTR_STAT register.\n\n
      --  Reset value: 0x0
      M_STOP_DET                 : IC_INTR_MASK_M_STOP_DET_Field :=
                                    RP2040_SVD.I2C1.ENABLED;
      --  This bit masks the R_START_DET interrupt in IC_INTR_STAT
      --  register.\n\n Reset value: 0x0
      M_START_DET                : IC_INTR_MASK_M_START_DET_Field :=
                                    RP2040_SVD.I2C1.ENABLED;
      --  This bit masks the R_GEN_CALL interrupt in IC_INTR_STAT register.\n\n
      --  Reset value: 0x1
      M_GEN_CALL                 : IC_INTR_MASK_M_GEN_CALL_Field :=
                                    RP2040_SVD.I2C1.DISABLED;
      --  This bit masks the R_RESTART_DET interrupt in IC_INTR_STAT
      --  register.\n\n Reset value: 0x0
      M_RESTART_DET              : IC_INTR_MASK_M_RESTART_DET_Field :=
                                    RP2040_SVD.I2C1.ENABLED;
      --  Read-only. This M_MASTER_ON_HOLD_read_only bit masks the
      --  R_MASTER_ON_HOLD interrupt in IC_INTR_STAT register.\n\n Reset value:
      --  0x0
      M_MASTER_ON_HOLD_READ_ONLY : IC_INTR_MASK_M_MASTER_ON_HOLD_READ_ONLY_Field :=
                                    RP2040_SVD.I2C1.ENABLED;
      --  unspecified
      Reserved_14_31             : HAL.UInt18 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_INTR_MASK_Register use record
      M_RX_UNDER                 at 0 range 0 .. 0;
      M_RX_OVER                  at 0 range 1 .. 1;
      M_RX_FULL                  at 0 range 2 .. 2;
      M_TX_OVER                  at 0 range 3 .. 3;
      M_TX_EMPTY                 at 0 range 4 .. 4;
      M_RD_REQ                   at 0 range 5 .. 5;
      M_TX_ABRT                  at 0 range 6 .. 6;
      M_RX_DONE                  at 0 range 7 .. 7;
      M_ACTIVITY                 at 0 range 8 .. 8;
      M_STOP_DET                 at 0 range 9 .. 9;
      M_START_DET                at 0 range 10 .. 10;
      M_GEN_CALL                 at 0 range 11 .. 11;
      M_RESTART_DET              at 0 range 12 .. 12;
      M_MASTER_ON_HOLD_READ_ONLY at 0 range 13 .. 13;
      Reserved_14_31             at 0 range 14 .. 31;
   end record;

   --  Set if the processor attempts to read the receive buffer when it is
   --  empty by reading from the IC_DATA_CMD register. If the module is
   --  disabled (IC_ENABLE[0]=0), this bit keeps its level until the master or
   --  slave state machines go into idle, and when ic_en goes to 0, this
   --  interrupt is cleared.\n\n Reset value: 0x0
   type IC_RAW_INTR_STAT_RX_UNDER_Field is
     (--  RX_UNDER interrupt is inactive
      INACTIVE,
      --  RX_UNDER interrupt is active
      ACTIVE)
     with Size => 1;
   for IC_RAW_INTR_STAT_RX_UNDER_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  Set if the receive buffer is completely filled to IC_RX_BUFFER_DEPTH and
   --  an additional byte is received from an external I2C device. The
   --  DW_apb_i2c acknowledges this, but any data bytes received after the FIFO
   --  is full are lost. If the module is disabled (IC_ENABLE[0]=0), this bit
   --  keeps its level until the master or slave state machines go into idle,
   --  and when ic_en goes to 0, this interrupt is cleared.\n\n Note: If bit 9
   --  of the IC_CON register (RX_FIFO_FULL_HLD_CTRL) is programmed to HIGH,
   --  then the RX_OVER interrupt never occurs, because the Rx FIFO never
   --  overflows.\n\n Reset value: 0x0
   type IC_RAW_INTR_STAT_RX_OVER_Field is
     (--  RX_OVER interrupt is inactive
      INACTIVE,
      --  RX_OVER interrupt is active
      ACTIVE)
     with Size => 1;
   for IC_RAW_INTR_STAT_RX_OVER_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  Set when the receive buffer reaches or goes above the RX_TL threshold in
   --  the IC_RX_TL register. It is automatically cleared by hardware when
   --  buffer level goes below the threshold. If the module is disabled
   --  (IC_ENABLE[0]=0), the RX FIFO is flushed and held in reset; therefore
   --  the RX FIFO is not full. So this bit is cleared once the IC_ENABLE bit 0
   --  is programmed with a 0, regardless of the activity that continues.\n\n
   --  Reset value: 0x0
   type IC_RAW_INTR_STAT_RX_FULL_Field is
     (--  RX_FULL interrupt is inactive
      INACTIVE,
      --  RX_FULL interrupt is active
      ACTIVE)
     with Size => 1;
   for IC_RAW_INTR_STAT_RX_FULL_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  Set during transmit if the transmit buffer is filled to
   --  IC_TX_BUFFER_DEPTH and the processor attempts to issue another I2C
   --  command by writing to the IC_DATA_CMD register. When the module is
   --  disabled, this bit keeps its level until the master or slave state
   --  machines go into idle, and when ic_en goes to 0, this interrupt is
   --  cleared.\n\n Reset value: 0x0
   type IC_RAW_INTR_STAT_TX_OVER_Field is
     (--  TX_OVER interrupt is inactive
      INACTIVE,
      --  TX_OVER interrupt is active
      ACTIVE)
     with Size => 1;
   for IC_RAW_INTR_STAT_TX_OVER_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  The behavior of the TX_EMPTY interrupt status differs based on the
   --  TX_EMPTY_CTRL selection in the IC_CON register. - When TX_EMPTY_CTRL =
   --  0: This bit is set to 1 when the transmit buffer is at or below the
   --  threshold value set in the IC_TX_TL register. - When TX_EMPTY_CTRL = 1:
   --  This bit is set to 1 when the transmit buffer is at or below the
   --  threshold value set in the IC_TX_TL register and the transmission of the
   --  address/data from the internal shift register for the most recently
   --  popped command is completed. It is automatically cleared by hardware
   --  when the buffer level goes above the threshold. When IC_ENABLE[0] is set
   --  to 0, the TX FIFO is flushed and held in reset. There the TX FIFO looks
   --  like it has no data within it, so this bit is set to 1, provided there
   --  is activity in the master or slave state machines. When there is no
   --  longer any activity, then with ic_en=0, this bit is set to 0.\n\n Reset
   --  value: 0x0.
   type IC_RAW_INTR_STAT_TX_EMPTY_Field is
     (--  TX_EMPTY interrupt is inactive
      INACTIVE,
      --  TX_EMPTY interrupt is active
      ACTIVE)
     with Size => 1;
   for IC_RAW_INTR_STAT_TX_EMPTY_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  This bit is set to 1 when DW_apb_i2c is acting as a slave and another
   --  I2C master is attempting to read data from DW_apb_i2c. The DW_apb_i2c
   --  holds the I2C bus in a wait state (SCL=0) until this interrupt is
   --  serviced, which means that the slave has been addressed by a remote
   --  master that is asking for data to be transferred. The processor must
   --  respond to this interrupt and then write the requested data to the
   --  IC_DATA_CMD register. This bit is set to 0 just after the processor
   --  reads the IC_CLR_RD_REQ register.\n\n Reset value: 0x0
   type IC_RAW_INTR_STAT_RD_REQ_Field is
     (--  RD_REQ interrupt is inactive
      INACTIVE,
      --  RD_REQ interrupt is active
      ACTIVE)
     with Size => 1;
   for IC_RAW_INTR_STAT_RD_REQ_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  This bit indicates if DW_apb_i2c, as an I2C transmitter, is unable to
   --  complete the intended actions on the contents of the transmit FIFO. This
   --  situation can occur both as an I2C master or an I2C slave, and is
   --  referred to as a 'transmit abort'. When this bit is set to 1, the
   --  IC_TX_ABRT_SOURCE register indicates the reason why the transmit abort
   --  takes places.\n\n Note: The DW_apb_i2c flushes/resets/empties the
   --  TX_FIFO and RX_FIFO whenever there is a transmit abort caused by any of
   --  the events tracked by the IC_TX_ABRT_SOURCE register. The FIFOs remains
   --  in this flushed state until the register IC_CLR_TX_ABRT is read. Once
   --  this read is performed, the Tx FIFO is then ready to accept more data
   --  bytes from the APB interface.\n\n Reset value: 0x0
   type IC_RAW_INTR_STAT_TX_ABRT_Field is
     (--  TX_ABRT interrupt is inactive
      INACTIVE,
      --  TX_ABRT interrupt is active
      ACTIVE)
     with Size => 1;
   for IC_RAW_INTR_STAT_TX_ABRT_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  When the DW_apb_i2c is acting as a slave-transmitter, this bit is set to
   --  1 if the master does not acknowledge a transmitted byte. This occurs on
   --  the last byte of the transmission, indicating that the transmission is
   --  done.\n\n Reset value: 0x0
   type IC_RAW_INTR_STAT_RX_DONE_Field is
     (--  RX_DONE interrupt is inactive
      INACTIVE,
      --  RX_DONE interrupt is active
      ACTIVE)
     with Size => 1;
   for IC_RAW_INTR_STAT_RX_DONE_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  This bit captures DW_apb_i2c activity and stays set until it is cleared.
   --  There are four ways to clear it: - Disabling the DW_apb_i2c - Reading
   --  the IC_CLR_ACTIVITY register - Reading the IC_CLR_INTR register - System
   --  reset Once this bit is set, it stays set unless one of the four methods
   --  is used to clear it. Even if the DW_apb_i2c module is idle, this bit
   --  remains set until cleared, indicating that there was activity on the
   --  bus.\n\n Reset value: 0x0
   type IC_RAW_INTR_STAT_ACTIVITY_Field is
     (--  RAW_INTR_ACTIVITY interrupt is inactive
      INACTIVE,
      --  RAW_INTR_ACTIVITY interrupt is active
      ACTIVE)
     with Size => 1;
   for IC_RAW_INTR_STAT_ACTIVITY_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  Indicates whether a STOP condition has occurred on the I2C interface
   --  regardless of whether DW_apb_i2c is operating in slave or master
   --  mode.\n\n In Slave Mode: - If IC_CON[7]=1'b1 (STOP_DET_IFADDRESSED), the
   --  STOP_DET interrupt will be issued only if slave is addressed. Note:
   --  During a general call address, this slave does not issue a STOP_DET
   --  interrupt if STOP_DET_IF_ADDRESSED=1'b1, even if the slave responds to
   --  the general call address by generating ACK. The STOP_DET interrupt is
   --  generated only when the transmitted address matches the slave address
   --  (SAR). - If IC_CON[7]=1'b0 (STOP_DET_IFADDRESSED), the STOP_DET
   --  interrupt is issued irrespective of whether it is being addressed. In
   --  Master Mode: - If IC_CON[10]=1'b1 (STOP_DET_IF_MASTER_ACTIVE),the
   --  STOP_DET interrupt will be issued only if Master is active. - If
   --  IC_CON[10]=1'b0 (STOP_DET_IFADDRESSED),the STOP_DET interrupt will be
   --  issued irrespective of whether master is active or not. Reset value: 0x0
   type IC_RAW_INTR_STAT_STOP_DET_Field is
     (--  STOP_DET interrupt is inactive
      INACTIVE,
      --  STOP_DET interrupt is active
      ACTIVE)
     with Size => 1;
   for IC_RAW_INTR_STAT_STOP_DET_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  Indicates whether a START or RESTART condition has occurred on the I2C
   --  interface regardless of whether DW_apb_i2c is operating in slave or
   --  master mode.\n\n Reset value: 0x0
   type IC_RAW_INTR_STAT_START_DET_Field is
     (--  START_DET interrupt is inactive
      INACTIVE,
      --  START_DET interrupt is active
      ACTIVE)
     with Size => 1;
   for IC_RAW_INTR_STAT_START_DET_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  Set only when a General Call address is received and it is acknowledged.
   --  It stays set until it is cleared either by disabling DW_apb_i2c or when
   --  the CPU reads bit 0 of the IC_CLR_GEN_CALL register. DW_apb_i2c stores
   --  the received data in the Rx buffer.\n\n Reset value: 0x0
   type IC_RAW_INTR_STAT_GEN_CALL_Field is
     (--  GEN_CALL interrupt is inactive
      INACTIVE,
      --  GEN_CALL interrupt is active
      ACTIVE)
     with Size => 1;
   for IC_RAW_INTR_STAT_GEN_CALL_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  Indicates whether a RESTART condition has occurred on the I2C interface
   --  when DW_apb_i2c is operating in Slave mode and the slave is being
   --  addressed. Enabled only when IC_SLV_RESTART_DET_EN=1.\n\n Note: However,
   --  in high-speed mode or during a START BYTE transfer, the RESTART comes
   --  before the address field as per the I2C protocol. In this case, the
   --  slave is not the addressed slave when the RESTART is issued, therefore
   --  DW_apb_i2c does not generate the RESTART_DET interrupt.\n\n Reset value:
   --  0x0
   type IC_RAW_INTR_STAT_RESTART_DET_Field is
     (--  RESTART_DET interrupt is inactive
      INACTIVE,
      --  RESTART_DET interrupt is active
      ACTIVE)
     with Size => 1;
   for IC_RAW_INTR_STAT_RESTART_DET_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  Indicates whether master is holding the bus and TX FIFO is empty.
   --  Enabled only when I2C_DYNAMIC_TAR_UPDATE=1 and
   --  IC_EMPTYFIFO_HOLD_MASTER_EN=1.\n\n Reset value: 0x0
   type IC_RAW_INTR_STAT_MASTER_ON_HOLD_Field is
     (--  MASTER_ON_HOLD interrupt is inactive
      INACTIVE,
      --  MASTER_ON_HOLD interrupt is active
      ACTIVE)
     with Size => 1;
   for IC_RAW_INTR_STAT_MASTER_ON_HOLD_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  I2C Raw Interrupt Status Register\n\n Unlike the IC_INTR_STAT register,
   --  these bits are not masked so they always show the true status of the
   --  DW_apb_i2c.
   type IC_RAW_INTR_STAT_Register is record
      --  Read-only. Set if the processor attempts to read the receive buffer
      --  when it is empty by reading from the IC_DATA_CMD register. If the
      --  module is disabled (IC_ENABLE[0]=0), this bit keeps its level until
      --  the master or slave state machines go into idle, and when ic_en goes
      --  to 0, this interrupt is cleared.\n\n Reset value: 0x0
      RX_UNDER       : IC_RAW_INTR_STAT_RX_UNDER_Field;
      --  Read-only. Set if the receive buffer is completely filled to
      --  IC_RX_BUFFER_DEPTH and an additional byte is received from an
      --  external I2C device. The DW_apb_i2c acknowledges this, but any data
      --  bytes received after the FIFO is full are lost. If the module is
      --  disabled (IC_ENABLE[0]=0), this bit keeps its level until the master
      --  or slave state machines go into idle, and when ic_en goes to 0, this
      --  interrupt is cleared.\n\n Note: If bit 9 of the IC_CON register
      --  (RX_FIFO_FULL_HLD_CTRL) is programmed to HIGH, then the RX_OVER
      --  interrupt never occurs, because the Rx FIFO never overflows.\n\n
      --  Reset value: 0x0
      RX_OVER        : IC_RAW_INTR_STAT_RX_OVER_Field;
      --  Read-only. Set when the receive buffer reaches or goes above the
      --  RX_TL threshold in the IC_RX_TL register. It is automatically cleared
      --  by hardware when buffer level goes below the threshold. If the module
      --  is disabled (IC_ENABLE[0]=0), the RX FIFO is flushed and held in
      --  reset; therefore the RX FIFO is not full. So this bit is cleared once
      --  the IC_ENABLE bit 0 is programmed with a 0, regardless of the
      --  activity that continues.\n\n Reset value: 0x0
      RX_FULL        : IC_RAW_INTR_STAT_RX_FULL_Field;
      --  Read-only. Set during transmit if the transmit buffer is filled to
      --  IC_TX_BUFFER_DEPTH and the processor attempts to issue another I2C
      --  command by writing to the IC_DATA_CMD register. When the module is
      --  disabled, this bit keeps its level until the master or slave state
      --  machines go into idle, and when ic_en goes to 0, this interrupt is
      --  cleared.\n\n Reset value: 0x0
      TX_OVER        : IC_RAW_INTR_STAT_TX_OVER_Field;
      --  Read-only. The behavior of the TX_EMPTY interrupt status differs
      --  based on the TX_EMPTY_CTRL selection in the IC_CON register. - When
      --  TX_EMPTY_CTRL = 0: This bit is set to 1 when the transmit buffer is
      --  at or below the threshold value set in the IC_TX_TL register. - When
      --  TX_EMPTY_CTRL = 1: This bit is set to 1 when the transmit buffer is
      --  at or below the threshold value set in the IC_TX_TL register and the
      --  transmission of the address/data from the internal shift register for
      --  the most recently popped command is completed. It is automatically
      --  cleared by hardware when the buffer level goes above the threshold.
      --  When IC_ENABLE[0] is set to 0, the TX FIFO is flushed and held in
      --  reset. There the TX FIFO looks like it has no data within it, so this
      --  bit is set to 1, provided there is activity in the master or slave
      --  state machines. When there is no longer any activity, then with
      --  ic_en=0, this bit is set to 0.\n\n Reset value: 0x0.
      TX_EMPTY       : IC_RAW_INTR_STAT_TX_EMPTY_Field;
      --  Read-only. This bit is set to 1 when DW_apb_i2c is acting as a slave
      --  and another I2C master is attempting to read data from DW_apb_i2c.
      --  The DW_apb_i2c holds the I2C bus in a wait state (SCL=0) until this
      --  interrupt is serviced, which means that the slave has been addressed
      --  by a remote master that is asking for data to be transferred. The
      --  processor must respond to this interrupt and then write the requested
      --  data to the IC_DATA_CMD register. This bit is set to 0 just after the
      --  processor reads the IC_CLR_RD_REQ register.\n\n Reset value: 0x0
      RD_REQ         : IC_RAW_INTR_STAT_RD_REQ_Field;
      --  Read-only. This bit indicates if DW_apb_i2c, as an I2C transmitter,
      --  is unable to complete the intended actions on the contents of the
      --  transmit FIFO. This situation can occur both as an I2C master or an
      --  I2C slave, and is referred to as a 'transmit abort'. When this bit is
      --  set to 1, the IC_TX_ABRT_SOURCE register indicates the reason why the
      --  transmit abort takes places.\n\n Note: The DW_apb_i2c
      --  flushes/resets/empties the TX_FIFO and RX_FIFO whenever there is a
      --  transmit abort caused by any of the events tracked by the
      --  IC_TX_ABRT_SOURCE register. The FIFOs remains in this flushed state
      --  until the register IC_CLR_TX_ABRT is read. Once this read is
      --  performed, the Tx FIFO is then ready to accept more data bytes from
      --  the APB interface.\n\n Reset value: 0x0
      TX_ABRT        : IC_RAW_INTR_STAT_TX_ABRT_Field;
      --  Read-only. When the DW_apb_i2c is acting as a slave-transmitter, this
      --  bit is set to 1 if the master does not acknowledge a transmitted
      --  byte. This occurs on the last byte of the transmission, indicating
      --  that the transmission is done.\n\n Reset value: 0x0
      RX_DONE        : IC_RAW_INTR_STAT_RX_DONE_Field;
      --  Read-only. This bit captures DW_apb_i2c activity and stays set until
      --  it is cleared. There are four ways to clear it: - Disabling the
      --  DW_apb_i2c - Reading the IC_CLR_ACTIVITY register - Reading the
      --  IC_CLR_INTR register - System reset Once this bit is set, it stays
      --  set unless one of the four methods is used to clear it. Even if the
      --  DW_apb_i2c module is idle, this bit remains set until cleared,
      --  indicating that there was activity on the bus.\n\n Reset value: 0x0
      ACTIVITY       : IC_RAW_INTR_STAT_ACTIVITY_Field;
      --  Read-only. Indicates whether a STOP condition has occurred on the I2C
      --  interface regardless of whether DW_apb_i2c is operating in slave or
      --  master mode.\n\n In Slave Mode: - If IC_CON[7]=1'b1
      --  (STOP_DET_IFADDRESSED), the STOP_DET interrupt will be issued only if
      --  slave is addressed. Note: During a general call address, this slave
      --  does not issue a STOP_DET interrupt if STOP_DET_IF_ADDRESSED=1'b1,
      --  even if the slave responds to the general call address by generating
      --  ACK. The STOP_DET interrupt is generated only when the transmitted
      --  address matches the slave address (SAR). - If IC_CON[7]=1'b0
      --  (STOP_DET_IFADDRESSED), the STOP_DET interrupt is issued irrespective
      --  of whether it is being addressed. In Master Mode: - If
      --  IC_CON[10]=1'b1 (STOP_DET_IF_MASTER_ACTIVE),the STOP_DET interrupt
      --  will be issued only if Master is active. - If IC_CON[10]=1'b0
      --  (STOP_DET_IFADDRESSED),the STOP_DET interrupt will be issued
      --  irrespective of whether master is active or not. Reset value: 0x0
      STOP_DET       : IC_RAW_INTR_STAT_STOP_DET_Field;
      --  Read-only. Indicates whether a START or RESTART condition has
      --  occurred on the I2C interface regardless of whether DW_apb_i2c is
      --  operating in slave or master mode.\n\n Reset value: 0x0
      START_DET      : IC_RAW_INTR_STAT_START_DET_Field;
      --  Read-only. Set only when a General Call address is received and it is
      --  acknowledged. It stays set until it is cleared either by disabling
      --  DW_apb_i2c or when the CPU reads bit 0 of the IC_CLR_GEN_CALL
      --  register. DW_apb_i2c stores the received data in the Rx buffer.\n\n
      --  Reset value: 0x0
      GEN_CALL       : IC_RAW_INTR_STAT_GEN_CALL_Field;
      --  Read-only. Indicates whether a RESTART condition has occurred on the
      --  I2C interface when DW_apb_i2c is operating in Slave mode and the
      --  slave is being addressed. Enabled only when
      --  IC_SLV_RESTART_DET_EN=1.\n\n Note: However, in high-speed mode or
      --  during a START BYTE transfer, the RESTART comes before the address
      --  field as per the I2C protocol. In this case, the slave is not the
      --  addressed slave when the RESTART is issued, therefore DW_apb_i2c does
      --  not generate the RESTART_DET interrupt.\n\n Reset value: 0x0
      RESTART_DET    : IC_RAW_INTR_STAT_RESTART_DET_Field;
      --  Read-only. Indicates whether master is holding the bus and TX FIFO is
      --  empty. Enabled only when I2C_DYNAMIC_TAR_UPDATE=1 and
      --  IC_EMPTYFIFO_HOLD_MASTER_EN=1.\n\n Reset value: 0x0
      MASTER_ON_HOLD : IC_RAW_INTR_STAT_MASTER_ON_HOLD_Field;
      --  unspecified
      Reserved_14_31 : HAL.UInt18;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_RAW_INTR_STAT_Register use record
      RX_UNDER       at 0 range 0 .. 0;
      RX_OVER        at 0 range 1 .. 1;
      RX_FULL        at 0 range 2 .. 2;
      TX_OVER        at 0 range 3 .. 3;
      TX_EMPTY       at 0 range 4 .. 4;
      RD_REQ         at 0 range 5 .. 5;
      TX_ABRT        at 0 range 6 .. 6;
      RX_DONE        at 0 range 7 .. 7;
      ACTIVITY       at 0 range 8 .. 8;
      STOP_DET       at 0 range 9 .. 9;
      START_DET      at 0 range 10 .. 10;
      GEN_CALL       at 0 range 11 .. 11;
      RESTART_DET    at 0 range 12 .. 12;
      MASTER_ON_HOLD at 0 range 13 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   subtype IC_RX_TL_RX_TL_Field is HAL.UInt8;

   --  I2C Receive FIFO Threshold Register
   type IC_RX_TL_Register is record
      --  Receive FIFO Threshold Level.\n\n Controls the level of entries (or
      --  above) that triggers the RX_FULL interrupt (bit 2 in IC_RAW_INTR_STAT
      --  register). The valid range is 0-255, with the additional restriction
      --  that hardware does not allow this value to be set to a value larger
      --  than the depth of the buffer. If an attempt is made to do that, the
      --  actual value set will be the maximum depth of the buffer. A value of
      --  0 sets the threshold for 1 entry, and a value of 255 sets the
      --  threshold for 256 entries.
      RX_TL         : IC_RX_TL_RX_TL_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_RX_TL_Register use record
      RX_TL         at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype IC_TX_TL_TX_TL_Field is HAL.UInt8;

   --  I2C Transmit FIFO Threshold Register
   type IC_TX_TL_Register is record
      --  Transmit FIFO Threshold Level.\n\n Controls the level of entries (or
      --  below) that trigger the TX_EMPTY interrupt (bit 4 in IC_RAW_INTR_STAT
      --  register). The valid range is 0-255, with the additional restriction
      --  that it may not be set to value larger than the depth of the buffer.
      --  If an attempt is made to do that, the actual value set will be the
      --  maximum depth of the buffer. A value of 0 sets the threshold for 0
      --  entries, and a value of 255 sets the threshold for 255 entries.
      TX_TL         : IC_TX_TL_TX_TL_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_TX_TL_Register use record
      TX_TL         at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  Clear Combined and Individual Interrupt Register
   type IC_CLR_INTR_Register is record
      --  Read-only. Read this register to clear the combined interrupt, all
      --  individual interrupts, and the IC_TX_ABRT_SOURCE register. This bit
      --  does not clear hardware clearable interrupts but software clearable
      --  interrupts. Refer to Bit 9 of the IC_TX_ABRT_SOURCE register for an
      --  exception to clearing IC_TX_ABRT_SOURCE.\n\n Reset value: 0x0
      CLR_INTR      : Boolean;
      --  unspecified
      Reserved_1_31 : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_CLR_INTR_Register use record
      CLR_INTR      at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Clear RX_UNDER Interrupt Register
   type IC_CLR_RX_UNDER_Register is record
      --  Read-only. Read this register to clear the RX_UNDER interrupt (bit 0)
      --  of the IC_RAW_INTR_STAT register.\n\n Reset value: 0x0
      CLR_RX_UNDER  : Boolean;
      --  unspecified
      Reserved_1_31 : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_CLR_RX_UNDER_Register use record
      CLR_RX_UNDER  at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Clear RX_OVER Interrupt Register
   type IC_CLR_RX_OVER_Register is record
      --  Read-only. Read this register to clear the RX_OVER interrupt (bit 1)
      --  of the IC_RAW_INTR_STAT register.\n\n Reset value: 0x0
      CLR_RX_OVER   : Boolean;
      --  unspecified
      Reserved_1_31 : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_CLR_RX_OVER_Register use record
      CLR_RX_OVER   at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Clear TX_OVER Interrupt Register
   type IC_CLR_TX_OVER_Register is record
      --  Read-only. Read this register to clear the TX_OVER interrupt (bit 3)
      --  of the IC_RAW_INTR_STAT register.\n\n Reset value: 0x0
      CLR_TX_OVER   : Boolean;
      --  unspecified
      Reserved_1_31 : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_CLR_TX_OVER_Register use record
      CLR_TX_OVER   at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Clear RD_REQ Interrupt Register
   type IC_CLR_RD_REQ_Register is record
      --  Read-only. Read this register to clear the RD_REQ interrupt (bit 5)
      --  of the IC_RAW_INTR_STAT register.\n\n Reset value: 0x0
      CLR_RD_REQ    : Boolean;
      --  unspecified
      Reserved_1_31 : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_CLR_RD_REQ_Register use record
      CLR_RD_REQ    at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Clear TX_ABRT Interrupt Register
   type IC_CLR_TX_ABRT_Register is record
      --  Read-only. Read this register to clear the TX_ABRT interrupt (bit 6)
      --  of the IC_RAW_INTR_STAT register, and the IC_TX_ABRT_SOURCE register.
      --  This also releases the TX FIFO from the flushed/reset state, allowing
      --  more writes to the TX FIFO. Refer to Bit 9 of the IC_TX_ABRT_SOURCE
      --  register for an exception to clearing IC_TX_ABRT_SOURCE.\n\n Reset
      --  value: 0x0
      CLR_TX_ABRT   : Boolean;
      --  unspecified
      Reserved_1_31 : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_CLR_TX_ABRT_Register use record
      CLR_TX_ABRT   at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Clear RX_DONE Interrupt Register
   type IC_CLR_RX_DONE_Register is record
      --  Read-only. Read this register to clear the RX_DONE interrupt (bit 7)
      --  of the IC_RAW_INTR_STAT register.\n\n Reset value: 0x0
      CLR_RX_DONE   : Boolean;
      --  unspecified
      Reserved_1_31 : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_CLR_RX_DONE_Register use record
      CLR_RX_DONE   at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Clear ACTIVITY Interrupt Register
   type IC_CLR_ACTIVITY_Register is record
      --  Read-only. Reading this register clears the ACTIVITY interrupt if the
      --  I2C is not active anymore. If the I2C module is still active on the
      --  bus, the ACTIVITY interrupt bit continues to be set. It is
      --  automatically cleared by hardware if the module is disabled and if
      --  there is no further activity on the bus. The value read from this
      --  register to get status of the ACTIVITY interrupt (bit 8) of the
      --  IC_RAW_INTR_STAT register.\n\n Reset value: 0x0
      CLR_ACTIVITY  : Boolean;
      --  unspecified
      Reserved_1_31 : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_CLR_ACTIVITY_Register use record
      CLR_ACTIVITY  at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Clear STOP_DET Interrupt Register
   type IC_CLR_STOP_DET_Register is record
      --  Read-only. Read this register to clear the STOP_DET interrupt (bit 9)
      --  of the IC_RAW_INTR_STAT register.\n\n Reset value: 0x0
      CLR_STOP_DET  : Boolean;
      --  unspecified
      Reserved_1_31 : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_CLR_STOP_DET_Register use record
      CLR_STOP_DET  at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Clear START_DET Interrupt Register
   type IC_CLR_START_DET_Register is record
      --  Read-only. Read this register to clear the START_DET interrupt (bit
      --  10) of the IC_RAW_INTR_STAT register.\n\n Reset value: 0x0
      CLR_START_DET : Boolean;
      --  unspecified
      Reserved_1_31 : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_CLR_START_DET_Register use record
      CLR_START_DET at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Clear GEN_CALL Interrupt Register
   type IC_CLR_GEN_CALL_Register is record
      --  Read-only. Read this register to clear the GEN_CALL interrupt (bit
      --  11) of IC_RAW_INTR_STAT register.\n\n Reset value: 0x0
      CLR_GEN_CALL  : Boolean;
      --  unspecified
      Reserved_1_31 : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_CLR_GEN_CALL_Register use record
      CLR_GEN_CALL  at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Controls whether the DW_apb_i2c is enabled. - 0: Disables DW_apb_i2c (TX
   --  and RX FIFOs are held in an erased state) - 1: Enables DW_apb_i2c
   --  Software can disable DW_apb_i2c while it is active. However, it is
   --  important that care be taken to ensure that DW_apb_i2c is disabled
   --  properly. A recommended procedure is described in 'Disabling
   --  DW_apb_i2c'.\n\n When DW_apb_i2c is disabled, the following occurs: -
   --  The TX FIFO and RX FIFO get flushed. - Status bits in the IC_INTR_STAT
   --  register are still active until DW_apb_i2c goes into IDLE state. If the
   --  module is transmitting, it stops as well as deletes the contents of the
   --  transmit buffer after the current transfer is complete. If the module is
   --  receiving, the DW_apb_i2c stops the current transfer at the end of the
   --  current byte and does not acknowledge the transfer.\n\n In systems with
   --  asynchronous pclk and ic_clk when IC_CLK_TYPE parameter set to
   --  asynchronous (1), there is a two ic_clk delay when enabling or disabling
   --  the DW_apb_i2c. For a detailed description on how to disable DW_apb_i2c,
   --  refer to 'Disabling DW_apb_i2c'\n\n Reset value: 0x0
   type IC_ENABLE_ENABLE_Field is
     (--  I2C is disabled
      DISABLED,
      --  I2C is enabled
      ENABLED)
     with Size => 1;
   for IC_ENABLE_ENABLE_Field use
     (DISABLED => 0,
      ENABLED => 1);

   --  When set, the controller initiates the transfer abort. - 0: ABORT not
   --  initiated or ABORT done - 1: ABORT operation in progress The software
   --  can abort the I2C transfer in master mode by setting this bit. The
   --  software can set this bit only when ENABLE is already set; otherwise,
   --  the controller ignores any write to ABORT bit. The software cannot clear
   --  the ABORT bit once set. In response to an ABORT, the controller issues a
   --  STOP and flushes the Tx FIFO after completing the current transfer, then
   --  sets the TX_ABORT interrupt after the abort operation. The ABORT bit is
   --  cleared automatically after the abort operation.\n\n For a detailed
   --  description on how to abort I2C transfers, refer to 'Aborting I2C
   --  Transfers'.\n\n Reset value: 0x0
   type IC_ENABLE_ABORT_Field is
     (--  ABORT operation not in progress
      DISABLE,
      --  ABORT operation in progress
      ENABLED)
     with Size => 1;
   for IC_ENABLE_ABORT_Field use
     (DISABLE => 0,
      ENABLED => 1);

   --  In Master mode: - 1'b1: Blocks the transmission of data on I2C bus even
   --  if Tx FIFO has data to transmit. - 1'b0: The transmission of data starts
   --  on I2C bus automatically, as soon as the first data is available in the
   --  Tx FIFO. Note: To block the execution of Master commands, set the
   --  TX_CMD_BLOCK bit only when Tx FIFO is empty (IC_STATUS[2]==1) and Master
   --  is in Idle state (IC_STATUS[5] == 0). Any further commands put in the Tx
   --  FIFO are not executed until TX_CMD_BLOCK bit is unset. Reset value:
   --  IC_TX_CMD_BLOCK_DEFAULT
   type IC_ENABLE_TX_CMD_BLOCK_Field is
     (--  Tx Command execution not blocked
      NOT_BLOCKED,
      --  Tx Command execution blocked
      BLOCKED)
     with Size => 1;
   for IC_ENABLE_TX_CMD_BLOCK_Field use
     (NOT_BLOCKED => 0,
      BLOCKED => 1);

   --  I2C Enable Register
   type IC_ENABLE_Register is record
      --  Controls whether the DW_apb_i2c is enabled. - 0: Disables DW_apb_i2c
      --  (TX and RX FIFOs are held in an erased state) - 1: Enables DW_apb_i2c
      --  Software can disable DW_apb_i2c while it is active. However, it is
      --  important that care be taken to ensure that DW_apb_i2c is disabled
      --  properly. A recommended procedure is described in 'Disabling
      --  DW_apb_i2c'.\n\n When DW_apb_i2c is disabled, the following occurs: -
      --  The TX FIFO and RX FIFO get flushed. - Status bits in the
      --  IC_INTR_STAT register are still active until DW_apb_i2c goes into
      --  IDLE state. If the module is transmitting, it stops as well as
      --  deletes the contents of the transmit buffer after the current
      --  transfer is complete. If the module is receiving, the DW_apb_i2c
      --  stops the current transfer at the end of the current byte and does
      --  not acknowledge the transfer.\n\n In systems with asynchronous pclk
      --  and ic_clk when IC_CLK_TYPE parameter set to asynchronous (1), there
      --  is a two ic_clk delay when enabling or disabling the DW_apb_i2c. For
      --  a detailed description on how to disable DW_apb_i2c, refer to
      --  'Disabling DW_apb_i2c'\n\n Reset value: 0x0
      ENABLE        : IC_ENABLE_ENABLE_Field := RP2040_SVD.I2C1.DISABLED;
      --  When set, the controller initiates the transfer abort. - 0: ABORT not
      --  initiated or ABORT done - 1: ABORT operation in progress The software
      --  can abort the I2C transfer in master mode by setting this bit. The
      --  software can set this bit only when ENABLE is already set; otherwise,
      --  the controller ignores any write to ABORT bit. The software cannot
      --  clear the ABORT bit once set. In response to an ABORT, the controller
      --  issues a STOP and flushes the Tx FIFO after completing the current
      --  transfer, then sets the TX_ABORT interrupt after the abort operation.
      --  The ABORT bit is cleared automatically after the abort operation.\n\n
      --  For a detailed description on how to abort I2C transfers, refer to
      --  'Aborting I2C Transfers'.\n\n Reset value: 0x0
      ABORT_k       : IC_ENABLE_ABORT_Field := RP2040_SVD.I2C1.DISABLE;
      --  In Master mode: - 1'b1: Blocks the transmission of data on I2C bus
      --  even if Tx FIFO has data to transmit. - 1'b0: The transmission of
      --  data starts on I2C bus automatically, as soon as the first data is
      --  available in the Tx FIFO. Note: To block the execution of Master
      --  commands, set the TX_CMD_BLOCK bit only when Tx FIFO is empty
      --  (IC_STATUS[2]==1) and Master is in Idle state (IC_STATUS[5] == 0).
      --  Any further commands put in the Tx FIFO are not executed until
      --  TX_CMD_BLOCK bit is unset. Reset value: IC_TX_CMD_BLOCK_DEFAULT
      TX_CMD_BLOCK  : IC_ENABLE_TX_CMD_BLOCK_Field :=
                       RP2040_SVD.I2C1.NOT_BLOCKED;
      --  unspecified
      Reserved_3_31 : HAL.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_ENABLE_Register use record
      ENABLE        at 0 range 0 .. 0;
      ABORT_k       at 0 range 1 .. 1;
      TX_CMD_BLOCK  at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   --  I2C Activity Status. Reset value: 0x0
   type IC_STATUS_ACTIVITY_Field is
     (--  I2C is idle
      INACTIVE,
      --  I2C is active
      ACTIVE)
     with Size => 1;
   for IC_STATUS_ACTIVITY_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  Transmit FIFO Not Full. Set when the transmit FIFO contains one or more
   --  empty locations, and is cleared when the FIFO is full. - 0: Transmit
   --  FIFO is full - 1: Transmit FIFO is not full Reset value: 0x1
   type IC_STATUS_TFNF_Field is
     (--  Tx FIFO is full
      FULL,
      --  Tx FIFO not full
      NOT_FULL)
     with Size => 1;
   for IC_STATUS_TFNF_Field use
     (FULL => 0,
      NOT_FULL => 1);

   --  Transmit FIFO Completely Empty. When the transmit FIFO is completely
   --  empty, this bit is set. When it contains one or more valid entries, this
   --  bit is cleared. This bit field does not request an interrupt. - 0:
   --  Transmit FIFO is not empty - 1: Transmit FIFO is empty Reset value: 0x1
   type IC_STATUS_TFE_Field is
     (--  Tx FIFO not empty
      NON_EMPTY,
      --  Tx FIFO is empty
      EMPTY)
     with Size => 1;
   for IC_STATUS_TFE_Field use
     (NON_EMPTY => 0,
      EMPTY => 1);

   --  Receive FIFO Not Empty. This bit is set when the receive FIFO contains
   --  one or more entries; it is cleared when the receive FIFO is empty. - 0:
   --  Receive FIFO is empty - 1: Receive FIFO is not empty Reset value: 0x0
   type IC_STATUS_RFNE_Field is
     (--  Rx FIFO is empty
      EMPTY,
      --  Rx FIFO not empty
      NOT_EMPTY)
     with Size => 1;
   for IC_STATUS_RFNE_Field use
     (EMPTY => 0,
      NOT_EMPTY => 1);

   --  Receive FIFO Completely Full. When the receive FIFO is completely full,
   --  this bit is set. When the receive FIFO contains one or more empty
   --  location, this bit is cleared. - 0: Receive FIFO is not full - 1:
   --  Receive FIFO is full Reset value: 0x0
   type IC_STATUS_RFF_Field is
     (--  Rx FIFO not full
      NOT_FULL,
      --  Rx FIFO is full
      FULL)
     with Size => 1;
   for IC_STATUS_RFF_Field use
     (NOT_FULL => 0,
      FULL => 1);

   --  Master FSM Activity Status. When the Master Finite State Machine (FSM)
   --  is not in the IDLE state, this bit is set. - 0: Master FSM is in IDLE
   --  state so the Master part of DW_apb_i2c is not Active - 1: Master FSM is
   --  not in IDLE state so the Master part of DW_apb_i2c is Active Note:
   --  IC_STATUS[0]-that is, ACTIVITY bit-is the OR of SLV_ACTIVITY and
   --  MST_ACTIVITY bits.\n\n Reset value: 0x0
   type IC_STATUS_MST_ACTIVITY_Field is
     (--  Master is idle
      IDLE,
      --  Master not idle
      ACTIVE)
     with Size => 1;
   for IC_STATUS_MST_ACTIVITY_Field use
     (IDLE => 0,
      ACTIVE => 1);

   --  Slave FSM Activity Status. When the Slave Finite State Machine (FSM) is
   --  not in the IDLE state, this bit is set. - 0: Slave FSM is in IDLE state
   --  so the Slave part of DW_apb_i2c is not Active - 1: Slave FSM is not in
   --  IDLE state so the Slave part of DW_apb_i2c is Active Reset value: 0x0
   type IC_STATUS_SLV_ACTIVITY_Field is
     (--  Slave is idle
      IDLE,
      --  Slave not idle
      ACTIVE)
     with Size => 1;
   for IC_STATUS_SLV_ACTIVITY_Field use
     (IDLE => 0,
      ACTIVE => 1);

   --  I2C Status Register\n\n This is a read-only register used to indicate
   --  the current transfer status and FIFO status. The status register may be
   --  read at any time. None of the bits in this register request an
   --  interrupt.\n\n When the I2C is disabled by writing 0 in bit 0 of the
   --  IC_ENABLE register: - Bits 1 and 2 are set to 1 - Bits 3 and 10 are set
   --  to 0 When the master or slave state machines goes to idle and ic_en=0: -
   --  Bits 5 and 6 are set to 0
   type IC_STATUS_Register is record
      --  Read-only. I2C Activity Status. Reset value: 0x0
      ACTIVITY      : IC_STATUS_ACTIVITY_Field;
      --  Read-only. Transmit FIFO Not Full. Set when the transmit FIFO
      --  contains one or more empty locations, and is cleared when the FIFO is
      --  full. - 0: Transmit FIFO is full - 1: Transmit FIFO is not full Reset
      --  value: 0x1
      TFNF          : IC_STATUS_TFNF_Field;
      --  Read-only. Transmit FIFO Completely Empty. When the transmit FIFO is
      --  completely empty, this bit is set. When it contains one or more valid
      --  entries, this bit is cleared. This bit field does not request an
      --  interrupt. - 0: Transmit FIFO is not empty - 1: Transmit FIFO is
      --  empty Reset value: 0x1
      TFE           : IC_STATUS_TFE_Field;
      --  Read-only. Receive FIFO Not Empty. This bit is set when the receive
      --  FIFO contains one or more entries; it is cleared when the receive
      --  FIFO is empty. - 0: Receive FIFO is empty - 1: Receive FIFO is not
      --  empty Reset value: 0x0
      RFNE          : IC_STATUS_RFNE_Field;
      --  Read-only. Receive FIFO Completely Full. When the receive FIFO is
      --  completely full, this bit is set. When the receive FIFO contains one
      --  or more empty location, this bit is cleared. - 0: Receive FIFO is not
      --  full - 1: Receive FIFO is full Reset value: 0x0
      RFF           : IC_STATUS_RFF_Field;
      --  Read-only. Master FSM Activity Status. When the Master Finite State
      --  Machine (FSM) is not in the IDLE state, this bit is set. - 0: Master
      --  FSM is in IDLE state so the Master part of DW_apb_i2c is not Active -
      --  1: Master FSM is not in IDLE state so the Master part of DW_apb_i2c
      --  is Active Note: IC_STATUS[0]-that is, ACTIVITY bit-is the OR of
      --  SLV_ACTIVITY and MST_ACTIVITY bits.\n\n Reset value: 0x0
      MST_ACTIVITY  : IC_STATUS_MST_ACTIVITY_Field;
      --  Read-only. Slave FSM Activity Status. When the Slave Finite State
      --  Machine (FSM) is not in the IDLE state, this bit is set. - 0: Slave
      --  FSM is in IDLE state so the Slave part of DW_apb_i2c is not Active -
      --  1: Slave FSM is not in IDLE state so the Slave part of DW_apb_i2c is
      --  Active Reset value: 0x0
      SLV_ACTIVITY  : IC_STATUS_SLV_ACTIVITY_Field;
      --  unspecified
      Reserved_7_31 : HAL.UInt25;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_STATUS_Register use record
      ACTIVITY      at 0 range 0 .. 0;
      TFNF          at 0 range 1 .. 1;
      TFE           at 0 range 2 .. 2;
      RFNE          at 0 range 3 .. 3;
      RFF           at 0 range 4 .. 4;
      MST_ACTIVITY  at 0 range 5 .. 5;
      SLV_ACTIVITY  at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype IC_TXFLR_TXFLR_Field is HAL.UInt5;

   --  I2C Transmit FIFO Level Register This register contains the number of
   --  valid data entries in the transmit FIFO buffer. It is cleared whenever:
   --  - The I2C is disabled - There is a transmit abort - that is, TX_ABRT bit
   --  is set in the IC_RAW_INTR_STAT register - The slave bulk transmit mode
   --  is aborted The register increments whenever data is placed into the
   --  transmit FIFO and decrements when data is taken from the transmit FIFO.
   type IC_TXFLR_Register is record
      --  Read-only. Transmit FIFO Level. Contains the number of valid data
      --  entries in the transmit FIFO.\n\n Reset value: 0x0
      TXFLR         : IC_TXFLR_TXFLR_Field;
      --  unspecified
      Reserved_5_31 : HAL.UInt27;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_TXFLR_Register use record
      TXFLR         at 0 range 0 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype IC_RXFLR_RXFLR_Field is HAL.UInt5;

   --  I2C Receive FIFO Level Register This register contains the number of
   --  valid data entries in the receive FIFO buffer. It is cleared whenever: -
   --  The I2C is disabled - Whenever there is a transmit abort caused by any
   --  of the events tracked in IC_TX_ABRT_SOURCE The register increments
   --  whenever data is placed into the receive FIFO and decrements when data
   --  is taken from the receive FIFO.
   type IC_RXFLR_Register is record
      --  Read-only. Receive FIFO Level. Contains the number of valid data
      --  entries in the receive FIFO.\n\n Reset value: 0x0
      RXFLR         : IC_RXFLR_RXFLR_Field;
      --  unspecified
      Reserved_5_31 : HAL.UInt27;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_RXFLR_Register use record
      RXFLR         at 0 range 0 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype IC_SDA_HOLD_IC_SDA_TX_HOLD_Field is HAL.UInt16;
   subtype IC_SDA_HOLD_IC_SDA_RX_HOLD_Field is HAL.UInt8;

   --  I2C SDA Hold Time Length Register\n\n The bits [15:0] of this register
   --  are used to control the hold time of SDA during transmit in both slave
   --  and master mode (after SCL goes from HIGH to LOW).\n\n The bits [23:16]
   --  of this register are used to extend the SDA transition (if any) whenever
   --  SCL is HIGH in the receiver in either master or slave mode.\n\n Writes
   --  to this register succeed only when IC_ENABLE[0]=0.\n\n The values in
   --  this register are in units of ic_clk period. The value programmed in
   --  IC_SDA_TX_HOLD must be greater than the minimum hold time in each mode
   --  one cycle in master mode, seven cycles in slave mode for the value to be
   --  implemented.\n\n The programmed SDA hold time during transmit
   --  (IC_SDA_TX_HOLD) cannot exceed at any time the duration of the low part
   --  of scl. Therefore the programmed value cannot be larger than
   --  N_SCL_LOW-2, where N_SCL_LOW is the duration of the low part of the scl
   --  period measured in ic_clk cycles.
   type IC_SDA_HOLD_Register is record
      --  Sets the required SDA hold time in units of ic_clk period, when
      --  DW_apb_i2c acts as a transmitter.\n\n Reset value:
      --  IC_DEFAULT_SDA_HOLD[15:0].
      IC_SDA_TX_HOLD : IC_SDA_HOLD_IC_SDA_TX_HOLD_Field := 16#1#;
      --  Sets the required SDA hold time in units of ic_clk period, when
      --  DW_apb_i2c acts as a receiver.\n\n Reset value:
      --  IC_DEFAULT_SDA_HOLD[23:16].
      IC_SDA_RX_HOLD : IC_SDA_HOLD_IC_SDA_RX_HOLD_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_SDA_HOLD_Register use record
      IC_SDA_TX_HOLD at 0 range 0 .. 15;
      IC_SDA_RX_HOLD at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  This field indicates that the Master is in 7-bit addressing mode and the
   --  address sent was not acknowledged by any slave.\n\n Reset value: 0x0\n\n
   --  Role of DW_apb_i2c: Master-Transmitter or Master-Receiver
   type IC_TX_ABRT_SOURCE_ABRT_7B_ADDR_NOACK_Field is
     (--  This abort is not generated
      INACTIVE,
      --  This abort is generated because of NOACK for 7-bit address
      ACTIVE)
     with Size => 1;
   for IC_TX_ABRT_SOURCE_ABRT_7B_ADDR_NOACK_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  This field indicates that the Master is in 10-bit address mode and the
   --  first 10-bit address byte was not acknowledged by any slave.\n\n Reset
   --  value: 0x0\n\n Role of DW_apb_i2c: Master-Transmitter or Master-Receiver
   type IC_TX_ABRT_SOURCE_ABRT_10ADDR1_NOACK_Field is
     (--  This abort is not generated
      INACTIVE,
      --  Byte 1 of 10Bit Address not ACKed by any slave
      ACTIVE)
     with Size => 1;
   for IC_TX_ABRT_SOURCE_ABRT_10ADDR1_NOACK_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  This field indicates that the Master is in 10-bit address mode and that
   --  the second address byte of the 10-bit address was not acknowledged by
   --  any slave.\n\n Reset value: 0x0\n\n Role of DW_apb_i2c:
   --  Master-Transmitter or Master-Receiver
   type IC_TX_ABRT_SOURCE_ABRT_10ADDR2_NOACK_Field is
     (--  This abort is not generated
      INACTIVE,
      --  Byte 2 of 10Bit Address not ACKed by any slave
      ACTIVE)
     with Size => 1;
   for IC_TX_ABRT_SOURCE_ABRT_10ADDR2_NOACK_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  This field indicates the master-mode only bit. When the master receives
   --  an acknowledgement for the address, but when it sends data byte(s)
   --  following the address, it did not receive an acknowledge from the remote
   --  slave(s).\n\n Reset value: 0x0\n\n Role of DW_apb_i2c:
   --  Master-Transmitter
   type IC_TX_ABRT_SOURCE_ABRT_TXDATA_NOACK_Field is
     (--  Transmitted data non-ACKed by addressed slave-scenario not present
      ABRT_TXDATA_NOACK_VOID,
      --  Transmitted data not ACKed by addressed slave
      ABRT_TXDATA_NOACK_GENERATED)
     with Size => 1;
   for IC_TX_ABRT_SOURCE_ABRT_TXDATA_NOACK_Field use
     (ABRT_TXDATA_NOACK_VOID => 0,
      ABRT_TXDATA_NOACK_GENERATED => 1);

   --  This field indicates that DW_apb_i2c in master mode has sent a General
   --  Call and no slave on the bus acknowledged the General Call.\n\n Reset
   --  value: 0x0\n\n Role of DW_apb_i2c: Master-Transmitter
   type IC_TX_ABRT_SOURCE_ABRT_GCALL_NOACK_Field is
     (--  GCALL not ACKed by any slave-scenario not present
      ABRT_GCALL_NOACK_VOID,
      --  GCALL not ACKed by any slave
      ABRT_GCALL_NOACK_GENERATED)
     with Size => 1;
   for IC_TX_ABRT_SOURCE_ABRT_GCALL_NOACK_Field use
     (ABRT_GCALL_NOACK_VOID => 0,
      ABRT_GCALL_NOACK_GENERATED => 1);

   --  This field indicates that DW_apb_i2c in the master mode has sent a
   --  General Call but the user programmed the byte following the General Call
   --  to be a read from the bus (IC_DATA_CMD[9] is set to 1).\n\n Reset value:
   --  0x0\n\n Role of DW_apb_i2c: Master-Transmitter
   type IC_TX_ABRT_SOURCE_ABRT_GCALL_READ_Field is
     (--  GCALL is followed by read from bus-scenario not present
      ABRT_GCALL_READ_VOID,
      --  GCALL is followed by read from bus
      ABRT_GCALL_READ_GENERATED)
     with Size => 1;
   for IC_TX_ABRT_SOURCE_ABRT_GCALL_READ_Field use
     (ABRT_GCALL_READ_VOID => 0,
      ABRT_GCALL_READ_GENERATED => 1);

   --  This field indicates that the Master is in High Speed mode and the High
   --  Speed Master code was acknowledged (wrong behavior).\n\n Reset value:
   --  0x0\n\n Role of DW_apb_i2c: Master
   type IC_TX_ABRT_SOURCE_ABRT_HS_ACKDET_Field is
     (--  HS Master code ACKed in HS Mode- scenario not present
      ABRT_HS_ACK_VOID,
      --  HS Master code ACKed in HS Mode
      ABRT_HS_ACK_GENERATED)
     with Size => 1;
   for IC_TX_ABRT_SOURCE_ABRT_HS_ACKDET_Field use
     (ABRT_HS_ACK_VOID => 0,
      ABRT_HS_ACK_GENERATED => 1);

   --  This field indicates that the Master has sent a START Byte and the START
   --  Byte was acknowledged (wrong behavior).\n\n Reset value: 0x0\n\n Role of
   --  DW_apb_i2c: Master
   type IC_TX_ABRT_SOURCE_ABRT_SBYTE_ACKDET_Field is
     (--  ACK detected for START byte- scenario not present
      ABRT_SBYTE_ACKDET_VOID,
      --  ACK detected for START byte
      ABRT_SBYTE_ACKDET_GENERATED)
     with Size => 1;
   for IC_TX_ABRT_SOURCE_ABRT_SBYTE_ACKDET_Field use
     (ABRT_SBYTE_ACKDET_VOID => 0,
      ABRT_SBYTE_ACKDET_GENERATED => 1);

   --  This field indicates that the restart is disabled (IC_RESTART_EN bit
   --  (IC_CON[5]) =0) and the user is trying to use the master to transfer
   --  data in High Speed mode.\n\n Reset value: 0x0\n\n Role of DW_apb_i2c:
   --  Master-Transmitter or Master-Receiver
   type IC_TX_ABRT_SOURCE_ABRT_HS_NORSTRT_Field is
     (--  User trying to switch Master to HS mode when RESTART disabled- scenario not
--  present
      ABRT_HS_NORSTRT_VOID,
      --  User trying to switch Master to HS mode when RESTART disabled
      ABRT_HS_NORSTRT_GENERATED)
     with Size => 1;
   for IC_TX_ABRT_SOURCE_ABRT_HS_NORSTRT_Field use
     (ABRT_HS_NORSTRT_VOID => 0,
      ABRT_HS_NORSTRT_GENERATED => 1);

   --  To clear Bit 9, the source of the ABRT_SBYTE_NORSTRT must be fixed
   --  first; restart must be enabled (IC_CON[5]=1), the SPECIAL bit must be
   --  cleared (IC_TAR[11]), or the GC_OR_START bit must be cleared
   --  (IC_TAR[10]). Once the source of the ABRT_SBYTE_NORSTRT is fixed, then
   --  this bit can be cleared in the same manner as other bits in this
   --  register. If the source of the ABRT_SBYTE_NORSTRT is not fixed before
   --  attempting to clear this bit, bit 9 clears for one cycle and then gets
   --  reasserted. When this field is set to 1, the restart is disabled
   --  (IC_RESTART_EN bit (IC_CON[5]) =0) and the user is trying to send a
   --  START Byte.\n\n Reset value: 0x0\n\n Role of DW_apb_i2c: Master
   type IC_TX_ABRT_SOURCE_ABRT_SBYTE_NORSTRT_Field is
     (--  User trying to send START byte when RESTART disabled- scenario not present
      ABRT_SBYTE_NORSTRT_VOID,
      --  User trying to send START byte when RESTART disabled
      ABRT_SBYTE_NORSTRT_GENERATED)
     with Size => 1;
   for IC_TX_ABRT_SOURCE_ABRT_SBYTE_NORSTRT_Field use
     (ABRT_SBYTE_NORSTRT_VOID => 0,
      ABRT_SBYTE_NORSTRT_GENERATED => 1);

   --  This field indicates that the restart is disabled (IC_RESTART_EN bit
   --  (IC_CON[5]) =0) and the master sends a read command in 10-bit addressing
   --  mode.\n\n Reset value: 0x0\n\n Role of DW_apb_i2c: Master-Receiver
   type IC_TX_ABRT_SOURCE_ABRT_10B_RD_NORSTRT_Field is
     (--  Master not trying to read in 10Bit addressing mode when RESTART disabled
      ABRT_10B_RD_VOID,
      --  Master trying to read in 10Bit addressing mode when RESTART disabled
      ABRT_10B_RD_GENERATED)
     with Size => 1;
   for IC_TX_ABRT_SOURCE_ABRT_10B_RD_NORSTRT_Field use
     (ABRT_10B_RD_VOID => 0,
      ABRT_10B_RD_GENERATED => 1);

   --  This field indicates that the User tries to initiate a Master operation
   --  with the Master mode disabled.\n\n Reset value: 0x0\n\n Role of
   --  DW_apb_i2c: Master-Transmitter or Master-Receiver
   type IC_TX_ABRT_SOURCE_ABRT_MASTER_DIS_Field is
     (--  User initiating master operation when MASTER disabled- scenario not present
      ABRT_MASTER_DIS_VOID,
      --  User initiating master operation when MASTER disabled
      ABRT_MASTER_DIS_GENERATED)
     with Size => 1;
   for IC_TX_ABRT_SOURCE_ABRT_MASTER_DIS_Field use
     (ABRT_MASTER_DIS_VOID => 0,
      ABRT_MASTER_DIS_GENERATED => 1);

   --  This field specifies that the Master has lost arbitration, or if
   --  IC_TX_ABRT_SOURCE[14] is also set, then the slave transmitter has lost
   --  arbitration.\n\n Reset value: 0x0\n\n Role of DW_apb_i2c:
   --  Master-Transmitter or Slave-Transmitter
   type IC_TX_ABRT_SOURCE_ARB_LOST_Field is
     (--  Master or Slave-Transmitter lost arbitration- scenario not present
      ABRT_LOST_VOID,
      --  Master or Slave-Transmitter lost arbitration
      ABRT_LOST_GENERATED)
     with Size => 1;
   for IC_TX_ABRT_SOURCE_ARB_LOST_Field use
     (ABRT_LOST_VOID => 0,
      ABRT_LOST_GENERATED => 1);

   --  This field specifies that the Slave has received a read command and some
   --  data exists in the TX FIFO, so the slave issues a TX_ABRT interrupt to
   --  flush old data in TX FIFO.\n\n Reset value: 0x0\n\n Role of DW_apb_i2c:
   --  Slave-Transmitter
   type IC_TX_ABRT_SOURCE_ABRT_SLVFLUSH_TXFIFO_Field is
     (--  Slave flushes existing data in TX-FIFO upon getting read command- scenario
--  not present
      ABRT_SLVFLUSH_TXFIFO_VOID,
      --  Slave flushes existing data in TX-FIFO upon getting read command
      ABRT_SLVFLUSH_TXFIFO_GENERATED)
     with Size => 1;
   for IC_TX_ABRT_SOURCE_ABRT_SLVFLUSH_TXFIFO_Field use
     (ABRT_SLVFLUSH_TXFIFO_VOID => 0,
      ABRT_SLVFLUSH_TXFIFO_GENERATED => 1);

   --  This field indicates that a Slave has lost the bus while transmitting
   --  data to a remote master. IC_TX_ABRT_SOURCE[12] is set at the same time.
   --  Note: Even though the slave never 'owns' the bus, something could go
   --  wrong on the bus. This is a fail safe check. For instance, during a data
   --  transmission at the low-to-high transition of SCL, if what is on the
   --  data bus is not what is supposed to be transmitted, then DW_apb_i2c no
   --  longer own the bus.\n\n Reset value: 0x0\n\n Role of DW_apb_i2c:
   --  Slave-Transmitter
   type IC_TX_ABRT_SOURCE_ABRT_SLV_ARBLOST_Field is
     (--  Slave lost arbitration to remote master- scenario not present
      ABRT_SLV_ARBLOST_VOID,
      --  Slave lost arbitration to remote master
      ABRT_SLV_ARBLOST_GENERATED)
     with Size => 1;
   for IC_TX_ABRT_SOURCE_ABRT_SLV_ARBLOST_Field use
     (ABRT_SLV_ARBLOST_VOID => 0,
      ABRT_SLV_ARBLOST_GENERATED => 1);

   --  1: When the processor side responds to a slave mode request for data to
   --  be transmitted to a remote master and user writes a 1 in CMD (bit 8) of
   --  IC_DATA_CMD register.\n\n Reset value: 0x0\n\n Role of DW_apb_i2c:
   --  Slave-Transmitter
   type IC_TX_ABRT_SOURCE_ABRT_SLVRD_INTX_Field is
     (--  Slave trying to transmit to remote master in read mode- scenario not
--  present
      ABRT_SLVRD_INTX_VOID,
      --  Slave trying to transmit to remote master in read mode
      ABRT_SLVRD_INTX_GENERATED)
     with Size => 1;
   for IC_TX_ABRT_SOURCE_ABRT_SLVRD_INTX_Field use
     (ABRT_SLVRD_INTX_VOID => 0,
      ABRT_SLVRD_INTX_GENERATED => 1);

   --  This is a master-mode-only bit. Master has detected the transfer abort
   --  (IC_ENABLE[1])\n\n Reset value: 0x0\n\n Role of DW_apb_i2c:
   --  Master-Transmitter
   type IC_TX_ABRT_SOURCE_ABRT_USER_ABRT_Field is
     (--  Transfer abort detected by master- scenario not present
      ABRT_USER_ABRT_VOID,
      --  Transfer abort detected by master
      ABRT_USER_ABRT_GENERATED)
     with Size => 1;
   for IC_TX_ABRT_SOURCE_ABRT_USER_ABRT_Field use
     (ABRT_USER_ABRT_VOID => 0,
      ABRT_USER_ABRT_GENERATED => 1);

   subtype IC_TX_ABRT_SOURCE_TX_FLUSH_CNT_Field is HAL.UInt9;

   --  I2C Transmit Abort Source Register\n\n This register has 32 bits that
   --  indicate the source of the TX_ABRT bit. Except for Bit 9, this register
   --  is cleared whenever the IC_CLR_TX_ABRT register or the IC_CLR_INTR
   --  register is read. To clear Bit 9, the source of the ABRT_SBYTE_NORSTRT
   --  must be fixed first; RESTART must be enabled (IC_CON[5]=1), the SPECIAL
   --  bit must be cleared (IC_TAR[11]), or the GC_OR_START bit must be cleared
   --  (IC_TAR[10]).\n\n Once the source of the ABRT_SBYTE_NORSTRT is fixed,
   --  then this bit can be cleared in the same manner as other bits in this
   --  register. If the source of the ABRT_SBYTE_NORSTRT is not fixed before
   --  attempting to clear this bit, Bit 9 clears for one cycle and is then
   --  re-asserted.
   type IC_TX_ABRT_SOURCE_Register is record
      --  Read-only. This field indicates that the Master is in 7-bit
      --  addressing mode and the address sent was not acknowledged by any
      --  slave.\n\n Reset value: 0x0\n\n Role of DW_apb_i2c:
      --  Master-Transmitter or Master-Receiver
      ABRT_7B_ADDR_NOACK   : IC_TX_ABRT_SOURCE_ABRT_7B_ADDR_NOACK_Field;
      --  Read-only. This field indicates that the Master is in 10-bit address
      --  mode and the first 10-bit address byte was not acknowledged by any
      --  slave.\n\n Reset value: 0x0\n\n Role of DW_apb_i2c:
      --  Master-Transmitter or Master-Receiver
      ABRT_10ADDR1_NOACK   : IC_TX_ABRT_SOURCE_ABRT_10ADDR1_NOACK_Field;
      --  Read-only. This field indicates that the Master is in 10-bit address
      --  mode and that the second address byte of the 10-bit address was not
      --  acknowledged by any slave.\n\n Reset value: 0x0\n\n Role of
      --  DW_apb_i2c: Master-Transmitter or Master-Receiver
      ABRT_10ADDR2_NOACK   : IC_TX_ABRT_SOURCE_ABRT_10ADDR2_NOACK_Field;
      --  Read-only. This field indicates the master-mode only bit. When the
      --  master receives an acknowledgement for the address, but when it sends
      --  data byte(s) following the address, it did not receive an acknowledge
      --  from the remote slave(s).\n\n Reset value: 0x0\n\n Role of
      --  DW_apb_i2c: Master-Transmitter
      ABRT_TXDATA_NOACK    : IC_TX_ABRT_SOURCE_ABRT_TXDATA_NOACK_Field;
      --  Read-only. This field indicates that DW_apb_i2c in master mode has
      --  sent a General Call and no slave on the bus acknowledged the General
      --  Call.\n\n Reset value: 0x0\n\n Role of DW_apb_i2c: Master-Transmitter
      ABRT_GCALL_NOACK     : IC_TX_ABRT_SOURCE_ABRT_GCALL_NOACK_Field;
      --  Read-only. This field indicates that DW_apb_i2c in the master mode
      --  has sent a General Call but the user programmed the byte following
      --  the General Call to be a read from the bus (IC_DATA_CMD[9] is set to
      --  1).\n\n Reset value: 0x0\n\n Role of DW_apb_i2c: Master-Transmitter
      ABRT_GCALL_READ      : IC_TX_ABRT_SOURCE_ABRT_GCALL_READ_Field;
      --  Read-only. This field indicates that the Master is in High Speed mode
      --  and the High Speed Master code was acknowledged (wrong behavior).\n\n
      --  Reset value: 0x0\n\n Role of DW_apb_i2c: Master
      ABRT_HS_ACKDET       : IC_TX_ABRT_SOURCE_ABRT_HS_ACKDET_Field;
      --  Read-only. This field indicates that the Master has sent a START Byte
      --  and the START Byte was acknowledged (wrong behavior).\n\n Reset
      --  value: 0x0\n\n Role of DW_apb_i2c: Master
      ABRT_SBYTE_ACKDET    : IC_TX_ABRT_SOURCE_ABRT_SBYTE_ACKDET_Field;
      --  Read-only. This field indicates that the restart is disabled
      --  (IC_RESTART_EN bit (IC_CON[5]) =0) and the user is trying to use the
      --  master to transfer data in High Speed mode.\n\n Reset value: 0x0\n\n
      --  Role of DW_apb_i2c: Master-Transmitter or Master-Receiver
      ABRT_HS_NORSTRT      : IC_TX_ABRT_SOURCE_ABRT_HS_NORSTRT_Field;
      --  Read-only. To clear Bit 9, the source of the ABRT_SBYTE_NORSTRT must
      --  be fixed first; restart must be enabled (IC_CON[5]=1), the SPECIAL
      --  bit must be cleared (IC_TAR[11]), or the GC_OR_START bit must be
      --  cleared (IC_TAR[10]). Once the source of the ABRT_SBYTE_NORSTRT is
      --  fixed, then this bit can be cleared in the same manner as other bits
      --  in this register. If the source of the ABRT_SBYTE_NORSTRT is not
      --  fixed before attempting to clear this bit, bit 9 clears for one cycle
      --  and then gets reasserted. When this field is set to 1, the restart is
      --  disabled (IC_RESTART_EN bit (IC_CON[5]) =0) and the user is trying to
      --  send a START Byte.\n\n Reset value: 0x0\n\n Role of DW_apb_i2c:
      --  Master
      ABRT_SBYTE_NORSTRT   : IC_TX_ABRT_SOURCE_ABRT_SBYTE_NORSTRT_Field;
      --  Read-only. This field indicates that the restart is disabled
      --  (IC_RESTART_EN bit (IC_CON[5]) =0) and the master sends a read
      --  command in 10-bit addressing mode.\n\n Reset value: 0x0\n\n Role of
      --  DW_apb_i2c: Master-Receiver
      ABRT_10B_RD_NORSTRT  : IC_TX_ABRT_SOURCE_ABRT_10B_RD_NORSTRT_Field;
      --  Read-only. This field indicates that the User tries to initiate a
      --  Master operation with the Master mode disabled.\n\n Reset value:
      --  0x0\n\n Role of DW_apb_i2c: Master-Transmitter or Master-Receiver
      ABRT_MASTER_DIS      : IC_TX_ABRT_SOURCE_ABRT_MASTER_DIS_Field;
      --  Read-only. This field specifies that the Master has lost arbitration,
      --  or if IC_TX_ABRT_SOURCE[14] is also set, then the slave transmitter
      --  has lost arbitration.\n\n Reset value: 0x0\n\n Role of DW_apb_i2c:
      --  Master-Transmitter or Slave-Transmitter
      ARB_LOST             : IC_TX_ABRT_SOURCE_ARB_LOST_Field;
      --  Read-only. This field specifies that the Slave has received a read
      --  command and some data exists in the TX FIFO, so the slave issues a
      --  TX_ABRT interrupt to flush old data in TX FIFO.\n\n Reset value:
      --  0x0\n\n Role of DW_apb_i2c: Slave-Transmitter
      ABRT_SLVFLUSH_TXFIFO : IC_TX_ABRT_SOURCE_ABRT_SLVFLUSH_TXFIFO_Field;
      --  Read-only. This field indicates that a Slave has lost the bus while
      --  transmitting data to a remote master. IC_TX_ABRT_SOURCE[12] is set at
      --  the same time. Note: Even though the slave never 'owns' the bus,
      --  something could go wrong on the bus. This is a fail safe check. For
      --  instance, during a data transmission at the low-to-high transition of
      --  SCL, if what is on the data bus is not what is supposed to be
      --  transmitted, then DW_apb_i2c no longer own the bus.\n\n Reset value:
      --  0x0\n\n Role of DW_apb_i2c: Slave-Transmitter
      ABRT_SLV_ARBLOST     : IC_TX_ABRT_SOURCE_ABRT_SLV_ARBLOST_Field;
      --  Read-only. 1: When the processor side responds to a slave mode
      --  request for data to be transmitted to a remote master and user writes
      --  a 1 in CMD (bit 8) of IC_DATA_CMD register.\n\n Reset value: 0x0\n\n
      --  Role of DW_apb_i2c: Slave-Transmitter
      ABRT_SLVRD_INTX      : IC_TX_ABRT_SOURCE_ABRT_SLVRD_INTX_Field;
      --  Read-only. This is a master-mode-only bit. Master has detected the
      --  transfer abort (IC_ENABLE[1])\n\n Reset value: 0x0\n\n Role of
      --  DW_apb_i2c: Master-Transmitter
      ABRT_USER_ABRT       : IC_TX_ABRT_SOURCE_ABRT_USER_ABRT_Field;
      --  unspecified
      Reserved_17_22       : HAL.UInt6;
      --  Read-only. This field indicates the number of Tx FIFO Data Commands
      --  which are flushed due to TX_ABRT interrupt. It is cleared whenever
      --  I2C is disabled.\n\n Reset value: 0x0\n\n Role of DW_apb_i2c:
      --  Master-Transmitter or Slave-Transmitter
      TX_FLUSH_CNT         : IC_TX_ABRT_SOURCE_TX_FLUSH_CNT_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_TX_ABRT_SOURCE_Register use record
      ABRT_7B_ADDR_NOACK   at 0 range 0 .. 0;
      ABRT_10ADDR1_NOACK   at 0 range 1 .. 1;
      ABRT_10ADDR2_NOACK   at 0 range 2 .. 2;
      ABRT_TXDATA_NOACK    at 0 range 3 .. 3;
      ABRT_GCALL_NOACK     at 0 range 4 .. 4;
      ABRT_GCALL_READ      at 0 range 5 .. 5;
      ABRT_HS_ACKDET       at 0 range 6 .. 6;
      ABRT_SBYTE_ACKDET    at 0 range 7 .. 7;
      ABRT_HS_NORSTRT      at 0 range 8 .. 8;
      ABRT_SBYTE_NORSTRT   at 0 range 9 .. 9;
      ABRT_10B_RD_NORSTRT  at 0 range 10 .. 10;
      ABRT_MASTER_DIS      at 0 range 11 .. 11;
      ARB_LOST             at 0 range 12 .. 12;
      ABRT_SLVFLUSH_TXFIFO at 0 range 13 .. 13;
      ABRT_SLV_ARBLOST     at 0 range 14 .. 14;
      ABRT_SLVRD_INTX      at 0 range 15 .. 15;
      ABRT_USER_ABRT       at 0 range 16 .. 16;
      Reserved_17_22       at 0 range 17 .. 22;
      TX_FLUSH_CNT         at 0 range 23 .. 31;
   end record;

   --  Generate NACK. This NACK generation only occurs when DW_apb_i2c is a
   --  slave-receiver. If this register is set to a value of 1, it can only
   --  generate a NACK after a data byte is received; hence, the data transfer
   --  is aborted and the data received is not pushed to the receive
   --  buffer.\n\n When the register is set to a value of 0, it generates
   --  NACK/ACK, depending on normal criteria. - 1: generate NACK after data
   --  byte received - 0: generate NACK/ACK normally Reset value: 0x0
   type IC_SLV_DATA_NACK_ONLY_NACK_Field is
     (--  Slave receiver generates NACK normally
      DISABLED,
      --  Slave receiver generates NACK upon data reception only
      ENABLED)
     with Size => 1;
   for IC_SLV_DATA_NACK_ONLY_NACK_Field use
     (DISABLED => 0,
      ENABLED => 1);

   --  Generate Slave Data NACK Register\n\n The register is used to generate a
   --  NACK for the data part of a transfer when DW_apb_i2c is acting as a
   --  slave-receiver. This register only exists when the IC_SLV_DATA_NACK_ONLY
   --  parameter is set to 1. When this parameter disabled, this register does
   --  not exist and writing to the register's address has no effect.\n\n A
   --  write can occur on this register if both of the following conditions are
   --  met: - DW_apb_i2c is disabled (IC_ENABLE[0] = 0) - Slave part is
   --  inactive (IC_STATUS[6] = 0) Note: The IC_STATUS[6] is a register
   --  read-back location for the internal slv_activity signal; the user should
   --  poll this before writing the ic_slv_data_nack_only bit.
   type IC_SLV_DATA_NACK_ONLY_Register is record
      --  Generate NACK. This NACK generation only occurs when DW_apb_i2c is a
      --  slave-receiver. If this register is set to a value of 1, it can only
      --  generate a NACK after a data byte is received; hence, the data
      --  transfer is aborted and the data received is not pushed to the
      --  receive buffer.\n\n When the register is set to a value of 0, it
      --  generates NACK/ACK, depending on normal criteria. - 1: generate NACK
      --  after data byte received - 0: generate NACK/ACK normally Reset value:
      --  0x0
      NACK          : IC_SLV_DATA_NACK_ONLY_NACK_Field :=
                       RP2040_SVD.I2C1.DISABLED;
      --  unspecified
      Reserved_1_31 : HAL.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_SLV_DATA_NACK_ONLY_Register use record
      NACK          at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Receive DMA Enable. This bit enables/disables the receive FIFO DMA
   --  channel. Reset value: 0x0
   type IC_DMA_CR_RDMAE_Field is
     (--  Receive FIFO DMA channel disabled
      DISABLED,
      --  Receive FIFO DMA channel enabled
      ENABLED)
     with Size => 1;
   for IC_DMA_CR_RDMAE_Field use
     (DISABLED => 0,
      ENABLED => 1);

   --  Transmit DMA Enable. This bit enables/disables the transmit FIFO DMA
   --  channel. Reset value: 0x0
   type IC_DMA_CR_TDMAE_Field is
     (--  transmit FIFO DMA channel disabled
      DISABLED,
      --  Transmit FIFO DMA channel enabled
      ENABLED)
     with Size => 1;
   for IC_DMA_CR_TDMAE_Field use
     (DISABLED => 0,
      ENABLED => 1);

   --  DMA Control Register\n\n The register is used to enable the DMA
   --  Controller interface operation. There is a separate bit for transmit and
   --  receive. This can be programmed regardless of the state of IC_ENABLE.
   type IC_DMA_CR_Register is record
      --  Receive DMA Enable. This bit enables/disables the receive FIFO DMA
      --  channel. Reset value: 0x0
      RDMAE         : IC_DMA_CR_RDMAE_Field := RP2040_SVD.I2C1.DISABLED;
      --  Transmit DMA Enable. This bit enables/disables the transmit FIFO DMA
      --  channel. Reset value: 0x0
      TDMAE         : IC_DMA_CR_TDMAE_Field := RP2040_SVD.I2C1.DISABLED;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_DMA_CR_Register use record
      RDMAE         at 0 range 0 .. 0;
      TDMAE         at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype IC_DMA_TDLR_DMATDL_Field is HAL.UInt4;

   --  DMA Transmit Data Level Register
   type IC_DMA_TDLR_Register is record
      --  Transmit Data Level. This bit field controls the level at which a DMA
      --  request is made by the transmit logic. It is equal to the watermark
      --  level; that is, the dma_tx_req signal is generated when the number of
      --  valid data entries in the transmit FIFO is equal to or below this
      --  field value, and TDMAE = 1.\n\n Reset value: 0x0
      DMATDL        : IC_DMA_TDLR_DMATDL_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_DMA_TDLR_Register use record
      DMATDL        at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype IC_DMA_RDLR_DMARDL_Field is HAL.UInt4;

   --  I2C Receive Data Level Register
   type IC_DMA_RDLR_Register is record
      --  Receive Data Level. This bit field controls the level at which a DMA
      --  request is made by the receive logic. The watermark level = DMARDL+1;
      --  that is, dma_rx_req is generated when the number of valid data
      --  entries in the receive FIFO is equal to or more than this field value
      --  + 1, and RDMAE =1. For instance, when DMARDL is 0, then dma_rx_req is
      --  asserted when 1 or more data entries are present in the receive
      --  FIFO.\n\n Reset value: 0x0
      DMARDL        : IC_DMA_RDLR_DMARDL_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_DMA_RDLR_Register use record
      DMARDL        at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype IC_SDA_SETUP_SDA_SETUP_Field is HAL.UInt8;

   --  I2C SDA Setup Register\n\n This register controls the amount of time
   --  delay (in terms of number of ic_clk clock periods) introduced in the
   --  rising edge of SCL - relative to SDA changing - when DW_apb_i2c services
   --  a read request in a slave-transmitter operation. The relevant I2C
   --  requirement is tSU:DAT (note 4) as detailed in the I2C Bus
   --  Specification. This register must be programmed with a value equal to or
   --  greater than 2.\n\n Writes to this register succeed only when
   --  IC_ENABLE[0] = 0.\n\n Note: The length of setup time is calculated using
   --  [(IC_SDA_SETUP - 1) * (ic_clk_period)], so if the user requires 10
   --  ic_clk periods of setup time, they should program a value of 11. The
   --  IC_SDA_SETUP register is only used by the DW_apb_i2c when operating as a
   --  slave transmitter.
   type IC_SDA_SETUP_Register is record
      --  SDA Setup. It is recommended that if the required delay is 1000ns,
      --  then for an ic_clk frequency of 10 MHz, IC_SDA_SETUP should be
      --  programmed to a value of 11. IC_SDA_SETUP must be programmed with a
      --  minimum value of 2.
      SDA_SETUP     : IC_SDA_SETUP_SDA_SETUP_Field := 16#64#;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_SDA_SETUP_Register use record
      SDA_SETUP     at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  ACK General Call. When set to 1, DW_apb_i2c responds with a ACK (by
   --  asserting ic_data_oe) when it receives a General Call. Otherwise,
   --  DW_apb_i2c responds with a NACK (by negating ic_data_oe).
   type IC_ACK_GENERAL_CALL_ACK_GEN_CALL_Field is
     (--  Generate NACK for a General Call
      DISABLED,
      --  Generate ACK for a General Call
      ENABLED)
     with Size => 1;
   for IC_ACK_GENERAL_CALL_ACK_GEN_CALL_Field use
     (DISABLED => 0,
      ENABLED => 1);

   --  I2C ACK General Call Register\n\n The register controls whether
   --  DW_apb_i2c responds with a ACK or NACK when it receives an I2C General
   --  Call address.\n\n This register is applicable only when the DW_apb_i2c
   --  is in slave mode.
   type IC_ACK_GENERAL_CALL_Register is record
      --  ACK General Call. When set to 1, DW_apb_i2c responds with a ACK (by
      --  asserting ic_data_oe) when it receives a General Call. Otherwise,
      --  DW_apb_i2c responds with a NACK (by negating ic_data_oe).
      ACK_GEN_CALL  : IC_ACK_GENERAL_CALL_ACK_GEN_CALL_Field :=
                       RP2040_SVD.I2C1.ENABLED;
      --  unspecified
      Reserved_1_31 : HAL.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_ACK_GENERAL_CALL_Register use record
      ACK_GEN_CALL  at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  ic_en Status. This bit always reflects the value driven on the output
   --  port ic_en. - When read as 1, DW_apb_i2c is deemed to be in an enabled
   --  state. - When read as 0, DW_apb_i2c is deemed completely inactive. Note:
   --  The CPU can safely read this bit anytime. When this bit is read as 0,
   --  the CPU can safely read SLV_RX_DATA_LOST (bit 2) and
   --  SLV_DISABLED_WHILE_BUSY (bit 1).\n\n Reset value: 0x0
   type IC_ENABLE_STATUS_IC_EN_Field is
     (--  I2C disabled
      DISABLED,
      --  I2C enabled
      ENABLED)
     with Size => 1;
   for IC_ENABLE_STATUS_IC_EN_Field use
     (DISABLED => 0,
      ENABLED => 1);

   --  Slave Disabled While Busy (Transmit, Receive). This bit indicates if a
   --  potential or active Slave operation has been aborted due to the setting
   --  bit 0 of the IC_ENABLE register from 1 to 0. This bit is set when the
   --  CPU writes a 0 to the IC_ENABLE register while:\n\n (a) DW_apb_i2c is
   --  receiving the address byte of the Slave-Transmitter operation from a
   --  remote master;\n\n OR,\n\n (b) address and data bytes of the
   --  Slave-Receiver operation from a remote master.\n\n When read as 1,
   --  DW_apb_i2c is deemed to have forced a NACK during any part of an I2C
   --  transfer, irrespective of whether the I2C address matches the slave
   --  address set in DW_apb_i2c (IC_SAR register) OR if the transfer is
   --  completed before IC_ENABLE is set to 0 but has not taken effect.\n\n
   --  Note: If the remote I2C master terminates the transfer with a STOP
   --  condition before the DW_apb_i2c has a chance to NACK a transfer, and
   --  IC_ENABLE[0] has been set to 0, then this bit will also be set to 1.\n\n
   --  When read as 0, DW_apb_i2c is deemed to have been disabled when there is
   --  master activity, or when the I2C bus is idle.\n\n Note: The CPU can
   --  safely read this bit when IC_EN (bit 0) is read as 0.\n\n Reset value:
   --  0x0
   type IC_ENABLE_STATUS_SLV_DISABLED_WHILE_BUSY_Field is
     (--  Slave is disabled when it is idle
      INACTIVE,
      --  Slave is disabled when it is active
      ACTIVE)
     with Size => 1;
   for IC_ENABLE_STATUS_SLV_DISABLED_WHILE_BUSY_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  Slave Received Data Lost. This bit indicates if a Slave-Receiver
   --  operation has been aborted with at least one data byte received from an
   --  I2C transfer due to the setting bit 0 of IC_ENABLE from 1 to 0. When
   --  read as 1, DW_apb_i2c is deemed to have been actively engaged in an
   --  aborted I2C transfer (with matching address) and the data phase of the
   --  I2C transfer has been entered, even though a data byte has been
   --  responded with a NACK.\n\n Note: If the remote I2C master terminates the
   --  transfer with a STOP condition before the DW_apb_i2c has a chance to
   --  NACK a transfer, and IC_ENABLE[0] has been set to 0, then this bit is
   --  also set to 1.\n\n When read as 0, DW_apb_i2c is deemed to have been
   --  disabled without being actively involved in the data phase of a
   --  Slave-Receiver transfer.\n\n Note: The CPU can safely read this bit when
   --  IC_EN (bit 0) is read as 0.\n\n Reset value: 0x0
   type IC_ENABLE_STATUS_SLV_RX_DATA_LOST_Field is
     (--  Slave RX Data is not lost
      INACTIVE,
      --  Slave RX Data is lost
      ACTIVE)
     with Size => 1;
   for IC_ENABLE_STATUS_SLV_RX_DATA_LOST_Field use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  I2C Enable Status Register\n\n The register is used to report the
   --  DW_apb_i2c hardware status when the IC_ENABLE[0] register is set from 1
   --  to 0; that is, when DW_apb_i2c is disabled.\n\n If IC_ENABLE[0] has been
   --  set to 1, bits 2:1 are forced to 0, and bit 0 is forced to 1.\n\n If
   --  IC_ENABLE[0] has been set to 0, bits 2:1 is only be valid as soon as bit
   --  0 is read as '0'.\n\n Note: When IC_ENABLE[0] has been set to 0, a delay
   --  occurs for bit 0 to be read as 0 because disabling the DW_apb_i2c
   --  depends on I2C bus activities.
   type IC_ENABLE_STATUS_Register is record
      --  Read-only. ic_en Status. This bit always reflects the value driven on
      --  the output port ic_en. - When read as 1, DW_apb_i2c is deemed to be
      --  in an enabled state. - When read as 0, DW_apb_i2c is deemed
      --  completely inactive. Note: The CPU can safely read this bit anytime.
      --  When this bit is read as 0, the CPU can safely read SLV_RX_DATA_LOST
      --  (bit 2) and SLV_DISABLED_WHILE_BUSY (bit 1).\n\n Reset value: 0x0
      IC_EN                   : IC_ENABLE_STATUS_IC_EN_Field;
      --  Read-only. Slave Disabled While Busy (Transmit, Receive). This bit
      --  indicates if a potential or active Slave operation has been aborted
      --  due to the setting bit 0 of the IC_ENABLE register from 1 to 0. This
      --  bit is set when the CPU writes a 0 to the IC_ENABLE register
      --  while:\n\n (a) DW_apb_i2c is receiving the address byte of the
      --  Slave-Transmitter operation from a remote master;\n\n OR,\n\n (b)
      --  address and data bytes of the Slave-Receiver operation from a remote
      --  master.\n\n When read as 1, DW_apb_i2c is deemed to have forced a
      --  NACK during any part of an I2C transfer, irrespective of whether the
      --  I2C address matches the slave address set in DW_apb_i2c (IC_SAR
      --  register) OR if the transfer is completed before IC_ENABLE is set to
      --  0 but has not taken effect.\n\n Note: If the remote I2C master
      --  terminates the transfer with a STOP condition before the DW_apb_i2c
      --  has a chance to NACK a transfer, and IC_ENABLE[0] has been set to 0,
      --  then this bit will also be set to 1.\n\n When read as 0, DW_apb_i2c
      --  is deemed to have been disabled when there is master activity, or
      --  when the I2C bus is idle.\n\n Note: The CPU can safely read this bit
      --  when IC_EN (bit 0) is read as 0.\n\n Reset value: 0x0
      SLV_DISABLED_WHILE_BUSY : IC_ENABLE_STATUS_SLV_DISABLED_WHILE_BUSY_Field;
      --  Read-only. Slave Received Data Lost. This bit indicates if a
      --  Slave-Receiver operation has been aborted with at least one data byte
      --  received from an I2C transfer due to the setting bit 0 of IC_ENABLE
      --  from 1 to 0. When read as 1, DW_apb_i2c is deemed to have been
      --  actively engaged in an aborted I2C transfer (with matching address)
      --  and the data phase of the I2C transfer has been entered, even though
      --  a data byte has been responded with a NACK.\n\n Note: If the remote
      --  I2C master terminates the transfer with a STOP condition before the
      --  DW_apb_i2c has a chance to NACK a transfer, and IC_ENABLE[0] has been
      --  set to 0, then this bit is also set to 1.\n\n When read as 0,
      --  DW_apb_i2c is deemed to have been disabled without being actively
      --  involved in the data phase of a Slave-Receiver transfer.\n\n Note:
      --  The CPU can safely read this bit when IC_EN (bit 0) is read as 0.\n\n
      --  Reset value: 0x0
      SLV_RX_DATA_LOST        : IC_ENABLE_STATUS_SLV_RX_DATA_LOST_Field;
      --  unspecified
      Reserved_3_31           : HAL.UInt29;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_ENABLE_STATUS_Register use record
      IC_EN                   at 0 range 0 .. 0;
      SLV_DISABLED_WHILE_BUSY at 0 range 1 .. 1;
      SLV_RX_DATA_LOST        at 0 range 2 .. 2;
      Reserved_3_31           at 0 range 3 .. 31;
   end record;

   subtype IC_FS_SPKLEN_IC_FS_SPKLEN_Field is HAL.UInt8;

   --  I2C SS, FS or FM+ spike suppression limit\n\n This register is used to
   --  store the duration, measured in ic_clk cycles, of the longest spike that
   --  is filtered out by the spike suppression logic when the component is
   --  operating in SS, FS or FM+ modes. The relevant I2C requirement is tSP
   --  (table 4) as detailed in the I2C Bus Specification. This register must
   --  be programmed with a minimum value of 1.
   type IC_FS_SPKLEN_Register is record
      --  This register must be set before any I2C bus transaction can take
      --  place to ensure stable operation. This register sets the duration,
      --  measured in ic_clk cycles, of the longest spike in the SCL or SDA
      --  lines that will be filtered out by the spike suppression logic. This
      --  register can be written only when the I2C interface is disabled which
      --  corresponds to the IC_ENABLE[0] register being set to 0. Writes at
      --  other times have no effect. The minimum valid value is 1; hardware
      --  prevents values less than this being written, and if attempted
      --  results in 1 being set. or more information, refer to 'Spike
      --  Suppression'.
      IC_FS_SPKLEN  : IC_FS_SPKLEN_IC_FS_SPKLEN_Field := 16#7#;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_FS_SPKLEN_Register use record
      IC_FS_SPKLEN  at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  Clear RESTART_DET Interrupt Register
   type IC_CLR_RESTART_DET_Register is record
      --  Read-only. Read this register to clear the RESTART_DET interrupt (bit
      --  12) of IC_RAW_INTR_STAT register.\n\n Reset value: 0x0
      CLR_RESTART_DET : Boolean;
      --  unspecified
      Reserved_1_31   : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_CLR_RESTART_DET_Register use record
      CLR_RESTART_DET at 0 range 0 .. 0;
      Reserved_1_31   at 0 range 1 .. 31;
   end record;

   subtype IC_COMP_PARAM_1_APB_DATA_WIDTH_Field is HAL.UInt2;
   subtype IC_COMP_PARAM_1_MAX_SPEED_MODE_Field is HAL.UInt2;
   subtype IC_COMP_PARAM_1_RX_BUFFER_DEPTH_Field is HAL.UInt8;
   subtype IC_COMP_PARAM_1_TX_BUFFER_DEPTH_Field is HAL.UInt8;

   --  Component Parameter Register 1\n\n Note This register is not implemented
   --  and therefore reads as 0. If it was implemented it would be a constant
   --  read-only register that contains encoded information about the
   --  component's parameter settings. Fields shown below are the settings for
   --  those parameters
   type IC_COMP_PARAM_1_Register is record
      --  Read-only. APB data bus width is 32 bits
      APB_DATA_WIDTH     : IC_COMP_PARAM_1_APB_DATA_WIDTH_Field;
      --  Read-only. MAX SPEED MODE = FAST MODE
      MAX_SPEED_MODE     : IC_COMP_PARAM_1_MAX_SPEED_MODE_Field;
      --  Read-only. Programmable count values for each mode.
      HC_COUNT_VALUES    : Boolean;
      --  Read-only. COMBINED Interrupt outputs
      INTR_IO            : Boolean;
      --  Read-only. DMA handshaking signals are enabled
      HAS_DMA            : Boolean;
      --  Read-only. Encoded parameters not visible
      ADD_ENCODED_PARAMS : Boolean;
      --  Read-only. RX Buffer Depth = 16
      RX_BUFFER_DEPTH    : IC_COMP_PARAM_1_RX_BUFFER_DEPTH_Field;
      --  Read-only. TX Buffer Depth = 16
      TX_BUFFER_DEPTH    : IC_COMP_PARAM_1_TX_BUFFER_DEPTH_Field;
      --  unspecified
      Reserved_24_31     : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IC_COMP_PARAM_1_Register use record
      APB_DATA_WIDTH     at 0 range 0 .. 1;
      MAX_SPEED_MODE     at 0 range 2 .. 3;
      HC_COUNT_VALUES    at 0 range 4 .. 4;
      INTR_IO            at 0 range 5 .. 5;
      HAS_DMA            at 0 range 6 .. 6;
      ADD_ENCODED_PARAMS at 0 range 7 .. 7;
      RX_BUFFER_DEPTH    at 0 range 8 .. 15;
      TX_BUFFER_DEPTH    at 0 range 16 .. 23;
      Reserved_24_31     at 0 range 24 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  DW_apb_i2c address block
   type I2C1_Peripheral is record
      --  I2C Control Register. This register can be written only when the
      --  DW_apb_i2c is disabled, which corresponds to the IC_ENABLE[0]
      --  register being set to 0. Writes at other times have no effect.\n\n
      --  Read/Write Access: - bit 10 is read only. - bit 11 is read only - bit
      --  16 is read only - bit 17 is read only - bits 18 and 19 are read only.
      IC_CON                : aliased IC_CON_Register;
      --  I2C Target Address Register\n\n This register is 12 bits wide, and
      --  bits 31:12 are reserved. This register can be written to only when
      --  IC_ENABLE[0] is set to 0.\n\n Note: If the software or application is
      --  aware that the DW_apb_i2c is not using the TAR address for the
      --  pending commands in the Tx FIFO, then it is possible to update the
      --  TAR address even while the Tx FIFO has entries (IC_STATUS[2]= 0). -
      --  It is not necessary to perform any write to this register if
      --  DW_apb_i2c is enabled as an I2C slave only.
      IC_TAR                : aliased IC_TAR_Register;
      --  I2C Slave Address Register
      IC_SAR                : aliased IC_SAR_Register;
      --  I2C Rx/Tx Data Buffer and Command Register; this is the register the
      --  CPU writes to when filling the TX FIFO and the CPU reads from when
      --  retrieving bytes from RX FIFO.\n\n The size of the register changes
      --  as follows:\n\n Write: - 11 bits when IC_EMPTYFIFO_HOLD_MASTER_EN=1 -
      --  9 bits when IC_EMPTYFIFO_HOLD_MASTER_EN=0 Read: - 12 bits when
      --  IC_FIRST_DATA_BYTE_STATUS = 1 - 8 bits when IC_FIRST_DATA_BYTE_STATUS
      --  = 0 Note: In order for the DW_apb_i2c to continue acknowledging
      --  reads, a read command should be written for every byte that is to be
      --  received; otherwise the DW_apb_i2c will stop acknowledging.
      IC_DATA_CMD           : aliased IC_DATA_CMD_Register;
      --  Standard Speed I2C Clock SCL High Count Register
      IC_SS_SCL_HCNT        : aliased IC_SS_SCL_HCNT_Register;
      --  Standard Speed I2C Clock SCL Low Count Register
      IC_SS_SCL_LCNT        : aliased IC_SS_SCL_LCNT_Register;
      --  Fast Mode or Fast Mode Plus I2C Clock SCL High Count Register
      IC_FS_SCL_HCNT        : aliased IC_FS_SCL_HCNT_Register;
      --  Fast Mode or Fast Mode Plus I2C Clock SCL Low Count Register
      IC_FS_SCL_LCNT        : aliased IC_FS_SCL_LCNT_Register;
      --  I2C Interrupt Status Register\n\n Each bit in this register has a
      --  corresponding mask bit in the IC_INTR_MASK register. These bits are
      --  cleared by reading the matching interrupt clear register. The
      --  unmasked raw versions of these bits are available in the
      --  IC_RAW_INTR_STAT register.
      IC_INTR_STAT          : aliased IC_INTR_STAT_Register;
      --  I2C Interrupt Mask Register.\n\n These bits mask their corresponding
      --  interrupt status bits. This register is active low; a value of 0
      --  masks the interrupt, whereas a value of 1 unmasks the interrupt.
      IC_INTR_MASK          : aliased IC_INTR_MASK_Register;
      --  I2C Raw Interrupt Status Register\n\n Unlike the IC_INTR_STAT
      --  register, these bits are not masked so they always show the true
      --  status of the DW_apb_i2c.
      IC_RAW_INTR_STAT      : aliased IC_RAW_INTR_STAT_Register;
      --  I2C Receive FIFO Threshold Register
      IC_RX_TL              : aliased IC_RX_TL_Register;
      --  I2C Transmit FIFO Threshold Register
      IC_TX_TL              : aliased IC_TX_TL_Register;
      --  Clear Combined and Individual Interrupt Register
      IC_CLR_INTR           : aliased IC_CLR_INTR_Register;
      --  Clear RX_UNDER Interrupt Register
      IC_CLR_RX_UNDER       : aliased IC_CLR_RX_UNDER_Register;
      --  Clear RX_OVER Interrupt Register
      IC_CLR_RX_OVER        : aliased IC_CLR_RX_OVER_Register;
      --  Clear TX_OVER Interrupt Register
      IC_CLR_TX_OVER        : aliased IC_CLR_TX_OVER_Register;
      --  Clear RD_REQ Interrupt Register
      IC_CLR_RD_REQ         : aliased IC_CLR_RD_REQ_Register;
      --  Clear TX_ABRT Interrupt Register
      IC_CLR_TX_ABRT        : aliased IC_CLR_TX_ABRT_Register;
      --  Clear RX_DONE Interrupt Register
      IC_CLR_RX_DONE        : aliased IC_CLR_RX_DONE_Register;
      --  Clear ACTIVITY Interrupt Register
      IC_CLR_ACTIVITY       : aliased IC_CLR_ACTIVITY_Register;
      --  Clear STOP_DET Interrupt Register
      IC_CLR_STOP_DET       : aliased IC_CLR_STOP_DET_Register;
      --  Clear START_DET Interrupt Register
      IC_CLR_START_DET      : aliased IC_CLR_START_DET_Register;
      --  Clear GEN_CALL Interrupt Register
      IC_CLR_GEN_CALL       : aliased IC_CLR_GEN_CALL_Register;
      --  I2C Enable Register
      IC_ENABLE             : aliased IC_ENABLE_Register;
      --  I2C Status Register\n\n This is a read-only register used to indicate
      --  the current transfer status and FIFO status. The status register may
      --  be read at any time. None of the bits in this register request an
      --  interrupt.\n\n When the I2C is disabled by writing 0 in bit 0 of the
      --  IC_ENABLE register: - Bits 1 and 2 are set to 1 - Bits 3 and 10 are
      --  set to 0 When the master or slave state machines goes to idle and
      --  ic_en=0: - Bits 5 and 6 are set to 0
      IC_STATUS             : aliased IC_STATUS_Register;
      --  I2C Transmit FIFO Level Register This register contains the number of
      --  valid data entries in the transmit FIFO buffer. It is cleared
      --  whenever: - The I2C is disabled - There is a transmit abort - that
      --  is, TX_ABRT bit is set in the IC_RAW_INTR_STAT register - The slave
      --  bulk transmit mode is aborted The register increments whenever data
      --  is placed into the transmit FIFO and decrements when data is taken
      --  from the transmit FIFO.
      IC_TXFLR              : aliased IC_TXFLR_Register;
      --  I2C Receive FIFO Level Register This register contains the number of
      --  valid data entries in the receive FIFO buffer. It is cleared
      --  whenever: - The I2C is disabled - Whenever there is a transmit abort
      --  caused by any of the events tracked in IC_TX_ABRT_SOURCE The register
      --  increments whenever data is placed into the receive FIFO and
      --  decrements when data is taken from the receive FIFO.
      IC_RXFLR              : aliased IC_RXFLR_Register;
      --  I2C SDA Hold Time Length Register\n\n The bits [15:0] of this
      --  register are used to control the hold time of SDA during transmit in
      --  both slave and master mode (after SCL goes from HIGH to LOW).\n\n The
      --  bits [23:16] of this register are used to extend the SDA transition
      --  (if any) whenever SCL is HIGH in the receiver in either master or
      --  slave mode.\n\n Writes to this register succeed only when
      --  IC_ENABLE[0]=0.\n\n The values in this register are in units of
      --  ic_clk period. The value programmed in IC_SDA_TX_HOLD must be greater
      --  than the minimum hold time in each mode one cycle in master mode,
      --  seven cycles in slave mode for the value to be implemented.\n\n The
      --  programmed SDA hold time during transmit (IC_SDA_TX_HOLD) cannot
      --  exceed at any time the duration of the low part of scl. Therefore the
      --  programmed value cannot be larger than N_SCL_LOW-2, where N_SCL_LOW
      --  is the duration of the low part of the scl period measured in ic_clk
      --  cycles.
      IC_SDA_HOLD           : aliased IC_SDA_HOLD_Register;
      --  I2C Transmit Abort Source Register\n\n This register has 32 bits that
      --  indicate the source of the TX_ABRT bit. Except for Bit 9, this
      --  register is cleared whenever the IC_CLR_TX_ABRT register or the
      --  IC_CLR_INTR register is read. To clear Bit 9, the source of the
      --  ABRT_SBYTE_NORSTRT must be fixed first; RESTART must be enabled
      --  (IC_CON[5]=1), the SPECIAL bit must be cleared (IC_TAR[11]), or the
      --  GC_OR_START bit must be cleared (IC_TAR[10]).\n\n Once the source of
      --  the ABRT_SBYTE_NORSTRT is fixed, then this bit can be cleared in the
      --  same manner as other bits in this register. If the source of the
      --  ABRT_SBYTE_NORSTRT is not fixed before attempting to clear this bit,
      --  Bit 9 clears for one cycle and is then re-asserted.
      IC_TX_ABRT_SOURCE     : aliased IC_TX_ABRT_SOURCE_Register;
      --  Generate Slave Data NACK Register\n\n The register is used to
      --  generate a NACK for the data part of a transfer when DW_apb_i2c is
      --  acting as a slave-receiver. This register only exists when the
      --  IC_SLV_DATA_NACK_ONLY parameter is set to 1. When this parameter
      --  disabled, this register does not exist and writing to the register's
      --  address has no effect.\n\n A write can occur on this register if both
      --  of the following conditions are met: - DW_apb_i2c is disabled
      --  (IC_ENABLE[0] = 0) - Slave part is inactive (IC_STATUS[6] = 0) Note:
      --  The IC_STATUS[6] is a register read-back location for the internal
      --  slv_activity signal; the user should poll this before writing the
      --  ic_slv_data_nack_only bit.
      IC_SLV_DATA_NACK_ONLY : aliased IC_SLV_DATA_NACK_ONLY_Register;
      --  DMA Control Register\n\n The register is used to enable the DMA
      --  Controller interface operation. There is a separate bit for transmit
      --  and receive. This can be programmed regardless of the state of
      --  IC_ENABLE.
      IC_DMA_CR             : aliased IC_DMA_CR_Register;
      --  DMA Transmit Data Level Register
      IC_DMA_TDLR           : aliased IC_DMA_TDLR_Register;
      --  I2C Receive Data Level Register
      IC_DMA_RDLR           : aliased IC_DMA_RDLR_Register;
      --  I2C SDA Setup Register\n\n This register controls the amount of time
      --  delay (in terms of number of ic_clk clock periods) introduced in the
      --  rising edge of SCL - relative to SDA changing - when DW_apb_i2c
      --  services a read request in a slave-transmitter operation. The
      --  relevant I2C requirement is tSU:DAT (note 4) as detailed in the I2C
      --  Bus Specification. This register must be programmed with a value
      --  equal to or greater than 2.\n\n Writes to this register succeed only
      --  when IC_ENABLE[0] = 0.\n\n Note: The length of setup time is
      --  calculated using [(IC_SDA_SETUP - 1) * (ic_clk_period)], so if the
      --  user requires 10 ic_clk periods of setup time, they should program a
      --  value of 11. The IC_SDA_SETUP register is only used by the DW_apb_i2c
      --  when operating as a slave transmitter.
      IC_SDA_SETUP          : aliased IC_SDA_SETUP_Register;
      --  I2C ACK General Call Register\n\n The register controls whether
      --  DW_apb_i2c responds with a ACK or NACK when it receives an I2C
      --  General Call address.\n\n This register is applicable only when the
      --  DW_apb_i2c is in slave mode.
      IC_ACK_GENERAL_CALL   : aliased IC_ACK_GENERAL_CALL_Register;
      --  I2C Enable Status Register\n\n The register is used to report the
      --  DW_apb_i2c hardware status when the IC_ENABLE[0] register is set from
      --  1 to 0; that is, when DW_apb_i2c is disabled.\n\n If IC_ENABLE[0] has
      --  been set to 1, bits 2:1 are forced to 0, and bit 0 is forced to
      --  1.\n\n If IC_ENABLE[0] has been set to 0, bits 2:1 is only be valid
      --  as soon as bit 0 is read as '0'.\n\n Note: When IC_ENABLE[0] has been
      --  set to 0, a delay occurs for bit 0 to be read as 0 because disabling
      --  the DW_apb_i2c depends on I2C bus activities.
      IC_ENABLE_STATUS      : aliased IC_ENABLE_STATUS_Register;
      --  I2C SS, FS or FM+ spike suppression limit\n\n This register is used
      --  to store the duration, measured in ic_clk cycles, of the longest
      --  spike that is filtered out by the spike suppression logic when the
      --  component is operating in SS, FS or FM+ modes. The relevant I2C
      --  requirement is tSP (table 4) as detailed in the I2C Bus
      --  Specification. This register must be programmed with a minimum value
      --  of 1.
      IC_FS_SPKLEN          : aliased IC_FS_SPKLEN_Register;
      --  Clear RESTART_DET Interrupt Register
      IC_CLR_RESTART_DET    : aliased IC_CLR_RESTART_DET_Register;
      --  Component Parameter Register 1\n\n Note This register is not
      --  implemented and therefore reads as 0. If it was implemented it would
      --  be a constant read-only register that contains encoded information
      --  about the component's parameter settings. Fields shown below are the
      --  settings for those parameters
      IC_COMP_PARAM_1       : aliased IC_COMP_PARAM_1_Register;
      --  I2C Component Version Register
      IC_COMP_VERSION       : aliased HAL.UInt32;
      --  I2C Component Type Register
      IC_COMP_TYPE          : aliased HAL.UInt32;
   end record
     with Volatile;

   for I2C1_Peripheral use record
      IC_CON                at 16#0# range 0 .. 31;
      IC_TAR                at 16#4# range 0 .. 31;
      IC_SAR                at 16#8# range 0 .. 31;
      IC_DATA_CMD           at 16#10# range 0 .. 31;
      IC_SS_SCL_HCNT        at 16#14# range 0 .. 31;
      IC_SS_SCL_LCNT        at 16#18# range 0 .. 31;
      IC_FS_SCL_HCNT        at 16#1C# range 0 .. 31;
      IC_FS_SCL_LCNT        at 16#20# range 0 .. 31;
      IC_INTR_STAT          at 16#2C# range 0 .. 31;
      IC_INTR_MASK          at 16#30# range 0 .. 31;
      IC_RAW_INTR_STAT      at 16#34# range 0 .. 31;
      IC_RX_TL              at 16#38# range 0 .. 31;
      IC_TX_TL              at 16#3C# range 0 .. 31;
      IC_CLR_INTR           at 16#40# range 0 .. 31;
      IC_CLR_RX_UNDER       at 16#44# range 0 .. 31;
      IC_CLR_RX_OVER        at 16#48# range 0 .. 31;
      IC_CLR_TX_OVER        at 16#4C# range 0 .. 31;
      IC_CLR_RD_REQ         at 16#50# range 0 .. 31;
      IC_CLR_TX_ABRT        at 16#54# range 0 .. 31;
      IC_CLR_RX_DONE        at 16#58# range 0 .. 31;
      IC_CLR_ACTIVITY       at 16#5C# range 0 .. 31;
      IC_CLR_STOP_DET       at 16#60# range 0 .. 31;
      IC_CLR_START_DET      at 16#64# range 0 .. 31;
      IC_CLR_GEN_CALL       at 16#68# range 0 .. 31;
      IC_ENABLE             at 16#6C# range 0 .. 31;
      IC_STATUS             at 16#70# range 0 .. 31;
      IC_TXFLR              at 16#74# range 0 .. 31;
      IC_RXFLR              at 16#78# range 0 .. 31;
      IC_SDA_HOLD           at 16#7C# range 0 .. 31;
      IC_TX_ABRT_SOURCE     at 16#80# range 0 .. 31;
      IC_SLV_DATA_NACK_ONLY at 16#84# range 0 .. 31;
      IC_DMA_CR             at 16#88# range 0 .. 31;
      IC_DMA_TDLR           at 16#8C# range 0 .. 31;
      IC_DMA_RDLR           at 16#90# range 0 .. 31;
      IC_SDA_SETUP          at 16#94# range 0 .. 31;
      IC_ACK_GENERAL_CALL   at 16#98# range 0 .. 31;
      IC_ENABLE_STATUS      at 16#9C# range 0 .. 31;
      IC_FS_SPKLEN          at 16#A0# range 0 .. 31;
      IC_CLR_RESTART_DET    at 16#A8# range 0 .. 31;
      IC_COMP_PARAM_1       at 16#F4# range 0 .. 31;
      IC_COMP_VERSION       at 16#F8# range 0 .. 31;
      IC_COMP_TYPE          at 16#FC# range 0 .. 31;
   end record;

   --  DW_apb_i2c address block
   I2C1_Periph : aliased I2C1_Peripheral
     with Import, Address => I2C1_Base;

end RP2040_SVD.I2C1;
