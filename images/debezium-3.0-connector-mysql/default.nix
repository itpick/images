{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# debezium-3.0-connector-mysql
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
  name = "debezium-3.0-connector-mysql";
  tag = "3.0.0";
  copyToRoot = [
    (buildEnv {
      name = "debezium-3.0-connector-mysql-root";
      paths = base.basePackages ++ debeziumPkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "JAVA_HOME=${pkgs.jdk21}"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "debezium 3.0 connector mysql";
      "org.opencontainers.image.description" = "Debezium CDC debezium-3.0-connector-mysql";
      "org.opencontainers.image.version" = "3.0.0";
      "io.nix-containers.chart" = "debezium";
    };
  };
}
