{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../hardware/monitors/flat.nix

      ../../modules/audio.nix
      ../../modules/ecryptfs.nix
      ../../modules/kde.nix
      ../../modules/locale.nix
      ../../modules/virt-manager.nix
      ../../modules/zsh.nix

      ../../profiles/beko.nix
    ];

  system.stateVersion = "24.05";

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
    hostName = "beko-scaffold";
    networkmanager.enable = true;
    firewall.enable = true;
  };

  services = {
    xserver = {
      enable = true;
      displayManager = {
        gdm = {
          enable = true;
        };
      };
    };
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  environment.systemPackages = with pkgs; [
    appimage-run git lshw
  ];
  
  services.printing.enable = true;

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  home-manager.backupFileExtension = "backup";
}
