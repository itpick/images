{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# rabbitmq-default-user-credential-updater-iamguarded
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
  name = "rabbitmq-default-user-credential-updater-iamguarded";
  tag = pkgs.rabbitmq-server.version;
  copyToRoot = [
    (buildEnv {
      name = "rabbitmq-default-user-credential-updater-iamguarded-root";
      paths = base.basePackages ++ rabbitmqPkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "rabbitmq-default-user-credential-updater-iamguarded";
      "org.opencontainers.image.description" = "RabbitMQ rabbitmq-default-user-credential-updater-iamguarded";
      "org.opencontainers.image.version" = pkgs.rabbitmq-server.version;
      "io.nix-containers.chart" = "rabbitmq";
    };
  };
}
