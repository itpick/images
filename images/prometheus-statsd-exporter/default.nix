{ mkImage, pkgs, lib, ... }:

# Prometheus StatsD Exporter
# https://github.com/prometheus/statsd_exporter

mkImage {
  drv = pkgs.prometheus-statsd-exporter;
  name = "prometheus-statsd-exporter";
  tag = "v${pkgs.prometheus-statsd-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-statsd-exporter}/bin/statsd_exporter" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus StatsD Exporter";
    "org.opencontainers.image.description" = "Receives StatsD-style metrics and exports them to Prometheus";
    "org.opencontainers.image.version" = pkgs.prometheus-statsd-exporter.version;
  };
}
