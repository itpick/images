{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for argocd:
# Packages available in nixpkgs:
#   pkgs.argocd  # Declarative continuous deployment for Kubernetes

mkImage {
  drv = pkgs.argocd;
  name = "argocd-cli";
  tag = "v${pkgs.argocd.version}";
  entrypoint = [ "${pkgs.argocd}/bin/argocd" ];
  cmd = [ "help" ];

  labels = {
    "org.opencontainers.image.title" = "Argo CD CLI";
    "org.opencontainers.image.description" = "Declarative continuous deployment CLI for Kubernetes";
    "org.opencontainers.image.version" = pkgs.argocd.version;
    "io.nix-containers.chart" = "argocd";
  };
}
