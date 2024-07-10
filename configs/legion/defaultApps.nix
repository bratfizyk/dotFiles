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
      };
    };
  };
}