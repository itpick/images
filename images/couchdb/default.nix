{ mkImage, pkgs, lib, ... }:

# CouchDB - Document-oriented NoSQL database
# https://couchdb.apache.org/

mkImage {
  drv = pkgs.couchdb3;
  name = "couchdb";
  tag = "v${pkgs.couchdb3.version}";
  entrypoint = [ "${pkgs.couchdb3}/bin/couchdb" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "CouchDB";
    "org.opencontainers.image.description" = "Document-oriented NoSQL database";
    "org.opencontainers.image.version" = pkgs.couchdb3.version;
  };
}
