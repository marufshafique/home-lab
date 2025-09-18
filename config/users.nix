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
    ]; # sudo permission
    initialPassword = "12345";
    home = "/home/marufs";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFc12C0BOi38lxiZ3rs6POALR5K0dMpE3ytWI8flE+IB maruf.shafique@welldev.io"
    ];
  };

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFc12C0BOi38lxiZ3rs6POALR5K0dMpE3ytWI8flE+IB maruf.shafique@welldev.io"
  ];
}
