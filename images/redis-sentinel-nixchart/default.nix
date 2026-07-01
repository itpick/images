{ mkImage, pkgs, lib, ... }:
mkImage {
  drv = pkgs.buildEnv {
    name = "redis-sentinel-nixchart-env";
    paths = with pkgs; [ redis bash coreutils cacert tzdata ];
  };
  name = "redis-sentinel-nixchart";
  tag = "v${pkgs.redis.version}";
  entrypoint = [ "${pkgs.redis}/bin/redis-sentinel" ];
  cmd = [];
  user = "1001:0";
  labels."org.opencontainers.image.title" = "redis-sentinel-nixchart";
  labels."org.opencontainers.image.description" = "Redis Sentinel for the nix-containers charts/redis chart";
  labels."org.opencontainers.image.version" = pkgs.redis.version;
  labels."io.nix-containers.chart" = "redis";
}
