procedure Runtime_Init is
   procedure adainit
      with Import, Convention => C, External_Name => "adainit";
begin
   adainit;
end Runtime_Init;
