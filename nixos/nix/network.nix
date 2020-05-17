{ pkgs, ... }:

{
    networking.hostName = "nixos-beko";
    networking.useDHCP = false;
    networking.interfaces.ens3.useDHCP = true;
    networking.networkmanager.enable = true;
}