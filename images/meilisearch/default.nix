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

  # entrypoint + these env vars already make meilisearch runnable (it reads
  # MEILI_* from the environment), but the default /meili_data isn't writable
  # by mkImage's nonroot (65534) user — meilisearch CrashLoops creating its
  # LMDB store there. Point the data dir at the writable /tmp mkImage provides
  # (sticky 1777, so nobody can create the subdir). Operators mount a PVC and
  # override MEILI_DATA_DIR.
  env = {
    MEILI_DATA_DIR = "/tmp/meili_data";
    MEILI_HTTP_ADDR = "0.0.0.0:7700";
  };

  labels = {
    "org.opencontainers.image.title" = "Meilisearch";
    "org.opencontainers.image.description" = "Powerful, fast, and easy to use search engine";
    "org.opencontainers.image.version" = pkgs.meilisearch.version;
    "io.nix-containers.chart" = "meilisearch";
  };
}
