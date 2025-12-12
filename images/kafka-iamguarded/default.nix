{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# kafka-iamguarded
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
  name = "kafka-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "kafka-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "kafka-iamguarded";
      "org.opencontainers.image.description" = "kafka-iamguarded container image";
    };
  };
}
