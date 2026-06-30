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
  # Was empty (no command). Weaviate's server needs the bind flags and its
  # persistence path is required + must be writable. Run the standard standalone
  # invocation (the upstream image's CMD): bind 0.0.0.0:8080, with the data path
  # under the writable /tmp, anonymous access on, no vectorizer module, and a
  # single-node cluster name. Operators mount a PVC at PERSISTENCE_DATA_PATH and
  # enable auth/modules.
  cmd = [ "--host" "0.0.0.0" "--port" "8080" "--scheme" "http" ];

  env = {
    PERSISTENCE_DATA_PATH = "/tmp/weaviate";
    DEFAULT_VECTORIZER_MODULE = "none";
    ENABLE_MODULES = "";
    AUTHENTICATION_ANONYMOUS_ACCESS_ENABLED = "true";
    QUERY_DEFAULTS_LIMIT = "25";
    CLUSTER_HOSTNAME = "node1";
  };

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Weaviate";
    "org.opencontainers.image.description" = "Open source vector database";
    "org.opencontainers.image.version" = pkgs.weaviate.version;
  };
}
