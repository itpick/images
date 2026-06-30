{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for mimir:
# Packages NOT in nixpkgs:
#   grafana-mimir (3.0.1-r1)

let
  # The cmd points -config.file at /etc/mimir/mimir.yaml, but nothing baked that
  # file — Mimir exits without a config. Bake Grafana's official self-contained
  # "get started" config at /etc/mimir/mimir.yaml (the Go binary ships no /etc,
  # so no shadowing): monolithic mode (-target=all default) with filesystem
  # storage + an in-process memberlist ring (replication_factor 1), all state
  # under the writable /tmp, and the HTTP server on 0.0.0.0:9009. Operators
  # mount their own config (object storage, real ring, HA).
  mimirConfig = pkgs.writeTextDir "etc/mimir/mimir.yaml" ''
    multitenancy_enabled: false

    blocks_storage:
      backend: filesystem
      bucket_store:
        sync_dir: /tmp/mimir/tsdb-sync
      filesystem:
        dir: /tmp/mimir/data/tsdb
      tsdb:
        dir: /tmp/mimir/tsdb

    compactor:
      data_dir: /tmp/mimir/compactor
      sharding_ring:
        kvstore:
          store: memberlist

    distributor:
      ring:
        instance_addr: 127.0.0.1
        kvstore:
          store: memberlist

    ingester:
      ring:
        instance_addr: 127.0.0.1
        kvstore:
          store: memberlist
        replication_factor: 1

    ruler_storage:
      backend: filesystem
      filesystem:
        dir: /tmp/mimir/rules

    server:
      http_listen_address: 0.0.0.0
      http_listen_port: 9009
      log_level: info

    store_gateway:
      sharding_ring:
        replication_factor: 1
  '';

in
mkImage {
  drv = pkgs.mimir;
  name = "mimir";
  tag = "v${pkgs.mimir.version}";
  entrypoint = [ "${pkgs.mimir}/bin/mimir" ];
  cmd = [ "-config.file=/etc/mimir/mimir.yaml" ];

  extraPkgs = [ mimirConfig ];

  labels = {
    "org.opencontainers.image.title" = "Grafana Mimir";
    "org.opencontainers.image.description" = "Scalable long-term storage for Prometheus";
    "org.opencontainers.image.version" = pkgs.mimir.version;
    "io.nix-containers.chart" = "mimir-distributed";
  };
}
