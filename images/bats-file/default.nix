{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# bats-file
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
  name = "bats-file";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "bats-file-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "uats file";
      "org.opencontainers.image.description" = "bats-file container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
