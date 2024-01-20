{ pkgs, ... }:

{
	style = ''
		* {
			background-image: none;
		}
		
		window {
			background-color: rgba(14, 15, 23, 0.7);
		}
		
		button {
			color: #FFFFFF;
			background-color: #1E1E1E;
			border-style: solid;
			border-width: 2px;
			background-repeat: no-repeat;
			background-position: center;
			background-size: 25%;
			border-radius: 30px;
			padding: 20px;
		}
		
		button:focus, button:active, button:hover {
			background-color: #270080;
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