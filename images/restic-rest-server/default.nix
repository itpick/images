{ mkImage, pkgs, lib, ... }:

# Restic REST Server - REST backend for restic
# https://github.com/restic/rest-server

mkImage {
  drv = pkgs.restic-rest-server;
  name = "restic-rest-server";
  tag = "v${pkgs.restic-rest-server.version}";
  entrypoint = [ "${pkgs.restic-rest-server}/bin/rest-server" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Restic REST Server";
    "org.opencontainers.image.description" = "REST backend for restic";
    "org.opencontainers.image.version" = pkgs.restic-rest-server.version;
  };
}
