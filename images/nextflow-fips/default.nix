{ mkImage, pkgs, lib, ... }:

# nextflow-fips
# Container image packaging nixpkgs.nextflow
mkImage {
  drv = pkgs.nextflow;
  name = "nextflow-fips";
  tag = "v${pkgs.nextflow.version}";
  entrypoint = [ (lib.getExe pkgs.nextflow) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "nextflow-fips";
    "org.opencontainers.image.description" = "nextflow-fips container image (nixpkgs.nextflow)";
    "org.opencontainers.image.version" = pkgs.nextflow.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
