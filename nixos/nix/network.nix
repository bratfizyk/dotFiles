{ pkgs, ... }:

{
    networking.hostName = "nixos-beko";
    networking.useDHCP = false;
    networking.interfaces.enp0s3.useDHCP = true;
    networking.networkmanager.enable = true;
}