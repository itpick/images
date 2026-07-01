{ mkImage, pkgs, lib, ... }:

# logstash-nixchart
# =================
# Logstash for consumption by the charts/logstash chart.
#
# Runs logstash with the chart-mounted config directory.
# Chart mounts pipeline configs at /nix-containers/logstash/config.

let
  version = pkgs.logstash.version;
  entrypoint = pkgs.writeShellScript "logstash-entrypoint" ''
    set -euo pipefail

    args=()
    [ -n "''${LOGSTASH_CONF_FILENAME:-}" ] && args+=(-f "''${LOGSTASH_CONF_FILENAME}")
    [ -n "''${LOGSTASH_DATA_DIR:-}" ]      && args+=(--path.data "''${LOGSTASH_DATA_DIR}")
    [ -n "''${LOGSTASH_API_PORT_NUMBER:-}" ] && args+=(--api.http.port "''${LOGSTASH_API_PORT_NUMBER}")

    if [ "''${LOGSTASH_EXPOSE_API:-no}" = "yes" ]; then
      args+=(--api.http.host "0.0.0.0")
    fi

    exec ${pkgs.logstash}/bin/logstash "''${args[@]}" "$@"
  '';
in
mkImage {
  drv = pkgs.buildEnv {
    name = "logstash-nixchart-env";
    paths = with pkgs; [ logstash bash coreutils cacert tzdata ];
  };

  name = "logstash-nixchart";
  tag = "v${version}";
  entrypoint = [ "${entrypoint}" ];
  cmd = [];
  user = "1001:0";

  labels = {
    "org.opencontainers.image.title" = "logstash-nixchart";
    "org.opencontainers.image.description" = "Logstash image tuned for the nix-containers charts/logstash chart";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "logstash";
  };
}
