{ mkImage, pkgs, lib, ... }:

# SPIRE Server - SPIFFE Runtime Environment Server
# https://spiffe.io/

mkImage {
  drv = pkgs.spire-server;
  name = "spire-server";
  tag = "v${pkgs.spire-server.version}";
  entrypoint = [ "${pkgs.spire-server}/bin/spire-server" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "SPIRE Server";
    "org.opencontainers.image.description" = "SPIFFE Runtime Environment Server for identity attestation";
    "org.opencontainers.image.version" = pkgs.spire-server.version;
  };
}
