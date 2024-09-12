with System.Machine_Code;

procedure OS_Exit is
begin
   loop
      System.Machine_Code.Asm ("wfi", Volatile => True);
   end loop;
end OS_Exit;
