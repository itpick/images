{ mkImage, pkgs, lib, ... }:

# kubectl-iamguarded-fips
# Container image packaging nixpkgs.kubectl
mkImage {
  drv = pkgs.kubectl;
  name = "kubectl-iamguarded-fips";
  tag = "v${pkgs.kubectl.version}";
  entrypoint = [ (lib.getExe pkgs.kubectl) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "kubectl-iamguarded-fips";
    "org.opencontainers.image.description" = "kubectl-iamguarded-fips container image (nixpkgs.kubectl)";
    "org.opencontainers.image.version" = pkgs.kubectl.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
