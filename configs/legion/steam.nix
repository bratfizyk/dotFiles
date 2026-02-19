{ pkgs, lib, osConfig, extra, ... }:

{
  programs.home-manager.enable = true;

  imports = [
    ./defaultApps.nix

    ../../apps/alacritty.nix
    ../../apps/firefox
    ../../apps/libreoffice.nix
    ../../apps/obs.nix
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
      lutris-free
      nano
      pavucontrol
      protonvpn-gui
      signal-desktop
      vcmi
      # wechat
    ] ++ [
      steam
      steam-run
      cef-binary
      libcxx
      ffmpeg
      libxft
      llvmPackages.libc
      gccNGPackages_15.libatomic
      llvmPackages_20.clang
      gst_all_1.gstreamer
      gst_all_1.gst-plugins-base
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-ugly
      gst_all_1.gst-libav
      nss
      gnutls
      libpng12
      zlib
      wine64
      wine-wayland
      winetricks
    ];

    sessionVariables = {
      EDITOR = "nano";
      TERMINAL = "alacritty";
      BROWSER = "firefox";
    };
  };
}
