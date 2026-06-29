{ mkImage, pkgs, lib, ... }:

# oras-fips
# Container image packaging nixpkgs.oras
mkImage {
  drv = pkgs.oras;
  name = "oras-fips";
  tag = "v${pkgs.oras.version}";
  entrypoint = [ (lib.getExe pkgs.oras) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "oras-fips";
    "org.opencontainers.image.description" = "oras-fips container image (nixpkgs.oras)";
    "org.opencontainers.image.version" = pkgs.oras.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
