# cortex
# =============
# Cortex - Horizontally scalable Prometheus
# https://cortexmetrics.io/
#
# Cortex provides horizontally scalable, highly available,
# multi-tenant, long-term storage for Prometheus.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.cortex;
  name = "cortex";
  tag = "v${pkgs.cortex.version}";
  entrypoint = [ "${pkgs.cortex}/bin/cortex" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Cortex";
    "org.opencontainers.image.description" = "Horizontally scalable, multi-tenant Prometheus";
    "org.opencontainers.image.version" = pkgs.cortex.version;
  };
}
