{ config, pkgs, ... }:

{
  boot.kernelModules = [ "ecryptfs" ];
  security.pam.enableEcryptfs = true;
  systemPackages = with pkgs; [ ecryptfs ];
}