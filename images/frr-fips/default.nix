{ mkImage, pkgs, lib, ... }:

# frr-fips
# Container image packaging nixpkgs.frr
mkImage {
  drv = pkgs.frr;
  name = "frr-fips";
  tag = "v${pkgs.frr.version}";
  entrypoint = [ (lib.getExe pkgs.frr) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "frr-fips";
    "org.opencontainers.image.description" = "frr-fips container image (nixpkgs.frr)";
    "org.opencontainers.image.version" = pkgs.frr.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
