{ config, pkgs, lib, osConfig, ... }:

{
  programs.home-manager.enable = true;

  imports = [
    ../apps/alacritty.nix
    ../apps/chromium.nix
    ../apps/crypto.nix
    ../apps/firefox
    ../apps/git.nix
    ../apps/haskell.nix
    ../apps/libreoffice.nix
    ../apps/nixvim
    ../apps/obs.nix
    ../apps/vscode.nix
  ]
  ++ (lib.optionals (osConfig.programs.zsh.enable) [ ../apps/zsh ])
  ++ (lib.optionals (osConfig.programs.virt-manager.enable) [ ../apps/virt-manager.nix ])
  ++ (lib.optionals (osConfig.programs.hyprland.enable) [ ../apps/hyprland ]);
  
  home = {
    username = "beko";
    homeDirectory = "/home/beko";
    stateVersion = "23.11";

    packages = with pkgs; [
      calc
      calcurse
      discord
      efibootmgr
      ffmpeg_5-full
      gimp
      gnucash
      jq
      keepassxc
      loupe
      lunarvim
      lxappearance-gtk2
      mpv
      ranger
      signal-desktop
      thunderbird
      whatsapp-for-linux
      zoom-us
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
      TERMINAL = "alacritty";
      BROWSER = "firefox";
    };
  };
}
