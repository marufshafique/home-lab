{ config, lib, pkgs, ... }:

{
  networking = {
    useDHCP = false;
    interfaces.ens3 = {
      ipv4.addresses = [
        {
          address = "206.189.84.104";   # <-- your droplet IP
          prefixLength = 20;           # <-- because 255.255.240.0 = /20
        }
      ];
    };
    defaultGateway = "206.189.80.1";   # <-- your droplet gateway
    nameservers = [ "1.1.1.1" "8.8.8.8" ];
  };
  networking.networkmanager.enable = true;
  networking.useNetworkd = false;
  networking.firewall.allowedTCPPorts = [ 22 9000 8000 9696 8989 7878 9898 8096 5055 ];
  networking.hostName = "nixos";
  # networking.firewall.enable = false;
}

