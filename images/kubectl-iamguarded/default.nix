{ mkImage, pkgs, lib, ... }:

# kubectl-iamguarded
# Container image packaging nixpkgs.kubectl
mkImage {
  drv = pkgs.kubectl;
  name = "kubectl-iamguarded";
  tag = "v${pkgs.kubectl.version}";
  entrypoint = [ (lib.getExe pkgs.kubectl) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "kubectl-iamguarded";
    "org.opencontainers.image.description" = "kubectl-iamguarded container image (nixpkgs.kubectl)";
    "org.opencontainers.image.version" = pkgs.kubectl.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
