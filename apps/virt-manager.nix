{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    virt-viewer
  ];

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}
