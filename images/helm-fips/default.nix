{ mkImage, pkgs, lib, ... }:

# helm-fips
# Container image packaging nixpkgs.helm
mkImage {
  drv = pkgs.helm;
  name = "helm-fips";
  tag = "v${pkgs.helm.version}";
  entrypoint = [ (lib.getExe pkgs.helm) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "helm-fips";
    "org.opencontainers.image.description" = "helm-fips container image (nixpkgs.helm)";
    "org.opencontainers.image.version" = pkgs.helm.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
