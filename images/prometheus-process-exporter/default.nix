{ mkImage, pkgs, lib, ... }:

# Prometheus Process Exporter
# https://github.com/ncabatoff/process-exporter

mkImage {
  drv = pkgs.prometheus-process-exporter;
  name = "prometheus-process-exporter";
  tag = "v${pkgs.prometheus-process-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-process-exporter}/bin/process-exporter" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus Process Exporter";
    "org.opencontainers.image.description" = "Prometheus exporter that mines /proc to report on selected processes";
    "org.opencontainers.image.version" = pkgs.prometheus-process-exporter.version;
  };
}
