{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  imports = [
    ../apps/alacritty.nix
    ../apps/chromium.nix
    ../apps/git.nix
    ../apps/haskell.nix
    ../apps/virt-manager.nix
    ../apps/vscode.nix
    ../apps/zsh/zsh.nix
  ];

  home = {
    username = "beko";
    homeDirectory = "/home/beko";
    stateVersion = "23.11";

    packages = with pkgs; [
      keepassxc
      signal-desktop
      efibootmgr
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
      EDITOR = "vim";
      TERM = "alacritty";
      BROWSER = "firefox";
    };
  };
}
