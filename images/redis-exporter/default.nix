{ buildCLIImage, pkgs, lib, ... }:

buildCLIImage {
  drv = pkgs.prometheus-redis-exporter;
  name = "redis-exporter";
  tag = "v${pkgs.prometheus-redis-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-redis-exporter}/bin/redis_exporter" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Prometheus Redis Exporter";
    "org.opencontainers.image.description" = "Prometheus exporter for Redis metrics";
    "org.opencontainers.image.version" = pkgs.prometheus-redis-exporter.version;
    "io.nix-containers.chart" = "argocd";
  };
}
