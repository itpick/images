{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for kube-state-metrics:
# Packages available in nixpkgs:
#   pkgs.kube-state-metrics  # kube-state-metrics (2.17.0-r3)
#   pkgs.tzdata  # tzdata (2025b-r2)

mkImage {
  drv = pkgs.kube-state-metrics;
  name = "kube-state-metrics";
  tag = "v${pkgs.kube-state-metrics.version}";
  entrypoint = [ "${pkgs.kube-state-metrics}/bin/kube-state-metrics" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [
    tzdata
  ];

  labels = {
    "org.opencontainers.image.title" = "Kube State Metrics";
    "org.opencontainers.image.description" = "Service that listens to the Kubernetes API server and generates metrics";
    "org.opencontainers.image.version" = pkgs.kube-state-metrics.version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
  };
}
