{ buildCLIImage, pkgs, lib, ... }:

buildCLIImage {
  drv = pkgs.kube-state-metrics;
  name = "kube-state-metrics";
  tag = "v${pkgs.kube-state-metrics.version}";
  entrypoint = [ "${pkgs.kube-state-metrics}/bin/kube-state-metrics" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Kube State Metrics";
    "org.opencontainers.image.description" = "Service that listens to the Kubernetes API server and generates metrics";
    "org.opencontainers.image.version" = pkgs.kube-state-metrics.version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
  };
}
