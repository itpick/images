{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# rabbitmq-fips
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
  name = "rabbitmq-fips";
  tag = pkgs.rabbitmq-server.version;
  copyToRoot = [
    (buildEnv {
      name = "rabbitmq-fips-root";
      paths = base.basePackages ++ rabbitmqPkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "rabbitmq-fips";
      "org.opencontainers.image.description" = "RabbitMQ rabbitmq";
      "org.opencontainers.image.version" = pkgs.rabbitmq-server.version;
      "io.nix-containers.chart" = "rabbitmq";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
