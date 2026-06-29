{ mkImage, pkgs, lib, ... }:

# distribution-fips
# Container image packaging nixpkgs.distribution
mkImage {
  drv = pkgs.distribution;
  name = "distribution-fips";
  tag = "v${pkgs.distribution.version}";
  entrypoint = [ (lib.getExe pkgs.distribution) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "distribution-fips";
    "org.opencontainers.image.description" = "distribution-fips container image (nixpkgs.distribution)";
    "org.opencontainers.image.version" = pkgs.distribution.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
