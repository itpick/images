{ mkImage, pkgs, lib, ... }:
# redis-cluster-nixchart — same binary as redis-nixchart; chart drives
# cluster-mode via args. Users set --cluster-enabled yes etc.
mkImage {
  drv = pkgs.buildEnv {
    name = "redis-cluster-nixchart-env";
    paths = with pkgs; [ redis bash coreutils cacert tzdata ];
  };
  name = "redis-cluster-nixchart";
  tag = "v${pkgs.redis.version}";
  entrypoint = [ "${pkgs.redis}/bin/redis-server" ];
  cmd = [];
  user = "1001:0";
  labels."org.opencontainers.image.title" = "redis-cluster-nixchart";
  labels."org.opencontainers.image.description" = "Redis in cluster mode for the nix-containers charts/redis-cluster chart";
  labels."org.opencontainers.image.version" = pkgs.redis.version;
  labels."io.nix-containers.chart" = "redis-cluster";
}
