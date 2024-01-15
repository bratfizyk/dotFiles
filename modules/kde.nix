{ config, pkgs, ... }:

{
  services.xserver.desktopManager.plasma5 = {
    enable = true;
  };

  environment = {
    plasma5.excludePackages = with pkgs.libsForQt5; [
      elisa
      gwenview
      oxygen
      khelpcenter
      plasma-browser-integration
      print-manager
    ];
    
    systemPackages = with pkgs.libsForQt5; [
      kate
      bismuth
      kcalc
    ];
  };
}