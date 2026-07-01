#!/usr/bin/env bash
# opensearch docker-entrypoint.sh
#
# Runs a single-node OpenSearch with no config mounting required, so the
# 0-config kind smoke test gets a Running pod. OpenSearch reads its config from
# a writable OPENSEARCH_PATH_CONF that must contain jvm.options +
# log4j2.properties (it refuses to start otherwise), but $OPENSEARCH_HOME/config
# in the image is a read-only nix store path. So on first boot we seed a
# writable config dir from the store defaults, overlay a minimal single-node /
# security-disabled opensearch.yml bound to 0.0.0.0, and start the server. Data,
# logs and tmp live under writable /tmp.
set -euo pipefail

OPENSEARCH_PATH_CONF="${OPENSEARCH_PATH_CONF:-/tmp/opensearch/config}"
OS_DATA="${OPENSEARCH_PATH_DATA:-/tmp/opensearch/data}"
OS_LOGS="${OPENSEARCH_PATH_LOGS:-/tmp/opensearch/logs}"
OPENSEARCH_TMPDIR="${OPENSEARCH_TMPDIR:-/tmp/opensearch/tmp}"
export OPENSEARCH_PATH_CONF OPENSEARCH_TMPDIR

# Pass non-server invocations straight through (e.g. `opensearch --version`).
if [ "$#" -gt 0 ] && [ "$1" != "opensearch" ]; then
  exec "$@"
fi

mkdir -p "$OPENSEARCH_PATH_CONF" "$OS_DATA" "$OS_LOGS" "$OPENSEARCH_TMPDIR"

# Seed the writable config dir from the read-only store defaults on first boot
# (jvm.options, log4j2.properties, the bundled plugins' config, …).
if [ ! -f "$OPENSEARCH_PATH_CONF/jvm.options" ] && [ -d "$OPENSEARCH_HOME/config" ]; then
  cp -r "$OPENSEARCH_HOME"/config/. "$OPENSEARCH_PATH_CONF"/
  chmod -R u+w "$OPENSEARCH_PATH_CONF"
  # The packaged jvm.options logs GC to a relative "logs/gc.log", which the JVM
  # resolves against a non-writable dir and fatals on. Redirect it into the
  # writable logs dir.
  sed -i "s#file=logs/gc.log#file=$OS_LOGS/gc.log#" "$OPENSEARCH_PATH_CONF/jvm.options"
fi

# Minimal single-node, security-disabled config bound to all interfaces.
# single-node discovery puts OpenSearch in development mode, which downgrades the
# production bootstrap checks (max_map_count, …) to warnings so the pod starts on
# an untuned kind node.
cat > "$OPENSEARCH_PATH_CONF/opensearch.yml" <<EOF
cluster.name: docker-cluster
node.name: single-node
network.host: 0.0.0.0
http.port: 9200
discovery.type: single-node
path.data: $OS_DATA
path.logs: $OS_LOGS
plugins.security.disabled: true
EOF

exec opensearch
