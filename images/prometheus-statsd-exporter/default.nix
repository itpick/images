{ mkImage, pkgs, lib, ... }:

# Prometheus StatsD Exporter
# https://github.com/prometheus/statsd_exporter

mkImage {
  drv = pkgs.prometheus-statsd-exporter;
  name = "prometheus-statsd-exporter";
  tag = "v${pkgs.prometheus-statsd-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-statsd-exporter}/bin/statsd_exporter" ];
  # Was `--help` (a one-shot). Serve /metrics on 0.0.0.0:9102 (statsd ingest on
  # 9125 udp/tcp by default). No mapping config is required — unmapped metrics
  # pass through — so it starts standalone. Operators add
  # --statsd.mapping-config as needed.
  cmd = [ "--web.listen-address=0.0.0.0:9102" ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus StatsD Exporter";
    "org.opencontainers.image.description" = "Receives StatsD-style metrics and exports them to Prometheus";
    "org.opencontainers.image.version" = pkgs.prometheus-statsd-exporter.version;
    "io.nix-containers.image.upstream" = "https://github.com/prometheus/statsd_exporter";
    "io.nix-containers.image.category" = "monitoring";
    "io.nix-containers.image.aliases" = "statsd-exporter,statsd_exporter,prometheus";
  };
}
