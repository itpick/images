{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# rabbitmq-cluster-operator-iamguarded
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
  name = "rabbitmq-cluster-operator-iamguarded";
  tag = pkgs.rabbitmq-server.version;
  copyToRoot = [
    (buildEnv {
      name = "rabbitmq-cluster-operator-iamguarded-root";
      paths = base.basePackages ++ rabbitmqPkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "rabbitmq-cluster-operator-iamguarded";
      "org.opencontainers.image.description" = "RabbitMQ rabbitmq-cluster-operator-iamguarded";
      "org.opencontainers.image.version" = pkgs.rabbitmq-server.version;
      "io.nix-containers.chart" = "rabbitmq";
    };
  };
}
