{ config, pkgs, ... }:

{
    imports =
      [
        ./hardware-configuration.nix
        ./cachix.nix
        ./nix/network.nix
        ./nix/local.nix
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

    users.users.beko = {
        shell = pkgs.zsh;
        isNormalUser = true;
        extraGroups = [ "wheel" ];
    };

    home-manager.users.beko = (import ./home.nix);
    system.stateVersion = "20.09";
}
