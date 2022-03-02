--
--  Copyright (C) 2022 Fabien Chouteau <fabien.chouteau@gmail.com>
--
--  SPDX-License-Identifier: BSD-3-Clause
--

package body RP.Multicore.Spinlocks is

   --------------
   -- Try_Lock --
   --------------

   function Try_Lock
      (Id : Lock_Id)
      return Boolean
   is (Spinlocks (Id) /= 0);

   ---------------
   -- Wait_Lock --
   ---------------

   procedure Wait_Lock (Id : Lock_Id) is
   begin
      loop
         exit when Try_Lock (Id);
      end loop;
   end Wait_Lock;

   -------------
   -- Release --
   -------------

   procedure Release
      (Id : Lock_Id)
   is
   begin
      Spinlocks (Id) := 42; --  Write any value to release
   end Release;

   ------------
   -- Locked --
   ------------

   function Locked (Id : Lock_Id) return Boolean is
      Bit : constant UInt32 := Shift_Left (1, Natural (Id));
   begin
      return (RP2040_SVD.SIO.SIO_Periph.SPINLOCK_ST and Bit) /= 0;
   end Locked;

end RP.Multicore.Spinlocks;
