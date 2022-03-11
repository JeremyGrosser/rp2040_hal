package RP_Bootrom is
   procedure Initialize
   with Export,
        Convention    => C,
        External_Name => "__gnat_initialize_bootrom";
end RP_Bootrom;
