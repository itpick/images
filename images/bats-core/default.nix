{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# bats-core
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
  name = "bats-core";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "bats-core-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "uats core";
      "org.opencontainers.image.description" = "bats-core container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
