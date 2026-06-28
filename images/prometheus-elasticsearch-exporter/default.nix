{ mkImage, pkgs, lib, ... }:

# Prometheus Elasticsearch Exporter
# https://github.com/prometheus-community/elasticsearch_exporter

mkImage {
  drv = pkgs.prometheus-elasticsearch-exporter;
  name = "prometheus-elasticsearch-exporter";
  tag = "v${pkgs.prometheus-elasticsearch-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-elasticsearch-exporter}/bin/elasticsearch_exporter" ];
  # Was `--help` (a one-shot). Serve /metrics on 0.0.0.0:9114. The exporter
  # scrapes its Elasticsearch target (--es.uri, default http://localhost:9200)
  # only on request, not at startup, so it starts standalone with no config.
  # Operators point it at a cluster via --es.uri.
  cmd = [ "--web.listen-address=0.0.0.0:9114" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus Elasticsearch Exporter";
    "org.opencontainers.image.description" = "Elasticsearch metrics exporter for Prometheus";
    "org.opencontainers.image.version" = pkgs.prometheus-elasticsearch-exporter.version;
    "io.nix-containers.image.upstream" = "https://github.com/prometheus-community/elasticsearch_exporter";
    "io.nix-containers.image.category" = "monitoring";
    "io.nix-containers.image.aliases" = "elasticsearch-exporter,elasticsearch_exporter,prometheus";
  };
}
