{ mkImage, pkgs, lib, ... }:

# conda-fips
# Container image packaging nixpkgs.conda
mkImage {
  drv = pkgs.conda;
  name = "conda-fips";
  tag = "v${pkgs.conda.version}";
  entrypoint = [ (lib.getExe pkgs.conda) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "conda-fips";
    "org.opencontainers.image.description" = "conda-fips container image (nixpkgs.conda)";
    "org.opencontainers.image.version" = pkgs.conda.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
