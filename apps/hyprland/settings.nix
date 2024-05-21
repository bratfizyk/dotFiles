{
  "$mod" = "SUPER";
  general = {
    monitor = [
      "eDP-1,1920x1200@165,0x0,1"
      "HDMI-A-1,1920x1200,1920x0,1"
    ];
    no_cursor_warps = true;
  };

  debug = {
    disable_logs = false;
    enable_stdout_logs = true;
  };

  decoration = {
    rounding = 3;
  };

  input = {
    kb_layout = "pl";
    kb_options = "compose:menu,kpdl:dot";
    numlock_by_default = true;
  };

  bind = [
    "$mod, Return, exec, alacritty"
    "$mod, Space, swapactiveworkspaces, current +1"
    "$mod, F7, exec, busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 1500"
    "$mod, F8, exec, busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 6500"
    
    "$mod, D, exec, rofi -show drun -show-icons -icon-theme Kora"
    "$mod, E, exec, nemo"
    "$mod, F, exec, firefox"
    "$mod, G, exec, gnucash"
    "$mod, I, exec, swaync-client -t -sw"
    "$mod, K, exec, keepassxc"
    "$mod, L, exec, swaylock --screenshots --clock --indicator --indicator-radius 100 --indicator-thickness 7 --effect-blur 7x5 --effect-vignette 0.5:0.5 --ring-color bb00cc --key-hl-color 880033 --line-color 00000000 --inside-color 00000088 --separator-color 00000000 --fade-in 0.2"
    "$mod, Q, exec, qalculate-gtk"
    "$mod, T, exec, thunderbird"

    "$mod SHIFT, B, exec, virsh --connect qemu:///system start Bank && virt-viewer --connect qemu:///system Bank"
    "$mod SHIFT, F, fullscreen,"
    "$mod SHIFT, M, exec, wlogout"
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
    "waybar &"
    "swaync &"
    "wl-gammarelay-rs &"
    "nm-applet --indicator"
    "pasystray --notify=none --volume-max=150 &"
    "udiskie --no-automount --tray &"
    "swaybg -i ${../../assets/wallpapers/Elementary-OS.jpg} &"
  ];

  env = [
    "LIBVA_DRIVER_NAME,nvidia"
    "XDG_SESSION_TYPE,wayland"
    "WLR_NO_HARDWARE_CURSORS,1"
    #"__GLX_VENDOR_LIBRARY_NAME,nvidia"
    #"GBM_BACKEND=nvidia-drm"
    #"NIXOS_OZONE_WL,1"
  ];

  windowrulev2 = [
    # Firefox picture-in-picture fix
    "float,class:^(firefox)$,title:^(Firefox)$"
    "float,class:^(firefox)$,title:^(Picture-in-Picture)$"
    "size 35% 35%,class:^(firefox)$,title:^(Firefox)$"
    "size 35% 35%,class:^(firefox)$,title:^(Picture-in-Picture)$"
  ];
  
  plugin = { };
}
