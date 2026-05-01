{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    configPath = ".mozilla/firefox";
    profiles = {
      beko = {
        isDefault = true;
        settings = {
          "browser.startup.homepage" = "about:home";
          "browser.aboutConfig.showWarning" = false;
        };
        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
        ];
        # search = {
        #   default = "DuckDuckGo";
        # };
      };
    };
  };
}
