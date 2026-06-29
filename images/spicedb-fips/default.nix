{ mkImage, pkgs, lib, ... }:

# spicedb-fips
# Container image packaging nixpkgs.spicedb
mkImage {
  drv = pkgs.spicedb;
  name = "spicedb-fips";
  tag = "v${pkgs.spicedb.version}";
  entrypoint = [ (lib.getExe pkgs.spicedb) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "spicedb-fips";
    "org.opencontainers.image.description" = "spicedb-fips container image (nixpkgs.spicedb)";
    "org.opencontainers.image.version" = pkgs.spicedb.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
