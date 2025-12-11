# arangodb
# =============
# ArangoDB - Multi-model NoSQL database
# https://www.arangodb.com/
#
# ArangoDB is a native multi-model database with flexible data models
# for documents, graphs, and key-values.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.arangodb;
  name = "arangodb";
  tag = "v${pkgs.arangodb.version}";
  entrypoint = [ "${pkgs.arangodb}/bin/arangod" ];
  cmd = [];

  extraPkgs = with pkgs; [
    bash
    coreutils
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "ArangoDB";
    "org.opencontainers.image.description" = "Multi-model NoSQL database for documents, graphs, and key-values";
    "org.opencontainers.image.version" = pkgs.arangodb.version;
  };
}
