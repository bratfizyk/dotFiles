{ lib, ... }:

let
  lua = lib.generators.mkLuaInline;
in
{
  # Lua variable
  mod = {
    _var = "SUPER";
  };

  # Standard Hyprland configuration
  config = {
    general = {
      gaps_in = 5;
      gaps_out = 8;
      border_size = 2;
      layout = "master";
    };

    cursor = {
      no_warps = true;
      default_monitor = "HDMI-A-1";
    };

    debug = {
      disable_logs = false;
      enable_stdout_logs = true;
    };

    decoration = {
      rounding = 12;
      rounding_power = 3;

      active_opacity = 0.95;
      inactive_opacity = 0.85;
      fullscreen_opacity = 1.0;

      dim_inactive = true;
      dim_strength = 0.12;

      blur = {
        enabled = true;
        size = 6;
        passes = 3;
        ignore_opacity = true;
        new_optimizations = true;
        xray = true;
        brightness = 0.85;
        contrast = 1.1;
        vibrancy = 0.18;
      };

      shadow = {
        enabled = true;
        range = 18;
        render_power = 3;
        offset = "0 5";
      };
    };

    input = {
      kb_layout = "pl";
      kb_options = "compose:menu,kpdl:dot";
      numlock_by_default = true;
    };

    misc = {
      initial_workspace_tracking = 2;
      vrr = true;
    };
  };

  # Monitor definitions
  monitor = [
    {
      _args = [{
        output = "eDP-1";
        mode = "1920x1200@165";
        position = "0x0";
        scale = 1;
      }];
    }
    {
      _args = [{
        output = "HDMI-A-1";
        mode = "1920x1200";
        position = "1920x0";
        scale = 1;
      }];
    }
  ];

  # Workspace rules
  workspace_rule =
    (map
      (name: {
        _args = [{
          workspace = "name:${name}";
          monitor = "eDP-1";
          default = name == "A";
        }];
      })
      (lib.stringToCharacters "ABCDEFGHIJ"))
    ++
    (map
      (n: {
        _args = [{
          workspace = toString n;
          monitor = "HDMI-A-1";
          default = n == 1;
        }];
      })
      (lib.range 1 10));

  # Environment variables
  env = [
    { _args = [ "LIBVA_DRIVER_NAME" "nvidia" ]; }
    { _args = [ "XDG_SESSION_TYPE" "wayland" ]; }
    { _args = [ "WEBKIT_DISABLE_DMABUF_RENDERER" "1" ]; }
    { _args = [ "AQ_DRM_DEVICES" "/dev/dri/card0:/dev/dri/card1" ]; }
  ];

  # Animation curve
  curve = [
    {
      _args = [
        "easeOut"
        {
          type = "bezier";
          points = [
            [ 0.05 0.9 ]
            [ 0.1 1.0 ]
          ];
        }
      ];
    }
  ];

  # Animations
  animation = [
    { _args = [{ leaf = "windows"; enabled = true; speed = 5; bezier = "easeOut"; style = "popin"; }]; }
    { _args = [{ leaf = "border"; enabled = true; speed = 5; bezier = "easeOut"; }]; }
    { _args = [{ leaf = "fade"; enabled = true; speed = 5; bezier = "easeOut"; }]; }
    { _args = [{ leaf = "workspaces"; enabled = true; speed = 5; bezier = "easeOut"; style = "slide"; }]; }
    { _args = [{ leaf = "layers"; enabled = true; speed = 5; bezier = "easeOut"; style = "slide"; }]; }
  ];
}
