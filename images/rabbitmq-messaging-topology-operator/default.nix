{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# rabbitmq-messaging-topology-operator
# Container image

let
  version = "latest";
  
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "rabbitmq-messaging-topology-operator";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "rabbitmq-messaging-topology-operator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "raubitmq messaging topology operator";
      "org.opencontainers.image.description" = "rabbitmq-messaging-topology-operator container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
