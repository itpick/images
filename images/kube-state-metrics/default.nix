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
  # Was `--help` (a one-shot). Serve the object-metrics endpoint on
  # 0.0.0.0:8080 and the self-telemetry endpoint on 0.0.0.0:8081 so the
  # kube-prometheus-stack / kind-test probe can reach it. KSM uses in-cluster
  # config (available to every pod) and starts its HTTP servers immediately;
  # the resource informers retry in the background, so it stays up even before
  # RBAC is granted. Operators add a ClusterRole/binding for real metrics.
  cmd = [
    "--host=0.0.0.0"
    "--port=8080"
    "--telemetry-host=0.0.0.0"
    "--telemetry-port=8081"
  ];

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
