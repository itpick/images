{ mkImage, pkgs, lib, ... }:

# argocd-fips
# Container image packaging nixpkgs.argocd
mkImage {
  drv = pkgs.argocd;
  name = "argocd-fips";
  tag = "v${pkgs.argocd.version}";
  entrypoint = [ (lib.getExe pkgs.argocd) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "argocd-fips";
    "org.opencontainers.image.description" = "argocd-fips container image (nixpkgs.argocd)";
    "org.opencontainers.image.version" = pkgs.argocd.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
