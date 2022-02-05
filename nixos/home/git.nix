{ pkgs, ... }:

{
    home.packages = with pkgs; [
        meld
    ];
    programs.git = {
        package = pkgs.gitAndTools.gitFull;
        enable = true;
        userName = "Alojzy Leszcz";
        userEmail = "<>";
        aliases = {
            st = "status";
        };
        extraConfig = {
            core = {
                editor = "vim";
            };
            diff = {
                tool = "meld";
            };
            difftool = {
                prompt = false;
            };
        };
    };
}