with RP2040_SVD.XIP_CTRL; use RP2040_SVD.XIP_CTRL;

package body RP.Flash.Cache is
   procedure Enable is
   begin
      XIP_CTRL_Periph.CTRL.POWER_DOWN := False;
      XIP_CTRL_Periph.CTRL.EN := True;
   end Enable;

   procedure Disable is
   begin
      XIP_CTRL_Periph.CTRL.EN := False;
   end Disable;

   procedure Power_Down is
   begin
      XIP_CTRL_Periph.CTRL.POWER_DOWN := True;
   end Power_Down;

   function Is_Enabled
      return Boolean
   is (XIP_CTRL_Periph.CTRL.EN);

   procedure Flush
      (Wait : Boolean := True)
   is
   begin
      XIP_CTRL_Periph.FLUSH.FLUSH := True;
      while Wait and not XIP_CTRL_Periph.STAT.FLUSH_READY loop
         null;
      end loop;
   end Flush;

   function Hit_Count
      return HAL.UInt32
   is (XIP_CTRL_Periph.CTR_HIT);

   function Access_Count
      return HAL.UInt32
   is (XIP_CTRL_Periph.CTR_ACC);

   procedure Reset_Counters is
   begin
      XIP_CTRL_Periph.CTR_HIT := 1;
      XIP_CTRL_Periph.CTR_ACC := 1;
   end Reset_Counters;
end RP.Flash.Cache;
