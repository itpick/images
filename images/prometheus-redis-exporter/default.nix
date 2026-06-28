{ mkImage, pkgs, lib, ... }:

# Prometheus Redis Exporter
# https://github.com/oliver006/redis_exporter

mkImage {
  drv = pkgs.prometheus-redis-exporter;
  name = "prometheus-redis-exporter";
  tag = "v${pkgs.prometheus-redis-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-redis-exporter}/bin/redis_exporter" ];
  # Was `--help` (a one-shot). Serve /metrics on 0.0.0.0:9121. redis_exporter
  # contacts its Redis target only on scrape (not at startup), so it starts
  # standalone with no config. Operators point it at a target via
  # --redis.addr / REDIS_ADDR.
  cmd = [ "--web.listen-address=0.0.0.0:9121" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus Redis Exporter";
    "org.opencontainers.image.description" = "Prometheus exporter for Redis metrics";
    "org.opencontainers.image.version" = pkgs.prometheus-redis-exporter.version;
    "io.nix-containers.image.upstream" = "https://github.com/oliver006/redis_exporter";
    "io.nix-containers.image.category" = "monitoring";
    "io.nix-containers.image.aliases" = "redis-exporter,redis_exporter,prometheus";
  };
}
