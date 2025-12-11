# prometheus-alertmanager
# =============
# Prometheus Alertmanager - Alert handling for Prometheus
# https://prometheus.io/docs/alerting/alertmanager/
#
# Alertmanager handles alerts sent by Prometheus, taking care of
# deduplicating, grouping, routing, silencing, and inhibition.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.prometheus-alertmanager;
  name = "prometheus-alertmanager";
  tag = "v${pkgs.prometheus-alertmanager.version}";
  entrypoint = [ "${pkgs.prometheus-alertmanager}/bin/alertmanager" ];
  cmd = [ "--config.file=/etc/alertmanager/alertmanager.yml" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus Alertmanager";
    "org.opencontainers.image.description" = "Alert handling for Prometheus monitoring";
    "org.opencontainers.image.version" = pkgs.prometheus-alertmanager.version;
  };
}
