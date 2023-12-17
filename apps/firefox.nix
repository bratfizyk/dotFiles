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
        # extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        #   ublock-origin
        # ];
        # search = {
        #   default = "DuckDuckGo";
        # };
        bookmarks = [
          {
            name = "Toolbar";
            toolbar = true;
            bookmarks = [
              {
                name = "";
                url = "https://translate.google.com/";
              }
              {
                name = "";
                url = "https://www.portfeltradera.pl/panel/ruchy-tradera21";
              }
              {
                name = "FR";
                bookmarks = [
                  {
                    name = "francu.ski";
                    url = "https://francu.ski/";
                  }
                  {
                    name = "ZOOM";
                    url = "http://zoom.francu.ski/";
                  }
                  {
                    name = "Bonjour de France";
                    url = "https://www.bonjourdefrance.pl/";
                  }
                  {
                    name = "French Podcasts";
                    url = "https://podcasts.apple.com/us/podcast/learn-french-with-daily-podcasts/id191303933";
                  }
                ];
              }
              {
                name = "";
                url = "https://timvanroy.com/";
              }
            ];
          }
        ];
      };
    };
  };
}