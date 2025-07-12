{ config, pkgs, lib, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../hardware/monitors/flat.nix
      
      ./stylix.nix

      ../../modules/audio.nix
      ../../modules/ecryptfs.nix
      ../../modules/gnome.nix
      ../../modules/hyprland.nix
      #../../modules/kde.nix
      ../../modules/locale.nix
      ../../modules/psql.nix
      ../../modules/virt-manager.nix
      ../../modules/zsh.nix

      ../../profiles/beko.nix
    ];

  system.stateVersion = "24.05";

  home-manager = {
    backupFileExtension = "backup";
    sharedModules = [{
      stylix.targets.kde.enable = false;
      stylix.targets.vscode.enable = false;
      stylix.targets.rofi.enable = false;
      stylix.targets.waybar.enable = false;
    }];
  };

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  virtualisation.docker.enable = true;

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_6_12;
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "beko-nixos";
    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };
    firewall.enable = true;
  };

  services = {
    xserver.enable = true;
    displayManager = {
      defaultSession = "hyprland";
      gdm = {
        enable = true;
        wayland = true;
      };
    };
  };
  
  services.gnome.gnome-keyring.enable = true;
  # Not needed if GNOME is installed
  # programs.ssh = {
  #   startAgent = true;
  # };

  environment.systemPackages = with pkgs; [
    appimage-run git lshw
  ];
  
  services.printing.enable = true;

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };
}
