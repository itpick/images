{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for metrics-server:
# Packages NOT in nixpkgs:
#   metrics-server (0.8.0-r5)

mkImage {
  drv = pkgs.metrics-server;
  name = "metrics-server";
  tag = "v${pkgs.metrics-server.version}";
  entrypoint = [ "${pkgs.metrics-server}/bin/metrics-server" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Kubernetes Metrics Server";
    "org.opencontainers.image.description" = "Scalable and efficient source of container resource metrics";
    "org.opencontainers.image.version" = pkgs.metrics-server.version;
    "io.nix-containers.chart" = "metrics-server";
  };
}
