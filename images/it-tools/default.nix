{ mkImage, pkgs, lib, ... }:

# IT-Tools - Collection of handy online tools for developers
# https://it-tools.tech/

mkImage {
  drv = pkgs.it-tools;
  name = "it-tools";
  tag = "v${pkgs.it-tools.version}";
  entrypoint = [ "${pkgs.it-tools}/bin/it-tools" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "IT-Tools";
    "org.opencontainers.image.description" = "Collection of handy online tools for developers";
    "org.opencontainers.image.version" = pkgs.it-tools.version;
  };
}
