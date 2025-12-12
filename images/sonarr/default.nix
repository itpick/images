{ mkImage, pkgs, lib, ... }:

# Sonarr - TV series collection manager
# https://sonarr.tv/

mkImage {
  drv = pkgs.sonarr;
  name = "sonarr";
  tag = "v${pkgs.sonarr.version}";
  entrypoint = [ "${pkgs.sonarr}/bin/Sonarr" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Sonarr";
    "org.opencontainers.image.description" = "TV series collection manager";
    "org.opencontainers.image.version" = pkgs.sonarr.version;
  };
}
