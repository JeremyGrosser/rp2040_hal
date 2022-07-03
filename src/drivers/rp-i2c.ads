with RP2040_SVD.I2C;
with RP.Timer;
with HAL.I2C;

package RP.I2C
   with Preelaborate
is
   subtype I2C_Number is Natural range 0 .. 1;

   type I2C_Port
      (Num    : I2C_Number;
       Periph : not null access RP2040_SVD.I2C.I2C_Peripheral)
   is tagged private;

   type Nanoseconds is new Natural;
   type I2C_Timing is record
      High, Low, Hold, Spike : Nanoseconds;
      Rise, Fall : Nanoseconds := 0;
   end record;

   --  These default timing modes do not include SCL rise and fall times. For
   --  more accurate timing, measure the actual rise and fall time of your bus
   --  with an oscilloscope and instantiate an I2C_Timing record with the Rise
   --  and Fall parameters populated. With Rise and Fall set to 0, SCL will run
   --  a little slow, but no minimum clock is specified for I2C, so this is
   --  fine.
   Standard_Mode  : constant I2C_Timing :=
      (High   => 5_200,
       Low    => 4_700,
       Hold   => 3_450,
       others => <>);

   Fast_Mode      : constant I2C_Timing :=
      (High   => 1_160,
       Low    => 1_330,
       Hold   => 800,
       Spike  => 50,
       others => <>);

   Fast_Mode_Plus : constant I2C_Timing :=
      (High   => 400,
       Low    => 600,
       Hold   => 200,
       Spike  => 50,
       others => <>);

   type I2C_Role is (Controller, Target);
   type I2C_Config is record
      Role   : I2C_Role := Controller;
      Timing : I2C_Timing := Standard_Mode;
   end record;

   function Enabled
      (This : I2C_Port)
      return Boolean;

   procedure Configure
      (This   : in out I2C_Port;
       Config : I2C_Config)
   with Post => not This.Enabled;

   procedure Enable
      (This     : in out I2C_Port;
       Deadline : RP.Timer.Time := RP.Timer.Time'Last);

   procedure Disable
      (This     : in out I2C_Port;
       Deadline : RP.Timer.Time := RP.Timer.Time'Last);

   procedure Set_Timing
      (This : in out I2C_Port;
       T    : I2C_Timing)
   with Pre => not This.Enabled;

   procedure Set_Address
      (This : in out I2C_Port;
       Addr : HAL.UInt7)
   with Pre => not This.Enabled;

   procedure Set_Address
      (This : in out I2C_Port;
       Addr : HAL.UInt10)
   with Pre => not This.Enabled;
   --  When configured as a Controller, Set_Address indicates the address of the Target for Read and Write.
   --  When configured as a Target, Set_Address indicates this device's address.

   procedure Start_Read
      (This   : in out I2C_Port;
       Length : Positive := 1;
       Stop   : Boolean := True)
   with Pre => This.Enabled;
   --  If Stop is False, the Controller does not release the bus after this
   --  transaction completes and will issue a repeated start before the first
   --  byte of the next transaction. Stop has no effect if Role = Target.

   function Read_Ready
      (This : I2C_Port)
      return Boolean
   with Pre => This.Enabled;
   --  Returns True if a call to Read would not block

   procedure Read
      (This     : in out I2C_Port;
       Data     : out HAL.UInt8;
       Status   : out HAL.I2C.I2C_Status;
       Deadline : RP.Timer.Time := RP.Timer.Time'Last)
   with Pre => This.Enabled;

   procedure Start_Write
      (This     : in out I2C_Port;
       Length   : Positive := 1;
       Stop     : Boolean := True;
       Deadline : RP.Timer.Time := RP.Timer.Time'Last);
   --  In Target mode, Start_Write waits until Deadline for the Controller to
   --  send our address. If a Deadline is specified and nonblocking behavior is
   --  expected, the caller should check the value of Write_Ready before
   --  calling Write.

   function Write_Ready
      (This : I2C_Port)
      return Boolean
   with Pre => This.Enabled;
   --  Returns True if a call to Write would not block

   procedure Write
      (This     : in out I2C_Port;
       Data     : HAL.UInt8;
       Status   : out HAL.I2C.I2C_Status;
       Deadline : RP.Timer.Time := RP.Timer.Time'Last)
   with Pre => This.Enabled;
   --  If Deadline is reached before Write_Ready returns True, Abort_Write will
   --  be called and Status is set to Err_Timeout. After a timeout, call
   --  Clear_Error before attempting another Write.

   procedure Abort_Write
      (This : in out I2C_Port)
   with Pre => This.Enabled;

   type I2C_Abort_Source is record
      No_Ack_Addr_7b          : Boolean := False;
      --  7 bit address unacknowledged

      No_Ack_Addr_10b_1       : Boolean := False;
      --  10 bit address unacknowledged (first byte)

      No_Ack_Addr_10b_2       : Boolean := False;
      --  10 bit address unacknowledged (second byte)

      No_Ack_Transmit         : Boolean := False;
      --  Upon controller transmit, the address was acknowledged, but a data byte was not.

      No_Ack_General_Call     : Boolean := False;
      --  No target acknowledged a general call

      Invalid_General_Call    : Boolean := False;
      --  General call command with read bit set

      Invalid_Ack_High_Speed  : Boolean := False;
      --  High speed mode was selected, but an ack was received before the end of the transfer.

      Invalid_Ack_Start       : Boolean := False;
      --  A start byte was acknowledged, but only data should be acknowledged.

      No_Restart_High_Speed   : Boolean := False;
      --  High speed mode was selected but restart is not enabled

      No_Restart_Start        : Boolean := False;
      --  Attempting to send a start byte but restart is not enabled

      No_Restart_10b_Read     : Boolean := False;
      --  10 bit read attempted but restart is not enabled

      Not_Controller_Mode     : Boolean := False;
      --  A controller operation was attempted while in target mode

      Arbitration_Lost        : Boolean := False;
      --  Something pulled SDA low before being addressed by the controller

      Target_Transmit_Abort   : Boolean := False;
      --  A target read command was issued while there was still data in the
      --  transmit FIFO, transmit aborted.

      Target_Arbitration_Lost : Boolean := False;
      --  Something pulled SDA to the wrong state while transmitting in target mode

      Invalid_Target_Read     : Boolean := False;
      --  The read bit was set in the CMD register during a target transmit

      Transfer_Aborted        : Boolean := False;
      --  User aborted a transfer in controller mode

      Transmit_Flush_Count    : HAL.UInt9 := 0;
      --  Number of times the transmit FIFO was flushed due to an abort
   end record
      with Size => 32;

   type I2C_State is record
      Abort_Source   : I2C_Abort_Source;
      Last_Command   : RP2040_SVD.I2C.IC_DATA_CMD_Register;
      RX_Remaining   : Natural;
      TX_Remaining   : Natural;
      TX_Empty       : Boolean;
      RX_Empty       : Boolean;
      Repeated_Start : Boolean;
      Is_Error       : Boolean;
   end record;

   function Status
      (This : I2C_Port)
      return I2C_State;

   procedure Clear_Error
      (This : in out I2C_Port);

private

   type I2C_Port
      (Num    : I2C_Number;
       Periph : not null access RP2040_SVD.I2C.I2C_Peripheral)
   is tagged record
      Role           : I2C_Role := Controller;
      Last_Command   : RP2040_SVD.I2C.IC_DATA_CMD_Register := (others => <>);
      RX_Remaining   : Natural := 0;
      TX_Remaining   : Natural := 0;
      Repeated_Start : Boolean := False;
   end record;

   for I2C_Abort_Source use record
      No_Ack_Addr_7b          at 0 range 0 .. 0;
      No_Ack_Addr_10b_1       at 0 range 1 .. 1;
      No_Ack_Addr_10b_2       at 0 range 2 .. 2;
      No_Ack_Transmit         at 0 range 3 .. 3;
      No_Ack_General_Call     at 0 range 4 .. 4;
      Invalid_General_Call    at 0 range 5 .. 5;
      Invalid_Ack_High_Speed  at 0 range 6 .. 6;
      Invalid_Ack_Start       at 0 range 7 .. 7;
      No_Restart_High_Speed   at 0 range 8 .. 8;
      No_Restart_Start        at 0 range 9 .. 9;
      No_Restart_10b_Read     at 0 range 10 .. 10;
      Not_Controller_Mode     at 0 range 11 .. 11;
      Arbitration_Lost        at 0 range 12 .. 12;
      Target_Transmit_Abort   at 0 range 13 .. 13;
      Target_Arbitration_Lost at 0 range 14 .. 14;
      Invalid_Target_Read     at 0 range 15 .. 15;
      Transfer_Aborted        at 0 range 16 .. 16;
      Transmit_Flush_Count    at 0 range 23 .. 31;
   end record;

end RP.I2C;
