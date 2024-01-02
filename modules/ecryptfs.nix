{ config, pkgs, ... }:

{
  boot.kernelModules = [ "ecryptfs" ];
  security.pam.enableEcryptfs = true;
  environment.systemPackages = with pkgs; [ ecryptfs ];
}