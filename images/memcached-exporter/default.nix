{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for memcached-exporter:
# Packages available in nixpkgs:
#   pkgs.memcached-exporter  # memcached-exporter (0.15.4-r2)

mkImage {
  drv = pkgs.prometheus-memcached-exporter;
  name = "memcached-exporter";
  tag = "v${pkgs.prometheus-memcached-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-memcached-exporter}/bin/memcached_exporter" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Prometheus Memcached Exporter";
    "org.opencontainers.image.description" = "Prometheus exporter for Memcached metrics";
    "org.opencontainers.image.version" = pkgs.prometheus-memcached-exporter.version;
    "io.nix-containers.chart" = "loki";
  };
}
