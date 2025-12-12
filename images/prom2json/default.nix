{ mkImage, pkgs, lib, ... }:

# prom2json - Tool to scrape Prometheus metrics and output as JSON
# https://github.com/prometheus/prom2json

mkImage {
  drv = pkgs.prom2json;
  name = "prom2json";
  tag = "v${pkgs.prom2json.version}";
  entrypoint = [ "${pkgs.prom2json}/bin/prom2json" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "prom2json";
    "org.opencontainers.image.description" = "Scrape Prometheus metrics to JSON";
    "org.opencontainers.image.version" = pkgs.prom2json.version;
  };
}
