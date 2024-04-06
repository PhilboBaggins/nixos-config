{
  inputs,
  pkgs,
  config,
  lib,
  nixpkgs,
  ...
}: let
  cfg = config.philShared.gui;
in {
  options.philShared.gui = {
    enable = lib.mkEnableOption "Enable GUI";
  };

  config = lib.mkIf cfg.enable {
    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the KDE Plasma Desktop Environment.
    services.xserver.displayManager.sddm.enable = true;
    services.xserver.desktopManager.plasma5.enable = true;

    # List packages installed in system profile
    environment.systemPackages = with pkgs; [
      firefox
      gimp
      inkscape
      thunderbird
      vlc
    ];

    # Enable automatic login for the user.
    services.xserver.displayManager.autoLogin.enable = true;
    services.xserver.displayManager.autoLogin.user = "phil";

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;
  };
}
