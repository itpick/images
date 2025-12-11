{ mkImage, pkgs, lib, ... }:

# CockroachDB - Distributed SQL database
# https://www.cockroachlabs.com/

mkImage {
  drv = pkgs.cockroachdb;
  name = "cockroachdb";
  tag = "v${pkgs.cockroachdb.version}";
  entrypoint = [ "${pkgs.cockroachdb}/bin/cockroach" ];
  cmd = [ "start-single-node" "--insecure" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "CockroachDB";
    "org.opencontainers.image.description" = "Distributed SQL database built on a transactional key-value store";
    "org.opencontainers.image.version" = pkgs.cockroachdb.version;
  };
}
