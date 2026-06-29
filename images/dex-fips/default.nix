{ mkImage, pkgs, lib, ... }:

# dex-fips
# Container image packaging nixpkgs.dex
mkImage {
  drv = pkgs.dex;
  name = "dex-fips";
  tag = "v${pkgs.dex.version}";
  entrypoint = [ (lib.getExe pkgs.dex) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "dex-fips";
    "org.opencontainers.image.description" = "dex-fips container image (nixpkgs.dex)";
    "org.opencontainers.image.version" = pkgs.dex.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
