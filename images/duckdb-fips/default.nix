{ mkImage, pkgs, lib, ... }:

# duckdb-fips
# Container image packaging nixpkgs.duckdb
mkImage {
  drv = pkgs.duckdb;
  name = "duckdb-fips";
  tag = "v${pkgs.duckdb.version}";
  entrypoint = [ (lib.getExe pkgs.duckdb) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "duckdb-fips";
    "org.opencontainers.image.description" = "duckdb-fips container image (nixpkgs.duckdb)";
    "org.opencontainers.image.version" = pkgs.duckdb.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
