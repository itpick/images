{ mkImage, pkgs, lib, ... }:

# kube-state-metrics-nixchart
# ===========================
# kube-state-metrics for consumption by the charts/kube-state-metrics chart.
mkImage {
  drv = pkgs.kube-state-metrics;
  name = "kube-state-metrics-nixchart";
  tag = "v${pkgs.kube-state-metrics.version}";
  entrypoint = [ "${pkgs.kube-state-metrics}/bin/kube-state-metrics" ];
  cmd = [];
  user = "1001:0";
  labels = {
    "org.opencontainers.image.title" = "kube-state-metrics-nixchart";
    "org.opencontainers.image.description" = "kube-state-metrics tuned for the nix-containers charts/kube-state-metrics chart";
    "org.opencontainers.image.version" = pkgs.kube-state-metrics.version;
    "io.nix-containers.chart" = "kube-state-metrics";
  };
}
