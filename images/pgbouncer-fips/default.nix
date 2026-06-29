{ mkImage, pkgs, lib, ... }:

# pgbouncer-fips
# Container image packaging nixpkgs.pgbouncer
mkImage {
  drv = pkgs.pgbouncer;
  name = "pgbouncer-fips";
  tag = "v${pkgs.pgbouncer.version}";
  entrypoint = [ (lib.getExe pkgs.pgbouncer) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "pgbouncer-fips";
    "org.opencontainers.image.description" = "pgbouncer-fips container image (nixpkgs.pgbouncer)";
    "org.opencontainers.image.version" = pkgs.pgbouncer.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
