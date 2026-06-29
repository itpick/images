{ mkImage, pkgs, lib, ... }:

# rqlite-fips
# Container image packaging nixpkgs.rqlite
mkImage {
  drv = pkgs.rqlite;
  name = "rqlite-fips";
  tag = "v${pkgs.rqlite.version}";
  entrypoint = [ (lib.getExe pkgs.rqlite) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "rqlite-fips";
    "org.opencontainers.image.description" = "rqlite-fips container image (nixpkgs.rqlite)";
    "org.opencontainers.image.version" = pkgs.rqlite.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
