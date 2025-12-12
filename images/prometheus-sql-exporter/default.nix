{ mkImage, pkgs, lib, ... }:

# Prometheus SQL Exporter - Export SQL query results as Prometheus metrics
# https://github.com/burningalchemist/sql_exporter

mkImage {
  drv = pkgs.prometheus-sql-exporter;
  name = "prometheus-sql-exporter";
  tag = "v${pkgs.prometheus-sql-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-sql-exporter}/bin/sql_exporter" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus SQL Exporter";
    "org.opencontainers.image.description" = "Export SQL query results as Prometheus metrics";
    "org.opencontainers.image.version" = pkgs.prometheus-sql-exporter.version;
  };
}
