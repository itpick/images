{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# debezium-connector-informix
# Debezium CDC component

let
  debeziumPkgs = with pkgs; [
    jdk21
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "debezium-connector-informix";
  tag = "3.0.0";
  copyToRoot = [
    (buildEnv {
      name = "debezium-connector-informix-root";
      paths = base.basePackages ++ debeziumPkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "JAVA_HOME=${pkgs.jdk21}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "debezium connector informix";
      "org.opencontainers.image.description" = "Debezium CDC debezium-connector-informix";
      "org.opencontainers.image.version" = "3.0.0";
      "io.nix-containers.chart" = "debezium";
    };
  };
}
