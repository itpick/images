{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# rabbitmq-default-user-credential-updater
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
  name = "rabbitmq-default-user-credential-updater";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "rabbitmq-default-user-credential-updater-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "raubitmq default user credential updater";
      "org.opencontainers.image.description" = "rabbitmq-default-user-credential-updater container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
