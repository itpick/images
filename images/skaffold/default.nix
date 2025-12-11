{ mkImage, pkgs, lib, ... }:

# Skaffold - Kubernetes development workflow tool
# https://skaffold.dev/

mkImage {
  drv = pkgs.skaffold;
  name = "skaffold";
  tag = "v${pkgs.skaffold.version}";
  entrypoint = [ "${pkgs.skaffold}/bin/skaffold" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Skaffold";
    "org.opencontainers.image.description" = "Easy and repeatable Kubernetes development";
    "org.opencontainers.image.version" = pkgs.skaffold.version;
    "io.nix-containers.chart" = "skaffold";
  };
}
