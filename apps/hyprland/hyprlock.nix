{
  general = {
    disable_loading_bar = true;
    grace = 30;
    hide_cursor = true;
    no_fade_in = false;
  };

  background = {
    blur_passes = 3;
    blur_size = 8;
  };

  input-field = {
    size = "200, 50";
    position = "0, -80";
    monitor = "";
    dots_center = true;
    fade_on_empty = false;
    placeholder_text = "Password...";
    shadow_passes = 2;
  };

  label = [
    {
      monitor = "";
      text = "cmd[update:1000] echo $(date '+%H:%M')";
      pos = "0, 100";
      color = "rgb(ffffff)";
      font_size = 60;
      font_family = "JetBrains Mono";
    }
  ];
}
