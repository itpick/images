{ mkImage, pkgs, lib, ... }:

# Apache Kafka - Distributed event streaming platform
# https://kafka.apache.org/

let
  # Minimal single-node KRaft config (Kafka 4.x is ZooKeeper-free). Combined
  # broker+controller, replication factor 1, data under the writable /tmp. The
  # PLAINTEXT listener binds 0.0.0.0:9092 so the kind-test probe and clients can
  # reach it; the CONTROLLER listener stays on localhost:9093. Operators mount
  # their own config + a PVC at /tmp/kafka-logs for a real cluster.
  serverProperties = pkgs.writeTextDir "etc/kafka/server.properties" ''
    process.roles=broker,controller
    node.id=1
    controller.quorum.voters=1@localhost:9093
    listeners=PLAINTEXT://0.0.0.0:9092,CONTROLLER://localhost:9093
    advertised.listeners=PLAINTEXT://localhost:9092
    inter.broker.listener.name=PLAINTEXT
    controller.listener.names=CONTROLLER
    listener.security.protocol.map=CONTROLLER:PLAINTEXT,PLAINTEXT:PLAINTEXT
    log.dirs=/tmp/kafka-logs
    offsets.topic.replication.factor=1
    transaction.state.log.replication.factor=1
    transaction.state.log.min.isr=1
  '';

  # KRaft requires the metadata log dir to be formatted with a cluster id before
  # the first start. The old cmd was `--help` (a one-shot -> CrashLoop). Format
  # on first boot (idempotent — skipped once meta.properties exists), then run
  # the broker in the foreground. writeShellApplication runs shellcheck at build.
  entrypoint = pkgs.writeShellApplication {
    name = "docker-entrypoint.sh";
    runtimeInputs = [ pkgs.openjdk21_headless pkgs.coreutils pkgs.bash ];
    text = ''
      CONFIG=/etc/kafka/server.properties
      LOGDIR=/tmp/kafka-logs
      if [ ! -f "$LOGDIR/meta.properties" ]; then
        CID="$("${pkgs.apacheKafka}/bin/kafka-storage.sh" random-uuid)"
        "${pkgs.apacheKafka}/bin/kafka-storage.sh" format -t "$CID" -c "$CONFIG"
      fi
      exec "${pkgs.apacheKafka}/bin/kafka-server-start.sh" "$CONFIG"
    '';
  };
in
mkImage {
  drv = pkgs.apacheKafka;
  name = "kafka";
  tag = "v${pkgs.apacheKafka.version}";
  entrypoint = [ "${entrypoint}/bin/docker-entrypoint.sh" ];
  cmd = [ ];

  extraPkgs = with pkgs; [ openjdk21_headless bash coreutils cacert serverProperties ];

  env = {
    JAVA_HOME = "${pkgs.openjdk21_headless}";
    # log4j / GC log output (separate from the data log.dirs) on the writable /tmp.
    KAFKA_LOG_DIR = "/tmp";
    HOME = "/tmp";
  };

  labels = {
    "org.opencontainers.image.title" = "Apache Kafka";
    "org.opencontainers.image.description" = "Distributed event streaming platform";
    "org.opencontainers.image.version" = pkgs.apacheKafka.version;
  };
}
