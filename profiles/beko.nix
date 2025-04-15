{ config, pkgs, ... }:

{
  users.users.beko = {
    isNormalUser = true;
    description = "beko";
    shell = if config.programs.zsh.enable == true then pkgs.zsh else pkgs.bash;
    extraGroups = [
      "networkmanager"
      "wheel"
      "jackaudio"
    ] ++ (
      if (config.programs.virt-manager.enable == true)
        then [ "libvirtd" ]
        else [ ]
    ) ++ (
      if (config.virtualisation.docker.enable == true)
        then [ "docker" ]
        else [ ]
    );
  };
}