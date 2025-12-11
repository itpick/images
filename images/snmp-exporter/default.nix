# snmp-exporter
# =============
# Prometheus SNMP Exporter for monitoring network devices via SNMP
# https://github.com/prometheus/snmp_exporter

{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for snmp-exporter:
# Packages available in nixpkgs:
#   pkgs.prometheus-snmp-exporter  # prometheus-snmp-exporter (0.29.0-r6)

mkImage {
  drv = pkgs.prometheus-snmp-exporter;
  name = "snmp-exporter";
  tag = "v${pkgs.prometheus-snmp-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-snmp-exporter}/bin/snmp_exporter" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "SNMP Exporter";
    "org.opencontainers.image.description" = "Prometheus exporter for SNMP monitoring";
    "org.opencontainers.image.version" = pkgs.prometheus-snmp-exporter.version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
  };
}
