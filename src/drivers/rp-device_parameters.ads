with Rp2040_Hal_Config; use Rp2040_Hal_Config;

package RP.Device_Parameters
   with Pure
is
   Pin_Count : constant :=
      (case Device is
         when RP2040             => 30,
         when RP2350A | RP2354A  => 30,
         when RP2350B | RP2354B  => 48);
   GPIO_CLK_Func : constant :=
      (case Device is
         when RP2040 => 8,
         when others => 9);
   GPIO_USB_Func : constant :=
      (case Device is
         when RP2040 => 9,
         when others => 10);
   Has_GPIO_ISO : constant Boolean := Device /= RP2040;

   ADC_Channel_Count : constant :=
      (case Device is
         when RP2040             => 5,
         when RP2350A | RP2354A  => 5,
         when RP2350B | RP2354B  => 9);
   ADC_Temperature_Channel : constant :=
      (if Pin_Count = 48 then 8 else 4);

   PWM_Slice_Count : constant :=
      (case Device is
         when RP2040 => 8,
         when others => 12);
   PWM_IRQ_Count : constant :=
      (case Device is
         when RP2040 => 1,
         when others => 2);

end RP.Device_Parameters;
