{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../hardware/monitors/flat.nix

      ../modules/audio.nix
      ../modules/crypto.nix
      ../modules/ecryptfs.nix
      ../modules/kde.nix
      ../modules/locale.nix
      ../modules/virt-manager.nix
      ../modules/zsh.nix

      ../profiles/beko.nix
    ];

  system.stateVersion = "23.11";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "beko-nixos";
    networkmanager.enable = true;
  };

  services.xserver = {
    enable = true;
    displayManager = {
      gdm = {
        enable = true;
        wayland = true;
      };
      defaultSession = "plasma";
    };
  };

  environment.systemPackages = with pkgs; [
    appimage-run
    git
    lshw
  ];
  
  security.rtkit.enable = true;
  services.printing.enable = true;
}
