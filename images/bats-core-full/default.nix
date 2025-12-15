{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# bats-core-full
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
  name = "bats-core-full";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "bats-core-full-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "uats core full";
      "org.opencontainers.image.description" = "bats-core-full container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
