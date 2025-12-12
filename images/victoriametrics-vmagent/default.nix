{ mkImage, pkgs, lib, ... }:

# VictoriaMetrics vmagent - lightweight metrics collector
# https://docs.victoriametrics.com/vmagent/

mkImage {
  drv = pkgs.victoriametrics;
  name = "victoriametrics-vmagent";
  tag = "v${pkgs.victoriametrics.version}";
  entrypoint = [ "${pkgs.victoriametrics}/bin/vmagent" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "VictoriaMetrics vmagent";
    "org.opencontainers.image.description" = "Lightweight metrics collector and scraper";
    "org.opencontainers.image.version" = pkgs.victoriametrics.version;
    "io.nix-containers.chart" = "victoria-metrics-agent";
  };
}
