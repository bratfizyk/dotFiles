{ pkgs, ... }:

{
  security.pam.enableFscrypt = true;
  environment.systemPackages = with pkgs; [ fscryptctl ];
}
