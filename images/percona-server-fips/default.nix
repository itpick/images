{ mkImage, pkgs, lib, ... }:

# percona-server-fips
# Container image packaging nixpkgs.percona-server
mkImage {
  drv = pkgs.percona-server;
  name = "percona-server-fips";
  tag = "v${pkgs.percona-server.version}";
  entrypoint = [ (lib.getExe pkgs.percona-server) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "percona-server-fips";
    "org.opencontainers.image.description" = "percona-server-fips container image (nixpkgs.percona-server)";
    "org.opencontainers.image.version" = pkgs.percona-server.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
