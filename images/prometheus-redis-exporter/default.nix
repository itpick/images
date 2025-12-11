{ mkImage, pkgs, lib, ... }:

# Prometheus Redis Exporter
# https://github.com/oliver006/redis_exporter

mkImage {
  drv = pkgs.prometheus-redis-exporter;
  name = "prometheus-redis-exporter";
  tag = "v${pkgs.prometheus-redis-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-redis-exporter}/bin/redis_exporter" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus Redis Exporter";
    "org.opencontainers.image.description" = "Prometheus exporter for Redis metrics";
    "org.opencontainers.image.version" = pkgs.prometheus-redis-exporter.version;
  };
}
