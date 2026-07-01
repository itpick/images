{ mkImage, pkgs, lib, ... }:

# elasticsearch-nixchart
# ======================
# Elasticsearch image for consumption by the charts/elasticsearch chart.
#
# Uses nixpkgs.elasticsearch + a shell wrapper that translates the
# chart's ELASTICSEARCH_* env vars into Elasticsearch's native
# `-E cluster.setting=value` CLI flags and `ES_JAVA_OPTS` heap sizing.
#
# Supported env (subset of upstream's — enough for standalone or
# multi-node cluster deployment):
#   ELASTICSEARCH_CLUSTER_NAME        → -E cluster.name=
#   ELASTICSEARCH_NODE_ROLES          → -E node.roles=
#   ELASTICSEARCH_CLUSTER_HOSTS       → -E discovery.seed_hosts=
#   ELASTICSEARCH_MINIMUM_MASTER_NODES → -E cluster.initial_master_nodes=
#   ELASTICSEARCH_HTTP_PORT_NUMBER    → -E http.port=
#   ELASTICSEARCH_TRANSPORT_PORT_NUMBER → -E transport.port=
#   ELASTICSEARCH_HEAP_SIZE           → -Xms/-Xmx in ES_JAVA_OPTS
#
# Deliberately out of scope:
#   - Plugin auto-install via ELASTICSEARCH_PLUGINS
#   - FS snapshot repo path setup
#   - X-Pack / TLS auto-generation

let
  version = pkgs.elasticsearch.version;
  entrypoint = pkgs.writeShellScript "es-entrypoint" ''
    set -euo pipefail

    args=()
    [ -n "''${ELASTICSEARCH_CLUSTER_NAME:-}" ]        && args+=(-E "cluster.name=''${ELASTICSEARCH_CLUSTER_NAME}")
    [ -n "''${ELASTICSEARCH_NODE_ROLES:-}" ]          && args+=(-E "node.roles=[''${ELASTICSEARCH_NODE_ROLES}]")
    [ -n "''${ELASTICSEARCH_CLUSTER_HOSTS:-}" ]       && args+=(-E "discovery.seed_hosts=''${ELASTICSEARCH_CLUSTER_HOSTS}")
    [ -n "''${ELASTICSEARCH_CLUSTER_MASTER_HOSTS:-}" ] && args+=(-E "cluster.initial_master_nodes=''${ELASTICSEARCH_CLUSTER_MASTER_HOSTS}")
    [ -n "''${ELASTICSEARCH_HTTP_PORT_NUMBER:-}" ]    && args+=(-E "http.port=''${ELASTICSEARCH_HTTP_PORT_NUMBER}")
    [ -n "''${ELASTICSEARCH_TRANSPORT_PORT_NUMBER:-}" ] && args+=(-E "transport.port=''${ELASTICSEARCH_TRANSPORT_PORT_NUMBER}")
    [ -n "''${ELASTICSEARCH_ADVERTISED_HOSTNAME:-}" ] && args+=(-E "network.publish_host=''${ELASTICSEARCH_ADVERTISED_HOSTNAME}")

    # Heap sizing: ELASTICSEARCH_HEAP_SIZE=2g → -Xms2g -Xmx2g
    if [ -n "''${ELASTICSEARCH_HEAP_SIZE:-}" ]; then
      export ES_JAVA_OPTS="-Xms''${ELASTICSEARCH_HEAP_SIZE} -Xmx''${ELASTICSEARCH_HEAP_SIZE} ''${ES_JAVA_OPTS:-}"
    fi

    # Bind all interfaces by default so k8s services can route
    args+=(-E "network.host=0.0.0.0")

    exec ${pkgs.elasticsearch}/bin/elasticsearch "''${args[@]}" "$@"
  '';
in
mkImage {
  drv = pkgs.buildEnv {
    name = "elasticsearch-nixchart-env";
    paths = with pkgs; [ elasticsearch bash coreutils cacert tzdata ];
  };

  name = "elasticsearch-nixchart";
  tag = "v${version}";
  entrypoint = [ "${entrypoint}" ];
  cmd = [];
  user = "1001:0";

  labels = {
    "org.opencontainers.image.title" = "elasticsearch-nixchart";
    "org.opencontainers.image.description" = "Elasticsearch image tuned for the nix-containers charts/elasticsearch chart";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "elasticsearch";
  };
}
