{ config, lib, pkgs, ... }:

{
  imports = [ 
    /etc/nixos/hardware-configuration.nix
    ../../config/boot.nix
    ../../config/network.nix
    ../../config/users.nix
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Timezone
  time.timeZone = "Etc/UTC";

  services.cockpit = {
    enable = false;
    port = 9090;
    openFirewall = true; # Please see the comments section
    settings = {
      WebService = {
        AllowUnencrypted = true;
      };
    };
  };

  environment.systemPackages = map lib.lowPrio [
    pkgs.curl
    pkgs.git
    pkgs.helix
    pkgs.neovim
    pkgs.wget
    pkgs.neofetch
  ];

  system.stateVersion = "25.11"; # Did you read the comment?
}

