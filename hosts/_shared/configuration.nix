{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./audio.nix
      ./gui.nix
      ./../../modules/nixos/australia.nix
      inputs.home-manager.nixosModules.default
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable networking
  networking.networkmanager.enable = true;
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Australia/Sydney";

  # Australian internationalisation and keyboard settings
  australia.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.phil = {
    isNormalUser = true;
    description = "phil";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # TODO: Add your user packages here
    ];
  };

  home-manager = {
    # Also pass to home manager modules
    extraSpecialArgs = { inherit inputs; };
    users = {
      "phil" = import ./home.nix;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    alejandra
    curl
    git
    gnumake
    imagemagick
    nano
    nmap
    openssh
    p7zip
    python3
    ripgrep
    tig
    wget
    zip
    zsh
  ];

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
