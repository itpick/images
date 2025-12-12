{ mkImage, pkgs, lib, ... }:

# fping - Fast ping utility
# https://fping.org/

mkImage {
  drv = pkgs.fping;
  name = "fping";
  tag = "v${pkgs.fping.version}";
  entrypoint = [ "${pkgs.fping}/bin/fping" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "fping";
    "org.opencontainers.image.description" = "High performance ping tool";
    "org.opencontainers.image.version" = pkgs.fping.version;
  };
}
