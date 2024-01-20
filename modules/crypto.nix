{ config, pkgs, ... }:

{
  services.udev.packages = with pkgs; [
    ledger-udev-rules
    trezor-udev-rules
  ];
}