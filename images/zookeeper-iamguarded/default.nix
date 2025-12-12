{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# zookeeper-iamguarded
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
  name = "zookeeper-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "zookeeper-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "zookeeper-iamguarded";
      "org.opencontainers.image.description" = "zookeeper-iamguarded container image";
    };
  };
}
