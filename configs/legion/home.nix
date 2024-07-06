{ config, pkgs, lib, osConfig, ... }:

{
  programs.home-manager.enable = true;

  imports = [
    ../../apps/alacritty.nix
    ../../apps/chromium.nix
    ../../apps/firefox
    ../../apps/git.nix
    ../../apps/haskell.nix
    ../../apps/libreoffice.nix
    ../../apps/nixvim
    ../../apps/obs.nix
    ../../apps/vscode.nix
  ]
  ++ (lib.optionals (osConfig.programs.zsh.enable) [ ../../apps/zsh ])
  ++ (lib.optionals (osConfig.programs.virt-manager.enable) [ ../../apps/virt-manager.nix ])
  ++ (lib.optionals (osConfig.programs.hyprland.enable) [ ../../apps/hyprland ]);

  xdg.mimeApps.defaultApplications = {
    "image/png" = [ "loupe.desktop" ];
    "image/jpeg" = [ "loupe.desktop" ];
  };

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
      nh
      protonvpn-gui
      ranger
      signal-desktop
      thunderbird
      whatsapp-for-linux
      yarn
      zoom-us
    ];

    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "alacritty";
      BROWSER = "firefox";
      FLAKE = "/home/beko/Projects/dotFiles";
    };
  };
}
