# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.openssh.enable = true;
  users.users.marufs = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "medias"
    ]; # sudo permission
    initialPassword = "12345";
    home = "/home/marufs";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFc12C0BOi38lxiZ3rs6POALR5K0dMpE3ytWI8flE+IB maruf.shafique@welldev.io"
    ];
  };

  # Define a group and user for media management
  # users.groups.media = { };
  users.users.medias.group = "medias";
  users.groups.medias = { };

  users.users.medias = {
    isSystemUser = true;
    description = "Media Services";
    initialPassword = "12345";
  };

  # users.users = {
  #   plex.extraGroups = [ "media" ];
  # };

  # users.users.radarr.extraGroups = [ "media" ];
  # users.users.sonarr.extraGroups = [ "media" ];
  # users.users.qbittorrent.extraGroups = [ "media" ];

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFc12C0BOi38lxiZ3rs6POALR5K0dMpE3ytWI8flE+IB maruf.shafique@welldev.io"
  ];
}
