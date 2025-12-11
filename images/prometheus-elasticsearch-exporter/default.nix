{ mkImage, pkgs, lib, ... }:

# Prometheus Elasticsearch Exporter
# https://github.com/prometheus-community/elasticsearch_exporter

mkImage {
  drv = pkgs.prometheus-elasticsearch-exporter;
  name = "prometheus-elasticsearch-exporter";
  tag = "v${pkgs.prometheus-elasticsearch-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-elasticsearch-exporter}/bin/elasticsearch_exporter" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus Elasticsearch Exporter";
    "org.opencontainers.image.description" = "Elasticsearch metrics exporter for Prometheus";
    "org.opencontainers.image.version" = pkgs.prometheus-elasticsearch-exporter.version;
  };
}
