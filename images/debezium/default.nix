{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# Debezium - Distributed platform for change data capture
# Built on top of Kafka Connect for streaming database changes

let
  # Debezium requires Java and Kafka Connect
  imagePkgs = with pkgs; [
    openjdk21_headless
    apacheKafka
    bash
    coreutils
    cacert
    tzdata
    curl
    jq
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "debezium";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "debezium-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath imagePkgs}"
      "JAVA_HOME=${pkgs.openjdk21_headless}"
      "KAFKA_HOME=${pkgs.apacheKafka}"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "Debezium";
      "org.opencontainers.image.description" = "Distributed platform for change data capture";
      "org.opencontainers.image.version" = pkgs.apacheKafka.version;
    };
  };
}
