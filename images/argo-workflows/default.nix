{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for argo-workflows:
# Packages available in nixpkgs:
#   pkgs.argo-workflows  # Container native workflow engine for Kubernetes
#   pkgs.tzdata  # tzdata (2025b-r2)

mkImage {
  drv = pkgs.argo-workflows;
  name = "argo-workflows";
  tag = "v${pkgs.argo-workflows.version}";
  entrypoint = [ "${pkgs.argo-workflows}/bin/argo" ];
  cmd = [ "help" ];

  extraPkgs = with pkgs; [ tzdata ];

  labels = {
    "org.opencontainers.image.title" = "Argo Workflows";
    "org.opencontainers.image.description" = "Container native workflow engine for Kubernetes";
    "org.opencontainers.image.version" = pkgs.argo-workflows.version;
    "io.nix-containers.chart" = "argo-workflows";
  };
}
