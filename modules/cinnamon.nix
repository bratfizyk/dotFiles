{ config, pkgs, ... }:

{
  services = {
    desktopManager = {
      cosmic = {
        enable = true;
        xwayland.enable = true;
      };
    };
  };

  environment.cosmic.excludePackages = (with pkgs; [

  ]);
}

