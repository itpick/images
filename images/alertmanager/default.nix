{ buildCLIImage, pkgs, lib, ... }:

buildCLIImage {
  drv = pkgs.prometheus-alertmanager;
  name = "alertmanager";
  tag = "v${pkgs.prometheus-alertmanager.version}";
  entrypoint = [ "${pkgs.prometheus-alertmanager}/bin/alertmanager" ];
  cmd = [ "--help" ];

  env = {
    ALERTMANAGER_DATA_DIR = "/alertmanager";
  };

  labels = {
    "org.opencontainers.image.title" = "Alertmanager";
    "org.opencontainers.image.description" = "Prometheus Alertmanager handles alerts sent by Prometheus";
    "org.opencontainers.image.version" = pkgs.prometheus-alertmanager.version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
  };
}
