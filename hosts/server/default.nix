{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../../config/boot.nix
    ../../config/network.nix
    ../../config/users.nix
    ../../services
  ];

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Timezone
  time.timeZone = "Etc/UTC";

  services.cockpit = {
    enable = false;
    port = 9090;
    # openFirewall = true; # Please see the comments section
    settings = {
      WebService = {
        AllowUnencrypted = true;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    curl
    git
    helix
    neovim
    wget
    neofetch

    nil
    nixd
    lazygit
  ];

  system.stateVersion = "25.11"; # Did you read the comment?
}
