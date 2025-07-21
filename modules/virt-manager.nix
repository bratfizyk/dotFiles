{ ... }:

{
  programs.virt-manager = {
    enable = true;
  };

  virtualisation.libvirtd = {    
    enable = true;
  };

  networking.firewall.trustedInterfaces = [ "virbr0" ];
}
