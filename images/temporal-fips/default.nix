{ mkImage, pkgs, lib, ... }:

# temporal-fips
# Container image packaging nixpkgs.temporal
mkImage {
  drv = pkgs.temporal;
  name = "temporal-fips";
  tag = "v${pkgs.temporal.version}";
  entrypoint = [ (lib.getExe pkgs.temporal) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "temporal-fips";
    "org.opencontainers.image.description" = "temporal-fips container image (nixpkgs.temporal)";
    "org.opencontainers.image.version" = pkgs.temporal.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
