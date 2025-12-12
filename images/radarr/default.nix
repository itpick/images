{ mkImage, pkgs, lib, ... }:

# Radarr - Movie collection manager
# https://radarr.video/

mkImage {
  drv = pkgs.radarr;
  name = "radarr";
  tag = "v${pkgs.radarr.version}";
  entrypoint = [ "${pkgs.radarr}/bin/Radarr" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Radarr";
    "org.opencontainers.image.description" = "Movie collection manager";
    "org.opencontainers.image.version" = pkgs.radarr.version;
  };
}
