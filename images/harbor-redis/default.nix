{ mkImage, pkgs, lib, ... }:

# Harbor Redis - Redis cache/session store for Harbor registry
# Uses Redis configured for Harbor

mkImage {
  drv = pkgs.redis;
  name = "harbor-redis";
  tag = pkgs.redis.version;
  entrypoint = [ "${pkgs.redis}/bin/redis-server" ];
  # Was empty — redis-server then binds only localhost (protected-mode on), so
  # the pod isn't reachable. Match the validated images/redis template: bind all
  # interfaces on :6379 with protected-mode off so the harbor / kind-test probe
  # can reach it. Operators front it with auth + a PVC-backed dir as needed.
  cmd = [ "--bind" "0.0.0.0" "--protected-mode" "no" ];

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
