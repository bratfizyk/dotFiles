{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../hardware/monitors/flat.nix

      ../../modules/audio.nix
      ../../modules/ecryptfs.nix
      ../../modules/kde.nix
      ../../modules/hyprland.nix
      ../../modules/locale.nix
      ../../modules/virt-manager.nix
      ../../modules/zsh.nix

      ../../profiles/beko.nix
    ];

  system.stateVersion = "24.05";

  home-manager = {
    backupFileExtension = "backup";
  };

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_6_1;
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "beko-nixos";
    networkmanager.enable = true;
    firewall.enable = true;
  };

  services = {
    xserver = {
      enable = true;
      displayManager = {
        gdm = {
          enable = true;
          wayland = true;
        };
      };
    };
    displayManager = {
      defaultSession = "hyprland";
    };
  };

  services.gnome.gnome-keyring.enable = true;
  programs.ssh.startAgent = true;

  environment.systemPackages = with pkgs; [
    appimage-run git lshw
  ];
  
  services.printing.enable = true;

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };
}
