{ mkImage, pkgs, lib, ... }:

# Prometheus PgBouncer Exporter
# https://github.com/prometheus-community/pgbouncer_exporter

mkImage {
  drv = pkgs.prometheus-pgbouncer-exporter;
  name = "prometheus-pgbouncer-exporter";
  tag = "v${pkgs.prometheus-pgbouncer-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-pgbouncer-exporter}/bin/pgbouncer_exporter" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus PgBouncer Exporter";
    "org.opencontainers.image.description" = "Prometheus exporter for PgBouncer metrics";
    "org.opencontainers.image.version" = pkgs.prometheus-pgbouncer-exporter.version;
  };
}
