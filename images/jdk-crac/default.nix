{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# jdk-crac
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
  name = "jdk-crac";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "jdk-crac-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "jdk-crac";
      "org.opencontainers.image.description" = "jdk-crac container image";
    };
  };
}
