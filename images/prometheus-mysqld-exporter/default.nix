{ mkImage, pkgs, lib, ... }:

# Prometheus MySQL Exporter
# https://github.com/prometheus/mysqld_exporter

mkImage {
  drv = pkgs.prometheus-mysqld-exporter;
  name = "prometheus-mysqld-exporter";
  tag = "v${pkgs.prometheus-mysqld-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-mysqld-exporter}/bin/mysqld_exporter" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus MySQL Exporter";
    "org.opencontainers.image.description" = "MySQL metrics exporter for Prometheus";
    "org.opencontainers.image.version" = pkgs.prometheus-mysqld-exporter.version;
  };
}
