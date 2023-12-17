{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles = {
      beko = {
        isDefault = true;
        settings = {
          "browser.startup.homepage" = "about:home";
          "browser.aboutConfig.showWarning" = false;
        };
        extensions = with config.nur.repos.rycee.firefox-addons; [
          ublock-origin
        ];
        # search = {
        #   default = "DuckDuckGo";
        # };
      };
    };
  };
}