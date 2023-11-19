{ config, pkgs, ... }:

{
  # Uncomment after 23.11
  # programs.virt-manager.enable = true;
  
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}