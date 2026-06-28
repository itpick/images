#!/usr/bin/env bash
# elasticsearch docker-entrypoint.sh
#
# Runs a single-node Elasticsearch with no config mounting required, so the
# 0-config kind smoke test gets a Running pod. Elasticsearch reads its config
# from a writable ES_PATH_CONF that must contain jvm.options + log4j2.properties
# (it refuses to start otherwise), but $ES_HOME/config in the image is a
# read-only nix store path. So on first boot we seed a writable config dir from
# the store defaults, overlay a minimal single-node / security-disabled
# elasticsearch.yml bound to 0.0.0.0, and start the server. Data, logs and tmp
# live under writable /tmp.
set -euo pipefail

ES_PATH_CONF="${ES_PATH_CONF:-/tmp/elasticsearch/config}"
ES_PATH_DATA="${ES_PATH_DATA:-/tmp/elasticsearch/data}"
ES_PATH_LOGS="${ES_PATH_LOGS:-/tmp/elasticsearch/logs}"
ES_TMPDIR="${ES_TMPDIR:-/tmp/elasticsearch/tmp}"
export ES_PATH_CONF ES_TMPDIR

# Pass non-server invocations straight through (e.g. `elasticsearch --version`).
if [ "$#" -gt 0 ] && [ "$1" != "elasticsearch" ]; then
  exec "$@"
fi

mkdir -p "$ES_PATH_CONF" "$ES_PATH_DATA" "$ES_PATH_LOGS" "$ES_TMPDIR"

# Seed the writable config dir from the read-only store defaults on first boot
# (jvm.options, log4j2.properties, jvm.options.d/, …). The store files come in
# read-only, so make them writable for the elasticsearch keystore + any runtime
# rewrites.
if [ ! -f "$ES_PATH_CONF/jvm.options" ] && [ -d "$ES_HOME/config" ]; then
  cp -r "$ES_HOME"/config/. "$ES_PATH_CONF"/
  chmod -R u+w "$ES_PATH_CONF"
fi

# Minimal single-node, security-disabled config bound to all interfaces.
# single-node discovery puts ES in development mode, which downgrades the
# production bootstrap checks (max_map_count, …) to warnings so the pod starts
# on an untuned kind node.
cat > "$ES_PATH_CONF/elasticsearch.yml" <<EOF
cluster.name: docker-cluster
node.name: single-node
network.host: 0.0.0.0
http.port: 9200
discovery.type: single-node
path.data: $ES_PATH_DATA
path.logs: $ES_PATH_LOGS
xpack.security.enabled: false
xpack.security.http.ssl.enabled: false
xpack.security.transport.ssl.enabled: false
EOF

exec elasticsearch
