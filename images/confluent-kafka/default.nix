{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# confluent-kafka
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "confluent-kafka";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "confluent-kafka-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "confluent-kafka";
      "org.opencontainers.image.description" = "confluent-kafka container image";
    };
  };
}
