{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    immich
  ];

  services.immich = {
    enable = true;
    port = 2283; # Or your desired port
    host = "206.189.84.104"; # Makes it accessible on your network
    mediaLocation = "/var/lib/immich"; # Ensure this path has sufficient storage
    openFirewall = true; # Automatically opens the configured port
    # You can also configure other Immich settings here
    # settings = {
    #   # Example settings, refer to Immich documentation for full options
    #   # allowDownloadAll = true;
    #   # showGalleryTitle = true;
    # };
  };

  # If you need to access media from your home directory or other locations,
  # you might need to use bind mounts due to permissions.
  # Example:
  # fileSystems."/media/immich/archive" = {
  #   device = "/home/youruser/Pictures/archive";
  #   options = [ "bind" "nofail" ];
  # };
}
