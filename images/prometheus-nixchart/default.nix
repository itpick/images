{ mkImage, pkgs, lib, ... }:

# prometheus-nixchart
# ===================
# Prometheus for consumption by the charts/prometheus chart.
mkImage {
  drv = pkgs.prometheus;
  name = "prometheus-nixchart";
  tag = "v${pkgs.prometheus.version}";
  entrypoint = [ "${pkgs.prometheus}/bin/prometheus" ];
  cmd = [];
  user = "1001:0";
  labels = {
    "org.opencontainers.image.title" = "prometheus-nixchart";
    "org.opencontainers.image.description" = "Prometheus tuned for the nix-containers charts/prometheus chart";
    "org.opencontainers.image.version" = pkgs.prometheus.version;
    "io.nix-containers.chart" = "prometheus";
  };
}
