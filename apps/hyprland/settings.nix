{
  "$mod" = "SUPER";
  general = {
    monitor = [
      "eDP-1,1920x1200@165,0x0,1"
      "HDMI-A-1,1920x1200,1920x0,1"
    ];
    no_cursor_warps = true;
  };
  decoration = {
    rounding = 3;
  };
  input = {
    kb_layout = "pl";
    kb_options = "compose:menu";
  };
  bind = [
    "$mod, Return, exec, alacritty"
    "$mod, Space, swapactiveworkspaces, current +1"
    
    "$mod, D, exec, rofi -show drun -show-icons"
    "$mod, E, exec, thunar"
    "$mod, F, exec, firefox"
    "$mod, T, exec, thunderbird"

    "$mod SHIFT, M, exec, wlogout"
    "$mod SHIFT, R, forcerendererreload,"
    "$mod SHIFT, Q, killactive,"

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

    ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
    ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"

  ];
  bindm = [
    # Move/resize windows with mainMod + LMB/RMB and dragging
    "$mod, mouse:272, movewindow"
    "$mod, mouse:273, resizewindow"
  ];
  exec-once = [
    "hyprctl setcursor Bibata-Modern-Classic 20"
    "waybar &"
    "dunst"
  ];
  env = [
    "LIBVA_DRIVER_NAME,nvidia"
    "XDG_SESSION_TYPE,wayland"
    "WLR_NO_HARDWARE_CURSORS,1"
    #"__GLX_VENDOR_LIBRARY_NAME,nvidia"
    #"GBM_BACKEND=nvidia-drm"
    #"NIXOS_OZONE_WL,1"
  ];
}