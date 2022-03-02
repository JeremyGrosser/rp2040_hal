--
--  Copyright (C) 2022 Fabien Chouteau <fabien.chouteau@gmail.com>
--
--  SPDX-License-Identifier: BSD-3-Clause
--

with HAL; use HAL;

package RP.Multicore is

   procedure Launch_Core1 (Trap_Vector   : HAL.UInt32;
                           Stack_Pointer : HAL.UInt32;
                           Entry_Point   : HAL.UInt32)
     with Pre => Trap_Vector   /= 0 and then
                 Stack_Pointer /= 0 and then
                 Entry_Point   /= 0;
   --  Start core 1 (the second CPU of the RP2040) to execute code at
   --  Entry_Point with the stack pointer set to Stack_Pointer and trap vector
   --  base set to Trap_Vector.

   function CPU_Id
      return Natural;
   --  Returns the Id of the CPU we're currently executing on.

end RP.Multicore;
