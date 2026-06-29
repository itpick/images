{ mkImage, pkgs, lib, ... }:

# bats-fips
# Container image packaging nixpkgs.bats
mkImage {
  drv = pkgs.bats;
  name = "bats-fips";
  tag = "v${pkgs.bats.version}";
  entrypoint = [ (lib.getExe pkgs.bats) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "bats-fips";
    "org.opencontainers.image.description" = "bats-fips container image (nixpkgs.bats)";
    "org.opencontainers.image.version" = pkgs.bats.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
