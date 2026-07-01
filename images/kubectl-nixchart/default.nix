{ mkImage, pkgs, lib, ... }:

# kubectl-nixchart
# Container image packaging nixpkgs.kubectl
mkImage {
  drv = pkgs.kubectl;
  name = "kubectl-nixchart";
  tag = "v${pkgs.kubectl.version}";
  entrypoint = [ (lib.getExe pkgs.kubectl) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "kubectl-nixchart";
    "org.opencontainers.image.description" = "kubectl-nixchart container image (nixpkgs.kubectl)";
    "org.opencontainers.image.version" = pkgs.kubectl.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
