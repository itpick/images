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

  # meilisearch reads MEILI_* from the environment. Its writable dirs all
  # default to paths relative to the working dir ("./data.ms", "./dumps",
  # "./snapshots"), and the nonroot pod's workdir is "/" (read-only), so a bare
  # run CrashLoops with "Read-only file system (os error 30)". Point all three
  # at the writable /tmp (sticky 1777). NOTE: the env var is MEILI_DB_PATH, not
  # MEILI_DATA_DIR — the latter is silently ignored, leaving the store at the
  # default ./data.ms (that was the bug here). MEILI_HTTP_ADDR binds all
  # interfaces so the kind-test probe can reach :7700. Operators mount a PVC and
  # override these. (dev env => no master key required.)
  env = {
    MEILI_DB_PATH = "/tmp/meili/data.ms";
    MEILI_DUMP_DIR = "/tmp/meili/dumps";
    MEILI_SNAPSHOT_DIR = "/tmp/meili/snapshots";
    MEILI_HTTP_ADDR = "0.0.0.0:7700";
  };

  labels = {
    "org.opencontainers.image.title" = "Meilisearch";
    "org.opencontainers.image.description" = "Powerful, fast, and easy to use search engine";
    "org.opencontainers.image.version" = pkgs.meilisearch.version;
    "io.nix-containers.chart" = "meilisearch";
  };
}
