--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with HAL;

package RP.Flash.Cache
   with Preelaborate
is
   procedure Enable;
   procedure Disable;
   procedure Power_Down;
   --  Power_Down implies Disable, cache state is retained while powered down

   function Is_Enabled
      return Boolean;

   procedure Flush
      (Wait : Boolean := True);
   --  If Wait is True, Flush blocks until the cache flush is complete,
   --  otherwise the cache is flushed asynchronously.

   function Hit_Count
      return HAL.UInt32;

   function Access_Count
      return HAL.UInt32;

   procedure Reset_Counters;

end RP.Flash.Cache;
