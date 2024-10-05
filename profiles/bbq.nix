{ config, pkgs, ... }:

{
  users.users.bbq = {
    isNormalUser = true;
    description = "bbq";
    shell = if config.programs.zsh.enable == true then pkgs.zsh else pkgs.bash;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}