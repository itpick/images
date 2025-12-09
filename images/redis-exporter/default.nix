{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for redis-exporter:
# Packages available in nixpkgs:
#   pkgs.prometheus-redis-exporter  # prometheus-redis-exporter (1.80.1-r1)

mkImage {
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
