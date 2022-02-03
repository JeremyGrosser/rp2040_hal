with RP2040_SVD.SIO; use RP2040_SVD.SIO;
with Atomic.Critical_Section;

package body RP.Divider is
   function idiv
      (Numerator, Denominator : Int32)
      return Int32
   is
      State    : Atomic.Critical_Section.Interrupt_State;
      Quotient : Int32;
   begin
      if Denominator = 0 then
         return idiv0;
      end if;
      Atomic.Critical_Section.Enter (State);
      SIO_Periph.DIV_SDIVIDEND := To_UInt32 (Numerator);
      SIO_Periph.DIV_SDIVISOR := To_UInt32 (Denominator);
      while not SIO_Periph.DIV_CSR.READY loop
         null;
      end loop;
      Quotient := To_Int32 (SIO_Periph.DIV_QUOTIENT);
      Atomic.Critical_Section.Leave (State);
      return Quotient;
   end idiv;

   function idivmod
      (Numerator, Denominator : Int32)
      return idiv_return
   is
      State  : Atomic.Critical_Section.Interrupt_State;
      Result : idiv_return;
   begin
      if Denominator = 0 then
         Result := (Quotient => idiv0, Remainder => 0);
         return Result;
      end if;
      Atomic.Critical_Section.Enter (State);
      SIO_Periph.DIV_SDIVIDEND := To_UInt32 (Numerator);
      SIO_Periph.DIV_SDIVISOR := To_UInt32 (Denominator);
      while not SIO_Periph.DIV_CSR.READY loop
         null;
      end loop;
      Result.Quotient := To_Int32 (SIO_Periph.DIV_QUOTIENT);
      Result.Remainder := To_Int32 (SIO_Periph.DIV_REMAINDER);
      Atomic.Critical_Section.Leave (State);
      return Result;
   end idivmod;

   function uidiv
      (Numerator, Denominator : UInt32)
      return UInt32
   is
      State    : Atomic.Critical_Section.Interrupt_State;
      Quotient : UInt32;
   begin
      if Denominator = 0 then
         return To_UInt32 (idiv0);
      end if;
      Atomic.Critical_Section.Enter (State);
      SIO_Periph.DIV_UDIVIDEND := Numerator;
      SIO_Periph.DIV_UDIVISOR := Denominator;
      while not SIO_Periph.DIV_CSR.READY loop
         null;
      end loop;
      Quotient := SIO_Periph.DIV_QUOTIENT;
      Atomic.Critical_Section.Leave (State);
      return Quotient;
   end uidiv;

   function uidivmod
      (Numerator, Denominator : UInt32)
      return uidiv_return
   is
      State  : Atomic.Critical_Section.Interrupt_State;
      Result : uidiv_return;
   begin
      if Denominator = 0 then
         Result := (Quotient => To_UInt32 (idiv0), Remainder => 0);
         return Result;
      end if;
      Atomic.Critical_Section.Enter (State);
      SIO_Periph.DIV_UDIVIDEND := Numerator;
      SIO_Periph.DIV_UDIVISOR := Denominator;
      while not SIO_Periph.DIV_CSR.READY loop
         null;
      end loop;
      Result.Quotient := SIO_Periph.DIV_QUOTIENT;
      Result.Remainder := SIO_Periph.DIV_REMAINDER;
      Atomic.Critical_Section.Leave (State);
      return Result;
   end uidivmod;

end RP.Divider;
