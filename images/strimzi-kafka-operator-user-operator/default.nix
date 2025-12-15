{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# strimzi-kafka-operator-user-operator
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
  name = "strimzi-kafka-operator-user-operator";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "strimzi-kafka-operator-user-operator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "strimzi kafka operator user operator";
      "org.opencontainers.image.description" = "strimzi-kafka-operator-user-operator container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
