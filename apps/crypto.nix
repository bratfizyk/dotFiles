{ config, pkgs, lib, osConfig, ... }:

{
  home.packages = with pkgs; [
    ledger-live-desktop
    trezor-suite
    monero-gui
  ];
}