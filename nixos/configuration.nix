{ config, pkgs, ... }:

{
    imports =
      [
        ./hardware-configuration.nix
        ./nix/network.nix
        ./nix/local.nix
        ./nix/sound.nix
        ./nix/gui.nix
        ./nix/fonts.nix
        # My personal project
        # ../../Projects/hwdp/nginx.nix
        (import "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/release-21.05.tar.gz}/nixos")
      ];

    # Use the GRUB 2 boot loader.
    boot.loader.grub.enable = true;
    boot.loader.grub.version = 2;
    # Virt Manager links drives as "/dev/vdX"
    boot.loader.grub.device = "/dev/vda";
    boot.initrd.checkJournalingFS = false;

    # My user
    users.users.beko = {
        shell = pkgs.zsh;
        isNormalUser = true;
        extraGroups = [ "wheel" ];
    };

    # Home-Manager for my user
    home-manager.users.beko = (import ./home.nix);
    system.stateVersion = "21.05";
}
