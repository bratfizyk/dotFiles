{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../hardware/monitors/flat.nix
      ../modules/ecryptfs.nix
      ../modules/kde.nix
      ../modules/locale.nix
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
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  users.users.beko = {
    isNormalUser = true;
    description = "beko";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    packages = with pkgs; [ lshw ];
  };

  environment = {
    shells = with pkgs; [ zsh ];
    systemPackages = with pkgs; [ git ];
  };

  programs = {
    zsh.enable = true;
    virt-manager.enable = true;
  };

  virtualisation.libvirtd.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  sound.enable = true;
  hardware = {
    pulseaudio = {
      enable = false;
    };
  };
}
