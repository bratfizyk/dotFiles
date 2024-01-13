{ pkgs, lib, ... }:

# ToDo: Doesn't work as I'd like it to. Needs some more time

let 
  mod = "Mod4";
  my-fonts = {
    names = [ "Meslo LGS NF" "Hack" ];
    style = "Bold Semi-Condensed";
    size = 11.0;
  };
in {
  imports = [ 
    ./gtk.nix
  ];

  xsession.scriptPath = ".hm-xsession";

  home.packages = with pkgs; [
    dmenu
    i3-gaps
    i3status
    i3status-rust
    i3lock
    i3blocks
    pulsemixer
    gsimplecal
  ];

  programs.rofi = {
    enable = true;
    theme = "solarized_alternate";
  };

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    
    config = {
      modifier = mod;
      fonts = my-fonts;
      gaps = {
        inner = 15;
        outer = 10;
        smartGaps = true;
      };

      terminal = "alacritty";

      keybindings = lib.mkOptionDefault {
        "${mod}+Shift+d" = ''exec "${pkgs.rofi}/bin/rofi -modi window,drun -show drun"'';
      };

      bars = [
        {
          position = "top";
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ${./i3status.toml}";
          fonts = my-fonts;
        }
      ];
    };
    extraConfig = ''
      for_window [class="floating"] floating enable;
      for_window [class=^.*"] border pixel 0;

      bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +2%
      bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -2%
      bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 0 toggle

      exec i3-msg workspace 1
    '';
  };
}