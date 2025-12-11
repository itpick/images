{ mkImage, pkgs, lib, ... }:

# Prometheus PostgreSQL Exporter
# https://github.com/prometheus-community/postgres_exporter

mkImage {
  drv = pkgs.prometheus-postgres-exporter;
  name = "prometheus-postgres-exporter";
  tag = "v${pkgs.prometheus-postgres-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-postgres-exporter}/bin/postgres_exporter" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus PostgreSQL Exporter";
    "org.opencontainers.image.description" = "PostgreSQL metrics exporter for Prometheus";
    "org.opencontainers.image.version" = pkgs.prometheus-postgres-exporter.version;
  };
}
