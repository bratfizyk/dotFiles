{ pkgs, ... }:

{
    programs.zsh = {
        enable = true;
        enableAutosuggestions = true;
        enableCompletion = true;
        oh-my-zsh = {
            enable = true;
            plugins = [ "git" "sudo" ];
            theme = "agnoster";
        };
    };
}