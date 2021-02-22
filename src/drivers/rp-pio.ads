with RP2040_SVD.PIO; use RP2040_SVD.PIO;
with RP2040_SVD;
with RP.GPIO; use RP.GPIO;
with HAL; use HAL;

package RP.PIO is
   type PIO_Peripheral is private;
   type PIO_Device (Periph : not null access PIO_Peripheral) is tagged limited private;

   type State_Machine is range 0 .. 3;
   type State_Machines is array (State_Machine) of Boolean;

   subtype Instruction is UInt16;
   subtype Program_Index is Natural range 0 .. 31;
   type Program is array (Program_Index range <>) of Instruction;

   Divider_Fraction : constant := 1.0 / 2.0 ** 8;
   type Divider is delta Divider_Fraction range Divider_Fraction .. (2.0 ** 16 - Divider_Fraction);

   type State_Machine_Configuration is record
      Clock_Divider    : Divider := 1.0;
      Out_Base         : GPIO_Point := (Pin => 0);
      Out_Count        : UInt6 := 0;
      Set_Base         : GPIO_Point := (Pin => 0);
      Set_Count        : UInt3 := 0;
      In_Base          : GPIO_Point := (Pin => 0);
      Sideset_Base     : GPIO_Point := (Pin => 0);
      Sideset_Count    : UInt3 := 0;
      Sideset_Optional : Boolean := False;
      Sideset_Pindir   : Boolean := False;
      Jmp_Pin          : GPIO_Point := (Pin => 0);
      Autopull         : Boolean := False;
      Autopush         : Boolean := False;
   end record;

   --  RESET the PIO peripherals
   procedure Initialize;

   procedure Configure
      (This   : in out PIO_Device;
       SM     : State_Machine;
       Config : State_Machine_Configuration);

   procedure Enable
      (This : in out PIO_Device;
       SM   : State_Machines);

   procedure Disable
      (This : in out PIO_Device;
       SM   : State_Machines);

   procedure Restart
      (This : in out PIO_Device;
       SM   : State_Machines);

   procedure Load
      (This        : in out PIO_Device;
       SM          : State_Machine;
       Prog        : Program;
       Wrap        : Program_Index;
       Wrap_Target : Program_Index;
       Offset      : Program_Index := Program_Index'First)
       with Pre => (Program_Index'Last - Offset) >= Prog'Length - 1;

   procedure Execute
      (This : in out PIO_Device;
       SM   : State_Machine;
       Insn : Instruction);

   function Address
      (This : PIO_Device;
       SM   : State_Machine)
      return Program_Index;

   procedure Receive
      (This : in out PIO_Device;
       SM   : State_Machine;
       Data : out UInt32_Array);

   procedure Receive
      (This : in out PIO_Device;
       SM   : State_Machine;
       Data : out UInt32);

   procedure Transmit
      (This : in out PIO_Device;
       SM   : State_Machine;
       Data : UInt32_Array);

   procedure Transmit
      (This : in out PIO_Device;
       SM   : State_Machine;
       Data : UInt32);

   function To_Divider (Frequency : Hertz)
      return Divider
      with Pre => Frequency > 0;

private

   function Mask
      (SM : State_Machines)
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
           Volatile;

   type PIO_Device (Periph : not null access PIO_Peripheral) is
      tagged limited null record;
end RP.PIO;
