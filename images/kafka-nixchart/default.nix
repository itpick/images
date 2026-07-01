{ mkImage, pkgs, lib, ... }:

# kafka-nixchart
# ==============
# Apache Kafka image sized for consumption by the charts/kafka chart.
#
# Uses the upstream Apache Kafka release binary + Java runtime + a
# small shell wrapper that:
#   - Translates KAFKA_CFG_<UPPER_UNDERSCORE> env vars to
#     <lower.dot> keys in server.properties (upstream chart convention).
#   - Falls through to kafka-server-start.sh with the resulting config.
#
# Chart contract:
#   - Consumes KAFKA_CFG_*    — see upstream chart values.yaml
#   - Consumes KAFKA_HEAP_OPTS (native kafka env var)
#   - Data at KAFKA_CFG_LOG_DIRS (default /bitnami/kafka/data mirrors
#     what upstream chart mounts, but any path works — set the env)
#
# Non-root; UID 1001.

let
  version = "3.9.0";
  scalaVersion = "2.13";

  kafkaBin = pkgs.stdenv.mkDerivation {
    pname = "kafka-nixchart-bin";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://archive.apache.org/dist/kafka/${version}/kafka_${scalaVersion}-${version}.tgz";
      hash = "sha256-q8REAt3xA+OPGbDktE5l2pqDG6nlj9dyUEGxqhaO6NE=";
    };

    dontConfigure = true;
    dontBuild = true;

    sourceRoot = "kafka_${scalaVersion}-${version}";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/opt/kafka
      cp -r . $out/opt/kafka/
      for f in $out/opt/kafka/bin/*.sh; do chmod +x "$f"; done
      runHook postInstall
    '';

    meta = with lib; {
      description = "Apache Kafka distributed event streaming platform";
      homepage = "https://kafka.apache.org";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

  entrypoint = pkgs.writeShellScript "kafka-entrypoint" ''
    set -euo pipefail

    export PATH="${pkgs.jre}/bin:${pkgs.coreutils}/bin:${pkgs.gnugrep}/bin:${pkgs.gnused}/bin:$PATH"
    export KAFKA_HOME="${kafkaBin}/opt/kafka"

    CONFIG_DIR="''${KAFKA_CONFIG_DIR:-/tmp/kafka-config}"
    mkdir -p "$CONFIG_DIR"
    PROPS="$CONFIG_DIR/server.properties"

    # Base config: prefer kraft-mode if the env indicates so, else zookeeper
    if [ "''${KAFKA_CFG_PROCESS_ROLES:-}" != "" ] || [ "''${KAFKA_KRAFT_CLUSTER_ID:-}" != "" ]; then
      cp "$KAFKA_HOME/config/kraft/server.properties" "$PROPS" 2>/dev/null || \
        cp "$KAFKA_HOME/config/server.properties" "$PROPS"
    else
      cp "$KAFKA_HOME/config/server.properties" "$PROPS"
    fi

    # Translate every KAFKA_CFG_* env var to a <lower.dot> property.
    # Overwrite the base entry if present; otherwise append.
    while IFS='=' read -r var val; do
      key=$(echo "''${var#KAFKA_CFG_}" | tr '[:upper:]_' '[:lower:].')
      esc=$(printf '%s' "$val" | sed 's|[\/&]|\\&|g')
      if grep -qE "^''${key}=" "$PROPS"; then
        sed -i "s|^''${key}=.*|''${key}=''${esc}|" "$PROPS"
      else
        echo "''${key}=''${val}" >> "$PROPS"
      fi
    done < <(env | grep '^KAFKA_CFG_' || true)

    exec "$KAFKA_HOME/bin/kafka-server-start.sh" "$PROPS"
  '';
in
mkImage {
  drv = pkgs.buildEnv {
    name = "kafka-nixchart-env";
    paths = [ kafkaBin pkgs.jre pkgs.bash pkgs.coreutils pkgs.gnugrep pkgs.gnused pkgs.cacert pkgs.tzdata ];
  };

  name = "kafka-nixchart";
  tag = "v${version}";
  entrypoint = [ "${entrypoint}" ];
  cmd = [];
  user = "1001:0";

  labels = {
    "org.opencontainers.image.title" = "kafka-nixchart";
    "org.opencontainers.image.description" = "Apache Kafka image tuned for the nix-containers charts/kafka chart";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kafka";
  };
}
