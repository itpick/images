{ mkImage, pkgs, lib, ... }:

# Metricbeat - Lightweight metrics shipper
# https://www.elastic.co/beats/metricbeat

mkImage {
  drv = pkgs.metricbeat;
  name = "metricbeat";
  tag = "v${pkgs.metricbeat.version}";
  entrypoint = [ "${pkgs.metricbeat}/bin/metricbeat" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Metricbeat";
    "org.opencontainers.image.description" = "Lightweight shipper for metrics";
    "org.opencontainers.image.version" = pkgs.metricbeat.version;
  };
}
