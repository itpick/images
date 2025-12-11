{ mkImage, pkgs, lib, ... }:

# Jellyfin - Media server
# https://jellyfin.org/

mkImage {
  drv = pkgs.jellyfin;
  name = "jellyfin";
  tag = "v${pkgs.jellyfin.version}";
  entrypoint = [ "${pkgs.jellyfin}/bin/jellyfin" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ffmpeg ];

  labels = {
    "org.opencontainers.image.title" = "Jellyfin";
    "org.opencontainers.image.description" = "Free software media system";
    "org.opencontainers.image.version" = pkgs.jellyfin.version;
  };
}
