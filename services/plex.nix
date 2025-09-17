{ config, pkgs, ... }:

let
  mediaDir = "/home/marufs/media";
  mediaGroup = "users";
  plexPort = 32400;
  radarrPort = 7878;
  sonarrPort = 8989;
  bazarrPort = 6767;
  prowlarrPort = 9696;
  transmissionPort = 9091;
in
{

  environment.systemPackages = with pkgs; [
    # sonarr
    radarr
  ];

  services.radarr = {
    enable = true;
    user = "radarr";
  };
}

# {
# environment.systemPackages = with pkgs; [
#   jellyfin
#   jellyfin-web
#   jellyfin-ffmpeg
#   plex
#   sonarr
#   radarr
# qbittorrent
# prowlarr
# ];

# services.jellyfin = {
#   enable = true;
#   openFirewall = true;
# };

# services.sonarr = {
#   enable = true;
#   openFirewall = true;
#   user = "marufs";
#   group = "medias";
#   dataDir = "/home/marufs";
#   settings = {
#     server = {
#       port = 8989;
#     };
#   };
# };

# services.qbittorrent = {
#   enable = true;
#   openFirewall = true;
#   user = "marufs";
#   group = "medias";
#   webuiPort = 8080;
#   serverConfig = {
#     LegalNotice.Accepted = true;
#     Preferences = {
#       WebUI = {
#         Username = "user";
#         Password_PBKDF2 = "1SrQyHz4xcmu3lF5ZHM1MA==:yWVHwMCNNEqKhmy77/62XTi0rI8HZpOdeAnKnhTQlt25XgeTFhFmYWqUfCCdLNBSCjNX055hhsglXAz3H36vqw==";
#       };
#       General.Locale = "en";
#     };
#   };
# };

# services.radarr = {
#   enable = true;
#   openFirewall = true;
#   user = "marufs";
#   group = "medias";
#   dataDir = "/home/marufs";
#   settings = {
#     server = {
#       port = 7878;
#     };
#   };
# };

# services.prowlarr = {
#   enable = true;
#   openFirewall = true;
#   settings = {
#     server = {
#       port = 9696;
#     };
#   };
# };
# }
