{ mkImage, pkgs, lib, ... }:

# pgbouncer-iamguarded
# Container image packaging nixpkgs.pgbouncer
mkImage {
  drv = pkgs.pgbouncer;
  name = "pgbouncer-iamguarded";
  tag = "v${pkgs.pgbouncer.version}";
  entrypoint = [ (lib.getExe pkgs.pgbouncer) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "pgbouncer-iamguarded";
    "org.opencontainers.image.description" = "pgbouncer-iamguarded container image (nixpkgs.pgbouncer)";
    "org.opencontainers.image.version" = pkgs.pgbouncer.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
