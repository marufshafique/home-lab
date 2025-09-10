# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  # boot.loader.grub.enable = true;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  # boot.loader.grub.device = "/dev/vda"; # or "nodev" for efi only
  boot.loader.grub.enable = false;  # DigitalOcean uses its own bootloader
  boot.loader.systemd-boot.enable = false;

  # networking.hostName = "nixos"; # Define your hostname.

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Timezone
  time.timeZone = "Etc/UTC";

  services.cockpit = {
    enable = true;
    port = 9090;
    openFirewall = true; # Please see the comments section
    settings = {
      WebService = {
        AllowUnencrypted = true;
      };
    };
  };

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
  networking.firewall.allowedTCPPorts = [ 22 ];
  networking.hostName = "nixos";
  # networking.firewall.enable = false;

  users.users.marufs = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # sudo permission
    initialPassword = "12345";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFc12C0BOi38lxiZ3rs6POALR5K0dMpE3ytWI8flE+IB maruf.shafique@welldev.io"
    ];
  };

  environment.systemPackages = map lib.lowPrio [
    pkgs.curl
    pkgs.git
    pkgs.helix
    pkgs.neovim
    pkgs.wget
    pkgs.neofetch
  ];

  users.users.root.openssh.authorizedKeys.keys =
  [
    # change this to your ssh key
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFc12C0BOi38lxiZ3rs6POALR5K0dMpE3ytWI8flE+IB maruf.shafique@welldev.io"
  ]; # this is used for unit-testing this module and can be removed if not needed

  # Set minimal logging
  # services.syslog.enable = true;


  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?

}

