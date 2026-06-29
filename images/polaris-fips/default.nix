{ mkImage, pkgs, lib, ... }:

# polaris-fips
# Container image packaging nixpkgs.polaris
mkImage {
  drv = pkgs.polaris;
  name = "polaris-fips";
  tag = "v${pkgs.polaris.version}";
  entrypoint = [ (lib.getExe pkgs.polaris) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "polaris-fips";
    "org.opencontainers.image.description" = "polaris-fips container image (nixpkgs.polaris)";
    "org.opencontainers.image.version" = pkgs.polaris.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
