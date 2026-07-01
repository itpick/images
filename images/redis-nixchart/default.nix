{ mkImage, pkgs, lib, ... }:

# redis-nixchart
# ==============
# Redis image sized for consumption by the charts/redis chart.
#
# Contract with the chart:
#   - Binary at $out/bin/redis-server (from pkgs.redis)
#   - Entrypoint: small shell wrapper that starts redis-server with
#     env-driven config
#   - Consumes:
#       REDIS_PASSWORD        — set requirepass and enable AUTH
#       ALLOW_EMPTY_PASSWORD  — if "yes", skip AUTH even without password
#       REDIS_PORT            — listen port (default 6379)
#       REDIS_TLS_ENABLED     — "yes" to enable TLS (paths from
#                               REDIS_TLS_{CERT,KEY,CA}_FILE)
#       REDIS_EXTRA_FLAGS     — additional redis-server flags
#   - Data at /data (or set REDIS_DATA_DIR)
#
# Intentionally does NOT reproduce upstream's replication/sentinel/
# cluster orchestration. Users who need those can:
#   - Pass a custom config file via /etc/redis/redis.conf
#   - Set REDIS_EXTRA_FLAGS to add --replicaof / --cluster-enabled etc.
#   - Use the upstream Helm chart.

let
  version = pkgs.redis.version;
  entrypoint = pkgs.writeShellScript "redis-entrypoint" ''
    set -euo pipefail

    export REDIS_DATA_DIR="''${REDIS_DATA_DIR:-/data}"
    export REDIS_PORT="''${REDIS_PORT:-6379}"

    mkdir -p "$REDIS_DATA_DIR"

    args=(
      --dir "$REDIS_DATA_DIR"
      --port "$REDIS_PORT"
    )

    if [ -n "''${REDIS_PASSWORD:-}" ]; then
      args+=(--requirepass "$REDIS_PASSWORD")
    elif [ "''${ALLOW_EMPTY_PASSWORD:-no}" != "yes" ]; then
      echo "redis-nixchart: REDIS_PASSWORD is required (or set ALLOW_EMPTY_PASSWORD=yes)" >&2
      exit 1
    fi

    if [ "''${REDIS_TLS_ENABLED:-no}" = "yes" ]; then
      args+=(
        --tls-port "$REDIS_PORT"
        --port 0
        --tls-cert-file "''${REDIS_TLS_CERT_FILE:-/tls/tls.crt}"
        --tls-key-file  "''${REDIS_TLS_KEY_FILE:-/tls/tls.key}"
      )
      if [ -n "''${REDIS_TLS_CA_FILE:-}" ]; then
        args+=(--tls-ca-cert-file "$REDIS_TLS_CA_FILE")
      fi
    fi

    # Config file, if user mounted one at /etc/redis/redis.conf, is loaded first
    if [ -f /etc/redis/redis.conf ]; then
      exec ${pkgs.redis}/bin/redis-server /etc/redis/redis.conf \
        "''${args[@]}" ''${REDIS_EXTRA_FLAGS:-}
    fi

    exec ${pkgs.redis}/bin/redis-server "''${args[@]}" ''${REDIS_EXTRA_FLAGS:-}
  '';
in
mkImage {
  drv = pkgs.buildEnv {
    name = "redis-nixchart-env";
    paths = with pkgs; [ redis bash coreutils cacert tzdata ];
  };

  name = "redis-nixchart";
  tag = "v${version}";
  entrypoint = [ "${entrypoint}" ];
  cmd = [];
  user = "1001:0";

  labels = {
    "org.opencontainers.image.title" = "redis-nixchart";
    "org.opencontainers.image.description" = "Redis image tuned for the nix-containers charts/redis chart";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "redis";
  };
}
