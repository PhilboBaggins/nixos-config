{
  config,
  lib,
  ...
}: let
  cfg = config.kscreenlockerrc;
in {
  options.kscreenlockerrc = {
    autolock = lib.mkEnableOption "Lock screen automatically after `timeout` minutes of inactivity";
    lockonresume = lib.mkEnableOption "Lock screen automatically after waking from sleep";
    timeout = lib.mkOption {
      type = lib.types.int;
      default = 5;
      description = "Time in minutes of inactivity before the screen is locked";
    };
  };

  config.home.file = {
    ".config/kscreenlockerrc".text = ''
      [$Version]
      update_info=kscreenlocker.upd:0.1-autolock

      [Daemon]
      Autolock=${lib.boolToString cfg.autolock}
      LockOnResume=${lib.boolToString cfg.lockonresume}
      Timeout=${builtins.toString cfg.timeout}
    '';
  };
}
