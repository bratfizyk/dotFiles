{ pkgs, config, ... }:

{
  style = with config.lib.stylix; with config.stylix; ''
    * {
      background-image: none;
      font-family: ${fonts.emoji.name}, ${fonts.sansSerif.name};
    }
		
    window {
      background-color: rgba(14, 15, 23, 0.7);
    }
		
    button {
      color: #FFFFFF;
      background-repeat: no-repeat;
      background-position: center;
      background-size: 25%;
      border: 2px solid #${colors.base04};
      border-style: solid;
      border-width: 2px;
      border-radius: 30px;
      box-shadow: inset 0 0 0 1px rgba(255, 255, 255, .1), 0 0 rgba(0, 0, 0, .5);
      padding: 20px;
    }
		
    button:focus, button:active, button:hover {
      background-color: #${colors.base02};
      border: 2px solid #${colors.base0D};
      outline-style: none;
    }
		
    #logout {
      background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/logout.png"));
    }
		
    #reboot {
      background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/reboot.png"));
    }
		
    #shutdown {
      background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/shutdown.png"));
    }
  '';
}
