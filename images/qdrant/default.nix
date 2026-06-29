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
  # qdrant compiles its full default config into the binary (and all config
  # files are optional), so no config/config.yaml is needed — the defaults
  # already bind the REST API on 0.0.0.0:6333. The only thing that breaks a
  # nonroot run is the default storage/snapshots paths (./storage, ./snapshots,
  # relative to the non-writable cwd); override them to the writable /tmp via
  # QDRANT__ env (qdrant reads env with the QDRANT__ prefix, __ separator).
  # Operators mount a PVC and override QDRANT__STORAGE__STORAGE_PATH.
  cmd = [];

  env = {
    QDRANT__STORAGE__STORAGE_PATH = "/tmp/qdrant/storage";
    QDRANT__STORAGE__SNAPSHOTS_PATH = "/tmp/qdrant/snapshots";
    QDRANT__TELEMETRY_DISABLED = "true";
  };

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
