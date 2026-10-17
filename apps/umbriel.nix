{ pkgs, ... }:

{
  programs.noctalia = {
    enable = true;
  };

  programs.umbriel = {
    enable = true;

    settings = {
      general.autostart = [ "noctalia" ];

      layout.gap = 5;

      keybinds = {
        "Mod+Return" = "spawn:alacritty";
        "Mod+D" = "spawn:noctalia msg panel-toggle launcher";
        "Mod+E" = "spawn:nautilus";
        "Mod+F" = "spawn:firefox";
        "Mod+Q" = "window-close";

        "Mod+Shift+Q" = "window-close";
        "Mod+Shift+M" = "spawn:wlogout";
        "Mod+Shift+F" = "window-toggle-fullscreen";
      };
    };
  };
}
