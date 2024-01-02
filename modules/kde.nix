{ config, pkgs, ... }:

{
  services.xserver.desktopManager.plasma5 = {
    enable = true;
  };

  environment = {
    plasma5.excludePackages = with pkgs.libsForQt5; [
      elisa
      gwenview
      okular
      oxygen
      khelpcenter
      plasma-browser-integration
      print-manager
    ];
    
    systemPackages = with pkgs; [
      libsForQt5.bismuth
    ];
  };
}