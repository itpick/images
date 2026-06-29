{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for loki:
# Packages available in nixpkgs:
#   pkgs.loki  # loki-3.6 (3.6.2-r0)

let
  # Loki needs a config to run. Bake the canonical single-binary (monolithic)
  # config at /etc/loki/config.yaml (the Go binary ships no /etc, so no
  # shadowing): filesystem object store + tsdb/v13 schema, an in-memory ring
  # with replication_factor 1, the HTTP API on 0.0.0.0:3100, and all state
  # under the writable /tmp mkImage provides. Operators mount their own config
  # for a real (object-storage-backed, clustered) deployment.
  lokiConfig = pkgs.writeTextDir "etc/loki/config.yaml" ''
    auth_enabled: false

    server:
      http_listen_address: 0.0.0.0
      http_listen_port: 3100
      grpc_listen_port: 9096

    common:
      instance_addr: 127.0.0.1
      path_prefix: /tmp/loki
      storage:
        filesystem:
          chunks_directory: /tmp/loki/chunks
          rules_directory: /tmp/loki/rules
      replication_factor: 1
      ring:
        kvstore:
          store: inmemory

    schema_config:
      configs:
        - from: 2020-10-24
          store: tsdb
          object_store: filesystem
          schema: v13
          index:
            prefix: index_
            period: 24h
  '';

in
mkImage {
  drv = pkgs.grafana-loki;
  name = "loki";
  tag = pkgs.grafana-loki.version;
  entrypoint = [ "${pkgs.grafana-loki}/bin/loki" ];
  # Was `--help` (a one-shot). Run the server with the baked single-binary
  # config; it serves the HTTP API on 0.0.0.0:3100 so the loki / kind-test
  # probe can reach it.
  cmd = [ "-config.file=/etc/loki/config.yaml" ];

  extraPkgs = [ lokiConfig ];

  env = {
    LOKI_DATA_DIR = "/tmp/loki";
  };

  labels = {
    "org.opencontainers.image.title" = "Grafana Loki";
    "org.opencontainers.image.description" = "Like Prometheus but for logs";
    "org.opencontainers.image.version" = pkgs.grafana-loki.version;
    "io.nix-containers.chart" = "loki";
  };
}
