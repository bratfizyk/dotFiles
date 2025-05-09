{ pkgs, ... }:

{
  services.desktopManager.plasma6 = {
    enable = true;
  };

  environment = {
    plasma6.excludePackages = with pkgs.libsForQt5; [
      elisa
      gwenview
      oxygen
      khelpcenter
      plasma-browser-integration
      print-manager
      konsole
    ];
    
    systemPackages = with pkgs.libsForQt5; [
      kate
    ];
  };
}
