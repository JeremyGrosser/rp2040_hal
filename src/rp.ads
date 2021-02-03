--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with HAL;

package RP is
   Not_Implemented : exception;

   subtype Hertz is Natural range 0 .. 2_000_000_000;
end RP;
