{ mkImage, pkgs, lib, ... }:

# OpenSearch - Search and analytics engine
# https://opensearch.org/

mkImage {
  drv = pkgs.opensearch;
  name = "opensearch";
  tag = "v${pkgs.opensearch.version}";
  entrypoint = [ "${pkgs.opensearch}/bin/opensearch" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "OpenSearch";
    "org.opencontainers.image.description" = "Open source search and analytics suite";
    "org.opencontainers.image.version" = pkgs.opensearch.version;
  };
}
