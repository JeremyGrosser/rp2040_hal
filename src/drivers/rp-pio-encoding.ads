with Ada.Unchecked_Conversion;

package RP.PIO.Encoding is

   type JMP_Condition is
      (Always,
       Scratch_X_Zero,              --  !X
       Scratch_X_Nonzero_Decrement, --  X--
       Scratch_Y_Zero,              --  !Y
       Scratch_Y_Nonzero_Decrement, --  Y--
       X_Notequal_Y,                --  X!=Y
       Input_Pin,                   --  PIN
       OSRE_Not_Empty)              --  !OSRE
   with Size => 3;

   type JMP is record
      Opcode         : HAL.UInt3 := 2#000#;
      Delay_Sideset  : HAL.UInt5 := 0;
      Condition      : JMP_Condition := Always;
      Address        : HAL.UInt5 := 0;
   end record
      with Size => 16;
   for JMP use record
      Opcode         at 0 range 13 .. 15;
      Delay_Sideset  at 0 range 8 .. 12;
      Condition      at 0 range 5 .. 7;
      Address        at 0 range 0 .. 4;
   end record;

   type WAIT_Source is
      (GPIO, PIN, WAIT_IRQ)
   with Size => 2;

   type WAIT is record
      Opcode         : HAL.UInt3 := 2#001#;
      Delay_Sideset  : HAL.UInt5 := 0;
      Polarity       : Boolean := False;
      Source         : WAIT_Source := GPIO;
      Index          : HAL.UInt5 := 0;
   end record
      with Size => 16;
   for WAIT use record
      Opcode         at 0 range 13 .. 15;
      Delay_Sideset  at 0 range 8 .. 12;
      Polarity       at 0 range 7 .. 7;
      Source         at 0 range 5 .. 6;
      Index          at 0 range 0 .. 4;
   end record;

   type SHIFT_IN_Source is
      (PINS, X, Y, ZERO, ISR, OSR)
   with Size => 3;
   for SHIFT_IN_Source use
      (PINS => 2#000#,
       X    => 2#001#,
       Y    => 2#010#,
       ZERO => 2#011#,
       ISR  => 2#110#,
       OSR  => 2#111#);

   type SHIFT_IN is record
      Opcode         : HAL.UInt3 := 2#010#;
      Delay_Sideset  : HAL.UInt5 := 0;
      Source         : SHIFT_IN_Source := PINS;
      Bit_Count      : HAL.UInt5; --  0 = 32
   end record
      with Size => 16;
   for SHIFT_IN use record
      Opcode         at 0 range 13 .. 15;
      Delay_Sideset  at 0 range 8 .. 12;
      Source         at 0 range 5 .. 7;
      Bit_Count      at 0 range 0 .. 4;
   end record;

   type SHIFT_OUT_Destination is
      (PINS, X, Y, DISCARD, PINDIRS, PC, ISR, EXEC)
   with Size => 3;
   for SHIFT_OUT_Destination use
      (PINS    => 2#000#,
       X       => 2#001#,
       Y       => 2#010#,
       DISCARD => 2#011#,
       PINDIRS => 2#100#,
       PC      => 2#101#,
       ISR     => 2#110#,
       EXEC    => 2#111#);
   type SHIFT_OUT is record
      Opcode         : HAL.UInt3 := 2#011#;
      Delay_Sideset  : HAL.UInt5 := 0;
      Destination    : SHIFT_OUT_Destination := PINS;
      Bit_Count      : HAL.UInt5; --  0 = 32
   end record
      with Size => 16;
   for SHIFT_OUT use record
      Opcode         at 0 range 13 .. 15;
      Delay_Sideset  at 0 range 8 .. 12;
      Destination    at 0 range 5 .. 7;
      Bit_Count      at 0 range 0 .. 4;
   end record;

   type PUSH is record
      Opcode         : HAL.UInt3 := 2#100#;
      Delay_Sideset  : HAL.UInt5 := 0;
      Opcode_2       : Boolean := False;
      If_Full        : Boolean := False;
      Block          : Boolean := False;
      Opcode_3       : HAL.UInt5 := 0;
   end record
      with Size => 16;
   for PUSH use record
      Opcode         at 0 range 13 .. 15;
      Delay_Sideset  at 0 range 8 .. 12;
      Opcode_2       at 0 range 7 .. 7;
      If_Full        at 0 range 6 .. 6;
      Block          at 0 range 5 .. 5;
      Opcode_3       at 0 range 0 .. 4;
   end record;

   type PULL is record
      Opcode         : HAL.UInt3 := 2#100#;
      Delay_Sideset  : HAL.UInt5 := 0;
      Opcode_2       : Boolean := True;
      If_Empty       : Boolean := False;
      Block          : Boolean := False;
      Opcode_3       : HAL.UInt5 := 0;
   end record
      with Size => 16;
   for PULL use record
      Opcode         at 0 range 13 .. 15;
      Delay_Sideset  at 0 range 8 .. 12;
      Opcode_2       at 0 range 7 .. 7;
      If_Empty       at 0 range 6 .. 6;
      Block          at 0 range 5 .. 5;
      Opcode_3       at 0 range 0 .. 4;
   end record;

   type MOV_Target is
      (PINS, X, Y, EXEC, PC, ISR, OSR)
   with Size => 3;
   for MOV_Target use
      (PINS => 2#000#,
       X    => 2#001#,
       Y    => 2#010#,
       EXEC => 2#100#,
       PC   => 2#101#,
       ISR  => 2#110#,
       OSR  => 2#111#);

   type MOV_Operation is
      (None, Invert, Bit_Reverse)
   with Size => 2;

   type MOV is record
      Opcode         : HAL.UInt3 := 2#101#;
      Delay_Sideset  : HAL.UInt5 := 0;
      Destination    : MOV_Target := PINS;
      Operation      : MOV_Operation := None;
      Source         : MOV_Target := PINS;
   end record
      with Size => 16;
   for MOV use record
      Opcode         at 0 range 13 .. 15;
      Delay_Sideset  at 0 range 8 .. 12;
      Destination    at 0 range 5 .. 7;
      Operation      at 0 range 3 .. 4;
      Source         at 0 range 0 .. 2;
   end record;

   type IRQ is record
      Opcode         : HAL.UInt3 := 2#110#;
      Delay_Sideset  : HAL.UInt5 := 0;
      Opcode_2       : Boolean := False;
      Clear          : Boolean := False;
      Wait           : Boolean := False;
      Index          : HAL.UInt5;
   end record
      with Size => 16;
   for IRQ use record
      Opcode         at 0 range 13 .. 15;
      Delay_Sideset  at 0 range 8 .. 12;
      Opcode_2       at 0 range 7 .. 7;
      Clear          at 0 range 6 .. 6;
      Wait           at 0 range 5 .. 5;
      Index          at 0 range 0 .. 4;
   end record;

   type SET_Destination is
      (PINS, X, Y, PINDIRS)
   with Size => 3;
   for SET_Destination use
      (PINS    => 2#000#,
       X       => 2#001#,
       Y       => 2#010#,
       PINDIRS => 2#100#);

   type SET is record
      Opcode         : HAL.UInt3 := 2#111#;
      Delay_Sideset  : HAL.UInt5 := 0;
      Destination    : SET_Destination := PINS;
      Data           : HAL.UInt5 := 0;
   end record
      with Size => 16;
   for SET use record
      Opcode         at 0 range 13 .. 15;
      Delay_Sideset  at 0 range 8 .. 12;
      Destination    at 0 range 5 .. 7;
      Data           at 0 range 0 .. 4;
   end record;

   function Encode is new Ada.Unchecked_Conversion (JMP, PIO_Instruction);
   function Encode is new Ada.Unchecked_Conversion (WAIT, PIO_Instruction);
   function Encode is new Ada.Unchecked_Conversion (SHIFT_IN, PIO_Instruction);
   function Encode is new Ada.Unchecked_Conversion (SHIFT_OUT, PIO_Instruction);
   function Encode is new Ada.Unchecked_Conversion (PUSH, PIO_Instruction);
   function Encode is new Ada.Unchecked_Conversion (PULL, PIO_Instruction);
   function Encode is new Ada.Unchecked_Conversion (MOV, PIO_Instruction);
   function Encode is new Ada.Unchecked_Conversion (IRQ, PIO_Instruction);
   function Encode is new Ada.Unchecked_Conversion (SET, PIO_Instruction);

end RP.PIO.Encoding;
