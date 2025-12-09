{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for prometheus-pushgateway:
# Packages available in nixpkgs:
#   pkgs.prometheus-pushgateway  # prometheus-pushgateway (1.11.2-r2)

mkImage {
  drv = pkgs.prometheus-pushgateway;
  name = "prometheus-pushgateway";
  tag = "v${pkgs.prometheus-pushgateway.version}";
  entrypoint = [ "${pkgs.prometheus-pushgateway}/bin/pushgateway" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus Pushgateway";
    "org.opencontainers.image.description" = "Allows ephemeral and batch jobs to expose metrics to Prometheus";
    "org.opencontainers.image.version" = pkgs.prometheus-pushgateway.version;
    "io.nix-containers.chart" = "prometheus-pushgateway";
  };
}
