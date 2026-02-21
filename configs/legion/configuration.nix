{ config, pkgs, lib, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../hardware/monitors/flat.nix
      
      ./stylix.nix
      #../../modules/cinnamon.nix
      #../../modules/cosmic.nix
      #../../modules/kde.nix

      ../../modules/audio.nix
      ../../modules/fscrypt.nix
      ../../modules/gnome.nix
      ../../modules/hyprland.nix
      ../../modules/locale.nix
      ../../modules/psql.nix
      ../../modules/virt-manager.nix
      ../../modules/zsh.nix

      ../../profiles/beko.nix
      ../../profiles/steam.nix
    ];

  system.stateVersion = "24.05";

  home-manager = {
    backupFileExtension = "backup";
    sharedModules = [{
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
    #kernelPackages = pkgs.linuxKernel.packages.linux_6_12;
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 3;
      };
      efi.canTouchEfiVariables = true;
    };
  };

  # 6.18 has a backlight issue
  systemd.services.fixBacklight = {
    description = "Force maximum display brightness at boot";
    wantedBy = [ "multi-user.target" ];
    after = [ "sysinit.target" ];

    # Use 'script' at top level — *not* inside serviceConfig
    script = ''
      #!/bin/sh
      set -e
      for dev in /sys/class/backlight/amdgpu_bl*; do
        if [ -d "$dev" ]; then
          max=$(cat "$dev/max_brightness")
          printf "%s" "$max" > "$dev/brightness"
        fi
      done
    '';

    serviceConfig = {
      Type = "oneshot";
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
    orca.enable = false;
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
