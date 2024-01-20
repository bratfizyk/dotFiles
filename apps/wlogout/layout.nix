[
  {
    label = "logout";
    action = "loginctl terminate-user $USER";
    text = "Logout";
    keybind = "e";
  }
  {
    label = "reboot";
    action = "systemctl reboot";
    text = "Reboot";
    keybind = "r";
  }
  {
    label = "shutdown";
    action = "systemctl poweroff";
    text = "Shutdown";
    keybind = "s";
  }
]