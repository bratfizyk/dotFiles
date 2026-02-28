{ pkgs, lib, osConfig, extra, ... }:
let
  steamWithExtras = pkgs.steam.override {
    extraLibraries = pkgs: [
      pkgs.pkgsi686Linux.pipewire.jack   # 32‑bit PipeWire‑JACK
    ];
    extraPkgs = pkgs: [
      pkgs.wineasio
    ];
  };
in
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
      steamWithExtras
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
    ] ++ [
      qjackctl
      pavucontrol
      qpwgraph
    ];

    sessionVariables = {
      EDITOR = "nano";
      TERMINAL = "alacritty";
      BROWSER = "firefox";
      XDG_SESSION_DESKTOP = "GNOME";
      PATH = "${steamWithExtras}/bin:${pkgs.lib.makeBinPath [ steamWithExtras ]}:$PATH";
    };
  };
}
