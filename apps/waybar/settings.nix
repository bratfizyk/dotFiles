{
  mainBar = {
    name = "mainBar";
    layer = "top";
    position = "top";
    height = 45;

    max-length = 20;
    margin-left = 2;
    margin-right = 2;
    
    spacing = 10;

    modules-left = [
      "custom/launcher"
      "custom/separator"
      "hyprland/workspaces"
      "custom/separator"
      "wlr/taskbar"
    ];

    modules-center = [
      "clock"
    ];

    modules-right = [
      "tray"
      "custom/separator"
      "pulseaudio"
      #"network"
      "cpu"
      "memory"
      "battery"
      "custom/separator"
      "custom/logout"
    ];

    # Modules configuration
    "hyprland/workspaces" = {
      format = "{name}";
      on-scroll-up = "hyprctl dispatch workspace e+1";
      on-scroll-down = "hyprctl dispatch workspace e-1";
      on-click = "activate";
    };

    "wlr/taskbar" = {
      all-outputs = true;
      format = "{icon}";
      max-length = 20;
      icon-size = 24;
      icon-theme = "Qogir-dark";
      tooltip = true;
      tooltip-format = "{icon} {title}: {app_id}";
      on-click = "minimize-raise";
    };

    tray = {
      icon-size = 22;
      spacing = 12;
      smooth-scolling-threshold = 1.0;
      show-passive-icons = true;
      reverse-direction = true;
    };

    clock = {
      timezone = "Europe/Zurich";
      tooltip-format = "{calendar}";
      calendar-weeks-pos = "left";
      #format-calendar = "<b>{}</b>";
      format-calendar-weeks = "<span>Week: <i>{}</i></span>";
      format = "{:%d-%m-%Y  %H:%M}";
    };

    cpu = {
      format = " {usage}%";
      tooltip = true;
      tooltip-format = "{load}\n{usage}\n{avg_frequency}GHz";
    };

    memory = {
      format = " {percentage}%";
      tooltip = true;
      tooltip-format = "Used: {used}GiB/{total}GiB\nAvailable: {avail}GiB";
    };

    battery = {
      interval = 80;
      states = {
        warning = 20;
        critical = 10;
      };
      format = "{icon} {capacity}%";
      format-charging = " {capacity}%";
      format-plugged = " {capacity}%";
      format-alt = "{time} {icon}";
      format-icons = [ "" "" "" "" ];
    };

    network = {
      format-wifi = " {essid}";
      format-ethernet = " {essid}";
      tooltip-format = "SSID: {essid}\nInterface: {ifname} via {gwaddr}\nIP: {ipaddr}\nSubnetmask: {netmask}-{cidr}\nConnection Strength: {signalStrength}%\nFrequency: {frequency}GHz\nUp Speed: {bandwidthUpBits}\nDown Speed: {bandwidthDownBits}";
      format-linked = "{ifname} (No IP)";
      format-disconnected = "(No Internet)";
    };

    pulseaudio = {
      format = "{icon} {volume}%";
      format-bluetooth = "{volume}% {icon}";
      format-bluetooth-muted = " {icon}";
      format-muted = "🔇";
      format-icons = {
        headphone = "";
        hands-free = "";
        headset = "";
        phone = "";
        portable = "";
        car = "";
        default = [ "" "" "" ];
      };
      on-click = "pavucontrol";
      tooltip = true;
      tooltip-format = "{icon} {desc}\nVolume: {volume}\n{format_source}";
    };

    "custom/launcher" = {
      format = "";
      on-click = "rofi -show drun -show-icons -icon-theme Qogir-dark";
      tooltip = false;
    };

    "custom/separator" = {
      format = "|";
      tooltip = false;
    };

    "custom/logout" = {
      format = "⏻";
      on-click = "wlogout";
    };
  };
}