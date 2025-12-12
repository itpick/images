{ mkImage, pkgs, lib, ... }:

# Prometheus JSON Exporter - Export JSON data as Prometheus metrics
# https://github.com/prometheus-community/json_exporter

mkImage {
  drv = pkgs.prometheus-json-exporter;
  name = "prometheus-json-exporter";
  tag = "v${pkgs.prometheus-json-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-json-exporter}/bin/json_exporter" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus JSON Exporter";
    "org.opencontainers.image.description" = "Export JSON data as Prometheus metrics";
    "org.opencontainers.image.version" = pkgs.prometheus-json-exporter.version;
  };
}
