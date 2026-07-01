{ mkImage, pkgs, lib, ... }:

# zookeeper-nixchart
# ==================
# Apache ZooKeeper image sized for consumption by the charts/zookeeper
# chart.
#
# Entrypoint: shell wrapper that writes a minimal /tmp/zk/zoo.cfg from
# a curated subset of ZOO_* env vars, plus zkServer.sh in the
# foreground.
#
# Supported env (subset of upstream's — sufficient for a functional
# standalone or replicated deployment):
#   ZOO_PORT_NUMBER      — client port (default 2181)
#   ZOO_TICK_TIME        — ms per tick (default 2000)
#   ZOO_INIT_LIMIT       — init sync ticks (default 10)
#   ZOO_SYNC_LIMIT       — follower sync ticks (default 5)
#   ZOO_DATA_DIR         — data directory (default /bitnami/zookeeper/data)
#   ZOO_SERVERS          — comma-separated ensemble list (id=host:2888:3888)
#   ZOO_4LW_COMMANDS_WHITELIST — four-letter cmd allowlist
#
# Non-root; UID 1001.

let
  version = pkgs.zookeeper.version;
  entrypoint = pkgs.writeShellScript "zk-entrypoint" ''
    set -euo pipefail
    export JAVA_HOME="${pkgs.jre}"
    export PATH="${pkgs.jre}/bin:${pkgs.coreutils}/bin:$PATH"

    CFG_DIR="''${ZOO_CONFIG_DIR:-/tmp/zk}"
    mkdir -p "$CFG_DIR"
    CFG="$CFG_DIR/zoo.cfg"

    export ZOO_DATA_DIR="''${ZOO_DATA_DIR:-/bitnami/zookeeper/data}"
    mkdir -p "$ZOO_DATA_DIR"

    cat > "$CFG" <<EOF
tickTime=''${ZOO_TICK_TIME:-2000}
initLimit=''${ZOO_INIT_LIMIT:-10}
syncLimit=''${ZOO_SYNC_LIMIT:-5}
dataDir=$ZOO_DATA_DIR
clientPort=''${ZOO_PORT_NUMBER:-2181}
4lw.commands.whitelist=''${ZOO_4LW_COMMANDS_WHITELIST:-srvr, mntr, ruok, stat}
EOF

    if [ -n "''${ZOO_SERVERS:-}" ]; then
      # ZOO_SERVERS format: id=host:port1:port2 (comma-separated)
      IFS=',' read -ra servers <<< "$ZOO_SERVERS"
      for entry in "''${servers[@]}"; do
        id="''${entry%%=*}"; loc="''${entry#*=}"
        echo "server.$id=$loc" >> "$CFG"
      done
    fi

    exec ${pkgs.zookeeper}/bin/zkServer.sh --config "$CFG_DIR" start-foreground
  '';
in
mkImage {
  drv = pkgs.buildEnv {
    name = "zookeeper-nixchart-env";
    paths = with pkgs; [ zookeeper jre bash coreutils cacert tzdata ];
  };

  name = "zookeeper-nixchart";
  tag = "v${version}";
  entrypoint = [ "${entrypoint}" ];
  cmd = [];
  user = "1001:0";

  labels = {
    "org.opencontainers.image.title" = "zookeeper-nixchart";
    "org.opencontainers.image.description" = "Apache ZooKeeper tuned for the nix-containers charts/zookeeper chart";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "zookeeper";
  };
}
