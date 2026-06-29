{ mkImage, pkgs, lib, ... }:

# conda-base
# Container image packaging nixpkgs.conda
mkImage {
  drv = pkgs.conda;
  name = "conda-base";
  tag = "v${pkgs.conda.version}";
  entrypoint = [ (lib.getExe pkgs.conda) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "conda-base";
    "org.opencontainers.image.description" = "conda-base container image (nixpkgs.conda)";
    "org.opencontainers.image.version" = pkgs.conda.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
