{
  workspace = [
    "name:A,monitor:eDP-1,default:true"
    "name:B,monitor:eDP-1"
    "name:C,monitor:eDP-1"
    "name:D,monitor:eDP-1"
    "name:E,monitor:eDP-1"
    "name:F,monitor:eDP-1"
    "name:G,monitor:eDP-1"
    "name:H,monitor:eDP-1"
    "name:I,monitor:eDP-1"
    "name:J,monitor:eDP-1"

    "1,monitor:HDMI-A-1,default:true"
    "2,monitor:HDMI-A-1"
    "3,monitor:HDMI-A-1"
    "4,monitor:HDMI-A-1"
    "5,monitor:HDMI-A-1"
    "6,monitor:HDMI-A-1"
    "7,monitor:HDMI-A-1"
    "8,monitor:HDMI-A-1"
    "9,monitor:HDMI-A-1"
    "10,monitor:HDMI-A-1"
  ];

  "$mod" = "SUPER";
  general = {
    gaps_in = 5;
    gaps_out = 10;
    layout = "master";
    monitor = [
      "eDP-1,1920x1200@165,0x0,1"
      "HDMI-A-1,1920x1200,1920x0,1"
    ];
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
    rounding = 10;
    active_opacity = 0.95;
    inactive_opacity = 0.85;
    fullscreen_opacity = 1.0;
    dim_inactive = true;
    dim_strength = 0.15;
    blur = {
      enabled = true;
      size = 8;
      passes = 3;
      new_optimizations = true;
    };
    shadow = {
      enabled = true;
      range = 20;
      render_power = 3;
    };
  };

  animations = {
    enabled = true;
    
    bezier = [
      "easeOut, 0.05, 0.9, 0.1, 1.0"
    ];
    
    animation = [
      "windows, 1, 5, easeOut, popin"
      "border, 1, 5, easeOut"
      "fade, 1, 5, easeOut"
      "workspaces, 1, 5, easeOut, slide"
      "layers, 1, 5, easeOut, slide"
    ];
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

  bind = [
    "$mod, Return, exec, alacritty"
    "$mod, Space, swapactiveworkspaces, current +1"
    "$mod, F7, exec, busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 1500"
    "$mod, F8, exec, busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 6500"
    
    "$mod, B, exec, brave"
    "$mod, C, exec, chromium"
    # "$mod, D, exec, rofi -show drun -me-select-entry '' -me-accept-entry MousePrimary"
    "$mod, D, exec, noctalia msg panel-toggle launcher"
    "$mod, E, exec, nautilus"
    "$mod, F, exec, firefox"
    "$mod, G, exec, gnucash"
    "$mod, K, exec, keepassxc"
    "$mod, L, exec, hyprlock"
    "$mod, P, exec, proton-pass"
    "$mod, Q, exec, qalculate-gtk"
    "$mod, S, exec, signal-desktop --password-store=\"gnome-libsecret\""
    "$mod, T, exec, thunderbird"
    "$mod, V, exec, SDL_VIDEODRIVER=x11 vcmiclient"
    "$mod, X, exec, gnome-text-editor"
    "$mod, Y, exec, freetube"

    "$mod SHIFT, B, exec, virsh --connect qemu:///system start Bank && virt-viewer --connect qemu:///system Bank"
    "$mod SHIFT, F, fullscreen,"
    "$mod SHIFT, M, exec, noctalia msg panel-open session"
    "$mod SHIFT, P, exit,"
    "$mod SHIFT, Q, killactive,"
    "$mod SHIFT, R, forcerendererreload,"

    # Switch workspaces with mainMod + [0-9]
    "$mod, 1, workspace, 1"
    "$mod, 2, workspace, 2"
    "$mod, 3, workspace, 3"
    "$mod, 4, workspace, 4"
    "$mod, 5, workspace, 5"
    "$mod, 6, workspace, 6"
    "$mod, 7, workspace, 7"
    "$mod, 8, workspace, 8"
    "$mod, 9, workspace, 9"
    "$mod, 0, workspace, 10"

    "$mod CONTROL, 1, workspace, name:A"
    "$mod CONTROL, 2, workspace, name:B"
    "$mod CONTROL, 3, workspace, name:C"
    "$mod CONTROL, 4, workspace, name:D"
    "$mod CONTROL, 5, workspace, name:E"
    "$mod CONTROL, 6, workspace, name:F"
    "$mod CONTROL, 7, workspace, name:G"
    "$mod CONTROL, 8, workspace, name:H"
    "$mod CONTROL, 9, workspace, name:I"
    "$mod CONTROL, 0, workspace, name:J"

    "$mod, Left, workspace, e-1"
    "$mod, Right, workspace, e+1"

    "$mod SHIFT, Left, movetoworkspace, e-1"
    "$mod SHIFT, Right, movetoworkspace, e+1"

    "$mod CONTROL, Left, swapwindow, l"
    "$mod CONTROL, Right, swapwindow, r"

    # mouse wheel for switching workspaces
    "$mod, mouse_down, workspace, e-1"
    "$mod, mouse_up, workspace, e+1"

    # Move active window to a workspace with mainMod + SHIFT + [0-9]
    "$mod SHIFT, 1, movetoworkspacesilent, 1"
    "$mod SHIFT, 2, movetoworkspacesilent, 2"
    "$mod SHIFT, 3, movetoworkspacesilent, 3"
    "$mod SHIFT, 4, movetoworkspacesilent, 4"
    "$mod SHIFT, 5, movetoworkspacesilent, 5"
    "$mod SHIFT, 6, movetoworkspacesilent, 6"
    "$mod SHIFT, 7, movetoworkspacesilent, 7"
    "$mod SHIFT, 8, movetoworkspacesilent, 8"
    "$mod SHIFT, 9, movetoworkspacesilent, 9"
    "$mod SHIFT, 0, movetoworkspacesilent, 10"

    # Audio
    ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ --limit 1.5"
    ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

    # Other
    ", Print, exec, grim -g \"$(slurp)\" - | swappy -f -"
  ];

  bindm = [
    # Move/resize windows with mainMod + LMB/RMB and dragging
    "$mod, mouse:272, movewindow"
    "$mod, mouse:273, resizewindow"
  ];

  exec-once = [
    # "waybar"
    "noctalia"
    "wl-gammarelay-rs &"
    # "nm-applet --indicator"
    # "pasystray --notify=none --volume-max=150 &"
    "udiskie --no-automount --tray &"
    "systemctl --user start hyprpolkitagent"
    "protonvpn-app &"
    # sudo rfkill unblock bluetooth
    # rfkill list
    # "blueman-applet &"
  ];

  env = [
    "LIBVA_DRIVER_NAME,nvidia"
    "XDG_SESSION_TYPE,wayland"
    #"WLR_NO_HARDWARE_CURSORS,1"
    #"NIXOS_OZONE_WL,1"
    # For GnuCash
    "WEBKIT_DISABLE_DMABUF_RENDERER,1"
    "AQ_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1"
  ];

  plugin = { };
}
