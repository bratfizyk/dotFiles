{ config, pkgs, ... }:

{
    imports =
      [
        ./hardware-configuration.nix
        ./cachix.nix
        ./nix/sound.nix
        ./nix/gui.nix
        ./nix/fonts.nix
        (import "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos") 
      ];

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

    time.timeZone = "Europe/Zurich";

    users.users.beko = {
        shell = pkgs.zsh;
        isNormalUser = true;
        extraGroups = [ "wheel" "vboxusers" ];
    };

    home-manager.users.beko = (import ./home.nix);

    system.stateVersion = "20.03";

    # vbox
    nixpkgs.config.allowUnfree = true;
    virtualisation.virtualbox.guest.enable = true;
    virtualisation.virtualbox.guest.x11 = true;
    virtualisation.virtualbox.host.enable = true;
    virtualisation.virtualbox.host.enableExtensionPack = true;
}
