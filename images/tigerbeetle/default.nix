{ mkImage, pkgs, lib, ... }:

# TigerBeetle - Financial accounting database
# https://tigerbeetle.com/

mkImage {
  drv = pkgs.tigerbeetle;
  name = "tigerbeetle";
  tag = "v${pkgs.tigerbeetle.version}";
  entrypoint = [ "${pkgs.tigerbeetle}/bin/tigerbeetle" ];
  cmd = [ "version" ];

  labels = {
    "org.opencontainers.image.title" = "TigerBeetle";
    "org.opencontainers.image.description" = "Financial accounting database";
    "org.opencontainers.image.version" = pkgs.tigerbeetle.version;
  };
}
