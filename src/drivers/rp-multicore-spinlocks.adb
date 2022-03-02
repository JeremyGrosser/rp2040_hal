--
--  Copyright (C) 2022 Fabien Chouteau <fabien.chouteau@gmail.com>
--
--  SPDX-License-Identifier: BSD-3-Clause
--

with RP2040_SVD.SIO; use RP2040_SVD.SIO;

with System.Storage_Elements;

package body RP.Multicore.Spinlocks is

   function Get_Lock_Addr (Id : Lock_Id) return System.Address;

   -------------------
   -- Get_Lock_Addr --
   -------------------

   function Get_Lock_Addr (Id : Lock_Id) return System.Address is
      use System.Storage_Elements;

      Base : constant Integer_Address :=
        To_Integer (SIO_Periph.SPINLOCK0'Address);
   begin

      return To_Address (Base + UInt32'Size * Integer_Address (Id));
   end Get_Lock_Addr;

   --------------
   -- Try_Lock --
   --------------

   function Try_Lock (Id : Lock_Id) return Boolean is
      Lock : UInt32
        with Volatile_Full_Access,
             Address => Get_Lock_Addr (Id);
   begin
      return Lock /= 0;
   end Try_Lock;

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

   procedure Release (Id : Lock_Id) is
      Lock : UInt32
        with Volatile_Full_Access,
             Address => Get_Lock_Addr (Id);
   begin
      Lock := 42; --  Write any value to release
   end Release;

   ------------
   -- Locked --
   ------------

   function Locked (Id : Lock_Id) return Boolean is
      Bit : constant UInt32 := Shift_Left (1, Natural (Id));
   begin
      return (SIO_Periph.SPINLOCK_ST and Bit) /= 0;
   end Locked;

end RP.Multicore.Spinlocks;
