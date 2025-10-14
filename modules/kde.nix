{ pkgs, ... }:

{
  services.desktopManager.plasma6 = {
    enable = true;
  };

  environment = {
    plasma6.excludePackages = with pkgs.kdePackages; [
      elisa
      gwenview
      oxygen
      khelpcenter
      plasma-browser-integration
      print-manager
      konsole
    ];
    
    systemPackages = with pkgs.kdePackages; [
      kate
    ];
  };
}
