{ mkImage, pkgs, lib, ... }:

# Prometheus SNMP Exporter
# https://github.com/prometheus/snmp_exporter

mkImage {
  drv = pkgs.prometheus-snmp-exporter;
  name = "prometheus-snmp-exporter";
  tag = "v${pkgs.prometheus-snmp-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-snmp-exporter}/bin/snmp_exporter" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus SNMP Exporter";
    "org.opencontainers.image.description" = "SNMP Exporter for Prometheus";
    "org.opencontainers.image.version" = pkgs.prometheus-snmp-exporter.version;
  };
}
