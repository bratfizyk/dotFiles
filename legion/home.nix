{ config, pkgs, osConfig, ... }:

{
  programs.home-manager.enable = true;

  imports = [
    ../apps/alacritty.nix
    ../apps/chromium.nix
    ../apps/firefox/firefox.nix
    ../apps/git.nix
    ../apps/haskell.nix
    ../apps/libreoffice.nix
    ../apps/nixvim.nix
    ../apps/vscode.nix
  ] ++ (
    if (osConfig.programs.zsh.enable == true)
      then [ ../apps/zsh/zsh.nix ]
      else [ ]
  ) ++ (
    if (osConfig.programs.virt-manager.enable == true)
      then [ ../apps/virt-manager.nix ]
      else [ ]
  );

  home = {
    username = "beko";
    homeDirectory = "/home/beko";
    stateVersion = "23.11";

    packages = with pkgs; [
      efibootmgr
      gnucash
      keepassxc
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
      TERM = "alacritty";
      BROWSER = "firefox";
    };
  };
}
