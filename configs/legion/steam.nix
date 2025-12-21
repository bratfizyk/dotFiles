{ pkgs, lib, osConfig, extra, ... }:

{
  programs.home-manager.enable = true;

  imports = [
    ./defaultApps.nix

    ../../apps/alacritty.nix
    ../../apps/firefox
    ../../apps/libreoffice.nix
  ]
  ++ (lib.optionals (osConfig.programs.zsh.enable) [ ../../apps/zsh ])
  ++ (lib.optionals (osConfig.programs.hyprland.enable) [ ../../apps/hyprland ]);

  gtk = {
    enable = true;
    iconTheme = {
      name = "Flat-Remix-Blue-Dark";
      package = pkgs.flat-remix-icon-theme;
    };
  };

  home = {
    username = "steam";
    homeDirectory = "/home/steam";
    stateVersion = "24.05";

    packages = with pkgs; [
      discord
      nano
      pavucontrol
      protonvpn-gui
      session-desktop
      steam
      vcmi
      # wechat
    ];

    sessionVariables = {
      EDITOR = "nano";
      TERMINAL = "alacritty";
      BROWSER = "firefox";
    };
  };
}
