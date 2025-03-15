{ pkgs, lib, osConfig, extra, ... }:

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
        name = "Flat-Remix-Blue-Dark";
        package = pkgs.flat-remix-icon-theme;
    };
  };

  home = {
    username = "beko";
    homeDirectory = "/home/beko";
    stateVersion = "24.05";

    packages = with pkgs; [
      brave
      calibre
      discord
      efibootmgr
      evince
      ffmpeg_7-full
      gimp
      gnucash
      gnumake
      #godot_4-mono
      jq
      keepassxc
      nomacs
      lxappearance-gtk2
      mpv
      nano
      newsflash
      nh
      proton-pass
      protonmail-desktop
      protonvpn-gui
      session-desktop
      signal-desktop
      texliveMedium
      thunderbird
      vcmi
      veracrypt
      whatsapp-for-linux
      zoom-us
    ] ++ [
      dotnetCorePackages.dotnet_9.sdk
      jetbrains-toolbox
      sqlitebrowser
    ] ++ [
      extra.beKode
    ];

    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "alacritty";
      BROWSER = "firefox";
      FLAKE = "/home/beko/Projects/dotFiles";
    };
  };
}
