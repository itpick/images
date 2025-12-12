{ mkImage, pkgs, lib, ... }:

# Glances - System monitoring tool
# https://nicolargo.github.io/glances/

mkImage {
  drv = pkgs.glances;
  name = "glances";
  tag = "v${pkgs.glances.version}";
  entrypoint = [ "${pkgs.glances}/bin/glances" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "Glances";
    "org.opencontainers.image.description" = "Cross-platform system monitoring tool";
    "org.opencontainers.image.version" = pkgs.glances.version;
  };
}
