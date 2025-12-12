{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# mongodb-iamguarded
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
  name = "mongodb-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "mongodb-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "mongodb-iamguarded";
      "org.opencontainers.image.description" = "mongodb-iamguarded container image";
    };
  };
}
