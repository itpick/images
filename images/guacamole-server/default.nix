{ mkImage, pkgs, lib, ... }:

# guacamole-server
# Container image packaging nixpkgs.guacamole-server
mkImage {
  drv = pkgs.guacamole-server;
  name = "guacamole-server";
  tag = "v${pkgs.guacamole-server.version}";
  entrypoint = [ (lib.getExe pkgs.guacamole-server) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "guacamole-server";
    "org.opencontainers.image.description" = "guacamole-server container image (nixpkgs.guacamole-server)";
    "org.opencontainers.image.version" = pkgs.guacamole-server.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
