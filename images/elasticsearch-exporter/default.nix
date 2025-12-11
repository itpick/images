# elasticsearch-exporter
# =============
# Prometheus exporter for Elasticsearch metrics
# https://github.com/prometheus-community/elasticsearch_exporter

{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for elasticsearch-exporter:
# Packages available in nixpkgs:
#   pkgs.prometheus-elasticsearch-exporter

mkImage {
  drv = pkgs.prometheus-elasticsearch-exporter;
  name = "elasticsearch-exporter";
  tag = "v${pkgs.prometheus-elasticsearch-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-elasticsearch-exporter}/bin/elasticsearch_exporter" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Elasticsearch Exporter";
    "org.opencontainers.image.description" = "Prometheus exporter for Elasticsearch metrics";
    "org.opencontainers.image.version" = pkgs.prometheus-elasticsearch-exporter.version;
    "io.nix-containers.chart" = "elasticsearch";
  };
}
