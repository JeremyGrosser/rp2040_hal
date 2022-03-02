--
--  Copyright (C) 2022 Fabien Chouteau <fabien.chouteau@gmail.com>
--
--  SPDX-License-Identifier: BSD-3-Clause
--

with System.Machine_Code; use System.Machine_Code;
with RP2040_SVD.Interrupts;
with RP2040_SVD.SIO;
with Cortex_M.NVIC;

with RP.Multicore.FIFO;

package body RP.Multicore is

   ------------------
   -- Launch_Core1 --
   ------------------

   procedure Launch_Core1 (Trap_Vector   : HAL.UInt32;
                           Stack_Pointer : HAL.UInt32;
                           Entry_Point   : HAL.UInt32)
   is
      Int_Id : constant := RP2040_SVD.Interrupts.SIO_IRQ_PROC0_Interrupt;
      Enabled : constant Boolean := Cortex_M.NVIC.Enabled (Int_Id);
   begin

      --  Disable FIFO interrupt during launch procedure with core1 to avoid
      --  running a handler in case user enabled it already.
      Cortex_M.NVIC.Disable_Interrupt (Int_Id);

      declare
         Commands : constant UInt32_Array :=
           (0, 0, 1,
            Trap_Vector,
            Stack_Pointer,
            Entry_Point or 1); -- Thumb mode

         Response : UInt32;

         Index : Natural := Commands'First;
         Cmd : UInt32;
      begin
         loop
            Cmd := Commands (Index);

            if Cmd = 0 then
               FIFO.Drain;

               System.Machine_Code.Asm ("sev", Volatile => True);
            end if;

            --  Send a command an wait for echo
            FIFO.Push_Blocking (Cmd);
            Response := FIFO.Pop_Blocking;

            if Response = Cmd then
               --  Success:

               if Index = Commands'Last then
                  --  Launch done
                  exit;
               else
                  --  Next command
                  Index := Index + 1;
               end if;

            else
               --  Failure: start from the beginning
               Index := Commands'First;
            end if;
         end loop;
      end;

      if Enabled then
         Cortex_M.NVIC.Enable_Interrupt (Int_Id);
      end if;
   end Launch_Core1;

   function CPU_Id
      return Natural
   is (Natural (RP2040_SVD.SIO.SIO_Periph.CPUID));

end RP.Multicore;
