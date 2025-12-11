# prometheus-node-exporter
# =============
# Prometheus Node Exporter - Hardware and OS metrics
# https://prometheus.io/docs/guides/node-exporter/
#
# The Node Exporter exposes hardware and OS metrics for Prometheus.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.prometheus-node-exporter;
  name = "prometheus-node-exporter";
  tag = "v${pkgs.prometheus-node-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-node-exporter}/bin/node_exporter" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus Node Exporter";
    "org.opencontainers.image.description" = "Prometheus exporter for hardware and OS metrics";
    "org.opencontainers.image.version" = pkgs.prometheus-node-exporter.version;
  };
}
