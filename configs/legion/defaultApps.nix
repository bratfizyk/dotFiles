{ config, pkgs, ... }:

{
  xdg = {
    desktopEntries = {
      nomacs = {
        name = "nomacs";
        genericName = "Photo Viewer";
        exec = "nomacs %U";
        terminal = false;
        categories = [ "Application" ];
        mimeType = [ "image/png" "image/jpeg" ];
      };

      evince = {
        name = "Evince";
        genericName = "PDF Viewer";
        exec = "evince %U";
        terminal = false;
        categories = [ "Application" ];
        mimeType = [ "application/pdf" ];
      };
    };

    mimeApps = {
      enable = true;
      defaultApplications = {
        "image/png" = [ "nomacs.desktop" ];
        "image/jpeg" = [ "nomacs.desktop" ];
        "application/pdf" = [ "evince.desktop" ];
        "x-scheme-handler/http" = [ "firefox.desktop" ];
        "x-scheme-handler/https" = [ "firefox.desktop" ];
        "x-scheme-handler/chrome" = [ "firefox.desktop" ];
        "text/html" = [ "firefox.desktop" ];
        "application/x-extension-htm" = [ "firefox.desktop" ];
        "application/x-extension-html" = [ "firefox.desktop" ];
        "application/x-extension-shtml" = [ "firefox.desktop" ];
        "application/xhtml+xml" = [ "firefox.desktop" ];
        "application/x-extension-xhtml" = [ "firefox.desktop" ];
        "application/x-extension-xht" = [ "firefox.desktop" ];
      };
    };
  };
}