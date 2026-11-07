{ pkgs, ... }:

{
    services.mako = {
    enable = true;

    settings = {
      icon-path = "${pkgs.papirus-icon-theme}/share/icons/Papirus";
      max-icon-size = 64;
      text-color = "#cdd6f4";
      border-color = "#89b4fa";
      border-size = 2;
      border-radius = 8;

      padding = "10,15";
      margin = "10";
      default-timeout = 5000;

      anchor = "top-right";
      layer = "overlay";
    };
    
    extraConfig = ''
      on-notify=exec ${pkgs.sox}/bin/play ${pkgs.sound-theme-freedesktop}/share/sounds/freedesktop/stereo/message.oga

      [urgency=low]
      background-color=#313244
      text-color=#a6adc8
      default-timeout=3000

      [urgency=critical]
      background-color=#f38ba8
      text-color=#1e1e2e
      border-color=#f9e2af
      default-timeout=0
    '';
  };
}
