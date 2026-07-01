{ mkImage, pkgs, lib, ... }:

# valkey-sentinel-nixchart
# ========================
# Valkey Sentinel for the charts/valkey chart. Sentinel PERSISTS cluster
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
  entrypoint = pkgs.writeShellScript "valkey-sentinel-entrypoint" ''
    set -euo pipefail
    TEMPLATE="''${SENTINEL_CONF_TEMPLATE:-${smokeConf}}"
    CONF="''${SENTINEL_CONF:-/tmp/sentinel.conf}"
    if [ ! -f "$CONF" ]; then
      cp "$TEMPLATE" "$CONF"
      chmod 600 "$CONF"
    fi
    exec ${pkgs.valkey}/bin/valkey-sentinel "$CONF" "$@"
  '';
in
mkImage {
  drv = pkgs.buildEnv {
    name = "valkey-sentinel-nixchart-env";
    paths = [ pkgs.valkey pkgs.bash pkgs.coreutils pkgs.cacert pkgs.tzdata ];
  };
  name = "valkey-sentinel-nixchart";
  tag = "v${pkgs.valkey.version}";
  entrypoint = [ "${entrypoint}" ];
  cmd = [];
  user = "1001:0";
  labels."org.opencontainers.image.title" = "valkey-sentinel-nixchart";
  labels."org.opencontainers.image.description" = "Valkey Sentinel for the nix-containers charts/valkey chart";
  labels."org.opencontainers.image.version" = pkgs.valkey.version;
  labels."io.nix-containers.chart" = "valkey";
}
