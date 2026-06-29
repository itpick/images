{ mkImage, pkgs, lib, ... }:

# rabbitmq-server-fips
# Container image packaging nixpkgs.rabbitmq-server
mkImage {
  drv = pkgs.rabbitmq-server;
  name = "rabbitmq-server-fips";
  tag = "v${pkgs.rabbitmq-server.version}";
  entrypoint = [ (lib.getExe pkgs.rabbitmq-server) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "rabbitmq-server-fips";
    "org.opencontainers.image.description" = "rabbitmq-server-fips container image (nixpkgs.rabbitmq-server)";
    "org.opencontainers.image.version" = pkgs.rabbitmq-server.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
