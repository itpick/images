{ mkImage, pkgs, lib, ... }:

# nats-server-fips
# Container image packaging nixpkgs.nats-server
mkImage {
  drv = pkgs.nats-server;
  name = "nats-server-fips";
  tag = "v${pkgs.nats-server.version}";
  entrypoint = [ (lib.getExe pkgs.nats-server) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "nats-server-fips";
    "org.opencontainers.image.description" = "nats-server-fips container image (nixpkgs.nats-server)";
    "org.opencontainers.image.version" = pkgs.nats-server.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
