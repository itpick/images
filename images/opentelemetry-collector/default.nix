# opentelemetry-collector
# =============
# OpenTelemetry Collector - Vendor-agnostic telemetry collection
# https://opentelemetry.io/docs/collector/
#
# The OpenTelemetry Collector offers a vendor-agnostic implementation
# for receiving, processing, and exporting telemetry data.

{ mkImage, pkgs, lib, ... }:

let
  # The cmd points --config at /etc/otelcol/config.yaml, but nothing baked that
  # file — the collector exits without a config. Bake the standard minimal
  # pipeline at /etc/otelcol/config.yaml (the Go binary ships no /etc, so no
  # shadowing): an OTLP receiver (gRPC :4317 / HTTP :4318, bound to all
  # interfaces) feeding a batch processor into the debug exporter, for
  # traces/metrics/logs. All three components ship in the core otelcol
  # distribution. Operators mount their own config with real exporters.
  otelcolConfig = pkgs.writeTextDir "etc/otelcol/config.yaml" ''
    receivers:
      otlp:
        protocols:
          grpc:
            endpoint: 0.0.0.0:4317
          http:
            endpoint: 0.0.0.0:4318

    processors:
      batch: {}

    exporters:
      debug: {}

    service:
      pipelines:
        traces:
          receivers: [otlp]
          processors: [batch]
          exporters: [debug]
        metrics:
          receivers: [otlp]
          processors: [batch]
          exporters: [debug]
        logs:
          receivers: [otlp]
          processors: [batch]
          exporters: [debug]
  '';

in
mkImage {
  drv = pkgs.opentelemetry-collector;
  name = "opentelemetry-collector";
  tag = "v${pkgs.opentelemetry-collector.version}";
  entrypoint = [ "${pkgs.opentelemetry-collector}/bin/otelcol" ];
  cmd = [ "--config=/etc/otelcol/config.yaml" ];

  extraPkgs = with pkgs; [ cacert otelcolConfig ];

  labels = {
    "org.opencontainers.image.title" = "OpenTelemetry Collector";
    "org.opencontainers.image.description" = "Vendor-agnostic telemetry collection, processing, and export";
    "org.opencontainers.image.version" = pkgs.opentelemetry-collector.version;
  };
}
