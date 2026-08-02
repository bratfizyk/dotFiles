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
    ../../apps/chromium.nix
    ../../apps/firefox
    ../../apps/office.nix
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

  stylix = {
    targets = {
      firefox = {
        enable = false;
      };
    };
  };

  home = {
    username = "steam";
    homeDirectory = "/home/steam";
    stateVersion = "24.05";

    pointerCursor = {
      enable = true;
    };

    packages = with pkgs; [
      discord
      keepassxc
      lutris
      nano
      pavucontrol
      proton-vpn
      signal-desktop
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
