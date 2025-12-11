# qdrant
# =============
# Qdrant - Vector similarity search engine
# https://qdrant.tech/
#
# Qdrant is a vector similarity search engine and database with
# extended filtering support and neural network matching.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.qdrant;
  name = "qdrant";
  tag = "v${pkgs.qdrant.version}";
  entrypoint = [ "${pkgs.qdrant}/bin/qdrant" ];
  cmd = [];

  extraPkgs = with pkgs; [
    bash
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "Qdrant";
    "org.opencontainers.image.description" = "Vector similarity search engine and database";
    "org.opencontainers.image.version" = pkgs.qdrant.version;
  };
}
