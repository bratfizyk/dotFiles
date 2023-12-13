{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "beko-nixos";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Zurich";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  services.xserver = {
    enable = true;
    displayManager.sddm = {
      enable = true;
      setupScript = ''
        xrandr --setprovideroutputsource modesetting NVIDIA-0
        xrandr --auto
        xrandr --output HDMI-A-1 --auto --primary
        xrandr --output eDP-1 --left-of HDMI-A-1 --noprimary
      '';
    };
    desktopManager.plasma5.enable = true;
    layout = "pl";
    xkbVariant = "";
  };

  console.keyMap = "pl2";

  services.printing.enable = true;

  security.rtkit.enable = true;

  sound.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.beko = {
    isNormalUser = true;
    description = "beko";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    packages = with pkgs; [
      firefox
      kate
      lshw
      vim
    ];
  };

  nixpkgs.config.allowUnfree = true;

  # Remove after 23.11
  programs.dconf.enable = true;

  environment = {
    shells = with pkgs; [ zsh ];
    systemPackages = with pkgs; [
      # Move to home-manager after 23.11
      virt-manager
    ];
  };

  programs = {
    zsh.enable = true;
  };

  system.stateVersion = "23.11";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  virtualisation.libvirtd.enable = true;

  hardware = {
    pulseaudio = {
      enable = false;
    };
  };
}
