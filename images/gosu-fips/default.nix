{ mkImage, pkgs, lib, ... }:

# gosu-fips
# Container image packaging nixpkgs.gosu
mkImage {
  drv = pkgs.gosu;
  name = "gosu-fips";
  tag = "v${pkgs.gosu.version}";
  entrypoint = [ (lib.getExe pkgs.gosu) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "gosu-fips";
    "org.opencontainers.image.description" = "gosu-fips container image (nixpkgs.gosu)";
    "org.opencontainers.image.version" = pkgs.gosu.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
