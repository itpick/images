{ mkImage, pkgs, lib, ... }:

# Harbor Redis - Redis cache/session store for Harbor registry
# Uses Redis configured for Harbor

mkImage {
  drv = pkgs.redis;
  name = "harbor-redis";
  tag = pkgs.redis.version;
  entrypoint = [ "${pkgs.redis}/bin/redis-server" ];
  cmd = [];

  extraPkgs = with pkgs; [
    cacert
    tzdata
  ];

  # Redis runs as redis user (usually 999)
  user = "999:999";

  labels = {
    "org.opencontainers.image.title" = "Harbor Redis";
    "org.opencontainers.image.description" = "Redis cache and session store for Harbor container registry";
    "org.opencontainers.image.version" = pkgs.redis.version;
    "io.nix-containers.chart" = "harbor";
  };
}
