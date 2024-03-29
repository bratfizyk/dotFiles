{
  style = ''
    @define-color base   #24273a;
    @define-color mantle #1e2030;
    @define-color crust  #181926;

    @define-color text     #cad3f5;
    @define-color subtext0 #a5adcb;
    @define-color subtext1 #b8c0e0;

    @define-color surface0 #363a4f;
    @define-color surface1 #494d64;
    @define-color surface2 #5b6078;

    @define-color overlay0 #6e738d;
    @define-color overlay1 #8087a2;
    @define-color overlay2 #939ab7;

    @define-color blue      #8aadf4;
    @define-color lavender  #b7bdf8;
    @define-color sapphire  #7dc4e4;
    @define-color sky       #91d7e3;
    @define-color teal      #8bd5ca;
    @define-color green     #a6da95;
    @define-color yellow    #eed49f;
    @define-color peach     #f5a97f;
    @define-color maroon    #ee99a0;
    @define-color red       #ed8796;
    @define-color mauve     #c6a0f6;
    @define-color pink      #f5bde6;
    @define-color flamingo  #f0c6c6;
    @define-color rosewater #f4dbd6;

    * {
      border: none;
    }

    window.mainBar#waybar {
      background-color: alpha(@base, 0.7);
      border: solid alpha(@surface1, 0.7) 2;
      border-radius: 20px;
      padding: 0px 20px;
      margin: 10px 0px 0px 0px;
    }

    window.mainBar .modules-left {
      padding: 0px 20px;
      margin-top: 2px;
      margin-bottom: 2px;
    }

    window.mainBar .modules-center {
      border-radius: 15px;
      margin-top: 5px;
      margin-bottom: 5px;
      padding: 0px 10px;
    }

    window.mainBar .modules-right {
      padding: 0px 20px;
      margin-top: 2px;
      margin-bottom: 2px;
    }

    #workspaces button {
      color: #7a95c9;
      box-shadow: inset 0 -3px transparent;
      transition: all 0.5s cubic-bezier(0.55, -0.68, 0.48, 1.68);
    }

    #workspaces button.active {
      color: #ecd3a0;
      transition: all 0.5s cubic-bezier(0.55, -0.68, 0.48, 1.68);
    }

    #taskbar {
      
    }

    #cpu {
      color: #fb958b;
      font-size: 14px;
    }

    #memory {
      color: #a1c999;
      font-size: 14px;
    }

    #pulseaudio {
      color: #81A1C1;
      font-size: 14px;
    }

    #pulseaudio.muted {
      color: #fb958b;
    }

    #network {
      color: #5E81AC;
      font-size: 14px;
    }

    #network.disconnected {
      color: #fb958b;
    }

    #battery {
      color: #8fbcbb;
      font-size: 14px;
    }

    #battery.critical,
    #battery.warning,
    #battery.full,
    #battery.plugged {
      color: #8fbcbb;
    }

    #battery.charging { 

    }

    #battery.full,
    #battery.plugged {

    }

    #battery.warning {
      color: #ecd3a0;
    }


    #battery.critical:not(.charging) {
      color: #fb958b;
    }

    @keyframes blink {
      to {
        background-color: rgba(30, 34, 42, 0.5);
        color: #abb2bf;
      }
    }

    #clock {
      background-color: alpha(@surface0, 0.9);
      padding: 0px 10px;
      border: solid alpha(@surface2, 0.7) 1;
      border-radius: 10px;
      color: #8a909e;
      font-family: Meslo LGS NF;
      font-weight: bold;
      font-size: 15px;
    }

    #custom-logout {
      font-family: Meslo LGS NF;
      font-weight: bold;
      font-size: 24px;
      padding-right: 5px;
    }

    #custom-launcher {
      font-family: Meslo LGS NF;
      font-size: 32px;
    }

    #custom-notification {
      font-family: "NotoSansMono Nerd Font";
      font-size: 18px;
      padding-right: 8px;
    }

    tooltip {
      font-family: Meslo LGS NF;
      border-radius: 15px;
      background-color: #1f232b;
    }

    tooltip label {
      font-family: Meslo LGS NF;
    }

    label:focus {
      background-color: #1f232b;
    }

    #tray {

    }

    #tray > .passive {
      -gtk-icon-effect: dim;
    }

    #tray > .needs-attention {
      -gtk-icon-effect: highlight;
      background-color: #eb4d4b;
    }
  '';
}