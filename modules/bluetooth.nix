{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    blueman
  ];

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      package = pkgs.bluez;
    };
  };

  services.blueman.enable = true;

}
