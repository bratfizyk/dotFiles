{ config, pkgs, ... }:

{
  users.users.steam = {
    isNormalUser = true;
    description = "steam";
    shell = if config.programs.zsh.enable == true then pkgs.zsh else pkgs.bash;
    extraGroups = [
      "networkmanager"
    ];
  };
}
