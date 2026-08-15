{ pkgs, lib, osConfig, extra, ... }:

{
  programs.home-manager.enable = true;

  imports = [
    ./defaultApps.nix

    ../../apps/alacritty.nix
    ../../apps/chromium.nix
    ../../apps/firefox
    ../../apps/git.nix
    ../../apps/office.nix
    ../../apps/llm.nix
    ../../apps/obs.nix
    ../../apps/vscode.nix
  ]
  ++ (lib.optionals (osConfig.programs.zsh.enable) [ ../../apps/zsh ])
  ++ (lib.optionals (osConfig.programs.virt-manager.enable) [ ../../apps/virt-manager.nix ])
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
        profileNames = [ "beko" ];
      };
    };
  };

  home = {
    username = "beko";
    homeDirectory = "/home/beko";
    stateVersion = "24.05";

    pointerCursor = {
      enable = true;
    };

    packages = with pkgs; [
      brave
      discord
      efibootmgr
      evince
      ffmpeg_7-full
      gimp
      gnucash
      jq
      keepassxc
      nomacs
      lxappearance
      mpv
      #musescore
      nano
      nh
      pavucontrol
      peazip
      proton-pass
      proton-vpn
      qjackctl
      signal-desktop
      strawberry
      texliveFull
      thunderbird
      vcmi
      veracrypt
    ] ++ [
      gnumake
      godot_4
      jetbrains-toolbox
      nodejs
      sqlitebrowser
    ] ++ [
      extra.beKode
    ];

    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "alacritty";
      BROWSER = "firefox";
      FLAKE = "/home/beko/Projects/dotFiles";
      XDG_SESSION_DESKTOP = "hyprland";
      NH_FLAKE = "/home/beko/Projects/dotFiles";
    };
  };
}
