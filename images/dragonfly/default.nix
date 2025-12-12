{ mkImage, pkgs, lib, ... }:

# DragonflyDB - Modern Redis/Memcached replacement
# https://www.dragonflydb.io/

mkImage {
  drv = pkgs.dragonflydb;
  name = "dragonfly";
  tag = "v${pkgs.dragonflydb.version}";
  entrypoint = [ "${pkgs.dragonflydb}/bin/dragonfly" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "DragonflyDB";
    "org.opencontainers.image.description" = "Modern replacement for Redis and Memcached";
    "org.opencontainers.image.version" = pkgs.dragonflydb.version;
  };
}
