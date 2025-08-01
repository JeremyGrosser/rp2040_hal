--
--  Copyright (C) 2022 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with Clock_Tests;
with Timer_Tests;
with GPIO_Tests;
with UART_Tests;
with PWM_Tests;
with DMA_Tests;
with ADC_Tests;
with ROM_Tests;
with RTC_Tests;
with SPI_Tests;
with I2C_Tests;
with I2CM_Tests;
--  with Flash_Tests;
with PIO_Tests;
with Reset_Tests;

package body Test_Suite is
   Result : aliased AUnit.Test_Suites.Test_Suite;

   Clock_Case     : aliased Clock_Tests.Clock_Test;
   Timer_Case     : aliased Timer_Tests.Timer_Test;
   GPIO_Case      : aliased GPIO_Tests.GPIO_Test;
   UART_Case      : aliased UART_Tests.UART_Test;
   PWM_Case       : aliased PWM_Tests.PWM_Test;
   DMA_Case       : aliased DMA_Tests.DMA_Test;
   ADC_Case       : aliased ADC_Tests.ADC_Test;
   ROM_Case       : aliased ROM_Tests.ROM_Test;
   RTC_Case       : aliased RTC_Tests.RTC_Test;
   SPI_Case       : aliased SPI_Tests.SPI_Test;
   I2C_Case       : aliased I2C_Tests.I2C_Test;
   I2CM_Case      : aliased I2CM_Tests.I2CM_Test;
   --  Flash_Case     : aliased Flash_Tests.Flash_Test;
   PIO_Case       : aliased PIO_Tests.PIO_Test;
   Reset_Case     : aliased Reset_Tests.Reset_Test;

   function Suite
      return AUnit.Test_Suites.Access_Test_Suite
   is
      use AUnit.Test_Suites;
   begin
      Add_Test (Result'Access, Clock_Case'Access);
      Add_Test (Result'Access, Timer_Case'Access);
      Add_Test (Result'Access, GPIO_Case'Access);
      Add_Test (Result'Access, UART_Case'Access);
      Add_Test (Result'Access, PWM_Case'Access);
      Add_Test (Result'Access, DMA_Case'Access);
      Add_Test (Result'Access, ADC_Case'Access);
      Add_Test (Result'Access, ROM_Case'Access);
      Add_Test (Result'Access, RTC_Case'Access);
      Add_Test (Result'Access, SPI_Case'Access);
      Add_Test (Result'Access, I2C_Case'Access);
      Add_Test (Result'Access, I2CM_Case'Access);
      Add_Test (Result'Access, PIO_Case'Access);
      Add_Test (Result'Access, Reset_Case'Access);
      --  Add_Test (Result'Access, Flash_Case'Access);
      return Result'Access;
   end Suite;
end Test_Suite;
