{ mkImage, pkgs, lib, ... }:

# Prometheus Blackbox Exporter
# https://github.com/prometheus/blackbox_exporter

mkImage {
  drv = pkgs.prometheus-blackbox-exporter;
  name = "prometheus-blackbox-exporter";
  tag = "v${pkgs.prometheus-blackbox-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-blackbox-exporter}/bin/blackbox_exporter" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus Blackbox Exporter";
    "org.opencontainers.image.description" = "Blackbox probing of endpoints over HTTP, HTTPS, DNS, TCP and ICMP";
    "org.opencontainers.image.version" = pkgs.prometheus-blackbox-exporter.version;
  };
}
