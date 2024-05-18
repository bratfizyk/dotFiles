{ config, pkgs, lib, osConfig, ... }:

{
  programs.home-manager.enable = true;

  imports = [
    ../../apps/alacritty.nix
    ../../apps/crypto.nix
    ../../apps/firefox
    ../../apps/git.nix
  ]
  ++ (lib.optionals (osConfig.programs.zsh.enable) [ ../../apps/zsh ])
  ++ (lib.optionals (osConfig.programs.virt-manager.enable) [ ../../apps/virt-manager.nix ]);
  
  home = {
    username = "beko";
    homeDirectory = "/home/beko";
    stateVersion = "23.11";

    packages = with pkgs; [
      efibootmgr
      keepassxc
      nh
      protonvpn-gui
    ];

    file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
    };

    sessionVariables = {
      EDITOR = "kate";
      TERMINAL = "alacritty";
      BROWSER = "firefox";
      FLAKE = "/home/beko/Projects/dotFiles";
    };
  };
}
