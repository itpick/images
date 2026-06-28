{ mkImage, pkgs, lib, ... }:

# Prometheus MongoDB Exporter
# https://github.com/percona/mongodb_exporter

mkImage {
  drv = pkgs.prometheus-mongodb-exporter;
  name = "prometheus-mongodb-exporter";
  tag = "v${pkgs.prometheus-mongodb-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-mongodb-exporter}/bin/mongodb_exporter" ];
  # Was `--help` (a one-shot). Serve /metrics on 0.0.0.0:9216. The exporter
  # connects to its MongoDB target lazily per-scrape (not at startup), so it
  # starts standalone; the default URI just needs to be present. Operators
  # point it at a real deployment via --mongodb.uri.
  cmd = [
    "--mongodb.uri=mongodb://localhost:27017"
    "--web.listen-address=0.0.0.0:9216"
  ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus MongoDB Exporter";
    "org.opencontainers.image.description" = "Prometheus exporter for MongoDB including sharding, replication and storage engines";
    "org.opencontainers.image.version" = pkgs.prometheus-mongodb-exporter.version;
    "io.nix-containers.image.upstream" = "https://github.com/percona/mongodb_exporter";
    "io.nix-containers.image.category" = "monitoring";
    "io.nix-containers.image.aliases" = "mongodb-exporter,mongodb_exporter,prometheus";
  };
}
