{ mkImage, pkgs, lib, ... }:

# Polaris - Kubernetes best practices validator
# https://www.fairwinds.com/polaris

mkImage {
  drv = pkgs.polaris;
  name = "polaris";
  tag = "v${pkgs.polaris.version}";
  entrypoint = [ "${pkgs.polaris}/bin/polaris" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Polaris";
    "org.opencontainers.image.description" = "Kubernetes best practices and policy validation";
    "org.opencontainers.image.version" = pkgs.polaris.version;
    "io.nix-containers.chart" = "polaris";
  };
}
