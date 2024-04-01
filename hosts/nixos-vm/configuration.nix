{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  networking.hostName = "nixos-vm";

  # Add user to `vboxsf` group to allow shared folders
  users.users.phil.extraGroups = ["vboxsf"];
}
