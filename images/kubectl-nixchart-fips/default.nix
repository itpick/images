{ mkImage, pkgs, lib, ... }:

# kubectl-nixchart-fips
# Container image packaging nixpkgs.kubectl
mkImage {
  drv = pkgs.kubectl;
  name = "kubectl-nixchart-fips";
  tag = "v${pkgs.kubectl.version}";
  entrypoint = [ (lib.getExe pkgs.kubectl) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "kubectl-nixchart-fips";
    "org.opencontainers.image.description" = "kubectl-nixchart-fips container image (nixpkgs.kubectl)";
    "org.opencontainers.image.version" = pkgs.kubectl.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
