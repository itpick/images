# weaviate
# =============
# Weaviate - Vector database
# https://weaviate.io/
#
# Weaviate is an open source vector database that stores both objects
# and vectors, allowing for combining vector search with filtering.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.weaviate;
  name = "weaviate";
  tag = "v${pkgs.weaviate.version}";
  entrypoint = [ "${pkgs.weaviate}/bin/weaviate" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Weaviate";
    "org.opencontainers.image.description" = "Open source vector database";
    "org.opencontainers.image.version" = pkgs.weaviate.version;
  };
}
