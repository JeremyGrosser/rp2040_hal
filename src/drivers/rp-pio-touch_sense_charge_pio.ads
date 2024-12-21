--------------------------------------------------------
-- This file is autogenerated by pioasm; do not edit! --
--------------------------------------------------------

pragma Style_Checks (Off);

package RP.PIO.Touch_Sense_Charge_PIO
  with Preelaborate
is

   ------------------------
   -- Touch_Sense_Charge --
   ------------------------

   Touch_Sense_Charge_Wrap_Target : constant := 0;
   Touch_Sense_Charge_Wrap        : constant := 12;

   Touch_Sense_Charge_Program_Instructions : RP.PIO.Program := (
                    --  .wrap_target
         16#80a0#,  --   0: pull   block
         16#e081#,  --   1: set    pindirs, 1
         16#e000#,  --   2: set    pins, 0
         16#e03e#,  --   3: set    x, 30
         16#1f44#,  --   4: jmp    x--, 4                 [31]
         16#a027#,  --   5: mov    x, osr
         16#e080#,  --   6: set    pindirs, 0
         16#0049#,  --   7: jmp    x--, 9
         16#000b#,  --   8: jmp    11
         16#00cb#,  --   9: jmp    pin, 11
         16#0007#,  --  10: jmp    7
         16#a0c1#,  --  11: mov    isr, x
         16#8020#); --  12: push   block
                    --  .wrap

end RP.PIO.Touch_Sense_Charge_PIO;