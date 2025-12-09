{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for argo-rollouts:
# Packages available in nixpkgs:
#   pkgs.argo-rollouts  # argo-rollouts (1.8.3-r6)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)

mkImage {
  drv = pkgs.argo-rollouts;
  name = "argo-rollouts";
  tag = "v${pkgs.argo-rollouts.version}";
  entrypoint = [ "${pkgs.argo-rollouts}/bin/rollouts-controller" ];
  cmd = [ ];

  labels = {
    "org.opencontainers.image.title" = "Argo Rollouts";
    "org.opencontainers.image.description" = "Kubernetes Progressive Delivery Controller for blue-green and canary deployments";
    "org.opencontainers.image.version" = pkgs.argo-rollouts.version;
    "io.nix-containers.chart" = "argo-rollouts";
  };
}
