{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# strimzi-kafka-operator-kafka-base
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
  name = "strimzi-kafka-operator-kafka-base";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "strimzi-kafka-operator-kafka-base-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "strimzi kafka operator kafka uase";
      "org.opencontainers.image.description" = "strimzi-kafka-operator-kafka-base container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
