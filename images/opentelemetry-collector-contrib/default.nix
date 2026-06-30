# opentelemetry-collector-contrib
# =============
# OpenTelemetry Collector Contrib - Extended collector with community components
# https://github.com/open-telemetry/opentelemetry-collector-contrib
#
# The contrib distribution includes additional receivers, processors,
# exporters, and extensions from the community.

{ mkImage, pkgs, lib, ... }:

let
  # The cmd points --config at /etc/otelcol/config.yaml, but nothing baked that
  # file — the collector exits without a config. Bake the standard minimal
  # pipeline at /etc/otelcol/config.yaml (the Go binary ships no /etc, so no
  # shadowing): an OTLP receiver (gRPC :4317 / HTTP :4318, bound to all
  # interfaces) feeding a batch processor into the debug exporter, for
  # traces/metrics/logs. These core components are also in the contrib
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
  drv = pkgs.opentelemetry-collector-contrib;
  name = "opentelemetry-collector-contrib";
  tag = "v${pkgs.opentelemetry-collector-contrib.version}";
  entrypoint = [ "${pkgs.opentelemetry-collector-contrib}/bin/otelcol-contrib" ];
  cmd = [ "--config=/etc/otelcol/config.yaml" ];

  extraPkgs = with pkgs; [ cacert otelcolConfig ];

  labels = {
    "org.opencontainers.image.title" = "OpenTelemetry Collector Contrib";
    "org.opencontainers.image.description" = "Extended OpenTelemetry Collector with community components";
    "org.opencontainers.image.version" = pkgs.opentelemetry-collector-contrib.version;
  };
}
