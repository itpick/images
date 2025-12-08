{ buildCLIImage, pkgs, lib, ... }:

buildCLIImage {
  drv = pkgs.prometheus;
  name = "prometheus";
  tag = "v${pkgs.prometheus.version}";
  entrypoint = [ "${pkgs.prometheus}/bin/prometheus" ];
  cmd = [ "--help" ];

  env = {
    PROMETHEUS_DATA_DIR = "/prometheus";
  };

  labels = {
    "org.opencontainers.image.title" = "Prometheus";
    "org.opencontainers.image.description" = "Prometheus monitoring system and time series database";
    "org.opencontainers.image.version" = pkgs.prometheus.version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
  };
}
