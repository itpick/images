{ mkImage, pkgs, lib, ... }:

# openfga-fips
# Container image packaging nixpkgs.openfga
mkImage {
  drv = pkgs.openfga;
  name = "openfga-fips";
  tag = "v${pkgs.openfga.version}";
  entrypoint = [ (lib.getExe pkgs.openfga) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "openfga-fips";
    "org.opencontainers.image.description" = "openfga-fips container image (nixpkgs.openfga)";
    "org.opencontainers.image.version" = pkgs.openfga.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
