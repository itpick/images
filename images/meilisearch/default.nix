{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for meilisearch:
# Packages available in nixpkgs:
#   pkgs.meilisearch  # Powerful, fast, and an easy to use search engine

mkImage {
  drv = pkgs.meilisearch;
  name = "meilisearch";
  tag = "v${pkgs.meilisearch.version}";
  entrypoint = [ "${pkgs.meilisearch}/bin/meilisearch" ];
  cmd = [ ];

  env = {
    MEILI_DATA_DIR = "/meili_data";
    MEILI_HTTP_ADDR = "0.0.0.0:7700";
  };

  labels = {
    "org.opencontainers.image.title" = "Meilisearch";
    "org.opencontainers.image.description" = "Powerful, fast, and easy to use search engine";
    "org.opencontainers.image.version" = pkgs.meilisearch.version;
    "io.nix-containers.chart" = "meilisearch";
  };
}
