{ config, pkgs, lib, osConfig, ... }:

{
  programs.home-manager.enable = true;

  imports = [
    ./defaultApps.nix

    ../../apps/alacritty.nix
    ../../apps/chromium.nix
    ../../apps/firefox
    ../../apps/git.nix
    ../../apps/haskell.nix
    ../../apps/libreoffice.nix
    ../../apps/obs.nix
    ../../apps/vscode.nix
  ]
  ++ (lib.optionals (osConfig.programs.zsh.enable) [ ../../apps/zsh ])
  ++ (lib.optionals (osConfig.programs.virt-manager.enable) [ ../../apps/virt-manager.nix ])
  ++ (lib.optionals (osConfig.programs.hyprland.enable) [ ../../apps/hyprland ]);

  gtk = {
    enable = true;
    iconTheme = {
        name = "kora";
        package = pkgs.kora-icon-theme;
    };
  };

  home = {
    username = "beko";
    homeDirectory = "/home/beko";
    stateVersion = "24.05";

    packages = with pkgs; [
      brave
      discord
      efibootmgr
      ffmpeg_7-full
      gimp
      gnucash
      gnumake
      godot_4
      jq
      keepassxc
      loupe
      lunarvim
      lxappearance-gtk2
      mpv
      nano
      nh
      peazip
      proton-pass
      #protonmail-desktop
      protonvpn-gui
      ranger
      signal-desktop
      sqlitebrowser
      thunderbird
      veracrypt
      whatsapp-for-linux
      yarn
      zoom-us
    ];

    sessionVariables = {
      EDITOR = "lvim";
      TERMINAL = "alacritty";
      BROWSER = "firefox";
      FLAKE = "/home/beko/Projects/dotFiles";
    };
  };
}
