--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with Clock_Tests;
with GPIO_Tests;
with UART_Tests;
with PWM_Tests;
with DMA_Tests;
with ADC_Tests;
with ROM_Tests;
with SysTick_Tests;
with RTC_Tests;
with SPI_Tests;
with Flash_Tests;
with PIO_Tests;

package body Test_Suite is
   Result : aliased AUnit.Test_Suites.Test_Suite;

   Clock_Case     : aliased Clock_Tests.Clock_Test;
   GPIO_Case      : aliased GPIO_Tests.GPIO_Test;
   UART_Case      : aliased UART_Tests.UART_Test;
   PWM_Case       : aliased PWM_Tests.PWM_Test;
   DMA_Case       : aliased DMA_Tests.DMA_Test;
   ADC_Case       : aliased ADC_Tests.ADC_Test;
   ROM_Case       : aliased ROM_Tests.ROM_Test;
   SysTick_Case   : aliased SysTick_Tests.SysTick_Test;
   RTC_Case       : aliased RTC_Tests.RTC_Test;
   SPI_Case       : aliased SPI_Tests.SPI_Test;
   Flash_Case     : aliased Flash_Tests.Flash_Test;
   PIO_Case       : aliased PIO_Tests.PIO_Test;

   function Suite
      return AUnit.Test_Suites.Access_Test_Suite
   is
      use AUnit.Test_Suites;
   begin
      Add_Test (Result'Access, Clock_Case'Access);
      Add_Test (Result'Access, GPIO_Case'Access);
      Add_Test (Result'Access, UART_Case'Access);
      Add_Test (Result'Access, PWM_Case'Access);
      Add_Test (Result'Access, DMA_Case'Access);
      Add_Test (Result'Access, ADC_Case'Access);
      Add_Test (Result'Access, ROM_Case'Access);
      Add_Test (Result'Access, SysTick_Case'Access);
      Add_Test (Result'Access, RTC_Case'Access);
      Add_Test (Result'Access, SPI_Case'Access);
      Add_Test (Result'Access, PIO_Case'Access);

      --  Flash tests don't work during coverage runs, because gnatcov_rts
      --  tries to call functions located in flash during RP.Flash.Program
      --  TODO: Figure out how to get *all* of the GNATcov_RTS functions into
      --        memory.
      --
      --  Add_Test (Result'Access, Flash_Case'Access);
      return Result'Access;
   end Suite;
end Test_Suite;
