{ pkgs, config, osConfig, ... }:

{
  programs.swaylock = {
    enable = if osConfig.security.pam.services.swaylock.fprintAuth then throw "Set security.pam.services.swaylock.fprintAuth to false" else true;
    package = pkgs.swaylock-effects;
  };
}