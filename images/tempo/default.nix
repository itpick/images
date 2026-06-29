{ mkImage, pkgs, lib, ... }:

let
  # Tempo needs a config to run. Bake the canonical single-binary (monolithic)
  # config at /etc/tempo/tempo.yaml (the Go binary ships no /etc, so no
  # shadowing): the HTTP API on 0.0.0.0:3200, an OTLP receiver (gRPC :4317 /
  # HTTP :4318, bound to all interfaces), the `local` trace backend, and all
  # state (wal + blocks) under the writable /tmp mkImage provides. A receiver
  # must be present or the distributor refuses to start. Operators mount their
  # own config for an object-storage-backed, clustered deployment.
  tempoConfig = pkgs.writeTextDir "etc/tempo/tempo.yaml" ''
    server:
      http_listen_address: 0.0.0.0
      http_listen_port: 3200

    distributor:
      receivers:
        otlp:
          protocols:
            grpc:
              endpoint: "0.0.0.0:4317"
            http:
              endpoint: "0.0.0.0:4318"

    storage:
      trace:
        backend: local
        wal:
          path: /tmp/tempo/wal
        local:
          path: /tmp/tempo/blocks

    usage_report:
      reporting_enabled: false
  '';

in
mkImage {
  drv = pkgs.tempo;
  name = "tempo";
  tag = pkgs.tempo.version;
  entrypoint = [ "${pkgs.tempo}/bin/tempo" ];
  # Was empty (no command). Run the server with the baked config; it serves the
  # HTTP API on 0.0.0.0:3200 so the tempo / kind-test probe can reach it.
  cmd = [ "-config.file=/etc/tempo/tempo.yaml" ];

  extraPkgs = with pkgs; [
    cacert
    tempoConfig
  ];

  labels = {
    "org.opencontainers.image.title" = "Grafana Tempo";
    "org.opencontainers.image.description" = "Open source distributed tracing backend";
    "org.opencontainers.image.version" = pkgs.tempo.version;
    "io.nix-containers.chart" = "tempo";
  };
}
