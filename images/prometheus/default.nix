{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for prometheus:
# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.prometheus  # prometheus-3.5 (3.5.0-r10)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)

mkImage {
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
