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
    ];

  system.stateVersion = "23.11";

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
    layout = "pl";
    xkbVariant = "";
  };

  console.keyMap = "pl2";

  security = {
    rtkit.enable = true;
  };

  services = {
    printing.enable = true;
  };

  programs.zsh.enable = true;
  users.users.beko = {
    isNormalUser = true;
    description = "beko";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
  };

  environment = {
    shells = with pkgs; [ zsh ];
    systemPackages = with pkgs; [ git lshw appimage-run ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
