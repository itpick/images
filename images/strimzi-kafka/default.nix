{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# strimzi-kafka
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
  name = "strimzi-kafka";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "strimzi-kafka-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "strimzi-kafka";
      "org.opencontainers.image.description" = "strimzi-kafka container image";
    };
  };
}
