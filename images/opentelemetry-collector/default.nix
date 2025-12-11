# opentelemetry-collector
# =============
# OpenTelemetry Collector - Vendor-agnostic telemetry collection
# https://opentelemetry.io/docs/collector/
#
# The OpenTelemetry Collector offers a vendor-agnostic implementation
# for receiving, processing, and exporting telemetry data.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.opentelemetry-collector;
  name = "opentelemetry-collector";
  tag = "v${pkgs.opentelemetry-collector.version}";
  entrypoint = [ "${pkgs.opentelemetry-collector}/bin/otelcol" ];
  cmd = [ "--config=/etc/otelcol/config.yaml" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "OpenTelemetry Collector";
    "org.opencontainers.image.description" = "Vendor-agnostic telemetry collection, processing, and export";
    "org.opencontainers.image.version" = pkgs.opentelemetry-collector.version;
  };
}
