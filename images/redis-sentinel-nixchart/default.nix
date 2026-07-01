{ mkImage, pkgs, lib, ... }:

# redis-sentinel-nixchart
# =======================
# Redis Sentinel for the charts/redis chart. Sentinel PERSISTS cluster
# state back into its config file, so the config MUST be writable — we
# can't just point at a read-only /etc path. Entrypoint below copies
# the shipped template to /tmp/sentinel.conf on first run. Chart pods
# override via SENTINEL_CONF_TEMPLATE / SENTINEL_CONF env.

let
  smokeConf = pkgs.writeText "sentinel.conf" ''
    port 26379
    dir /tmp
    sentinel monitor mymaster 127.0.0.1 6379 1
    sentinel down-after-milliseconds mymaster 5000
    sentinel failover-timeout mymaster 60000
    sentinel parallel-syncs mymaster 1
  '';
  entrypoint = pkgs.writeShellScript "redis-sentinel-entrypoint" ''
    set -euo pipefail
    TEMPLATE="''${SENTINEL_CONF_TEMPLATE:-${smokeConf}}"
    CONF="''${SENTINEL_CONF:-/tmp/sentinel.conf}"
    if [ ! -f "$CONF" ]; then
      cp "$TEMPLATE" "$CONF"
      chmod 600 "$CONF"
    fi
    exec ${pkgs.redis}/bin/redis-sentinel "$CONF" "$@"
  '';
in
mkImage {
  drv = pkgs.buildEnv {
    name = "redis-sentinel-nixchart-env";
    paths = [ pkgs.redis pkgs.bash pkgs.coreutils pkgs.cacert pkgs.tzdata ];
  };
  name = "redis-sentinel-nixchart";
  tag = "v${pkgs.redis.version}";
  entrypoint = [ "${entrypoint}" ];
  cmd = [];
  user = "1001:0";
  labels."org.opencontainers.image.title" = "redis-sentinel-nixchart";
  labels."org.opencontainers.image.description" = "Redis Sentinel for the nix-containers charts/redis chart";
  labels."org.opencontainers.image.version" = pkgs.redis.version;
  labels."io.nix-containers.chart" = "redis";
}
