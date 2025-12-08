{ buildCLIImage, pkgs, lib, ... }:

# Prometheus PostgreSQL Exporter
buildCLIImage {
  drv = pkgs.prometheus-postgres-exporter;
  name = "postgres-exporter";
  tag = pkgs.prometheus-postgres-exporter.version;
  entrypoint = [ "${pkgs.prometheus-postgres-exporter}/bin/postgres_exporter" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "PostgreSQL Exporter";
    "org.opencontainers.image.description" = "Prometheus exporter for PostgreSQL metrics";
    "org.opencontainers.image.version" = pkgs.prometheus-postgres-exporter.version;
    "io.nix-containers.chart" = "postgresql";
  };
}
