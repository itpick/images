{ mkImage, pkgs, lib, ... }:

# Dgraph - Distributed graph database
# https://dgraph.io/

mkImage {
  drv = pkgs.dgraph;
  name = "dgraph";
  tag = "v${pkgs.dgraph.version}";
  entrypoint = [ "${pkgs.dgraph}/bin/dgraph" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Dgraph";
    "org.opencontainers.image.description" = "Native GraphQL database with a graph backend";
    "org.opencontainers.image.version" = pkgs.dgraph.version;
  };
}
