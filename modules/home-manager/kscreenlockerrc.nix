{ config, pkgs, lib, ... }:

let
  cfg = config.kscreenlockerrc;
in
{
  options.kscreenlockerrc = {
    autolock = lib.mkEnableOption "????????????";
    lockonresume = lib.mkEnableOption "????????????";
  };

  config.home.file = {
    ".config/kscreenlockerrc".text = ''
      [$Version]
      update_info=kscreenlocker.upd:0.1-autolock

      [Daemon]
      Autolock=${lib.boolToString cfg.autolock}
      LockOnResume=${lib.boolToString cfg.lockonresume}
    '';
  };
}
