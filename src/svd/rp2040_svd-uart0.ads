pragma Style_Checks (Off);

--  Copyright (c) 2020 Raspberry Pi (Trading) Ltd.
--
--  SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2040.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package RP2040_SVD.UART0 is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype UARTDR_DATA_Field is HAL.UInt8;

   --  Data Register, UARTDR
   type UARTDR_Register is record
      --  Receive (read) data character. Transmit (write) data character.
      DATA           : UARTDR_DATA_Field := 16#0#;
      --  Read-only. Framing error. When set to 1, it indicates that the
      --  received character did not have a valid stop bit (a valid stop bit is
      --  1). In FIFO mode, this error is associated with the character at the
      --  top of the FIFO.
      FE             : Boolean := False;
      --  Read-only. Parity error. When set to 1, it indicates that the parity
      --  of the received data character does not match the parity that the EPS
      --  and SPS bits in the Line Control Register, UARTLCR_H. In FIFO mode,
      --  this error is associated with the character at the top of the FIFO.
      PE             : Boolean := False;
      --  Read-only. Break error. This bit is set to 1 if a break condition was
      --  detected, indicating that the received data input was held LOW for
      --  longer than a full-word transmission time (defined as start, data,
      --  parity and stop bits). In FIFO mode, this error is associated with
      --  the character at the top of the FIFO. When a break occurs, only one 0
      --  character is loaded into the FIFO. The next character is only enabled
      --  after the receive data input goes to a 1 (marking state), and the
      --  next valid start bit is received.
      BE             : Boolean := False;
      --  Read-only. Overrun error. This bit is set to 1 if data is received
      --  and the receive FIFO is already full. This is cleared to 0 once there
      --  is an empty space in the FIFO and a new character can be written to
      --  it.
      OE             : Boolean := False;
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for UARTDR_Register use record
      DATA           at 0 range 0 .. 7;
      FE             at 0 range 8 .. 8;
      PE             at 0 range 9 .. 9;
      BE             at 0 range 10 .. 10;
      OE             at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   --  Receive Status Register/Error Clear Register, UARTRSR/UARTECR
   type UARTRSR_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Framing error. When set to 1, it indicates that the
      --  received character did not have a valid stop bit (a valid stop bit is
      --  1). This bit is cleared to 0 by a write to UARTECR. In FIFO mode,
      --  this error is associated with the character at the top of the FIFO.
      FE            : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Parity error. When set to 1, it indicates that the
      --  parity of the received data character does not match the parity that
      --  the EPS and SPS bits in the Line Control Register, UARTLCR_H. This
      --  bit is cleared to 0 by a write to UARTECR. In FIFO mode, this error
      --  is associated with the character at the top of the FIFO.
      PE            : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Break error. This bit is set to 1 if a break condition
      --  was detected, indicating that the received data input was held LOW
      --  for longer than a full-word transmission time (defined as start,
      --  data, parity, and stop bits). This bit is cleared to 0 after a write
      --  to UARTECR. In FIFO mode, this error is associated with the character
      --  at the top of the FIFO. When a break occurs, only one 0 character is
      --  loaded into the FIFO. The next character is only enabled after the
      --  receive data input goes to a 1 (marking state) and the next valid
      --  start bit is received.
      BE            : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Overrun error. This bit is set to 1 if data is received
      --  and the FIFO is already full. This bit is cleared to 0 by a write to
      --  UARTECR. The FIFO contents remain valid because no more data is
      --  written when the FIFO is full, only the contents of the shift
      --  register are overwritten. The CPU must now read the data, to empty
      --  the FIFO.
      OE            : Boolean := False;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for UARTRSR_Register use record
      FE            at 0 range 0 .. 0;
      PE            at 0 range 1 .. 1;
      BE            at 0 range 2 .. 2;
      OE            at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  Flag Register, UARTFR
   type UARTFR_Register is record
      --  Read-only. Clear to send. This bit is the complement of the UART
      --  clear to send, nUARTCTS, modem status input. That is, the bit is 1
      --  when nUARTCTS is LOW.
      CTS           : Boolean;
      --  Read-only. Data set ready. This bit is the complement of the UART
      --  data set ready, nUARTDSR, modem status input. That is, the bit is 1
      --  when nUARTDSR is LOW.
      DSR           : Boolean;
      --  Read-only. Data carrier detect. This bit is the complement of the
      --  UART data carrier detect, nUARTDCD, modem status input. That is, the
      --  bit is 1 when nUARTDCD is LOW.
      DCD           : Boolean;
      --  Read-only. UART busy. If this bit is set to 1, the UART is busy
      --  transmitting data. This bit remains set until the complete byte,
      --  including all the stop bits, has been sent from the shift register.
      --  This bit is set as soon as the transmit FIFO becomes non-empty,
      --  regardless of whether the UART is enabled or not.
      BUSY          : Boolean;
      --  Read-only. Receive FIFO empty. The meaning of this bit depends on the
      --  state of the FEN bit in the UARTLCR_H Register. If the FIFO is
      --  disabled, this bit is set when the receive holding register is empty.
      --  If the FIFO is enabled, the RXFE bit is set when the receive FIFO is
      --  empty.
      RXFE          : Boolean;
      --  Read-only. Transmit FIFO full. The meaning of this bit depends on the
      --  state of the FEN bit in the UARTLCR_H Register. If the FIFO is
      --  disabled, this bit is set when the transmit holding register is full.
      --  If the FIFO is enabled, the TXFF bit is set when the transmit FIFO is
      --  full.
      TXFF          : Boolean;
      --  Read-only. Receive FIFO full. The meaning of this bit depends on the
      --  state of the FEN bit in the UARTLCR_H Register. If the FIFO is
      --  disabled, this bit is set when the receive holding register is full.
      --  If the FIFO is enabled, the RXFF bit is set when the receive FIFO is
      --  full.
      RXFF          : Boolean;
      --  Read-only. Transmit FIFO empty. The meaning of this bit depends on
      --  the state of the FEN bit in the Line Control Register, UARTLCR_H. If
      --  the FIFO is disabled, this bit is set when the transmit holding
      --  register is empty. If the FIFO is enabled, the TXFE bit is set when
      --  the transmit FIFO is empty. This bit does not indicate if there is
      --  data in the transmit shift register.
      TXFE          : Boolean;
      --  Read-only. Ring indicator. This bit is the complement of the UART
      --  ring indicator, nUARTRI, modem status input. That is, the bit is 1
      --  when nUARTRI is LOW.
      RI            : Boolean;
      --  unspecified
      Reserved_9_31 : HAL.UInt23;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for UARTFR_Register use record
      CTS           at 0 range 0 .. 0;
      DSR           at 0 range 1 .. 1;
      DCD           at 0 range 2 .. 2;
      BUSY          at 0 range 3 .. 3;
      RXFE          at 0 range 4 .. 4;
      TXFF          at 0 range 5 .. 5;
      RXFF          at 0 range 6 .. 6;
      TXFE          at 0 range 7 .. 7;
      RI            at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype UARTILPR_ILPDVSR_Field is HAL.UInt8;

   --  IrDA Low-Power Counter Register, UARTILPR
   type UARTILPR_Register is record
      --  8-bit low-power divisor value. These bits are cleared to 0 at reset.
      ILPDVSR       : UARTILPR_ILPDVSR_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for UARTILPR_Register use record
      ILPDVSR       at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype UARTIBRD_BAUD_DIVINT_Field is HAL.UInt16;

   --  Integer Baud Rate Register, UARTIBRD
   type UARTIBRD_Register is record
      --  The integer baud rate divisor. These bits are cleared to 0 on reset.
      BAUD_DIVINT    : UARTIBRD_BAUD_DIVINT_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for UARTIBRD_Register use record
      BAUD_DIVINT    at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype UARTFBRD_BAUD_DIVFRAC_Field is HAL.UInt6;

   --  Fractional Baud Rate Register, UARTFBRD
   type UARTFBRD_Register is record
      --  The fractional baud rate divisor. These bits are cleared to 0 on
      --  reset.
      BAUD_DIVFRAC  : UARTFBRD_BAUD_DIVFRAC_Field := 16#0#;
      --  unspecified
      Reserved_6_31 : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for UARTFBRD_Register use record
      BAUD_DIVFRAC  at 0 range 0 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype UARTLCR_H_WLEN_Field is HAL.UInt2;

   --  Line Control Register, UARTLCR_H
   type UARTLCR_H_Register is record
      --  Send break. If this bit is set to 1, a low-level is continually
      --  output on the UARTTXD output, after completing transmission of the
      --  current character. For the proper execution of the break command, the
      --  software must set this bit for at least two complete frames. For
      --  normal use, this bit must be cleared to 0.
      BRK           : Boolean := False;
      --  Parity enable: 0 = parity is disabled and no parity bit added to the
      --  data frame 1 = parity checking and generation is enabled.
      PEN           : Boolean := False;
      --  Even parity select. Controls the type of parity the UART uses during
      --  transmission and reception: 0 = odd parity. The UART generates or
      --  checks for an odd number of 1s in the data and parity bits. 1 = even
      --  parity. The UART generates or checks for an even number of 1s in the
      --  data and parity bits. This bit has no effect when the PEN bit
      --  disables parity checking and generation.
      EPS           : Boolean := False;
      --  Two stop bits select. If this bit is set to 1, two stop bits are
      --  transmitted at the end of the frame. The receive logic does not check
      --  for two stop bits being received.
      STP2          : Boolean := False;
      --  Enable FIFOs: 0 = FIFOs are disabled (character mode) that is, the
      --  FIFOs become 1-byte-deep holding registers 1 = transmit and receive
      --  FIFO buffers are enabled (FIFO mode).
      FEN           : Boolean := False;
      --  Word length. These bits indicate the number of data bits transmitted
      --  or received in a frame as follows: b11 = 8 bits b10 = 7 bits b01 = 6
      --  bits b00 = 5 bits.
      WLEN          : UARTLCR_H_WLEN_Field := 16#0#;
      --  Stick parity select. 0 = stick parity is disabled 1 = either: * if
      --  the EPS bit is 0 then the parity bit is transmitted and checked as a
      --  1 * if the EPS bit is 1 then the parity bit is transmitted and
      --  checked as a 0. This bit has no effect when the PEN bit disables
      --  parity checking and generation.
      SPS           : Boolean := False;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for UARTLCR_H_Register use record
      BRK           at 0 range 0 .. 0;
      PEN           at 0 range 1 .. 1;
      EPS           at 0 range 2 .. 2;
      STP2          at 0 range 3 .. 3;
      FEN           at 0 range 4 .. 4;
      WLEN          at 0 range 5 .. 6;
      SPS           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  UARTCR_OUT array
   type UARTCR_OUT_Field_Array is array (1 .. 2) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for UARTCR_OUT
   type UARTCR_OUT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OUT as a value
            Val : HAL.UInt2;
         when True =>
            --  OUT as an array
            Arr : UARTCR_OUT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for UARTCR_OUT_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Control Register, UARTCR
   type UARTCR_Register is record
      --  UART enable: 0 = UART is disabled. If the UART is disabled in the
      --  middle of transmission or reception, it completes the current
      --  character before stopping. 1 = the UART is enabled. Data transmission
      --  and reception occurs for either UART signals or SIR signals depending
      --  on the setting of the SIREN bit.
      UARTEN         : Boolean := False;
      --  SIR enable: 0 = IrDA SIR ENDEC is disabled. nSIROUT remains LOW (no
      --  light pulse generated), and signal transitions on SIRIN have no
      --  effect. 1 = IrDA SIR ENDEC is enabled. Data is transmitted and
      --  received on nSIROUT and SIRIN. UARTTXD remains HIGH, in the marking
      --  state. Signal transitions on UARTRXD or modem status inputs have no
      --  effect. This bit has no effect if the UARTEN bit disables the UART.
      SIREN          : Boolean := False;
      --  SIR low-power IrDA mode. This bit selects the IrDA encoding mode. If
      --  this bit is cleared to 0, low-level bits are transmitted as an active
      --  high pulse with a width of 3 / 16th of the bit period. If this bit is
      --  set to 1, low-level bits are transmitted with a pulse width that is 3
      --  times the period of the IrLPBaud16 input signal, regardless of the
      --  selected bit rate. Setting this bit uses less power, but might reduce
      --  transmission distances.
      SIRLP          : Boolean := False;
      --  unspecified
      Reserved_3_6   : HAL.UInt4 := 16#0#;
      --  Loopback enable. If this bit is set to 1 and the SIREN bit is set to
      --  1 and the SIRTEST bit in the Test Control Register, UARTTCR is set to
      --  1, then the nSIROUT path is inverted, and fed through to the SIRIN
      --  path. The SIRTEST bit in the test register must be set to 1 to
      --  override the normal half-duplex SIR operation. This must be the
      --  requirement for accessing the test registers during normal operation,
      --  and SIRTEST must be cleared to 0 when loopback testing is finished.
      --  This feature reduces the amount of external coupling required during
      --  system test. If this bit is set to 1, and the SIRTEST bit is set to
      --  0, the UARTTXD path is fed through to the UARTRXD path. In either SIR
      --  mode or UART mode, when this bit is set, the modem outputs are also
      --  fed through to the modem inputs. This bit is cleared to 0 on reset,
      --  to disable loopback.
      LBE            : Boolean := False;
      --  Transmit enable. If this bit is set to 1, the transmit section of the
      --  UART is enabled. Data transmission occurs for either UART signals, or
      --  SIR signals depending on the setting of the SIREN bit. When the UART
      --  is disabled in the middle of transmission, it completes the current
      --  character before stopping.
      TXE            : Boolean := True;
      --  Receive enable. If this bit is set to 1, the receive section of the
      --  UART is enabled. Data reception occurs for either UART signals or SIR
      --  signals depending on the setting of the SIREN bit. When the UART is
      --  disabled in the middle of reception, it completes the current
      --  character before stopping.
      RXE            : Boolean := True;
      --  Data transmit ready. This bit is the complement of the UART data
      --  transmit ready, nUARTDTR, modem status output. That is, when the bit
      --  is programmed to a 1 then nUARTDTR is LOW.
      DTR            : Boolean := False;
      --  Request to send. This bit is the complement of the UART request to
      --  send, nUARTRTS, modem status output. That is, when the bit is
      --  programmed to a 1 then nUARTRTS is LOW.
      RTS            : Boolean := False;
      --  This bit is the complement of the UART Out1 (nUARTOut1) modem status
      --  output. That is, when the bit is programmed to a 1 the output is 0.
      --  For DTE this can be used as Data Carrier Detect (DCD).
      OUT_k          : UARTCR_OUT_Field := (As_Array => False, Val => 16#0#);
      --  RTS hardware flow control enable. If this bit is set to 1, RTS
      --  hardware flow control is enabled. Data is only requested when there
      --  is space in the receive FIFO for it to be received.
      RTSEN          : Boolean := False;
      --  CTS hardware flow control enable. If this bit is set to 1, CTS
      --  hardware flow control is enabled. Data is only transmitted when the
      --  nUARTCTS signal is asserted.
      CTSEN          : Boolean := False;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for UARTCR_Register use record
      UARTEN         at 0 range 0 .. 0;
      SIREN          at 0 range 1 .. 1;
      SIRLP          at 0 range 2 .. 2;
      Reserved_3_6   at 0 range 3 .. 6;
      LBE            at 0 range 7 .. 7;
      TXE            at 0 range 8 .. 8;
      RXE            at 0 range 9 .. 9;
      DTR            at 0 range 10 .. 10;
      RTS            at 0 range 11 .. 11;
      OUT_k          at 0 range 12 .. 13;
      RTSEN          at 0 range 14 .. 14;
      CTSEN          at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype UARTIFLS_TXIFLSEL_Field is HAL.UInt3;
   subtype UARTIFLS_RXIFLSEL_Field is HAL.UInt3;

   --  Interrupt FIFO Level Select Register, UARTIFLS
   type UARTIFLS_Register is record
      --  Transmit interrupt FIFO level select. The trigger points for the
      --  transmit interrupt are as follows: b000 = Transmit FIFO becomes <= 1
      --  / 8 full b001 = Transmit FIFO becomes <= 1 / 4 full b010 = Transmit
      --  FIFO becomes <= 1 / 2 full b011 = Transmit FIFO becomes <= 3 / 4 full
      --  b100 = Transmit FIFO becomes <= 7 / 8 full b101-b111 = reserved.
      TXIFLSEL      : UARTIFLS_TXIFLSEL_Field := 16#2#;
      --  Receive interrupt FIFO level select. The trigger points for the
      --  receive interrupt are as follows: b000 = Receive FIFO becomes >= 1 /
      --  8 full b001 = Receive FIFO becomes >= 1 / 4 full b010 = Receive FIFO
      --  becomes >= 1 / 2 full b011 = Receive FIFO becomes >= 3 / 4 full b100
      --  = Receive FIFO becomes >= 7 / 8 full b101-b111 = reserved.
      RXIFLSEL      : UARTIFLS_RXIFLSEL_Field := 16#2#;
      --  unspecified
      Reserved_6_31 : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for UARTIFLS_Register use record
      TXIFLSEL      at 0 range 0 .. 2;
      RXIFLSEL      at 0 range 3 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   --  Interrupt Mask Set/Clear Register, UARTIMSC
   type UARTIMSC_Register is record
      --  nUARTRI modem interrupt mask. A read returns the current mask for the
      --  UARTRIINTR interrupt. On a write of 1, the mask of the UARTRIINTR
      --  interrupt is set. A write of 0 clears the mask.
      RIMIM          : Boolean := False;
      --  nUARTCTS modem interrupt mask. A read returns the current mask for
      --  the UARTCTSINTR interrupt. On a write of 1, the mask of the
      --  UARTCTSINTR interrupt is set. A write of 0 clears the mask.
      CTSMIM         : Boolean := False;
      --  nUARTDCD modem interrupt mask. A read returns the current mask for
      --  the UARTDCDINTR interrupt. On a write of 1, the mask of the
      --  UARTDCDINTR interrupt is set. A write of 0 clears the mask.
      DCDMIM         : Boolean := False;
      --  nUARTDSR modem interrupt mask. A read returns the current mask for
      --  the UARTDSRINTR interrupt. On a write of 1, the mask of the
      --  UARTDSRINTR interrupt is set. A write of 0 clears the mask.
      DSRMIM         : Boolean := False;
      --  Receive interrupt mask. A read returns the current mask for the
      --  UARTRXINTR interrupt. On a write of 1, the mask of the UARTRXINTR
      --  interrupt is set. A write of 0 clears the mask.
      RXIM           : Boolean := False;
      --  Transmit interrupt mask. A read returns the current mask for the
      --  UARTTXINTR interrupt. On a write of 1, the mask of the UARTTXINTR
      --  interrupt is set. A write of 0 clears the mask.
      TXIM           : Boolean := False;
      --  Receive timeout interrupt mask. A read returns the current mask for
      --  the UARTRTINTR interrupt. On a write of 1, the mask of the UARTRTINTR
      --  interrupt is set. A write of 0 clears the mask.
      RTIM           : Boolean := False;
      --  Framing error interrupt mask. A read returns the current mask for the
      --  UARTFEINTR interrupt. On a write of 1, the mask of the UARTFEINTR
      --  interrupt is set. A write of 0 clears the mask.
      FEIM           : Boolean := False;
      --  Parity error interrupt mask. A read returns the current mask for the
      --  UARTPEINTR interrupt. On a write of 1, the mask of the UARTPEINTR
      --  interrupt is set. A write of 0 clears the mask.
      PEIM           : Boolean := False;
      --  Break error interrupt mask. A read returns the current mask for the
      --  UARTBEINTR interrupt. On a write of 1, the mask of the UARTBEINTR
      --  interrupt is set. A write of 0 clears the mask.
      BEIM           : Boolean := False;
      --  Overrun error interrupt mask. A read returns the current mask for the
      --  UARTOEINTR interrupt. On a write of 1, the mask of the UARTOEINTR
      --  interrupt is set. A write of 0 clears the mask.
      OEIM           : Boolean := False;
      --  unspecified
      Reserved_11_31 : HAL.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for UARTIMSC_Register use record
      RIMIM          at 0 range 0 .. 0;
      CTSMIM         at 0 range 1 .. 1;
      DCDMIM         at 0 range 2 .. 2;
      DSRMIM         at 0 range 3 .. 3;
      RXIM           at 0 range 4 .. 4;
      TXIM           at 0 range 5 .. 5;
      RTIM           at 0 range 6 .. 6;
      FEIM           at 0 range 7 .. 7;
      PEIM           at 0 range 8 .. 8;
      BEIM           at 0 range 9 .. 9;
      OEIM           at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   --  Raw Interrupt Status Register, UARTRIS
   type UARTRIS_Register is record
      --  Read-only. nUARTRI modem interrupt status. Returns the raw interrupt
      --  state of the UARTRIINTR interrupt.
      RIRMIS         : Boolean;
      --  Read-only. nUARTCTS modem interrupt status. Returns the raw interrupt
      --  state of the UARTCTSINTR interrupt.
      CTSRMIS        : Boolean;
      --  Read-only. nUARTDCD modem interrupt status. Returns the raw interrupt
      --  state of the UARTDCDINTR interrupt.
      DCDRMIS        : Boolean;
      --  Read-only. nUARTDSR modem interrupt status. Returns the raw interrupt
      --  state of the UARTDSRINTR interrupt.
      DSRRMIS        : Boolean;
      --  Read-only. Receive interrupt status. Returns the raw interrupt state
      --  of the UARTRXINTR interrupt.
      RXRIS          : Boolean;
      --  Read-only. Transmit interrupt status. Returns the raw interrupt state
      --  of the UARTTXINTR interrupt.
      TXRIS          : Boolean;
      --  Read-only. Receive timeout interrupt status. Returns the raw
      --  interrupt state of the UARTRTINTR interrupt. a
      RTRIS          : Boolean;
      --  Read-only. Framing error interrupt status. Returns the raw interrupt
      --  state of the UARTFEINTR interrupt.
      FERIS          : Boolean;
      --  Read-only. Parity error interrupt status. Returns the raw interrupt
      --  state of the UARTPEINTR interrupt.
      PERIS          : Boolean;
      --  Read-only. Break error interrupt status. Returns the raw interrupt
      --  state of the UARTBEINTR interrupt.
      BERIS          : Boolean;
      --  Read-only. Overrun error interrupt status. Returns the raw interrupt
      --  state of the UARTOEINTR interrupt.
      OERIS          : Boolean;
      --  unspecified
      Reserved_11_31 : HAL.UInt21;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for UARTRIS_Register use record
      RIRMIS         at 0 range 0 .. 0;
      CTSRMIS        at 0 range 1 .. 1;
      DCDRMIS        at 0 range 2 .. 2;
      DSRRMIS        at 0 range 3 .. 3;
      RXRIS          at 0 range 4 .. 4;
      TXRIS          at 0 range 5 .. 5;
      RTRIS          at 0 range 6 .. 6;
      FERIS          at 0 range 7 .. 7;
      PERIS          at 0 range 8 .. 8;
      BERIS          at 0 range 9 .. 9;
      OERIS          at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   --  Masked Interrupt Status Register, UARTMIS
   type UARTMIS_Register is record
      --  Read-only. nUARTRI modem masked interrupt status. Returns the masked
      --  interrupt state of the UARTRIINTR interrupt.
      RIMMIS         : Boolean;
      --  Read-only. nUARTCTS modem masked interrupt status. Returns the masked
      --  interrupt state of the UARTCTSINTR interrupt.
      CTSMMIS        : Boolean;
      --  Read-only. nUARTDCD modem masked interrupt status. Returns the masked
      --  interrupt state of the UARTDCDINTR interrupt.
      DCDMMIS        : Boolean;
      --  Read-only. nUARTDSR modem masked interrupt status. Returns the masked
      --  interrupt state of the UARTDSRINTR interrupt.
      DSRMMIS        : Boolean;
      --  Read-only. Receive masked interrupt status. Returns the masked
      --  interrupt state of the UARTRXINTR interrupt.
      RXMIS          : Boolean;
      --  Read-only. Transmit masked interrupt status. Returns the masked
      --  interrupt state of the UARTTXINTR interrupt.
      TXMIS          : Boolean;
      --  Read-only. Receive timeout masked interrupt status. Returns the
      --  masked interrupt state of the UARTRTINTR interrupt.
      RTMIS          : Boolean;
      --  Read-only. Framing error masked interrupt status. Returns the masked
      --  interrupt state of the UARTFEINTR interrupt.
      FEMIS          : Boolean;
      --  Read-only. Parity error masked interrupt status. Returns the masked
      --  interrupt state of the UARTPEINTR interrupt.
      PEMIS          : Boolean;
      --  Read-only. Break error masked interrupt status. Returns the masked
      --  interrupt state of the UARTBEINTR interrupt.
      BEMIS          : Boolean;
      --  Read-only. Overrun error masked interrupt status. Returns the masked
      --  interrupt state of the UARTOEINTR interrupt.
      OEMIS          : Boolean;
      --  unspecified
      Reserved_11_31 : HAL.UInt21;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for UARTMIS_Register use record
      RIMMIS         at 0 range 0 .. 0;
      CTSMMIS        at 0 range 1 .. 1;
      DCDMMIS        at 0 range 2 .. 2;
      DSRMMIS        at 0 range 3 .. 3;
      RXMIS          at 0 range 4 .. 4;
      TXMIS          at 0 range 5 .. 5;
      RTMIS          at 0 range 6 .. 6;
      FEMIS          at 0 range 7 .. 7;
      PEMIS          at 0 range 8 .. 8;
      BEMIS          at 0 range 9 .. 9;
      OEMIS          at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   --  Interrupt Clear Register, UARTICR
   type UARTICR_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. nUARTRI modem interrupt clear. Clears the UARTRIINTR
      --  interrupt.
      RIMIC          : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. nUARTCTS modem interrupt clear. Clears the UARTCTSINTR
      --  interrupt.
      CTSMIC         : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. nUARTDCD modem interrupt clear. Clears the UARTDCDINTR
      --  interrupt.
      DCDMIC         : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. nUARTDSR modem interrupt clear. Clears the UARTDSRINTR
      --  interrupt.
      DSRMIC         : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Receive interrupt clear. Clears the UARTRXINTR
      --  interrupt.
      RXIC           : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Transmit interrupt clear. Clears the UARTTXINTR
      --  interrupt.
      TXIC           : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Receive timeout interrupt clear. Clears the UARTRTINTR
      --  interrupt.
      RTIC           : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Framing error interrupt clear. Clears the UARTFEINTR
      --  interrupt.
      FEIC           : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Parity error interrupt clear. Clears the UARTPEINTR
      --  interrupt.
      PEIC           : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Break error interrupt clear. Clears the UARTBEINTR
      --  interrupt.
      BEIC           : Boolean := False;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Overrun error interrupt clear. Clears the UARTOEINTR
      --  interrupt.
      OEIC           : Boolean := False;
      --  unspecified
      Reserved_11_31 : HAL.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for UARTICR_Register use record
      RIMIC          at 0 range 0 .. 0;
      CTSMIC         at 0 range 1 .. 1;
      DCDMIC         at 0 range 2 .. 2;
      DSRMIC         at 0 range 3 .. 3;
      RXIC           at 0 range 4 .. 4;
      TXIC           at 0 range 5 .. 5;
      RTIC           at 0 range 6 .. 6;
      FEIC           at 0 range 7 .. 7;
      PEIC           at 0 range 8 .. 8;
      BEIC           at 0 range 9 .. 9;
      OEIC           at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   --  DMA Control Register, UARTDMACR
   type UARTDMACR_Register is record
      --  Receive DMA enable. If this bit is set to 1, DMA for the receive FIFO
      --  is enabled.
      RXDMAE        : Boolean := False;
      --  Transmit DMA enable. If this bit is set to 1, DMA for the transmit
      --  FIFO is enabled.
      TXDMAE        : Boolean := False;
      --  DMA on error. If this bit is set to 1, the DMA receive request
      --  outputs, UARTRXDMASREQ or UARTRXDMABREQ, are disabled when the UART
      --  error interrupt is asserted.
      DMAONERR      : Boolean := False;
      --  unspecified
      Reserved_3_31 : HAL.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for UARTDMACR_Register use record
      RXDMAE        at 0 range 0 .. 0;
      TXDMAE        at 0 range 1 .. 1;
      DMAONERR      at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype UARTPERIPHID0_PARTNUMBER0_Field is HAL.UInt8;

   --  UARTPeriphID0 Register
   type UARTPERIPHID0_Register is record
      --  Read-only. These bits read back as 0x11
      PARTNUMBER0   : UARTPERIPHID0_PARTNUMBER0_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for UARTPERIPHID0_Register use record
      PARTNUMBER0   at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype UARTPERIPHID1_PARTNUMBER1_Field is HAL.UInt4;
   subtype UARTPERIPHID1_DESIGNER0_Field is HAL.UInt4;

   --  UARTPeriphID1 Register
   type UARTPERIPHID1_Register is record
      --  Read-only. These bits read back as 0x0
      PARTNUMBER1   : UARTPERIPHID1_PARTNUMBER1_Field;
      --  Read-only. These bits read back as 0x1
      DESIGNER0     : UARTPERIPHID1_DESIGNER0_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for UARTPERIPHID1_Register use record
      PARTNUMBER1   at 0 range 0 .. 3;
      DESIGNER0     at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype UARTPERIPHID2_DESIGNER1_Field is HAL.UInt4;
   subtype UARTPERIPHID2_REVISION_Field is HAL.UInt4;

   --  UARTPeriphID2 Register
   type UARTPERIPHID2_Register is record
      --  Read-only. These bits read back as 0x4
      DESIGNER1     : UARTPERIPHID2_DESIGNER1_Field;
      --  Read-only. This field depends on the revision of the UART: r1p0 0x0
      --  r1p1 0x1 r1p3 0x2 r1p4 0x2 r1p5 0x3
      REVISION      : UARTPERIPHID2_REVISION_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for UARTPERIPHID2_Register use record
      DESIGNER1     at 0 range 0 .. 3;
      REVISION      at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype UARTPERIPHID3_CONFIGURATION_Field is HAL.UInt8;

   --  UARTPeriphID3 Register
   type UARTPERIPHID3_Register is record
      --  Read-only. These bits read back as 0x00
      CONFIGURATION : UARTPERIPHID3_CONFIGURATION_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for UARTPERIPHID3_Register use record
      CONFIGURATION at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype UARTPCELLID0_UARTPCELLID0_Field is HAL.UInt8;

   --  UARTPCellID0 Register
   type UARTPCELLID0_Register is record
      --  Read-only. These bits read back as 0x0D
      UARTPCELLID0  : UARTPCELLID0_UARTPCELLID0_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for UARTPCELLID0_Register use record
      UARTPCELLID0  at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype UARTPCELLID1_UARTPCELLID1_Field is HAL.UInt8;

   --  UARTPCellID1 Register
   type UARTPCELLID1_Register is record
      --  Read-only. These bits read back as 0xF0
      UARTPCELLID1  : UARTPCELLID1_UARTPCELLID1_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for UARTPCELLID1_Register use record
      UARTPCELLID1  at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype UARTPCELLID2_UARTPCELLID2_Field is HAL.UInt8;

   --  UARTPCellID2 Register
   type UARTPCELLID2_Register is record
      --  Read-only. These bits read back as 0x05
      UARTPCELLID2  : UARTPCELLID2_UARTPCELLID2_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for UARTPCELLID2_Register use record
      UARTPCELLID2  at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype UARTPCELLID3_UARTPCELLID3_Field is HAL.UInt8;

   --  UARTPCellID3 Register
   type UARTPCELLID3_Register is record
      --  Read-only. These bits read back as 0xB1
      UARTPCELLID3  : UARTPCELLID3_UARTPCELLID3_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for UARTPCELLID3_Register use record
      UARTPCELLID3  at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type UART0_Peripheral is record
      --  Data Register, UARTDR
      UARTDR        : aliased UARTDR_Register;
      --  Receive Status Register/Error Clear Register, UARTRSR/UARTECR
      UARTRSR       : aliased UARTRSR_Register;
      --  Flag Register, UARTFR
      UARTFR        : aliased UARTFR_Register;
      --  IrDA Low-Power Counter Register, UARTILPR
      UARTILPR      : aliased UARTILPR_Register;
      --  Integer Baud Rate Register, UARTIBRD
      UARTIBRD      : aliased UARTIBRD_Register;
      --  Fractional Baud Rate Register, UARTFBRD
      UARTFBRD      : aliased UARTFBRD_Register;
      --  Line Control Register, UARTLCR_H
      UARTLCR_H     : aliased UARTLCR_H_Register;
      --  Control Register, UARTCR
      UARTCR        : aliased UARTCR_Register;
      --  Interrupt FIFO Level Select Register, UARTIFLS
      UARTIFLS      : aliased UARTIFLS_Register;
      --  Interrupt Mask Set/Clear Register, UARTIMSC
      UARTIMSC      : aliased UARTIMSC_Register;
      --  Raw Interrupt Status Register, UARTRIS
      UARTRIS       : aliased UARTRIS_Register;
      --  Masked Interrupt Status Register, UARTMIS
      UARTMIS       : aliased UARTMIS_Register;
      --  Interrupt Clear Register, UARTICR
      UARTICR       : aliased UARTICR_Register;
      --  DMA Control Register, UARTDMACR
      UARTDMACR     : aliased UARTDMACR_Register;
      --  UARTPeriphID0 Register
      UARTPERIPHID0 : aliased UARTPERIPHID0_Register;
      --  UARTPeriphID1 Register
      UARTPERIPHID1 : aliased UARTPERIPHID1_Register;
      --  UARTPeriphID2 Register
      UARTPERIPHID2 : aliased UARTPERIPHID2_Register;
      --  UARTPeriphID3 Register
      UARTPERIPHID3 : aliased UARTPERIPHID3_Register;
      --  UARTPCellID0 Register
      UARTPCELLID0  : aliased UARTPCELLID0_Register;
      --  UARTPCellID1 Register
      UARTPCELLID1  : aliased UARTPCELLID1_Register;
      --  UARTPCellID2 Register
      UARTPCELLID2  : aliased UARTPCELLID2_Register;
      --  UARTPCellID3 Register
      UARTPCELLID3  : aliased UARTPCELLID3_Register;
   end record
     with Volatile;

   for UART0_Peripheral use record
      UARTDR        at 16#0# range 0 .. 31;
      UARTRSR       at 16#4# range 0 .. 31;
      UARTFR        at 16#18# range 0 .. 31;
      UARTILPR      at 16#20# range 0 .. 31;
      UARTIBRD      at 16#24# range 0 .. 31;
      UARTFBRD      at 16#28# range 0 .. 31;
      UARTLCR_H     at 16#2C# range 0 .. 31;
      UARTCR        at 16#30# range 0 .. 31;
      UARTIFLS      at 16#34# range 0 .. 31;
      UARTIMSC      at 16#38# range 0 .. 31;
      UARTRIS       at 16#3C# range 0 .. 31;
      UARTMIS       at 16#40# range 0 .. 31;
      UARTICR       at 16#44# range 0 .. 31;
      UARTDMACR     at 16#48# range 0 .. 31;
      UARTPERIPHID0 at 16#FE0# range 0 .. 31;
      UARTPERIPHID1 at 16#FE4# range 0 .. 31;
      UARTPERIPHID2 at 16#FE8# range 0 .. 31;
      UARTPERIPHID3 at 16#FEC# range 0 .. 31;
      UARTPCELLID0  at 16#FF0# range 0 .. 31;
      UARTPCELLID1  at 16#FF4# range 0 .. 31;
      UARTPCELLID2  at 16#FF8# range 0 .. 31;
      UARTPCELLID3  at 16#FFC# range 0 .. 31;
   end record;

   UART0_Periph : aliased UART0_Peripheral
     with Import, Address => UART0_Base;

end RP2040_SVD.UART0;
