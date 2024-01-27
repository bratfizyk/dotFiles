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
      ../modules/hyprland.nix
      ../modules/locale.nix
      ../modules/virt-manager.nix
      ../modules/zsh.nix

      ../profiles/beko.nix
    ];

  system.stateVersion = "23.11";

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

  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "beko-nixos";
    networkmanager.enable = true;
  };

  services = {
    xserver = {
      enable = true;
      displayManager = {
        gdm = {
          enable = true;
          wayland = true;
        };
        defaultSession = "hyprland";
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
  
  security.rtkit.enable = true;
  services.printing.enable = true;

  security = {
    polkit.enable = true;
  };
}
