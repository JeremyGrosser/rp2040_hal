with RP2040_SVD.PIO;
with RP2040_SVD;
with RP.GPIO;
with HAL; use HAL;

package RP.PIO is
   type PIO_Peripheral is private;

   type PIO_Port
      (Num    : Natural;
       Periph : not null access PIO_Peripheral)
   is tagged private;

   type State_Machine is (SM_0, SM_1, SM_2, SM_3);
   for State_Machine use
      (SM_0 => 2#0001#,
       SM_1 => 2#0010#,
       SM_2 => 2#0100#,
       SM_3 => 2#1000#);

   type PIO_Point is tagged record
      Port : not null access PIO_Port;
      SM   : State_Machine;
   end record;

   subtype Instruction is UInt16;
   subtype Program_Index is Natural range 0 .. 31;
   type Program is array (Program_Index range <>) of Instruction;

   Divider_Fraction : constant := 1.0 / 2.0 ** 8;
   type Divider is delta Divider_Fraction range Divider_Fraction .. (2.0 ** 16 - Divider_Fraction);

   procedure Enable
      (This : not null access PIO_Port);

   procedure Enable
      (This : in out PIO_Point);

   procedure Disable
      (This : in out PIO_Point);

   procedure Restart
      (This : in out PIO_Point);

   procedure Clock_Restart
      (This : in out PIO_Point);

   procedure Set_Divider
      (This : in out PIO_Point;
       Div  : Divider);

   procedure Set_Out_Pins
      (This  : in out PIO_Point;
       Base  : RP.GPIO.GPIO_Point;
       Count : Natural)
       with Pre => Count <= 32;

   procedure Set_Set_Pins
      (This  : in out PIO_Point;
       Base  : RP.GPIO.GPIO_Point;
       Count : Natural)
       with Pre => Count <= 5;

   procedure Set_In_Pins
      (This : in out PIO_Point;
       Base : RP.GPIO.GPIO_Point);

   procedure Set_Sideset_Pins
      (This : in out PIO_Point;
       Base : RP.GPIO.GPIO_Point);

   procedure Set_Sideset
      (This      : in out PIO_Point;
       Bit_Count : Natural;
       Optional  : Boolean;
       Pin_Dirs  : Boolean)
       with Pre => Bit_Count <= 32;

   procedure Set_Jmp_Pin
      (This  : in out PIO_Point;
       Point : RP.GPIO.GPIO_Point);

   procedure Load
      (This        : in out PIO_Point;
       Prog        : Program;
       Wrap        : Program_Index;
       Wrap_Target : Program_Index;
       Offset      : Program_Index := Program_Index'First)
       with Pre => (Program_Index'Last - Offset) >= Prog'Length - 1;

   procedure Execute
      (This : in out PIO_Point;
       Insn : Instruction);

   function Address
      (This : PIO_Point)
      return Program_Index;

   procedure Receive
      (This : in out PIO_Point;
       Data : out UInt32_Array);

   procedure Receive
      (This : in out PIO_Point;
       Data : out UInt32);

   procedure Transmit
      (This : in out PIO_Point;
       Data : UInt32_Array);

   procedure Transmit
      (This : in out PIO_Point;
       Data : UInt32);

private
   use RP2040_SVD.PIO;

   function SM_Mask
      (SM : State_Machine)
      return UInt4;

   function Div_Integer
      (Div : Divider)
      return SM0_CLKDIV_INT_Field;

   function Div_Fraction
      (Div : Divider)
      return SM0_CLKDIV_FRAC_Field;

   type FIFO_Register is array (State_Machine) of UInt32
      with Pack, Volatile;

   type INSTR_MEM_Register is array (Program_Index) of UInt32
      with Volatile;

   type SM_Register is record
      CLKDIV    : aliased SM0_CLKDIV_Register;
      EXECCTRL  : aliased SM0_EXECCTRL_Register;
      SHIFTCTRL : aliased SM0_SHIFTCTRL_Register;
      ADDR      : aliased SM0_ADDR_Register;
      INSTR     : aliased SM0_INSTR_Register;
      PINCTRL   : aliased SM0_PINCTRL_Register;
   end record
      with Pack, Volatile;

   type SM_Register_Array is array (State_Machine) of SM_Register
      with Pack, Volatile;

   type PIO_Peripheral is record
      CTRL              : aliased CTRL_Register;
      FSTAT             : aliased FSTAT_Register;
      FDEBUG            : aliased FDEBUG_Register;
      FLEVEL            : aliased FLEVEL_Register;
      TXF               : aliased FIFO_Register;
      RXF               : aliased FIFO_Register;
      IRQ               : aliased IRQ_Register;
      IRQ_FORCE         : aliased IRQ_FORCE_Register;
      INPUT_SYNC_BYPASS : aliased HAL.UInt32;
      DBG_PADOUT        : aliased HAL.UInt32;
      DBG_PADOE         : aliased HAL.UInt32;
      DBG_CFGINFO       : aliased DBG_CFGINFO_Register;
      INSTR_MEM         : aliased INSTR_MEM_Register;
      SM                : aliased SM_Register_Array;
      INTR              : aliased INTR_Register;
      IRQ0_INTE         : aliased IRQ0_INTE_Register;
      IRQ0_INTF         : aliased IRQ0_INTF_Register;
      IRQ0_INTS         : aliased IRQ0_INTS_Register;
      IRQ1_INTE         : aliased IRQ1_INTE_Register;
      IRQ1_INTF         : aliased IRQ1_INTF_Register;
      IRQ1_INTS         : aliased IRQ1_INTS_Register;
   end record
      with Size => 2592,
           Pack,
           Volatile;

   type PIO_Port
      (Num    : Natural;
       Periph : not null access PIO_Peripheral)
   is tagged null record;

end RP.PIO;
