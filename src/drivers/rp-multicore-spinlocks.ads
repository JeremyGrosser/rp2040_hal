--
--  Copyright (C) 2022 Fabien Chouteau <fabien.chouteau@gmail.com>
--
--  SPDX-License-Identifier: BSD-3-Clause
--

package RP.Multicore.Spinlocks is

   type Lock_Id is range 0 .. 31;

   function Try_Lock (Id : Lock_Id) return Boolean;
   --  Try to claim the given lock. Return True if the lock is successfully
   --  claimed.

   procedure Wait_Lock (Id : Lock_Id);
   --  Repeatedly try to claim the lock until successful

   procedure Release (Id : Lock_Id);
   --  Release the given lock

   function Locked (Id : Lock_Id) return Boolean;
   --  Return True if the given lock is claimed (Mainly intended for debugging)

   --  The Spinlock subprograms are likely to be used in core synchronization
   --  code, for instance to prevent one core to access the XIP flash when the
   --  or is writing to it. This kind of code will be located in RAM, therefore
   --  we maek the subprograms Inline_Always so that they are located in the
   --  same section as the code calling them.
   pragma Inline_Always (Try_Lock);
   pragma Inline_Always (Wait_Lock);
   pragma Inline_Always (Release);
   pragma Inline_Always (Locked);

end RP.Multicore.Spinlocks;
