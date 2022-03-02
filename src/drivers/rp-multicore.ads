--
--  Copyright (C) 2022 Fabien Chouteau <fabien.chouteau@gmail.com>
--
--  SPDX-License-Identifier: BSD-3-Clause
--

with HAL; use HAL;

package RP.Multicore is

   procedure Launch_Core1 (Trap_Vect   : HAL.UInt32;
                           SP          : HAL.UInt32;
                           Entry_Point : HAL.UInt32)
     with Pre => Trap_Vect   /= 0 and then
                 SP          /= 0 and then
                 Entry_Point /= 0;
   --  Start core 1 (the second CPU of the RP2040) to execute code at
   --  Entry_Point with the stack pointer set to SP and trap vector base set
   --  to Trap_Vect.

end RP.Multicore;
