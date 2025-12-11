{ mkImage, pkgs, lib, ... }:

# rqlite - Distributed relational database
# https://rqlite.io/

mkImage {
  drv = pkgs.rqlite;
  name = "rqlite";
  tag = "v${pkgs.rqlite.version}";
  entrypoint = [ "${pkgs.rqlite}/bin/rqlited" ];
  cmd = [ "-node-id" "node1" "/data" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "rqlite";
    "org.opencontainers.image.description" = "Lightweight distributed relational database built on SQLite";
    "org.opencontainers.image.version" = pkgs.rqlite.version;
  };
}
