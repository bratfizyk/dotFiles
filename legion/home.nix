{ config, pkgs, lib, osConfig, ... }:

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
  ]
  ++ (lib.optionals (osConfig.programs.zsh.enable) [ ../apps/zsh/zsh.nix ])
  ++ (lib.optionals (osConfig.programs.virt-manager.enable) [ ../apps/virt-manager.nix ])
  ++ (lib.optionals (osConfig.programs.hyprland.enable) [ ../apps/hyprland.nix ]);

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
      TERMINAL = "alacritty";
      BROWSER = "firefox";

      WLR_NO_HARDWARE_CURSORS = "1";
      LIBVA_DRIVER_NAME = "nvidia";
      XDG_SESSION_TYPE = "wayland";
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      NIXOS_OZONE_WL = "1";
    };
  };
}
