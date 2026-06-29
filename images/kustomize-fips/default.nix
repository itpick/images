{ mkImage, pkgs, lib, ... }:

# kustomize-fips
# Container image packaging nixpkgs.kustomize
mkImage {
  drv = pkgs.kustomize;
  name = "kustomize-fips";
  tag = "v${pkgs.kustomize.version}";
  entrypoint = [ (lib.getExe pkgs.kustomize) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "kustomize-fips";
    "org.opencontainers.image.description" = "kustomize-fips container image (nixpkgs.kustomize)";
    "org.opencontainers.image.version" = pkgs.kustomize.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
