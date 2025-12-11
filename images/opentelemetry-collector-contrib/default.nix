# opentelemetry-collector-contrib
# =============
# OpenTelemetry Collector Contrib - Extended collector with community components
# https://github.com/open-telemetry/opentelemetry-collector-contrib
#
# The contrib distribution includes additional receivers, processors,
# exporters, and extensions from the community.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.opentelemetry-collector-contrib;
  name = "opentelemetry-collector-contrib";
  tag = "v${pkgs.opentelemetry-collector-contrib.version}";
  entrypoint = [ "${pkgs.opentelemetry-collector-contrib}/bin/otelcol-contrib" ];
  cmd = [ "--config=/etc/otelcol/config.yaml" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "OpenTelemetry Collector Contrib";
    "org.opencontainers.image.description" = "Extended OpenTelemetry Collector with community components";
    "org.opencontainers.image.version" = pkgs.opentelemetry-collector-contrib.version;
  };
}
