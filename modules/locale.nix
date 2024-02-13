{ config, pkgs, ... }:

{
  time.timeZone = "Europe/Zurich";
  
  i18n = {
    defaultLocale = "en_GB.UTF-8";
    extraLocaleSettings = { };
  };

  services = { 
    xserver = {
      xkb = {
        layout = "pl";
        variant = "";
        options = "kpdl:dot";
      };
    };
    keyd = {
      enable = true;
      keyboards.default = {
        ids = [ "*" ];
	settings = {
	  main = {
	    kpdot = ".";
	  };
	};
      };
    };
  };

  console.keyMap = "pl2";
}
