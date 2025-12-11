{ mkImage, pkgs, lib, ... }:

# Prometheus MongoDB Exporter
# https://github.com/percona/mongodb_exporter

mkImage {
  drv = pkgs.prometheus-mongodb-exporter;
  name = "prometheus-mongodb-exporter";
  tag = "v${pkgs.prometheus-mongodb-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-mongodb-exporter}/bin/mongodb_exporter" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus MongoDB Exporter";
    "org.opencontainers.image.description" = "Prometheus exporter for MongoDB including sharding, replication and storage engines";
    "org.opencontainers.image.version" = pkgs.prometheus-mongodb-exporter.version;
  };
}
