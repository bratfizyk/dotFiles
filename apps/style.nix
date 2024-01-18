{
  style = ''
    * {
      /* `otf-font-awesome` is required to be installed for icons */
      font-family: Material Design Icons, JetBrainsMono Nerd Font, Iosevka Nerd Font;
      font-size: 14px;
      border-radius: 8px;
    }

    window#waybar {
      background-color: rgba(26, 27, 38, 0.5);
      color: #ffffff;
      transition-property: background-color;
      transition-duration: 0.5s;
    }

    window#waybar.hidden {
      opacity: 0.1;
    }

    #window {
      color: #64727d;
    }

    #clock,
    #cpu,
    #memory,
    #custom-media,
    #tray,
    #mode,
    #custom-lock,
    #workspaces,
    #idle_inhibitor,
    #custom-power-menu,
    #custom-launcher,
    #custom-spotify,
    #custom-weather,
    #custom-weather.severe,
    #custom-weather.sunnyDay,
    #custom-weather.clearNight,
    #custom-weather.cloudyFoggyDay,
    #custom-weather.cloudyFoggyNight,
    #custom-weather.rainyDay,
    #custom-weather.rainyNight,
    #custom-weather.showyIcyDay,
    #custom-weather.snowyIcyNight,
    #custom-weather.default {
      color: #e5e5e5;
      border-radius: 6px;
      padding: 2px 10px;
      background-color: #252733;
    }

    #cpu {
      color: #fb958b;
    }

    #memory {
      color: #a1c999;
    }

    #workspaces button {
      color: #7a95c9;
      box-shadow: inset 0 -3px transparent;
      transition: all 0.5s cubic-bezier(0.55, -0.68, 0.48, 1.68);
    }

    #workspaces button.active {
      color: #ecd3a0;
      transition: all 0.5s cubic-bezier(0.55, -0.68, 0.48, 1.68);
    }

    #custom-launcher {
      color: #7a95c9;
    }

    #backlight,
    #battery,
    #pulseaudio,
    #network {
      background-color: #252733;
    }

    #pulseaudio {
      color: #81A1C1;
    }

    #pulseaudio.muted {
      color: #fb958b;
    }

    #backlight {
      color: #8a909e;
    }

    #network {
      color: #5E81AC;
      padding: 0px 10px
    }

    #network.disconnected {
      color: #fb958b;
      padding: 0px 10px
    }

    #battery {
      color: #8fbcbb;
      padding: 0px 15px
    }

    #battery.critical,
    #battery.warning,
    #battery.full,
    #battery.plugged {
      color: #8fbcbb;
    }

    #battery.charging { 

    }

    #battery.full,
    #battery.plugged {

    }

    @keyframes blink {
      to {
        background-color: rgba(30, 34, 42, 0.5);
        color: #abb2bf;
      }
    }

    #battery.warning {
      color: #ecd3a0;
    }

    #battery.critical:not(.charging) {
      color: #fb958b;
    }

    #custom-lock {
      color: #ecd3a0;
    }

    #clock {
      color: #8a909e;
      font-family: Iosevka Nerd Font;
      font-weight: bold;
    }

    #custom-power-menu {
      color: #e78284;
    }

    tooltip {
      font-family: Iosevka Nerd Font;
      border-radius: 15px;
      background-color: #1f232b;
    }

    tooltip label {
      font-family: Iosevka Nerd Font;
    }

    label:focus {
      background-color: #1f232b;
    }

    #tray {
    }

    #tray > .passive {
      -gtk-icon-effect: dim;
    }

    #tray > .needs-attention {
      -gtk-icon-effect: highlight;
      background-color: #eb4d4b;
    }

    #idle_inhibitor {
      background-color: #242933;
    }

    #idle_inhibitor.activated {
      background-color: #ecf0f1;
      color: #2d3436;
    }

    #custom-spotify {
      color: #abb2bf;
    }

    #custom-weather {
      font-family: Iosevka Nerd Font;
      color: #8a909e;
    }

    #custom-weather.severe {
      color: #eb937d;
    }

    #custom-weather.sunnyDay {
      color: #c2ca76;
    }

    #custom-weather.clearNight {
      color: #cad3f5;
    }

    #custom-weather.cloudyFoggyDay,
    #custom-weather.cloudyFoggyNight {
      color: #c2ddda;
    }

    #custom-weather.rainyDay,
    #custom-weather.rainyNight {
      color: #5aaca5;
    }

    #custom-weather.showyIcyDay,
    #custom-weather.snowyIcyNight {
      color: #d6e7e5;
    }

    #custom-weather.default {
      color: #dbd9d8;
    }
  '';
}