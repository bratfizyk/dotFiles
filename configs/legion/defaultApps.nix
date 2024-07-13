{ config, pkgs, ... }:

{
  xdg = {
    desktopEntries = {
      loupe = {
        name = "Loupe";
        genericName = "Photo Viewer";
        exec = "loupe %U";
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
        "image/png" = [ "loupe.desktop" ];
        "image/jpeg" = [ "loupe.desktop" ];
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