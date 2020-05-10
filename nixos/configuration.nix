{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./cachix.nix
      ./nix/fonts.nix
      (import "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos") 
    ];

  home-manager.users.beko = (import ./home.nix);

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";
  boot.initrd.checkJournalingFS = false;

  networking.hostName = "nixos-beko";
  networking.useDHCP = false;
  networking.interfaces.enp0s3.useDHCP = true;

  console = {
    keyMap = "pl";
    font = "Lat2-Terminus16";
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    curl vim vscode firefox oh-my-zsh qutebrowser
    gcc
    rxvt_unicode
    clipmenu
  ];

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  environment.pathsToLink = [ "/libexec" ];
  services.xserver = {
    enable = true;
    layout = "us";
    
    # Enable the KDE Desktop Environment.
    #displayManager.sddm.enable = true;
    #desktopManager.plasma5.enable = true;
    
    displayManager = {
      lightdm.enable = true;
      defaultSession =  "none+i3";
    };

    desktopManager.xterm.enable = false;
    
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      extraPackages = with pkgs; [
        dmenu i3status i3lock i3blocks
      ];
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.beko = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [ "wheel" "vboxusers" ];
  };

  system.stateVersion = "20.03";

  # Make VirtualBox happy
  security.rngd.enable = false;
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.x11 = true;
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
}
