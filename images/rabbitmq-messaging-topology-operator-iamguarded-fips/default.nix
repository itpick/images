{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# rabbitmq-messaging-topology-operator-iamguarded-fips
# RabbitMQ component

let
  rabbitmqPkgs = with pkgs; [
    rabbitmq-server
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "rabbitmq-messaging-topology-operator-iamguarded-fips";
  tag = pkgs.rabbitmq-server.version;
  copyToRoot = [
    (buildEnv {
      name = "rabbitmq-messaging-topology-operator-iamguarded-fips-root";
      paths = base.basePackages ++ rabbitmqPkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "rabbitmq-messaging-topology-operator-iamguarded-fips";
      "org.opencontainers.image.description" = "RabbitMQ rabbitmq-messaging-topology-operator-iamguarded";
      "org.opencontainers.image.version" = pkgs.rabbitmq-server.version;
      "io.nix-containers.chart" = "rabbitmq";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
