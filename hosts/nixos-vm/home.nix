{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./../../modules/home-manager/kscreenlockerrc.nix
  ];

  kscreenlockerrc.autolock = false;
  kscreenlockerrc.lockonresume = false;
}
