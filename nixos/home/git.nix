{ pkgs, ... }:

{
    programs.git = {
        package = pkgs.gitAndTools.gitFull;
        enable = true;
        userName = "Alojzy Leszcz";
        userEmail = "<>";
        aliases = {
            st = "status";
        };
    };
}